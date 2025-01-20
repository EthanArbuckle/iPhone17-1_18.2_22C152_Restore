void CEMCreateEmojiCharacterSet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFLocale *a5)
{
  CEM::copyResourceURLFromFrameworkBundle((CEM *)@"emoji", @"bitmap", 0, 0, a5);
  operator new[]();
}

void sub_18E64C28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,__int16 buf,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }
  _Block_object_dispose(&buf, 8);
  if (a34 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      buf = 0;
      _os_log_error_impl(&dword_18E64B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to load emoji.bitmap", (uint8_t *)&buf, 2u);
    }
    __cxa_end_catch();
    JUMPOUT(0x18E64C18CLL);
  }
  MEMORY[0x192FAF290](v34, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void ___ZL15sharedEmojiDatav_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFLocale *a5)
{
  CFURLRef v5 = CEM::copyResourceURLFromFrameworkBundle((CEM *)@"emoji", @"dat", 0, 0, a5);
  CFURLRef v7 = CEM::copyResourceURLFromFrameworkBundle((CEM *)@"emojimeta", @"dat", 0, 0, v6);
  if (v5) {
    operator new();
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_18E64C4BC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  uint64_t v11 = v9;
  MEMORY[0x192FAF2C0](v11, 0x1070C408606C210);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      a9 = 0;
      _os_log_error_impl(&dword_18E64B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to load emoji data", (uint8_t *)&a9, 2u);
    }
    __cxa_end_catch();
    JUMPOUT(0x18E64C494);
  }
  _Unwind_Resume(a1);
}

CFURLRef CEM::copyResourceURLFromFrameworkBundle(CEM *this, const __CFString *a2, const __CFString *a3, __CFString *a4, const __CFLocale *a5)
{
  FrameworkBundle = (CEM *)CEM::createFrameworkBundle(this);
  if (!FrameworkBundle) {
    return 0;
  }
  uint64_t v11 = FrameworkBundle;
  if (a4)
  {
    CFStringRef v12 = CEM::copyPreferredLocaleIdentifierFromFrameworkBundleWithLocale(FrameworkBundle, (__CFBundle *)a4, v10);
    if (v12)
    {
      CFURLRef v13 = CFBundleCopyResourceURLForLocalization(v11, (CFStringRef)this, a2, a3, v12);
      CFRelease(v12);
    }
    else
    {
      CFURLRef v13 = 0;
    }
  }
  else
  {
    CFURLRef v13 = CFBundleCopyResourceURL(FrameworkBundle, (CFStringRef)this, a2, a3);
  }
  CFRelease(v11);
  return v13;
}

void sub_18E64C618(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFBundle *>::reset((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t CEM::createFrameworkBundle(CEM *this)
{
  if (CEM::createFrameworkBundle(void)::onceToken != -1) {
    dispatch_once(&CEM::createFrameworkBundle(void)::onceToken, &__block_literal_global_36);
  }
  CFRetain((CFTypeRef)CEM::createFrameworkBundle(void)::frameworkBundle);
  return CEM::createFrameworkBundle(void)::frameworkBundle;
}

void ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIhEEE11getResourceERKS7_U13block_pointerFPS9_vE_block_invoke(void *a1)
{
  if (CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getCache(void)::onceToken != -1) {
    dispatch_once(&CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getCache(void)::onceToken, &__block_literal_global_100);
  }
  v2 = (void *)CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getCache(void)::cache;
  v3 = (unsigned __int8 *)a1[6];
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v3);
  int8x8_t v5 = (int8x8_t)v2[1];
  if (v5)
  {
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
    CFLocaleRef v10 = *(unsigned __int8 ***)(*v2 + 8 * v9);
    if (v10)
    {
      for (i = *v10; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v12 = *((void *)i + 1);
        if (v12 == v6)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, v3))
          {
            CFURLRef v13 = (std::__shared_weak_count *)*((void *)i + 6);
            if (v13 && (CFURLRef v13 = std::__shared_weak_count::lock(v13)) != 0) {
              uint64_t v14 = *((void *)i + 5);
            }
            else {
              uint64_t v14 = 0;
            }
            uint64_t v15 = *(void *)(a1[5] + 8);
            v16 = *(std::__shared_weak_count **)(v15 + 48);
            *(void *)(v15 + 40) = v14;
            *(void *)(v15 + 48) = v13;
            if (v16) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v16);
            }
            break;
          }
        }
        else
        {
          if (v8 > 1)
          {
            if (v12 >= *(void *)&v5) {
              v12 %= *(void *)&v5;
            }
          }
          else
          {
            v12 &= *(void *)&v5 - 1;
          }
          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    (*(void (**)(void))(a1[4] + 16))();
    operator new();
  }
}

void sub_18E64CCD0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t *)va);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v1 < 0;
  if (v1 >= 0) {
    unint64_t v4 = (uint64_t *)a1;
  }
  else {
    unint64_t v4 = *(uint64_t **)a1;
  }
  if (!v3) {
    unint64_t v2 = *(unsigned __int8 *)(a1 + 23);
  }
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      unint64_t v34 = 0x9DDFEA08EB382D69;
      uint64_t v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      uint64_t v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      uint64_t v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      uint64_t v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      uint64_t v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      uint64_t v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      unint64_t v50 = v46 + v48;
      unint64_t v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      unint64_t v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      unint64_t v53 = v47 + v2 + v46 + v44;
      uint64_t v54 = v53 + v43;
      unint64_t v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v43 + v47 + v2 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      uint64_t v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v57 = v56 + v45 + v48;
      uint64_t v58 = __ROR8__(v57, 44);
      uint64_t v59 = v57 + v49;
      uint64_t v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      uint64_t v62 = *v4;
      v61 = v4 + 4;
      unint64_t v63 = v62 - 0x4B6D499041670D8DLL * v43;
      uint64_t v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v65 = *(v61 - 3);
        uint64_t v66 = v63 + v54 + v50 + v65;
        uint64_t v67 = v61[2];
        uint64_t v68 = v61[3];
        uint64_t v69 = v61[1];
        unint64_t v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        uint64_t v70 = v52 + v59;
        uint64_t v71 = *(v61 - 2);
        uint64_t v72 = *(v61 - 1);
        uint64_t v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        uint64_t v74 = v73 + v59 + v72;
        uint64_t v75 = v73 + v65 + v71;
        uint64_t v54 = v75 + v72;
        uint64_t v76 = __ROR8__(v75, 44) + v73;
        unint64_t v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        unint64_t v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        unint64_t v55 = v76 + __ROR8__(v74 + v77, 21);
        unint64_t v78 = v63 + v60 + *v61;
        uint64_t v59 = v78 + v69 + v67 + v68;
        uint64_t v60 = __ROR8__(v78 + v69 + v67, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        unint64_t v52 = v77;
        v64 += 64;
      }
      while (v64);
      unint64_t v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      unint64_t v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      unint64_t v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      unint64_t v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      unint64_t v9 = (char *)v4 + v2;
      uint64_t v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v12 = v4[1];
      uint64_t v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      v16 = v4 + 2;
      uint64_t v14 = v4[2];
      uint64_t v15 = v16[1];
      uint64_t v17 = __ROR8__(v13 + v15, 52);
      uint64_t v18 = __ROR8__(v13, 37);
      uint64_t v19 = v13 + v12;
      uint64_t v20 = __ROR8__(v19, 7);
      uint64_t v21 = v19 + v14;
      uint64_t v22 = v20 + v18;
      uint64_t v23 = *((void *)v9 - 4) + v14;
      uint64_t v24 = v11 + v15;
      uint64_t v25 = __ROR8__(v24 + v23, 52);
      uint64_t v26 = v22 + v17;
      uint64_t v27 = __ROR8__(v23, 37);
      uint64_t v28 = *((void *)v9 - 3) + v23;
      uint64_t v29 = __ROR8__(v28, 7);
      uint64_t v30 = v26 + __ROR8__(v21, 31);
      uint64_t v31 = v28 + v10;
      uint64_t v32 = v31 + v24;
      uint64_t v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      unint64_t v34 = 0x9AE16A3B2F90404FLL;
      unint64_t v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      uint64_t v36 = v4[1];
      unint64_t v37 = 0xB492B66FBE98F273 * *v4;
      unint64_t v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      unint64_t v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)));
      unint64_t v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      int v82 = *(_DWORD *)v4;
      uint64_t v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      unint64_t v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      unint64_t v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    unint64_t result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      unint64_t v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

void ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIcEEE11getResourceERKS7_U13block_pointerFPS9_vE_block_invoke(void *a1)
{
  if (CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getCache(void)::onceToken != -1) {
    dispatch_once(&CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getCache(void)::onceToken, &__block_literal_global_60);
  }
  unint64_t v2 = (void *)CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getCache(void)::cache;
  BOOL v3 = (unsigned __int8 *)a1[6];
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v3);
  int8x8_t v5 = (int8x8_t)v2[1];
  if (v5)
  {
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
    uint64_t v10 = *(unsigned __int8 ***)(*v2 + 8 * v9);
    if (v10)
    {
      for (i = *v10; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v12 = *((void *)i + 1);
        if (v12 == v6)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, v3))
          {
            uint64_t v13 = (std::__shared_weak_count *)*((void *)i + 6);
            if (v13 && (uint64_t v13 = std::__shared_weak_count::lock(v13)) != 0) {
              uint64_t v14 = *((void *)i + 5);
            }
            else {
              uint64_t v14 = 0;
            }
            uint64_t v15 = *(void *)(a1[5] + 8);
            v16 = *(std::__shared_weak_count **)(v15 + 48);
            *(void *)(v15 + 40) = v14;
            *(void *)(v15 + 48) = v13;
            if (v16) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v16);
            }
            break;
          }
        }
        else
        {
          if (v8 > 1)
          {
            if (v12 >= *(void *)&v5) {
              v12 %= *(void *)&v5;
            }
          }
          else
          {
            v12 &= *(void *)&v5 - 1;
          }
          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    (*(void (**)(void))(a1[4] + 16))();
    operator new();
  }
}

void sub_18E64D7A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t *)va);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  _Unwind_Resume(a1);
}

void ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileItEEE11getResourceERKS7_U13block_pointerFPS9_vE_block_invoke(void *a1)
{
  if (CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned short>>::getCache(void)::onceToken != -1) {
    dispatch_once(&CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned short>>::getCache(void)::onceToken, &__block_literal_global_16);
  }
  unint64_t v2 = (void *)CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned short>>::getCache(void)::cache;
  BOOL v3 = (unsigned __int8 *)a1[6];
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v3);
  int8x8_t v5 = (int8x8_t)v2[1];
  if (v5)
  {
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
    uint64_t v10 = *(unsigned __int8 ***)(*v2 + 8 * v9);
    if (v10)
    {
      for (i = *v10; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v12 = *((void *)i + 1);
        if (v12 == v6)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, v3))
          {
            uint64_t v13 = (std::__shared_weak_count *)*((void *)i + 6);
            if (v13 && (uint64_t v13 = std::__shared_weak_count::lock(v13)) != 0) {
              uint64_t v14 = *((void *)i + 5);
            }
            else {
              uint64_t v14 = 0;
            }
            uint64_t v15 = *(void *)(a1[5] + 8);
            v16 = *(std::__shared_weak_count **)(v15 + 48);
            *(void *)(v15 + 40) = v14;
            *(void *)(v15 + 48) = v13;
            if (v16) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v16);
            }
            break;
          }
        }
        else
        {
          if (v8 > 1)
          {
            if (v12 >= *(void *)&v5) {
              v12 %= *(void *)&v5;
            }
          }
          else
          {
            v12 &= *(void *)&v5 - 1;
          }
          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    (*(void (**)(void))(a1[4] + 16))();
    operator new();
  }
}

void sub_18E64DE28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t *)va);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  int8x8_t v5 = this;
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
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    int8x8_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    if (*((unsigned char *)a1 + 16))
    {
      unint64_t v2 = *(std::__shared_weak_count **)(v1 + 48);
      if (v2) {
        std::__shared_weak_count::__release_weak(v2);
      }
      if (*(char *)(v1 + 39) < 0) {
        operator delete(*(void **)(v1 + 16));
      }
    }
    operator delete((void *)v1);
  }
}

void ___ZN3CEM12ReadOnlyFileItE4openERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEPKcb_block_invoke()
{
}

void sub_18E64E2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  __cxa_free_exception(v19);
  if (*(char *)(v16 + 63) < 0) {
    operator delete(*v18);
  }
  if (*(char *)(v16 + 39) < 0) {
    operator delete(*v17);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  MEMORY[0x192FAF2C0](v16, 0x1012C403EBA5055);
  if (a2 == 1)
  {
    uint64_t v22 = __cxa_begin_catch(a1);
    uint64_t v23 = (const std::string::value_type *)(*(uint64_t (**)(void *))(*(void *)v22 + 16))(v22);
    std::string::__assign_external((std::string *)(*(void *)(*(void *)(v15 + 32) + 8) + 40), v23);
    __cxa_end_catch();
    JUMPOUT(0x18E64E1B0);
  }
  _Unwind_Resume(a1);
}

void ___ZN3CEM12ReadOnlyFileIcE4openERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEPKcb_block_invoke()
{
}

void sub_18E64E6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  __cxa_free_exception(v19);
  if (*(char *)(v16 + 63) < 0) {
    operator delete(*v18);
  }
  if (*(char *)(v16 + 39) < 0) {
    operator delete(*v17);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  MEMORY[0x192FAF2C0](v16, 0x1012C403EBA5055);
  if (a2 == 1)
  {
    uint64_t v22 = __cxa_begin_catch(a1);
    uint64_t v23 = (const std::string::value_type *)(*(uint64_t (**)(void *))(*(void *)v22 + 16))(v22);
    std::string::__assign_external((std::string *)(*(void *)(*(void *)(v15 + 32) + 8) + 40), v23);
    __cxa_end_catch();
    JUMPOUT(0x18E64E5E4);
  }
  _Unwind_Resume(a1);
}

void CEM::EmojiData::EmojiData(CEM::EmojiData *this, const __CFURL *a2, const __CFURL *a3)
{
  CEM::getFileSystemRepresentationFromCFURL((CEM *)&v3, a2);
}

void sub_18E64EB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (v37) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v37);
  }
  _Block_object_dispose(&a24, 8);
  if (a37 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(a1);
}

void CEM::getFileSystemRepresentationFromCFURL(CEM *this, const __CFURL *a2)
{
}

void sub_18E64EC4C(_Unwind_Exception *a1)
{
  MEMORY[0x192FAF290](v1, 0x1000C8077774924);
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
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

_WORD *CEM::EmojiData::advance(uint64_t a1, _WORD *a2, uint64_t a3, CFStringRef theString)
{
  uint64_t Length = CFStringGetLength(theString);
  CFStringRef theStringa = theString;
  range.location = 0;
  range.length = Length;
  CharactersPtr = CFStringGetCharactersPtr(theString);
  CStringPtr = 0;
  uint64_t v43 = (UniChar *)CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  }
  uint64_t v46 = 0;
  CFIndex v47 = 0;
  uint64_t v44 = CStringPtr;
  if (Length < 1)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    CFIndex v13 = 0;
    uint64_t v14 = 64;
    do
    {
      if ((unint64_t)v13 >= 4) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = v13;
      }
      CFIndex v16 = range.length;
      if (range.length <= v13)
      {
        UniChar v17 = 0;
      }
      else if (v43)
      {
        UniChar v17 = v43[v13 + range.location];
      }
      else if (v44)
      {
        UniChar v17 = v44[range.location + v13];
      }
      else
      {
        if (v47 <= v13 || v12 > v13)
        {
          uint64_t v21 = v15 + v11;
          CFIndex v22 = v14 - v15;
          CFIndex v23 = v13 - v15;
          CFIndex v24 = v23 + 64;
          if (v23 + 64 >= range.length) {
            CFIndex v24 = range.length;
          }
          uint64_t v46 = v23;
          CFIndex v47 = v24;
          if (range.length >= v22) {
            CFIndex v16 = v22;
          }
          v48.length = v16 + v21;
          v48.location = v23 + range.location;
          CFStringGetCharacters(theStringa, v48, v41);
          uint64_t v12 = v46;
        }
        UniChar v17 = v41[v13 - v12];
      }
      a2 = (_WORD *)CEM::EmojiData::advance(a1, a2, a3, v17);
      a3 = v18;
      if ((v18 & 0x100000000) == 0) {
        break;
      }
      --v11;
      ++v14;
    }
    while (Length - 1 != v13++);
  }
  if (!Length)
  {
    UTF32Char v27 = 0;
    goto LABEL_58;
  }
  uint64_t v25 = Length - 1;
  if (Length != 1)
  {
    CFIndex v28 = Length - 2;
    if (Length < 2 || (CFIndex v29 = range.length, range.length <= v28))
    {
      UniChar v32 = 0;
      goto LABEL_41;
    }
    uint64_t v30 = v43;
    if (v43)
    {
      CFIndex v31 = range.location + v28;
    }
    else
    {
      if (v44)
      {
        UniChar v32 = v44[range.location + v28];
LABEL_47:
        if (v32 >> 10 == 54)
        {
          CFIndex v33 = range.length;
          if (range.length >= Length)
          {
            unint64_t v37 = v43;
            if (v43)
            {
              CFIndex v38 = range.location + v25;
            }
            else
            {
              if (v44)
              {
                UniChar v34 = v44[range.location + v25];
                goto LABEL_75;
              }
              if (v47 < Length || v12 >= Length)
              {
                uint64_t v40 = Length - 5;
                if ((unint64_t)Length < 5) {
                  uint64_t v40 = 0;
                }
                if (v40 + 64 < range.length) {
                  CFIndex v33 = v40 + 64;
                }
                uint64_t v46 = v40;
                CFIndex v47 = v33;
                v50.location = range.location + v40;
                v50.length = v33 - v40;
                CFStringGetCharacters(theStringa, v50, v41);
                uint64_t v12 = v46;
              }
              CFIndex v38 = v25 - v12;
              unint64_t v37 = v41;
            }
            UniChar v34 = v37[v38];
          }
          else
          {
            UniChar v34 = 0;
          }
LABEL_75:
          UTF32Char v27 = (v32 << 10) + v34 - 56613888;
          goto LABEL_58;
        }
LABEL_41:
        UTF32Char v27 = v32;
        goto LABEL_58;
      }
      if (v47 <= v28 || v12 > v28)
      {
        uint64_t v39 = Length - 6;
        if ((unint64_t)v28 < 4) {
          uint64_t v39 = 0;
        }
        if (v39 + 64 < range.length) {
          CFIndex v29 = v39 + 64;
        }
        uint64_t v46 = v39;
        CFIndex v47 = v29;
        v49.location = range.location + v39;
        v49.length = v29 - v39;
        CFStringGetCharacters(theStringa, v49, v41);
        uint64_t v12 = v46;
      }
      CFIndex v31 = v28 - v12;
      uint64_t v30 = v41;
    }
    UniChar v32 = v30[v31];
    goto LABEL_47;
  }
  if (range.length < 1)
  {
    UniChar v26 = 0;
  }
  else if (v43)
  {
    UniChar v26 = v43[range.location];
  }
  else if (v44)
  {
    UniChar v26 = v44[range.location];
  }
  else
  {
    if (v47 < 1 || v12 >= 1)
    {
      if (range.length >= 0x40uLL) {
        v35.length = 64;
      }
      else {
        v35.length = range.length;
      }
      uint64_t v46 = 0;
      CFIndex v47 = v35.length;
      v35.location = range.location;
      CFStringGetCharacters(theStringa, v35, v41);
      uint64_t v12 = v46;
    }
    UniChar v26 = v41[-v12];
  }
  UTF32Char v27 = v26;
LABEL_58:
  if ((a3 & 0x10000FFFFLL) == 0x100000000 && CEM::EmojiData::isLegacyUnqualifiedEmojiCodepoint(v27)) {
    return (_WORD *)CEM::EmojiData::advance(a1, a2, a3, 0xFE0Fu);
  }
  return a2;
}

CFStringRef CEMStringContainsEmoji(CFStringRef theString)
{
  CFStringRef v1 = theString;
  if (theString)
  {
    uint64_t v4 = 0;
    size_t v5 = &v4;
    uint64_t v6 = 0x2000000000;
    char v7 = 0;
    CFIndex Length = CFStringGetLength(theString);
    CEMEnumerateEmojiTokensInStringWithBlock(v1, 0, Length);
    CFStringRef v1 = (const __CFString *)*((unsigned __int8 *)v5 + 24);
    _Block_object_dispose(&v4, 8);
  }
  return v1;
}

void sub_18E64F1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CEM::EmojiToken::enumerateEmojiTokensInStringWithBlock(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, CEM::EmojiData *a5)
{
  CFStringRef theString = a1;
  uint64_t v47 = a2;
  uint64_t v48 = a3;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (CharactersPtr) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = (uint64_t)CFStringGetCStringPtr(a1, 0x600u);
  }
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v46 = result;
  if (a3 < 1) {
    return result;
  }
  uint64_t v8 = 0;
  do
  {
    UniChar v9 = 0;
    uint64_t v10 = (_WORD *)*((void *)a5 + 4);
    uint64_t v11 = a3;
    if (a3 <= v8) {
      uint64_t v11 = v8;
    }
    uint64_t v42 = v11;
    uint64_t v12 = -v8;
    uint64_t v13 = v8 + 64;
    uint64_t v14 = 0x100000000;
    uint64_t v40 = v8;
    __int16 v15 = 0;
    do
    {
      uint64_t v16 = (unint64_t)v8 >= 4 ? 4 : v8;
      if (v42 == v8) {
        break;
      }
      UniChar v17 = v9;
      if (v8 < 0 || (uint64_t v18 = v48, v48 <= v8))
      {
        UniChar v9 = 0;
      }
      else if (CharactersPtr)
      {
        UniChar v9 = CharactersPtr[v8 + v47];
      }
      else if (v46)
      {
        UniChar v9 = *(char *)(v46 + v47 + v8);
      }
      else
      {
        if (v50 <= v8 || (uint64_t v33 = v49, v49 > v8))
        {
          uint64_t v34 = v16 + v12;
          uint64_t v35 = v13 - v16;
          uint64_t v36 = v8 - v16;
          uint64_t v37 = v36 + 64;
          if (v36 + 64 >= v48) {
            uint64_t v37 = v48;
          }
          uint64_t v49 = v36;
          uint64_t v50 = v37;
          if (v48 >= v35) {
            uint64_t v18 = v35;
          }
          v51.length = v18 + v34;
          v51.location = v36 + v47;
          CFStringGetCharacters(theString, v51, buffer);
          uint64_t v33 = v49;
        }
        UniChar v9 = buffer[v8 - v33];
      }
      uint64_t result = CEM::EmojiData::advance((uint64_t)a5, v10, v14, v9);
      if ((v19 & 0x100000000) == 0) {
        break;
      }
      uint64_t v10 = (_WORD *)result;
      uint64_t v14 = v19;
      if ((CEM::EmojiData::isValidIndex(a5, (unsigned __int16)v19) & 1) != 0
        || (v9 >> 10 == 55 ? (UTF32Char v20 = (v17 << 10) + v9 - 56613888) : (UTF32Char v20 = v9),
            !CEM::EmojiData::isLegacyUnqualifiedEmojiCodepoint(v20)))
      {
LABEL_38:
        uint64_t v27 = 1;
        goto LABEL_39;
      }
      int64_t v21 = v8 + 1;
      if (v8 + 1 >= a3) {
        goto LABEL_35;
      }
      if (v8 < -1 || (uint64_t v22 = v48, v48 <= v21))
      {
        UniChar v24 = 0;
      }
      else
      {
        if (CharactersPtr)
        {
          CFIndex v23 = (UniChar *)&CharactersPtr[v8 + v47];
LABEL_29:
          UniChar v24 = v23[1];
          goto LABEL_33;
        }
        if (!v46)
        {
          if (v50 <= v21 || (uint64_t v38 = v49, v49 > v21))
          {
            if ((unint64_t)v21 >= 4) {
              uint64_t v39 = v8 - 3;
            }
            else {
              uint64_t v39 = 0;
            }
            if (v39 + 64 < v48) {
              uint64_t v22 = v39 + 64;
            }
            uint64_t v49 = v39;
            uint64_t v50 = v22;
            v52.location = v47 + v39;
            v52.length = v22 - v39;
            CFStringGetCharacters(theString, v52, buffer);
            uint64_t v38 = v49;
          }
          CFIndex v23 = &buffer[v8 - v38];
          goto LABEL_29;
        }
        UniChar v24 = *(char *)(v46 + v47 + v8 + 1);
      }
LABEL_33:
      int v25 = v24;
      CEM::EmojiData::advance((uint64_t)a5, v10, v14, v24);
      if (v25 == 65039) {
        goto LABEL_38;
      }
      uint64_t v27 = 1;
      if ((v26 & 0x100000000) == 0)
      {
LABEL_35:
        uint64_t v28 = CEM::EmojiData::advance((uint64_t)a5, v10, v14, 0xFE0Fu);
        unint64_t v30 = HIDWORD(v29);
        BOOL v31 = (unsigned __int16)v29 != 0;
        unint64_t v32 = v29 & 0xFFFFFFFF0000FFFFLL | ((unint64_t)((v29 - 0x10000) >> 16) << 16);
        if ((v30 & v31) != 0)
        {
          uint64_t v14 = v32;
          uint64_t v10 = (_WORD *)v28;
        }
        uint64_t v27 = v14 & 0x100000000;
      }
LABEL_39:
      uint64_t result = CEM::EmojiData::isValidIndex(a5, (unsigned __int16)v14);
      if (result) {
        __int16 v15 = WORD1(v14);
      }
      ++v8;
      --v12;
      ++v13;
    }
    while (v27);
    if (v15) {
      operator new();
    }
    uint64_t v8 = v40 + 1;
  }
  while (v40 + 1 < a3);
  return result;
}

void sub_18E64F600(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CEM::EmojiData::advance(uint64_t a1, _WORD *a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = a2;
  if (a4)
  {
    if ((a3 & 0x100000000) != 0)
    {
      size_t v5 = a2 + 2;
      unint64_t v6 = (unsigned __int16)*a2;
      if (*a2)
      {
        char v7 = &v5[2 * v6];
        do
        {
          unint64_t v8 = v6 >> 1;
          UniChar v9 = &v5[2 * (v6 >> 1)];
          unsigned int v11 = *v9;
          uint64_t v10 = v9 + 2;
          v6 += ~(v6 >> 1);
          if (v11 < a4) {
            size_t v5 = v10;
          }
          else {
            unint64_t v6 = v8;
          }
        }
        while (v6);
        if (v5 != v7 && *v5 == a4) {
          return *(void *)(a1 + 32) + 2 * (v5[1] & 0x7FFF);
        }
      }
    }
  }
  return (uint64_t)v4;
}

{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t vars8;

  uint64_t v4 = a4;
  size_t v5 = a1;
  if (HIWORD(a4))
  {
    unint64_t v6 = CEM::EmojiData::advance(a1, a2, a3, (unsigned __int16)((a4 >> 10) - 10304));
    unint64_t v8 = v7;
    a4 = v4 & 0x3FF | 0xDC00;
    a1 = v5;
    a2 = (_WORD *)v6;
    a3 = v8;
  }
  else
  {
    a4 = (unsigned __int16)a4;
  }
  return CEM::EmojiData::advance(a1, a2, a3, a4);
}

void CEMEnumerateEmojiTokensInStringWithBlock(const __CFString *a1, uint64_t a2, uint64_t a3)
{
  if (sharedEmojiData(void)::onceToken == -1)
  {
    if (!a1) {
      return;
    }
  }
  else
  {
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_59);
    if (!a1) {
      return;
    }
  }
  unint64_t v6 = (CEM::EmojiData *)sharedEmojiData(void)::data;
  if (sharedEmojiData(void)::data)
  {
    CEM::EmojiToken::enumerateEmojiTokensInStringWithBlock(a1, a2, a3, 0, v6);
  }
}

uint64_t CEM::EmojiData::isValidIndex(CEM::EmojiData *this, unsigned int a2)
{
  unsigned int v2 = *((unsigned __int16 *)this + 22);
  BOOL v3 = a2 >= v2;
  unsigned int v4 = a2 - v2;
  if (v4 == 0 || !v3 || *((unsigned __int16 *)this + 21) < (unsigned __int16)v4) {
    return 0;
  }
  if (*((unsigned __int16 *)this + 20) != a2 || (uint64_t result = CEM::shouldShowTaiwanFlagEmoji(this), result))
  {
    if ((a2 & 0x8000) != 0) {
      return 1;
    }
    uint64_t result = _os_feature_enabled_impl();
    if (a2 < 0xEF5 || result) {
      return 1;
    }
  }
  return result;
}

BOOL CEM::EmojiData::isLegacyUnqualifiedEmojiCodepoint(UTF32Char theChar)
{
  if (_isLegacyUnqualifiedEmojiCodepoint::onceToken != -1) {
    dispatch_once(&_isLegacyUnqualifiedEmojiCodepoint::onceToken, &__block_literal_global_7);
  }
  return CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)_isLegacyUnqualifiedEmojiCodepoint::__unqualifiedCodepointsCharacterSet, theChar) != 0;
}

void CEM::ReadOnlyFile<char>::open(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x4002000000;
  __int16 v15 = __Block_byref_object_copy__54;
  uint64_t v16 = __Block_byref_object_dispose__55;
  __p = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 0x40000000;
  v10[2] = ___ZN3CEM12ReadOnlyFileIcE4openERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEPKcb_block_invoke;
  v10[3] = &unk_1E55D54D0;
  v10[5] = a2;
  v10[6] = a3;
  char v11 = 1;
  v10[4] = &v12;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3802000000;
  UniChar v24 = __Block_byref_object_copy__43;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  int v25 = __Block_byref_object_dispose__44;
  {
    uint64_t v6 = a2;
    a2 = v6;
    if (v7)
    {
      CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getQueue(void)::attributes = (uint64_t)dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      a2 = v6;
    }
  }
  {
    uint64_t v8 = a2;
    a2 = v8;
    if (v9)
    {
      CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getQueue(void)::queue = (uint64_t)dispatch_queue_create("com.apple.NLPUtils.SingletonResourceManager", (dispatch_queue_attr_t)CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getQueue(void)::attributes);
      a2 = v8;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIcEEE11getResourceERKS7_U13block_pointerFPS9_vE_block_invoke;
  block[3] = &unk_1E55D54F8;
  block[5] = &v21;
  block[6] = a2;
  block[4] = v10;
  dispatch_sync((dispatch_queue_t)CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getQueue(void)::queue, block);
  uint64_t v4 = v22[6];
  *a1 = v22[5];
  a1[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  _Block_object_dispose(&v21, 8);
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  if ((*((char *)v13 + 63) & 0x80000000) == 0)
  {
    if (!*((unsigned char *)v13 + 63)) {
      goto LABEL_9;
    }
LABEL_13:
    exception = __cxa_allocate_exception(0x20uLL);
    CEM::ResourceCreationException::ResourceCreationException(exception, (long long *)(v13 + 5));
  }
  if (v13[6]) {
    goto LABEL_13;
  }
LABEL_9:
  _Block_object_dispose(&v12, 8);
  if (SHIBYTE(v19) < 0) {
    operator delete(__p);
  }
}

void sub_18E64FB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  _Block_object_dispose(&a19, 8);
  if (a29 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZN3CEM12ReadOnlyFileIhE4openERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEPKcb_block_invoke()
{
}

void sub_18E64FEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  __cxa_free_exception(v19);
  if (*(char *)(v16 + 63) < 0) {
    operator delete(*v18);
  }
  if (*(char *)(v16 + 39) < 0) {
    operator delete(*v17);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  MEMORY[0x192FAF2C0](v16, 0x1012C403EBA5055);
  if (a2 == 1)
  {
    uint64_t v22 = __cxa_begin_catch(a1);
    uint64_t v23 = (const std::string::value_type *)(*(uint64_t (**)(void *))(*(void *)v22 + 16))(v22);
    std::string::__assign_external((std::string *)(*(void *)(*(void *)(v15 + 32) + 8) + 40), v23);
    __cxa_end_catch();
    JUMPOUT(0x18E64FDA4);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned char> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned char>,CEM::ReadOnlyFile<unsigned char>>,std::allocator<CEM::ReadOnlyFile<unsigned char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    CEM::ReadOnlyFile<unsigned char>::~ReadOnlyFile(result);
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

uint64_t CEM::ReadOnlyFile<unsigned char>::~ReadOnlyFile(uint64_t a1)
{
  unsigned int v2 = *(void **)a1;
  if (*(void *)a1)
  {
    if (*(unsigned char *)(a1 + 68))
    {
      munmap(*(void **)a1, *(void *)(a1 + 8));
    }
    else
    {
      if (*(_DWORD *)(a1 + 64) != 2) {
        goto LABEL_10;
      }
      BOOL v3 = (const char *)(a1 + 16);
      if (*(char *)(a1 + 39) < 0) {
        BOOL v3 = *(const char **)v3;
      }
      int v4 = open(v3, 2);
      int v5 = v4;
      unsigned int v2 = *(void **)a1;
      if ((v4 & 0x80000000) == 0)
      {
        write(v4, *(const void **)a1, *(void *)(a1 + 8));
        close(v5);
        unsigned int v2 = *(void **)a1;
      }
      if (v2) {
LABEL_10:
      }
        MEMORY[0x192FAF290](v2, 0x1000C8077774924);
    }
  }
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

uint64_t CEMStringIsSingleEmoji(CFStringRef theString)
{
  if (sharedEmojiData(void)::onceToken != -1) {
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_59);
  }
  uint64_t result = 0;
  if (theString)
  {
    if (sharedEmojiData(void)::data)
    {
      CEM::EmojiData::advance(sharedEmojiData(void)::data, *(_WORD **)(sharedEmojiData(void)::data + 32), 0x100000000, theString);
      return v4 & (v3 != 0);
    }
  }
  return result;
}

void __CEMGetSharedEmojiCharacterSet_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFLocale *a5)
{
}

void ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileItEEE8getCacheEv_block_invoke()
{
}

void ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIcEEE8getCacheEv_block_invoke()
{
}

void ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIhEEE8getCacheEv_block_invoke()
{
}

uint64_t CEMGetSharedEmojiCharacterSet()
{
  if (CEMGetSharedEmojiCharacterSet::onceToken != -1) {
    dispatch_once(&CEMGetSharedEmojiCharacterSet::onceToken, &__block_literal_global_46);
  }
  return CEMGetSharedEmojiCharacterSet::characterSet;
}

void ___ZN3CEM21createFrameworkBundleEv_block_invoke()
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 1024);
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], "/", 0x8000100u);
  CFStringAppend(Mutable, v2);
  CFStringAppend(Mutable, @"/System/Library/PrivateFrameworks/CoreEmoji.framework");
  CFRelease(v2);
  CFURLRef v3 = CFURLCreateWithFileSystemPath(v1, Mutable, kCFURLPOSIXPathStyle, 1u);
  CEM::createFrameworkBundle(void)::frameworkBundle = (uint64_t)CFBundleCreate(v1, v3);
  if (!CEM::createFrameworkBundle(void)::frameworkBundle) {
    __assert_rtn("createFrameworkBundle_block_invoke", "CEMUtilityFunctions.cpp", 276, "frameworkBundle && \"CoreEmoji framework bundle could not be found.\"");
  }
  if (v3) {
    CFRelease(v3);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_18E650384(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void *internal::marisa::Trie::Trie(void *this)
{
  *this = 0;
  return this;
}

internal::marisa::grimoire::trie::LoudsTrie **internal::marisa::Trie::build(internal::marisa::grimoire::trie::LoudsTrie **a1, uint64_t *a2, void *a3, unsigned int a4)
{
  uint64_t v8 = (internal::marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x1E4FBA2D0]);
  if (!v8)
  {
    uint64_t v13 = 0;
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x800000014;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:20: MARISA_"
                   "MEMORY_ERROR: temp.get() == NULL";
  }
  int v9 = v8;
  internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(v8);
  uint64_t v13 = v9;
  internal::marisa::grimoire::trie::LoudsTrie::build(v9, a2, a3, a4);
  uint64_t v10 = *a1;
  *a1 = v9;
  uint64_t v13 = v10;
  return internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v13);
}

void sub_18E6504B0(_Unwind_Exception *a1)
{
  MEMORY[0x192FAF2B0](v1, MEMORY[0x1E4FBA2D0]);
  _Unwind_Resume(a1);
}

internal::marisa::grimoire::trie::LoudsTrie **internal::marisa::Trie::map(internal::marisa::grimoire::trie::LoudsTrie **this, const void *a2, uint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x200000029;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:41: MARISA_"
                   "NULL_ERROR: (ptr == NULL) && (size != 0)";
  }
  uint64_t v6 = (internal::marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x1E4FBA2D0]);
  if (!v6)
  {
    uint64_t v13 = 0;
    char v11 = __cxa_allocate_exception(0x20uLL);
    *char v11 = &unk_1EDD69660;
    v11[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    v11[2] = 0x80000002CLL;
    v11[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:44: MARISA_MEMORY"
             "_ERROR: temp.get() == NULL";
  }
  int v7 = v6;
  internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(v6);
  uint64_t v13 = v7;
  internal::marisa::grimoire::io::Mapper::Mapper((uint64_t)v12);
  internal::marisa::grimoire::io::Mapper::open((internal::marisa::grimoire::io::Mapper *)v12, a2, a3);
  internal::marisa::grimoire::trie::LoudsTrie::map(v13, (internal::marisa::grimoire::io::Mapper *)v12);
  uint64_t v8 = *this;
  *this = v13;
  uint64_t v13 = v8;
  internal::marisa::grimoire::io::Mapper::~Mapper((internal::marisa::grimoire::io::Mapper *)v12);
  return internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v13);
}

void sub_18E65064C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((internal::marisa::grimoire::trie::LoudsTrie **)va);
  _Unwind_Resume(a1);
}

void internal::marisa::Trie::write(internal::marisa::grimoire::trie::LoudsTrie ***a1, uint64_t a2)
{
  if (!*a1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000064;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:100: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  internal::marisa::grimoire::io::Writer::Writer((uint64_t)v5);
  internal::marisa::grimoire::io::Writer::open((uint64_t)v5, a2);
  internal::marisa::grimoire::trie::LoudsTrie::write(*a1, (internal::marisa::grimoire::io::Writer *)v5);
  internal::marisa::grimoire::io::Writer::~Writer(v5);
}

void sub_18E650748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, FILE *a9)
{
}

uint64_t internal::marisa::Trie::get_payload(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *a1;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x10000006DLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:109: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  return internal::marisa::grimoire::trie::LoudsTrie::get_payload(v3, a2, a3);
}

uint64_t internal::marisa::Trie::lookup(internal::marisa::grimoire::vector::BitVector **a1, uint64_t a2, unint64_t a3, void *a4)
{
  unsigned __int8 v4 = *a1;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000073;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:115: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  return internal::marisa::grimoire::trie::LoudsTrie::lookup(v4, a2, a3, a4);
}

uint64_t internal::marisa::Trie::common_prefix_search(uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x10000007FLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:127: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  return internal::marisa::grimoire::trie::LoudsTrie::common_prefix_search(v4, a2, a3, a4);
}

void internal::marisa::Trie::predictive_search(internal::marisa::grimoire::vector::BitVector **a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = *a1;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000086;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:134: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  internal::marisa::grimoire::trie::LoudsTrie::predictive_search(v5, a2, a3, a4, a5);
}

void internal::marisa::Trie::advance(internal::marisa::grimoire::vector::BitVector **a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  int v5 = *a1;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x10000008CLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:140: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  internal::marisa::grimoire::trie::LoudsTrie::advance(v5, a2, a3, a4, a5);
}

void internal::marisa::Trie::enumerate_entries(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = *a1;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000093;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:147: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries(v4, a2, a3, a4);
}

void internal::marisa::Trie::enumerate_children(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000099;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:153: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  internal::marisa::grimoire::trie::LoudsTrie::enumerate_children(v3, a2, a3);
}

void internal::marisa::Exception::~Exception(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x192FAF2C0);
}

uint64_t internal::marisa::Exception::what(internal::marisa::Exception *this)
{
  return *((void *)this + 3);
}

internal::marisa::grimoire::trie::LoudsTrie **internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(internal::marisa::grimoire::trie::LoudsTrie **a1)
{
  CFStringRef v2 = *a1;
  if (v2)
  {
    internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie(v2);
    MEMORY[0x192FAF2C0]();
  }
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

uint64_t internal::marisa::grimoire::io::Writer::Writer(uint64_t this)
{
  *(void *)this = 0;
  *(_DWORD *)(this + 8) = -1;
  *(void *)(this + 16) = 0;
  *(unsigned char *)(this + 24) = 0;
  return this;
}

void internal::marisa::grimoire::io::Writer::~Writer(FILE **this)
{
  if (*((unsigned char *)this + 24)) {
    fclose(*this);
  }
}

FILE *internal::marisa::grimoire::io::Writer::open(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(FILE **)a1;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  *(void *)(a1 + 16) = a2;
  int v4 = *(unsigned __int8 *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = 0;
  if (v4) {
    return (FILE *)fclose(result);
  }
  return result;
}

uint64_t internal::marisa::grimoire::io::Writer::seek(uint64_t this, size_t __nitems)
{
  size_t v2 = __nitems;
  uint64_t v3 = this;
  __buf[128] = *MEMORY[0x1E4F143B8];
  if (!*(void *)this && *(_DWORD *)(this + 8) == -1 && !*(void *)(this + 16))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
    exception[2] = 0x10000004FLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer."
                   "cc:79: MARISA_STATE_ERROR: !is_open()";
  }
  if (__nitems)
  {
    if (__nitems > 0x10)
    {
      bzero(__buf, 0x400uLL);
      do
      {
        if (v2 >= 0x400) {
          size_t v4 = 1024;
        }
        else {
          size_t v4 = v2;
        }
        this = internal::marisa::grimoire::io::Writer::write_data(v3, (char *)__buf, v4);
        v2 -= v4;
      }
      while (v2);
    }
    else
    {
      __buf[0] = 0;
      __buf[1] = 0;
      return internal::marisa::grimoire::io::Writer::write_data(this, (char *)__buf, __nitems);
    }
  }
  return this;
}

uint64_t internal::marisa::grimoire::io::Writer::write_data(uint64_t this, char *__buf, size_t __nitems)
{
  size_t v3 = __nitems;
  size_t v4 = __buf;
  uint64_t v5 = this;
  uint64_t v6 = *(FILE **)this;
  if (!*(void *)this && *(_DWORD *)(this + 8) == -1 && !*(void *)(this + 16))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
    exception[2] = 0x100000076;
    int v9 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc:118: MA"
         "RISA_STATE_ERROR: !is_open()";
    goto LABEL_20;
  }
  if (__nitems)
  {
    if (*(_DWORD *)(this + 8) != -1)
    {
      while (1)
      {
        size_t v7 = v3 >= 0x7FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v3;
        this = write(*(_DWORD *)(v5 + 8), v4, v7);
        if (this <= 0) {
          break;
        }
        v4 += this;
        v3 -= this;
        if (!v3) {
          return this;
        }
      }
      exception = __cxa_allocate_exception(0x20uLL);
      void *exception = &unk_1EDD69660;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
      exception[2] = 0x900000084;
      int v9 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc:132: "
           "MARISA_IO_ERROR: size_written <= 0";
LABEL_20:
      exception[3] = v9;
    }
    if (v6)
    {
      if (fwrite(__buf, 1uLL, __nitems, v6) != __nitems)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        void *exception = &unk_1EDD69660;
        exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
        exception[2] = 0x900000089;
        int v9 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc:137"
             ": MARISA_IO_ERROR: ::fwrite(data, 1, size, file_) != size";
        goto LABEL_20;
      }
      this = fflush(*(FILE **)v5);
      if (this)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        void *exception = &unk_1EDD69660;
        exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
        exception[2] = 0x90000008ALL;
        int v9 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc:138"
             ": MARISA_IO_ERROR: ::fflush(file_) != 0";
        goto LABEL_20;
      }
    }
    else
    {
      this = *(void *)(this + 16);
      if (this)
      {
        this = std::ostream::write();
        if ((*(unsigned char *)(this + *(void *)(*(void *)this - 24) + 32) & 5) != 0)
        {
          uint64_t v10 = __cxa_allocate_exception(0x20uLL);
          *uint64_t v10 = &unk_1EDD69660;
          v10[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
          v10[2] = 0x90000008FLL;
          v10[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer."
                   "cc:143: MARISA_IO_ERROR: !stream_->write(static_cast<const char*>(data), static_cast<std::streamsize>(size))";
        }
      }
    }
  }
  return this;
}

void sub_18E650FF8()
{
}

void sub_18E651074()
{
}

uint64_t internal::marisa::grimoire::io::Mapper::Mapper(uint64_t this)
{
  *(void *)this = 0;
  *(void *)(this + 8) = -1;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(_DWORD *)(this + 32) = -1;
  return this;
}

void internal::marisa::grimoire::io::Mapper::~Mapper(internal::marisa::grimoire::io::Mapper *this)
{
  size_t v2 = (void *)*((void *)this + 1);
  if (v2 != (void *)-1) {
    munmap(v2, *((void *)this + 3));
  }
  int v3 = *((_DWORD *)this + 8);
  if (v3 != -1) {
    close(v3);
  }
}

uint64_t *internal::marisa::grimoire::io::Mapper::swap(uint64_t *this, internal::marisa::grimoire::io::Mapper *a2)
{
  uint64_t v2 = *this;
  *this = *(void *)a2;
  *(void *)a2 = v2;
  uint64_t v4 = this[1];
  uint64_t v3 = this[2];
  uint64_t v5 = *((void *)a2 + 2);
  this[1] = *((void *)a2 + 1);
  this[2] = v5;
  *((void *)a2 + 1) = v4;
  *((void *)a2 + 2) = v3;
  uint64_t v6 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v6;
  LODWORD(v6) = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v6;
  return this;
}

__n128 internal::marisa::grimoire::io::Mapper::open(internal::marisa::grimoire::io::Mapper *this, const void *a2, uint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x200000050;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper."
                   "cc:80: MARISA_NULL_ERROR: (ptr == NULL) && (size != 0)";
  }
  long long v3 = *(_OWORD *)this;
  long long v4 = *((_OWORD *)this + 1);
  *(void *)this = a2;
  *((void *)this + 1) = -1;
  *((void *)this + 2) = a3;
  *((void *)this + 3) = 0;
  v8[0] = v3;
  v8[1] = v4;
  int v5 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = -1;
  int v9 = v5;
  internal::marisa::grimoire::io::Mapper::~Mapper((internal::marisa::grimoire::io::Mapper *)v8);
  return result;
}

uint64_t internal::marisa::grimoire::io::Mapper::seek(internal::marisa::grimoire::io::Mapper *this, unint64_t a2)
{
  if (!*(void *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x100000059;
    long long v4 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc:89: MAR"
         "ISA_STATE_ERROR: !is_open()";
    goto LABEL_8;
  }
  if (*((void *)this + 2) < a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x90000005ALL;
    long long v4 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc:90: MAR"
         "ISA_IO_ERROR: size > avail_";
LABEL_8:
    exception[3] = v4;
  }
  return internal::marisa::grimoire::io::Mapper::map_data(this, a2);
}

uint64_t internal::marisa::grimoire::io::Mapper::map_data(internal::marisa::grimoire::io::Mapper *this, unint64_t a2)
{
  uint64_t v2 = *(void *)this;
  if (!*(void *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x100000073;
    uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc:115: MA"
         "RISA_STATE_ERROR: !is_open()";
LABEL_6:
    exception[3] = v8;
  }
  unint64_t v3 = *((void *)this + 2);
  BOOL v4 = v3 >= a2;
  unint64_t v5 = v3 - a2;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x900000074;
    uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc:116: MA"
         "RISA_IO_ERROR: size > avail_";
    goto LABEL_6;
  }
  *(void *)this = v2 + a2;
  *((void *)this + 2) = v5;
  return v2;
}

internal::marisa::grimoire::trie::LoudsTrie *internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(internal::marisa::grimoire::trie::LoudsTrie *this)
{
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 185) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 89) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *(_OWORD *)((char *)this + 345) = 0u;
  *(_OWORD *)((char *)this + 393) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 297) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *(_OWORD *)((char *)this + 441) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *(_OWORD *)((char *)this + 553) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 34) = 0u;
  *(_OWORD *)((char *)this + 601) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_OWORD *)this + 37) = 0u;
  *(_OWORD *)((char *)this + 505) = 0u;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 29) = 0u;
  *(_OWORD *)((char *)this + 649) = 0u;
  *((_OWORD *)this + 39) = 0u;
  *((_OWORD *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 697) = 0u;
  *((_OWORD *)this + 42) = 0u;
  *((_OWORD *)this + 43) = 0u;
  *((void *)this + 90) = 0;
  *((_DWORD *)this + 182) = 0;
  *((void *)this + 92) = 0;
  internal::marisa::grimoire::trie::Tail::Tail((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 744));
  *((unsigned char *)this + 1048) = 0;
  *(_OWORD *)((char *)this + 1016) = 0u;
  *(_OWORD *)((char *)this + 1032) = 0u;
  *(_OWORD *)((char *)this + 1000) = 0u;
  *((_OWORD *)this + 66) = 0u;
  *((void *)this + 134) = 3;
  *((void *)this + 135) = 0x100000000200;
  *((_DWORD *)this + 272) = 0x20000;
  internal::marisa::grimoire::io::Mapper::Mapper((uint64_t)this + 1096);
  return this;
}

void sub_18E6514C0(_Unwind_Exception *a1)
{
  uint64_t v9 = *((void *)v1 + 126);
  if (v9) {
    MEMORY[0x192FAF290](v9, 0x1000C8077774924);
  }
  internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(v5);
  internal::marisa::grimoire::trie::Tail::~Tail(v4);
  if (*v7) {
    MEMORY[0x192FAF290](*v7, 0x1000C8077774924);
  }
  if (*v6) {
    MEMORY[0x192FAF290](*v6, 0x1000C8077774924);
  }
  internal::marisa::grimoire::vector::BitVector::~BitVector(v3);
  internal::marisa::grimoire::vector::BitVector::~BitVector(v2);
  internal::marisa::grimoire::vector::BitVector::~BitVector(v1);
  _Unwind_Resume(a1);
}

void internal::marisa::grimoire::trie::Tail::~Tail(internal::marisa::grimoire::trie::Tail *this)
{
  uint64_t v2 = *((void *)this + 26);
  if (v2) {
    MEMORY[0x192FAF290](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 20);
  if (v3) {
    MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 14);
  if (v4) {
    MEMORY[0x192FAF290](v4, 0x1000C8077774924);
  }
  uint64_t v5 = *((void *)this + 6);
  if (v5) {
    MEMORY[0x192FAF290](v5, 0x1000C8077774924);
  }
  if (*(void *)this) {
    MEMORY[0x192FAF290](*(void *)this, 0x1000C8077774924);
  }
}

void internal::marisa::grimoire::vector::BitVector::~BitVector(internal::marisa::grimoire::vector::BitVector *this)
{
  uint64_t v2 = *((void *)this + 20);
  if (v2) {
    MEMORY[0x192FAF290](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 14);
  if (v3) {
    MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 8);
  if (v4) {
    MEMORY[0x192FAF290](v4, 0x1000C8077774924);
  }
  if (*(void *)this) {
    MEMORY[0x192FAF290](*(void *)this, 0x1000C8077774924);
  }
}

void internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie(internal::marisa::grimoire::trie::LoudsTrie *this)
{
  internal::marisa::grimoire::io::Mapper::~Mapper((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 1096));
  uint64_t v2 = *((void *)this + 126);
  if (v2) {
    MEMORY[0x192FAF290](v2, 0x1000C8077774924);
  }
  internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((internal::marisa::grimoire::trie::LoudsTrie **)this + 125);
  uint64_t v3 = *((void *)this + 119);
  if (v3) {
    MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 113);
  if (v4) {
    MEMORY[0x192FAF290](v4, 0x1000C8077774924);
  }
  uint64_t v5 = *((void *)this + 107);
  if (v5) {
    MEMORY[0x192FAF290](v5, 0x1000C8077774924);
  }
  uint64_t v6 = *((void *)this + 99);
  if (v6) {
    MEMORY[0x192FAF290](v6, 0x1000C8077774924);
  }
  uint64_t v7 = *((void *)this + 93);
  if (v7) {
    MEMORY[0x192FAF290](v7, 0x1000C8077774924);
  }
  uint64_t v8 = *((void *)this + 84);
  if (v8) {
    MEMORY[0x192FAF290](v8, 0x1000C8077774924);
  }
  uint64_t v9 = *((void *)this + 78);
  if (v9) {
    MEMORY[0x192FAF290](v9, 0x1000C8077774924);
  }
  uint64_t v10 = *((void *)this + 72);
  if (v10) {
    MEMORY[0x192FAF290](v10, 0x1000C8077774924);
  }
  uint64_t v11 = *((void *)this + 66);
  if (v11) {
    MEMORY[0x192FAF290](v11, 0x1000C8077774924);
  }
  uint64_t v12 = *((void *)this + 60);
  if (v12) {
    MEMORY[0x192FAF290](v12, 0x1000C8077774924);
  }
  uint64_t v13 = *((void *)this + 52);
  if (v13) {
    MEMORY[0x192FAF290](v13, 0x1000C8077774924);
  }
  uint64_t v14 = *((void *)this + 46);
  if (v14) {
    MEMORY[0x192FAF290](v14, 0x1000C8077774924);
  }
  uint64_t v15 = *((void *)this + 40);
  if (v15) {
    MEMORY[0x192FAF290](v15, 0x1000C8077774924);
  }
  uint64_t v16 = *((void *)this + 34);
  if (v16) {
    MEMORY[0x192FAF290](v16, 0x1000C8077774924);
  }
  uint64_t v17 = *((void *)this + 26);
  if (v17) {
    MEMORY[0x192FAF290](v17, 0x1000C8077774924);
  }
  uint64_t v18 = *((void *)this + 20);
  if (v18) {
    MEMORY[0x192FAF290](v18, 0x1000C8077774924);
  }
  uint64_t v19 = *((void *)this + 14);
  if (v19) {
    MEMORY[0x192FAF290](v19, 0x1000C8077774924);
  }
  uint64_t v20 = *((void *)this + 8);
  if (v20) {
    MEMORY[0x192FAF290](v20, 0x1000C8077774924);
  }
  if (*(void *)this) {
    MEMORY[0x192FAF290](*(void *)this, 0x1000C8077774924);
  }
}

void internal::marisa::grimoire::trie::LoudsTrie::build(internal::marisa::grimoire::trie::LoudsTrie *a1, uint64_t *a2, void *a3, unsigned int a4)
{
  uint64_t v7 = 3;
  uint64_t v8 = 0x100000000200;
  int v9 = 0x20000;
  internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v7, a4);
  v10[0] = v7;
  v10[1] = v8;
  int v11 = v9;
  internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)&v7);
  internal::marisa::grimoire::trie::LoudsTrie::build_((uint64_t)&v7, a2, a3, (uint64_t)v10);
  internal::marisa::grimoire::trie::LoudsTrie::swap(a1, (internal::marisa::grimoire::trie::LoudsTrie *)&v7);
  internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)&v7);
}

void sub_18E6519A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)va);
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4)
{
  memset(v36, 0, 41);
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::resize((uint64_t *)v36, (a2[1] - *a2) >> 4);
  uint64_t v8 = *a2;
  if (a2[1] != *a2)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = *((void *)&v36[0] + 1) + v10;
      uint64_t v13 = (uint64_t *)(v8 + v9);
      uint64_t v15 = *v13;
      uint64_t v14 = v13[1];
      *(void *)uint64_t v12 = v15;
      *(_DWORD *)(v12 + 8) = v14;
      *(_DWORD *)(v12 + 12) = 1065353216;
      ++v11;
      uint64_t v8 = *a2;
      v10 += 24;
      v9 += 16;
    }
    while (v11 < (a2[1] - *a2) >> 4);
  }
  long long v34 = 0u;
  memset(v35, 0, 25);
  internal::marisa::grimoire::trie::LoudsTrie::build_trie<internal::marisa::grimoire::trie::Key>(a1, (uint64_t *)v36, &v34, a4, 1);
  memset(v33, 0, 41);
  internal::marisa::grimoire::vector::Vector<std::pair<unsigned int,unsigned int>>::resize((uint64_t *)v33, v35[1]);
  unint64_t v16 = *((void *)&v33[1] + 1);
  if (*((void *)&v33[1] + 1))
  {
    uint64_t v17 = 0;
    uint64_t v18 = *((void *)&v34 + 1);
    uint64_t v19 = (_DWORD *)(*((void *)&v33[0] + 1) + 4);
    do
    {
      *(v19 - 1) = *(_DWORD *)(v18 + 4 * v17);
      *uint64_t v19 = v17++;
      v19 += 2;
    }
    while (v16 != v17);
  }
  uint64_t v20 = v34;
  long long v34 = 0u;
  memset(v35, 0, 25);
  if (v20)
  {
    MEMORY[0x192FAF290](v20, 0x1000C8077774924);
    unint64_t v16 = *((void *)&v33[1] + 1);
  }
  unint64_t v21 = 126 - 2 * __clz(v16);
  if (v16) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = 0;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>(*((uint64_t *)&v33[0] + 1), (unsigned int *)(*((void *)&v33[0] + 1) + 8 * v16), (uint64_t)&v37, v22, 1);
  if (*((void *)&v33[1] + 1))
  {
    unint64_t v23 = 0;
    unint64_t v24 = 0;
    do
    {
      for (uint64_t i = *((void *)&v33[0] + 1); ; uint64_t i = *((void *)&v33[0] + 1))
      {
        unint64_t v26 = *(unsigned int *)(i + 8 * v23);
        if (v24 >= v26) {
          break;
        }
        internal::marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 208), 0);
        ++v24;
      }
      if (v24 == v26)
      {
        internal::marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 208), 1);
        ++v24;
      }
      ++v23;
    }
    while (v23 < *((void *)&v33[1] + 1));
  }
  else
  {
    unint64_t v24 = 0;
  }
  for (; v24 < *(void *)(a1 + 648); ++v24)
    internal::marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 208), 0);
  uint64_t v27 = (uint64_t *)(a1 + 208);
  internal::marisa::grimoire::vector::BitVector::push_back(v27, 0);
  internal::marisa::grimoire::vector::BitVector::build((internal::marisa::grimoire::vector::BitVector *)v27, 0, 1);
  if (a3)
  {
    std::vector<unsigned long>::resize((uint64_t)a3, (a2[1] - *a2) >> 4);
    if (a2[1] != *a2)
    {
      uint64_t v28 = 0;
      unint64_t v29 = 0;
      uint64_t v30 = *((void *)&v33[0] + 1);
      do
      {
        uint64_t v31 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)v27, *(unsigned int *)(v30 + v28));
        uint64_t v30 = *((void *)&v33[0] + 1);
        *(void *)(*a3 + 8 * *(unsigned int *)(*((void *)&v33[0] + 1) + v28 + 4)) = v31;
        ++v29;
        v28 += 8;
      }
      while (v29 < (a2[1] - *a2) >> 4);
    }
  }
  if (*(void *)&v33[0]) {
    MEMORY[0x192FAF290](*(void *)&v33[0], 0x1000C8077774924);
  }
  if ((void)v34) {
    MEMORY[0x192FAF290](v34, 0x1000C8077774924);
  }
  uint64_t result = *(void *)&v36[0];
  if (*(void *)&v36[0]) {
    return MEMORY[0x192FAF290](*(void *)&v36[0], 0x1000C8077774924);
  }
  return result;
}

void sub_18E651CB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  if (a15) {
    MEMORY[0x192FAF290](a15, 0x1000C8077774924);
  }
  if (a21) {
    MEMORY[0x192FAF290](a21, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *internal::marisa::grimoire::trie::LoudsTrie::swap(internal::marisa::grimoire::trie::LoudsTrie *this, internal::marisa::grimoire::trie::LoudsTrie *a2)
{
  internal::marisa::grimoire::vector::BitVector::swap(this, a2);
  internal::marisa::grimoire::vector::BitVector::swap((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), (internal::marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 208));
  internal::marisa::grimoire::vector::BitVector::swap((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), (internal::marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 416));
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 78, (uint64_t *)a2 + 78);
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 84, (uint64_t *)a2 + 84);
  uint64_t v4 = *((void *)this + 90);
  *((void *)this + 90) = *((void *)a2 + 90);
  *((void *)a2 + 90) = v4;
  LODWORD(v4) = *((_DWORD *)this + 182);
  *((_DWORD *)this + 182) = *((_DWORD *)a2 + 182);
  *((_DWORD *)a2 + 182) = v4;
  uint64_t v5 = *((void *)this + 92);
  *((void *)this + 92) = *((void *)a2 + 92);
  *((void *)a2 + 92) = v5;
  internal::marisa::grimoire::trie::Tail::swap((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), (internal::marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 744));
  uint64_t v6 = *((void *)this + 125);
  *((void *)this + 125) = *((void *)a2 + 125);
  *((void *)a2 + 125) = v6;
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 126, (uint64_t *)a2 + 126);
  uint64_t v7 = *((void *)this + 132);
  *((void *)this + 132) = *((void *)a2 + 132);
  *((void *)a2 + 132) = v7;
  uint64_t v8 = *((void *)this + 133);
  *((void *)this + 133) = *((void *)a2 + 133);
  *((void *)a2 + 133) = v8;
  uint64_t v9 = *((void *)this + 134);
  *((void *)this + 134) = *((void *)a2 + 134);
  *((void *)a2 + 134) = v9;
  uint64_t v10 = *((void *)this + 135);
  *((void *)this + 135) = *((void *)a2 + 135);
  *((void *)a2 + 135) = v10;
  LODWORD(v9) = *((_DWORD *)this + 272);
  *((_DWORD *)this + 272) = *((_DWORD *)a2 + 272);
  *((_DWORD *)a2 + 272) = v9;
  return internal::marisa::grimoire::io::Mapper::swap((uint64_t *)this + 137, (internal::marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 1096));
}

void internal::marisa::grimoire::trie::LoudsTrie::map(internal::marisa::grimoire::trie::LoudsTrie *this, internal::marisa::grimoire::io::Mapper *a2)
{
  internal::marisa::grimoire::trie::Header::map((internal::marisa::grimoire::trie::Header *)v4, a2);
  internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)v4);
  internal::marisa::grimoire::trie::LoudsTrie::map_((internal::marisa::grimoire::trie::LoudsTrie *)v4, a2);
  internal::marisa::grimoire::io::Mapper::swap(v5, a2);
  internal::marisa::grimoire::trie::LoudsTrie::swap(this, (internal::marisa::grimoire::trie::LoudsTrie *)v4);
  internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)v4);
}

void sub_18E651EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unsigned char *internal::marisa::grimoire::trie::Header::map(internal::marisa::grimoire::trie::Header *this, internal::marisa::grimoire::io::Mapper *a2)
{
  uint64_t result = (unsigned char *)internal::marisa::grimoire::io::Mapper::map_data(a2, 0x10uLL);
  if (*result != 87) {
    goto LABEL_7;
  }
  uint64_t v3 = 1u;
  do
  {
    if (v3 == 16) {
      return result;
    }
    int v4 = result[v3];
    int v5 = internal::marisa::grimoire::trie::Header::get_header(void)::buf[v3++];
  }
  while (v4 == v5);
  if ((unint64_t)(v3 - 2) <= 0xE)
  {
LABEL_7:
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/header.h";
    exception[2] = 0xA00000015;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/heade"
                   "r.h:21: MARISA_FORMAT_ERROR: !test_header(ptr)";
  }
  return result;
}

double internal::marisa::grimoire::trie::LoudsTrie::map_(internal::marisa::grimoire::trie::LoudsTrie *this, internal::marisa::grimoire::io::Mapper *a2)
{
  internal::marisa::grimoire::vector::BitVector::map(this, a2);
  internal::marisa::grimoire::vector::BitVector::map((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), a2);
  internal::marisa::grimoire::vector::BitVector::map((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), a2);
  internal::marisa::grimoire::vector::Vector<unsigned char>::map((long long *)this + 39, a2);
  internal::marisa::grimoire::vector::FlatVector::map((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 672), a2);
  internal::marisa::grimoire::trie::Tail::map((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2);
  if (*((void *)this + 59) && !*((void *)this + 96))
  {
    int v4 = (internal::marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x1E4FBA2D0]);
    int v5 = v4;
    if (v4) {
      internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(v4);
    }
    uint64_t v10 = *((void *)this + 125);
    *((void *)this + 125) = v5;
    internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((internal::marisa::grimoire::trie::LoudsTrie **)&v10);
    uint64_t v6 = (internal::marisa::grimoire::trie::LoudsTrie *)*((void *)this + 125);
    if (!v6)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      void *exception = &unk_1EDD69660;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x800000249;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/lou"
                     "ds-trie.cc:585: MARISA_MEMORY_ERROR: next_trie_.get() == NULL";
    }
    internal::marisa::grimoire::trie::LoudsTrie::map_(v6, a2);
  }
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::map((long long *)this + 63, a2);
  *((void *)this + 132) = *((void *)this + 129) - 1;
  *((void *)this + 133) = *(unsigned int *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  unsigned int v7 = *(_DWORD *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  uint64_t v10 = 3;
  *(void *)&double v11 = 0x100000000200;
  int v12 = 0x20000;
  internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v10, v7);
  *((void *)this + 134) = v10;
  double result = v11;
  *((double *)this + 135) = v11;
  *((_DWORD *)this + 272) = v12;
  return result;
}

void sub_18E652134(_Unwind_Exception *a1)
{
  MEMORY[0x192FAF2B0](v1, MEMORY[0x1E4FBA2D0]);
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::write(internal::marisa::grimoire::trie::LoudsTrie **this, internal::marisa::grimoire::io::Writer *a2)
{
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, "We love Marisa.", 0x10uLL);
  return internal::marisa::grimoire::trie::LoudsTrie::write_(this, a2);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::write_(internal::marisa::grimoire::trie::LoudsTrie **this, internal::marisa::grimoire::io::Writer *a2)
{
  internal::marisa::grimoire::vector::BitVector::write_((internal::marisa::grimoire::vector::BitVector *)this, a2);
  internal::marisa::grimoire::vector::BitVector::write_((internal::marisa::grimoire::vector::BitVector *)(this + 26), a2);
  internal::marisa::grimoire::vector::BitVector::write_((internal::marisa::grimoire::vector::BitVector *)(this + 52), a2);
  internal::marisa::grimoire::vector::Vector<unsigned char>::write_((uint64_t)(this + 78), a2);
  internal::marisa::grimoire::vector::FlatVector::write_((internal::marisa::grimoire::vector::FlatVector *)(this + 84), a2);
  internal::marisa::grimoire::trie::Tail::write((internal::marisa::grimoire::trie::Tail *)(this + 93), a2);
  int v4 = this[125];
  if (v4) {
    internal::marisa::grimoire::trie::LoudsTrie::write_(v4, a2);
  }
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::write_((uint64_t)(this + 126), a2);
  unsigned int __buf = this[133];
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  int v6 = *((_DWORD *)this + 271) | *((_DWORD *)this + 268) | *((_DWORD *)this + 272);
  return internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&v6, 4uLL);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::get_payload(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(unsigned __int8 *)(a2 + 31);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a2 + 16);
  }
  if (v3) {
    return 0;
  }
  unint64_t v5 = *(void *)a2;
  if (((*(void *)(*(void *)(a1 + 224) + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
    return 0;
  }
  *a3 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)(a1 + 208), v5);
  return 1;
}

void internal::marisa::grimoire::trie::LoudsTrie::predictive_search(internal::marisa::grimoire::vector::BitVector *this, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  char v12 = 0;
  memset(&__p, 0, sizeof(__p));
  while (v13 < a3)
  {
    if ((internal::marisa::grimoire::trie::LoudsTrie::predictive_find_child(this, a2, a3, &v13, &v14, &__p) & 1) == 0) {
      goto LABEL_8;
    }
  }
  int v10 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    int v10 = __p.__r_.__value_.__r.__words[1];
  }
  internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries_DFS((unint64_t)this, v14, (uint64_t)&__p, &v12, a4, (v10 - a3) & ~((v10 - (int)a3) >> 31), a5);
LABEL_8:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_18E6523A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::predictive_find_child(internal::marisa::grimoire::vector::BitVector *this, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, std::string *a6)
{
  unint64_t v12 = (*(unsigned __int8 *)(a2 + *a4) ^ (32 * *a5) ^ *a5) & *((void *)this + 132);
  uint64_t v13 = *((void *)this + 128);
  if (*a5 != *(_DWORD *)(v13 + 12 * v12))
  {
    unint64_t v15 = internal::marisa::grimoire::vector::BitVector::select0(this, *a5);
    uint64_t v16 = *((void *)this + 2);
    if ((*(void *)(v16 + (((v15 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v15 + 1)))
    {
      unint64_t v17 = v15 - *a5;
      *a5 = v17;
      unint64_t v18 = v15 + 2;
      uint64_t v19 = 0xFFFFFFFFLL;
      while (1)
      {
        if ((*(void *)(*((void *)this + 54) + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v17))
        {
          if (v19 == 0xFFFFFFFFLL)
          {
            uint64_t v19 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)((char *)this + 416), v17);
            unint64_t v17 = *a5;
          }
          else
          {
            ++v19;
          }
          unint64_t v21 = *a4;
          uint64_t v22 = *((void *)this + 90);
          unint64_t v23 = (unint64_t)(v22 * v19) >> 6;
          uint64_t v24 = (v22 * v19) & 0x3F;
          unint64_t v25 = v24 + v22;
          uint64_t v26 = *((void *)this + 86);
          uint64_t v27 = *(void *)(v26 + 8 * v23) >> v24;
          if (v25 > 0x40) {
            v27 |= (2 * *(void *)(v26 + 8 * v23 + 8)) << (v24 ^ 0x3Fu);
          }
          unint64_t v28 = *(unsigned __int8 *)(*((void *)this + 80) + v17) | ((*((_DWORD *)this + 182) & v27) << 8);
          uint64_t v29 = *((void *)this + 125);
          if (v29)
          {
            if (internal::marisa::grimoire::trie::LoudsTrie::prefix_match_(v29, a2, a3, a4, v28, a6)) {
              return 1;
            }
          }
          else if (internal::marisa::grimoire::trie::Tail::prefix_match((void *)this + 93, a2, a3, a4, v28, a6))
          {
            return 1;
          }
          if (*a4 != v21) {
            return 0;
          }
          unint64_t v17 = *a5;
          uint64_t v16 = *((void *)this + 2);
        }
        else
        {
          int v20 = *(unsigned __int8 *)(*((void *)this + 80) + v17);
          if (v20 == *(unsigned __int8 *)(a2 + *a4))
          {
            std::string::push_back(a6, v20);
            ++*a4;
            return 1;
          }
        }
        *a5 = ++v17;
        uint64_t v30 = *(void *)(v16 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v18;
        ++v18;
        if ((v30 & 1) == 0) {
          return 0;
        }
      }
    }
    return 0;
  }
  unint64_t v14 = *(unsigned int *)(v13 + 12 * v12 + 8);
  if (v14 > 0xFFFFFEFF)
  {
    std::string::push_back(a6, v14);
    ++*a4;
    goto LABEL_24;
  }
  uint64_t v31 = *((void *)this + 125);
  if (v31)
  {
    if (internal::marisa::grimoire::trie::LoudsTrie::prefix_match_(v31, a2, a3, a4, v14, a6)) {
      goto LABEL_24;
    }
    return 0;
  }
  if (!internal::marisa::grimoire::trie::Tail::prefix_match((void *)this + 93, a2, a3, a4, v14, a6)) {
    return 0;
  }
LABEL_24:
  *a5 = *(unsigned int *)(*((void *)this + 128) + 12 * v12 + 4);
  return 1;
}

unint64_t internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries_DFS(unint64_t result, unint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, int a6, uint64_t a7)
{
  if (!*a4)
  {
    unint64_t v11 = result;
    if ((a7 & 0x80000000) != 0 || a6 <= (int)a7)
    {
      if (((*(void *)(*(void *)(result + 224) + ((a2 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a2) & 1) == 0
        || ((uint64_t v12 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)(result + 208), a2), v13 = *(char *)(a3 + 23), v13 >= 0)? (v14 = a3): (v14 = *(void *)a3), v13 >= 0 ? (v15 = *(unsigned __int8 *)(a3 + 23)) : (v15 = *(void *)(a3 + 8)), result = std::function<void ()(unsigned long,std::string_view,BOOL &)>::operator()(a5, v12, v14, v15, (uint64_t)a4), !*a4))
      {
        std::string::size_type v16 = *(char *)(a3 + 23) >= 0 ? *(unsigned __int8 *)(a3 + 23) : *(void *)(a3 + 8);
        double result = internal::marisa::grimoire::vector::BitVector::select0((internal::marisa::grimoire::vector::BitVector *)v11, a2);
        if (!*a4)
        {
          unint64_t v17 = result;
          uint64_t v18 = 0xFFFFFFFFLL;
          do
          {
            if (((*(void *)(*(void *)(v11 + 16) + (((v17 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v17 + 1)) & 1) == 0) {
              break;
            }
            if ((*(void *)(*(void *)(v11 + 432) + (((v17 - a2) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v17 - a2)))
            {
              if (v18 == 0xFFFFFFFFLL) {
                uint64_t v18 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)(v11 + 416), v17 - a2);
              }
              else {
                ++v18;
              }
              uint64_t v19 = *(void *)(v11 + 720);
              unint64_t v20 = (unint64_t)(v19 * v18) >> 6;
              uint64_t v21 = (v19 * v18) & 0x3F;
              unint64_t v22 = v21 + v19;
              uint64_t v23 = *(void *)(v11 + 688);
              uint64_t v24 = *(void *)(v23 + 8 * v20) >> v21;
              if (v22 > 0x40) {
                v24 |= (2 * *(void *)(v23 + 8 * v20 + 8)) << (v21 ^ 0x3Fu);
              }
              unint64_t v25 = *(unsigned __int8 *)(*(void *)(v11 + 640) - a2 + v17) | ((*(_DWORD *)(v11 + 728) & v24) << 8);
              uint64_t v26 = *(void *)(v11 + 1000);
              if (v26) {
                internal::marisa::grimoire::trie::LoudsTrie::restore_(v26, (std::string *)a3, v25);
              }
              else {
                internal::marisa::grimoire::trie::Tail::restore((void *)(v11 + 744), (std::string *)a3, v25);
              }
            }
            else
            {
              std::string::push_back((std::string *)a3, *(unsigned char *)(*(void *)(v11 + 640) - a2 + v17));
            }
            int v27 = *(unsigned __int8 *)(a3 + 23);
            if ((v27 & 0x80u) != 0) {
              int v27 = *(_DWORD *)(a3 + 8);
            }
            internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries_DFS(v11, v17 - a2, a3, a4, a5, (v27 - v16 + a6), a7);
            uint64_t v28 = *(unsigned __int8 *)(a3 + 23);
            int v29 = (char)v28;
            uint64_t v30 = a3 + v28;
            if (v29 >= 0)
            {
              uint64_t v31 = a3;
            }
            else
            {
              uint64_t v30 = *(void *)a3 + *(void *)(a3 + 8);
              uint64_t v31 = *(void *)a3;
            }
            double result = (unint64_t)std::string::erase((std::string *)a3, v16, v30 - (v31 + v16));
            ++v17;
          }
          while (!*a4);
        }
      }
    }
  }
  return result;
}

void internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((a4 & 0x80000000) != 0)
  {
    uint64_t v8 = *(unsigned __int8 *)(a2 + 31);
    uint64_t v10 = *(void *)(a2 + 16);
    char v9 = *(unsigned char *)(a2 + 31);
LABEL_8:
    char v20 = 0;
    uint64_t v12 = *(void *)(a2 + 8) + v10;
    uint64_t v13 = a2 + 8 + v8;
    if (v9 >= 0) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v12;
    }
    if (v9 >= 0) {
      uint64_t v15 = a2 + 8;
    }
    else {
      uint64_t v15 = *(void *)(a2 + 8);
    }
    std::string::__init_with_size[abi:ne180100]<std::reverse_iterator<std::__wrap_iter<char const*>>,std::reverse_iterator<std::__wrap_iter<char const*>>>(&__p, v14, v14, v15, v15, v14 - v15);
    if ((v19 & 0x80u) == 0) {
      int v16 = v19;
    }
    else {
      int v16 = v18;
    }
    internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries_DFS(a1, *(void *)a2, (uint64_t)&__p, &v20, a3, v16, a4);
    if ((char)v19 < 0) {
      operator delete(__p);
    }
    return;
  }
  uint64_t v8 = *(unsigned __int8 *)(a2 + 31);
  char v9 = v8;
  uint64_t v10 = *(void *)(a2 + 16);
  if ((v8 & 0x80u) == 0) {
    unint64_t v11 = *(unsigned __int8 *)(a2 + 31);
  }
  else {
    unint64_t v11 = *(void *)(a2 + 16);
  }
  if (v11 <= a4) {
    goto LABEL_8;
  }
}

void sub_18E6529C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::function<void ()(unsigned long,std::string_view,BOOL &)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v8[0] = a3;
  v8[1] = a4;
  uint64_t v7 = a2;
  uint64_t v5 = *(void *)(a1 + 24);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, void *, uint64_t))(*(void *)v5 + 48))(v5, &v7, v8, a5);
}

void internal::marisa::grimoire::trie::LoudsTrie::enumerate_children(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v38 = 0;
  uint64_t v5 = *(unsigned __int8 *)(a2 + 31);
  int v6 = (char)v5;
  std::string::size_type v7 = *(void *)(a2 + 16);
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *(void *)(a2 + 16);
  }
  if (v5)
  {
    uint64_t v8 = (const std::string::value_type **)(a2 + 8);
    unint64_t v36 = *(void *)a2;
    p_p = &__p;
    if (v6 < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *v8, v7);
    }
    else
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v8;
      __p.__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      char v32 = *(unsigned char *)(__p.__r_.__value_.__r.__words[0] + __p.__r_.__value_.__l.__size_ - 1);
      uint64_t v33 = --__p.__r_.__value_.__l.__size_;
    }
    else
    {
      char v32 = __p.__r_.__value_.__s.__data_[HIBYTE(__p.__r_.__value_.__r.__words[2]) - 1];
      uint64_t v33 = HIBYTE(__p.__r_.__value_.__r.__words[2]) - 1;
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = v33 & 0x7F;
    }
    p_p->__r_.__value_.__s.__data_[v33] = 0;
    std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)>::operator()(a3, v32);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    unint64_t v11 = internal::marisa::grimoire::vector::BitVector::select0((internal::marisa::grimoire::vector::BitVector *)a1, *(void *)a2);
    unint64_t v12 = v11 - *(void *)a2;
    *(void *)long long v34 = a1 + 744;
    uint64_t v13 = 0xFFFFFFFFLL;
    do
    {
      ++v11;
      if (((*(void *)(*(void *)(a1 + 16) + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        break;
      }
      memset(&v35, 0, sizeof(v35));
      if ((*(void *)(*(void *)(a1 + 432) + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12))
      {
        if (v13 == 0xFFFFFFFFLL) {
          uint64_t v13 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)(a1 + 416), v12);
        }
        else {
          ++v13;
        }
        uint64_t v14 = *(void *)(a1 + 720);
        unint64_t v15 = (unint64_t)(v14 * v13) >> 6;
        uint64_t v16 = (v14 * v13) & 0x3F;
        unint64_t v17 = v16 + v14;
        uint64_t v18 = *(void *)(a1 + 688);
        uint64_t v19 = *(void *)(v18 + 8 * v15) >> v16;
        if (v17 > 0x40) {
          v19 |= (2 * *(void *)(v18 + 8 * v15 + 8)) << (v16 ^ 0x3Fu);
        }
        unint64_t v20 = *(unsigned __int8 *)(*(void *)(a1 + 640) + v12) | ((*(_DWORD *)(a1 + 728) & v19) << 8);
        uint64_t v21 = *(void *)(a1 + 1000);
        if (v21) {
          internal::marisa::grimoire::trie::LoudsTrie::restore_(v21, &v35, v20);
        }
        else {
          internal::marisa::grimoire::trie::Tail::restore(*(void **)v34, &v35, v20);
        }
        std::string::size_type size = HIBYTE(v35.__r_.__value_.__r.__words[2]);
        if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v23 = &v35;
        }
        else {
          uint64_t v23 = (std::string *)v35.__r_.__value_.__r.__words[0];
        }
        if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type size = v35.__r_.__value_.__l.__size_;
        }
        if (size)
        {
          uint64_t v24 = (std::string *)((char *)v23 + size - 1);
          if (v24 > v23)
          {
            unint64_t v25 = &v23->__r_.__value_.__s.__data_[1];
            do
            {
              std::string::value_type v26 = *(v25 - 1);
              *(v25 - 1) = v24->__r_.__value_.__s.__data_[0];
              v24->__r_.__value_.__s.__data_[0] = v26;
              uint64_t v24 = (std::string *)((char *)v24 - 1);
            }
            while (v25++ < (char *)v24);
          }
        }
      }
      else
      {
        std::string::push_back(&v35, *(unsigned char *)(*(void *)(a1 + 640) + v12));
      }
      std::string __p = v35;
      memset(&v35, 0, sizeof(v35));
      unint64_t v36 = v12;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        uint64_t v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
        char v28 = *(unsigned char *)(__p.__r_.__value_.__r.__words[0] + __p.__r_.__value_.__l.__size_ - 1);
        uint64_t v29 = --__p.__r_.__value_.__l.__size_;
      }
      else
      {
        char v28 = *((unsigned char *)&v36 + HIBYTE(__p.__r_.__value_.__r.__words[2]) + 7);
        uint64_t v29 = HIBYTE(__p.__r_.__value_.__r.__words[2]) - 1;
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = v29 & 0x7F;
        uint64_t v30 = &__p;
      }
      v30->__r_.__value_.__s.__data_[v29] = 0;
      std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)>::operator()(a3, v28);
      int v31 = v38;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v35.__r_.__value_.__l.__data_);
      }
      ++v12;
    }
    while (!v31);
  }
}

void sub_18E652D44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)>::operator()(uint64_t a1, char a2)
{
  char v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::lookup(internal::marisa::grimoire::vector::BitVector *this, uint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  while (v9 < a3)
  {
    if ((internal::marisa::grimoire::trie::LoudsTrie::find_child(this, a2, a3, &v9, &v10) & 1) == 0) {
      return 0;
    }
  }
  if ((*(void *)(*((void *)this + 28) + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v10))
  {
    *a4 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)((char *)this + 208), v10);
    return 1;
  }
  return 0;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::find_child(internal::marisa::grimoire::vector::BitVector *this, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v10 = (*(unsigned __int8 *)(a2 + *a4) ^ (32 * *a5) ^ *a5) & *((void *)this + 132);
  uint64_t v11 = *((void *)this + 128);
  if (*a5 != *(_DWORD *)(v11 + 12 * v10))
  {
    unint64_t v13 = internal::marisa::grimoire::vector::BitVector::select0(this, *a5);
    uint64_t v14 = *((void *)this + 2);
    if ((*(void *)(v14 + (((v13 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v13 + 1)))
    {
      unint64_t v15 = v13 - *a5;
      *a5 = v15;
      unint64_t v16 = v13 + 2;
      uint64_t v17 = 0xFFFFFFFFLL;
      while (1)
      {
        if ((*(void *)(*((void *)this + 54) + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15))
        {
          if (v17 == 0xFFFFFFFFLL)
          {
            uint64_t v17 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)((char *)this + 416), v15);
            unint64_t v15 = *a5;
          }
          else
          {
            ++v17;
          }
          unint64_t v18 = *a4;
          uint64_t v19 = *((void *)this + 90);
          unint64_t v20 = (unint64_t)(v19 * v17) >> 6;
          uint64_t v21 = (v19 * v17) & 0x3F;
          unint64_t v22 = v21 + v19;
          uint64_t v23 = *((void *)this + 86);
          uint64_t v24 = *(void *)(v23 + 8 * v20) >> v21;
          if (v22 > 0x40) {
            v24 |= (2 * *(void *)(v23 + 8 * v20 + 8)) << (v21 ^ 0x3Fu);
          }
          unint64_t v25 = *(unsigned __int8 *)(*((void *)this + 80) + v15) | ((*((_DWORD *)this + 182) & v24) << 8);
          uint64_t v26 = *((void *)this + 125);
          if (v26)
          {
            if (internal::marisa::grimoire::trie::LoudsTrie::match_(v26, a2, a3, a4, v25)) {
              return 1;
            }
          }
          else if (internal::marisa::grimoire::trie::Tail::match((void *)this + 93, a2, a3, a4, v25))
          {
            return 1;
          }
          if (*a4 != v18) {
            return 0;
          }
          unint64_t v15 = *a5;
          uint64_t v14 = *((void *)this + 2);
        }
        else if (*(unsigned __int8 *)(*((void *)this + 80) + v15) == *(unsigned __int8 *)(a2 + *a4))
        {
          ++*a4;
          return 1;
        }
        *a5 = ++v15;
        uint64_t v27 = *(void *)(v14 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v16;
        ++v16;
        if ((v27 & 1) == 0) {
          return 0;
        }
      }
    }
    return 0;
  }
  unint64_t v12 = *(unsigned int *)(v11 + 12 * v10 + 8);
  if (v12 > 0xFFFFFEFF)
  {
    ++*a4;
    goto LABEL_24;
  }
  uint64_t v28 = *((void *)this + 125);
  if (v28)
  {
    if (internal::marisa::grimoire::trie::LoudsTrie::match_(v28, a2, a3, a4, v12)) {
      goto LABEL_24;
    }
    return 0;
  }
  if ((internal::marisa::grimoire::trie::Tail::match((void *)this + 93, a2, a3, a4, v12) & 1) == 0) {
    return 0;
  }
LABEL_24:
  *a5 = *(unsigned int *)(*((void *)this + 128) + 12 * v10 + 4);
  return 1;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::common_prefix_search(uint64_t this, uint64_t a2, unint64_t a3, uint64_t a4)
{
  std::string::size_type v7 = (internal::marisa::grimoire::vector::BitVector *)this;
  char v15 = 0;
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  uint64_t v8 = (internal::marisa::grimoire::vector::BitVector *)(this + 208);
  if (**(unsigned char **)(this + 224))
  {
    uint64_t v9 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)(this + 208), 0);
    this = std::function<void ()(unsigned long,std::string_view,BOOL &)>::operator()(a4, v9, a2, 0, (uint64_t)&v15);
    if (v15) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = a3 == 0;
    }
    if (v10) {
      return this;
    }
  }
  else if (!a3)
  {
    return this;
  }
  this = internal::marisa::grimoire::trie::LoudsTrie::find_child(v7, a2, a3, &v13, &v14);
  if (this)
  {
    do
    {
      if ((*(void *)(*((void *)v7 + 28) + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14))
      {
        uint64_t v11 = internal::marisa::grimoire::vector::BitVector::rank1(v8, v14);
        this = std::function<void ()(unsigned long,std::string_view,BOOL &)>::operator()(a4, v11, a2, v13, (uint64_t)&v15);
        if (v15) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = v13 >= a3;
        }
        if (v12) {
          return this;
        }
      }
      else if (v13 >= a3)
      {
        return this;
      }
      this = internal::marisa::grimoire::trie::LoudsTrie::find_child(v7, a2, a3, &v13, &v14);
    }
    while ((this & 1) != 0);
  }
  return this;
}

uint64_t *internal::marisa::grimoire::vector::BitVector::swap(internal::marisa::grimoire::vector::BitVector *this, internal::marisa::grimoire::vector::BitVector *a2)
{
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this, (uint64_t *)a2);
  uint64_t v4 = *((void *)this + 6);
  *((void *)this + 6) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v4;
  uint64_t v5 = *((void *)this + 7);
  *((void *)this + 7) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v5;
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 8, (uint64_t *)a2 + 8);
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 14, (uint64_t *)a2 + 14);
  return internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 20, (uint64_t *)a2 + 20);
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned char>::swap(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *double result = *a2;
  *a2 = v2;
  uint64_t v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  uint64_t v4 = result[2];
  uint64_t v5 = result[3];
  uint64_t v6 = a2[3];
  result[2] = a2[2];
  result[3] = v6;
  a2[2] = v4;
  a2[3] = v5;
  uint64_t v7 = result[4];
  result[4] = a2[4];
  a2[4] = v7;
  LOBYTE(v7) = *((unsigned char *)result + 40);
  *((unsigned char *)result + 40) = *((unsigned char *)a2 + 40);
  *((unsigned char *)a2 + 40) = v7;
  return result;
}

uint64_t *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = result;
  unint64_t v4 = result[4];
  if (v4 < a2)
  {
    uint64_t v5 = 2 * v4;
    if (v4 > 0x555555555555555) {
      uint64_t v5 = 0xAAAAAAAAAAAAAAALL;
    }
    if (v4 > a2 >> 1) {
      a2 = v5;
    }
    double result = (uint64_t *)internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::realloc(result, a2);
  }
  unint64_t v6 = v3[3];
  unint64_t v7 = v2 - v6;
  if (v2 > v6)
  {
    uint64_t v8 = 24 * v6;
    do
    {
      uint64_t v9 = v3[1] + v8;
      *(void *)uint64_t v9 = 0;
      *(void *)(v9 + 8) = 0;
      *(_DWORD *)(v9 + 16) = 0;
      v8 += 24;
      --v7;
    }
    while (v7);
  }
  v3[3] = v2;
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_trie<internal::marisa::grimoire::trie::Key>(uint64_t a1, uint64_t *a2, long long *a3, uint64_t a4, uint64_t a5)
{
  internal::marisa::grimoire::trie::LoudsTrie::build_current_trie<internal::marisa::grimoire::trie::Key>((uint64_t *)a1, (uint64_t)a2, a3, a4, a5);
  memset(v17, 0, 41);
  if (a2[3]) {
    internal::marisa::grimoire::trie::LoudsTrie::build_next_trie<internal::marisa::grimoire::trie::Key>(a1, a2, v17, a4, a5);
  }
  uint64_t v9 = *(_DWORD **)(a1 + 1000);
  if (v9)
  {
    unsigned int v10 = (v9[268] + 1) | v9[271] | v9[272];
    uint64_t v18 = 3;
    uint64_t v19 = 0x100000000200;
    int v20 = 0x20000;
    internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v18, v10);
  }
  else
  {
    if (*(void *)(a1 + 840)) {
      int v11 = 0x2000;
    }
    else {
      int v11 = 4096;
    }
    unsigned int v12 = *(_DWORD *)(a4 + 16) | *(_DWORD *)(a4 + 8) | v11 | 1;
    uint64_t v18 = 3;
    uint64_t v19 = 0x100000000200;
    int v20 = 0x20000;
    internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v18, v12);
  }
  *(void *)(a1 + 1072) = v18;
  *(void *)(a1 + 1080) = v19;
  *(_DWORD *)(a1 + 1088) = v20;
  internal::marisa::grimoire::vector::BitVector::build((internal::marisa::grimoire::vector::BitVector *)(a1 + 416), 0, 0);
  if (*((void *)&v17[1] + 1))
  {
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    do
    {
      do
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 432) + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14;
        ++v14;
      }
      while ((v15 & 1) == 0);
      *(unsigned char *)(*(void *)(a1 + 632) + v14 - 1) = *(_DWORD *)(*((void *)&v17[0] + 1) + 4 * v13);
      *(_DWORD *)(*((void *)&v17[0] + 1) + 4 * v13++) >>= 8;
    }
    while (v13 < *((void *)&v17[1] + 1));
  }
  internal::marisa::grimoire::vector::FlatVector::build((long long *)(a1 + 672), (uint64_t)v17);
  internal::marisa::grimoire::trie::LoudsTrie::fill_cache(a1);
  uint64_t result = *(void *)&v17[0];
  if (*(void *)&v17[0]) {
    return MEMORY[0x192FAF290](*(void *)&v17[0], 0x1000C8077774924);
  }
  return result;
}

void sub_18E653534(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

void internal::marisa::grimoire::vector::Vector<std::pair<unsigned int,unsigned int>>::resize(uint64_t *a1, unint64_t a2)
{
  unint64_t v2 = a2;
  unint64_t v4 = a1[4];
  if (v4 < a2)
  {
    uint64_t v5 = 2 * v4;
    if (v4 >> 60) {
      uint64_t v5 = 0x1FFFFFFFFFFFFFFFLL;
    }
    if (v4 > a2 >> 1) {
      a2 = v5;
    }
    internal::marisa::grimoire::vector::Vector<unsigned long long>::realloc(a1, a2);
  }
  unint64_t v6 = a1[3];
  if (v2 > v6) {
    bzero((void *)(a1[1] + 8 * v6), 8 * (v2 - v6));
  }
  a1[3] = v2;
}

uint64_t *internal::marisa::grimoire::vector::BitVector::push_back(uint64_t *this, int a2)
{
  unint64_t v2 = this[6];
  if (v2 == 0xFFFFFFFF)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/bit-vector.h";
    exception[2] = 0x70000003ALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/bit"
                   "-vector.h:58: MARISA_SIZE_ERROR: size_ == MARISA_UINT32_MAX";
  }
  unint64_t v4 = this;
  uint64_t v5 = this[3];
  if (v2 == v5 << 6)
  {
    uint64_t v7 = 0;
    this = internal::marisa::grimoire::vector::Vector<unsigned long long>::resize(this, v5 + 1, &v7);
    unint64_t v2 = v4[6];
  }
  if (a2)
  {
    *(void *)(v4[1] + ((v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v2;
    ++v4[7];
  }
  v4[6] = v2 + 1;
  return this;
}

uint64_t internal::marisa::grimoire::vector::BitVector::build(internal::marisa::grimoire::vector::BitVector *this, uint64_t a2, uint64_t a3)
{
  memset(v8, 0, 41);
  long long v11 = 0u;
  memset(v12, 0, sizeof(v12));
  long long v13 = 0u;
  memset(v14, 0, sizeof(v14));
  v8[3] = 0u;
  long long v9 = 0u;
  memset(v10, 0, sizeof(v10));
  internal::marisa::grimoire::vector::BitVector::build_index((internal::marisa::grimoire::vector::BitVector *)v8, this, a2, a3);
  internal::marisa::grimoire::vector::Vector<unsigned long long>::shrink(this);
  long long v4 = v8[0];
  v8[0] = *(_OWORD *)this;
  *(_OWORD *)this = v4;
  uint64_t v5 = *(void *)&v8[1];
  *(void *)&v8[1] = *((void *)this + 2);
  *((void *)this + 2) = v5;
  long long v6 = *(_OWORD *)((char *)&v8[1] + 8);
  *(_OWORD *)((char *)&v8[1] + 8) = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = v6;
  LOBYTE(v5) = BYTE8(v8[2]);
  BYTE8(v8[2]) = *((unsigned char *)this + 40);
  *((unsigned char *)this + 40) = v5;
  internal::marisa::grimoire::vector::BitVector::swap(this, (internal::marisa::grimoire::vector::BitVector *)v8);
  if ((void)v13) {
    MEMORY[0x192FAF290](v13, 0x1000C8077774924);
  }
  if ((void)v11) {
    MEMORY[0x192FAF290](v11, 0x1000C8077774924);
  }
  if ((void)v9) {
    MEMORY[0x192FAF290](v9, 0x1000C8077774924);
  }
  uint64_t result = *(void *)&v8[0];
  if (*(void *)&v8[0]) {
    return MEMORY[0x192FAF290](*(void *)&v8[0], 0x1000C8077774924);
  }
  return result;
}

void sub_18E6537F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::vector<unsigned long>::resize(uint64_t a1, unint64_t a2)
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
    std::vector<unsigned long>::__append((char **)a1, a2 - v2);
  }
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_next_trie<internal::marisa::grimoire::trie::Key>(uint64_t a1, uint64_t *a2, long long *a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)a4 == a5)
  {
    long long v26 = 0u;
    memset(v27, 0, sizeof(v27));
    internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Entry>::resize((uint64_t *)&v26, a2[3]);
    uint64_t v9 = a2[3];
    if (v9)
    {
      unsigned int v10 = (unsigned int *)(*((void *)&v26 + 1) + 8);
      long long v11 = (_DWORD *)(a2[1] + 8);
      do
      {
        uint64_t v12 = *((void *)v11 - 1);
        unsigned int v13 = *v11;
        v11 += 6;
        *((void *)v10 - 1) = v12 + v13 - 1;
        *unsigned int v10 = v13;
        v10 += 4;
        --v9;
      }
      while (v9);
    }
    internal::marisa::grimoire::trie::Tail::build((long long *)(a1 + 744), (uint64_t)&v26, a3, *(_DWORD *)(a4 + 12));
  }
  else
  {
    long long v26 = 0u;
    memset(v27, 0, sizeof(v27));
    internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::resize((uint64_t *)&v26, a2[3]);
    if (a2[3])
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0;
      do
      {
        uint64_t v17 = *((void *)&v26 + 1) + v15;
        uint64_t v18 = a2[1] + v15;
        uint64_t v19 = *(unsigned int *)(v18 + 8);
        *(void *)uint64_t v17 = *(void *)v18 + v19;
        *(_DWORD *)(v17 + 8) = v19;
        *(_DWORD *)(v17 + 12) = *(_DWORD *)(v18 + 12);
        ++v16;
        v15 += 24;
      }
      while (v16 < a2[3]);
    }
    uint64_t v20 = *a2;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_OWORD *)((char *)a2 + 25) = 0u;
    if (v20) {
      MEMORY[0x192FAF290](v20, 0x1000C8077774924);
    }
    uint64_t v21 = (internal::marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x1E4FBA2D0]);
    unint64_t v22 = v21;
    if (v21) {
      internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(v21);
    }
    uint64_t v28 = *(internal::marisa::grimoire::trie::LoudsTrie **)(a1 + 1000);
    *(void *)(a1 + 1000) = v22;
    internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v28);
    uint64_t v23 = *(void *)(a1 + 1000);
    if (!v23)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      void *exception = &unk_1EDD69660;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x8000001EBLL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/lou"
                     "ds-trie.cc:491: MARISA_MEMORY_ERROR: next_trie_.get() == NULL";
    }
    internal::marisa::grimoire::trie::LoudsTrie::build_trie<internal::marisa::grimoire::trie::ReverseKey>(v23, (uint64_t)&v26, a3, a4, a5 + 1);
  }
  uint64_t result = v26;
  if ((void)v26) {
    return MEMORY[0x192FAF290](v26, 0x1000C8077774924);
  }
  return result;
}

void sub_18E653A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MEMORY[0x192FAF2B0](v9, MEMORY[0x1E4FBA2D0]);
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(a1);
}

uint64_t *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Entry>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = result;
  unint64_t v4 = result[4];
  if (v4 < a2)
  {
    uint64_t v5 = 2 * v4;
    if (v4 >> 59) {
      uint64_t v5 = 0xFFFFFFFFFFFFFFFLL;
    }
    if (v4 > a2 >> 1) {
      a2 = v5;
    }
    uint64_t result = (uint64_t *)internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Entry>::realloc(result, a2);
  }
  unint64_t v6 = v3[3];
  unint64_t v7 = v2 - v6;
  if (v2 > v6)
  {
    uint64_t v8 = 16 * v6;
    do
    {
      uint64_t v9 = (void *)(v3[1] + v8);
      *uint64_t v9 = 0;
      v9[1] = 0;
      v8 += 16;
      --v7;
    }
    while (v7);
  }
  v3[3] = v2;
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_trie<internal::marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5)
{
  internal::marisa::grimoire::trie::LoudsTrie::build_current_trie<internal::marisa::grimoire::trie::ReverseKey>((uint64_t *)a1, a2, a3, a4, a5);
  memset(v17, 0, 41);
  if (*(void *)(a2 + 24)) {
    internal::marisa::grimoire::trie::LoudsTrie::build_next_trie<internal::marisa::grimoire::trie::ReverseKey>(a1, a2, v17, a4, a5);
  }
  uint64_t v9 = *(_DWORD **)(a1 + 1000);
  if (v9)
  {
    unsigned int v10 = (v9[268] + 1) | v9[271] | v9[272];
    uint64_t v18 = 3;
    uint64_t v19 = 0x100000000200;
    int v20 = 0x20000;
    internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v18, v10);
  }
  else
  {
    if (*(void *)(a1 + 840)) {
      int v11 = 0x2000;
    }
    else {
      int v11 = 4096;
    }
    unsigned int v12 = *(_DWORD *)(a4 + 16) | *(_DWORD *)(a4 + 8) | v11 | 1;
    uint64_t v18 = 3;
    uint64_t v19 = 0x100000000200;
    int v20 = 0x20000;
    internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v18, v12);
  }
  *(void *)(a1 + 1072) = v18;
  *(void *)(a1 + 1080) = v19;
  *(_DWORD *)(a1 + 1088) = v20;
  internal::marisa::grimoire::vector::BitVector::build((internal::marisa::grimoire::vector::BitVector *)(a1 + 416), 0, 0);
  if (*((void *)&v17[1] + 1))
  {
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    do
    {
      do
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 432) + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14;
        ++v14;
      }
      while ((v15 & 1) == 0);
      *(unsigned char *)(*(void *)(a1 + 632) + v14 - 1) = *(_DWORD *)(*((void *)&v17[0] + 1) + 4 * v13);
      *(_DWORD *)(*((void *)&v17[0] + 1) + 4 * v13++) >>= 8;
    }
    while (v13 < *((void *)&v17[1] + 1));
  }
  internal::marisa::grimoire::vector::FlatVector::build((long long *)(a1 + 672), (uint64_t)v17);
  internal::marisa::grimoire::trie::LoudsTrie::fill_cache(a1);
  uint64_t result = *(void *)&v17[0];
  if (*(void *)&v17[0]) {
    return MEMORY[0x192FAF290](*(void *)&v17[0], 0x1000C8077774924);
  }
  return result;
}

void sub_18E653CD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_next_trie<internal::marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)a4 == a5)
  {
    memset(v20, 0, 41);
    internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Entry>::resize((uint64_t *)v20, *(void *)(a2 + 24));
    uint64_t v9 = *(void *)(a2 + 24);
    if (v9)
    {
      unsigned int v10 = (_DWORD *)(*((void *)&v20[0] + 1) + 8);
      int v11 = (_DWORD *)(*(void *)(a2 + 8) + 8);
      do
      {
        uint64_t v12 = *((void *)v11 - 1);
        int v13 = *v11;
        v11 += 6;
        *((void *)v10 - 1) = v12 - 1;
        *unsigned int v10 = v13;
        v10 += 4;
        --v9;
      }
      while (v9);
    }
    internal::marisa::grimoire::trie::Tail::build((long long *)(a1 + 744), (uint64_t)v20, a3, *(_DWORD *)(a4 + 12));
    uint64_t result = *(void *)&v20[0];
    if (*(void *)&v20[0]) {
      return MEMORY[0x192FAF290](*(void *)&v20[0], 0x1000C8077774924);
    }
  }
  else
  {
    unint64_t v16 = (internal::marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x1E4FBA2D0]);
    uint64_t v17 = v16;
    if (v16) {
      internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(v16);
    }
    *(void *)&v20[0] = *(void *)(a1 + 1000);
    *(void *)(a1 + 1000) = v17;
    internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((internal::marisa::grimoire::trie::LoudsTrie **)v20);
    uint64_t v18 = *(void *)(a1 + 1000);
    if (!v18)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      void *exception = &unk_1EDD69660;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x8000001FDLL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/lou"
                     "ds-trie.cc:509: MARISA_MEMORY_ERROR: next_trie_.get() == NULL";
    }
    return internal::marisa::grimoire::trie::LoudsTrie::build_trie<internal::marisa::grimoire::trie::ReverseKey>(v18, a2, a3, a4, a5 + 1);
  }
  return result;
}

void sub_18E653E84(_Unwind_Exception *a1)
{
  MEMORY[0x192FAF2B0](v1, MEMORY[0x1E4FBA2D0]);
  _Unwind_Resume(a1);
}

uint64_t *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = result;
  unint64_t v4 = result[4];
  if (v4 < a2)
  {
    uint64_t v5 = 2 * v4;
    if (v4 > 0xAAAAAAAAAAAAAAALL) {
      uint64_t v5 = 0x1555555555555555;
    }
    if (v4 > a2 >> 1) {
      a2 = v5;
    }
    uint64_t result = (uint64_t *)internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::realloc(result, a2);
  }
  unint64_t v6 = v3[3];
  unint64_t v7 = v2 - v6;
  if (v2 > v6)
  {
    uint64_t v8 = 12 * v6;
    do
    {
      uint64_t v9 = v3[1] + v8;
      *(void *)uint64_t v9 = 0;
      *(_DWORD *)(v9 + 8) = 0x800000;
      v8 += 12;
      --v7;
    }
    while (v7);
  }
  v3[3] = v2;
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::fill_cache(uint64_t this)
{
  unint64_t v1 = *(void *)(this + 1032);
  if (v1)
  {
    uint64_t v2 = this;
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    uint64_t v5 = (internal::marisa::grimoire::vector::BitVector *)(this + 416);
    do
    {
      uint64_t v6 = *(void *)(v2 + 1016);
      unint64_t v7 = *(unsigned int *)(v6 + v3 + 4);
      if (v7)
      {
        *(unsigned char *)(v6 + v3 + 8) = *(unsigned char *)(*(void *)(v2 + 632) + v7);
        uint64_t v8 = *(void *)(v2 + 1016);
        if ((*(void *)(*(void *)(v2 + 432) + ((v7 >> 3) & 0x1FFFFFF8)) >> v7))
        {
          this = internal::marisa::grimoire::vector::BitVector::rank1(v5, v7);
          uint64_t v9 = *(void *)(v2 + 720);
          unint64_t v10 = (unint64_t)(v9 * this) >> 6;
          uint64_t v11 = (v9 * this) & 0x3F;
          unint64_t v12 = v11 + v9;
          uint64_t v13 = *(void *)(v2 + 688);
          unint64_t v14 = *(void *)(v13 + 8 * v10);
          if (v12 > 0x40) {
            uint64_t v15 = ((2 * *(void *)(v13 + 8 * v10 + 8)) << (v11 ^ 0x3Fu)) | (v14 >> v11);
          }
          else {
            uint64_t v15 = v14 >> v11;
          }
          int v16 = *(_DWORD *)(v2 + 728) & v15;
        }
        else
        {
          int v16 = 0xFFFFFF;
        }
        *(_DWORD *)(v8 + v3 + 8) = *(unsigned __int8 *)(v8 + v3 + 8) | (v16 << 8);
        unint64_t v1 = *(void *)(v2 + 1032);
      }
      else
      {
        *(void *)(v6 + v3) = -1;
      }
      ++v4;
      v3 += 12;
    }
    while (v4 < v1);
  }
  return this;
}

uint64_t internal::marisa::grimoire::vector::BitVector::map(internal::marisa::grimoire::vector::BitVector *this, internal::marisa::grimoire::io::Mapper *a2)
{
  memset(v4, 0, 41);
  long long v7 = 0u;
  memset(v8, 0, sizeof(v8));
  long long v9 = 0u;
  memset(v10, 0, sizeof(v10));
  v4[3] = 0u;
  long long v5 = 0u;
  memset(v6, 0, sizeof(v6));
  internal::marisa::grimoire::vector::BitVector::map_((internal::marisa::grimoire::vector::BitVector *)v4, a2);
  internal::marisa::grimoire::vector::BitVector::swap(this, (internal::marisa::grimoire::vector::BitVector *)v4);
  if ((void)v9) {
    MEMORY[0x192FAF290](v9, 0x1000C8077774924);
  }
  if ((void)v7) {
    MEMORY[0x192FAF290](v7, 0x1000C8077774924);
  }
  if ((void)v5) {
    MEMORY[0x192FAF290](v5, 0x1000C8077774924);
  }
  uint64_t result = *(void *)&v4[0];
  if (*(void *)&v4[0]) {
    return MEMORY[0x192FAF290](*(void *)&v4[0], 0x1000C8077774924);
  }
  return result;
}

void sub_18E65413C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned char>::map(long long *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned char>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_18E6541E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::vector::FlatVector::map(internal::marisa::grimoire::vector::FlatVector *this, internal::marisa::grimoire::io::Mapper *a2)
{
  memset(v9, 0, 41);
  uint64_t v10 = 0;
  int v11 = 0;
  uint64_t v12 = 0;
  internal::marisa::grimoire::vector::FlatVector::map_((internal::marisa::grimoire::vector::FlatVector *)v9, a2);
  long long v3 = *(_OWORD *)this;
  *(_OWORD *)this = v9[0];
  v9[0] = v3;
  uint64_t v4 = *((void *)this + 2);
  *((void *)this + 2) = *(void *)&v9[1];
  *(void *)&v9[1] = v4;
  long long v5 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)&v9[1] + 8);
  *(_OWORD *)((char *)&v9[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)this + 40);
  *((unsigned char *)this + 40) = BYTE8(v9[2]);
  BYTE8(v9[2]) = v4;
  uint64_t v6 = *((void *)this + 6);
  *((void *)this + 6) = v10;
  uint64_t v10 = v6;
  LODWORD(v6) = *((_DWORD *)this + 14);
  *((_DWORD *)this + 14) = v11;
  int v11 = v6;
  uint64_t v7 = *((void *)this + 8);
  *((void *)this + 8) = v12;
  uint64_t result = v3;
  uint64_t v12 = v7;
  if ((void)v3) {
    return MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_18E6542E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::map(long long *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_18E6543A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

void internal::marisa::grimoire::trie::LoudsTrie::advance(internal::marisa::grimoire::vector::BitVector *this@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  if (*(void *)a4 == 0xFFFFFFFFLL)
  {
    MEMORY[0xFFFFFFFF] = 0xFFFFFFFFLL;
    if (*(char *)(a4 + 31) < 0)
    {
      long long v9 = *(const std::string::value_type **)(a4 + 8);
      std::string::size_type v10 = *(void *)(a4 + 16);
      std::string::__init_copy_ctor_external((std::string *)0x100000007, v9, v10);
    }
    else
    {
      MEMORY[0x100000007] = *(_OWORD *)(a4 + 8);
      MEMORY[0x100000017] = *(void *)(a4 + 24);
    }
    return;
  }
  unint64_t v27 = *(void *)a4;
  if (*(char *)(a4 + 31) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a4 + 8), *(void *)(a4 + 16));
  }
  else {
    std::string __p = *(std::string *)(a4 + 8);
  }
  unint64_t v26 = 0;
  if (!a3)
  {
LABEL_20:
    *a5 = v27;
    unint64_t v14 = (std::string *)(a5 + 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(v14, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    }
    else {
      *unint64_t v14 = __p;
    }
    goto LABEL_46;
  }
  unint64_t v11 = 0;
  while ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
      goto LABEL_23;
    }
    unint64_t v26 = v11 + 1;
    if (*(unsigned __int8 *)(a2 + v11) != *((unsigned __int8 *)&v27 + HIBYTE(__p.__r_.__value_.__r.__words[2]) + 7))
    {
LABEL_27:
      *a5 = 0xFFFFFFFFLL;
      a5[1] = 0;
      a5[2] = 0;
      a5[3] = 0;
      goto LABEL_46;
    }
    uint64_t v12 = HIBYTE(__p.__r_.__value_.__r.__words[2]) - 1;
    --*((unsigned char *)&__p.__r_.__value_.__s + 23);
    ++v11;
    p_p = &__p;
LABEL_19:
    p_p->__r_.__value_.__s.__data_[v12] = 0;
    if (v11 >= a3) {
      goto LABEL_20;
    }
  }
  if (__p.__r_.__value_.__l.__size_)
  {
    unint64_t v26 = v11 + 1;
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if (*(unsigned __int8 *)(a2 + v11) != *(unsigned __int8 *)(__p.__r_.__value_.__r.__words[0]
                                                              + __p.__r_.__value_.__l.__size_
                                                              - 1))
      goto LABEL_27;
    uint64_t v12 = --__p.__r_.__value_.__l.__size_;
    ++v11;
    goto LABEL_19;
  }
LABEL_23:
  memset(&__str, 0, sizeof(__str));
  while (v26 < a3)
  {
    if ((internal::marisa::grimoire::trie::LoudsTrie::predictive_find_child(this, a2, a3, &v26, &v27, &__str) & 1) == 0)
    {
      *a5 = 0xFFFFFFFFLL;
      a5[1] = 0;
      a5[2] = 0;
      a5[3] = 0;
      goto LABEL_44;
    }
  }
  std::string::basic_string(&v24, &__str, v26 - v11, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v29);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = v24;
  char v15 = HIBYTE(v24.__r_.__value_.__r.__words[2]);
  std::string::size_type size = v24.__r_.__value_.__l.__size_;
  int v16 = (std::string *)v24.__r_.__value_.__r.__words[0];
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
  {
    int v16 = &__p;
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  uint64_t v18 = (std::string *)((char *)v16 + size - 1);
  if (size) {
    BOOL v19 = v18 > v16;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    int v20 = &v16->__r_.__value_.__s.__data_[1];
    do
    {
      std::string::value_type v21 = *(v20 - 1);
      *(v20 - 1) = v18->__r_.__value_.__s.__data_[0];
      v18->__r_.__value_.__s.__data_[0] = v21;
      uint64_t v18 = (std::string *)((char *)v18 - 1);
    }
    while (v20++ < (char *)v18);
    char v15 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  *a5 = v27;
  uint64_t v23 = (std::string *)(a5 + 1);
  if (v15 < 0) {
    std::string::__init_copy_ctor_external(v23, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    *uint64_t v23 = __p;
  }
LABEL_44:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
LABEL_46:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_18E6546A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(exception_object);
}

void internal::marisa::grimoire::trie::LoudsTrie::restore_(uint64_t a1, std::string *a2, unint64_t a3)
{
  uint64_t v6 = (internal::marisa::grimoire::vector::BitVector *)(a1 + 416);
  uint64_t v7 = (void *)(a1 + 744);
  while (1)
  {
    while (1)
    {
      unint64_t v8 = *(void *)(a1 + 1056) & a3;
      uint64_t v9 = *(void *)(a1 + 1024);
      if (a3 != *(_DWORD *)(v9 + 12 * v8 + 4)) {
        break;
      }
      unint64_t v10 = *(unsigned int *)(v9 + 12 * v8 + 8);
      if (v10 <= 0xFFFFFEFF)
      {
        uint64_t v20 = *(void *)(a1 + 1000);
        if (v20) {
          internal::marisa::grimoire::trie::LoudsTrie::restore_(v20, a2, v10);
        }
        else {
          internal::marisa::grimoire::trie::Tail::restore(v7, a2, v10);
        }
      }
      else
      {
        std::string::push_back(a2, v10);
      }
      a3 = *(unsigned int *)(*(void *)(a1 + 1024) + 12 * v8);
      if (!a3) {
        return;
      }
    }
    int v11 = *(unsigned __int8 *)(*(void *)(a1 + 640) + a3);
    if ((*(void *)(*(void *)(a1 + 432) + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a3))
    {
      uint64_t v12 = internal::marisa::grimoire::vector::BitVector::rank1(v6, a3);
      uint64_t v13 = *(void *)(a1 + 720);
      unint64_t v14 = (unint64_t)(v13 * v12) >> 6;
      uint64_t v15 = (v13 * v12) & 0x3F;
      unint64_t v16 = v15 + v13;
      uint64_t v17 = *(void *)(a1 + 688);
      unint64_t v18 = *(void *)(v17 + 8 * v14);
      uint64_t v19 = v16 > 0x40
          ? ((2 * *(void *)(v17 + 8 * v14 + 8)) << (v15 ^ 0x3Fu)) | (v18 >> v15)
          : v18 >> v15;
      unint64_t v21 = v11 | ((*(_DWORD *)(a1 + 728) & v19) << 8);
      uint64_t v22 = *(void *)(a1 + 1000);
      if (v22) {
        internal::marisa::grimoire::trie::LoudsTrie::restore_(v22, a2, v21);
      }
      else {
        internal::marisa::grimoire::trie::Tail::restore(v7, a2, v21);
      }
    }
    else
    {
      std::string::push_back(a2, v11);
    }
    if (a3 <= *(void *)(a1 + 1064)) {
      break;
    }
    a3 = internal::marisa::grimoire::vector::BitVector::select1((internal::marisa::grimoire::vector::BitVector *)a1, a3)
       + ~a3;
  }
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::match_(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t a5)
{
  unint64_t v10 = (internal::marisa::grimoire::vector::BitVector *)(a1 + 416);
  int v11 = (void *)(a1 + 744);
  while (1)
  {
    while (1)
    {
      unint64_t v12 = *(void *)(a1 + 1056) & a5;
      uint64_t v13 = *(void *)(a1 + 1024);
      if (a5 == *(_DWORD *)(v13 + 12 * v12 + 4)) {
        break;
      }
      if ((*(void *)(*(void *)(a1 + 432) + ((a5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a5))
      {
        uint64_t v15 = *(void *)(a1 + 1000);
        int v16 = *(unsigned __int8 *)(*(void *)(a1 + 640) + a5);
        uint64_t v17 = internal::marisa::grimoire::vector::BitVector::rank1(v10, a5);
        uint64_t v18 = *(void *)(a1 + 720);
        unint64_t v19 = (unint64_t)(v18 * v17) >> 6;
        uint64_t v20 = (v18 * v17) & 0x3F;
        unint64_t v21 = v20 + v18;
        uint64_t v22 = *(void *)(a1 + 688);
        unint64_t v23 = *(void *)(v22 + 8 * v19);
        if (v15)
        {
          unint64_t v24 = v23 >> v20;
          if (v21 > 0x40) {
            v24 |= (2 * *(void *)(v22 + 8 * v19 + 8)) << (v20 ^ 0x3Fu);
          }
          unint64_t v25 = v16 | ((*(_DWORD *)(a1 + 728) & v24) << 8);
          uint64_t v26 = *(void *)(a1 + 1000);
          if (v26)
          {
            if ((internal::marisa::grimoire::trie::LoudsTrie::match_(v26, a2, a3, a4, v25) & 1) == 0) {
              return 0;
            }
            goto LABEL_27;
          }
        }
        else
        {
          if (v21 > 0x40) {
            uint64_t v28 = ((2 * *(void *)(v22 + 8 * v19 + 8)) << (v20 ^ 0x3Fu)) | (v23 >> v20);
          }
          else {
            uint64_t v28 = v23 >> v20;
          }
          unint64_t v25 = v16 | ((*(_DWORD *)(a1 + 728) & v28) << 8);
        }
        if ((internal::marisa::grimoire::trie::Tail::match(v11, a2, a3, a4, v25) & 1) == 0) {
          return 0;
        }
      }
      else
      {
        if (*(unsigned __int8 *)(*(void *)(a1 + 640) + a5) != *(unsigned __int8 *)(a2 + *a4)) {
          return 0;
        }
        ++*a4;
      }
LABEL_27:
      if (a5 <= *(void *)(a1 + 1064)) {
        return 1;
      }
      if (*a4 >= a3) {
        return 0;
      }
      a5 = internal::marisa::grimoire::vector::BitVector::select1((internal::marisa::grimoire::vector::BitVector *)a1, a5)+ ~a5;
    }
    unint64_t v14 = *(unsigned int *)(v13 + 12 * v12 + 8);
    if (v14 <= 0xFFFFFEFF)
    {
      uint64_t v27 = *(void *)(a1 + 1000);
      if (v27)
      {
        if ((internal::marisa::grimoire::trie::LoudsTrie::match_(v27, a2, a3, a4, v14) & 1) == 0) {
          return 0;
        }
      }
      else if ((internal::marisa::grimoire::trie::Tail::match(v11, a2, a3, a4, v14) & 1) == 0)
      {
        return 0;
      }
    }
    else
    {
      if (*(unsigned __int8 *)(a2 + *a4) != v14) {
        return 0;
      }
      ++*a4;
    }
    a5 = *(unsigned int *)(*(void *)(a1 + 1024) + 12 * v12);
    if (!a5) {
      return 1;
    }
    if (*a4 >= a3) {
      return 0;
    }
  }
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::prefix_match_(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t a5, std::string *a6)
{
  unint64_t v12 = (internal::marisa::grimoire::vector::BitVector *)(a1 + 416);
  uint64_t v13 = (void *)(a1 + 744);
  while (1)
  {
    unint64_t v14 = *(void *)(a1 + 1056) & a5;
    uint64_t v15 = *(void *)(a1 + 1024);
    if (a5 != *(_DWORD *)(v15 + 12 * v14 + 4))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1 + 640) + a5);
      if ((*(void *)(*(void *)(a1 + 432) + ((a5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a5))
      {
        uint64_t v18 = internal::marisa::grimoire::vector::BitVector::rank1(v12, a5);
        uint64_t v19 = *(void *)(a1 + 720);
        unint64_t v20 = (unint64_t)(v19 * v18) >> 6;
        uint64_t v21 = (v19 * v18) & 0x3F;
        unint64_t v22 = v21 + v19;
        uint64_t v23 = *(void *)(a1 + 688);
        unint64_t v24 = *(void *)(v23 + 8 * v20);
        if (v22 > 0x40) {
          uint64_t v25 = ((2 * *(void *)(v23 + 8 * v20 + 8)) << (v21 ^ 0x3Fu)) | (v24 >> v21);
        }
        else {
          uint64_t v25 = v24 >> v21;
        }
        unint64_t v27 = v17 | ((*(_DWORD *)(a1 + 728) & v25) << 8);
        uint64_t v28 = *(void *)(a1 + 1000);
        if (v28)
        {
          if ((internal::marisa::grimoire::trie::LoudsTrie::prefix_match_(v28, a2, a3, a4, v27, a6) & 1) == 0) {
            return 0;
          }
        }
        else if (!internal::marisa::grimoire::trie::Tail::prefix_match(v13, a2, a3, a4, v27, a6))
        {
          return 0;
        }
      }
      else
      {
        if (v17 != *(unsigned __int8 *)(a2 + *a4)) {
          return 0;
        }
        std::string::push_back(a6, v17);
        ++*a4;
      }
      if (a5 <= *(void *)(a1 + 1064)) {
        return 1;
      }
      a5 = internal::marisa::grimoire::vector::BitVector::select1((internal::marisa::grimoire::vector::BitVector *)a1, a5)+ ~a5;
      goto LABEL_23;
    }
    unint64_t v16 = *(unsigned int *)(v15 + 12 * v14 + 8);
    if (v16 > 0xFFFFFEFF)
    {
      if (*(unsigned __int8 *)(a2 + *a4) != v16) {
        return 0;
      }
      std::string::push_back(a6, v16);
      ++*a4;
      goto LABEL_22;
    }
    uint64_t v26 = *(void *)(a1 + 1000);
    if (!v26) {
      break;
    }
    if ((internal::marisa::grimoire::trie::LoudsTrie::prefix_match_(v26, a2, a3, a4, v16, a6) & 1) == 0) {
      return 0;
    }
LABEL_22:
    a5 = *(unsigned int *)(*(void *)(a1 + 1024) + 12 * v14);
    if (!a5) {
      return 1;
    }
LABEL_23:
    if (*a4 >= a3)
    {
      internal::marisa::grimoire::trie::LoudsTrie::restore_(a1, a6, a5);
      return 1;
    }
  }
  if (internal::marisa::grimoire::trie::Tail::prefix_match(v13, a2, a3, a4, v16, a6)) {
    goto LABEL_22;
  }
  return 0;
}

uint64_t internal::marisa::grimoire::trie::Config::parse_(internal::marisa::grimoire::trie::Config *this, unsigned int a2)
{
  if (a2 >= 0x100000)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/config.h";
    exception[2] = 0x500000034;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/confi"
                   "g.h:52: MARISA_CODE_ERROR: (config_flags & ~MARISA_CONFIG_MASK) != 0";
  }
  if ((a2 & 0x7F) != 0) {
    *(void *)this = a2 & 0x7F;
  }
  internal::marisa::grimoire::trie::Config::parse_cache_level((uint64_t)this, a2);
  internal::marisa::grimoire::trie::Config::parse_tail_mode((uint64_t)this, a2);
  return internal::marisa::grimoire::trie::Config::parse_node_order((uint64_t)this, a2);
}

uint64_t internal::marisa::grimoire::trie::Config::parse_cache_level(uint64_t this, __int16 a2)
{
  unsigned int v2 = a2 & 0xF80;
  int v3 = 512;
  if (v2 > 0x1FF)
  {
    if (v2 == 512) {
      goto LABEL_11;
    }
    if (v2 != 1024)
    {
      int v3 = a2 & 0xF80;
      if (v2 != 2048) {
        goto LABEL_9;
      }
      goto LABEL_11;
    }
LABEL_10:
    int v3 = a2 & 0xF80;
    goto LABEL_11;
  }
  if ((a2 & 0xF80) == 0) {
    goto LABEL_11;
  }
  if (v2 == 128) {
    goto LABEL_10;
  }
  int v3 = a2 & 0xF80;
  if (v2 != 256)
  {
LABEL_9:
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/config.h";
    exception[2] = 0x500000060;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/confi"
                   "g.h:96: MARISA_CODE_ERROR: undefined cache level";
  }
LABEL_11:
  *(_DWORD *)(this + 8) = v3;
  return this;
}

uint64_t internal::marisa::grimoire::trie::Config::parse_tail_mode(uint64_t this, __int16 a2)
{
  int v2 = 4096;
  int v3 = a2 & 0xF000;
  if ((a2 & 0xF000) != 0 && v3 != 4096)
  {
    if (v3 != 0x2000)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      void *exception = &unk_1EDD69660;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/config.h";
      exception[2] = 0x500000075;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/con"
                     "fig.h:117: MARISA_CODE_ERROR: undefined tail mode";
    }
    int v2 = 0x2000;
  }
  *(_DWORD *)(this + 12) = v2;
  return this;
}

uint64_t internal::marisa::grimoire::trie::Config::parse_node_order(uint64_t this, int a2)
{
  int v2 = 0x20000;
  int v3 = a2 & 0xF0000;
  if ((a2 & 0xF0000) != 0 && v3 != 0x20000)
  {
    if (v3 != 0x10000)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      void *exception = &unk_1EDD69660;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/config.h";
      exception[2] = 0x50000008ALL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/con"
                     "fig.h:138: MARISA_CODE_ERROR: undefined node order";
    }
    int v2 = 0x10000;
  }
  *(_DWORD *)(this + 16) = v2;
  return this;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E55D5180, MEMORY[0x1E4FBA1C8]);
}

void sub_18E655010(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  unint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned long long>::resize(uint64_t *result, unint64_t a2, void *a3)
{
  unint64_t v4 = a2;
  long long v5 = result;
  unint64_t v6 = result[4];
  if (v6 < a2)
  {
    uint64_t v7 = 2 * v6;
    if (v6 >> 60) {
      uint64_t v7 = 0x1FFFFFFFFFFFFFFFLL;
    }
    if (v6 > a2 >> 1) {
      a2 = v7;
    }
    uint64_t result = internal::marisa::grimoire::vector::Vector<unsigned long long>::realloc(result, a2);
  }
  unint64_t v8 = v5[3];
  unint64_t v9 = v4 - v8;
  if (v4 > v8)
  {
    unint64_t v10 = (void *)(v5[1] + 8 * v8);
    do
    {
      *v10++ = *a3;
      --v9;
    }
    while (v9);
  }
  v5[3] = v4;
  return result;
}

void *internal::marisa::grimoire::vector::Vector<unsigned long long>::realloc(uint64_t *a1, uint64_t a2)
{
  uint64_t result = operator new[](8 * a2, MEMORY[0x1E4FBA2D0]);
  uint64_t v5 = a1[3];
  if (v5)
  {
    unint64_t v6 = (uint64_t *)a1[1];
    uint64_t v7 = result;
    do
    {
      uint64_t v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  uint64_t v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
  {
    JUMPOUT(0x192FAF290);
  }
  return result;
}

void *internal::marisa::grimoire::vector::Vector<unsigned long long>::shrink(void *result)
{
  if (*((unsigned char *)result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0x100000072;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:114: MARISA_STATE_ERROR: fixed_";
  }
  uint64_t v1 = result[3];
  if (v1 != result[4])
  {
    return internal::marisa::grimoire::vector::Vector<unsigned long long>::realloc(result, v1);
  }
  return result;
}

uint64_t internal::marisa::grimoire::vector::BitVector::map_(internal::marisa::grimoire::vector::BitVector *this, internal::marisa::grimoire::io::Mapper *a2)
{
  internal::marisa::grimoire::vector::Vector<unsigned long long>::map((long long *)this, a2);
  *((void *)this + 6) = *(unsigned int *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  unint64_t v4 = *(unsigned int *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  if (*((void *)this + 6) < v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/bit-vector.h";
    exception[2] = 0xA00000086;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/bit"
                   "-vector.h:134: MARISA_FORMAT_ERROR: temp_num_1s > size_";
  }
  *((void *)this + 7) = v4;
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::map((long long *)this + 4, a2);
  internal::marisa::grimoire::vector::Vector<unsigned int>::map((long long *)this + 7, a2);
  return internal::marisa::grimoire::vector::Vector<unsigned int>::map((long long *)this + 10, a2);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned long long>::map(long long *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned long long>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_18E6553D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::map(long long *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_18E655490(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned int>::map(long long *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned int>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_18E655550(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned long long>::map_(uint64_t a1, internal::marisa::grimoire::io::Mapper *this)
{
  unint64_t v4 = *(void *)internal::marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  if ((v4 & 7) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0xA000000D2;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:210: MARISA_FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  internal::marisa::grimoire::io::Mapper::map<unsigned long long>(this, (uint64_t *)(a1 + 16), v4 >> 3);
  internal::marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(void *)(a1 + 24) = v4 >> 3;
  return internal::marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t internal::marisa::grimoire::io::Mapper::map<unsigned long long>(internal::marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x20000001FLL;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:31: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 61)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x700000020;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:32: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  uint64_t result = internal::marisa::grimoire::io::Mapper::map_data(a1, 8 * a3);
  *a2 = result;
  return result;
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned long long>::fix(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0x10000007ALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:122: MARISA_STATE_ERROR: fixed_";
  }
  *(unsigned char *)(result + 40) = 1;
  return result;
}

uint64_t internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::map_(uint64_t a1, internal::marisa::grimoire::io::Mapper *this)
{
  unint64_t v4 = *(void *)internal::marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  unint64_t v5 = v4 / 0xC;
  if (v4 % 0xC)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0xA000000D2;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:210: MARISA_FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  internal::marisa::grimoire::io::Mapper::map<internal::marisa::grimoire::vector::RankIndex>(this, (uint64_t *)(a1 + 16), v5);
  internal::marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(void *)(a1 + 24) = v5;
  return internal::marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t internal::marisa::grimoire::io::Mapper::map<internal::marisa::grimoire::vector::RankIndex>(internal::marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x20000001FLL;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:31: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >= 0x1555555555555556)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x700000020;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:32: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  uint64_t result = internal::marisa::grimoire::io::Mapper::map_data(a1, 12 * a3);
  *a2 = result;
  return result;
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned int>::map_(uint64_t a1, internal::marisa::grimoire::io::Mapper *this)
{
  unint64_t v4 = *(void *)internal::marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  if ((v4 & 3) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0xA000000D2;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:210: MARISA_FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  internal::marisa::grimoire::io::Mapper::map<unsigned int>(this, (uint64_t *)(a1 + 16), v4 >> 2);
  internal::marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(void *)(a1 + 24) = v4 >> 2;
  return internal::marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t internal::marisa::grimoire::io::Mapper::map<unsigned int>(internal::marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x20000001FLL;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:31: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 62)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x700000020;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:32: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  uint64_t result = internal::marisa::grimoire::io::Mapper::map_data(a1, 4 * a3);
  *a2 = result;
  return result;
}

void *internal::marisa::grimoire::vector::FlatVector::map_(internal::marisa::grimoire::vector::FlatVector *this, internal::marisa::grimoire::io::Mapper *a2)
{
  internal::marisa::grimoire::vector::Vector<unsigned long long>::map((long long *)this, a2);
  uint64_t v4 = *(unsigned int *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  if (v4 >= 0x21)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/flat-vector.h";
    exception[2] = 0xA00000084;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/fla"
                   "t-vector.h:132: MARISA_FORMAT_ERROR: temp_value_size > 32";
  }
  *((void *)this + 6) = v4;
  *((_DWORD *)this + 14) = *(_DWORD *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  uint64_t result = (void *)internal::marisa::grimoire::io::Mapper::map_data(a2, 8uLL);
  *((void *)this + 8) = *result;
  return result;
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned long long>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2 = a2;
  long long v3 = result;
  unint64_t v4 = result[4];
  if (v4 < a2)
  {
    uint64_t v5 = 2 * v4;
    if (v4 >> 60) {
      uint64_t v5 = 0x1FFFFFFFFFFFFFFFLL;
    }
    if (v4 > a2 >> 1) {
      a2 = v5;
    }
    uint64_t result = internal::marisa::grimoire::vector::Vector<unsigned long long>::realloc(result, a2);
  }
  v3[3] = v2;
  return result;
}

void internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::resize(uint64_t *a1, unint64_t a2)
{
  unint64_t v2 = a2;
  unint64_t v4 = a1[4];
  if (v4 < a2)
  {
    uint64_t v5 = 2 * v4;
    if (v4 > 0xAAAAAAAAAAAAAAALL) {
      uint64_t v5 = 0x1555555555555555;
    }
    if (v4 > a2 >> 1) {
      a2 = v5;
    }
    internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::realloc(a1, a2);
  }
  unint64_t v6 = a1[3];
  if (v2 > v6) {
    bzero((void *)(a1[1] + 12 * v6), 12 * (v2 - v6));
  }
  a1[3] = v2;
}

_DWORD *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::realloc(uint64_t *a1, uint64_t a2)
{
  uint64_t result = operator new[](12 * a2, MEMORY[0x1E4FBA2D0]);
  uint64_t v5 = a1[3];
  if (v5)
  {
    unint64_t v6 = (uint64_t *)a1[1];
    uint64_t v7 = result;
    do
    {
      uint64_t v8 = *v6;
      v7[2] = *((_DWORD *)v6 + 2);
      *(void *)uint64_t v7 = v8;
      v7 += 3;
      unint64_t v6 = (uint64_t *)((char *)v6 + 12);
      --v5;
    }
    while (v5);
  }
  uint64_t v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
  {
    JUMPOUT(0x192FAF290);
  }
  return result;
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned int>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2 = a2;
  long long v3 = result;
  unint64_t v4 = result[4];
  if (v4 < a2)
  {
    uint64_t v5 = 2 * v4;
    if (v4 >> 61) {
      uint64_t v5 = 0x3FFFFFFFFFFFFFFFLL;
    }
    if (v4 > a2 >> 1) {
      a2 = v5;
    }
    uint64_t result = (uint64_t *)internal::marisa::grimoire::vector::Vector<unsigned int>::realloc(result, a2);
  }
  v3[3] = v2;
  return result;
}

_DWORD *internal::marisa::grimoire::vector::Vector<unsigned int>::realloc(uint64_t *a1, uint64_t a2)
{
  uint64_t result = operator new[](4 * a2, MEMORY[0x1E4FBA2D0]);
  uint64_t v5 = a1[3];
  if (v5)
  {
    unint64_t v6 = (int *)a1[1];
    uint64_t v7 = result;
    do
    {
      int v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  uint64_t v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
  {
    JUMPOUT(0x192FAF290);
  }
  return result;
}

uint64_t internal::marisa::grimoire::vector::BitVector::write_(internal::marisa::grimoire::vector::BitVector *this, internal::marisa::grimoire::io::Writer *a2)
{
  internal::marisa::grimoire::vector::Vector<unsigned long long>::write_((uint64_t)this, a2);
  int __buf = *((void *)this + 6);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  int v5 = *((void *)this + 7);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&v5, 4uLL);
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::write_((uint64_t)this + 64, a2);
  internal::marisa::grimoire::vector::Vector<unsigned int>::write_((uint64_t)this + 112, a2);
  return internal::marisa::grimoire::vector::Vector<unsigned int>::write_((uint64_t)this + 160, a2);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned long long>::write_(uint64_t a1, internal::marisa::grimoire::io::Writer *this)
{
  uint64_t __buf = 8 * *(void *)(a1 + 24);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  internal::marisa::grimoire::io::Writer::write<unsigned long long>((uint64_t)this, *(char **)(a1 + 16), *(void *)(a1 + 24));
  return internal::marisa::grimoire::io::Writer::seek((uint64_t)this, 0);
}

uint64_t internal::marisa::grimoire::io::Writer::write<unsigned long long>(uint64_t a1, char *a2, unint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x200000021;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:33: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_9;
  }
  if (a3 >> 61)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x700000022;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:34: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_9:
    exception[3] = v6;
  }
  size_t v3 = 8 * a3;
  return internal::marisa::grimoire::io::Writer::write_data(a1, a2, v3);
}

uint64_t internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::write_(uint64_t a1, internal::marisa::grimoire::io::Writer *this)
{
  uint64_t __buf = 12 * *(void *)(a1 + 24);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  internal::marisa::grimoire::io::Writer::write<internal::marisa::grimoire::vector::RankIndex>((uint64_t)this, *(char **)(a1 + 16), *(void *)(a1 + 24));
  return internal::marisa::grimoire::io::Writer::seek((uint64_t)this, 4 * (*(_DWORD *)(a1 + 24) & 1));
}

uint64_t internal::marisa::grimoire::io::Writer::write<internal::marisa::grimoire::vector::RankIndex>(uint64_t a1, char *a2, unint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x200000021;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:33: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_9;
  }
  if (a3 >= 0x1555555555555556)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x700000022;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:34: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_9:
    exception[3] = v6;
  }
  size_t v3 = 12 * a3;
  return internal::marisa::grimoire::io::Writer::write_data(a1, a2, v3);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned int>::write_(uint64_t a1, internal::marisa::grimoire::io::Writer *this)
{
  uint64_t __buf = 4 * *(void *)(a1 + 24);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  internal::marisa::grimoire::io::Writer::write<unsigned int>((uint64_t)this, *(char **)(a1 + 16), *(void *)(a1 + 24));
  return internal::marisa::grimoire::io::Writer::seek((uint64_t)this, 4 * (*(_DWORD *)(a1 + 24) & 1));
}

uint64_t internal::marisa::grimoire::io::Writer::write<unsigned int>(uint64_t a1, char *a2, unint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x200000021;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:33: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_9;
  }
  if (a3 >> 62)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x700000022;
    unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:34: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_9:
    exception[3] = v6;
  }
  size_t v3 = 4 * a3;
  return internal::marisa::grimoire::io::Writer::write_data(a1, a2, v3);
}

uint64_t internal::marisa::grimoire::vector::FlatVector::write_(internal::marisa::grimoire::vector::FlatVector *this, internal::marisa::grimoire::io::Writer *a2)
{
  internal::marisa::grimoire::vector::Vector<unsigned long long>::write_((uint64_t)this, a2);
  LODWORD(__buf) = *((void *)this + 6);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  LODWORD(__buf) = *((_DWORD *)this + 14);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  uint64_t __buf = *((void *)this + 8);
  return internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 8uLL);
}

void *std::string::__init_with_size[abi:ne180100]<std::reverse_iterator<std::__wrap_iter<char const*>>,std::reverse_iterator<std::__wrap_iter<char const*>>>(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  unint64_t v6 = result;
  if (a6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a6 > 0x16)
  {
    uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a6 | 7) != 0x17) {
      uint64_t v10 = a6 | 7;
    }
    uint64_t v11 = v10 + 1;
    uint64_t result = operator new(v10 + 1);
    v6[1] = a6;
    v6[2] = v11 | 0x8000000000000000;
    *unint64_t v6 = result;
    unint64_t v6 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a6;
  }
  while (a3 != a5)
  {
    char v12 = *(unsigned char *)--a3;
    *(unsigned char *)unint64_t v6 = v12;
    unint64_t v6 = (void *)((char *)v6 + 1);
  }
  *(unsigned char *)unint64_t v6 = 0;
  return result;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x192FAF2C0);
}

char *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::realloc(uint64_t *a1, uint64_t a2)
{
  uint64_t result = (char *)operator new[](24 * a2, MEMORY[0x1E4FBA2D0]);
  uint64_t v5 = a1[3];
  if (v5)
  {
    unint64_t v6 = (_DWORD *)(a1[1] + 16);
    uint64_t v7 = result + 16;
    do
    {
      *((void *)v7 - 2) = *((void *)v6 - 2);
      *(v7 - 2) = *(v6 - 2);
      *(v7 - 1) = *(v6 - 1);
      int v8 = *v6;
      v6 += 6;
      *uint64_t v7 = v8;
      v7 += 6;
      --v5;
    }
    while (v5);
  }
  uint64_t v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
  {
    JUMPOUT(0x192FAF290);
  }
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_current_trie<internal::marisa::grimoire::trie::Key>(uint64_t *a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a2 + 24);
  unint64_t v10 = *(void *)(a2 + 8);
  if (v9)
  {
    uint64_t v11 = 0;
    char v12 = (_DWORD *)(v10 + 16);
    do
    {
      *char v12 = v11;
      v12 += 6;
      ++v11;
    }
    while (v9 != v11);
  }
  unint64_t v13 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v10, v10 + 24 * v9, 0);
  uint64_t v14 = 256;
  if (a5 != 1) {
    uint64_t v14 = 1;
  }
  do
  {
    unint64_t v15 = v14;
    v14 *= 2;
  }
  while (v15 < v13 / *(unsigned int *)(a4 + 8));
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::resize(a1 + 126, v15);
  a1[132] = v15 - 1;
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 1);
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
  unint64_t v16 = a1 + 78;
  LOBYTE(v84[0]) = 0;
  internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(a1 + 78, v84);
  unint64_t v77 = a1 + 52;
  internal::marisa::grimoire::vector::BitVector::push_back(a1 + 52, 0);
  uint64_t v72 = a5;
  memset(v84, 0, 41);
  long long v83 = 0u;
  memset(v82, 0, sizeof(v82));
  long long v80 = 0u;
  memset(v81, 0, 25);
  v78.n128_u64[0] = *(void *)(a2 + 24) << 32;
  v78.n128_u32[2] = 0;
  std::deque<internal::marisa::grimoire::trie::Range>::push_back(v82, (uint64_t *)&v78);
  uint64_t v17 = *((void *)&v83 + 1);
  if (*((void *)&v83 + 1))
  {
    uint64_t v73 = a1 + 78;
    do
    {
      uint64_t v18 = a1[58];
      uint64_t v19 = (unsigned int *)(*(void *)(*((void *)&v82[0] + 1) + 8 * ((unint64_t)v83 / 0x155))
                           + 12 * ((unint64_t)v83 % 0x155));
      uint64_t v20 = *v19;
      unint64_t v21 = v19[1];
      uint64_t v22 = v19[2];
      *(void *)&long long v83 = v83 + 1;
      *((void *)&v83 + 1) = v17 - 1;
      if ((unint64_t)v83 >= 0x2AA)
      {
        uint64_t v23 = v18;
        operator delete(**((void ***)&v82[0] + 1));
        uint64_t v18 = v23;
        *((void *)&v82[0] + 1) += 8;
        *(void *)&long long v83 = v83 - 341;
      }
      uint64_t v76 = v17;
      uint64_t v24 = v18 - v17;
      if (v20 < v21)
      {
        while (1)
        {
          uint64_t v25 = *(void *)(a2 + 8);
          if (*(_DWORD *)(v25 + 24 * v20 + 8) != v22) {
            break;
          }
          *(_DWORD *)(v25 + 24 * v20 + 12) = v24;
          uint64_t v20 = (v20 + 1);
          if (v21 == v20) {
            goto LABEL_49;
          }
        }
      }
      if (v20 != v21)
      {
        uint64_t v75 = v18;
        uint64_t v26 = v80;
        long long v80 = 0u;
        memset(v81, 0, 25);
        if (v26) {
          MEMORY[0x192FAF290](v26, 0x1000C8077774924);
        }
        uint64_t v27 = *(void *)(a2 + 8);
        double v28 = *(float *)(v27 + 24 * v20 + 12);
        uint64_t v29 = v20 + 1;
        if (v20 + 1 < v21)
        {
          uint64_t v30 = 24 * v20;
          uint64_t v31 = (v20 << 32) + 0x100000000;
          do
          {
            if (*(unsigned __int8 *)(*(void *)(v27 + v30) + v22) != *(unsigned __int8 *)(*(void *)(v27 + v30 + 24)
                                                                                          + v22))
            {
              *(float *)&unsigned int v32 = v28;
              v78.n128_u64[0] = v31 + v20;
              v78.n128_u64[1] = v22 | ((unint64_t)v32 << 32);
              internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
              uint64_t v27 = *(void *)(a2 + 8);
              double v28 = 0.0;
              LODWORD(v20) = v29;
            }
            double v28 = v28 + *(float *)(v27 + v30 + 36);
            ++v29;
            v30 += 24;
            v31 += 0x100000000;
          }
          while (v21 != v29);
        }
        *(float *)&unsigned int v33 = v28;
        v78.n128_u32[0] = v20;
        v78.n128_u32[1] = v21;
        v78.n128_u64[1] = v22 | ((unint64_t)v33 << 32);
        __n128 v34 = internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
        unint64_t v16 = a1 + 78;
        uint64_t v35 = v75;
        if (*(_DWORD *)(a4 + 16) == 0x20000)
        {
          unint64_t v36 = (__n128 *)*((void *)&v80 + 1);
          unint64_t v37 = v81[1];
          if (v81[1] < 129)
          {
            unsigned __int8 v38 = 0;
            uint64_t v40 = 0;
          }
          else
          {
            unsigned __int8 v38 = (__n128 *)std::get_temporary_buffer[abi:ne180100]<internal::marisa::grimoire::trie::WeightedRange>(v81[1]);
            uint64_t v40 = v39;
          }
          std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(v36, &v36[v37], (uint64_t)&v78, v37, v38, v40, v34);
          if (v38) {
            operator delete(v38);
          }
          uint64_t v35 = v75;
        }
        uint64_t v41 = v81[1];
        if (v35 == v76) {
          a1[133] = v81[1];
        }
        if (v41)
        {
          unint64_t v42 = 0;
          do
          {
            uint64_t v43 = (unsigned int *)(*((void *)&v80 + 1) + 16 * v42);
            uint64_t v44 = (uint64_t *)v43;
            uint64_t v45 = v43[2];
            unsigned int v46 = *v43;
            uint64_t v47 = *(void *)(a2 + 8);
            unint64_t v48 = *(unsigned int *)(v47 + 24 * *v43 + 8);
            unint64_t v49 = v45 + 1;
            if (v45 + 1 >= v48)
            {
              unint64_t v50 = v43[2];
              LODWORD(v48) = v45 + 1;
            }
            else
            {
              unint64_t v50 = v48 - 1;
              unint64_t v51 = v43[2];
              do
              {
                unint64_t v52 = v51;
                unint64_t v51 = v49;
                unint64_t v53 = (uint64_t *)(v47 + 24 * v46);
                uint64_t v54 = *v43;
                while (++v54 < (unint64_t)v43[1])
                {
                  uint64_t v55 = *v53;
                  uint64_t v56 = v53[3];
                  v53 += 3;
                  if (*(unsigned __int8 *)(v55 + v51) != *(unsigned __int8 *)(v56 + v51))
                  {
                    unint64_t v50 = v52;
                    LODWORD(v48) = v51;
                    goto LABEL_43;
                  }
                }
                unint64_t v49 = v51 + 1;
              }
              while (v51 + 1 != v48);
            }
LABEL_43:
            float v58 = *((float *)v43 + 3);
            uint64_t v57 = v43 + 3;
            float v59 = v58;
            uint64_t v60 = ((32 * v24) ^ v24 ^ *(unsigned __int8 *)(*(void *)(v47 + 24 * v46) + v45)) & a1[132];
            uint64_t v61 = a1[127];
            uint64_t v62 = v61 + 12 * v60;
            float v64 = *(float *)(v62 + 8);
            unint64_t v63 = (float *)(v62 + 8);
            if (v64 < v59)
            {
              uint64_t v65 = a1[81];
              uint64_t v66 = (_DWORD *)(v61 + 12 * v60);
              *uint64_t v66 = v24;
              v66[1] = v65;
              *unint64_t v63 = v59;
              uint64_t v45 = *((unsigned int *)v44 + 2);
            }
            if (v50 == v45)
            {
              v78.n128_u8[0] = *(unsigned char *)(*(void *)(*(void *)(a2 + 8) + 24 * *(unsigned int *)v44) + v50);
              internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(v73, &v78);
              internal::marisa::grimoire::vector::BitVector::push_back(v77, 0);
            }
            else
            {
              v78.n128_u8[0] = 0;
              internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(v73, &v78);
              internal::marisa::grimoire::vector::BitVector::push_back(v77, 1);
              __n128 v78 = 0uLL;
              int v79 = 0;
              uint64_t v67 = *((unsigned int *)v44 + 2);
              v78.n128_u64[0] = *(void *)(*(void *)(a2 + 8) + 24 * *(unsigned int *)v44) + v67;
              v78.n128_u64[1] = (v48 - v67);
              v78.n128_u32[3] = *v57;
              internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::push_back((uint64_t *)v84, (uint64_t)&v78);
            }
            *((_DWORD *)v44 + 2) = v48;
            std::deque<internal::marisa::grimoire::trie::Range>::push_back(v82, v44);
            internal::marisa::grimoire::vector::BitVector::push_back(a1, 1);
            ++v42;
          }
          while (v42 < v81[1]);
        }
      }
LABEL_49:
      internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
      uint64_t v17 = *((void *)&v83 + 1);
    }
    while (*((void *)&v83 + 1));
  }
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
  internal::marisa::grimoire::vector::BitVector::build((internal::marisa::grimoire::vector::BitVector *)a1, v72 == 1, 1);
  internal::marisa::grimoire::vector::Vector<unsigned char>::shrink(v16);
  internal::marisa::grimoire::trie::LoudsTrie::build_terminals<internal::marisa::grimoire::trie::Key>((uint64_t)a1, a2, a3);
  long long v68 = *(_OWORD *)a2;
  *(_OWORD *)a2 = v84[0];
  v84[0] = v68;
  uint64_t v69 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = *(void *)&v84[1];
  *(void *)&v84[1] = v69;
  long long v70 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)((char *)&v84[1] + 8);
  *(_OWORD *)((char *)&v84[1] + 8) = v70;
  LOBYTE(v69) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a2 + 40) = BYTE8(v84[2]);
  BYTE8(v84[2]) = v69;
  if ((void)v80) {
    MEMORY[0x192FAF290](v80, 0x1000C8077774924);
  }
  std::deque<internal::marisa::grimoire::trie::Range>::~deque[abi:ne180100](v82);
  uint64_t result = *(void *)&v84[0];
  if (*(void *)&v84[0]) {
    return MEMORY[0x192FAF290](*(void *)&v84[0], 0x1000C8077774924);
  }
  return result;
}

void sub_18E656B98(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, ...)
{
  va_start(va, a18);
  if (a13) {
    MEMORY[0x192FAF290](a13, 0x1000C8077774924);
  }
  std::deque<internal::marisa::grimoire::trie::Range>::~deque[abi:ne180100]((uint64_t *)va);
  uint64_t v21 = *(void *)(v18 - 144);
  if (v21) {
    MEMORY[0x192FAF290](v21, 0x1000C8077774924);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds-trie.cc";
    exception[2] = 0x8000001D3;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds"
                   "-trie.cc:467: MARISA_MEMORY_ERROR: std::bad_alloc";
  }
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::vector::FlatVector::build(long long *a1, uint64_t a2)
{
  memset(v9, 0, 41);
  uint64_t v10 = 0;
  int v11 = 0;
  uint64_t v12 = 0;
  internal::marisa::grimoire::vector::FlatVector::build_((uint64_t)v9, a2);
  long long v3 = *a1;
  *a1 = v9[0];
  v9[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v9[1];
  *(void *)&v9[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v9[1] + 8);
  *(_OWORD *)((char *)&v9[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v9[2]);
  BYTE8(v9[2]) = v4;
  uint64_t v6 = *((void *)a1 + 6);
  *((void *)a1 + 6) = v10;
  uint64_t v10 = v6;
  LODWORD(v6) = *((_DWORD *)a1 + 14);
  *((_DWORD *)a1 + 14) = v11;
  int v11 = v6;
  uint64_t v7 = *((void *)a1 + 8);
  *((void *)a1 + 8) = v12;
  uint64_t result = v3;
  uint64_t v12 = v7;
  if ((void)v3) {
    return MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_18E656D8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(uint64_t *result, unsigned char *a2)
{
  long long v3 = result;
  uint64_t v4 = result[3];
  uint64_t v5 = result[4];
  size_t v6 = v4 + 1;
  if (v5 < (unint64_t)(v4 + 1))
  {
    uint64_t v7 = 2 * v5;
    if (v5 < 0) {
      uint64_t v7 = -1;
    }
    if (v5 <= v6 >> 1) {
      size_t v8 = v6;
    }
    else {
      size_t v8 = v7;
    }
    uint64_t result = (uint64_t *)internal::marisa::grimoire::vector::Vector<unsigned char>::realloc(result, v8);
    uint64_t v4 = v3[3];
  }
  *(unsigned char *)(v3[1] + v4) = *a2;
  ++v3[3];
  return result;
}

__n128 internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::push_back(uint64_t *a1, __n128 *a2)
{
  uint64_t v4 = a1[3];
  unint64_t v5 = a1[4];
  unint64_t v6 = v4 + 1;
  if (v5 < v4 + 1)
  {
    uint64_t v7 = 2 * v5;
    if (v5 >> 59) {
      uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
    }
    if (v5 <= v6 >> 1) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = v7;
    }
    internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::realloc(a1, v8);
    uint64_t v4 = a1[3];
  }
  __n128 result = *a2;
  *(__n128 *)(a1[1] + 16 * v4) = *a2;
  ++a1[3];
  return result;
}

uint64_t *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::push_back(uint64_t *result, uint64_t a2)
{
  long long v3 = result;
  uint64_t v4 = result[3];
  unint64_t v5 = result[4];
  unint64_t v6 = v4 + 1;
  if (v5 < v4 + 1)
  {
    uint64_t v7 = 2 * v5;
    if (v5 > 0x555555555555555) {
      uint64_t v7 = 0xAAAAAAAAAAAAAAALL;
    }
    if (v5 <= v6 >> 1) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = v7;
    }
    __n128 result = (uint64_t *)internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::realloc(result, v8);
    uint64_t v4 = v3[3];
  }
  uint64_t v9 = v3[1] + 24 * v4;
  *(void *)uint64_t v9 = *(void *)a2;
  *(_DWORD *)(v9 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(v9 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(v9 + 16) = *(_DWORD *)(a2 + 16);
  ++v3[3];
  return result;
}

unsigned char *internal::marisa::grimoire::vector::Vector<unsigned char>::shrink(unsigned char *result)
{
  if (result[40])
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0x100000072;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:114: MARISA_STATE_ERROR: fixed_";
  }
  size_t v1 = *((void *)result + 3);
  if (v1 != *((void *)result + 4))
  {
    return internal::marisa::grimoire::vector::Vector<unsigned char>::realloc((uint64_t *)result, v1);
  }
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_terminals<internal::marisa::grimoire::trie::Key>(uint64_t a1, uint64_t a2, long long *a3)
{
  memset(v13, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned int>::resize((uint64_t *)v13, *(void *)(a2 + 24));
  uint64_t v5 = *(void *)(a2 + 24);
  if (v5)
  {
    uint64_t v6 = *((void *)&v13[0] + 1);
    uint64_t v7 = (unsigned int *)(*(void *)(a2 + 16) + 16);
    do
    {
      *(_DWORD *)(v6 + 4 * *v7) = *(v7 - 1);
      v7 += 6;
      --v5;
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = *((void *)&v13[0] + 1);
  }
  long long v8 = *a3;
  uint64_t v9 = *(void *)&v13[1];
  *(void *)a3 = *(void *)&v13[0];
  *((void *)a3 + 1) = v6;
  v13[0] = v8;
  uint64_t v10 = *((void *)a3 + 2);
  *((void *)a3 + 2) = v9;
  *(void *)&v13[1] = v10;
  long long v11 = *(long long *)((char *)a3 + 24);
  *(long long *)((char *)a3 + 24) = *(_OWORD *)((char *)&v13[1] + 8);
  *(_OWORD *)((char *)&v13[1] + 8) = v11;
  LOBYTE(v10) = *((unsigned char *)a3 + 40);
  *((unsigned char *)a3 + 40) = BYTE8(v13[2]);
  uint64_t result = v8;
  BYTE8(v13[2]) = v10;
  if ((void)v8) {
    return MEMORY[0x192FAF290](v8, 0x1000C8077774924);
  }
  return result;
}

void sub_18E6570A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4 = a2;
  unint64_t v5 = a1;
  uint64_t v6 = a2 - a1;
  if ((uint64_t)(a2 - a1) < 241)
  {
    uint64_t v7 = 0;
    goto LABEL_69;
  }
  uint64_t v7 = 0;
  do
  {
    int v8 = internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::Key>(v5, v5 + 24 * (v6 / 0x30uLL), v4 - 24, a3);
    int v9 = v8;
    unint64_t v10 = v5;
    unint64_t v11 = v4;
    unint64_t v12 = v5;
    unint64_t v13 = v4;
    while (v10 < v11)
    {
      unint64_t v14 = *(unsigned int *)(v10 + 8);
      int v15 = a3 >= v14 ? -1 : *(unsigned __int8 *)(*(void *)v10 + a3);
      if (v15 > v8) {
        break;
      }
      if (v15 == v8)
      {
        uint64_t v16 = *(void *)v10;
        *(void *)unint64_t v10 = *(void *)v12;
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(v12 + 8);
        uint64_t v17 = *(void *)(v10 + 12);
        *(_DWORD *)(v10 + 12) = *(_DWORD *)(v12 + 12);
        *(_DWORD *)(v10 + 16) = *(_DWORD *)(v12 + 16);
        *(void *)unint64_t v12 = v16;
        *(_DWORD *)(v12 + 8) = v14;
        *(void *)(v12 + 12) = v17;
        v12 += 24;
      }
LABEL_11:
      v10 += 24;
    }
    if (v10 < v11)
    {
      unint64_t v18 = v11 - 24;
      do
      {
        unint64_t v11 = v18;
        unint64_t v19 = *(unsigned int *)(v18 + 8);
        if (a3 >= v19) {
          int v20 = -1;
        }
        else {
          int v20 = *(unsigned __int8 *)(*(void *)v11 + a3);
        }
        if (v20 < v8) {
          break;
        }
        if (v20 == v8)
        {
          uint64_t v21 = *(void *)(v13 - 24);
          v13 -= 24;
          uint64_t v22 = *(void *)v11;
          *(void *)unint64_t v11 = v21;
          *(_DWORD *)(v11 + 8) = *(_DWORD *)(v13 + 8);
          uint64_t v23 = *(void *)(v11 + 12);
          *(_DWORD *)(v11 + 12) = *(_DWORD *)(v13 + 12);
          *(_DWORD *)(v11 + 16) = *(_DWORD *)(v13 + 16);
          *(void *)unint64_t v13 = v22;
          *(_DWORD *)(v13 + 8) = v19;
          *(void *)(v13 + 12) = v23;
        }
        unint64_t v18 = v11 - 24;
      }
      while (v10 < v11);
    }
    if (v10 < v11)
    {
      uint64_t v24 = *(void *)v10;
      int v25 = *(_DWORD *)(v10 + 16);
      *(void *)unint64_t v10 = *(void *)v11;
      uint64_t v26 = *(void *)(v10 + 8);
      *(_DWORD *)(v10 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v10 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v10 + 16) = *(_DWORD *)(v11 + 16);
      *(void *)unint64_t v11 = v24;
      *(void *)(v11 + 8) = v26;
      *(_DWORD *)(v11 + 16) = v25;
      goto LABEL_11;
    }
    uint64_t v44 = v7;
    if (v12 > v5)
    {
      uint64_t v27 = 0;
      do
      {
        uint64_t v28 = v12 + v27;
        uint64_t v29 = v10 + v27;
        uint64_t v30 = *(void *)(v12 + v27 - 24);
        int v31 = *(_DWORD *)(v12 + v27 - 8);
        *(void *)(v28 - 24) = *(void *)(v10 + v27 - 24);
        uint64_t v32 = *(void *)(v12 + v27 - 16);
        *(_DWORD *)(v28 - 16) = *(_DWORD *)(v10 + v27 - 16);
        *(_DWORD *)(v28 - 12) = *(_DWORD *)(v10 + v27 - 12);
        *(_DWORD *)(v28 - 8) = *(_DWORD *)(v10 + v27 - 8);
        *(void *)(v29 - 24) = v30;
        *(void *)(v29 - 16) = v32;
        *(_DWORD *)(v29 - 8) = v31;
        v27 -= 24;
      }
      while (v12 + v27 > v5);
      v10 += v27;
    }
    while (v13 < v4)
    {
      uint64_t v33 = *(void *)v13;
      int v34 = *(_DWORD *)(v13 + 16);
      *(void *)unint64_t v13 = *(void *)v11;
      uint64_t v35 = *(void *)(v13 + 8);
      *(_DWORD *)(v13 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v13 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v13 + 16) = *(_DWORD *)(v11 + 16);
      *(void *)unint64_t v11 = v33;
      *(void *)(v11 + 8) = v35;
      *(_DWORD *)(v11 + 16) = v34;
      v11 += 24;
      v13 += 24;
    }
    uint64_t v36 = v10 - v5;
    int64_t v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - v5) >> 3);
    uint64_t v38 = v11 - v10;
    int64_t v39 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v10) >> 3);
    if (v37 <= v39)
    {
      uint64_t v40 = v4 - v11;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)) <= v39)
      {
        if (v36 == 24)
        {
          uint64_t v41 = v44 + 1;
        }
        else
        {
          if (v36 < 25) {
            goto LABEL_53;
          }
          uint64_t v41 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v5, v10, a3)+ v44;
        }
        uint64_t v44 = v41;
LABEL_53:
        if (v40 == 24)
        {
          uint64_t v7 = v44 + 1;
        }
        else if (v40 < 25)
        {
          uint64_t v7 = v44;
        }
        else
        {
          uint64_t v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v11, v4, a3)+ v44;
        }
        if (v38 == 24)
        {
          ++v7;
        }
        else if (v38 >= 25)
        {
          if (v9 == -1)
          {
            ++v7;
            unint64_t v5 = v11;
            goto LABEL_64;
          }
          ++a3;
        }
        unint64_t v5 = v10;
LABEL_64:
        unint64_t v4 = v11;
        goto LABEL_65;
      }
    }
    if (v38 == 24) {
      goto LABEL_32;
    }
    if (v38 < 25)
    {
      uint64_t v7 = v44;
    }
    else if (v8 == -1)
    {
LABEL_32:
      uint64_t v7 = v44 + 1;
    }
    else
    {
      uint64_t v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v10, v11, a3 + 1)+ v44;
    }
    uint64_t v42 = v4 - v11;
    if (v37 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)))
    {
      if (v42 == 24)
      {
        ++v7;
      }
      else if (v42 >= 25)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v11, v4, a3);
      }
      unint64_t v4 = v10;
    }
    else
    {
      if (v36 == 24)
      {
        ++v7;
      }
      else if (v36 >= 25)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v5, v10, a3);
      }
      unint64_t v5 = v11;
    }
LABEL_65:
    uint64_t v6 = v4 - v5;
  }
  while ((uint64_t)(v4 - v5) > 240);
LABEL_69:
  if (v6 >= 25) {
    v7 += internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::Key *>(v5, v4, a3);
  }
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::Key>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (*(unsigned int *)(a1 + 8) <= a4) {
    int v4 = -1;
  }
  else {
    int v4 = *(unsigned __int8 *)(*(void *)a1 + a4);
  }
  if (*(unsigned int *)(a2 + 8) <= a4) {
    int v5 = -1;
  }
  else {
    int v5 = *(unsigned __int8 *)(*(void *)a2 + a4);
  }
  if (*(unsigned int *)(a3 + 8) <= a4) {
    int v6 = -1;
  }
  else {
    int v6 = *(unsigned __int8 *)(*(void *)a3 + a4);
  }
  if (v4 <= v5) {
    int v7 = v5;
  }
  else {
    int v7 = v4;
  }
  if (v4 >= v5) {
    int v4 = v5;
  }
  if (v4 <= v6) {
    int v4 = v6;
  }
  if (v7 >= v6) {
    return v4;
  }
  else {
    return v7;
  }
}

uint64_t internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::Key *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a1 + 24;
  if (a1 + 24 >= a2) {
    return 1;
  }
  uint64_t v7 = 1;
  do
  {
    uint64_t v8 = v3;
    if (v3 <= a1)
    {
      int v10 = 0;
    }
    else
    {
      while (1)
      {
        unint64_t v9 = v8 - 24;
        int v10 = internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::Key>(v8 - 24, v8, a3);
        if (v10 < 1) {
          break;
        }
        uint64_t v11 = *(void *)(v8 - 24);
        int v12 = *(_DWORD *)(v8 - 8);
        *(void *)(v8 - 24) = *(void *)v8;
        uint64_t v13 = *(void *)(v8 + 8);
        *(_DWORD *)(v8 - 8) = *(_DWORD *)(v8 + 16);
        *(void *)uint64_t v8 = v11;
        uint64_t v14 = *(void *)(v8 - 16);
        *(void *)(v8 - 16) = v13;
        *(void *)(v8 + 8) = v14;
        *(_DWORD *)(v8 + 16) = v12;
        v8 -= 24;
        if (v9 <= a1)
        {
          int v10 = 1;
          break;
        }
      }
    }
    if (v10) {
      ++v7;
    }
    v3 += 24;
  }
  while (v3 < a2);
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::Key>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = *(unsigned int *)(a1 + 8);
  uint64_t v4 = *(unsigned int *)(a2 + 8);
  unint64_t v5 = v3 - a3;
  if (v3 <= a3)
  {
LABEL_6:
    if (v3 < v4) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v3 == v4) {
      return 0;
    }
    else {
      return v12;
    }
  }
  else
  {
    uint64_t v6 = v4 - a3;
    uint64_t v7 = (unsigned __int8 *)(*(void *)a1 + a3);
    uint64_t v8 = (unsigned __int8 *)(*(void *)a2 + a3);
    while (v6)
    {
      int v9 = *v7;
      int v10 = *v8;
      uint64_t result = (v9 - v10);
      if (v9 != v10) {
        return result;
      }
      --v6;
      ++v7;
      ++v8;
      if (!--v5) {
        goto LABEL_6;
      }
    }
    return 1;
  }
}

unsigned char *internal::marisa::grimoire::vector::Vector<unsigned char>::realloc(uint64_t *a1, size_t __sz)
{
  uint64_t result = operator new[](__sz, MEMORY[0x1E4FBA2D0]);
  uint64_t v5 = a1[3];
  if (v5)
  {
    uint64_t v6 = (char *)a1[1];
    uint64_t v7 = result;
    do
    {
      char v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  uint64_t v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = __sz;
  if (v9)
  {
    JUMPOUT(0x192FAF290);
  }
  return result;
}

void std::deque<internal::marisa::grimoire::trie::Range>::push_back(void *a1, uint64_t *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 341 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<internal::marisa::grimoire::trie::Range>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x155)) + 12 * (v7 % 0x155);
  uint64_t v9 = *a2;
  *(_DWORD *)(v8 + 8) = *((_DWORD *)a2 + 2);
  *(void *)unint64_t v8 = v9;
  ++a1[5];
}

void std::deque<internal::marisa::grimoire::trie::Range>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x155;
  unint64_t v4 = v2 - 341;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)unint64_t v8 = v10;
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
      int v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      int64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        uint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)uint64_t v41 = v42;
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
    unint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    unint64_t v8 = &v19[v20];
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
      *(void *)&long long v54 = operator new(0xFFCuLL);
      std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xFFCuLL);
    std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_front((uint64_t)a1, &v54);
    uint64_t v44 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
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
      int v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      int64_t v37 = &v34[8 * v47];
      unint64_t v48 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        unint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
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
      uint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        unint64_t v8 = (char *)a1[2];
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
  uint64_t v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  unint64_t v53 = operator new(0xFFCuLL);
  std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_back(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_front((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_18E657B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    unint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      unint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
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
      uint64_t v17 = &v6[8 * v13];
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
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(a1[4], v16);
      unint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v22 = 8 * (v21 >> 3);
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
      unint64_t v25 = (char *)*a1;
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
      unint64_t v7 = v6 >> 3;
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

void std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    unint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
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
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
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

  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    unint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = (v7 - v4) >> 2;
      }
      unint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      int64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        int64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
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
      uint64_t v8 = (v7 - v6) >> 3;
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
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

_OWORD *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::realloc(uint64_t *a1, uint64_t a2)
{
  uint64_t result = operator new[](16 * a2, MEMORY[0x1E4FBA2D0]);
  uint64_t v5 = a1[3];
  if (v5)
  {
    uint64_t v6 = (long long *)a1[1];
    unint64_t v7 = result;
    do
    {
      long long v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  uint64_t v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
  {
    JUMPOUT(0x192FAF290);
  }
  return result;
}

void *std::get_temporary_buffer[abi:ne180100]<internal::marisa::grimoire::trie::WeightedRange>(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0x7FFFFFFFFFFFFFFLL) {
    unint64_t v1 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v1 = a1;
  }
  unint64_t v2 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
  while (1)
  {
    uint64_t result = operator new(16 * v1, v2);
    if (result) {
      break;
    }
    BOOL v4 = v1 > 1;
    v1 >>= 1;
    if (!v4) {
      return 0;
    }
  }
  return result;
}

double std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4, __n128 *a5, uint64_t a6, __n128 a7)
{
  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      a7.n128_u32[0] = a2[-1].n128_u32[3];
      if (a7.n128_f32[0] > a1->n128_f32[3])
      {
        a7 = *a1;
        *a1 = a2[-1];
        a2[-1] = a7;
      }
    }
    else if ((uint64_t)a4 > 128)
    {
      unint64_t v13 = a4 >> 1;
      uint64_t v14 = &a1[a4 >> 1];
      unint64_t v15 = a4 >> 1;
      if ((uint64_t)a4 <= a6)
      {
        v17.n128_f64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(a1, v14, a3, v15, a5, a7);
        v18.n128_f64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), &a5[v13], v17);
        a7.n128_u64[0] = std::__merge_move_assign[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*>(a5, &a5[v13], &a5[v13], &a5[a4], a1, v18).n128_u64[0];
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(a1, v14, a3, v15, a5, a6);
        std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), a5, a6);
        a7.n128_u64[0] = std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>((long long *)a1, (long long *)&a1[a4 >> 1], (long long *)a2, a3, a4 >> 1, a4 - (a4 >> 1), (char *)a5, a6, v16).n128_u64[0];
      }
    }
    else
    {
      std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>((uint64_t)a1, (uint64_t)a2);
    }
  }
  return a7.n128_f64[0];
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 16;
    if (result + 16 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result;
      do
      {
        float v5 = *(float *)(v4 + 28);
        float v6 = *(float *)(v4 + 12);
        uint64_t v4 = v2;
        if (v5 > v6)
        {
          uint64_t v10 = *(void *)v2;
          int v11 = *(_DWORD *)(v2 + 8);
          uint64_t v7 = v3;
          while (1)
          {
            *(_OWORD *)(result + v7 + 16) = *(_OWORD *)(result + v7);
            if (!v7) {
              break;
            }
            float v8 = *(float *)(result + v7 - 4);
            v7 -= 16;
            if (v5 <= v8)
            {
              uint64_t v9 = result + v7 + 16;
              goto LABEL_10;
            }
          }
          uint64_t v9 = result;
LABEL_10:
          *(void *)uint64_t v9 = v10;
          *(_DWORD *)(v9 + 8) = v11;
          *(float *)(v9 + 12) = v5;
        }
        uint64_t v2 = v4 + 16;
        v3 += 16;
      }
      while (v4 + 16 != a2);
    }
  }
  return result;
}

double std::__stable_sort_move<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4, __n128 *a5, __n128 a6)
{
  if (a4)
  {
    if (a4 == 2)
    {
      uint64_t v10 = a2 - 1;
      if (a2[-1].n128_f32[3] <= a1->n128_f32[3])
      {
        *a5 = *a1;
        a6 = *v10;
      }
      else
      {
        *a5 = *v10;
        a6 = *a1;
      }
      a5[1] = a6;
    }
    else if (a4 == 1)
    {
      a6 = *a1;
      *a5 = *a1;
    }
    else if ((uint64_t)a4 > 8)
    {
      std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(a1, &a1[a4 >> 1], a3, a4 >> 1, a5, a4 >> 1);
      std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), &a5[a4 >> 1], a4 - (a4 >> 1));
      a6.n128_u64[0] = std::__merge_move_assign[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*>(a1, &a1[a4 >> 1], &a1[a4 >> 1], a2, a5, v12).n128_u64[0];
    }
    else
    {
      a6.n128_u64[0] = std::__insertion_sort_move[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(a1, a2, a5).n128_u64[0];
    }
  }
  return a6.n128_f64[0];
}

__n128 std::__merge_move_assign[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, __n128 result)
{
  while (1)
  {
    if (a1 == a2)
    {
      while (a3 != a4)
      {
        __n128 v8 = *a3++;
        result.n128_u64[0] = v8.n128_u64[0];
        *a5++ = v8;
      }
      return result;
    }
    if (a3 == a4) {
      break;
    }
    if (a3->n128_f32[3] <= a1->n128_f32[3])
    {
      __n128 v7 = *a1++;
      uint64_t result = v7;
    }
    else
    {
      __n128 v6 = *a3++;
      uint64_t result = v6;
    }
    *a5++ = result;
  }
  if (a1 != a2)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t result = a1[v9];
      a5[v9++] = result;
    }
    while (&a1[v9] != a2);
  }
  return result;
}

__n128 std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(long long *a1, long long *a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8, __n128 result)
{
  if (a6)
  {
    uint64_t v10 = a6;
    while (v10 > a8 && a5 > a8)
    {
      if (!a5) {
        return result;
      }
      uint64_t v12 = 0;
      result.n128_u32[0] = *((_DWORD *)a2 + 3);
      uint64_t v13 = -a5;
      while (1)
      {
        uint64_t v14 = &a1[v12];
        if (result.n128_f32[0] > *((float *)&a1[v12] + 3)) {
          break;
        }
        ++v12;
        if (__CFADD__(v13++, 1)) {
          return result;
        }
      }
      uint64_t v16 = -v13;
      uint64_t v39 = a3;
      uint64_t v40 = a8;
      if (-v13 >= v10)
      {
        if (v13 == -1)
        {
          __n128 v43 = (__n128)a1[v12];
          a1[v12] = *a2;
          uint64_t result = v43;
          *a2 = (__int128)v43;
          return result;
        }
        if (v13 > 0) {
          uint64_t v16 = 1 - v13;
        }
        uint64_t v26 = v16 >> 1;
        uint64_t v20 = &a1[(v16 >> 1) + v12];
        uint64_t v19 = a3;
        if (a3 != a2)
        {
          unint64_t v27 = a3 - a2;
          uint64_t v19 = a2;
          do
          {
            unint64_t v28 = v27 >> 1;
            uint64_t v29 = &v19[v27 >> 1];
            float v30 = *((float *)v29 + 3);
            long long v31 = v29 + 1;
            v27 += ~(v27 >> 1);
            if (v30 > *((float *)v20 + 3)) {
              uint64_t v19 = v31;
            }
            else {
              unint64_t v27 = v28;
            }
          }
          while (v27);
        }
        uint64_t v18 = v19 - a2;
      }
      else
      {
        if (v10 >= 0) {
          uint64_t v17 = v10;
        }
        else {
          uint64_t v17 = v10 + 1;
        }
        uint64_t v18 = v17 >> 1;
        uint64_t v19 = &a2[v17 >> 1];
        uint64_t v20 = a2;
        if (v14 != a2)
        {
          unint64_t v21 = ((char *)a2 - (char *)a1 - v12 * 16) >> 4;
          uint64_t v20 = &a1[v12];
          do
          {
            unint64_t v22 = v21 >> 1;
            uint64_t v23 = &v20[v21 >> 1];
            float v24 = *((float *)v23 + 3);
            unint64_t v25 = v23 + 1;
            v21 += ~(v21 >> 1);
            if (*((float *)v19 + 3) > v24) {
              unint64_t v21 = v22;
            }
            else {
              uint64_t v20 = v25;
            }
          }
          while (v21);
        }
        uint64_t v26 = ((char *)v20 - (char *)a1 - v12 * 16) >> 4;
      }
      a5 = -(v26 + v13);
      uint64_t v32 = v10 - v18;
      uint64_t v33 = v18;
      int v34 = std::__rotate[abi:ne180100]<std::_ClassicAlgPolicy,internal::marisa::grimoire::trie::WeightedRange *,internal::marisa::grimoire::trie::WeightedRange *>((char *)v20, (char *)a2, (char *)v19);
      uint64_t v35 = v33;
      uint64_t v36 = (long long *)v34;
      if (v26 + v35 >= v10 - (v26 + v35) - v13)
      {
        uint64_t v38 = v35;
        std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(v34, v19, v39, a4, a5, v32, a7, v40);
        uint64_t v19 = v20;
        uint64_t v32 = v38;
        a5 = v26;
        a8 = v40;
        a3 = v36;
      }
      else
      {
        uint64_t v37 = v26;
        a8 = v40;
        std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(v14, v20, v34, a4, v37, v35, a7, v40);
        uint64_t v14 = v36;
        a3 = v39;
      }
      uint64_t v10 = v32;
      a1 = v14;
      a2 = v19;
      if (!v32) {
        return result;
      }
    }
    std::__buffered_inplace_merge[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(a1, a2, a3, a4, a5, v10, a7);
  }
  return result;
}

__n128 std::__insertion_sort_move[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, __n128 *a3)
{
  if (a1 != a2)
  {
    __n128 result = *a1;
    *a3 = *a1;
    uint64_t v4 = a1 + 1;
    if (&a1[1] != a2)
    {
      uint64_t v5 = 0;
      __n128 v6 = a3;
      do
      {
        __n128 v7 = a1;
        __n128 v8 = v6;
        a1 = v4;
        uint64_t v9 = ++v6;
        if (v7[1].n128_f32[3] > v8->n128_f32[3])
        {
          *__n128 v6 = *v8;
          uint64_t v9 = a3;
          if (v8 != a3)
          {
            uint64_t v10 = v5;
            while (1)
            {
              uint64_t v9 = (__n128 *)((char *)a3 + v10);
              if (v7[1].n128_f32[3] <= *(float *)((char *)&a3->n128_f32[-1] + v10)) {
                break;
              }
              *uint64_t v9 = v9[-1];
              v10 -= 16;
              if (!v10)
              {
                uint64_t v9 = a3;
                break;
              }
            }
          }
        }
        __n128 result = *a1;
        *uint64_t v9 = *a1;
        uint64_t v4 = a1 + 1;
        v5 += 16;
      }
      while (&a1[1] != a2);
    }
  }
  return result;
}

long long *std::__buffered_inplace_merge[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(long long *result, long long *a2, long long *a3, int a4, uint64_t a5, uint64_t a6, char *__src)
{
  if (a5 <= a6)
  {
    if (result != a2)
    {
      unint64_t v13 = 0;
      do
      {
        *(_OWORD *)&__src[v13] = result[v13 / 0x10];
        v13 += 16;
      }
      while (&result[v13 / 0x10] != a2);
      if (v13)
      {
        uint64_t v14 = (float *)__src;
        while (a2 != a3)
        {
          if (*((float *)a2 + 3) <= v14[3])
          {
            long long v17 = *(_OWORD *)v14;
            v14 += 4;
            long long v16 = v17;
          }
          else
          {
            long long v15 = *a2++;
            long long v16 = v15;
          }
          *result++ = v16;
          if (&__src[v13] == (char *)v14) {
            return result;
          }
        }
        return (long long *)memmove(result, v14, __src - (char *)v14 + v13);
      }
    }
  }
  else if (a2 != a3)
  {
    uint64_t v7 = 0;
    do
    {
      *(_OWORD *)&__src[v7 * 16] = a2[v7];
      ++v7;
    }
    while (&a2[v7] != a3);
    if (v7 * 16)
    {
      __n128 v8 = (float *)&__src[v7 * 16];
      uint64_t v9 = a3 - 1;
      while (a2 != result)
      {
        float v10 = *(v8 - 1);
        float v11 = *((float *)a2 - 1);
        if (v10 <= v11) {
          uint64_t v12 = (char *)(v8 - 4);
        }
        else {
          uint64_t v12 = (char *)(a2 - 1);
        }
        if (v10 <= v11) {
          v8 -= 4;
        }
        else {
          --a2;
        }
        *v9-- = *(_OWORD *)v12;
        if (v8 == (float *)__src) {
          return result;
        }
      }
      unint64_t v18 = 0;
      do
      {
        v9[v18 / 4] = *(_OWORD *)&v8[v18 - 4];
        v18 -= 4;
      }
      while (&v8[v18] != (float *)__src);
    }
  }
  return result;
}

char *std::__rotate[abi:ne180100]<std::_ClassicAlgPolicy,internal::marisa::grimoire::trie::WeightedRange *,internal::marisa::grimoire::trie::WeightedRange *>(char *__src, char *a2, char *a3)
{
  uint64_t v4 = a3;
  if (__src != a2)
  {
    if (a2 == a3)
    {
      return __src;
    }
    else if (__src + 16 == a2)
    {
      long long v9 = *(_OWORD *)__src;
      int64_t v6 = a3 - a2;
      memmove(__src, a2, a3 - a2);
      uint64_t v4 = &__src[v6];
      *(_OWORD *)uint64_t v4 = v9;
    }
    else if (a2 + 16 == a3)
    {
      uint64_t v4 = __src + 16;
      long long v10 = *((_OWORD *)a3 - 1);
      size_t v7 = a3 - 16 - __src;
      if (a3 - 16 != __src) {
        memmove(__src + 16, __src, v7);
      }
      *(_OWORD *)__src = v10;
    }
    else
    {
      return (char *)std::__rotate_gcd[abi:ne180100]<std::_ClassicAlgPolicy,internal::marisa::grimoire::trie::WeightedRange *>(__src, a2, a3);
    }
  }
  return v4;
}

_OWORD *std::__rotate_gcd[abi:ne180100]<std::_ClassicAlgPolicy,internal::marisa::grimoire::trie::WeightedRange *>(_OWORD *a1, _OWORD *a2, _OWORD *a3)
{
  uint64_t v3 = a2 - a1;
  if (v3 == a3 - a2)
  {
    if (a1 != a2 && a2 != a3)
    {
      uint64_t v4 = 0;
      do
      {
        long long v5 = a1[v4];
        a1[v4] = a2[v4];
        uint64_t v6 = (uint64_t)&a1[v4 + 1];
        a2[v4] = v5;
        uint64_t v7 = (uint64_t)&a2[++v4];
      }
      while ((_OWORD *)v6 != a2 && v7 != (void)a3);
    }
  }
  else
  {
    uint64_t v9 = a3 - a2;
    uint64_t v10 = a2 - a1;
    do
    {
      uint64_t v11 = v10;
      uint64_t v10 = v9;
      uint64_t v9 = v11 % v9;
    }
    while (v9);
    if (v10)
    {
      uint64_t v12 = &a1[v10];
      do
      {
        long long v13 = *--v12;
        uint64_t v14 = &v12[v3];
        long long v15 = v12;
        do
        {
          long long v16 = v15;
          long long v15 = v14;
          _OWORD *v16 = *v14;
          BOOL v17 = __OFSUB__(v3, a3 - v14);
          uint64_t v19 = v3 - (a3 - v14);
          char v18 = (v19 < 0) ^ v17;
          uint64_t v14 = &a1[v19];
          if (v18) {
            uint64_t v14 = &v15[v3];
          }
        }
        while (v14 != v12);
        *long long v15 = v13;
      }
      while (v12 != a1);
    }
    return &a1[a3 - a2];
  }
  return a2;
}

uint64_t std::deque<internal::marisa::grimoire::trie::Range>::~deque[abi:ne180100](void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 170;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 341;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    uint64_t v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<internal::marisa::grimoire::trie::Range *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<internal::marisa::grimoire::trie::Range *>::~__split_buffer(uint64_t a1)
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

uint64_t internal::marisa::grimoire::vector::FlatVector::build_(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (!v4) {
    goto LABEL_10;
  }
  unsigned int v5 = 0;
  uint64_t v6 = *(unsigned int **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  do
  {
    unsigned int v9 = *v6++;
    unsigned int v8 = v9;
    if (v9 > v5) {
      unsigned int v5 = v8;
    }
    --v7;
  }
  while (v7);
  if (v5)
  {
    uint64_t v10 = 0;
    do
    {
      ++v10;
      BOOL v11 = v5 > 1;
      v5 >>= 1;
    }
    while (v11);
  }
  else
  {
LABEL_10:
    uint64_t v10 = 0;
  }
  BOOL v12 = v4 != 0;
  unint64_t v13 = (unint64_t)(v10 * v4 + 63) >> 6;
  if (v10) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v12;
  }
  uint64_t result = (uint64_t)internal::marisa::grimoire::vector::Vector<unsigned long long>::resize((uint64_t *)a1, v14);
  if (v14) {
    *(void *)(*(void *)(a1 + 8) + 8 * *(void *)(a1 + 24) - 8) = 0;
  }
  *(void *)(a1 + 48) = v10;
  if (v10) {
    *(_DWORD *)(a1 + 56) = 0xFFFFFFFF >> -(char)v10;
  }
  uint64_t v16 = *(void *)(a2 + 24);
  *(void *)(a1 + 64) = v16;
  if (v16)
  {
    unint64_t v17 = 0;
    do
    {
      uint64_t result = internal::marisa::grimoire::vector::FlatVector::set(a1, v17, *(_DWORD *)(*(void *)(a2 + 16) + 4 * v17));
      ++v17;
    }
    while (v17 < *(void *)(a2 + 24));
  }
  return result;
}

uint64_t internal::marisa::grimoire::vector::FlatVector::set(uint64_t this, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(this + 48);
  unint64_t v4 = (unint64_t)(v3 * a2) >> 6;
  uint64_t v5 = (v3 * a2) & 0x3F;
  unint64_t v6 = *(unsigned int *)(this + 56);
  uint64_t v7 = *(void *)(this + 8);
  unint64_t v8 = v6 & a3;
  *(void *)(v7 + 8 * v4) = *(void *)(v7 + 8 * v4) & ~(v6 << (v3 * a2)) | (v8 << (v3 * a2));
  if ((unint64_t)(v5 + v3) >= 0x41) {
    *(void *)(v7 + 8 * v4 + 8) = *(void *)(v7 + 8 * v4 + 8) & ~(v6 >> -(char)v5) | (v8 >> -(char)v5);
  }
  return this;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10 = (unsigned int *)result;
LABEL_2:
  BOOL v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    uint64_t v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = ((char *)a2 - (char *)v11) >> 3;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          unsigned int v23 = *(a2 - 2);
          unsigned int v24 = *v11;
          if (v23 < *v11 || v24 >= v23 && *(a2 - 1) < v11[1])
          {
            *BOOL v11 = v23;
            *(a2 - 2) = v24;
            unsigned int v25 = v11[1];
            v11[1] = *(a2 - 1);
            *(a2 - 1) = v25;
          }
          break;
        case 3uLL:
          uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v11, v11 + 2, a2 - 2);
          break;
        case 4uLL:
          uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v11, v11 + 2, v11 + 4, a2 - 2);
          break;
        case 5uLL:
          uint64_t result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v11, v11 + 2, v11 + 4, v11 + 6, a2 - 2);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,std::pair<unsigned int,unsigned int> *>(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    unint64_t v17 = &v11[2 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x401)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v11, &v11[2 * (v15 >> 1)], a2 - 2);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v11 + 2, v17 - 2, a2 - 4);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v11 + 4, &v11[2 * v16 + 2], a2 - 6);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v17 - 2, v17, &v11[2 * v16 + 2]);
      uint64_t v18 = *(void *)v11;
      *(void *)BOOL v11 = *(void *)v17;
      *(void *)unint64_t v17 = v18;
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(&v11[2 * (v15 >> 1)], v11, a2 - 2);
      if (a5) {
        goto LABEL_16;
      }
    }
    unsigned int v19 = *(v11 - 2);
    if (v19 >= *v11 && (*v11 < v19 || *(v11 - 1) >= v11[1]))
    {
      uint64_t result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(v11, a2);
      BOOL v11 = (unsigned int *)result;
      goto LABEL_21;
    }
LABEL_16:
    uint64_t v20 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(v11, a2);
    if ((v21 & 1) == 0) {
      goto LABEL_19;
    }
    BOOL v22 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v11, v20);
    BOOL v11 = v20 + 2;
    uint64_t result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v20 + 2, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v20;
      if (v22) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v22)
    {
LABEL_19:
      uint64_t result = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>(v10, v20, a3, -v13, a5 & 1);
      BOOL v11 = v20 + 2;
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v11, a2);
  }
  else
  {
    return (uint64_t)std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v11, a2);
  }
}

unsigned int *std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *result, unsigned int *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 2;
    if (result + 2 != a2)
    {
      uint64_t v3 = 0;
      unint64_t v4 = result;
      do
      {
        char v5 = v4;
        unint64_t v4 = v2;
        unsigned int v6 = v5[2];
        unsigned int v7 = *v5;
        if (v6 < *v5 || v7 >= v6 && v5[3] < v5[1])
        {
          unsigned int v9 = v5[2];
          unsigned int v8 = v5[3];
          unsigned int v10 = v5[1];
          v5[2] = v7;
          v4[1] = v10;
          BOOL v11 = result;
          if (v5 != result)
          {
            uint64_t v12 = v3;
            do
            {
              unsigned int v13 = *(unsigned int *)((char *)result + v12 - 8);
              if (v13 <= v9)
              {
                if (v13 < v9)
                {
                  BOOL v11 = v5;
                  goto LABEL_17;
                }
                BOOL v11 = (unsigned int *)((char *)result + v12);
                unsigned int v14 = *(unsigned int *)((char *)result + v12 - 4);
                if (v14 <= v8) {
                  goto LABEL_17;
                }
              }
              else
              {
                unsigned int v14 = *(unsigned int *)((char *)result + v12 - 4);
              }
              v5 -= 2;
              unint64_t v15 = (unsigned int *)((char *)result + v12);
              *unint64_t v15 = v13;
              v15[1] = v14;
              v12 -= 8;
            }
            while (v12);
            BOOL v11 = result;
          }
LABEL_17:
          *BOOL v11 = v9;
          v11[1] = v8;
        }
        uint64_t v2 = v4 + 2;
        v3 += 8;
      }
      while (v4 + 2 != a2);
    }
  }
  return result;
}

unsigned int *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *result, unsigned int *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 2;
    if (result + 2 != a2)
    {
      uint64_t v3 = result + 1;
      do
      {
        unint64_t v4 = result;
        uint64_t result = v2;
        unsigned int v5 = v4[2];
        unsigned int v6 = *v4;
        if (v5 < *v4 || v6 >= v5 && v4[3] < v4[1])
        {
          unsigned int v7 = *result;
          unsigned int v8 = result[1];
          for (uint64_t i = v3; ; i -= 2)
          {
            unsigned int v10 = *i;
            i[1] = v6;
            i[2] = v10;
            unsigned int v6 = *(i - 3);
            if (v6 <= v7 && (v6 < v7 || *(i - 2) <= v8)) {
              break;
            }
          }
          *(i - 1) = v7;
          unsigned int *i = v8;
        }
        uint64_t v2 = result + 2;
        v3 += 2;
      }
      while (result + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3 = *a2;
  unsigned int v4 = *a1;
  if (*a2 >= *a1 && (v4 < v3 || a2[1] >= a1[1]))
  {
    unsigned int v9 = *a3;
    if (*a3 >= v3 && (v3 < v9 || a3[1] >= a2[1])) {
      return 0;
    }
    *a2 = v9;
    *a3 = v3;
    BOOL v11 = (int *)(a2 + 1);
    unsigned int v10 = a2[1];
    a2[1] = a3[1];
    a3[1] = v10;
    unsigned int v12 = *a2;
    unsigned int v13 = *a1;
    if (*a2 >= *a1 && (v13 < v12 || *v11 >= a1[1])) {
      return 1;
    }
    *a1 = v12;
    unsigned int v6 = (int *)(a1 + 1);
    *a2 = v13;
    uint64_t v8 = 2;
  }
  else
  {
    unsigned int v5 = *a3;
    if (*a3 < v3 || v3 >= v5 && a3[1] < a2[1])
    {
      *a1 = v5;
      unsigned int v6 = (int *)(a1 + 1);
      *a3 = v4;
      unsigned int v7 = (int *)(a3 + 1);
      uint64_t v8 = 1;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      unsigned int v14 = a1[1];
      a1[1] = a2[1];
      a2[1] = v14;
      unsigned int v15 = *a3;
      unsigned int v16 = *a2;
      if (*a3 >= *a2 && (v16 < v15 || a3[1] >= v14)) {
        return 1;
      }
      *a2 = v15;
      *a3 = v16;
      unsigned int v7 = (int *)(a3 + 1);
      uint64_t v8 = 2;
      unsigned int v6 = (int *)(a2 + 1);
    }
    BOOL v11 = v7;
  }
  int v17 = *v6;
  *unsigned int v6 = *v11;
  *BOOL v11 = v17;
  return v8;
}

unsigned int *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(unsigned int *a1, unsigned int *a2)
{
  unsigned int v3 = *a1;
  unsigned int v2 = a1[1];
  unsigned int v4 = *(a2 - 2);
  if (v4 <= *a1 && (v4 < v3 || *(a2 - 1) <= v2))
  {
    for (uint64_t i = a1 + 2; i < a2 && *i <= v3 && (*i < v3 || i[1] <= v2); i += 2)
      ;
  }
  else
  {
    uint64_t i = a1;
    do
    {
      unsigned int v7 = i[2];
      i += 2;
      unsigned int v6 = v7;
    }
    while (v7 <= v3 && (v6 < v3 || i[1] <= v2));
  }
  if (i < a2)
  {
    for (a2 -= 2; v4 > v3 || v4 >= v3 && a2[1] > v2; a2 -= 2)
    {
      unsigned int v8 = *(a2 - 2);
      unsigned int v4 = v8;
    }
  }
  if (i < a2)
  {
    unsigned int v9 = *i;
    unsigned int v10 = *a2;
    do
    {
      unsigned int *i = v10;
      *a2 = v9;
      unsigned int v11 = i[1];
      i[1] = a2[1];
      a2[1] = v11;
      do
      {
        unsigned int v12 = i[2];
        i += 2;
        unsigned int v9 = v12;
      }
      while (v12 <= v3 && (v9 < v3 || i[1] <= v2));
      do
      {
        do
        {
          unsigned int v13 = *(a2 - 2);
          a2 -= 2;
          unsigned int v10 = v13;
          BOOL v14 = v13 >= v3;
        }
        while (v13 > v3);
      }
      while (v14 && a2[1] > v2);
    }
    while (i < a2);
  }
  if (i - 2 != a1)
  {
    *a1 = *(i - 2);
    a1[1] = *(i - 1);
  }
  *(i - 2) = v3;
  *(i - 1) = v2;
  return i;
}

unsigned int *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2 = 0;
  unsigned int v3 = *a1;
  unsigned int v4 = a1[1];
  while (1)
  {
    unsigned int v5 = a1[v2 + 2];
    if (v5 >= v3 && (v5 > v3 || a1[v2 + 3] >= v4)) {
      break;
    }
    v2 += 2;
  }
  unint64_t v6 = (unint64_t)&a1[v2 + 2];
  if (v2 * 4)
  {
    do
    {
      unsigned int v8 = *(a2 - 2);
      a2 -= 2;
      unsigned int v7 = v8;
    }
    while (v8 >= v3 && (v7 > v3 || a2[1] >= v4));
  }
  else
  {
LABEL_19:
    if (v6 < (unint64_t)a2)
    {
      do
      {
        unsigned int v10 = *(a2 - 2);
        a2 -= 2;
        unsigned int v9 = v10;
        if (v10 < v3) {
          break;
        }
        if (v9 > v3) {
          goto LABEL_19;
        }
      }
      while (a2[1] >= v4 && v6 < (unint64_t)a2);
    }
  }
  if (v6 >= (unint64_t)a2)
  {
    unsigned int v13 = (unsigned int *)v6;
  }
  else
  {
    unsigned int v12 = *a2;
    unsigned int v13 = (unsigned int *)v6;
    BOOL v14 = a2;
    do
    {
      *unsigned int v13 = v12;
      *BOOL v14 = v5;
      unsigned int v15 = v13[1];
      v13[1] = v14[1];
      v14[1] = v15;
      do
      {
        do
        {
          unsigned int v16 = v13[2];
          v13 += 2;
          unsigned int v5 = v16;
          BOOL v17 = v16 > v3;
        }
        while (v16 < v3);
      }
      while (!v17 && v13[1] < v4);
      do
      {
        unsigned int v18 = *(v14 - 2);
        v14 -= 2;
        unsigned int v12 = v18;
      }
      while (v18 >= v3 && (v12 > v3 || v14[1] >= v4));
    }
    while (v13 < v14);
  }
  if (v13 - 2 != a1)
  {
    *a1 = *(v13 - 2);
    a1[1] = *(v13 - 1);
  }
  *(v13 - 2) = v3;
  *(v13 - 1) = v4;
  return v13 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 3;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unsigned int v6 = *(a2 - 2);
      unsigned int v7 = *a1;
      if (v6 < *a1 || v7 >= v6 && *(a2 - 1) < a1[1])
      {
        *a1 = v6;
        *(a2 - 2) = v7;
        unsigned int v8 = a1[1];
        a1[1] = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2);
      return 1;
    default:
      unsigned int v9 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a1 + 4);
      unsigned int v10 = a1 + 6;
      if (a1 + 6 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  do
  {
    unsigned int v13 = *v9;
    if (*v10 >= *v9 && (v13 < *v10 || v10[1] >= v9[1])) {
      goto LABEL_22;
    }
    unsigned int v14 = *v10;
    unsigned int v15 = v10[1];
    *unsigned int v10 = v13;
    v10[1] = v9[1];
    unsigned int v16 = a1;
    if (v9 == a1) {
      goto LABEL_21;
    }
    uint64_t v17 = v11;
    while (1)
    {
      unsigned int v18 = (char *)a1 + v17;
      unsigned int v19 = *(unsigned int *)((char *)a1 + v17 + 8);
      if (v19 <= v14) {
        break;
      }
      unsigned int v20 = *((_DWORD *)v18 + 3);
LABEL_18:
      v9 -= 2;
      *((_DWORD *)v18 + 4) = v19;
      *(unsigned int *)((char *)a1 + v17 + 20) = v20;
      v17 -= 8;
      if (v17 == -16)
      {
        unsigned int v16 = a1;
        goto LABEL_21;
      }
    }
    if (v19 < v14)
    {
      unsigned int v16 = v9;
      goto LABEL_21;
    }
    unsigned int v20 = *(unsigned int *)((char *)a1 + v17 + 12);
    if (v20 > v15) {
      goto LABEL_18;
    }
    unsigned int v16 = (unsigned int *)((char *)a1 + v17 + 16);
LABEL_21:
    unsigned int *v16 = v14;
    v16[1] = v15;
    if (++v12 == 8) {
      return v10 + 2 == a2;
    }
LABEL_22:
    unsigned int v9 = v10;
    v11 += 8;
    v10 += 2;
  }
  while (v10 != a2);
  return 1;
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4)
{
  uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a2, a3);
  unsigned int v9 = *a4;
  unsigned int v10 = *a3;
  if (*a4 < *a3 || v10 >= v9 && a4[1] < a3[1])
  {
    *a3 = v9;
    *a4 = v10;
    unsigned int v11 = a3[1];
    a3[1] = a4[1];
    a4[1] = v11;
    unsigned int v12 = *a3;
    unsigned int v13 = *a2;
    if (*a3 < *a2 || v13 >= v12 && a3[1] < a2[1])
    {
      *a2 = v12;
      *a3 = v13;
      unsigned int v14 = a2[1];
      a2[1] = a3[1];
      a3[1] = v14;
      unsigned int v15 = *a2;
      unsigned int v16 = *a1;
      if (*a2 < *a1 || v16 >= v15 && a2[1] < a1[1])
      {
        *a1 = v15;
        *a2 = v16;
        unsigned int v17 = a1[1];
        a1[1] = a2[1];
        a2[1] = v17;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a2, a3, a4);
  unsigned int v11 = *a5;
  unsigned int v12 = *a4;
  if (*a5 < *a4 || v12 >= v11 && a5[1] < a4[1])
  {
    *a4 = v11;
    *a5 = v12;
    unsigned int v13 = a4[1];
    a4[1] = a5[1];
    a5[1] = v13;
    unsigned int v14 = *a4;
    unsigned int v15 = *a3;
    if (*a4 < *a3 || v15 >= v14 && a4[1] < a3[1])
    {
      *a3 = v14;
      *a4 = v15;
      unsigned int v16 = a3[1];
      a3[1] = a4[1];
      a4[1] = v16;
      unsigned int v17 = *a3;
      unsigned int v18 = *a2;
      if (*a3 < *a2 || v18 >= v17 && a3[1] < a2[1])
      {
        *a2 = v17;
        *a3 = v18;
        unsigned int v19 = a2[1];
        a2[1] = a3[1];
        a3[1] = v19;
        unsigned int v20 = *a2;
        unsigned int v21 = *a1;
        if (*a2 < *a1 || v21 >= v20 && a2[1] < a1[1])
        {
          *a1 = v20;
          *a2 = v21;
          unsigned int v22 = a1[1];
          a1[1] = a2[1];
          a2[1] = v22;
        }
      }
    }
  }
  return result;
}

unsigned int *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) >> 3;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unsigned int v12 = &a1[2 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>((uint64_t)a1, a4, v9, v12);
        v12 -= 2;
        --v11;
      }
      while (v11);
    }
    unsigned int v13 = a2;
    if (a2 != a3)
    {
      unsigned int v14 = a2;
      do
      {
        unsigned int v15 = *v14;
        unsigned int v16 = *a1;
        if (*v14 < *a1 || v16 >= v15 && v14[1] < a1[1])
        {
          *unsigned int v14 = v16;
          *a1 = v15;
          unsigned int v17 = v14[1];
          v14[1] = a1[1];
          a1[1] = v17;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>((uint64_t)a1, a4, v9, a1);
        }
        v14 += 2;
      }
      while (v14 != a3);
      unsigned int v13 = a3;
    }
    if (v8 >= 9)
    {
      uint64_t v18 = (unint64_t)v8 >> 3;
      unsigned int v19 = a2 - 2;
      do
      {
        unsigned int v21 = *a1;
        unsigned int v20 = a1[1];
        unsigned int v22 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a4, v18);
        if (v19 == v22)
        {
          *unsigned int v22 = v21;
          v22[1] = v20;
        }
        else
        {
          *unsigned int v22 = *v19;
          v22[1] = v19[1];
          *unsigned int v19 = v21;
          v19[1] = v20;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>((uint64_t)a1, (uint64_t)(v22 + 2), a4, ((char *)(v22 + 2) - (char *)a1) >> 3);
        }
        v19 -= 2;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(uint64_t result, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v6 = v4 >> 2;
      uint64_t v7 = (v4 >> 2) + 1;
      uint64_t v8 = (unsigned int *)(result + 8 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        unsigned int v10 = v8[2];
        if (*v8 < v10 || v10 >= *v8 && *(_DWORD *)(result + 8 * v7 + 4) < v8[3])
        {
          v8 += 2;
          uint64_t v7 = v9;
        }
      }
      unsigned int v11 = *v8;
      if (*v8 >= *a4 && (*a4 < v11 || v8[1] >= a4[1]))
      {
        unsigned int v12 = *a4;
        unsigned int v13 = a4[1];
        *a4 = v11;
        a4[1] = v8[1];
        if (v5 >= v7)
        {
          while (1)
          {
            uint64_t v15 = 2 * v7;
            uint64_t v7 = (2 * v7) | 1;
            unsigned int v14 = (unsigned int *)(result + 8 * v7);
            uint64_t v16 = v15 + 2;
            if (v16 < a3)
            {
              unsigned int v17 = v14[2];
              if (*v14 < v17 || v17 >= *v14 && *(_DWORD *)(result + 8 * v7 + 4) < v14[3])
              {
                v14 += 2;
                uint64_t v7 = v16;
              }
            }
            unsigned int v18 = *v14;
            if (*v14 < v12 || v18 <= v12 && v14[1] < v13) {
              break;
            }
            *uint64_t v8 = v18;
            v8[1] = v14[1];
            uint64_t v8 = v14;
            if (v5 < v7) {
              goto LABEL_22;
            }
          }
        }
        unsigned int v14 = v8;
LABEL_22:
        *unsigned int v14 = v12;
        v14[1] = v13;
      }
    }
  }
  return result;
}

unsigned int *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = result;
    uint64_t v7 = v3 + 1;
    result += 2 * v3 + 2;
    uint64_t v8 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v9 = v8 + 2;
    if (v9 < a3)
    {
      unsigned int v10 = result[2];
      if (*result < v10 || v10 >= *result && v6[2 * v7 + 1] < result[3])
      {
        result += 2;
        uint64_t v3 = v9;
      }
    }
    *uint64_t v6 = *result;
    v6[1] = result[1];
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (unsigned int *)(result + 8 * (v4 >> 1));
    unsigned int v7 = *v6;
    unsigned int v8 = *(_DWORD *)(a2 - 8);
    if (*v6 < v8 || v8 >= v7 && *(_DWORD *)(result + 8 * v5 + 4) < *(_DWORD *)(a2 - 4))
    {
      unsigned int v9 = *(_DWORD *)(a2 - 8);
      unsigned int v10 = *(_DWORD *)(a2 - 4);
      *(_DWORD *)(a2 - 8) = v7;
      *(_DWORD *)(a2 - 4) = v6[1];
      if (v4 >= 2)
      {
        while (1)
        {
          unint64_t v12 = v5 - 1;
          unint64_t v5 = (v5 - 1) >> 1;
          unsigned int v11 = (unsigned int *)(result + 8 * v5);
          unsigned int v13 = *v11;
          if (*v11 >= v9)
          {
            if (v13 > v9) {
              break;
            }
            unsigned int v14 = *(_DWORD *)(result + 8 * v5 + 4);
            if (v14 >= v10) {
              break;
            }
          }
          else
          {
            unsigned int v14 = v11[1];
          }
          *uint64_t v6 = v13;
          v6[1] = v14;
          uint64_t v6 = (unsigned int *)(result + 8 * v5);
          if (v12 <= 1) {
            goto LABEL_12;
          }
        }
      }
      unsigned int v11 = v6;
LABEL_12:
      *unsigned int v11 = v9;
      v11[1] = v10;
    }
  }
  return result;
}

void std::vector<unsigned long>::__append(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unsigned int v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    unsigned int v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unsigned int v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(v4, v13);
      unsigned int v8 = *a1;
      unsigned int v7 = a1[1];
    }
    else
    {
      unsigned int v14 = 0;
    }
    uint64_t v15 = &v14[8 * v11];
    uint64_t v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    unsigned int v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
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

void std::vector<unsigned long>::__throw_length_error[abi:ne180100]()
{
}

char *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Entry>::realloc(uint64_t *a1, uint64_t a2)
{
  uint64_t result = (char *)operator new[](16 * a2, MEMORY[0x1E4FBA2D0]);
  uint64_t v5 = a1[3];
  if (v5)
  {
    uint64_t v6 = (uint64_t *)(a1[1] + 8);
    unsigned int v7 = result + 8;
    do
    {
      *(v7 - 1) = *(v6 - 1);
      uint64_t v8 = *v6;
      v6 += 2;
      *unsigned int v7 = v8;
      v7 += 2;
      --v5;
    }
    while (v5);
  }
  uint64_t v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
  {
    JUMPOUT(0x192FAF290);
  }
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_current_trie<internal::marisa::grimoire::trie::ReverseKey>(uint64_t *a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a2 + 24);
  unint64_t v9 = *(void *)(a2 + 8);
  if (v8)
  {
    uint64_t v10 = 0;
    uint64_t v11 = (_DWORD *)(v9 + 16);
    do
    {
      *uint64_t v11 = v10;
      v11 += 6;
      ++v10;
    }
    while (v8 != v10);
  }
  unint64_t v12 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v9, v9 + 24 * v8, 0);
  uint64_t v13 = 256;
  if (a5 != 1) {
    uint64_t v13 = 1;
  }
  do
  {
    unint64_t v14 = v13;
    v13 *= 2;
  }
  while (v14 < v12 / *(unsigned int *)(a4 + 8));
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::resize(a1 + 126, v14);
  a1[132] = v14 - 1;
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 1);
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
  uint64_t v15 = a1 + 78;
  LOBYTE(v84[0]) = 0;
  internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(a1 + 78, v84);
  internal::marisa::grimoire::vector::BitVector::push_back(a1 + 52, 0);
  memset(v84, 0, 41);
  long long v83 = 0u;
  memset(v82, 0, sizeof(v82));
  long long v80 = 0u;
  memset(v81, 0, 25);
  v78.n128_u64[0] = *(void *)(a2 + 24) << 32;
  v78.n128_u32[2] = 0;
  std::deque<internal::marisa::grimoire::trie::Range>::push_back(v82, (uint64_t *)&v78);
  uint64_t v16 = *((void *)&v83 + 1);
  if (*((void *)&v83 + 1))
  {
    uint64_t v72 = a1 + 52;
    uint64_t v73 = a1 + 78;
    do
    {
      uint64_t v17 = a1[58];
      uint64_t v18 = (unsigned int *)(*(void *)(*((void *)&v82[0] + 1) + 8 * ((unint64_t)v83 / 0x155))
                           + 12 * ((unint64_t)v83 % 0x155));
      uint64_t v19 = *v18;
      unint64_t v20 = v18[1];
      uint64_t v21 = v18[2];
      *(void *)&long long v83 = v83 + 1;
      *((void *)&v83 + 1) = v16 - 1;
      if ((unint64_t)v83 >= 0x2AA)
      {
        uint64_t v22 = v17;
        uint64_t v23 = v16;
        operator delete(**((void ***)&v82[0] + 1));
        uint64_t v16 = v23;
        uint64_t v17 = v22;
        *((void *)&v82[0] + 1) += 8;
        *(void *)&long long v83 = v83 - 341;
      }
      if (v19 < v20)
      {
        while (1)
        {
          uint64_t v24 = *(void *)(a2 + 8);
          if (*(_DWORD *)(v24 + 24 * v19 + 8) != v21) {
            break;
          }
          *(_DWORD *)(v24 + 24 * v19 + 12) = v17 - v16;
          uint64_t v19 = (v19 + 1);
          if (v20 == v19) {
            goto LABEL_49;
          }
        }
      }
      if (v19 != v20)
      {
        uint64_t v76 = v16;
        int v77 = v17 - v16;
        uint64_t v25 = v80;
        long long v80 = 0u;
        memset(v81, 0, 25);
        if (v25) {
          MEMORY[0x192FAF290](v25, 0x1000C8077774924);
        }
        uint64_t v75 = v17;
        uint64_t v26 = *(void *)(a2 + 8);
        double v27 = *(float *)(v26 + 24 * v19 + 12);
        uint64_t v28 = v19 + 1;
        if (v19 + 1 < v20)
        {
          uint64_t v29 = 24 * v19;
          uint64_t v30 = (v19 << 32) + 0x100000000;
          do
          {
            if (*(unsigned __int8 *)(*(void *)(v26 + v29) - v21 - 1) != *(unsigned __int8 *)(*(void *)(v26 + v29 + 24)
                                                                                              - v21
                                                                                              - 1))
            {
              *(float *)&unsigned int v31 = v27;
              v78.n128_u64[0] = v30 + v19;
              v78.n128_u64[1] = v21 | ((unint64_t)v31 << 32);
              internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
              uint64_t v26 = *(void *)(a2 + 8);
              double v27 = 0.0;
              LODWORD(v19) = v28;
            }
            double v27 = v27 + *(float *)(v26 + v29 + 36);
            ++v28;
            v29 += 24;
            v30 += 0x100000000;
          }
          while (v20 != v28);
        }
        *(float *)&unsigned int v32 = v27;
        v78.n128_u32[0] = v19;
        v78.n128_u32[1] = v20;
        v78.n128_u64[1] = v21 | ((unint64_t)v32 << 32);
        __n128 v33 = internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
        uint64_t v15 = a1 + 78;
        uint64_t v34 = v76;
        if (*(_DWORD *)(a4 + 16) == 0x20000)
        {
          uint64_t v35 = (__n128 *)*((void *)&v80 + 1);
          unint64_t v36 = v81[1];
          if (v81[1] < 129)
          {
            uint64_t v37 = 0;
            uint64_t v39 = 0;
          }
          else
          {
            uint64_t v37 = (__n128 *)std::get_temporary_buffer[abi:ne180100]<internal::marisa::grimoire::trie::WeightedRange>(v81[1]);
            uint64_t v39 = v38;
          }
          std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(v35, &v35[v36], (uint64_t)&v78, v36, v37, v39, v33);
          if (v37) {
            operator delete(v37);
          }
          uint64_t v34 = v76;
        }
        uint64_t v40 = v81[1];
        if (v75 == v34) {
          a1[133] = v81[1];
        }
        if (v40)
        {
          unint64_t v41 = 0;
          do
          {
            uint64_t v42 = (unsigned int *)(*((void *)&v80 + 1) + 16 * v41);
            __n128 v43 = (uint64_t *)v42;
            uint64_t v44 = v42[2];
            uint64_t v45 = *(void *)(a2 + 8);
            unint64_t v46 = *(unsigned int *)(v45 + 24 * *v42 + 8);
            unint64_t v47 = v44 + 1;
            if (v44 + 1 >= v46)
            {
              unint64_t v48 = v42[2];
              LODWORD(v46) = v44 + 1;
            }
            else
            {
              unint64_t v48 = v46 - 1;
              uint64_t v49 = (uint64_t *)(v45 + 24 * *v42);
              unint64_t v50 = v42[2];
              do
              {
                unint64_t v51 = v50;
                unint64_t v50 = v47;
                uint64_t v52 = v49;
                uint64_t v53 = *v42;
                while (++v53 < (unint64_t)v42[1])
                {
                  uint64_t v54 = *v52;
                  uint64_t v55 = v52[3];
                  v52 += 3;
                  if (*(unsigned __int8 *)(v54 + ~v51 - 1) != *(unsigned __int8 *)(v55 + ~v51 - 1))
                  {
                    unint64_t v48 = v51;
                    LODWORD(v46) = v47;
                    goto LABEL_43;
                  }
                }
                ++v47;
              }
              while (v50 + 1 != v46);
            }
LABEL_43:
            uint64_t v56 = a1[81];
            float v58 = *((float *)v42 + 3);
            uint64_t v57 = v42 + 3;
            float v59 = v58;
            uint64_t v60 = a1[132] & v56;
            uint64_t v61 = a1[127];
            uint64_t v62 = v61 + 12 * v60;
            float v64 = *(float *)(v62 + 8);
            unint64_t v63 = (float *)(v62 + 8);
            if (v64 < v59)
            {
              uint64_t v65 = (_DWORD *)(v61 + 12 * v60);
              *uint64_t v65 = v77;
              v65[1] = v56;
              *unint64_t v63 = v59;
              uint64_t v44 = *((unsigned int *)v43 + 2);
            }
            if (v48 == v44)
            {
              v78.n128_u8[0] = *(unsigned char *)(~v48 + *(void *)(*(void *)(a2 + 8) + 24 * *(unsigned int *)v43));
              internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(v73, &v78);
              internal::marisa::grimoire::vector::BitVector::push_back(v72, 0);
            }
            else
            {
              v78.n128_u8[0] = 0;
              internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(v73, &v78);
              internal::marisa::grimoire::vector::BitVector::push_back(v72, 1);
              __n128 v78 = 0uLL;
              int v79 = 0;
              uint64_t v66 = *((unsigned int *)v43 + 2);
              v78.n128_u64[0] = *(void *)(*(void *)(a2 + 8) + 24 * *(unsigned int *)v43) - v66;
              v78.n128_u64[1] = (v46 - v66);
              v78.n128_u32[3] = *v57;
              internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::push_back((uint64_t *)v84, (uint64_t)&v78);
            }
            *((_DWORD *)v43 + 2) = v46;
            std::deque<internal::marisa::grimoire::trie::Range>::push_back(v82, v43);
            internal::marisa::grimoire::vector::BitVector::push_back(a1, 1);
            ++v41;
          }
          while (v41 < v81[1]);
        }
      }
LABEL_49:
      internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
      uint64_t v16 = *((void *)&v83 + 1);
    }
    while (*((void *)&v83 + 1));
  }
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
  internal::marisa::grimoire::vector::BitVector::build((internal::marisa::grimoire::vector::BitVector *)a1, a5 == 1, 1);
  internal::marisa::grimoire::vector::Vector<unsigned char>::shrink(v15);
  internal::marisa::grimoire::trie::LoudsTrie::build_terminals<internal::marisa::grimoire::trie::ReverseKey>((uint64_t)a1, a2, a3);
  long long v67 = *(_OWORD *)a2;
  *(_OWORD *)a2 = v84[0];
  v84[0] = v67;
  uint64_t v68 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = *(void *)&v84[1];
  *(void *)&v84[1] = v68;
  long long v69 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)((char *)&v84[1] + 8);
  *(_OWORD *)((char *)&v84[1] + 8) = v69;
  LOBYTE(v68) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a2 + 40) = BYTE8(v84[2]);
  BYTE8(v84[2]) = v68;
  if ((void)v80) {
    MEMORY[0x192FAF290](v80, 0x1000C8077774924);
  }
  std::deque<internal::marisa::grimoire::trie::Range>::~deque[abi:ne180100](v82);
  uint64_t result = *(void *)&v84[0];
  if (*(void *)&v84[0]) {
    return MEMORY[0x192FAF290](*(void *)&v84[0], 0x1000C8077774924);
  }
  return result;
}

void sub_18E65A76C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  if (a21) {
    MEMORY[0x192FAF290](a21, 0x1000C8077774924);
  }
  std::deque<internal::marisa::grimoire::trie::Range>::~deque[abi:ne180100](&a27);
  uint64_t v30 = *(void *)(v27 - 144);
  if (v30) {
    MEMORY[0x192FAF290](v30, 0x1000C8077774924);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds-trie.cc";
    exception[2] = 0x8000001D3;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds"
                   "-trie.cc:467: MARISA_MEMORY_ERROR: std::bad_alloc";
  }
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_terminals<internal::marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, long long *a3)
{
  memset(v13, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned int>::resize((uint64_t *)v13, *(void *)(a2 + 24));
  uint64_t v5 = *(void *)(a2 + 24);
  if (v5)
  {
    uint64_t v6 = *((void *)&v13[0] + 1);
    unsigned int v7 = (unsigned int *)(*(void *)(a2 + 16) + 16);
    do
    {
      *(_DWORD *)(v6 + 4 * *v7) = *(v7 - 1);
      v7 += 6;
      --v5;
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = *((void *)&v13[0] + 1);
  }
  long long v8 = *a3;
  uint64_t v9 = *(void *)&v13[1];
  *(void *)a3 = *(void *)&v13[0];
  *((void *)a3 + 1) = v6;
  v13[0] = v8;
  uint64_t v10 = *((void *)a3 + 2);
  *((void *)a3 + 2) = v9;
  *(void *)&v13[1] = v10;
  long long v11 = *(long long *)((char *)a3 + 24);
  *(long long *)((char *)a3 + 24) = *(_OWORD *)((char *)&v13[1] + 8);
  *(_OWORD *)((char *)&v13[1] + 8) = v11;
  LOBYTE(v10) = *((unsigned char *)a3 + 40);
  *((unsigned char *)a3 + 40) = BYTE8(v13[2]);
  uint64_t result = v8;
  BYTE8(v13[2]) = v10;
  if ((void)v8) {
    return MEMORY[0x192FAF290](v8, 0x1000C8077774924);
  }
  return result;
}

void sub_18E65A95C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4 = a2;
  unint64_t v5 = a1;
  uint64_t v6 = a2 - a1;
  if ((uint64_t)(a2 - a1) < 241)
  {
    uint64_t v7 = 0;
    goto LABEL_69;
  }
  uint64_t v7 = 0;
  do
  {
    int v8 = internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::ReverseKey>(v5, v5 + 24 * (v6 / 0x30uLL), v4 - 24, a3);
    int v9 = v8;
    unint64_t v10 = v5;
    unint64_t v11 = v4;
    unint64_t v12 = v5;
    unint64_t v13 = v4;
    while (v10 < v11)
    {
      unint64_t v14 = *(unsigned int *)(v10 + 8);
      int v15 = a3 >= v14 ? -1 : *(unsigned __int8 *)(*(void *)v10 - a3 - 1);
      if (v15 > v8) {
        break;
      }
      if (v15 == v8)
      {
        uint64_t v16 = *(void *)v10;
        *(void *)unint64_t v10 = *(void *)v12;
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(v12 + 8);
        uint64_t v17 = *(void *)(v10 + 12);
        *(_DWORD *)(v10 + 12) = *(_DWORD *)(v12 + 12);
        *(_DWORD *)(v10 + 16) = *(_DWORD *)(v12 + 16);
        *(void *)unint64_t v12 = v16;
        *(_DWORD *)(v12 + 8) = v14;
        *(void *)(v12 + 12) = v17;
        v12 += 24;
      }
LABEL_11:
      v10 += 24;
    }
    if (v10 < v11)
    {
      unint64_t v18 = v11 - 24;
      do
      {
        unint64_t v11 = v18;
        unint64_t v19 = *(unsigned int *)(v18 + 8);
        if (a3 >= v19) {
          int v20 = -1;
        }
        else {
          int v20 = *(unsigned __int8 *)(*(void *)v11 - a3 - 1);
        }
        if (v20 < v8) {
          break;
        }
        if (v20 == v8)
        {
          uint64_t v21 = *(void *)(v13 - 24);
          v13 -= 24;
          uint64_t v22 = *(void *)v11;
          *(void *)unint64_t v11 = v21;
          *(_DWORD *)(v11 + 8) = *(_DWORD *)(v13 + 8);
          uint64_t v23 = *(void *)(v11 + 12);
          *(_DWORD *)(v11 + 12) = *(_DWORD *)(v13 + 12);
          *(_DWORD *)(v11 + 16) = *(_DWORD *)(v13 + 16);
          *(void *)unint64_t v13 = v22;
          *(_DWORD *)(v13 + 8) = v19;
          *(void *)(v13 + 12) = v23;
        }
        unint64_t v18 = v11 - 24;
      }
      while (v10 < v11);
    }
    if (v10 < v11)
    {
      uint64_t v24 = *(void *)v10;
      int v25 = *(_DWORD *)(v10 + 16);
      *(void *)unint64_t v10 = *(void *)v11;
      uint64_t v26 = *(void *)(v10 + 8);
      *(_DWORD *)(v10 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v10 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v10 + 16) = *(_DWORD *)(v11 + 16);
      *(void *)unint64_t v11 = v24;
      *(void *)(v11 + 8) = v26;
      *(_DWORD *)(v11 + 16) = v25;
      goto LABEL_11;
    }
    uint64_t v44 = v7;
    if (v12 > v5)
    {
      uint64_t v27 = 0;
      do
      {
        uint64_t v28 = v12 + v27;
        uint64_t v29 = v10 + v27;
        uint64_t v30 = *(void *)(v12 + v27 - 24);
        int v31 = *(_DWORD *)(v12 + v27 - 8);
        *(void *)(v28 - 24) = *(void *)(v10 + v27 - 24);
        uint64_t v32 = *(void *)(v12 + v27 - 16);
        *(_DWORD *)(v28 - 16) = *(_DWORD *)(v10 + v27 - 16);
        *(_DWORD *)(v28 - 12) = *(_DWORD *)(v10 + v27 - 12);
        *(_DWORD *)(v28 - 8) = *(_DWORD *)(v10 + v27 - 8);
        *(void *)(v29 - 24) = v30;
        *(void *)(v29 - 16) = v32;
        *(_DWORD *)(v29 - 8) = v31;
        v27 -= 24;
      }
      while (v12 + v27 > v5);
      v10 += v27;
    }
    while (v13 < v4)
    {
      uint64_t v33 = *(void *)v13;
      int v34 = *(_DWORD *)(v13 + 16);
      *(void *)unint64_t v13 = *(void *)v11;
      uint64_t v35 = *(void *)(v13 + 8);
      *(_DWORD *)(v13 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v13 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v13 + 16) = *(_DWORD *)(v11 + 16);
      *(void *)unint64_t v11 = v33;
      *(void *)(v11 + 8) = v35;
      *(_DWORD *)(v11 + 16) = v34;
      v11 += 24;
      v13 += 24;
    }
    uint64_t v36 = v10 - v5;
    int64_t v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - v5) >> 3);
    uint64_t v38 = v11 - v10;
    int64_t v39 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v10) >> 3);
    if (v37 <= v39)
    {
      uint64_t v40 = v4 - v11;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)) <= v39)
      {
        if (v36 == 24)
        {
          uint64_t v41 = v44 + 1;
        }
        else
        {
          if (v36 < 25) {
            goto LABEL_53;
          }
          uint64_t v41 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v5, v10, a3)+ v44;
        }
        uint64_t v44 = v41;
LABEL_53:
        if (v40 == 24)
        {
          uint64_t v7 = v44 + 1;
        }
        else if (v40 < 25)
        {
          uint64_t v7 = v44;
        }
        else
        {
          uint64_t v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v11, v4, a3)+ v44;
        }
        if (v38 == 24)
        {
          ++v7;
        }
        else if (v38 >= 25)
        {
          if (v9 == -1)
          {
            ++v7;
            unint64_t v5 = v11;
            goto LABEL_64;
          }
          ++a3;
        }
        unint64_t v5 = v10;
LABEL_64:
        unint64_t v4 = v11;
        goto LABEL_65;
      }
    }
    if (v38 == 24) {
      goto LABEL_32;
    }
    if (v38 < 25)
    {
      uint64_t v7 = v44;
    }
    else if (v8 == -1)
    {
LABEL_32:
      uint64_t v7 = v44 + 1;
    }
    else
    {
      uint64_t v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v10, v11, a3 + 1)+ v44;
    }
    uint64_t v42 = v4 - v11;
    if (v37 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)))
    {
      if (v42 == 24)
      {
        ++v7;
      }
      else if (v42 >= 25)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v11, v4, a3);
      }
      unint64_t v4 = v10;
    }
    else
    {
      if (v36 == 24)
      {
        ++v7;
      }
      else if (v36 >= 25)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v5, v10, a3);
      }
      unint64_t v5 = v11;
    }
LABEL_65:
    uint64_t v6 = v4 - v5;
  }
  while ((uint64_t)(v4 - v5) > 240);
LABEL_69:
  if (v6 >= 25) {
    v7 += internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::ReverseKey *>(v5, v4, a3);
  }
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (*(unsigned int *)(a1 + 8) <= a4) {
    int v4 = -1;
  }
  else {
    int v4 = *(unsigned __int8 *)(~a4 + *(void *)a1);
  }
  if (*(unsigned int *)(a2 + 8) <= a4) {
    int v5 = -1;
  }
  else {
    int v5 = *(unsigned __int8 *)(~a4 + *(void *)a2);
  }
  if (*(unsigned int *)(a3 + 8) <= a4) {
    int v6 = -1;
  }
  else {
    int v6 = *(unsigned __int8 *)(~a4 + *(void *)a3);
  }
  if (v4 <= v5) {
    int v7 = v5;
  }
  else {
    int v7 = v4;
  }
  if (v4 >= v5) {
    int v4 = v5;
  }
  if (v4 <= v6) {
    int v4 = v6;
  }
  if (v7 >= v6) {
    return v4;
  }
  else {
    return v7;
  }
}

uint64_t internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::ReverseKey *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a1 + 24;
  if (a1 + 24 >= a2) {
    return 1;
  }
  uint64_t v7 = 1;
  do
  {
    uint64_t v8 = v3;
    if (v3 <= a1)
    {
      int v10 = 0;
    }
    else
    {
      while (1)
      {
        unint64_t v9 = v8 - 24;
        int v10 = internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::ReverseKey>(v8 - 24, v8, a3);
        if (v10 < 1) {
          break;
        }
        uint64_t v11 = *(void *)(v8 - 24);
        int v12 = *(_DWORD *)(v8 - 8);
        *(void *)(v8 - 24) = *(void *)v8;
        uint64_t v13 = *(void *)(v8 + 8);
        *(_DWORD *)(v8 - 8) = *(_DWORD *)(v8 + 16);
        *(void *)uint64_t v8 = v11;
        uint64_t v14 = *(void *)(v8 - 16);
        *(void *)(v8 - 16) = v13;
        *(void *)(v8 + 8) = v14;
        *(_DWORD *)(v8 + 16) = v12;
        v8 -= 24;
        if (v9 <= a1)
        {
          int v10 = 1;
          break;
        }
      }
    }
    if (v10) {
      ++v7;
    }
    v3 += 24;
  }
  while (v3 < a2);
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = *(unsigned int *)(a1 + 8);
  uint64_t v4 = *(unsigned int *)(a2 + 8);
  unint64_t v5 = v3 - a3;
  if (v3 <= a3)
  {
LABEL_6:
    if (v3 < v4) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v3 == v4) {
      return 0;
    }
    else {
      return v12;
    }
  }
  else
  {
    uint64_t v6 = v4 - a3;
    uint64_t v7 = (unsigned __int8 *)(*(void *)a2 + ~a3);
    uint64_t v8 = (unsigned __int8 *)(*(void *)a1 + ~a3);
    while (v6)
    {
      int v9 = *v8;
      int v10 = *v7;
      uint64_t result = (v9 - v10);
      if (v9 != v10) {
        return result;
      }
      --v6;
      --v7;
      --v8;
      if (!--v5) {
        goto LABEL_6;
      }
    }
    return 1;
  }
}

char *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::realloc(uint64_t *a1, uint64_t a2)
{
  uint64_t result = (char *)operator new[](12 * a2, MEMORY[0x1E4FBA2D0]);
  uint64_t v5 = a1[3];
  if (v5)
  {
    uint64_t v6 = (_DWORD *)(a1[1] + 8);
    uint64_t v7 = result + 8;
    do
    {
      *((void *)v7 - 1) = *((void *)v6 - 1);
      int v8 = *v6;
      v6 += 3;
      *uint64_t v7 = v8;
      v7 += 3;
      --v5;
    }
    while (v5);
  }
  uint64_t v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
  {
    JUMPOUT(0x192FAF290);
  }
  return result;
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned char>::map_(uint64_t a1, internal::marisa::grimoire::io::Mapper *this)
{
  unint64_t v4 = *(void *)internal::marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  *(void *)(a1 + 16) = internal::marisa::grimoire::io::Mapper::map_data(this, v4);
  internal::marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(void *)(a1 + 24) = v4;
  return internal::marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned char>::write_(uint64_t a1, internal::marisa::grimoire::io::Writer *this)
{
  uint64_t __buf = *(void *)(a1 + 24);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  internal::marisa::grimoire::io::Writer::write<unsigned char>((uint64_t)this, *(char **)(a1 + 16), *(void *)(a1 + 24));
  return internal::marisa::grimoire::io::Writer::seek((uint64_t)this, -*(_DWORD *)(a1 + 24) & 7);
}

uint64_t internal::marisa::grimoire::io::Writer::write<unsigned char>(uint64_t a1, char *a2, size_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x200000021;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer."
                   "h:33: MARISA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
  }
  return internal::marisa::grimoire::io::Writer::write_data(a1, a2, a3);
}

double internal::marisa::grimoire::trie::Tail::Tail(internal::marisa::grimoire::trie::Tail *this)
{
  double result = 0.0;
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *(_OWORD *)((char *)this + 73) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 185) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  return result;
}

uint64_t internal::marisa::grimoire::trie::Tail::build(long long *a1, uint64_t a2, long long *a3, int a4)
{
  if (!a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc";
    exception[2] = 0x200000011;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc:17: MA"
          "RISA_NULL_ERROR: offsets == NULL";
    goto LABEL_28;
  }
  if (a4 == 0x2000) {
    goto LABEL_15;
  }
  if (a4 != 4096)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc";
    exception[2] = 0x500000028;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc:40: MA"
          "RISA_CODE_ERROR: undefined tail mode";
LABEL_28:
    exception[3] = v17;
  }
  uint64_t v5 = *(void *)(a2 + 24);
  if (v5)
  {
    uint64_t v6 = 0;
    a4 = 4096;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + 8) + 16 * v6;
      uint64_t v8 = *(unsigned int *)(v7 + 8);
      if (v8) {
        break;
      }
LABEL_11:
      if (++v6 == v5) {
        goto LABEL_15;
      }
    }
    uint64_t v9 = -v8;
    uint64_t v10 = *(void *)v7 + 1;
    while (*(unsigned char *)(v10 + v9))
    {
      if (__CFADD__(v9++, 1)) {
        goto LABEL_11;
      }
    }
    a4 = 0x2000;
  }
  else
  {
    a4 = 4096;
  }
LABEL_15:
  memset(v18, 0, 41);
  memset(v19, 0, 41);
  long long v22 = 0u;
  memset(v23, 0, sizeof(v23));
  long long v24 = 0u;
  memset(v25, 0, sizeof(v25));
  v19[3] = 0u;
  long long v20 = 0u;
  memset(v21, 0, sizeof(v21));
  internal::marisa::grimoire::trie::Tail::build_((uint64_t)v18, a2, a3, a4);
  long long v12 = *a1;
  *a1 = v18[0];
  v18[0] = v12;
  uint64_t v13 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v18[1];
  *(void *)&v18[1] = v13;
  long long v14 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v18[1] + 8);
  *(_OWORD *)((char *)&v18[1] + 8) = v14;
  LOBYTE(v13) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v18[2]);
  BYTE8(v18[2]) = v13;
  internal::marisa::grimoire::vector::BitVector::swap((internal::marisa::grimoire::vector::BitVector *)(a1 + 3), (internal::marisa::grimoire::vector::BitVector *)v19);
  if ((void)v24) {
    MEMORY[0x192FAF290](v24, 0x1000C8077774924);
  }
  if ((void)v22) {
    MEMORY[0x192FAF290](v22, 0x1000C8077774924);
  }
  if ((void)v20) {
    MEMORY[0x192FAF290](v20, 0x1000C8077774924);
  }
  if (*(void *)&v19[0]) {
    MEMORY[0x192FAF290](*(void *)&v19[0], 0x1000C8077774924);
  }
  uint64_t result = *(void *)&v18[0];
  if (*(void *)&v18[0]) {
    return MEMORY[0x192FAF290](*(void *)&v18[0], 0x1000C8077774924);
  }
  return result;
}

void sub_18E65B46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t internal::marisa::grimoire::trie::Tail::build_(uint64_t a1, uint64_t a2, long long *a3, int a4)
{
  uint64_t v8 = *(void *)(a2 + 24);
  unint64_t v9 = *(void *)(a2 + 8);
  if (v8)
  {
    uint64_t v10 = 0;
    uint64_t v11 = (_DWORD *)(v9 + 12);
    do
    {
      *uint64_t v11 = v10;
      v11 += 4;
      ++v10;
    }
    while (v8 != v10);
  }
  internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v9, v9 + 16 * v8, 0);
  memset(v34, 0, 41);
  unint64_t v12 = *(void *)(a2 + 24);
  LODWORD(v33[0]) = 0;
  internal::marisa::grimoire::vector::Vector<unsigned int>::resize((uint64_t *)v34, v12, v33);
  v33[0] = 0;
  v33[1] = 0;
  uint64_t v13 = *(void *)(a2 + 24);
  if (v13)
  {
    long long v14 = v33;
    do
    {
      --v13;
      uint64_t v15 = *(void *)(a2 + 8);
      uint64_t v16 = v15 + 16 * v13;
      unint64_t v18 = (unsigned int *)(v16 + 8);
      uint64_t v17 = *(unsigned int *)(v16 + 8);
      if (!*(_DWORD *)(v16 + 8))
      {
        exception = __cxa_allocate_exception(0x20uLL);
        void *exception = &unk_1EDD69660;
        exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc";
        exception[2] = 0x4000000ACLL;
        exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/t"
                       "ail.cc:172: MARISA_RANGE_ERROR: current.length() == 0";
      }
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = *((unsigned int *)v14 + 2);
      while (v21 != v20)
      {
        if (*(unsigned __int8 *)(*v14 + v19) != *(unsigned __int8 *)(*(void *)v16 + v19)) {
          goto LABEL_13;
        }
        ++v20;
        --v19;
        if (v17 == v20) {
          goto LABEL_14;
        }
      }
      uint64_t v20 = *((unsigned int *)v14 + 2);
LABEL_13:
      if (v20 != v17)
      {
        uint64_t v22 = *((void *)&v34[0] + 1);
        goto LABEL_17;
      }
LABEL_14:
      uint64_t v22 = *((void *)&v34[0] + 1);
      if (v21)
      {
        *(_DWORD *)(*((void *)&v34[0] + 1) + 4 * *(unsigned int *)(v15 + 16 * v13 + 12)) = v21
                                                                                             - v17
                                                                                             + *(_DWORD *)(*((void *)&v34[0] + 1) + 4 * *((unsigned int *)v14 + 3));
        goto LABEL_29;
      }
LABEL_17:
      *(_DWORD *)(v22 + 4 * *(unsigned int *)(v15 + 16 * v13 + 12)) = *(void *)(a1 + 24);
      unint64_t v23 = *v18;
      if (v23)
      {
        for (unint64_t i = 0; i < v23; ++i)
        {
          char v32 = *(unsigned char *)(*(void *)v16 - v23 + i + 1);
          internal::marisa::grimoire::vector::Vector<unsigned char>::push_back((uint64_t *)a1, &v32);
          unint64_t v23 = *v18;
        }
        if (a4 != 4096)
        {
          if (v23 >= 2)
          {
            unint64_t v25 = 1;
            do
            {
              internal::marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 48), 0);
              ++v25;
            }
            while (v25 < *v18);
          }
LABEL_27:
          internal::marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 48), 1);
          goto LABEL_28;
        }
      }
      else if (a4 != 4096)
      {
        goto LABEL_27;
      }
      char v32 = 0;
      internal::marisa::grimoire::vector::Vector<unsigned char>::push_back((uint64_t *)a1, &v32);
LABEL_28:
      if (*(_DWORD *)(a1 + 28))
      {
        int v31 = __cxa_allocate_exception(0x20uLL);
        *int v31 = &unk_1EDD69660;
        v31[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc";
        v31[2] = 0x7000000C2;
        v31[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc"
                 ":194: MARISA_SIZE_ERROR: buf_.size() > MARISA_UINT32_MAX";
      }
LABEL_29:
      long long v14 = (void *)v16;
    }
    while (v13);
  }
  internal::marisa::grimoire::vector::Vector<unsigned char>::shrink((unsigned char *)a1);
  long long v26 = *a3;
  *a3 = v34[0];
  v34[0] = v26;
  uint64_t v27 = *((void *)a3 + 2);
  *((void *)a3 + 2) = *(void *)&v34[1];
  *(void *)&v34[1] = v27;
  long long v28 = *(long long *)((char *)a3 + 24);
  *(long long *)((char *)a3 + 24) = *(_OWORD *)((char *)&v34[1] + 8);
  *(_OWORD *)((char *)&v34[1] + 8) = v28;
  LOBYTE(v27) = *((unsigned char *)a3 + 40);
  *((unsigned char *)a3 + 40) = BYTE8(v34[2]);
  uint64_t result = v26;
  BYTE8(v34[2]) = v27;
  if ((void)v26) {
    return MEMORY[0x192FAF290](v26, 0x1000C8077774924);
  }
  return result;
}

void sub_18E65B7AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a13) {
    MEMORY[0x192FAF290](a13, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *internal::marisa::grimoire::trie::Tail::swap(internal::marisa::grimoire::trie::Tail *this, internal::marisa::grimoire::trie::Tail *a2)
{
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this, (uint64_t *)a2);
  return internal::marisa::grimoire::vector::BitVector::swap((internal::marisa::grimoire::trie::Tail *)((char *)this + 48), (internal::marisa::grimoire::trie::Tail *)((char *)a2 + 48));
}

uint64_t internal::marisa::grimoire::trie::Tail::map(internal::marisa::grimoire::trie::Tail *this, internal::marisa::grimoire::io::Mapper *a2)
{
  memset(v8, 0, 41);
  memset(v9, 0, 41);
  long long v12 = 0u;
  memset(v13, 0, sizeof(v13));
  long long v14 = 0u;
  memset(v15, 0, sizeof(v15));
  _OWORD v9[3] = 0u;
  long long v10 = 0u;
  memset(v11, 0, sizeof(v11));
  internal::marisa::grimoire::vector::Vector<char>::map(v8, a2);
  internal::marisa::grimoire::vector::BitVector::map((internal::marisa::grimoire::vector::BitVector *)v9, a2);
  long long v4 = *(_OWORD *)this;
  *(_OWORD *)this = v8[0];
  v8[0] = v4;
  uint64_t v5 = *((void *)this + 2);
  *((void *)this + 2) = *(void *)&v8[1];
  *(void *)&v8[1] = v5;
  long long v6 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(long long *)((char *)&v8[1] + 8);
  *(long long *)((char *)&v8[1] + 8) = v6;
  LOBYTE(v5) = *((unsigned char *)this + 40);
  *((unsigned char *)this + 40) = BYTE8(v8[2]);
  BYTE8(v8[2]) = v5;
  internal::marisa::grimoire::vector::BitVector::swap((internal::marisa::grimoire::trie::Tail *)((char *)this + 48), (internal::marisa::grimoire::vector::BitVector *)v9);
  if ((void)v14) {
    MEMORY[0x192FAF290](v14, 0x1000C8077774924);
  }
  if ((void)v12) {
    MEMORY[0x192FAF290](v12, 0x1000C8077774924);
  }
  if ((void)v10) {
    MEMORY[0x192FAF290](v10, 0x1000C8077774924);
  }
  if (*(void *)&v9[0]) {
    MEMORY[0x192FAF290](*(void *)&v9[0], 0x1000C8077774924);
  }
  uint64_t result = *(void *)&v8[0];
  if (*(void *)&v8[0]) {
    return MEMORY[0x192FAF290](*(void *)&v8[0], 0x1000C8077774924);
  }
  return result;
}

void sub_18E65B988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t internal::marisa::grimoire::trie::Tail::write(internal::marisa::grimoire::trie::Tail *this, internal::marisa::grimoire::io::Writer *a2)
{
  internal::marisa::grimoire::vector::Vector<unsigned char>::write_((uint64_t)this, a2);
  return internal::marisa::grimoire::vector::BitVector::write_((internal::marisa::grimoire::trie::Tail *)((char *)this + 48), a2);
}

void internal::marisa::grimoire::trie::Tail::restore(void *a1, std::string *this, unint64_t a3)
{
  unint64_t v3 = a3;
  if (a1[12])
  {
    do
    {
      std::string::push_back(this, *(unsigned char *)(a1[2] + v3));
      uint64_t v6 = *(void *)(a1[8] + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v3;
      ++v3;
    }
    while ((v6 & 1) == 0);
  }
  else
  {
    uint64_t v7 = a1[2];
    std::string::value_type v8 = *(unsigned char *)(v7 + a3);
    if (v8)
    {
      unint64_t v9 = (unsigned __int8 *)(a3 + v7 + 1);
      do
      {
        std::string::push_back(this, v8);
        int v10 = *v9++;
        std::string::value_type v8 = v10;
      }
      while (v10);
    }
  }
}

uint64_t internal::marisa::grimoire::trie::Tail::match(void *a1, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t a5)
{
  uint64_t v5 = a1[2];
  if (a1[12])
  {
    unint64_t v6 = *a4;
    do
    {
      if (*(unsigned __int8 *)(v5 + a5) != *(unsigned __int8 *)(a2 + v6)) {
        break;
      }
      *a4 = ++v6;
      if ((*(void *)(a1[8] + ((a5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a5)) {
        return 1;
      }
      ++a5;
    }
    while (v6 < a3);
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)(v5 + a5);
    unint64_t v8 = *a4;
    int v11 = *v7;
    unint64_t v9 = v7 + 1;
    int v10 = v11;
    while (v10 == *(unsigned __int8 *)(a2 + v8))
    {
      *a4 = ++v8;
      int v10 = *v9;
      if (!*v9) {
        return 1;
      }
      ++v9;
      if (v8 >= a3) {
        return 0;
      }
    }
  }
  return 0;
}

BOOL internal::marisa::grimoire::trie::Tail::prefix_match(void *a1, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t a5, std::string *this)
{
  unint64_t v7 = a5;
  if (a1[12])
  {
    unint64_t v12 = *a4;
    while (1)
    {
      int v13 = *(unsigned __int8 *)(a1[2] + v7);
      int v14 = *(unsigned __int8 *)(a2 + v12);
      BOOL v15 = v13 == v14;
      if (v13 != v14) {
        break;
      }
      std::string::push_back(this, v13);
      unint64_t v12 = *a4 + 1;
      *a4 = v12;
      if ((*(void *)(a1[8] + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7)) {
        break;
      }
      ++v7;
      if (v12 >= a3)
      {
        do
        {
          std::string::push_back(this, *(unsigned char *)(a1[2] + v7));
          uint64_t v16 = *(void *)(a1[8] + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7;
          ++v7;
        }
        while ((v16 & 1) == 0);
        return 1;
      }
    }
  }
  else
  {
    uint64_t v17 = a1[2];
    unint64_t v18 = *a4;
    unint64_t v19 = v17 + a5 - *a4;
    unsigned __int8 v20 = *(unsigned char *)(v17 + a5);
    unint64_t v21 = *a4;
    while (1)
    {
      int v22 = *(unsigned __int8 *)(a2 + v21);
      BOOL v15 = v20 == v22;
      if (v20 != v22) {
        break;
      }
      std::string::push_back(this, v20);
      unint64_t v23 = *a4;
      unint64_t v21 = *a4 + 1;
      *a4 = v21;
      unsigned __int8 v20 = *(unsigned char *)(v19 + v21);
      if (!v20) {
        break;
      }
      if (v21 >= a3)
      {
        long long v24 = (unsigned __int8 *)(v7 - v18 + v17 + v23 + 2);
        do
        {
          std::string::push_back(this, v20);
          int v25 = *v24++;
          unsigned __int8 v20 = v25;
        }
        while (v25);
        return 1;
      }
    }
  }
  return v15;
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned int>::resize(uint64_t *result, unint64_t a2, _DWORD *a3)
{
  unint64_t v4 = a2;
  uint64_t v5 = result;
  unint64_t v6 = result[4];
  if (v6 < a2)
  {
    uint64_t v7 = 2 * v6;
    if (v6 >> 61) {
      uint64_t v7 = 0x3FFFFFFFFFFFFFFFLL;
    }
    if (v6 > a2 >> 1) {
      a2 = v7;
    }
    uint64_t result = (uint64_t *)internal::marisa::grimoire::vector::Vector<unsigned int>::realloc(result, a2);
  }
  unint64_t v8 = v5[3];
  unint64_t v9 = v4 - v8;
  if (v4 > v8)
  {
    int v10 = (_DWORD *)(v5[1] + 4 * v8);
    do
    {
      *v10++ = *a3;
      --v9;
    }
    while (v9);
  }
  v5[3] = v4;
  return result;
}

uint64_t internal::marisa::grimoire::vector::Vector<char>::map(long long *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned char>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x192FAF290](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_18E65BD84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x192FAF290](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4 = a2;
  unint64_t v5 = a1;
  uint64_t v6 = a2 - a1;
  if ((uint64_t)(a2 - a1) < 161)
  {
    uint64_t v7 = 0;
    goto LABEL_68;
  }
  uint64_t v7 = 0;
  do
  {
    int v8 = internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::Entry>(v5, v5 + 16 * ((unint64_t)v6 >> 5), v4 - 16, a3);
    int v9 = v8;
    unint64_t v10 = v5;
    unint64_t v11 = v4;
    unint64_t v12 = v5;
    unint64_t v13 = v4;
    while (v10 < v11)
    {
      unint64_t v14 = *(unsigned int *)(v10 + 8);
      int v15 = a3 >= v14 ? -1 : *(unsigned __int8 *)(*(void *)v10 - a3);
      if (v15 > v8) {
        break;
      }
      if (v15 == v8)
      {
        uint64_t v16 = *(void *)v10;
        int v17 = *(_DWORD *)(v10 + 12);
        *(void *)unint64_t v10 = *(void *)v12;
        *(void *)(v10 + 8) = *(void *)(v12 + 8);
        *(void *)unint64_t v12 = v16;
        *(_DWORD *)(v12 + 8) = v14;
        *(_DWORD *)(v12 + 12) = v17;
        v12 += 16;
      }
LABEL_11:
      v10 += 16;
    }
    if (v10 < v11)
    {
      unint64_t v18 = v11 - 16;
      do
      {
        unint64_t v11 = v18;
        unint64_t v19 = *(unsigned int *)(v18 + 8);
        if (a3 >= v19) {
          int v20 = -1;
        }
        else {
          int v20 = *(unsigned __int8 *)(*(void *)v11 - a3);
        }
        if (v20 < v8) {
          break;
        }
        if (v20 == v8)
        {
          uint64_t v21 = *(void *)(v13 - 16);
          v13 -= 16;
          uint64_t v22 = *(void *)v11;
          int v23 = *(_DWORD *)(v11 + 12);
          *(void *)unint64_t v11 = v21;
          *(void *)(v11 + 8) = *(void *)(v13 + 8);
          *(void *)unint64_t v13 = v22;
          *(_DWORD *)(v13 + 8) = v19;
          *(_DWORD *)(v13 + 12) = v23;
        }
        unint64_t v18 = v11 - 16;
      }
      while (v10 < v11);
    }
    if (v10 < v11)
    {
      uint64_t v24 = *(void *)v10;
      *(void *)unint64_t v10 = *(void *)v11;
      uint64_t v25 = *(void *)(v11 + 8);
      *(void *)unint64_t v11 = v24;
      uint64_t v26 = *(void *)(v10 + 8);
      *(void *)(v10 + 8) = v25;
      *(void *)(v11 + 8) = v26;
      goto LABEL_11;
    }
    uint64_t v42 = v7;
    while (v12 > v5)
    {
      uint64_t v28 = *(void *)(v12 - 16);
      v12 -= 16;
      uint64_t v27 = v28;
      uint64_t v29 = *(void *)(v10 - 16);
      v10 -= 16;
      *(void *)unint64_t v12 = v29;
      uint64_t v30 = *(void *)(v10 + 8);
      *(void *)unint64_t v10 = v27;
      uint64_t v31 = *(void *)(v12 + 8);
      *(void *)(v12 + 8) = v30;
      *(void *)(v10 + 8) = v31;
    }
    while (v13 < v4)
    {
      uint64_t v32 = *(void *)v13;
      *(void *)unint64_t v13 = *(void *)v11;
      uint64_t v33 = *(void *)(v11 + 8);
      *(void *)unint64_t v11 = v32;
      uint64_t v34 = *(void *)(v13 + 8);
      *(void *)(v13 + 8) = v33;
      *(void *)(v11 + 8) = v34;
      v11 += 16;
      v13 += 16;
    }
    uint64_t v35 = v10 - v5;
    uint64_t v36 = (uint64_t)(v10 - v5) >> 4;
    uint64_t v37 = v11 - v10;
    if (v36 <= (uint64_t)(v11 - v10) >> 4)
    {
      uint64_t v38 = v4 - v11;
      if (v37 >> 4 >= (uint64_t)(v4 - v11) >> 4)
      {
        if (v35 == 16)
        {
          uint64_t v39 = v42 + 1;
        }
        else
        {
          if (v35 < 17) {
            goto LABEL_52;
          }
          uint64_t v39 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v5, v10, a3)+ v42;
        }
        uint64_t v42 = v39;
LABEL_52:
        if (v38 == 16)
        {
          uint64_t v7 = v42 + 1;
        }
        else if (v38 < 17)
        {
          uint64_t v7 = v42;
        }
        else
        {
          uint64_t v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v11, v4, a3)+ v42;
        }
        if (v37 == 16)
        {
          ++v7;
        }
        else if (v37 >= 17)
        {
          if (v9 == -1)
          {
            ++v7;
            unint64_t v5 = v11;
            goto LABEL_63;
          }
          ++a3;
        }
        unint64_t v5 = v10;
LABEL_63:
        unint64_t v4 = v11;
        goto LABEL_64;
      }
    }
    if (v37 == 16) {
      goto LABEL_31;
    }
    if (v37 < 17)
    {
      uint64_t v7 = v42;
    }
    else if (v8 == -1)
    {
LABEL_31:
      uint64_t v7 = v42 + 1;
    }
    else
    {
      uint64_t v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v10, v11, a3 + 1)+ v42;
    }
    uint64_t v40 = v4 - v11;
    if (v36 >= (uint64_t)(v4 - v11) >> 4)
    {
      if (v40 == 16)
      {
        ++v7;
      }
      else if (v40 >= 17)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v11, v4, a3);
      }
      unint64_t v4 = v10;
    }
    else
    {
      if (v35 == 16)
      {
        ++v7;
      }
      else if (v35 >= 17)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v5, v10, a3);
      }
      unint64_t v5 = v11;
    }
LABEL_64:
    uint64_t v6 = v4 - v5;
  }
  while ((uint64_t)(v4 - v5) > 160);
LABEL_68:
  if (v6 >= 17) {
    v7 += internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::Entry *>(v5, v4, a3);
  }
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::Entry>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (*(unsigned int *)(a1 + 8) <= a4) {
    int v4 = -1;
  }
  else {
    int v4 = *(unsigned __int8 *)(*(void *)a1 - a4);
  }
  if (*(unsigned int *)(a2 + 8) <= a4) {
    int v5 = -1;
  }
  else {
    int v5 = *(unsigned __int8 *)(*(void *)a2 - a4);
  }
  if (*(unsigned int *)(a3 + 8) <= a4) {
    int v6 = -1;
  }
  else {
    int v6 = *(unsigned __int8 *)(*(void *)a3 - a4);
  }
  if (v4 <= v5) {
    int v7 = v5;
  }
  else {
    int v7 = v4;
  }
  if (v4 >= v5) {
    int v4 = v5;
  }
  if (v4 <= v6) {
    int v4 = v6;
  }
  if (v7 >= v6) {
    return v4;
  }
  else {
    return v7;
  }
}

uint64_t internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::Entry *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  long long v3 = (void *)(a1 + 16);
  if (a1 + 16 >= a2) {
    return 1;
  }
  uint64_t v7 = 1;
  do
  {
    int v8 = v3;
    if ((unint64_t)v3 <= a1)
    {
      int v10 = 0;
    }
    else
    {
      while (1)
      {
        int v9 = v8 - 2;
        int v10 = internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::Entry>((uint64_t)(v8 - 2), (uint64_t)v8, a3);
        if (v10 < 1) {
          break;
        }
        uint64_t v11 = *(v8 - 2);
        *(v8 - 2) = *v8;
        uint64_t v12 = v8[1];
        *int v8 = v11;
        uint64_t v13 = *(v8 - 1);
        *(v8 - 1) = v12;
        v8[1] = v13;
        v8 -= 2;
        if ((unint64_t)v9 <= a1)
        {
          int v10 = 1;
          break;
        }
      }
    }
    if (v10) {
      ++v7;
    }
    v3 += 2;
  }
  while ((unint64_t)v3 < a2);
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::Entry>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = *(unsigned int *)(a1 + 8);
  uint64_t v4 = *(unsigned int *)(a2 + 8);
  unint64_t v5 = v3 - a3;
  if (v3 <= a3)
  {
LABEL_6:
    if (v3 < v4) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v3 == v4) {
      return 0;
    }
    else {
      return v12;
    }
  }
  else
  {
    uint64_t v6 = v4 - a3;
    uint64_t v7 = (unsigned __int8 *)(*(void *)a2 - a3);
    int v8 = (unsigned __int8 *)(*(void *)a1 - a3);
    while (v6)
    {
      int v9 = *v8;
      int v10 = *v7;
      uint64_t result = (v9 - v10);
      if (v9 != v10) {
        return result;
      }
      --v6;
      --v7;
      --v8;
      if (!--v5) {
        goto LABEL_6;
      }
    }
    return 1;
  }
}

uint64_t internal::marisa::grimoire::vector::BitVector::rank1(internal::marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  unint64_t v2 = a2 >> 9;
  uint64_t v3 = *((void *)this + 10);
  uint64_t v4 = *(unsigned int *)(v3 + 12 * (a2 >> 9));
  switch((a2 >> 6) & 7)
  {
    case 1uLL:
      unint64_t v5 = *(_DWORD *)(v3 + 12 * v2 + 4) & 0x7F;
      goto LABEL_10;
    case 2uLL:
      unint64_t v6 = (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 7;
      goto LABEL_5;
    case 3uLL:
      unint64_t v6 = (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 15;
LABEL_5:
      v4 += v6;
      break;
    case 4uLL:
      v4 += (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 23;
      break;
    case 5uLL:
      unint64_t v5 = *(_DWORD *)(v3 + 12 * v2 + 8) & 0x1FF;
      goto LABEL_10;
    case 6uLL:
      unint64_t v5 = ((unint64_t)*(unsigned int *)(v3 + 12 * v2 + 8) >> 9) & 0x1FF;
      goto LABEL_10;
    case 7uLL:
      unint64_t v5 = ((unint64_t)*(unsigned int *)(v3 + 12 * v2 + 8) >> 18) & 0x1FF;
LABEL_10:
      v4 += v5;
      break;
    default:
      break;
  }
  unint64_t v7 = *(void *)(*((void *)this + 2) + 8 * (a2 >> 6)) & ~(-1 << a2);
  unint64_t v8 = (((((v7 >> 1) & 0x5555555555555555) + (v7 & 0x5555555555555555)) >> 2) & 0x3333333333333333)
     + ((((v7 >> 1) & 0x5555555555555555) + (v7 & 0x5555555555555555)) & 0x3333333333333333);
  return v4 + ((0x101010101010101 * (((v8 >> 4) & 0x707070707070707) + (v8 & 0x707070707070707))) >> 56);
}

unint64_t internal::marisa::grimoire::vector::BitVector::select0(internal::marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 16);
  if ((a2 & 0x1FF) == 0) {
    return *(unsigned int *)(v2 + 4 * (a2 >> 9));
  }
  unint64_t v3 = *(_DWORD *)(v2 + 4 * (a2 >> 9)) >> 9;
  unint64_t v4 = (*(_DWORD *)(v2 + 4 * (a2 >> 9) + 4) + 511) >> 9;
  uint64_t v5 = *((void *)this + 10);
  if (v3 + 10 >= v4)
  {
    uint64_t v7 = v5 + 12 * v3;
    unint64_t v8 = v3-- << 9;
    int v9 = (unsigned int *)(v7 + 12);
    do
    {
      unsigned int v10 = *v9;
      v9 += 3;
      ++v3;
      v8 += 512;
    }
    while (v8 - v10 <= a2);
  }
  else
  {
    do
    {
      if (((v4 + v3) >> 1 << 9) - *(unsigned int *)(v5 + 12 * ((v4 + v3) >> 1)) > a2) {
        unint64_t v4 = (v4 + v3) >> 1;
      }
      else {
        unint64_t v3 = (v4 + v3) >> 1;
      }
    }
    while (v3 + 1 < v4);
  }
  uint64_t v11 = (unsigned int *)(v5 + 12 * v3);
  unint64_t v12 = v11[1];
  uint64_t v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(a2 - (v3 << 9) + *v11);
  uint64_t v14 = 8 * v3;
  if ((unint64_t)v13 >= 256 - (v12 >> 23))
  {
    unint64_t v15 = *(unsigned int *)(v5 + 12 * v3 + 8);
    uint64_t v16 = (v15 >> 9) & 0x1FF;
    if ((unint64_t)v13 >= 384 - v16)
    {
      uint64_t v18 = (v15 >> 18) & 0x1FF;
      if ((unint64_t)v13 >= 448 - v18)
      {
        v14 |= 7uLL;
        uint64_t v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v18 - 448);
      }
      else
      {
        v14 |= 6uLL;
        uint64_t v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v16 - 384);
      }
    }
    else if ((unint64_t)v13 >= 320 - (v15 & 0x1FF))
    {
      v14 |= 5uLL;
      uint64_t v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v15 & 0x1FF) - 320);
    }
    else
    {
      v14 |= 4uLL;
      uint64_t v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 >> 23) - 256);
    }
  }
  else if ((unint64_t)v13 >= 128 - (unint64_t)(v12 >> 7))
  {
    uint64_t v17 = (v12 >> 15);
    if ((unint64_t)v13 >= 192 - v17)
    {
      v14 |= 3uLL;
      uint64_t v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v17 - 192);
    }
    else
    {
      v14 |= 2uLL;
      uint64_t v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 >> 7)
                                                                                      - 128);
    }
  }
  else if ((unint64_t)v13 >= 64 - (v12 & 0x7F))
  {
    v14 |= 1uLL;
    uint64_t v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 & 0x7F) - 64);
  }
}

unint64_t internal::marisa::grimoire::vector::anonymous namespace'::select_bit(internal::marisa::grimoire::vector::_anonymous_namespace_ *this, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = (((a3 - ((a3 >> 1) & 0x5555555555555555)) >> 2) & 0x3333333333333333)
     + ((a3 - ((a3 >> 1) & 0x5555555555555555)) & 0x3333333333333333);
  uint64_t v4 = (v3 + (v3 >> 4)) & 0xF0F0F0F0F0F0F0FLL;
  unint64_t v5 = __clz(__rbit64(((((0x101010101010101 * v4) | 0x8080808080808080)
                      - 0x101010101010101 * (void)this
                      - 0x101010101010101) >> 7) & 0x101010101010101));
  return v5
       + a2
                                                                               * ((void)this
                                                                                - ((unint64_t)(0x101010101010100 * v4) >> v5))
                                                                               + (a3 >> v5)];
}

unint64_t internal::marisa::grimoire::vector::BitVector::select1(internal::marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 22);
  if ((a2 & 0x1FF) == 0) {
    return *(unsigned int *)(v2 + 4 * (a2 >> 9));
  }
  unint64_t v3 = *(_DWORD *)(v2 + 4 * (a2 >> 9)) >> 9;
  unint64_t v4 = (*(_DWORD *)(v2 + 4 * (a2 >> 9) + 4) + 511) >> 9;
  uint64_t v5 = *((void *)this + 10);
  if (v3 + 10 >= v4)
  {
    uint64_t v7 = v5 + 12 * v3--;
    unint64_t v8 = (unsigned int *)(v7 + 12);
    do
    {
      unsigned int v9 = *v8;
      v8 += 3;
      ++v3;
    }
    while (v9 <= a2);
  }
  else
  {
    do
    {
      if (*(unsigned int *)(v5 + 12 * ((v4 + v3) >> 1)) > a2) {
        unint64_t v4 = (v4 + v3) >> 1;
      }
      else {
        unint64_t v3 = (v4 + v3) >> 1;
      }
    }
    while (v3 + 1 < v4);
  }
  unsigned int v10 = (unsigned int *)(v5 + 12 * v3);
  unint64_t v11 = v10[1];
  unint64_t v12 = a2 - *v10;
  uint64_t v13 = 8 * v3;
  if (v12 >= v11 >> 23)
  {
    unint64_t v23 = v11 >> 23;
    unint64_t v24 = *(unsigned int *)(v5 + 12 * v3 + 8);
    unint64_t v25 = (v24 >> 9) & 0x1FF;
    unint64_t v26 = (v24 >> 18) & 0x1FF;
    uint64_t v27 = v13 | 7;
    BOOL v28 = v12 >= v26;
    if (v12 < v26) {
      uint64_t v29 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v25);
    }
    else {
      uint64_t v29 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v26);
    }
    if (!v28) {
      uint64_t v27 = v13 | 6;
    }
    unint64_t v30 = v24 & 0x1FF;
    uint64_t v31 = v13 | 5;
    uint64_t v32 = v13 | 4;
    uint64_t v33 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v23);
    BOOL v34 = v12 >= v30;
    if (v12 < v30) {
      uint64_t v21 = v33;
    }
    else {
      uint64_t v21 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v30);
    }
    if (v34) {
      uint64_t v32 = v31;
    }
    if (v12 < v25)
    {
      uint64_t v22 = v32;
    }
    else
    {
      uint64_t v21 = v29;
      uint64_t v22 = v27;
    }
  }
  else
  {
    unint64_t v14 = v11 >> 7;
    unint64_t v15 = (v11 >> 15);
    uint64_t v16 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - (v11 >> 7));
    if (v12 < v15)
    {
      uint64_t v17 = v13 | 2;
    }
    else
    {
      uint64_t v16 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v15);
      uint64_t v17 = v13 | 3;
    }
    unint64_t v18 = v11 & 0x7F;
    BOOL v20 = v12 >= v18;
    unint64_t v19 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v18);
    if (v20) {
      v13 |= 1uLL;
    }
    else {
      unint64_t v19 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)v12;
    }
    BOOL v20 = v12 >= v14;
    if (v12 < v14) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = v16;
    }
    if (v20) {
      uint64_t v22 = v17;
    }
    else {
      uint64_t v22 = v13;
    }
  }
}

void internal::marisa::grimoire::vector::BitVector::build_index(internal::marisa::grimoire::vector::BitVector *this, const internal::marisa::grimoire::vector::BitVector *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = a2;
  uint64_t v7 = this;
  unint64_t v8 = *((void *)a2 + 6);
  unsigned int v9 = (uint64_t *)((char *)this + 64);
  unint64_t v10 = v8 >> 9;
  if ((v8 & 0x1FF) != 0) {
    ++v10;
  }
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::resize(v9, v10 + 1);
  uint64_t v11 = *((void *)v6 + 3);
  if (!v11)
  {
    LODWORD(v14) = 0;
    if ((v8 & 0x1FF) == 0) {
      goto LABEL_41;
    }
    goto LABEL_29;
  }
  unint64_t v51 = v8 & 0x1FF;
  unint64_t v52 = v8;
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v53 = (uint64_t *)((char *)v7 + 160);
  uint64_t v54 = (uint64_t *)((char *)v7 + 112);
  uint64_t v57 = *((void *)v6 + 3);
  do
  {
    unint64_t v16 = v12 >> 9;
    switch(v13 & 7)
    {
      case 1:
        uint64_t v17 = (_DWORD *)(*((void *)v7 + 9) + 12 * v16);
        unsigned int v18 = v17[1] & 0xFFFFFF80 | (v14 - *v17) & 0x7F;
        goto LABEL_11;
      case 2:
        uint64_t v17 = (_DWORD *)(*((void *)v7 + 9) + 12 * v16);
        unsigned int v18 = v17[1] & 0xFFFF807F | ((v14 - *(unsigned char *)v17) << 7);
        goto LABEL_11;
      case 3:
        uint64_t v17 = (_DWORD *)(*((void *)v7 + 9) + 12 * v16);
        unsigned int v18 = v17[1] & 0xFF807FFF | ((v14 - *(unsigned char *)v17) << 15);
        goto LABEL_11;
      case 4:
        uint64_t v17 = (_DWORD *)(*((void *)v7 + 9) + 12 * v16);
        unsigned int v18 = v17[1] & 0x7FFFFF | ((unsigned __int16)(v14 - *(_WORD *)v17) << 23);
LABEL_11:
        v17[1] = v18;
        break;
      case 5:
        unint64_t v19 = (_DWORD *)(*((void *)v7 + 9) + 12 * v16);
        unsigned int v20 = v19[2] & 0xFFFFFE00 | (v14 - *v19) & 0x1FF;
        goto LABEL_15;
      case 6:
        unint64_t v19 = (_DWORD *)(*((void *)v7 + 9) + 12 * v16);
        unsigned int v20 = v19[2] & 0xFFFC01FF | (((v14 - *v19) & 0x1FF) << 9);
        goto LABEL_15;
      case 7:
        unint64_t v19 = (_DWORD *)(*((void *)v7 + 9) + 12 * v16);
        unsigned int v20 = v19[2] & 0xF803FFFF | (((v14 - *v19) & 0x1FF) << 18);
LABEL_15:
        v19[2] = v20;
        break;
      default:
        *(_DWORD *)(*((void *)v7 + 9) + 12 * v16) = v14;
        break;
    }
    unint64_t v21 = *(void *)(*((void *)v6 + 2) + 8 * v13);
    unint64_t v22 = (((((v21 >> 1) & 0x5555555555555555) + (v21 & 0x5555555555555555)) >> 2) & 0x3333333333333333)
        + ((((v21 >> 1) & 0x5555555555555555) + (v21 & 0x5555555555555555)) & 0x3333333333333333);
    unint64_t v23 = (0x101010101010101 * (((v22 >> 4) & 0x707070707070707) + (v22 & 0x707070707070707))) >> 56;
    if (a3)
    {
      unint64_t v24 = v6;
      uint64_t v25 = a3;
      unint64_t v26 = v7;
      uint64_t v27 = a4;
      uint64_t v28 = 64;
      if (v8 < 0x40) {
        uint64_t v28 = v8;
      }
      unint64_t v29 = v28 - v23;
      unint64_t v30 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(-(int)v15 & 0x1FFLL);
      if (v28 - v23 > (unint64_t)v30)
      {
        uint64_t v55 = v15;
        uint64_t v56 = v14;
        internal::marisa::grimoire::vector::Vector<unsigned int>::push_back(v54, &v58);
        uint64_t v15 = v55;
        uint64_t v14 = v56;
        uint64_t v11 = v57;
      }
      v15 += v29;
      a4 = v27;
      uint64_t v7 = v26;
      a3 = v25;
      unint64_t v6 = v24;
    }
    if (a4)
    {
      uint64_t v31 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(-(int)v14 & 0x1FFLL);
      if (v23 > (unint64_t)v31)
      {
        unint64_t v32 = v21;
        uint64_t v33 = v14;
        uint64_t v34 = v15;
        internal::marisa::grimoire::vector::Vector<unsigned int>::push_back(v53, &v58);
        uint64_t v15 = v34;
        uint64_t v11 = v57;
        uint64_t v14 = v33;
      }
    }
    v14 += v23;
    ++v13;
    v12 += 64;
    v8 -= 64;
  }
  while (v11 != v13);
  unint64_t v8 = v52;
  if (v51)
  {
LABEL_29:
    unint64_t v35 = (v8 - 1) >> 9;
    switch(((v8 - 1) >> 6) & 7)
    {
      case 0uLL:
        uint64_t v36 = *((void *)v7 + 9);
        uint64_t v37 = (_DWORD *)(v36 + 12 * v35);
        int v38 = v14 - *v37;
        unsigned int v39 = v37[1] & 0xFFFFFF80 | v38 & 0x7F;
        v37[1] = v39;
        goto LABEL_32;
      case 1uLL:
        uint64_t v36 = *((void *)v7 + 9);
        uint64_t v40 = (_DWORD *)(v36 + 12 * v35);
        unsigned int v39 = v40[1];
        int v38 = v14 - *v40;
LABEL_32:
        unsigned int v41 = v39 & 0xFFFF807F | (v38 << 7);
        *(_DWORD *)(v36 + 12 * v35 + 4) = v41;
        goto LABEL_34;
      case 2uLL:
        uint64_t v36 = *((void *)v7 + 9);
        uint64_t v42 = (_DWORD *)(v36 + 12 * v35);
        unsigned int v41 = v42[1];
        int v38 = v14 - *v42;
LABEL_34:
        unsigned int v43 = v41 & 0xFF807FFF | (v38 << 15);
        *(_DWORD *)(v36 + 12 * v35 + 4) = v43;
        goto LABEL_36;
      case 3uLL:
        uint64_t v36 = *((void *)v7 + 9);
        uint64_t v44 = (_DWORD *)(v36 + 12 * v35);
        unsigned int v43 = v44[1];
        int v38 = v14 - *v44;
LABEL_36:
        *(_DWORD *)(v36 + 12 * v35 + 4) = v43 & 0x7FFFFF | ((unsigned __int16)v38 << 23);
        goto LABEL_38;
      case 4uLL:
        uint64_t v36 = *((void *)v7 + 9);
        int v38 = v14 - *(_DWORD *)(v36 + 12 * v35);
LABEL_38:
        uint64_t v45 = v36 + 12 * v35;
        unsigned int v46 = *(_DWORD *)(v45 + 8) & 0xFFFFFE00 | v38 & 0x1FF;
        *(_DWORD *)(v45 + 8) = v46;
        goto LABEL_39;
      case 5uLL:
        uint64_t v36 = *((void *)v7 + 9);
        uint64_t v49 = (_DWORD *)(v36 + 12 * v35);
        unsigned int v46 = v49[2];
        int v38 = v14 - *v49;
LABEL_39:
        unsigned int v47 = v46 & 0xFFFC01FF | ((v38 & 0x1FF) << 9);
        *(_DWORD *)(v36 + 12 * v35 + 8) = v47;
        goto LABEL_40;
      case 6uLL:
        uint64_t v36 = *((void *)v7 + 9);
        unint64_t v50 = (_DWORD *)(v36 + 12 * v35);
        unsigned int v47 = v50[2];
        int v38 = v14 - *v50;
LABEL_40:
        *(_DWORD *)(v36 + 12 * v35 + 8) = v47 & 0xF803FFFF | ((v38 & 0x1FF) << 18);
        break;
      default:
        break;
    }
  }
LABEL_41:
  *((void *)v7 + 6) = v8;
  *((void *)v7 + 7) = *((void *)v6 + 7);
  *(_DWORD *)(*((void *)v7 + 9) + 12 * *((void *)v7 + 11) - 12) = v14;
  if (a3)
  {
    int v58 = v8;
    internal::marisa::grimoire::vector::Vector<unsigned int>::push_back((uint64_t *)v7 + 14, &v58);
    internal::marisa::grimoire::vector::Vector<unsigned int>::shrink((_DWORD *)v7 + 28);
  }
  if (a4)
  {
    unint64_t v48 = (uint64_t *)((char *)v7 + 160);
    int v58 = v8;
    internal::marisa::grimoire::vector::Vector<unsigned int>::push_back(v48, &v58);
    internal::marisa::grimoire::vector::Vector<unsigned int>::shrink(v48);
  }
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned int>::push_back(uint64_t *result, _DWORD *a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[3];
  unint64_t v5 = result[4];
  unint64_t v6 = v4 + 1;
  if (v5 < v4 + 1)
  {
    uint64_t v7 = 2 * v5;
    if (v5 >> 61) {
      uint64_t v7 = 0x3FFFFFFFFFFFFFFFLL;
    }
    if (v5 <= v6 >> 1) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = v7;
    }
    uint64_t result = (uint64_t *)internal::marisa::grimoire::vector::Vector<unsigned int>::realloc(result, v8);
    uint64_t v4 = v3[3];
    unint64_t v6 = v4 + 1;
  }
  *(_DWORD *)(v3[1] + 4 * v4) = *a2;
  v3[3] = v6;
  return result;
}

_DWORD *internal::marisa::grimoire::vector::Vector<unsigned int>::shrink(_DWORD *result)
{
  if (*((unsigned char *)result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_1EDD69660;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0x100000072;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:114: MARISA_STATE_ERROR: fixed_";
  }
  uint64_t v1 = *((void *)result + 3);
  if (v1 != *((void *)result + 4))
  {
    return internal::marisa::grimoire::vector::Vector<unsigned int>::realloc((uint64_t *)result, v1);
  }
  return result;
}

void nlp::CFScopedPtr<__CFBundle *>::reset(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  *a1 = 0;
}

void nlp::CFScopedPtr<__CFLocale const*>::reset(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void nlp::CFScopedPtr<__CFString const*>::reset(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

CEM::LocalizedStringTable *CEM::LocalizedStringTable::LocalizedStringTable(CEM::LocalizedStringTable *this, CFTypeRef cf, const __CFLocale *a3)
{
  *(void *)this = CFRetain(cf);
  unint64_t v5 = (CEM *)CFRetain(a3);
  *((void *)this + 1) = v5;
  FrameworkBundle = (CEM *)CEM::createFrameworkBundle(v5);
  *((void *)this + 2) = FrameworkBundle;
  *((void *)this + 3) = CEM::copyPreferredLocaleIdentifierFromFrameworkBundleWithLocale(FrameworkBundle, *((__CFBundle **)this + 1), v7);
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 850045863;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((void *)this + 12) = 0;
  return this;
}

void sub_18E65CF08(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  nlp::CFScopedPtr<__CFBundle *>::reset(v4);
  nlp::CFScopedPtr<__CFLocale const*>::reset(v2, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v1, 0);
  _Unwind_Resume(a1);
}

CFStringRef CEM::LocalizedStringTable::copyValueForKey(CEM::LocalizedStringTable *this, const __CFString *a2)
{
  BOOL IsChinese = CEM::deviceIsChinese(this);
  unint64_t v5 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (IsChinese)
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, a2);
    CFStringAppend(MutableCopy, @"@CH-SKU");
    if (MutableCopy)
    {
      CFDictionaryRef LocalizedDataView = (const __CFDictionary *)CEM::LocalizedStringTable::_getLocalizedDataView(this);
      if (CFDictionaryContainsKey(LocalizedDataView, MutableCopy)) {
        a2 = MutableCopy;
      }
    }
  }
  else
  {
    CFMutableStringRef MutableCopy = 0;
  }
  CFDictionaryRef v8 = (const __CFDictionary *)CEM::LocalizedStringTable::_getLocalizedDataView(this);
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v8, a2);
  if (Value)
  {
    CFStringRef Copy = CFStringCreateCopy(*v5, Value);
    if (!MutableCopy) {
      return Copy;
    }
    goto LABEL_11;
  }
  CFStringRef Copy = 0;
  if (MutableCopy) {
LABEL_11:
  }
    CFRelease(MutableCopy);
  return Copy;
}

void sub_18E65D01C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t CEM::LocalizedStringTable::_getLocalizedDataView(CEM::LocalizedStringTable *this)
{
  uint64_t v2 = (std::mutex *)((char *)this + 40);
  std::mutex::lock((std::mutex *)((char *)this + 40));
  uint64_t v3 = *((void *)this + 4);
  if (!v3)
  {
    uint64_t v4 = (const void *)CFBundleCopyLocalizedStringTableForLocalization();
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)this + 4, v4);
    uint64_t v3 = *((void *)this + 4);
  }
  std::mutex::unlock(v2);
  return v3;
}

void sub_18E65D0A0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFDictionary const*>::reset(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

uint64_t *std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v2 + 8), 0);
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

void nlp::CFScopedPtr<__CFURL const*>::reset(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  *a1 = 0;
}

uint64_t CEM::initNSBundle(CEM *this)
{
  if (CEM::FoundationLibrary(void)::token != -1) {
    dispatch_once(&CEM::FoundationLibrary(void)::token, &__block_literal_global_8);
  }
  if (CEM::initNSBundle(void)::token != -1) {
    dispatch_once(&CEM::initNSBundle(void)::token, &__block_literal_global);
  }
  return CEM::classNSBundle;
}

Class ___ZN3CEML12initNSBundleEv_block_invoke()
{
  Class result = objc_getClass("NSBundle");
  CEM::classNSBundle = (uint64_t)result;
  if (result)
  {
    CEM::getNSBundleClass[0] = CEM::NSBundleFunction;
  }
  else
  {
    uint64_t v1 = (CEM *)abort_report_np();
    return (Class)CEM::NSBundleFunction(v1);
  }
  return result;
}

uint64_t CEM::NSBundleFunction(CEM *this)
{
  return CEM::classNSBundle;
}

void *___ZN3CEML17FoundationLibraryEv_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/Foundation.framework/Foundation", 2);
  CEM::FoundationLibrary(void)::frameworkLibrary = (uint64_t)result;
  if (!result)
  {
    dlerror();
    uint64_t v1 = (CEM *)abort_report_np();
    return (void *)CEM::initNSString(v1);
  }
  return result;
}

uint64_t CEM::initNSString(CEM *this)
{
  if (CEM::FoundationLibrary(void)::token != -1) {
    dispatch_once(&CEM::FoundationLibrary(void)::token, &__block_literal_global_8);
  }
  if (CEM::initNSString(void)::token != -1) {
    dispatch_once(&CEM::initNSString(void)::token, &__block_literal_global_15);
  }
  return CEM::classNSString;
}

Class ___ZN3CEML12initNSStringEv_block_invoke()
{
  Class result = objc_getClass("NSString");
  CEM::classNSString = (uint64_t)result;
  if (result)
  {
    CEM::getNSStringClass = CEM::NSStringFunction;
  }
  else
  {
    uint64_t v1 = (CEM *)abort_report_np();
    return (Class)CEM::NSStringFunction(v1);
  }
  return result;
}

uint64_t CEM::NSStringFunction(CEM *this)
{
  return CEM::classNSString;
}

CFStringRef CEM::VoiceoverStrings::createDescription(CEM::LocalizedStringTable **a1, CFStringRef theString, int a3, int a4)
{
  if (!theString || !*a1) {
    return 0;
  }
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  CFStringTransform(MutableCopy, 0, @"Any-SoftbankSMS", 0);
  if (CFStringCompare(theString, MutableCopy, 0))
  {
    VoiceoverSearchKeyForEmojunint64_t i = createVoiceoverSearchKeyForEmoji(MutableCopy, 0, a3, a4);
    CFStringRef v10 = CEM::LocalizedStringTable::copyValueForKey(*a1, VoiceoverSearchKeyForEmoji);
    if (v10) {
      goto LABEL_12;
    }
  }
  else
  {
    VoiceoverSearchKeyForEmojunint64_t i = 0;
  }
  uint64_t v11 = createVoiceoverSearchKeyForEmoji(theString, 0, a3, a4);
  if (VoiceoverSearchKeyForEmoji) {
    CFRelease(VoiceoverSearchKeyForEmoji);
  }
  CFStringRef v10 = CEM::LocalizedStringTable::copyValueForKey(*a1, v11);
  if (v10)
  {
    VoiceoverSearchKeyForEmojunint64_t i = v11;
LABEL_12:
    if (!VoiceoverSearchKeyForEmoji) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  VoiceoverSearchKeyForEmojunint64_t i = createVoiceoverSearchKeyForEmoji(theString, 1, a3, a4);
  if (v11) {
    CFRelease(v11);
  }
  CFStringRef v10 = CEM::LocalizedStringTable::copyValueForKey(*a1, VoiceoverSearchKeyForEmoji);
  if (!VoiceoverSearchKeyForEmoji) {
    goto LABEL_14;
  }
LABEL_13:
  CFRelease(VoiceoverSearchKeyForEmoji);
LABEL_14:
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v10;
}

void sub_18E65D51C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  unint64_t v5 = va_arg(va2, const void *);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2);
  _Unwind_Resume(a1);
}

__CFString *createVoiceoverSearchKeyForEmoji(const __CFString *a1, int a2, int a3, int a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  CFIndex Length = CFStringGetLength(a1);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, @"UnicodeHex.");
  CFStringRef theString = a1;
  uint64_t v32 = 0;
  CFIndex v33 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  unint64_t v30 = (UniChar *)CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  int64_t v34 = 0;
  int64_t v35 = 0;
  uint64_t v31 = CStringPtr;
  if (Length >= 1)
  {
    for (int64_t i = 0; i != Length; ++i)
    {
      CFIndex v12 = v33;
      if (v33 <= i)
      {
        LOWORD(v15) = 0;
      }
      else
      {
        uint64_t v13 = v30;
        if (v30)
        {
          int64_t v14 = v32 + i;
          goto LABEL_8;
        }
        if (!v31)
        {
          int64_t v20 = v34;
          if (v35 <= i || v34 > i)
          {
            int64_t v22 = i - 4;
            if ((unint64_t)i < 4) {
              int64_t v22 = 0;
            }
            if (v22 + 64 < v33) {
              CFIndex v12 = v22 + 64;
            }
            int64_t v34 = v22;
            int64_t v35 = v12;
            v38.location = v32 + v22;
            v38.length = v12 - v22;
            CFStringGetCharacters(theString, v38, buffer);
            int64_t v20 = v34;
          }
          int64_t v14 = i - v20;
          uint64_t v13 = buffer;
LABEL_8:
          int v15 = v13[v14];
          if (v15 == 8205) {
            int v16 = a2;
          }
          else {
            int v16 = 1;
          }
          if (i == Length - 1 && v15 == 65039 || v16 == 0) {
            continue;
          }
          goto LABEL_22;
        }
        LOWORD(v15) = v31[v32 + i];
      }
      int v15 = (unsigned __int16)v15;
LABEL_22:
      snprintf(__str, 0x10uLL, "%x", v15);
      CFStringRef v19 = CFStringCreateWithCString(0, __str, 0x8000100u);
      CFStringAppend(Mutable, v19);
      CFRelease(v19);
    }
  }
  if (a3 || a4)
  {
    unint64_t v23 = @".diverse";
    if (a4) {
      BOOL v24 = a3 == 0;
    }
    else {
      BOOL v24 = 1;
    }
    if (!v24) {
      unint64_t v23 = @".diverse_hair";
    }
    if (a3) {
      CFStringRef v25 = v23;
    }
    else {
      CFStringRef v25 = @".hair";
    }
    CFStringAppend(Mutable, v25);
    if (a4 == 4) {
      CFStringAppend(Mutable, @"@bald");
    }
  }
  return Mutable;
}

void nlp::CFScopedPtr<__CFString *>::reset(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  *a1 = 0;
}

void std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor(v4 - 32);
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *CEM::AdaptationDatabase::executeStatement(CEM::AdaptationDatabase *this, CEM::Statement *a2, uint64_t a3)
{
  _OWORD v4[4] = *MEMORY[0x1E4F143B8];
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  v4[0] = &unk_1EDD69D18;
  v4[1] = this;
  v4[3] = v4;
  CEM::AdaptationDatabase::executeStatement((uint64_t)a2, a3, (uint64_t)v4);
  return std::__function::__value_func<void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::~__value_func[abi:ne180100](v4);
}

void sub_18E65D8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10)
{
}

void std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        unint64_t v6 = v4 - 24;
        std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(*((void **)v4 - 2));
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void CEM::Statement::~Statement(void **this)
{
  uint64_t v2 = this + 7;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 55) < 0) {
    operator delete(this[4]);
  }
}

void std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,0>(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 24);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_1EDD6A340[v2])(&v4, a1);
  }
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSJ_1EJS8_jdSE_SH_EEEEEEDcSL_DpT0_(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSJ_1EJS8_jdSE_SH_EEEEEEDcSL_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

void CEM::AdaptationDatabase::executeStatement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v42 = (std::mutex *)(a1 + 32);
  std::mutex::lock((std::mutex *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 24);
  if (v5)
  {
    *(void *)(a2 + 96) = v5;
    CEM::Statement::prepare((CEM::Statement *)a2);
    while (1)
    {
      if (!*(void *)(a2 + 80)) {
        goto LABEL_55;
      }
      uint64_t v6 = *(void *)(a2 + 56);
      if (*(void *)(a2 + 64) == v6) {
        goto LABEL_49;
      }
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      while (1)
      {
        LODWORD(v44) = 1;
        *(void *)buf = a2;
        *(void *)&buf[8] = &v44;
        *(void *)&buf[16] = v8;
        uint64_t v9 = *(unsigned int *)(v6 + v7 + 24);
        if (v9 == -1) {
          std::__throw_bad_variant_access[abi:ne180100]();
        }
        *(void *)&long long v46 = buf;
        ((void (*)(long long *))*(&off_1EDD6A3B8 + v9))(&v46);
        if (v44) {
          break;
        }
        ++v8;
        uint64_t v6 = *(void *)(a2 + 56);
        v7 += 32;
        if (v8 >= (*(void *)(a2 + 64) - v6) >> 5) {
          goto LABEL_49;
        }
      }
      if (cem_logging_get_adaptation_log_onceToken != -1) {
        dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
      }
      CFStringRef v10 = cem_logging_get_adaptation_log_log;
      if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
      {
        int v11 = *(char *)(a2 + 55);
        uint64_t v12 = *(void *)(a2 + 32);
        uint64_t v13 = sqlite3_errmsg(*(sqlite3 **)(a2 + 96));
        *(_DWORD *)buf = 67109634;
        uint64_t v14 = a2 + 32;
        if (v11 < 0) {
          uint64_t v14 = v12;
        }
        *(_DWORD *)&buf[4] = v8;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = v14;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = v13;
        _os_log_error_impl(&dword_18E64B000, v10, OS_LOG_TYPE_ERROR, "Could not bind argument (%d) for query '%{public}s'. Error: '%{public}s'", buf, 0x1Cu);
      }
LABEL_49:
      while (1)
      {
        int v40 = sqlite3_step(*(sqlite3_stmt **)(a2 + 80));
        *(_DWORD *)(a2 + 104) = v40;
        if (v40 != 100) {
          break;
        }
        v45[0] = 0;
        v45[1] = 0;
        uint64_t v44 = (uint64_t *)v45;
        int v15 = sqlite3_column_count(*(sqlite3_stmt **)(a2 + 80));
        if (v15)
        {
          uint64_t v16 = 0;
          uint64_t v17 = v15;
          do
          {
            unsigned int v18 = sqlite3_column_name(*(sqlite3_stmt **)(a2 + 80), v16);
            size_t v19 = strlen(v18);
            switch(sqlite3_column_type(*(sqlite3_stmt **)(a2 + 80), v16))
            {
              case 1:
                *(_DWORD *)buf = sqlite3_column_int(*(sqlite3_stmt **)(a2 + 80), v16);
                *(_DWORD *)&buf[24] = 1;
                break;
              case 2:
                *(void *)buf = sqlite3_column_double(*(sqlite3_stmt **)(a2 + 80), v16);
                int v21 = 2;
                goto LABEL_26;
              case 3:
                int64_t v20 = (char *)sqlite3_column_text(*(sqlite3_stmt **)(a2 + 80), v16);
                std::string::basic_string[abi:ne180100]<0>(&v46, v20);
                *(_OWORD *)buf = v46;
                *(void *)&buf[16] = v47;
                int v21 = 3;
LABEL_26:
                *(_DWORD *)&buf[24] = v21;
                break;
              case 4:
                int v22 = sqlite3_column_bytes(*(sqlite3_stmt **)(a2 + 80), v16);
                unint64_t v23 = sqlite3_column_blob(*(sqlite3_stmt **)(a2 + 80), v16);
                if (v22)
                {
                  if (v22 < 0) {
                    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                  }
                  BOOL v24 = v23;
                  CFStringRef v25 = (char *)operator new(v22);
                  unint64_t v26 = &v25[v22];
                  memmove(v25, v24, v22);
                  *(void *)&long long v27 = v25;
                  *((void *)&v27 + 1) = v26;
                }
                else
                {
                  unint64_t v26 = 0;
                  long long v27 = 0uLL;
                }
                *(_OWORD *)buf = v27;
                *(void *)&buf[16] = v26;
                *(_DWORD *)&buf[24] = 4;
                break;
              case 5:
                *(_DWORD *)&buf[24] = 0;
                break;
              default:
                __assert_rtn("getValueForColumnAtIndex", "Statement.cpp", 94, "false && \"SQLITE column type currently not supported.\"");
            }
            uint64_t v28 = (char *)operator new(0x58uLL);
            unint64_t v29 = v28;
            *(void *)&long long v46 = v28;
            *((void *)&v46 + 1) = v45;
            unint64_t v30 = v28 + 32;
            LOBYTE(v47) = 0;
            if (v19 >= 0x7FFFFFFFFFFFFFF8) {
              std::string::__throw_length_error[abi:ne180100]();
            }
            if (v19 >= 0x17)
            {
              uint64_t v31 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v19 | 7) != 0x17) {
                uint64_t v31 = v19 | 7;
              }
              uint64_t v32 = v31 + 1;
              unint64_t v30 = operator new(v31 + 1);
              *((void *)v29 + 5) = v19;
              *((void *)v29 + 6) = v32 | 0x8000000000000000;
              *((void *)v29 + 4) = v30;
            }
            else
            {
              v28[55] = v19;
              if (!v19) {
                goto LABEL_37;
              }
            }
            memmove(v30, v18, v19);
LABEL_37:
            *((unsigned char *)v30 + v19) = 0;
            v29[56] = 0;
            *((_DWORD *)v29 + 20) = -1;
            int v33 = *(_DWORD *)&buf[24];
            if (*(_DWORD *)&buf[24] != -1)
            {
              ((void (*)(char *))*(&off_1EDD6A390 + *(unsigned int *)&buf[24]))(&v48);
              *((_DWORD *)v29 + 20) = v33;
            }
            LOBYTE(v47) = 1;
            int64_t v34 = (uint64_t *)v46;
            int64_t v35 = v45;
            uint64_t v36 = v45;
            for (int64_t i = v45[0]; i; int64_t i = v35[1])
            {
              while (1)
              {
                int64_t v35 = (uint64_t **)i;
                CFRange v38 = i + 4;
                if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v34 + 4, i + 4) & 0x80) == 0) {
                  break;
                }
                int64_t i = *v35;
                uint64_t v36 = v35;
                if (!*v35) {
                  goto LABEL_45;
                }
              }
              if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v38, v34 + 4) & 0x80) == 0) {
                goto LABEL_46;
              }
              uint64_t v36 = v35 + 1;
            }
LABEL_45:
            std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::__insert_node_at(&v44, (uint64_t)v35, v36, v34);
            *(void *)&long long v46 = 0;
LABEL_46:
            std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v46);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
            ++v16;
          }
          while (v16 != v17);
        }
        uint64_t v39 = *(void *)(a3 + 24);
        if (!v39) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        (*(void (**)(uint64_t, uint64_t **))(*(void *)v39 + 48))(v39, &v44);
        std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(v45[0]);
      }
      *(_DWORD *)(a2 + 104) = sqlite3_finalize(*(sqlite3_stmt **)(a2 + 80));
      CEM::Statement::prepare((CEM::Statement *)a2);
    }
  }
  if (cem_logging_get_adaptation_log_onceToken != -1) {
    dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
  }
  unsigned int v41 = cem_logging_get_adaptation_log_log;
  if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18E64B000, v41, OS_LOG_TYPE_DEBUG, "Database connection uninitialized; not executing SQL statement.",
      buf,
      2u);
  }
LABEL_55:
  std::mutex::unlock(v42);
}

void sub_18E65E0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::mutex *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void *std::__function::__value_func<void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t **std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::__insert_node_at(uint64_t **result, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  char v4 = (uint64_t *)**result;
  if (v4)
  {
    *Class result = v4;
    a4 = *a3;
  }
  uint64_t v5 = result[1];
  *((unsigned char *)a4 + 24) = a4 == v5;
  if (a4 != v5)
  {
    do
    {
      uint64_t v6 = (uint64_t *)a4[2];
      if (*((unsigned char *)v6 + 24)) {
        break;
      }
      uint64_t v7 = (uint64_t *)v6[2];
      unint64_t v8 = (uint64_t *)*v7;
      if ((uint64_t *)*v7 == v6)
      {
        uint64_t v11 = v7[1];
        if (!v11 || (v12 = *(unsigned __int8 *)(v11 + 24), uint64_t v9 = (unsigned char *)(v11 + 24), v12))
        {
          if ((uint64_t *)*v6 == a4)
          {
            uint64_t v13 = (uint64_t **)a4[2];
          }
          else
          {
            uint64_t v13 = (uint64_t **)v6[1];
            uint64_t v14 = *v13;
            v6[1] = (uint64_t)*v13;
            if (v14)
            {
              v14[2] = (uint64_t)v6;
              uint64_t v7 = (uint64_t *)v6[2];
            }
            v13[2] = v7;
            *(void *)(v6[2] + 8 * (*(void *)v6[2] != (void)v6)) = v13;
            *uint64_t v13 = v6;
            v6[2] = (uint64_t)v13;
            uint64_t v7 = v13[2];
            uint64_t v6 = (uint64_t *)*v7;
          }
          *((unsigned char *)v13 + 24) = 1;
          *((unsigned char *)v7 + 24) = 0;
          uint64_t v17 = v6[1];
          *uint64_t v7 = v17;
          if (v17) {
            *(void *)(v17 + 16) = v7;
          }
          v6[2] = v7[2];
          *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v6;
          v6[1] = (uint64_t)v7;
          goto LABEL_29;
        }
      }
      else if (!v8 || (v10 = *((unsigned __int8 *)v8 + 24), uint64_t v9 = v8 + 3, v10))
      {
        if ((uint64_t *)*v6 == a4)
        {
          uint64_t v15 = a4[1];
          *uint64_t v6 = v15;
          if (v15)
          {
            *(void *)(v15 + 16) = v6;
            uint64_t v7 = (uint64_t *)v6[2];
          }
          a4[2] = (uint64_t)v7;
          *(void *)(v6[2] + 8 * (*(void *)v6[2] != (void)v6)) = a4;
          a4[1] = (uint64_t)v6;
          v6[2] = (uint64_t)a4;
          uint64_t v7 = (uint64_t *)a4[2];
        }
        else
        {
          a4 = (uint64_t *)a4[2];
        }
        *((unsigned char *)a4 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v6 = (uint64_t *)v7[1];
        uint64_t v16 = *v6;
        v7[1] = *v6;
        if (v16) {
          *(void *)(v16 + 16) = v7;
        }
        v6[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v6;
        *uint64_t v6 = (uint64_t)v7;
LABEL_29:
        v7[2] = (uint64_t)v6;
        break;
      }
      *((unsigned char *)v6 + 24) = 1;
      a4 = v7;
      *((unsigned char *)v7 + 24) = v7 == v5;
      *uint64_t v9 = 1;
    }
    while (v7 != v5);
  }
  result[2] = (uint64_t *)((char *)result[2] + 1);
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,0>((uint64_t)v1 + 32);
    }
    operator delete(v1);
  }
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void *a2)
{
  size_t v2 = a1[1];
  if (*((char *)a1 + 23) >= 0)
  {
    size_t v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = (void *)*a1;
    size_t v3 = v2;
  }
  size_t v4 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (void *)*a2;
    size_t v5 = v4;
  }
  if (v5 >= v3) {
    size_t v6 = v3;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7)
  {
    if ((v7 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (v3 == v5) {
      return 0;
    }
    if (v3 >= v5) {
      return 1;
    }
  }
  return 255;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSP_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEEOSX_EEEDcSP_DpT0_(uint64_t a1, __n128 *a2, __n128 *a3)
{
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  __n128 result = *a3;
  *a2 = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  a3[1].n128_u64[0] = 0;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSP_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEEOSX_EEEDcSP_DpT0_(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  *a2 = result;
  a3->n128_u64[1] = 0;
  a3[1].n128_u64[0] = 0;
  a3->n128_u64[0] = 0;
  return result;
}

double _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSP_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEEOSX_EEEDcSP_DpT0_(uint64_t a1, void *a2, double *a3)
{
  double result = *a3;
  *a2 = *(void *)a3;
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSP_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEEOSX_EEEDcSP_DpT0_(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *a2 = *a3;
}

void *std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::target_type()
{
}

uint64_t std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN3CEM18AdaptationDatabase16executeStatementERNS_9StatementEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  if ((a2 & a1) < 0 != __OFSUB__(a1, a2)) {
    return strcmp((const char *)(a1 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(a2 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::operator()(uint64_t a1, void *a2)
{
  size_t v3 = *(uint64_t **)(a1 + 8);
  unint64_t v4 = v3[1];
  unint64_t v5 = v3[2];
  if (v4 >= v5)
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - *v3) >> 3);
    if (v8 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *v3) >> 3);
    uint64_t v10 = 2 * v9;
    if (2 * v9 <= v8 + 1) {
      uint64_t v10 = v8 + 1;
    }
    if (v9 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t v28 = v3 + 2;
    if (v11)
    {
      if (v11 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      int v12 = (char *)operator new(24 * v11);
    }
    else
    {
      int v12 = 0;
    }
    BOOL v24 = v12;
    CFStringRef v25 = &v12[24 * v8];
    long long v27 = &v12[24 * v11];
    std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::map[abi:ne180100]((uint64_t)v25, a2);
    uint64_t v13 = (uint64_t)v25;
    uint64_t v7 = (uint64_t)(v25 + 24);
    unint64_t v26 = v25 + 24;
    uint64_t v15 = *v3;
    uint64_t v14 = v3[1];
    if (v14 == *v3)
    {
      uint64_t v22 = v3[1];
    }
    else
    {
      uint64_t v16 = 0;
      do
      {
        uint64_t v17 = v13 + v16;
        *(void *)(v17 - 24) = *(void *)(v14 + v16 - 24);
        unsigned int v18 = (uint64_t *)(v14 + v16 - 16);
        uint64_t v19 = *v18;
        *(void *)(v13 + v16 - 16) = *v18;
        uint64_t v20 = v13 + v16 - 16;
        uint64_t v21 = *(void *)(v14 + v16 - 8);
        *(void *)(v17 - 8) = v21;
        if (v21)
        {
          *(void *)(v19 + 16) = v20;
          *(void *)(v14 + v16 - 24) = v18;
          *unsigned int v18 = 0;
          *(void *)(v14 + v16 - 8) = 0;
        }
        else
        {
          *(void *)(v17 - 24) = v20;
        }
        v16 -= 24;
      }
      while (v14 + v16 != v15);
      v13 += v16;
      uint64_t v22 = *v3;
      uint64_t v14 = v3[1];
      uint64_t v7 = (uint64_t)v26;
    }
    uint64_t *v3 = v13;
    BOOL v24 = (char *)v22;
    CFStringRef v25 = (char *)v22;
    v3[1] = v7;
    unint64_t v26 = (char *)v14;
    unint64_t v23 = (char *)v3[2];
    v3[2] = (uint64_t)v27;
    long long v27 = v23;
    uint64_t result = std::__split_buffer<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::~__split_buffer((uint64_t)&v24);
  }
  else
  {
    uint64_t result = std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::map[abi:ne180100](v3[1], a2);
    uint64_t v7 = v4 + 24;
    v3[1] = v4 + 24;
  }
  v3[1] = v7;
  return result;
}

void sub_18E65E6F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::map[abi:ne180100](uint64_t a1, void *a2)
{
  *(void *)(a1 + 8) = 0;
  size_t v3 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  unint64_t v4 = a2 + 1;
  unint64_t v5 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    while (1)
    {
      size_t v6 = *(uint64_t **)(a1 + 8);
      uint64_t v7 = v3;
      if (*(uint64_t **)a1 != v3)
      {
        unint64_t v8 = *(uint64_t **)(a1 + 8);
        unint64_t v9 = v3;
        if (v6)
        {
          do
          {
            uint64_t v7 = v8;
            unint64_t v8 = (uint64_t *)v8[1];
          }
          while (v8);
        }
        else
        {
          do
          {
            uint64_t v7 = (uint64_t *)v9[2];
            BOOL v10 = *v7 == (void)v9;
            unint64_t v9 = v7;
          }
          while (v10);
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v7 + 4, v5 + 4) & 0x80) == 0) {
          break;
        }
      }
      unint64_t v11 = (uint64_t **)v3;
      int v12 = (uint64_t **)v3;
      if (!v6) {
        goto LABEL_19;
      }
      int v12 = (uint64_t **)(v7 + 1);
      if (!v7[1])
      {
        unint64_t v11 = (uint64_t **)v7;
LABEL_19:
        uint64_t v15 = (char *)operator new(0x58uLL);
        uint64_t v16 = v15;
        v21[0] = (uint64_t *)v15;
        v21[1] = v3;
        char v22 = 0;
        if (*((char *)v5 + 55) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)(v15 + 32), (const std::string::value_type *)v5[4], v5[5]);
        }
        else
        {
          long long v17 = *((_OWORD *)v5 + 2);
          *((void *)v15 + 6) = v5[6];
          *((_OWORD *)v15 + 2) = v17;
        }
        std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)(v16 + 56), (uint64_t)(v5 + 7));
        char v22 = 1;
        std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::__insert_node_at((uint64_t **)a1, (uint64_t)v11, v12, v21[0]);
        v21[0] = 0;
        std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v21);
      }
LABEL_23:
      unsigned int v18 = (void *)v5[1];
      if (v18)
      {
        do
        {
          uint64_t v19 = v18;
          unsigned int v18 = (void *)*v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          uint64_t v19 = (void *)v5[2];
          BOOL v10 = *v19 == (void)v5;
          unint64_t v5 = v19;
        }
        while (!v10);
      }
      unint64_t v5 = v19;
      if (v19 == v4) {
        return a1;
      }
    }
    unint64_t v11 = (uint64_t **)v3;
    int v12 = (uint64_t **)v3;
    if (v6)
    {
      uint64_t v13 = v6;
      do
      {
        while (1)
        {
          unint64_t v11 = (uint64_t **)v13;
          uint64_t v14 = v13 + 4;
          if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v5 + 4, v13 + 4) & 0x80) == 0) {
            break;
          }
          uint64_t v13 = *v11;
          int v12 = v11;
          if (!*v11) {
            goto LABEL_19;
          }
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v14, v5 + 4) & 0x80) == 0) {
          goto LABEL_23;
        }
        int v12 = v11 + 1;
        uint64_t v13 = v11[1];
      }
      while (v13);
    }
    goto LABEL_19;
  }
  return a1;
}

void sub_18E65E8F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(*v2);
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
    std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(*(void **)(i - 16));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::__copy_constructor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 0;
  *(_DWORD *)(a1 + 24) = -1;
  uint64_t v3 = *(unsigned int *)(a2 + 24);
  if (v3 != -1)
  {
    ((void (*)(char *, uint64_t, uint64_t))off_1EDD6A368[v3])(&v5, a1, a2);
    *(_DWORD *)(a1 + 24) = v3;
  }
  return a1;
}

void sub_18E65E9F0(_Unwind_Exception *a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor(v1);
  _Unwind_Resume(a1);
}

void *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSR_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEERKSZ_EEEDcSR_DpT0_(int a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  unint64_t v4 = *(const void **)a3;
  uint64_t v3 = *(void *)(a3 + 8);
  size_t v5 = v3 - *(void *)a3;
  if (v3 != *(void *)a3)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a2, v3 - *(void *)a3);
    uint64_t v7 = (char *)a2[1];
    uint64_t result = memmove(v7, v4, v5);
    a2[1] = &v7[v5];
  }
  return result;
}

void sub_18E65EA68(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
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
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSR_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEERKSZ_EEEDcSR_DpT0_(int a1, std::string *this, long long *a3)
{
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v3 = *a3;
    this->__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
}

double _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSR_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEERKSZ_EEEDcSR_DpT0_(uint64_t a1, void *a2, double *a3)
{
  double result = *a3;
  *a2 = *(void *)a3;
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSR_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEERKSZ_EEEDcSR_DpT0_(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *a2 = *a3;
}

uint64_t std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDD69D18;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::__clone(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = &unk_1EDD69D18;
  result[1] = v3;
  return result;
}

void std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::~__func()
{
}

uint64_t CEMCreateEmojiLocaleData(CFLocaleIdentifier localeIdentifier)
{
  if (localeIdentifier)
  {
    if (sharedEmojiData(void)::onceToken != -1) {
      dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_59);
    }
    uint64_t v2 = sharedEmojiData(void)::data;
    sharedMonochromeSymbolData(localeIdentifier);
    if (v2) {
      operator new();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18E64B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "A valid, non-null locale identifier is required to initialize a CEMEmojiLocaleDataRef.", buf, 2u);
  }
  return 0;
}

void sub_18E65F208(void *a1)
{
}

CFStringRef sharedMonochromeSymbolData(const __CFString *localeIdentifier)
{
  if (!localeIdentifier) {
    return localeIdentifier;
  }
  CFLocaleRef v1 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], localeIdentifier);
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x1E4F1D218]);
  if (CFEqual(Value, @"zh")
    || CFEqual(Value, @"yue"))
  {
    BOOL v3 = 1;
    if (!v1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v3 = CFEqual(Value, @"ja");
  if (v1) {
LABEL_7:
  }
    CFRelease(v1);
LABEL_8:
  if (!v3) {
    return 0;
  }
  if (sharedMonochromeSymbolData(__CFString const*)::onceToken != -1) {
    dispatch_once(&sharedMonochromeSymbolData(__CFString const*)::onceToken, &__block_literal_global_68);
  }
  return (const __CFString *)sharedMonochromeSymbolData(__CFString const*)::data;
}

void sub_18E65F4CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void ___ZL26sharedMonochromeSymbolDataPK10__CFString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFLocale *a5)
{
  CFURLRef v5 = CEM::copyResourceURLFromFrameworkBundle((CEM *)@"monochrome_symbol", @"dat", 0, 0, a5);
  CFURLRef v7 = CEM::copyResourceURLFromFrameworkBundle((CEM *)@"monochrome_symbolmeta", @"dat", 0, 0, v6);
  if (v5) {
    operator new();
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_18E65F598(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  uint64_t v11 = v9;
  MEMORY[0x192FAF2C0](v11, 0x1070C408606C210);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      a9 = 0;
      _os_log_error_impl(&dword_18E64B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to load emoji data", (uint8_t *)&a9, 2u);
    }
    __cxa_end_catch();
    JUMPOUT(0x18E65F570);
  }
  _Unwind_Resume(a1);
}

void CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock(uint64_t a1, const __CFString *a2, CFRange a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  if (a1)
  {
    CFLocaleRef v6 = *(uint64_t **)(a1 + 24);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 0x40000000;
    v7[2] = __CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock_block_invoke;
    _OWORD v7[3] = &unk_1E55D52B0;
    v7[4] = a6;
    v7[5] = a1;
    CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(v6, a2, a3, a5, 0, (uint64_t)v7);
  }
}

void __CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock_block_invoke(uint64_t a1, uint64_t **a2)
{
  Wrappers = CEM::EmojiToken::createWrappers(a2, *(const void **)(a1 + 40));
  if (Wrappers)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    CFRelease(Wrappers);
  }
}

void sub_18E65F728(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void CEMEmojiLocaleDataEnumerateSearchResultsIncludingSubstringsInStringWithBlock(uint64_t a1, const __CFString *a2, CFRange a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  if (a1)
  {
    CFLocaleRef v6 = *(uint64_t **)(a1 + 24);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 0x40000000;
    v7[2] = __CEMEmojiLocaleDataEnumerateSearchResultsIncludingSubstringsInStringWithBlock_block_invoke;
    _OWORD v7[3] = &unk_1E55D52D8;
    v7[4] = a6;
    v7[5] = a1;
    CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(v6, a2, a3, a5, 1u, (uint64_t)v7);
  }
}

void __CEMEmojiLocaleDataEnumerateSearchResultsIncludingSubstringsInStringWithBlock_block_invoke(uint64_t a1, uint64_t **a2)
{
  Wrappers = CEM::EmojiToken::createWrappers(a2, *(const void **)(a1 + 40));
  if (Wrappers)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    CFRelease(Wrappers);
  }
}

void sub_18E65F850(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

__CFArray *CEMEmojiLocaleDataCreateEmojiTokensForString(__CFArray *a1, const __CFString *a2, const __CFString *a3, uint64_t a4, unsigned int a5, int a6)
{
  Wrappers = a1;
  if (!a1) {
    return Wrappers;
  }
  CFStringRef v11 = (const __CFString *)MEMORY[0x192FAEE00](*(void *)(*((void *)a1 + 3) + 32));
  if (v11)
  {
    BOOL v12 = !CFStringHasPrefix(v11, @"en") || a2 == 0;
    if (!v12 && a5 == 1)
    {
      if (CFStringCompare(a2, @"smile", 1uLL))
      {
        if (CFStringCompare(a2, @"smiley", 1uLL))
        {
          if (CFStringCompare(a2, @"happy", 1uLL)) {
            goto LABEL_10;
          }
          unsigned int v18 = operator new(0x48uLL);
          *((void *)&v23 + 1) = (char *)v18 + 72;
          BOOL v24 = (char *)v18 + 72;
          v18[2] = xmmword_1E55D5350;
          _OWORD v18[3] = *(_OWORD *)off_1E55D5360;
          *((void *)v18 + 8) = @"🙃";
          *unsigned int v18 = xmmword_1E55D5330;
          v18[1] = *(_OWORD *)&off_1E55D5340;
          *(void *)&long long v23 = v18;
          CEMEmojiTokensCFArray = createCEMEmojiTokensCFArray((const __CFString ***)&v23);
        }
        else
        {
          unsigned int v18 = operator new(0x20uLL);
          *((void *)&v23 + 1) = v18 + 2;
          BOOL v24 = (char *)(v18 + 2);
          *unsigned int v18 = xmmword_1E55D5310;
          v18[1] = *(_OWORD *)&off_1E55D5320;
          *(void *)&long long v23 = v18;
          CEMEmojiTokensCFArray = createCEMEmojiTokensCFArray((const __CFString ***)&v23);
        }
      }
      else
      {
        unsigned int v18 = operator new(0x18uLL);
        *((void *)&v23 + 1) = (char *)v18 + 24;
        BOOL v24 = (char *)v18 + 24;
        *unsigned int v18 = xmmword_1E55D52F8;
        *((void *)v18 + 2) = @"😀";
        *(void *)&long long v23 = v18;
        CEMEmojiTokensCFArray = createCEMEmojiTokensCFArray((const __CFString ***)&v23);
      }
      Wrappers = CEMEmojiTokensCFArray;
      operator delete(v18);
      return Wrappers;
    }
  }
LABEL_10:
  uint64_t v14 = (CFLocaleRef *)*((void *)Wrappers + 3);
  char v22 = 0;
  long long v21 = 0uLL;
  if (!*v14 || (uint64_t v15 = (uint64_t *)v14, (*((_WORD *)*v14 + 60) & 2) == 0))
  {
    if (a5 > 6 || (uint64_t v15 = (uint64_t *)v14, ((1 << a5) & 0x72) == 0)) {
      uint64_t v15 = (uint64_t *)(v14 + 1);
    }
  }
  CEM::EmojiLocaleData::exactMatchEmojiTokensForSingleWord((uint64_t *)&v23, (uint64_t)v14, a2, a3, a5, v15, a6);
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate((uint64_t *)&v21);
  long long v20 = v23;
  long long v21 = v23;
  char v22 = v24;
  BOOL v24 = 0;
  long long v23 = 0uLL;
  CFStringRef v25 = (void **)&v23;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](&v25);
  if ((void)v20 == *((void *)&v20 + 1))
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, a2);
    CFStringLowercase(MutableCopy, v14[4]);
    CEM::EmojiLocaleData::exactMatchEmojiTokensForSingleWord((uint64_t *)&v23, (uint64_t)v14, MutableCopy, a3, a5, v15, a6);
    std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate((uint64_t *)&v21);
    long long v21 = v23;
    char v22 = v24;
    BOOL v24 = 0;
    long long v23 = 0uLL;
    CFStringRef v25 = (void **)&v23;
    std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](&v25);
    CFRelease(MutableCopy);
  }
  Wrappers = CEM::EmojiToken::createWrappers((uint64_t **)&v21, Wrappers);
  *(void *)&long long v23 = &v21;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v23);
  return Wrappers;
}

void sub_18E65FB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  operator delete(v15);
  _Unwind_Resume(a1);
}

__CFArray *createCEMEmojiTokensCFArray(const __CFString ***a1)
{
  CFMutableStringRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1[1] - *a1, MEMORY[0x1E4F1D510]);
  BOOL v3 = *a1;
  unint64_t v4 = a1[1];
  while (v3 != v4)
  {
    CFURLRef v5 = (const void *)CEMEmojiTokenCreateWithString(*v3, 0);
    if (v5)
    {
      CFLocaleRef v6 = v5;
      CFArrayAppendValue(Mutable, v5);
      CFRelease(v6);
    }
    ++v3;
  }
  return Mutable;
}

void std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::shared_ptr<CEM::EmojiToken>>::__clear[abi:ne180100]((uint64_t *)v2);
    BOOL v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::shared_ptr<CEM::EmojiToken>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 16)
  {
    unint64_t v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  a1[1] = v2;
}

uint64_t CEMEmojiTokenCreateWithString(const __CFString *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  if (sharedEmojiData(void)::onceToken != -1) {
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_59);
  }
  uint64_t v4 = sharedEmojiData(void)::data;
  CFStringRef v5 = a2 ? (const __CFString *)MEMORY[0x192FAEE00](*(void *)(a2[3] + 32)) : 0;
  CFStringRef v6 = sharedMonochromeSymbolData(v5);
  if (!v4) {
    return 0;
  }
  uint64_t v7 = (uint64_t)v6;
  CEM::EmojiData::advance(v4, *(_WORD **)(v4 + 32), 0x100000000, a1);
  uint64_t v9 = v8 & 0x100000000;
  uint64_t v10 = (unsigned __int16)v8;
  if ((BYTE4(v8) & ((unsigned __int16)v8 != 0)) == 0 && v7)
  {
    CEM::EmojiData::advance(v7, *(_WORD **)(v7 + 32), 0x100000000, a1);
    uint64_t v9 = v8 & 0x100000000;
    uint64_t v10 = (unsigned __int16)v8;
  }
  if (!v10 || v9 == 0) {
    return 0;
  }
  return CEMEmojiTokenCreateWithIndex((unsigned __int16)v8, a2);
}

uint64_t CEMEmojiTokenCreateWithIndex(unsigned int a1, void *a2)
{
  if (sharedEmojiData(void)::onceToken != -1) {
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_59);
  }
  uint64_t v4 = sharedEmojiData(void)::data;
  if (a2) {
    CFStringRef v5 = (const __CFString *)MEMORY[0x192FAEE00](*(void *)(a2[3] + 32));
  }
  else {
    CFStringRef v5 = 0;
  }
  CFStringRef v6 = sharedMonochromeSymbolData(v5);
  if (!v6
    || (uint64_t v7 = (CEM::EmojiData *)v6, v8 = WORD2(v6[1].info), v9 = a1 >= v8, v10 = a1 - v8, v10 == 0 || !v9)
    || WORD1(v6[1].info) < (unsigned __int16)v10)
  {
    uint64_t v7 = (CEM::EmojiData *)v4;
    if (!v4) {
      return 0;
    }
  }
  if (a2) {
    uint64_t v11 = a2[3];
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v12 = (std::__shared_weak_count *)operator new(0x48uLL);
  v12->__shared_owners_ = 0;
  v12->__shared_weak_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDD69ED0;
  v15[0] = CEM::EmojiToken::EmojiToken((uint64_t)&v12[1], a1, v7, v11);
  v15[1] = (uint64_t)v12;
  uint64_t Wrapper = CEM::EmojiToken::createWrapper(v15, a2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  return Wrapper;
}

void std::__shared_ptr_emplace<CEM::EmojiToken>::__on_zero_shared(uint64_t a1)
{
}

void std::__shared_ptr_emplace<CEM::EmojiToken>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDD69ED0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FAF2C0);
}

void std::__shared_ptr_emplace<CEM::EmojiToken>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDD69ED0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t CEMEmojiLocaleDataGetLocaleIdentifier(uint64_t result)
{
  if (result) {
    JUMPOUT(0x192FAEE00);
  }
  return result;
}

__CFArray *CEMEmojiLocaleDataCopyCommonEmojiTokens(const void *a1)
{
  if (!a1) {
    return 0;
  }
  memset(v3, 0, sizeof(v3));
  Wrappers = CEM::EmojiToken::createWrappers(v3, a1);
  uint64_t v4 = (void **)v3;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](&v4);
  return Wrappers;
}

void sub_18E660010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

unint64_t CEMEmojiLocaleDataGetMecabraFlags(uint64_t a1, unsigned int a2, CFStringRef theString)
{
  if (!a1) {
    return 0;
  }
  std::string::value_type v3 = a2;
  uint64_t v4 = *(uint64_t **)(a1 + 24);
  uint64_t v5 = *v4;
  if (!*v4 || (__int16 v6 = *(_WORD *)(v5 + 120), (v6 & 2) == 0))
  {
    if (a2 <= 6 && ((1 << a2) & 0x72) != 0)
    {
      if (!v5) {
        return 0;
      }
    }
    else
    {
      uint64_t v5 = v4[1];
      if (!v5) {
        return 0;
      }
    }
    __int16 v6 = *(_WORD *)(v5 + 120);
  }
  if ((v6 & 1) == 0) {
    return 0;
  }
  CEM::getUTF8StringFromCFString(&v17, theString);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v15, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
  }
  else {
    std::string v15 = v17;
  }
  std::string::basic_string[abi:ne180100]<0>(v13, "’");
  std::string::basic_string[abi:ne180100]<0>(__p, "'");
  CEM::replace((uint64_t)&v16, &v15, (uint64_t)v13, (uint64_t)__p);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  std::string v17 = v16;
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if ((*(_WORD *)(v5 + 120) & 2) != 0) {
    std::string::push_back(&v17, v3);
  }
  LODWORD(v16.__r_.__value_.__l.__data_) = 0;
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    BOOL v9 = &v17;
  }
  else {
    BOOL v9 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (trie::MarisaTrie<unsigned int,char>::lookup(v5 + 16, (uint64_t)v9, size, &v16)) {
    unint64_t v7 = (unint64_t)LODWORD(v16.__r_.__value_.__l.__data_) >> 22;
  }
  else {
    unint64_t v7 = 0;
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  return v7;
}

void sub_18E6601C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v26 - 25) < 0) {
    operator delete(*(void **)(v26 - 48));
  }
  _Unwind_Resume(exception_object);
}

uint64_t CEMEmojiLocaleDataEnableAdaptation(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v2 = (int *)(*(void *)(result + 24) + 112);
    if (!a2)
    {
      int v3 = 1;
      goto LABEL_7;
    }
    if (*v2
      || (double result = CEM::AdaptationController::initialize((CEM::AdaptationController *)(*(void *)(result + 24) + 112)),
          result))
    {
      int v3 = 2;
LABEL_7:
      int *v2 = v3;
    }
  }
  return result;
}

uint64_t CEMEmojiLocaleDataRecordEmojiEngagement(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  uint64_t v3 = 0;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  if (!a1 || !a2 || !a3) {
    return v3;
  }
  uint64_t v5 = *(void *)(a1 + 24);
  CEM::getUTF8StringFromCFString(v69, a2);
  size_t v6 = v70;
  unint64_t v7 = (void **)v69[0];
  unsigned int v8 = v69[1];
  CEM::getUTF8StringFromCFString(__p, a3);
  if ((v6 & 0x80u) == 0) {
    BOOL v9 = v69;
  }
  else {
    BOOL v9 = v7;
  }
  if ((v6 & 0x80u) != 0) {
    size_t v6 = (size_t)v8;
  }
  if ((v68 & 0x80u) == 0) {
    unsigned int v10 = __p;
  }
  else {
    unsigned int v10 = (void **)__p[0];
  }
  if ((v68 & 0x80u) == 0) {
    size_t v11 = v68;
  }
  else {
    size_t v11 = (size_t)__p[1];
  }
  if (*(_DWORD *)(v5 + 112) != 2)
  {
    uint64_t v3 = 0;
    if ((v68 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  __src = v9;
  uint64_t v12 = *(void *)(v5 + 168);
  std::mutex::lock((std::mutex *)(v12 + 64));
  if (!*(void *)(*(void *)(v12 + 128) + 24))
  {
    std::mutex::unlock((std::mutex *)(v12 + 64));
    goto LABEL_143;
  }
  uint64_t v64 = v5;
  {
  }
  {
  }
  uint64_t v13 = v12 + 144;
  if (*(char *)(v12 + 167) < 0)
  {
    uint64_t v15 = *(void *)(v12 + 144);
    uint64_t v14 = *(void *)(v12 + 152);
  }
  else
  {
    uint64_t v14 = *(unsigned __int8 *)(v12 + 167);
    uint64_t v15 = v12 + 144;
  }
  if (byte_1E91D6E0F >= 0) {
    size_t v17 = byte_1E91D6E0F;
  }
  else {
    size_t v17 = unk_1E91D6E00;
  }
  if (byte_1E91D6E0F >= 0) {
    unsigned int v18 = &CEM::AdaptationDatabaseController::getStringId(std::string_view)const::sql;
  }
  else {
    unsigned int v18 = (uint64_t *)CEM::AdaptationDatabaseController::getStringId(std::string_view)const::sql;
  }
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v6 >= 0x17)
  {
    uint64_t v20 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v20 = v6 | 7;
    }
    uint64_t v21 = v20 + 1;
    p_dst = (long long *)operator new(v20 + 1);
    *((void *)&__dst + 1) = v6;
    unint64_t v73 = v21 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    uint64_t v13 = v12 + 144;
    goto LABEL_41;
  }
  HIBYTE(v73) = v6;
  p_dst = &__dst;
  if (v6) {
LABEL_41:
  }
    memmove(p_dst, __src, v6);
  *((unsigned char *)p_dst + v6) = 0;
  long long v80 = __dst;
  unint64_t v81 = v73;
  int v82 = 3;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  *(void *)buf = 0;
  __n128 v78 = buf;
  char v79 = 0;
  *(void *)buf = operator new(0x20uLL);
  uint64_t v75 = *(void *)buf;
  uint64_t v76 = *(void *)buf + 32;
  uint64_t v75 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&v80, (uint64_t)v83, *(uint64_t *)buf);
  CEM::Statement::Statement((uint64_t)v77, v15, v14, v18, v17, (uint64_t *)buf);
  __n128 v78 = buf;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
  char v22 = (CEM::AdaptationDatabase *)std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v80);
  CEM::AdaptationDatabase::executeStatement(v22, *(CEM::Statement **)(v12 + 128), (uint64_t)v77);
  uint64_t v65 = v10;
  if (*((void *)&v80 + 1) != (void)v80)
  {
    if (*(_DWORD *)(*(void *)v80 + 80) == 1)
    {
      int v23 = *(_DWORD *)(*(void *)v80 + 56);
      goto LABEL_50;
    }
    if (cem_logging_get_adaptation_log_onceToken != -1) {
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
    }
    BOOL v24 = cem_logging_get_adaptation_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18E64B000, v24, OS_LOG_TYPE_ERROR, "Could not extract uint32_t from std::variant<T> column value map. getStringId(...);",
        buf,
        2u);
    }
  }
  int v23 = 0;
LABEL_50:
  *(void *)buf = &v80;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  CEM::Statement::~Statement(v77);
  if (v23) {
    goto LABEL_77;
  }
  {
    uint64_t v13 = v12 + 144;
  }
  if (*(char *)(v12 + 167) < 0)
  {
    uint64_t v26 = *(void *)(v12 + 144);
    uint64_t v25 = *(void *)(v12 + 152);
  }
  else
  {
    uint64_t v25 = *(unsigned __int8 *)(v12 + 167);
    uint64_t v26 = v13;
  }
  if (byte_1E91D6E2F >= 0) {
    size_t v27 = byte_1E91D6E2F;
  }
  else {
    size_t v27 = unk_1E91D6E20;
  }
  if (byte_1E91D6E2F >= 0) {
    uint64_t v28 = &CEM::AdaptationDatabaseController::createStringId(std::string_view)::sql;
  }
  else {
    uint64_t v28 = (uint64_t *)CEM::AdaptationDatabaseController::createStringId(std::string_view)::sql;
  }
  if (v6 >= 0x17)
  {
    uint64_t v30 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v30 = v6 | 7;
    }
    uint64_t v31 = v30 + 1;
    unint64_t v29 = (long long *)operator new(v30 + 1);
    *((void *)&__dst + 1) = v6;
    unint64_t v73 = v31 | 0x8000000000000000;
    *(void *)&long long __dst = v29;
    uint64_t v13 = v12 + 144;
  }
  else
  {
    HIBYTE(v73) = v6;
    unint64_t v29 = &__dst;
    if (!v6) {
      goto LABEL_68;
    }
  }
  memmove(v29, __src, v6);
LABEL_68:
  *((unsigned char *)v29 + v6) = 0;
  long long v80 = __dst;
  unint64_t v81 = v73;
  int v82 = 3;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  *(void *)buf = 0;
  __n128 v78 = buf;
  char v79 = 0;
  *(void *)buf = operator new(0x20uLL);
  uint64_t v75 = *(void *)buf;
  uint64_t v76 = *(void *)buf + 32;
  uint64_t v75 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&v80, (uint64_t)v83, *(uint64_t *)buf);
  CEM::Statement::Statement((uint64_t)v77, v26, v25, v28, v27, (uint64_t *)buf);
  __n128 v78 = buf;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
  uint64_t v32 = (CEM::AdaptationDatabase *)std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v80);
  CEM::AdaptationDatabase::executeStatement(v32, *(CEM::Statement **)(v12 + 128), (uint64_t)v77);
  unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v80 + 1) - v80) >> 3);
  if (v33 != 1)
  {
    if (v33)
    {
      uint64_t v60 = "(rows.size() == 1) && \"createStringId: Database inconsistency: exactly 1 ID has been not assigned to this s"
            "tring; cannot continue.\"";
      int v61 = 108;
    }
    else
    {
      uint64_t v60 = "(rows.size() > 0) && \"createStringId: Database inconsistency: ID insertion failed; cannot continue.\"";
      int v61 = 107;
    }
    __assert_rtn("createStringId", "AdaptationDatabaseController.cpp", v61, v60);
  }
  if (*(_DWORD *)(*(void *)v80 + 80) == 1)
  {
    int v23 = *(_DWORD *)(*(void *)v80 + 56);
  }
  else
  {
    if (cem_logging_get_adaptation_log_onceToken != -1) {
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
    }
    int64_t v34 = cem_logging_get_adaptation_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18E64B000, v34, OS_LOG_TYPE_ERROR, "Could not extract uint32_t from std::variant<T> column value map. createStringId(...);",
        buf,
        2u);
    }
    int v23 = 0;
  }
  *(void *)buf = &v80;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  CEM::Statement::~Statement(v77);
LABEL_77:
  {
    uint64_t v13 = v12 + 144;
  }
  if (*(char *)(v12 + 167) < 0)
  {
    uint64_t v36 = *(void *)(v12 + 144);
    uint64_t v35 = *(void *)(v12 + 152);
  }
  else
  {
    uint64_t v35 = *(unsigned __int8 *)(v12 + 167);
    uint64_t v36 = v13;
  }
  if (byte_1E91D6DCF >= 0) {
    size_t v37 = byte_1E91D6DCF;
  }
  else {
    size_t v37 = unk_1E91D6DC0;
  }
  if (byte_1E91D6DCF >= 0) {
    CFRange v38 = &CEM::AdaptationDatabaseController::getEmojiId(std::string_view)const::sql;
  }
  else {
    CFRange v38 = (uint64_t *)CEM::AdaptationDatabaseController::getEmojiId(std::string_view)const::sql;
  }
  if (v11 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v11 >= 0x17)
  {
    uint64_t v40 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v40 = v11 | 7;
    }
    uint64_t v41 = v40 + 1;
    uint64_t v39 = (long long *)operator new(v40 + 1);
    *((void *)&__dst + 1) = v11;
    unint64_t v73 = v41 | 0x8000000000000000;
    *(void *)&long long __dst = v39;
    uint64_t v13 = v12 + 144;
    goto LABEL_94;
  }
  HIBYTE(v73) = v11;
  uint64_t v39 = &__dst;
  if (v11) {
LABEL_94:
  }
    memmove(v39, v65, v11);
  *((unsigned char *)v39 + v11) = 0;
  long long v80 = __dst;
  unint64_t v81 = v73;
  int v82 = 3;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  *(void *)buf = 0;
  __n128 v78 = buf;
  char v79 = 0;
  *(void *)buf = operator new(0x20uLL);
  uint64_t v75 = *(void *)buf;
  uint64_t v76 = *(void *)buf + 32;
  uint64_t v75 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&v80, (uint64_t)v83, *(uint64_t *)buf);
  CEM::Statement::Statement((uint64_t)v77, v36, v35, v38, v37, (uint64_t *)buf);
  __n128 v78 = buf;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
  uint64_t v42 = (CEM::AdaptationDatabase *)std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v80);
  CEM::AdaptationDatabase::executeStatement(v42, *(CEM::Statement **)(v12 + 128), (uint64_t)v77);
  int v43 = v23;
  if (*((void *)&v80 + 1) != (void)v80)
  {
    if (*(_DWORD *)(*(void *)v80 + 80) == 1)
    {
      int v44 = *(_DWORD *)(*(void *)v80 + 56);
      goto LABEL_103;
    }
    if (cem_logging_get_adaptation_log_onceToken != -1) {
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
    }
    uint64_t v45 = cem_logging_get_adaptation_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18E64B000, v45, OS_LOG_TYPE_ERROR, "Could not extract uint32_t from std::variant<T> column value map. getEmojiId(...);",
        buf,
        2u);
    }
  }
  int v44 = 0;
LABEL_103:
  *(void *)buf = &v80;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  CEM::Statement::~Statement(v77);
  if (v44) {
    goto LABEL_130;
  }
  {
    uint64_t v13 = v12 + 144;
  }
  if (*(char *)(v12 + 167) < 0)
  {
    uint64_t v47 = *(void *)(v12 + 144);
    uint64_t v46 = *(void *)(v12 + 152);
  }
  else
  {
    uint64_t v46 = *(unsigned __int8 *)(v12 + 167);
    uint64_t v47 = v13;
  }
  if (byte_1E91D6DEF >= 0) {
    size_t v48 = byte_1E91D6DEF;
  }
  else {
    size_t v48 = unk_1E91D6DE0;
  }
  if (byte_1E91D6DEF >= 0) {
    uint64_t v49 = &CEM::AdaptationDatabaseController::createEmojiId(std::string_view)::sql;
  }
  else {
    uint64_t v49 = (uint64_t *)CEM::AdaptationDatabaseController::createEmojiId(std::string_view)::sql;
  }
  if (v11 >= 0x17)
  {
    uint64_t v51 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v51 = v11 | 7;
    }
    uint64_t v52 = v51 + 1;
    uint64_t v50 = (long long *)operator new(v51 + 1);
    *((void *)&__dst + 1) = v11;
    unint64_t v73 = v52 | 0x8000000000000000;
    *(void *)&long long __dst = v50;
    uint64_t v13 = v12 + 144;
  }
  else
  {
    HIBYTE(v73) = v11;
    uint64_t v50 = &__dst;
    if (!v11) {
      goto LABEL_121;
    }
  }
  memmove(v50, v65, v11);
LABEL_121:
  *((unsigned char *)v50 + v11) = 0;
  long long v80 = __dst;
  unint64_t v81 = v73;
  int v82 = 3;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  *(void *)buf = 0;
  __n128 v78 = buf;
  char v79 = 0;
  *(void *)buf = operator new(0x20uLL);
  uint64_t v75 = *(void *)buf;
  uint64_t v76 = *(void *)buf + 32;
  uint64_t v75 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&v80, (uint64_t)v83, *(uint64_t *)buf);
  CEM::Statement::Statement((uint64_t)v77, v47, v46, v49, v48, (uint64_t *)buf);
  __n128 v78 = buf;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
  uint64_t v53 = (CEM::AdaptationDatabase *)std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v80);
  CEM::AdaptationDatabase::executeStatement(v53, *(CEM::Statement **)(v12 + 128), (uint64_t)v77);
  unint64_t v54 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v80 + 1) - v80) >> 3);
  if (v54 != 1)
  {
    if (v54)
    {
      uint64_t v62 = "(rows.size() == 1) && \"createEmojiId: Database inconsistency: exactly 1 ID has not been assigned to this em"
            "oji; cannot continue.\"";
      int v63 = 70;
    }
    else
    {
      uint64_t v62 = "(rows.size() > 0) && \"createEmojiId: Database inconsistency: ID insertion failed; cannot continue.\"";
      int v63 = 69;
    }
    __assert_rtn("createEmojiId", "AdaptationDatabaseController.cpp", v63, v62);
  }
  int v43 = v23;
  if (*(_DWORD *)(*(void *)v80 + 80) == 1)
  {
    int v44 = *(_DWORD *)(*(void *)v80 + 56);
  }
  else
  {
    if (cem_logging_get_adaptation_log_onceToken != -1) {
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
    }
    uint64_t v55 = cem_logging_get_adaptation_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18E64B000, v55, OS_LOG_TYPE_ERROR, "Could not extract uint32_t from std::variant<T> column value map. createEmojiId(...);",
        buf,
        2u);
    }
    int v44 = 0;
  }
  *(void *)buf = &v80;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  CEM::Statement::~Statement(v77);
LABEL_130:
  if (*(char *)(v12 + 167) < 0)
  {
    uint64_t v13 = *(void *)(v12 + 144);
    uint64_t v56 = *(void *)(v12 + 152);
  }
  else
  {
    uint64_t v56 = *(unsigned __int8 *)(v12 + 167);
  }
  if (byte_1E91D6E8F >= 0) {
    size_t v57 = byte_1E91D6E8F;
  }
  else {
    size_t v57 = unk_1E91D6E80;
  }
  if (byte_1E91D6E8F >= 0) {
    int v58 = &CEM::AdaptationDatabaseController::recordEmojiEngagement(std::string_view,std::string_view)::sql;
  }
  else {
    int v58 = (uint64_t *)CEM::AdaptationDatabaseController::recordEmojiEngagement(std::string_view,std::string_view)::sql;
  }
  LODWORD(v80) = v43;
  int v82 = 1;
  v83[0] = v44;
  v83[6] = 1;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  *(void *)buf = 0;
  *(void *)&long long __dst = buf;
  BYTE8(__dst) = 0;
  *(void *)buf = operator new(0x40uLL);
  uint64_t v75 = *(void *)buf;
  uint64_t v76 = *(void *)buf + 64;
  uint64_t v75 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&v80, (uint64_t)&v84, *(uint64_t *)buf);
  CEM::Statement::Statement((uint64_t)v77, v13, v56, v58, v57, (uint64_t *)buf);
  *(void *)&long long __dst = buf;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__dst);
  for (uint64_t i = 32; i != -32; i -= 32)
    std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v80 + i);
  CEM::AdaptationDatabase::executeStatement((CEM::AdaptationDatabase *)v71, *(CEM::Statement **)(v12 + 128), (uint64_t)v77);
  *(void *)&long long v80 = v71;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v80);
  CEM::Statement::~Statement(v77);
  std::mutex::unlock((std::mutex *)(v12 + 64));
  LODWORD(v77[0]) = v43;
  if (v43)
  {
    trie::CedarMinimalPrefixTrie<unsigned int,char>::addEntry(v64 + 176, (uint64_t)__src, v6, v77);
    uint64_t v3 = 1;
    goto LABEL_144;
  }
LABEL_143:
  uint64_t v3 = 0;
LABEL_144:
  if ((v68 & 0x80) != 0) {
LABEL_22:
  }
    operator delete(__p[0]);
LABEL_23:
  if ((char)v70 < 0) {
    operator delete(v69[0]);
  }
  return v3;
}

void sub_18E660EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(a1);
}

void CEMEmojiLocaleDataResetAdaptationDatabase(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 24);
    uint64_t v2 = (CEM::AdaptationController *)(v1 + 112);
    if (*(_DWORD *)(v1 + 112) || CEM::AdaptationController::initialize(v2))
    {
      uint64_t v3 = *(void *)(v1 + 168);
      if (*(void *)(*(void *)(v3 + 128) + 24))
      {
        if (*(char *)(v3 + 167) < 0)
        {
          uint64_t v4 = *(void *)(v3 + 144);
          uint64_t v5 = *(void *)(v3 + 152);
        }
        else
        {
          uint64_t v4 = v3 + 144;
          uint64_t v5 = *(unsigned __int8 *)(v3 + 167);
        }
        memset(v6, 0, sizeof(v6));
        CEM::Statement::Statement((uint64_t)v7, v4, v5, "BEGIN TRANSACTION;\n"
          "END TRANSACTION;",
          0x6FuLL,
          v6);
        unsigned int v8 = (void **)v6;
        std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v8);
        CEM::AdaptationDatabase::executeStatement((CEM::AdaptationDatabase *)v6, *(CEM::Statement **)(v3 + 128), (uint64_t)v7);
        unsigned int v8 = (void **)v6;
        std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100](&v8);
        CEM::Statement::~Statement(v7);
      }
      cedar::da<unsigned int,-1,-2,true,1,0ul>::clear(v1 + 184, 1);
      if (!*(_DWORD *)(v1 + 112)) {
        *(_DWORD *)uint64_t v2 = 1;
      }
    }
  }
}

void sub_18E661124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  CEM::Statement::~Statement((void **)va);
  _Unwind_Resume(a1);
}

uint64_t CEMEMFSearchEngineIsLocaleSupported(CEM *a1, const __CFLocale *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  NormalizedLocale = CEM::createNormalizedLocale(a1, a2);
  CFBundleRef SearchEngineBundleForLocale = CEM::SearchEngineResources::createSearchEngineBundleForLocale(NormalizedLocale, v4);
  CFBundleRef v7 = SearchEngineBundleForLocale;
  if (SearchEngineBundleForLocale) {
    CFRelease(SearchEngineBundleForLocale);
  }
  if (NormalizedLocale) {
    CFRelease(NormalizedLocale);
  }
  if (v7) {
    return 1;
  }
  CFLocaleRef v9 = CEM::createNormalizedLocale(a1, v6);
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(v9, (CFLocaleKey)*MEMORY[0x1E4F1D218]);
  CFStringRef v11 = (const __CFString *)CFLocaleGetValue(v9, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
  if (CFStringCompare(Value, @"en", 0) || v11 && CFStringCompare(v11, @"US", 0))
  {
    uint64_t v13 = @"LocaleData";
    uint64_t v14 = (__CFString *)v9;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = @"LocaleData-en";
  }
  CFURLRef v15 = CEM::copyResourceURLFromFrameworkBundle((CEM *)v13, @"dat", 0, v14, v12);
  BOOL v8 = v15 != 0;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = MEMORY[0x192FAEE00](v9);
      _os_log_impl(&dword_18E64B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Legacy search is supported by locale '%@'", buf, 0xCu);
    }
    CFRelease(v15);
  }
  if (v9) {
    CFRelease(v9);
  }
  return v8;
}

void sub_18E661300(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)va);
  if (v2) {
    CFRelease(v2);
  }
  _Unwind_Resume(a1);
}

CFBundleRef CEMEMFSearchEngineCreateBundleForLocaleIdentifier(CFLocaleIdentifier localeIdentifier)
{
  uint64_t v1 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], localeIdentifier);
  if (!v1) {
    return 0;
  }
  uint64_t v3 = v1;
  CFBundleRef SearchEngineBundleForLocale = CEM::SearchEngineResources::createSearchEngineBundleForLocale(v1, v2);
  CFRelease(v3);
  return SearchEngineBundleForLocale;
}

void sub_18E6613D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t CEMEmojiTokenCreateWithLongCharacter(unsigned int a1, void *a2)
{
  if (sharedEmojiData(void)::onceToken != -1) {
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_59);
  }
  uint64_t v4 = sharedEmojiData(void)::data;
  if (a2) {
    CFStringRef v5 = (const __CFString *)MEMORY[0x192FAEE00](*(void *)(a2[3] + 32));
  }
  else {
    CFStringRef v5 = 0;
  }
  CFStringRef v6 = sharedMonochromeSymbolData(v5);
  if (!v4) {
    return 0;
  }
  uint64_t v7 = (uint64_t)v6;
  CEM::EmojiData::advance(v4, *(_WORD **)(v4 + 32), 0x100000000, a1);
  uint64_t v9 = v8 & 0x100000000;
  uint64_t v10 = (unsigned __int16)v8;
  if ((BYTE4(v8) & ((unsigned __int16)v8 != 0)) == 0 && v7)
  {
    CEM::EmojiData::advance(v7, *(_WORD **)(v7 + 32), 0x100000000, a1);
    uint64_t v9 = v8 & 0x100000000;
    uint64_t v10 = (unsigned __int16)v8;
  }
  if (!v10 || v9 == 0) {
    return 0;
  }
  return CEMEmojiTokenCreateWithIndex((unsigned __int16)v8, a2);
}

uint64_t CEMEmojiTokenGetString(uint64_t result)
{
  if (result) {
    return *(void *)(*(void *)(result + 24) + 8);
  }
  return result;
}

uint64_t CEMEmojiTokenSupportsSkinToneVariants(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 24);
    uint64_t v2 = *(void *)(v1 + 40);
    uint64_t v3 = *(unsigned __int16 *)(v1 + 22);
    uint64_t v4 = *(unsigned __int16 *)(v2 + 44);
    if (v3 > v4
      && *(unsigned __int16 *)(v2 + 42) >= (unsigned __int16)(v3 - v4))
    {
      return (*(unsigned __int16 *)(**(void **)(v2 + 16) + 16 * (~v4 + v3) + 10) >> 6) & 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CEMEmojiTokenCreateSkinToneVariant(uint64_t a1, int a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 24);
    uint64_t v4 = *(void *)(v3 + 40);
    uint64_t v5 = *(unsigned __int16 *)(v3 + 22);
    uint64_t v6 = *(unsigned __int16 *)(v4 + 44);
    if (v5 > v6
      && *(unsigned __int16 *)(v4 + 42) >= (unsigned __int16)(v5 - v6)
      && (*(_WORD *)(**(void **)(v4 + 16) + 16 * (~v6 + v5) + 10) & 0x40) != 0)
    {
      uint64_t v10 = CEM::EmojiData::advance(v4, *(_WORD **)(v4 + 32), 0x100000000, *(CFStringRef *)(v3 + 8));
      if (a2 == 1) {
        int v11 = 127995;
      }
      else {
        int v11 = a2 + 127993;
      }
      if (a2) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = 0;
      }
      CEM::EmojiData::advance(*(void *)(v3 + 40), v10, v9, v12);
      operator new();
    }
    return 0;
  }
  return v2;
}

void sub_18E66168C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18E6615BCLL);
}

void std::shared_ptr<CEM::EmojiToken>::shared_ptr[abi:ne180100]<CEM::EmojiToken,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v2 = a2;
  operator new();
}

void sub_18E66175C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<CEM::EmojiToken *,std::shared_ptr<CEM::EmojiToken>::__shared_ptr_default_delete<CEM::EmojiToken,CEM::EmojiToken>,std::allocator<CEM::EmojiToken>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x800000018E676AD3)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<CEM::EmojiToken *,std::shared_ptr<CEM::EmojiToken>::__shared_ptr_default_delete<CEM::EmojiToken,CEM::EmojiToken>,std::allocator<CEM::EmojiToken>>::__on_zero_shared(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  if (v1)
  {
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v1 + 8), 0);
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

void std::__shared_ptr_pointer<CEM::EmojiToken *,std::shared_ptr<CEM::EmojiToken>::__shared_ptr_default_delete<CEM::EmojiToken,CEM::EmojiToken>,std::allocator<CEM::EmojiToken>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FAF2C0);
}

uint64_t CEMEmojiTokenGetSkinTone(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(*(void *)(result + 24) + 16);
  }
  return result;
}

uint64_t CEMEmojiTokenGetHairStyle(uint64_t result)
{
  if (result) {
    return *(unsigned __int8 *)(*(void *)(result + 24) + 20);
  }
  return result;
}

uint64_t CEMEmojiTokenGetGender(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(*(void *)(result + 24) + 28);
  }
  return result;
}

uint64_t CEMEmojiTokenCreateHairStyleVariant(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 24);
    uint64_t v4 = *(void *)(v3 + 40);
    uint64_t v5 = *(unsigned __int16 *)(v3 + 22);
    uint64_t v6 = *(unsigned __int16 *)(v4 + 44);
    if (v5 > v6
      && *(unsigned __int16 *)(v4 + 42) >= (unsigned __int16)(v5 - v6)
      && (*(_WORD *)(**(void **)(v4 + 16) + 16 * (~v6 + v5) + 10) & 0x100) != 0)
    {
      uint64_t v9 = CEM::EmojiData::advance(v4, *(_WORD **)(v4 + 32), 0x100000000, *(CFStringRef *)(v3 + 8));
      uint64_t v10 = *(void *)(v3 + 40);
      uint64_t v13 = (_WORD *)CEM::EmojiData::advance(v10, v9, v11, 0x200Du);
      if (a2 > 4) {
        unsigned int v14 = 0;
      }
      else {
        unsigned int v14 = dword_18E676B68[a2];
      }
      CEM::EmojiData::advance(v10, v13, v12, v14);
      operator new();
    }
    return 0;
  }
  return v2;
}

void sub_18E6619DC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18E6618F0);
}

uint64_t CEMEmojiTokenSupportsHairStyleVariants(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 24);
    uint64_t v2 = *(void *)(v1 + 40);
    uint64_t v3 = *(unsigned __int16 *)(v1 + 22);
    uint64_t v4 = *(unsigned __int16 *)(v2 + 44);
    if (v3 > v4
      && *(unsigned __int16 *)(v2 + 42) >= (unsigned __int16)(v3 - v4))
    {
      return HIBYTE(*(unsigned __int16 *)(**(void **)(v2 + 16) + 16 * (~v4 + v3) + 10)) & 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CEMEmojiTokenGetPresentationStyle(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 24);
    uint64_t v2 = *(void *)(v1 + 40);
    uint64_t v3 = *(unsigned __int16 *)(v1 + 22);
    uint64_t v4 = *(unsigned __int16 *)(v2 + 44);
    if (v3 <= v4
      || *(unsigned __int16 *)(v2 + 42) < (unsigned __int16)(v3 - v4))
    {
      return 0;
    }
    __int16 v5 = *(_WORD *)(**(void **)(v2 + 16) + 16 * (~v4 + v3) + 10);
    double result = (v5 & 0x20) != 0 ? 1 : 2;
    if ((v5 & 0x30) == 0) {
      return 0;
    }
  }
  return result;
}

uint64_t CEMEmojiTokenSupportsPresentationStyle()
{
  return 0;
}

uint64_t CEMEmojiTokenCreatePresentationVariant()
{
  return 0;
}

uint64_t CEMEmojiTokenCreateCopyRemovingModifiers(uint64_t a1)
{
  if (a1)
  {
    CopyRemovingModifiers = CEM::EmojiToken::createCopyRemovingModifiers(*(CEM::EmojiToken **)(a1 + 24));
    std::shared_ptr<CEM::EmojiToken>::shared_ptr[abi:ne180100]<CEM::EmojiToken,void>(&v3, (uint64_t)CopyRemovingModifiers);
  }
  return 0;
}

void sub_18E661B50(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18E661B3CLL);
}

BOOL CEMEmojiTokensAreEquivalent(uint64_t a1, uint64_t a2, int a3)
{
  if (a1)
  {
    uint64_t v3 = *(unsigned __int16 **)(a1 + 24);
    if (!a2) {
      return (a1 | a2) == 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (!a2) {
      return (a1 | a2) == 0;
    }
  }
  if (v3)
  {
    uint64_t v4 = *(unsigned __int16 **)(a2 + 24);
    if (v4)
    {
      if (a3)
      {
        int v5 = CEM::EmojiToken::baseIndex((CEM::EmojiToken *)v3);
        return v5 == CEM::EmojiToken::baseIndex((CEM::EmojiToken *)v4);
      }
      else
      {
        return v3[11] == v4[11];
      }
    }
  }
  return (a1 | a2) == 0;
}

__CFArray *CEMEmojiTokenCopyRelatedEmoji(__CFArray *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1;
  if (a1)
  {
    uint64_t v9 = (uint64_t *)*((void *)a1 + 3);
    uint64_t v10 = *v9;
    if (*v9)
    {
      size_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      CFDictionaryRef v11 = *(const __CFDictionary **)(v10 + 24);
      if (v11)
      {
        CFStringRef v12 = (const __CFString *)v9[1];
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v11, v12);
        if (Value)
        {
          for (CFIndex i = 0; i < CFArrayGetCount(Value); ++i)
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Value, i);
            if (CFStringCompare(ValueAtIndex, v12, 0)) {
              operator new();
            }
          }
        }
      }
      sortEmojiTokens((char **)&v17, *(unsigned char *)(v10 + 784), a3, a4, a5, a6, a7, a8);
    }
    else
    {
      size_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
    }
    uint64_t v8 = CEM::EmojiToken::createWrappers(&v17, *((const void **)v8 + 5));
    uint64_t v20 = (void **)&v17;
    std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](&v20);
  }
  return v8;
}

void sub_18E661E28(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void **a13)
{
  a13 = (void **)&a10;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](&a13);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18E661DFCLL);
}

uint64_t CEMEmojiTokenIsCommon(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 24);
    uint64_t v2 = *(void *)(v1 + 40);
    uint64_t v3 = *(unsigned __int16 *)(v1 + 22);
    uint64_t v4 = *(unsigned __int16 *)(v2 + 44);
    if (v3 > v4
      && *(unsigned __int16 *)(v2 + 42) >= (unsigned __int16)(v3 - v4))
    {
      return (*(unsigned __int16 *)(**(void **)(v2 + 16) + 16 * (~v4 + v3) + 10) >> 7) & 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CEMEmojiTokenCopyName(uint64_t result)
{
  if (result) {
    CEM::EmojiToken::copyNameWithCount(*(CEM::EmojiToken **)(result + 24));
  }
  return result;
}

uint64_t CEMEmojiTokenCopyNameWithCount(uint64_t result)
{
  if (result) {
    CEM::EmojiToken::copyNameWithCount(*(CEM::EmojiToken **)(result + 24));
  }
  return result;
}

uint64_t CEMEmojiTokenGetIndex(uint64_t result)
{
  if (result) {
    return *(unsigned __int16 *)(*(void *)(result + 24) + 22);
  }
  return result;
}

uint64_t CEMEmojiTokenGetLocaleData(uint64_t result)
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

BOOL CEMEmojiTokenIsSupportedForLocaleAndSearchMode(uint64_t a1, uint64_t a2, int a3)
{
  return a1
      && a2
      && CEM::EmojiLocaleData::emojiIndexIsSupported(*(void *)(a2 + 24), a3, *(unsigned __int16 *)(*(void *)(a1 + 24) + 22));
}

uint64_t CEMLongCharacterIsEmoji(unsigned int a1)
{
  if (sharedEmojiData(void)::onceToken != -1) {
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_59);
  }
  uint64_t result = sharedEmojiData(void)::data;
  if (sharedEmojiData(void)::data)
  {
    CEM::EmojiData::advance(sharedEmojiData(void)::data, *(_WORD **)(sharedEmojiData(void)::data + 32), 0x100000000, a1);
    return v4 & (v3 != 0);
  }
  return result;
}

uint64_t __CEMStringContainsEmoji_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a5 = 1;
  return result;
}

unsigned __int16 *CEMCopyEmojiTokens(uint64_t a1, uint64_t a2, void *a3)
{
  if (sharedEmojiData(void)::onceToken != -1) {
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_59);
  }
  unsigned __int8 v4 = (unsigned __int16 *)sharedEmojiData(void)::data;
  if (sharedEmojiData(void)::data)
  {
    CFMutableStringRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    if (v4[21])
    {
      unsigned __int16 v6 = 1;
      do
      {
        if (CEM::EmojiData::isValidIndex((CEM::EmojiData *)v4, v6))
        {
          CFStringRef String = CEM::EmojiData::createString((CEM::EmojiData *)v4, (unsigned __int16)(v4[22] + v6));
          if (String)
          {
            CFArrayAppendValue(Mutable, String);
            CFRelease(String);
          }
        }
        ++v6;
      }
      while (v4[21] >= v6);
    }
    if (Mutable)
    {
      unsigned __int8 v4 = (unsigned __int16 *)CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
      for (CFIndex i = 0; i < CFArrayGetCount(Mutable); ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Mutable, i);
        if (CFStringCompare(ValueAtIndex, @"🇹🇼", 0) || CEM::shouldShowTaiwanFlagEmoji(0))
        {
          uint64_t v10 = (const void *)CEMEmojiTokenCreateWithString(ValueAtIndex, a3);
          CFArrayAppendValue((CFMutableArrayRef)v4, v10);
          CFRelease(v10);
        }
      }
      CFRelease(Mutable);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

__n128 __Block_byref_object_copy__90(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__91(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

void *CEM::ResourceCreationException::ResourceCreationException(void *a1, long long *a2)
{
  *a1 = &unk_1EDD6A100;
  __int16 v3 = (std::string *)(a1 + 1);
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

void sub_18E662264(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void CEM::ResourceCreationException::~ResourceCreationException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1EDD6A100;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

{
  uint64_t vars8;

  CEM::ResourceCreationException::~ResourceCreationException(this);
  JUMPOUT(0x192FAF2C0);
}

uint64_t CEM::ResourceCreationException::what(CEM::ResourceCreationException *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

__n128 __Block_byref_object_copy__94(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  return result;
}

void __Block_byref_object_dispose__95(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

BOOL std::equal_to<std::string>::operator()[abi:ne180100](unsigned __int8 *a1, unsigned __int8 *a2)
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

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned char> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned char>,CEM::ReadOnlyFile<unsigned char>>,std::allocator<CEM::ReadOnlyFile<unsigned char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x800000018E674E9BLL)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

void std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned char> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned char>,CEM::ReadOnlyFile<unsigned char>>,std::allocator<CEM::ReadOnlyFile<unsigned char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FAF2C0);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    int v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    int v7 = this;
    if (__n > 0x16)
    {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      unint64_t v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    this->__r_.__value_.__l.__size_ = __n;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

void *CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(void *a1)
{
  std::operator+<char>();
  CEM::ResourceCreationException::ResourceCreationException(a1, &__p);
  if (v4 < 0) {
    operator delete((void *)__p);
  }
  *a1 = &unk_1EDD6A128;
  return a1;
}

void sub_18E662600(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CEM::ReadOnlyFileCreationException::~ReadOnlyFileCreationException(std::exception *this)
{
  CEM::ResourceCreationException::~ResourceCreationException(this);
  JUMPOUT(0x192FAF2C0);
}

void CEMEnumerateEmojiTokensInStringWithLocaleAndBlock(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (sharedEmojiData(void)::onceToken == -1)
  {
    if (!a1) {
      return;
    }
  }
  else
  {
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_59);
    if (!a1) {
      return;
    }
  }
  int v8 = (CEM::EmojiData *)sharedEmojiData(void)::data;
  if (sharedEmojiData(void)::data)
  {
    CEM::EmojiToken::enumerateEmojiTokensInStringWithBlock(a1, a2, a3, a4, v8);
  }
}

CFStringRef CEMCreateStringByStrippingEmojiCharacters(const __CFString *a1)
{
  CFStringRef v1 = a1;
  CFIndex Length = CFStringGetLength(a1);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000;
  char v20 = 0;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2000000000;
  uint64_t v16 = 0;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3002000000;
  unint64_t v10 = __Block_byref_object_copy_;
  CFDictionaryRef v11 = __Block_byref_object_dispose_;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFTypeRef cf = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Length);
  CEMEnumerateEmojiTokensInStringWithBlock(v1, 0, Length);
  v4.location = v14[3];
  if (Length > v4.location)
  {
    v4.length = Length - v4.location;
    CFStringRef v5 = CFStringCreateWithSubstring(v3, v1, v4);
    CFStringAppend((CFMutableStringRef)v8[5], v5);
    if (v5) {
      CFRelease(v5);
    }
  }
  if (*((unsigned char *)v18 + 24))
  {
    CFStringRef v1 = (const __CFString *)v8[5];
    v8[5] = 0;
  }
  else
  {
    CFRetain(v1);
  }
  _Block_object_dispose(&v7, 8);
  if (cf) {
    CFRelease(cf);
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v1;
}

void sub_18E6628CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  CFStringRef v5 = va_arg(va1, const void *);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v19 = va_arg(va2, void);
  uint64_t v20 = va_arg(va2, void);
  uint64_t v21 = va_arg(va2, void);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Block_object_dispose(va1, 8);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)(v2 + 40));
  _Block_object_dispose(va2, 8);
  _Block_object_dispose((const void *)(v3 - 96), 8);
  _Unwind_Resume(a1);
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

void __CEMCreateStringByStrippingEmojiCharacters_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  v8.location = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v8.length = a3 - v8.location;
  CFStringRef v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFStringRef *)(a1 + 56), v8);
  CFStringAppend(*(CFMutableStringRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 + a4;
  if (v7) {
    CFRelease(v7);
  }
}

void sub_18E6629EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

CFStringRef CEMCreateStringByTranslatingEmojiCharactersToNameInString(const __CFString *a1, int a2, CFTypeRef cf)
{
  CFStringRef v3 = a1;
  if (a1)
  {
    uint64_t v13 = 0;
    nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::acquire(&v13, cf);
    CFRange v4 = v13;
    if (!v13)
    {
      CFRange v4 = (const void *)CEMCreateEmojiLocaleData(@"en_US");
      uint64_t v13 = v4;
    }
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2000000000;
    CFMutableStringRef MutableCopy = 0;
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v3);
    v8[0] = 0;
    v8[1] = v8;
    void v8[2] = 0x2000000000;
    long long v8[3] = 0;
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2000000000;
    _OWORD v7[3] = 0;
    CFIndex Length = CFStringGetLength(v3);
    CEMEnumerateEmojiTokensInStringWithLocaleAndBlock(v3, 0, Length, (uint64_t)v4);
    CFStringRef v3 = (const __CFString *)v10[3];
    _Block_object_dispose(v7, 8);
    _Block_object_dispose(v8, 8);
    _Block_object_dispose(&v9, 8);
    if (v4) {
      CFRelease(v4);
    }
  }
  return v3;
}

void sub_18E662B88(_Unwind_Exception *a1)
{
  nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset((const void **)(v1 - 88), 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::acquire(const void **a1, CFTypeRef cf)
{
  if (*a1 != cf)
  {
    CFRetain(cf);
    nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(a1, cf);
  }
}

void __CEMCreateStringByTranslatingEmojiCharactersToNameInString_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2) {
    CEM::EmojiToken::copyNameWithCount(*(CEM::EmojiToken **)(a2 + 24));
  }
  if (cem_logging_get_default_log_onceToken != -1) {
    dispatch_once(&cem_logging_get_default_log_onceToken, &__block_literal_global_303);
  }
  CFRange v4 = cem_logging_get_default_log_log;
  if (os_log_type_enabled((os_log_t)cem_logging_get_default_log_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(unsigned int *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      uint64_t v7 = MEMORY[0x192FAEE00](*(void *)(*(void *)(v6 + 24) + 32));
    }
    else {
      uint64_t v7 = 0;
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v9 = a2;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_debug_impl(&dword_18E64B000, v4, OS_LOG_TYPE_DEBUG, "Could not load name for emoji '%{public}@' for name type '%lu' for locale identifier '%{public}@'", buf, 0x20u);
  }
}

void sub_18E662DF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(const void **a1, const void *a2)
{
  CFRange v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

uint64_t trie::MarisaTrie<unsigned int,char>::load(uint64_t a1, char *a2, unint64_t a3)
{
  if (a3 >= 0xF)
  {
    if (*(void *)a2 == 0x2065766F6C206557 && *(void *)(a2 + 7) == 0x2E61736972614D20)
    {
      internal::marisa::Trie::map((internal::marisa::grimoire::trie::LoudsTrie **)(a1 + 16), a2, a3);
      return 1;
    }
  }
  else if (a3 < 4)
  {
    return 0;
  }
  uint64_t v7 = a2 + 4;
  uint64_t v8 = *(unsigned int *)a2;
  internal::marisa::Trie::map((internal::marisa::grimoire::trie::LoudsTrie **)(a1 + 16), a2 + 4, v8);
  *(void *)(a1 + 24) = &v7[v8];
  *(void *)(a1 + 32) = (a3 - v8 - 4) >> 2;
  return 1;
}

void *trie::MarisaTrie<unsigned int,char>::~MarisaTrie(void *a1)
{
  *a1 = &unk_1EDD695B8;
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  internal::marisa::Trie::~Trie((internal::marisa::Trie *)(a1 + 2));
  return a1;
}

__n128 __Block_byref_object_copy__54(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__55(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

__n128 __Block_byref_object_copy__43(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  return result;
}

void __Block_byref_object_dispose__44(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t CEM::ReadOnlyFile<char>::~ReadOnlyFile(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (*(void *)a1)
  {
    if (*(unsigned char *)(a1 + 68))
    {
      munmap(*(void **)a1, *(void *)(a1 + 8));
    }
    else
    {
      if (*(_DWORD *)(a1 + 64) != 2) {
        goto LABEL_10;
      }
      CFStringRef v3 = (const char *)(a1 + 16);
      if (*(char *)(a1 + 39) < 0) {
        CFStringRef v3 = *(const char **)v3;
      }
      int v4 = open(v3, 2);
      int v5 = v4;
      uint64_t v2 = *(void **)a1;
      if ((v4 & 0x80000000) == 0)
      {
        write(v4, *(const void **)a1, *(void *)(a1 + 8));
        close(v5);
        uint64_t v2 = *(void **)a1;
      }
      if (v2) {
LABEL_10:
      }
        MEMORY[0x192FAF290](v2, 0x1000C8077774924);
    }
  }
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<char> *,std::shared_ptr<CEM::ReadOnlyFile<char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<char>,CEM::ReadOnlyFile<char>>,std::allocator<CEM::ReadOnlyFile<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x800000018E6755F7)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<char> *,std::shared_ptr<CEM::ReadOnlyFile<char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<char>,CEM::ReadOnlyFile<char>>,std::allocator<CEM::ReadOnlyFile<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    CEM::ReadOnlyFile<char>::~ReadOnlyFile(result);
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

void std::__shared_ptr_pointer<CEM::ReadOnlyFile<char> *,std::shared_ptr<CEM::ReadOnlyFile<char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<char>,CEM::ReadOnlyFile<char>>,std::allocator<CEM::ReadOnlyFile<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FAF2C0);
}

void *trie::MarisaTrie<unsigned int,char>::enumerateChildren(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t *))(*a1 + 112))(a1);
  if (result)
  {
    v7[0] = &unk_1EDD69840;
    v7[1] = a3;
    _OWORD v7[3] = v7;
    internal::marisa::Trie::enumerate_children(a1 + 2, a2, (uint64_t)v7);
    return std::__function::__value_func<void ()(char,internal::marisa::Cursor const&,BOOL &)>::~__value_func[abi:ne180100](v7);
  }
  return result;
}

void sub_18E663220(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(char,internal::marisa::Cursor const&,BOOL &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(char,internal::marisa::Cursor const&,BOOL &)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK4trie10MarisaTrieIjcE17enumerateChildrenERKN8internal6marisa6CursorERKNSt3__18functionIFvcS6_RbEEEEUlcS6_S9_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::operator()(uint64_t a1, char *a2)
{
  return std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)>::operator()(*(void *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDD69840;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDD69840;
  result[1] = v3;
  return result;
}

void std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::~__func()
{
}

void *trie::MarisaTrie<unsigned int,char>::enumerateEntries(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _OWORD v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t result = (void *)(*(uint64_t (**)(unint64_t *))(*a1 + 112))(a1);
  if (result)
  {
    v9[0] = &unk_1EDD697E8;
    v9[1] = a1;
    v9[2] = a3;
    _OWORD v9[3] = v9;
    internal::marisa::Trie::enumerate_entries(a1 + 2, a2, (uint64_t)v9, a4);
    return std::__function::__value_func<void ()(unsigned long,std::string_view,BOOL &)>::~__value_func[abi:ne180100](v9);
  }
  return result;
}

void sub_18E663468(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(unsigned long,std::string_view,BOOL &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(unsigned long,std::string_view,BOOL &)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK4trie10MarisaTrieIjcE16enumerateEntriesERKN8internal6marisa6CursorERKNSt3__18functionIFvjNS7_17basic_string_viewIcNS7_11char_traitsIcEEEERbEEEiEUlmSC_SD_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::operator()(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  int CustomPayload = trie::MarisaTrie<unsigned int,char>::getCustomPayload(*(void *)(a1 + 8), *a2);
  uint64_t v9 = *(void *)(*(void *)(a1 + 16) + 24);
  return std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(v9, CustomPayload, v6, v7, a4);
}

unint64_t trie::MarisaTrie<unsigned int,char>::getCustomPayload(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (v2 <= a2)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::out_of_range::out_of_range[abi:ne180100](exception, "Marisa Payload");
      __cxa_throw(exception, (struct type_info *)off_1E55D5188, MEMORY[0x1E4FBA1D0]);
    }
    return *(unsigned int *)(*(void *)(a1 + 24) + 4 * a2);
  }
  return a2;
}

void sub_18E66361C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[0] = a3;
  v7[1] = a4;
  int v6 = a2;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *, void *, uint64_t))(*(void *)a1 + 48))(a1, &v6, v7, a5);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EDD697E8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  unint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)unint64_t v2 = &unk_1EDD697E8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::~__func()
{
}

uint64_t trie::MarisaTrie<unsigned int,char>::getPayload(uint64_t *a1, uint64_t a2, _DWORD *a3)
{
  if (!(*(unsigned int (**)(uint64_t *))(*a1 + 112))(a1)) {
    return 0;
  }
  unint64_t v8 = 0;
  uint64_t payload = internal::marisa::Trie::get_payload(a1 + 2, a2, &v8);
  if (payload) {
    *a3 = trie::MarisaTrie<unsigned int,char>::getCustomPayload((uint64_t)a1, v8);
  }
  return payload;
}

void trie::MarisaTrie<unsigned int,char>::advance(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
}

BOOL trie::MarisaTrie<unsigned int,char>::isValid(uint64_t a1, void *a2)
{
  return *a2 != 0xFFFFFFFFLL;
}

double trie::MarisaTrie<unsigned int,char>::root@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void *trie::MarisaTrie<unsigned int,char>::enumerateCompletions(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EDD69898;
  v6[1] = a1;
  v6[2] = a4;
  uint64_t v6[3] = v6;
  internal::marisa::Trie::predictive_search((internal::marisa::grimoire::vector::BitVector **)(a1 + 16), a2, a3, (uint64_t)v6, a5);
  return std::__function::__value_func<void ()(unsigned long,std::string_view,BOOL &)>::~__value_func[abi:ne180100](v6);
}

void sub_18E6638AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(unsigned long,std::string_view,BOOL &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK4trie10MarisaTrieIjcE20enumerateCompletionsENSt3__117basic_string_viewIcNS2_11char_traitsIcEEEERKNS2_8functionIFvjS6_RbEEEiEUlmS6_S8_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::operator()(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  int CustomPayload = trie::MarisaTrie<unsigned int,char>::getCustomPayload(*(void *)(a1 + 8), *a2);
  uint64_t v9 = *(void *)(*(void *)(a1 + 16) + 24);
  return std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(v9, CustomPayload, v6, v7, a4);
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EDD69898;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  unint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)unint64_t v2 = &unk_1EDD69898;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::~__func()
{
}

void *trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1EDD698F0;
  v5[1] = a1;
  v5[2] = a4;
  v5[3] = v5;
  internal::marisa::Trie::common_prefix_search((uint64_t *)(a1 + 16), a2, a3, (uint64_t)v5);
  return std::__function::__value_func<void ()(unsigned long,std::string_view,BOOL &)>::~__value_func[abi:ne180100](v5);
}

void sub_18E663A88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(unsigned long,std::string_view,BOOL &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK4trie10MarisaTrieIjcE22enumeratePrefixStringsENSt3__117basic_string_viewIcNS2_11char_traitsIcEEEERKNS2_8functionIFvjS6_RbEEEEUlmS6_S8_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::operator()(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  int CustomPayload = trie::MarisaTrie<unsigned int,char>::getCustomPayload(*(void *)(a1 + 8), *a2);
  uint64_t v9 = *(void *)(*(void *)(a1 + 16) + 24);
  return std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(v9, CustomPayload, v6, v7, a4);
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EDD698F0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  unint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)unint64_t v2 = &unk_1EDD698F0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::~__func()
{
}

uint64_t trie::MarisaTrie<unsigned int,char>::lookup(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *a4)
{
  unint64_t v8 = 0;
  uint64_t v6 = internal::marisa::Trie::lookup((internal::marisa::grimoire::vector::BitVector **)(a1 + 16), a2, a3, &v8);
  if (v6) {
    *a4 = trie::MarisaTrie<unsigned int,char>::getCustomPayload(a1, v8);
  }
  return v6;
}

uint64_t trie::MarisaTrie<unsigned int,char>::build(uint64_t a1, uint64_t **a2, int **a3)
{
  long long __p = 0;
  CFRange v38 = 0;
  uint64_t v39 = 0;
  int v5 = *a2;
  uint64_t v6 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * (v6 - v5) != a3[1] - *a3) {
    __assert_rtn("build", "MarisaTrie.h", 61, "keys.size() == values.size()");
  }
  uint64_t v9 = trie::MarisaTrie<unsigned int,char>::buildFromKeys(a1, v5, v6, &__p);
  if (v9)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (a2[1] - *a2);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    unint64_t v13 = (v12 - v11) >> 2;
    if (v10 <= v13)
    {
      if (v10 >= v13)
      {
LABEL_20:
        uint64_t v27 = *(void *)(a1 + 40);
        int64_t v28 = (char *)a2[1] - (char *)*a2;
        if (v28)
        {
          unint64_t v29 = v28 / 24;
          uint64_t v30 = *a3;
          uint64_t v31 = (uint64_t *)__p;
          if (v29 <= 1) {
            unint64_t v29 = 1;
          }
          do
          {
            int v33 = *v30++;
            int v32 = v33;
            uint64_t v34 = *v31++;
            *(_DWORD *)(v27 + 4 * v34) = v32;
            --v29;
          }
          while (v29);
        }
        uint64_t v35 = (*(void *)(a1 + 48) - v27) >> 2;
        *(void *)(a1 + 24) = v27;
        *(void *)(a1 + 32) = v35;
        goto LABEL_25;
      }
      uint64_t v26 = v11 - 0x5555555555555554 * (a2[1] - *a2);
    }
    else
    {
      unint64_t v14 = v10 - v13;
      uint64_t v15 = *(void *)(a1 + 56);
      if (v10 - v13 > (v15 - v12) >> 2)
      {
        if (v10 >> 62) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = v15 - v11;
        if (v16 >> 1 > v10) {
          unint64_t v10 = v16 >> 1;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v10;
        }
        uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v17);
        uint64_t v19 = *(char **)(a1 + 40);
        uint64_t v20 = *(char **)(a1 + 48);
        uint64_t v21 = &v18[4 * v13];
        int v23 = &v18[4 * v22];
        bzero(v21, 4 * v14);
        BOOL v24 = &v21[4 * v14];
        while (v20 != v19)
        {
          int v25 = *((_DWORD *)v20 - 1);
          v20 -= 4;
          *((_DWORD *)v21 - 1) = v25;
          v21 -= 4;
        }
        *(void *)(a1 + 40) = v21;
        *(void *)(a1 + 48) = v24;
        *(void *)(a1 + 56) = v23;
        if (v19) {
          operator delete(v19);
        }
        goto LABEL_20;
      }
      bzero(*(void **)(a1 + 48), 4 * v14);
      uint64_t v26 = v12 + 4 * v14;
    }
    *(void *)(a1 + 48) = v26;
    goto LABEL_20;
  }
LABEL_25:
  if (__p)
  {
    CFRange v38 = __p;
    operator delete(__p);
  }
  return v9;
}

void sub_18E663E44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t trie::MarisaTrie<unsigned int,char>::buildFromKeys(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  int v4 = a4;
  uint64_t v5 = a1;
  long long __p = 0;
  BOOL v24 = 0;
  int v25 = 0;
  if (a2 != a3)
  {
    uint64_t v7 = a2;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = v24;
    do
    {
      if (*((char *)v7 + 23) < 0)
      {
        uint64_t v12 = (uint64_t *)*v7;
        uint64_t v11 = v7[1];
      }
      else
      {
        uint64_t v11 = *((unsigned __int8 *)v7 + 23);
        uint64_t v12 = v7;
      }
      if (v9 >= v25)
      {
        uint64_t v13 = (v9 - v8) >> 4;
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 60)
        {
          BOOL v24 = v10;
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v15 = v25 - v8;
        if ((v25 - v8) >> 3 > v14) {
          unint64_t v14 = v15 >> 3;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16 >> 60)
        {
          BOOL v24 = v10;
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        unint64_t v17 = (char *)operator new(16 * v16);
        uint64_t v18 = &v17[16 * v13];
        *(void *)uint64_t v18 = v12;
        *((void *)v18 + 1) = v11;
        uint64_t v19 = (char *)__p;
        unint64_t v8 = v18;
        if (v9 != __p)
        {
          do
          {
            *((_OWORD *)v8 - 1) = *((_OWORD *)v9 - 1);
            v8 -= 16;
            v9 -= 16;
          }
          while (v9 != v19);
          uint64_t v9 = v19;
        }
        unint64_t v10 = v18 + 16;
        long long __p = v8;
        int v25 = &v17[16 * v16];
        if (v9) {
          operator delete(v9);
        }
      }
      else
      {
        *(void *)uint64_t v9 = v12;
        *((void *)v9 + 1) = v11;
        unint64_t v10 = v9 + 16;
      }
      v7 += 3;
      uint64_t v9 = (char *)v10;
    }
    while (v7 != a3);
    BOOL v24 = v10;
    uint64_t v5 = a1;
    int v4 = a4;
  }
  internal::marisa::Trie::build((internal::marisa::grimoire::trie::LoudsTrie **)(v5 + 16), (uint64_t *)&__p, v4, *(_DWORD *)(v5 + 8));
  if (__p)
  {
    BOOL v24 = __p;
    operator delete(__p);
  }
  return 1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

uint64_t trie::MarisaTrie<unsigned int,char>::build(uint64_t a1, uint64_t **a2)
{
  return trie::MarisaTrie<unsigned int,char>::buildFromKeys(a1, *a2, a2[1], 0);
}

uint64_t trie::MarisaTrie<unsigned int,char>::serialize@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v14);
  internal::marisa::Trie::write((internal::marisa::grimoire::trie::LoudsTrie ***)(a1 + 16), (uint64_t)&v15);
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>(__p, (uint64_t)v16);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = HIBYTE(v13);
    if (v13 < 0) {
      int v5 = (int)__p[1];
    }
    *(_DWORD *)__s = v5;
    uint64_t v6 = *(const std::string::value_type **)(a1 + 24);
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    a2->__r_.__value_.__r.__words[0] = 0;
    std::string::append(a2, __s, 4uLL);
    if (v13 >= 0) {
      uint64_t v7 = __p;
    }
    else {
      uint64_t v7 = (void **)__p[0];
    }
    if (v13 >= 0) {
      std::string::size_type v8 = HIBYTE(v13);
    }
    else {
      std::string::size_type v8 = (std::string::size_type)__p[1];
    }
    std::string::append(a2, (const std::string::value_type *)v7, v8);
    std::string::append(a2, v6, 4 * v4);
    if (SHIBYTE(v13) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    a2->__r_.__value_.__r.__words[2] = v13;
  }
  v14[0] = *MEMORY[0x1E4FBA408];
  uint64_t v9 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v14 + *(void *)(v14[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  uint64_t v15 = v9;
  v16[0] = MEMORY[0x1E4FBA470] + 16;
  if (v17 < 0) {
    operator delete((void *)v16[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x192FAF250](&v18);
}

void sub_18E664294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA488] + 104;
  *(void *)(a1 + 128) = MEMORY[0x1E4FBA488] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x1E4FBA488] + 64;
  *(void *)(a1 + 16) = MEMORY[0x1E4FBA488] + 64;
  int v5 = (void *)MEMORY[0x1E4FBA408];
  uint64_t v6 = *(void *)(MEMORY[0x1E4FBA408] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x1E4FBA408] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  std::string::size_type v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x1E4FBA488] + 24;
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
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_18E664584(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x192FAF250](v1);
  _Unwind_Resume(a1);
}

void *std::stringbuf::str[abi:ne180100]<std::allocator<char>>(void *__dst, uint64_t a2)
{
  uint64_t v2 = __dst;
  int v3 = *(_DWORD *)(a2 + 96);
  if ((v3 & 0x10) != 0)
  {
    unint64_t v5 = *(void *)(a2 + 88);
    unint64_t v6 = *(void *)(a2 + 48);
    if (v5 < v6)
    {
      *(void *)(a2 + 88) = v6;
      unint64_t v5 = v6;
    }
    uint64_t v7 = (const void **)(a2 + 40);
  }
  else
  {
    if ((v3 & 8) == 0)
    {
      size_t v4 = 0;
      *((unsigned char *)__dst + 23) = 0;
      goto LABEL_16;
    }
    uint64_t v7 = (const void **)(a2 + 16);
    unint64_t v5 = *(void *)(a2 + 32);
  }
  std::string::size_type v8 = *v7;
  size_t v4 = v5 - (void)*v7;
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 >= 0x17)
  {
    uint64_t v9 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v9 = v4 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint64_t v11 = operator new(v9 + 1);
    v2[1] = v4;
    v2[2] = v10 | 0x8000000000000000;
    void *v2 = v11;
    uint64_t v2 = v11;
  }
  else
  {
    *((unsigned char *)__dst + 23) = v4;
    if (!v4) {
      goto LABEL_16;
    }
  }
  long long __dst = memmove(v2, v8, v4);
LABEL_16:
  *((unsigned char *)v2 + v4) = 0;
  return __dst;
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA408];
  uint64_t v3 = *MEMORY[0x1E4FBA408];
  *(void *)a1 = *MEMORY[0x1E4FBA408];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x192FAF250](a1 + 128);
  return a1;
}

void *trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1EDD69948;
  v5[1] = a4;
  v5[3] = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(*(void *)a1 + 96))(a1, a2, a3, v5);
  return std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100](v5);
}

void sub_18E664864(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK4trie4TrieIjcN8internal6marisa6CursorEE20enumerateCompletionsEPKcmRKNSt3__18functionIFvxNS7_17basic_string_viewIcNS7_11char_traitsIcEEEERbEEEiEUljSC_SD_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4)
{
  return std::function<void ()(long long,std::string_view,BOOL &)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, a3[1], a4);
}

uint64_t std::function<void ()(long long,std::string_view,BOOL &)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[0] = a3;
  v7[1] = a4;
  uint64_t v6 = a2;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, void *, uint64_t))(*(void *)a1 + 48))(a1, &v6, v7, a5);
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDD69948;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_1EDD69948;
  result[1] = v3;
  return result;
}

void std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
}

void *trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1EDD699A0;
  v5[1] = a4;
  v5[3] = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(*(void *)a1 + 88))(a1, a2, a3, v5);
  return std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100](v5);
}

void sub_18E664AEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK4trie4TrieIjcN8internal6marisa6CursorEE22enumeratePrefixStringsEPKcmRKNSt3__18functionIFvxNS7_17basic_string_viewIcNS7_11char_traitsIcEEEERbEEEEUljSC_SD_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4)
{
  return std::function<void ()(long long,std::string_view,BOOL &)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, a3[1], a4);
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDD699A0;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_1EDD699A0;
  result[1] = v3;
  return result;
}

void std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
}

uint64_t trie::Trie<unsigned int,char,internal::marisa::Cursor>::lookup(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unsigned int v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *))(*(void *)a1 + 80))(a1, a2, a3, &v6);
  *a4 = v6;
  return result;
}

uint64_t trie::Trie<unsigned int,char,internal::marisa::Cursor>::build(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  memset(&v37, 0, sizeof(v37));
  long long __p = 0;
  uint64_t v35 = 0;
  unint64_t v36 = 0;
  if (a2)
  {
    for (uint64_t i = 0; i != a2; ++i)
    {
      uint64_t v10 = *(void **)(a3 + 8 * i);
      size_t v11 = *(void *)(a4 + 8 * i);
      std::vector<std::string>::pointer end = v37.__end_;
      if (v37.__end_ >= v37.__end_cap_.__value_)
      {
        unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v37.__end_ - (char *)v37.__begin_) >> 3);
        unint64_t v15 = v14 + 1;
        if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3) > v15) {
          unint64_t v15 = 0x5555555555555556 * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v16 = v15;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v37.__end_cap_;
        if (v16) {
          unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v16);
        }
        else {
          uint64_t v17 = 0;
        }
        __v.__first_ = (std::__split_buffer<std::string>::pointer)v16;
        __v.__begin_ = (std::__split_buffer<std::string>::pointer)(v16 + 24 * v14);
        __v.__end_ = __v.__begin_;
        __v.__end_cap_.__value_ = (std::string *)(v16 + 24 * v17);
        std::string::basic_string[abi:ne180100](__v.__begin_->__r_.__value_.__r.__words, v10, v11);
        ++__v.__end_;
        std::vector<std::string>::__swap_out_circular_buffer(&v37, &__v);
        int64_t v13 = v37.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__v);
      }
      else
      {
        std::string::basic_string[abi:ne180100](v37.__end_->__r_.__value_.__r.__words, *(void **)(a3 + 8 * i), *(void *)(a4 + 8 * i));
        int64_t v13 = end + 1;
      }
      v37.__end_ = v13;
      if (a5)
      {
        uint64_t v18 = *(void *)(a5 + 8 * i);
        uint64_t v19 = v35;
        if ((unint64_t)v35 >= v36)
        {
          uint64_t v21 = __p;
          uint64_t v22 = (v35 - __p) >> 2;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v24 = v36 - (void)__p;
          if ((uint64_t)(v36 - (void)__p) >> 1 > v23) {
            unint64_t v23 = v24 >> 1;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25) {
            unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v25);
          }
          else {
            uint64_t v26 = 0;
          }
          uint64_t v27 = (char *)(v25 + 4 * v22);
          *(_DWORD *)uint64_t v27 = v18;
          uint64_t v20 = v27 + 4;
          while (v19 != __p)
          {
            int v28 = *((_DWORD *)v19 - 1);
            v19 -= 4;
            *((_DWORD *)v27 - 1) = v28;
            v27 -= 4;
          }
          long long __p = v27;
          unint64_t v36 = v25 + 4 * v26;
          if (v21) {
            operator delete(v21);
          }
        }
        else
        {
          *(_DWORD *)uint64_t v35 = v18;
          uint64_t v20 = v35 + 4;
        }
        uint64_t v35 = v20;
      }
    }
  }
  uint64_t v29 = *a1;
  if (a5) {
    uint64_t v30 = (*(uint64_t (**)(void))(v29 + 64))();
  }
  else {
    uint64_t v30 = (*(uint64_t (**)(void))(v29 + 56))();
  }
  uint64_t v31 = v30;
  if (__p) {
    operator delete(__p);
  }
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v37;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  return v31;
}

void sub_18E664EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *__p, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, std::__split_buffer<std::string> *a10, uint64_t a11, void *__pa, void *a13, uint64_t a14, char a15)
{
  if (__pa)
  {
    a13 = __pa;
    operator delete(__pa);
  }
  __pa = &a15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
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
    unsigned int v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *long long __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    unsigned int v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0) {
          operator delete(*(v4 - 3));
        }
        v4 -= 3;
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::vector<std::string>::pointer begin = this->__begin_;
  std::vector<std::string>::pointer end = this->__end_;
  std::__split_buffer<std::string>::pointer v4 = __v->__begin_;
  if (end == this->__begin_)
  {
    unint64_t v5 = __v->__begin_;
  }
  else
  {
    do
    {
      unint64_t v5 = v4 - 1;
      long long v6 = *(_OWORD *)&end[-1].__r_.__value_.__l.__data_;
      v4[-1].__r_.__value_.__r.__words[2] = end[-1].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v4[-1].__r_.__value_.__l.__data_ = v6;
      end[-1].__r_.__value_.__l.__size_ = 0;
      end[-1].__r_.__value_.__r.__words[2] = 0;
      end[-1].__r_.__value_.__r.__words[0] = 0;
      --v4;
      --end;
    }
    while (end != begin);
  }
  __v->__begin_ = v5;
  size_t v7 = this->__begin_;
  this->__begin_ = v5;
  __v->__begin_ = v7;
  size_t v8 = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = v8;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
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

void trie::MarisaTrie<unsigned int,char>::~MarisaTrie(void *a1)
{
  trie::MarisaTrie<unsigned int,char>::~MarisaTrie(a1);
  JUMPOUT(0x192FAF2C0);
}

void CEM::EmojiSearchTrie::EmojiSearchTrie(CEM::EmojiSearchTrie *this, const __CFLocale *a2, const __CFURL *a3)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = &unk_1EDD695B8;
  *((_DWORD *)this + 6) = 0;
  internal::marisa::Trie::Trie((void *)this + 4);
  *((void *)this + 9) = 0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  CEM::getFileSystemRepresentationFromCFURL((CEM *)__p, a3);
}

void sub_18E6653E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v19 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v16 + 119) < 0) {
        operator delete(*v17);
      }
      uint64_t v21 = *(std::__shared_weak_count **)(v16 + 88);
      if (v21) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      }
      trie::MarisaTrie<unsigned int,char>::~MarisaTrie(v15);
      _Unwind_Resume(a1);
    }
  }
  else if (!v19)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v18);
  goto LABEL_6;
}

void CEM::EmojiSearchTrie::payloadToIndexes(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = a2 & 0x3FFFFF;
  uint64_t v5 = *a1;
  long long v6 = (_WORD *)(*a1 + 2 * v4);
  if (a1[15])
  {
    uint64_t v8 = a1[1];
    uint64_t v9 = (_WORD *)(*a1 + 2 * v4);
    if (v8 != v4)
    {
      uint64_t v9 = (_WORD *)(*a1 + 2 * v4);
      uint64_t v10 = 2 * v8 - 2 * v4;
      while (*v9)
      {
        ++v9;
        v10 -= 2;
        if (!v10)
        {
          uint64_t v9 = (_WORD *)(v5 + 2 * v8);
          break;
        }
      }
    }
    uint64_t v7 = v9 - v6;
  }
  else
  {
    uint64_t v7 = a2 >> 22;
    uint64_t v8 = a1[1];
  }
  unint64_t v11 = (unint64_t)&v6[v7];
  if (v5 + 2 * v8 >= v11 && v7 != 0)
  {
    int64_t v13 = *(_WORD **)(a3 + 8);
    do
    {
      unint64_t v14 = *(void *)(a3 + 16);
      if ((unint64_t)v13 >= v14)
      {
        uint64_t v16 = *(_WORD **)a3;
        uint64_t v17 = (uint64_t)v13 - *(void *)a3;
        if (v17 <= -3) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v18 = v17 >> 1;
        unint64_t v19 = v14 - (void)v16;
        if (v19 <= (v17 >> 1) + 1) {
          unint64_t v20 = v18 + 1;
        }
        else {
          unint64_t v20 = v19;
        }
        if (v19 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v21 = v20;
        }
        if (v21)
        {
          if (v21 < 0) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v22 = (char *)operator new(2 * v21);
        }
        else
        {
          uint64_t v22 = 0;
        }
        unint64_t v23 = &v22[2 * v18];
        *(_WORD *)unint64_t v23 = *v6;
        unint64_t v15 = v23 + 2;
        while (v13 != v16)
        {
          __int16 v24 = *--v13;
          *((_WORD *)v23 - 1) = v24;
          v23 -= 2;
        }
        *(void *)a3 = v23;
        *(void *)(a3 + 8) = v15;
        *(void *)(a3 + 16) = &v22[2 * v21];
        if (v16) {
          operator delete(v16);
        }
      }
      else
      {
        *int64_t v13 = *v6;
        unint64_t v15 = v13 + 1;
      }
      *(void *)(a3 + 8) = v15;
      ++v6;
      int64_t v13 = v15;
    }
    while (v6 != (_WORD *)v11);
  }
}

__n128 CEM::replace(uint64_t a1, std::string *this, uint64_t a3, uint64_t a4)
{
  for (std::string::size_type i = 0; ; i += v24)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    {
      uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
      std::string::size_type size = this->__r_.__value_.__l.__size_;
    }
    else
    {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      uint64_t v10 = this;
    }
    int v11 = *(char *)(a3 + 23);
    uint64_t v12 = v11 >= 0 ? (char *)a3 : *(char **)a3;
    int64_t v13 = v11 >= 0 ? *(unsigned __int8 *)(a3 + 23) : *(void *)(a3 + 8);
    if (size < i) {
      break;
    }
    if (v13)
    {
      unint64_t v14 = (char *)v10 + i;
      unint64_t v15 = (char *)v10 + size;
      int64_t v16 = size - i;
      if (v16 >= v13)
      {
        int v17 = *v12;
        while (1)
        {
          int64_t v18 = v16 - v13;
          if (v18 == -1) {
            break;
          }
          unint64_t v19 = (char *)memchr(v14, v17, v18 + 1);
          if (!v19) {
            break;
          }
          unint64_t v20 = v19;
          if (!memcmp(v19, v12, v13))
          {
            if (v20 == v15) {
              goto LABEL_32;
            }
            std::string::size_type i = v20 - (char *)v10;
            goto LABEL_22;
          }
          unint64_t v14 = v20 + 1;
          int64_t v16 = v15 - (v20 + 1);
          if (v16 < v13) {
            goto LABEL_32;
          }
        }
      }
      break;
    }
LABEL_22:
    if (i == -1) {
      break;
    }
    int v21 = *(char *)(a4 + 23);
    if (v21 >= 0) {
      uint64_t v22 = (const std::string::value_type *)a4;
    }
    else {
      uint64_t v22 = *(const std::string::value_type **)a4;
    }
    if (v21 >= 0) {
      std::string::size_type v23 = *(unsigned __int8 *)(a4 + 23);
    }
    else {
      std::string::size_type v23 = *(void *)(a4 + 8);
    }
    std::string::replace(this, i, v13, v22, v23);
    uint64_t v24 = *(unsigned __int8 *)(a4 + 23);
    if ((v24 & 0x80u) != 0) {
      uint64_t v24 = *(void *)(a4 + 8);
    }
  }
LABEL_32:
  __n128 result = *(__n128 *)&this->__r_.__value_.__l.__data_;
  *(_OWORD *)a1 = *(_OWORD *)&this->__r_.__value_.__l.__data_;
  *(void *)(a1 + 16) = *((void *)&this->__r_.__value_.__l + 2);
  this->__r_.__value_.__l.__size_ = 0;
  this->__r_.__value_.__r.__words[2] = 0;
  this->__r_.__value_.__r.__words[0] = 0;
  return result;
}

uint64_t CEM::EmojiSearchTrie::getPayload(uint64_t a1, uint64_t a2, int a3, _DWORD *a4)
{
  int v11 = a3;
  uint64_t v5 = (uint64_t *)(a1 + 16);
  if ((*(_WORD *)(a1 + 120) & 2) != 0)
  {
    internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(a1 + 32), (uint64_t)&v11, 1uLL, a2, v9);
    uint64_t Payload = trie::MarisaTrie<unsigned int,char>::getPayload(v5, (uint64_t)v9, a4);
    if (v10 < 0) {
      operator delete(v9[1]);
    }
    return Payload;
  }
  else
  {
    long long v6 = (uint64_t *)(a1 + 16);
    return trie::MarisaTrie<unsigned int,char>::getPayload(v6, a2, a4);
  }
}

void sub_18E6657E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK3CEM15EmojiSearchTrie22findEmojiForSingleWordEPK10__CFStringS3_18CEMEmojiSearchTypehE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, unsigned int *a2, void *a3)
{
  unsigned int v3 = *a2;
  if ((*(_WORD *)(*(void *)(a1 + 8) + 120) & 2) == 0
    || (uint64_t v4 = a3[1]) != 0 && **(_DWORD **)(a1 + 16) == *(char *)(v4 + *a3 - 1))
  {
    CEM::EmojiSearchTrie::payloadToIndexes(*(uint64_t **)(a1 + 8), v3, *(void *)(a1 + 24));
  }
}

__n128 std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EDD69738;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_1EDD69738;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

void std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::_initialize(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 8);
  cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::node>((void **)(a1 + 8), 256, 256);
  cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<char>((void **)(a1 + 16), 4, 0);
  cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<int>((void **)(a1 + 24), 1, 0);
  cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>((void **)(a1 + 32), 256, 0);
  cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>((void **)(a1 + 40), 1, 0);
  uint64_t v3 = 0;
  **(void **)(a1 + 8) = 0xFFFFFFFF00000000;
  unint64_t v4 = 0xFFFFFFFE00000000;
  for (uint64_t i = 8; i != 2048; i += 8)
  {
    uint64_t v6 = v3;
    if (i == 2040) {
      unint64_t v7 = 0xFFFFFFFF00000000;
    }
    else {
      unint64_t v7 = v4;
    }
    if (!v3) {
      uint64_t v6 = 4294967041;
    }
    *(void *)(*v2 + i) = v7 | v6;
    v4 -= 0x100000000;
    --v3;
  }
  *(void *)(a1 + 60) = 0x10000000100;
  *(_DWORD *)(*(void *)(a1 + 40) + 16) = 1;
  **(_DWORD **)(a1 + 16) = 4;
  *(void *)(a1 + 68) = 0x100000004;
  *(void *)a1 = 0;
  for (uint64_t j = 40; j != 297; ++j)
    *(_WORD *)(a1 + 2 * j) = j - 39;
}

uint64_t *std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *__n128 result = a2;
  if (v2)
  {
    if (*(char *)(v2 + 167) < 0) {
      operator delete(*(void **)(v2 + 144));
    }
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 136);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    std::mutex::~mutex((std::mutex *)(v2 + 64));
    std::mutex::~mutex((std::mutex *)v2);
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::node>(void **a1, int a2, int a3)
{
  uint64_t v6 = malloc_type_realloc(*a1, 8 * a2, 0x100004000313F17uLL);
  if (!v6)
  {
    free(*a1);
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "cedar: %s [%d]: %s", "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/trie/cedarpp.h", 770, "memory reallocation failed\n");
    exit(1);
  }
  *a1 = v6;
  {
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::node>(cedar::da<unsigned int,-1,-2,true,1,0ul>::node *&,int,int)::T0 = 0;
  }
  if (a3 != a2)
  {
    unint64_t v7 = (uint64_t *)((char *)*a1 + 8 * a3);
    uint64_t v8 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::node>(cedar::da<unsigned int,-1,-2,true,1,0ul>::node *&,int,int)::T0;
    uint64_t v9 = 8 * a2 - 8 * a3;
    do
    {
      *v7++ = v8;
      v9 -= 8;
    }
    while (v9);
  }
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<char>(void **a1, int a2, int a3)
{
  uint64_t v6 = a2;
  unint64_t v7 = (char *)malloc_type_realloc(*a1, a2, 0x100004077774924uLL);
  if (!v7)
  {
    free(*a1);
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "cedar: %s [%d]: %s", "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/trie/cedarpp.h", 770, "memory reallocation failed\n");
    exit(1);
  }
  *a1 = v7;
  if (a3 != a2)
  {
    uint64_t v8 = &v7[a3];
    bzero(v8, v6 - a3);
  }
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<int>(void **a1, int a2, int a3)
{
  size_t v6 = 4 * a2;
  unint64_t v7 = (char *)malloc_type_realloc(*a1, v6, 0x100004052888210uLL);
  if (!v7)
  {
    free(*a1);
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "cedar: %s [%d]: %s", "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/trie/cedarpp.h", 770, "memory reallocation failed\n");
    exit(1);
  }
  *a1 = v7;
  if (a3 != a2)
  {
    uint64_t v8 = &v7[4 * a3];
    bzero(v8, v6 - 4 * a3);
  }
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>(void **a1, int a2, int a3)
{
  size_t v6 = malloc_type_realloc(*a1, 2 * a2, 0x1000040BDFB0063uLL);
  if (!v6)
  {
    free(*a1);
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "cedar: %s [%d]: %s", "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/trie/cedarpp.h", 770, "memory reallocation failed\n");
    exit(1);
  }
  *a1 = v6;
  {
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>(cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo *&,int,int)::T0 = 0;
  }
  if (a3 != a2)
  {
    unint64_t v7 = (__int16 *)((char *)*a1 + 2 * a3);
    __int16 v8 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>(cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo *&,int,int)::T0;
    uint64_t v9 = 2 * a2 - 2 * a3;
    do
    {
      *v7++ = v8;
      v9 -= 2;
    }
    while (v9);
  }
}

__n128 cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(void **a1, int a2, int a3)
{
  size_t v6 = malloc_type_realloc(*a1, 20 * a2, 0x1000040A86A77D5uLL);
  if (!v6)
  {
    free(*a1);
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "cedar: %s [%d]: %s", "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/trie/cedarpp.h", 770, "memory reallocation failed\n");
    exit(1);
  }
  *a1 = v6;
  {
    *(void *)&cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(cedar::da<unsigned int,-1,-2,true,1,0ul>::block *&,int,int)::T0 = 0;
    DWORD2(cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(cedar::da<unsigned int,-1,-2,true,1,0ul>::block *&,int,int)::T0) = 16843008;
    *(void *)((char *)&cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(cedar::da<unsigned int,-1,-2,true,1,0ul>::block *&,int,int)::T0
              + 12) = 0;
  }
  if (a3 != a2)
  {
    __int16 v8 = (__n128 *)((char *)*a1 + 20 * a3);
    uint64_t v9 = 20 * a2 - 20 * a3;
    do
    {
      __n128 result = (__n128)cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(cedar::da<unsigned int,-1,-2,true,1,0ul>::block *&,int,int)::T0;
      v8[1].n128_u32[0] = dword_1EB3F62D8;
      *__int16 v8 = result;
      __int16 v8 = (__n128 *)((char *)v8 + 20);
      v9 -= 20;
    }
    while (v9);
  }
  return result;
}

void trie::CedarMinimalPrefixTrie<unsigned int,char>::clear(uint64_t a1)
{
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::clear(uint64_t a1, int a2)
{
  uint64_t v4 = a1 + 8;
  if (*(_DWORD *)(a1 + 76))
  {
    *(void *)uint64_t v4 = 0;
    *(void *)(a1 + 16) = 0;
  }
  else if (*(void *)v4)
  {
    free(*(void **)v4);
  }
  uint64_t v5 = *(void **)(a1 + 16);
  if (v5) {
    free(v5);
  }
  size_t v6 = *(void **)(a1 + 24);
  if (v6) {
    free(v6);
  }
  unint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    free(v7);
  }
  __int16 v8 = *(void **)(a1 + 40);
  if (v8) {
    free(v8);
  }
  *(_DWORD *)(v4 + 64) = 0;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  if (a2) {
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_initialize(a1);
  }
  *(_DWORD *)(a1 + 76) = 0;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::removeEntry()
{
  return 0;
}

BOOL trie::CedarMinimalPrefixTrie<unsigned int,char>::addEntry(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *a4)
{
  if (a3)
  {
    uint64_t v8 = a1 + 8;
    uint64_t v51 = 0;
    if (!*(void *)(a1 + 40) || !*(void *)(a1 + 48)) {
      cedar::da<unsigned int,-1,-2,true,1,0ul>::restore(a1 + 8);
    }
    int v9 = **(_DWORD **)(a1 + 16);
    if ((v9 & 0x80000000) == 0)
    {
      unint64_t v10 = 0;
      while (a3 != v10)
      {
        int v11 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, (unsigned __int8 *)(a2 + v10));
        unint64_t v12 = v11;
        uint64_t v51 = v11;
        ++v10;
        int v9 = *(_DWORD *)(*(void *)(a1 + 16) + 8 * v11);
        if (v9 < 0) {
          goto LABEL_11;
        }
      }
      char v57 = 0;
      int v17 = (unsigned __int8 *)&v57;
      goto LABEL_34;
    }
    unint64_t v12 = 0;
    unint64_t v10 = 0;
LABEL_11:
    unint64_t v13 = -v9;
    if (v13 >= 4)
    {
      unint64_t v14 = (unsigned __int8 *)(*(void *)(a1 + 24) + v13);
      uint64_t v50 = &v14[-v10];
      unint64_t v15 = v10;
      if (v10 < a3)
      {
        unint64_t v15 = v10;
        while (1)
        {
          int v16 = *v14++;
          if (*(unsigned __int8 *)(a2 + v15) != v16) {
            break;
          }
          if (a3 == ++v15) {
            goto LABEL_19;
          }
        }
      }
      if (v15 == a3)
      {
LABEL_19:
        unint64_t v15 = a3;
        if (!v50[a3])
        {
          uint64_t v30 = v50;
          goto LABEL_53;
        }
      }
      uint64_t v49 = a4;
      if (HIDWORD(v12))
      {
        uint64_t v51 = v12;
        unint64_t v18 = -(uint64_t)*(int *)(*(void *)(a1 + 16) + 8 * v12);
        if (v13 > v18)
        {
          do
          {
            unsigned __int8 v56 = *(unsigned char *)(*(void *)(a1 + 24) + v18);
            uint64_t v51 = (int)cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, &v56);
            ++v18;
          }
          while (v13 != v18);
        }
      }
      unint64_t v19 = v15 - v10;
      if (v15 > v10)
      {
        unint64_t v20 = (unsigned __int8 *)(a2 + v10);
        unint64_t v21 = v19;
        do
        {
          unsigned __int8 v22 = *v20++;
          unsigned __int8 v55 = v22;
          uint64_t v51 = (int)cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, &v55);
          --v21;
        }
        while (v21);
      }
      if (v50[v15])
      {
        unsigned __int8 v54 = v50[v15];
        *(_DWORD *)(*(void *)(a1 + 16)
                  + 8
                  * (int)cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, &v54)) = v9 + ~v19;
        v19 -= 4;
      }
      BOOL v23 = __CFADD__(v19, v13);
      unint64_t v24 = v19 + v13;
      a4 = v49;
      if (!v23)
      {
        do
        {
          int v25 = *(_DWORD *)(a1 + 80);
          uint64_t v26 = *(int **)(a1 + 32);
          int v27 = *v26 + 1;
          *uint64_t v26 = v27;
          if (v25 == v27)
          {
            int v28 = 2 * *(_DWORD *)(a1 + 80);
            *(_DWORD *)(a1 + 80) = v28;
            cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<int>((void **)(a1 + 32), v28, **(_DWORD **)(a1 + 32));
          }
          *(_DWORD *)(*(void *)(a1 + 32) + 4 * **(int **)(a1 + 32)) = v13;
          v13 += 5;
        }
        while (v13 <= v24);
      }
      if (v15 == a3)
      {
        unsigned __int8 v53 = 0;
        int v17 = &v53;
LABEL_34:
        uint64_t v29 = (char *)(*(void *)(a1 + 16)
                     + 8
                     * (int)cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, v17));
LABEL_54:
        *(_DWORD *)uint64_t v29 = *a4;
        return a3 != 0;
      }
      if (v50[v15])
      {
        unint64_t v10 = v15 + 1;
      }
      else
      {
        unsigned __int8 v53 = 0;
        int v31 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, &v53);
        unint64_t v10 = v15 + 1;
        *(_DWORD *)(*(void *)(a1 + 16) + 8 * v31) += *(_DWORD *)&v50[v15 + 1];
      }
      unsigned __int8 v52 = *(unsigned char *)(a2 + v15);
      unint64_t v12 = (int)cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, &v52);
    }
    if (a3 == v10)
    {
      int v32 = *(int **)(a1 + 32);
      uint64_t v33 = *v32;
      if (v33)
      {
        uint64_t v34 = v32[v33];
        *(unsigned char *)(*(void *)(a1 + 24) + v34) = 0;
        *(_DWORD *)(*(void *)(a1 + 16) + 8 * v12) = -(int)v34;
        --**(_DWORD **)(a1 + 32);
        uint64_t v35 = v34 + *(void *)(a1 + 24);
        *(_DWORD *)(v35 + 1) = 0;
        uint64_t v29 = (char *)(v35 + 1);
        goto LABEL_54;
      }
    }
    int v36 = a3 - v10 + 5;
    CFRange v38 = (_DWORD **)(a1 + 24);
    std::vector<std::string> v37 = *(int **)(a1 + 24);
    int v39 = *(_DWORD *)(a1 + 76);
    int v40 = *v37;
    if (v39 < *v37 + v36)
    {
      if (v39 <= v36) {
        int v41 = a3 - v10 + 5;
      }
      else {
        int v41 = *(_DWORD *)(a1 + 76);
      }
      *(_DWORD *)(a1 + 76) = v41 + v39;
      cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<char>((void **)(a1 + 24), v41 + v39, *v37);
      int v40 = **(_DWORD **)(a1 + 24);
    }
    *(_DWORD *)(*(void *)(a1 + 16) + 8 * v12) = -v40;
    uint64_t v42 = *(int **)(a1 + 24);
    uint64_t v43 = *v42;
    int v44 = (char *)v42 + v43;
    uint64_t v30 = (unsigned __int8 *)v42 + v43 - v10;
    unint64_t v45 = a3 - v10;
    if (a3 > v10)
    {
      uint64_t v46 = (char *)(a2 + v10);
      do
      {
        char v47 = *v46++;
        *v44++ = v47;
        --v45;
      }
      while (v45);
      uint64_t v42 = *v38;
      LODWORD(v43) = **v38;
    }
    *uint64_t v42 = v43 + v36;
LABEL_53:
    uint64_t v29 = (char *)&v30[a3 + 1];
    goto LABEL_54;
  }
  return a3 != 0;
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::restore(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = (void **)(a1 + 40);
  if (!v3)
  {
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(v2, *(int *)(a1 + 64) >> 8, 0);
    *(_DWORD *)(a1 + 56) = 0;
    *(_DWORD *)(a1 + 52) = 0;
    *(_DWORD *)(a1 + 48) = 0;
    unint64_t v19 = (int *)(a1 + 48);
    if (*(int *)(a1 + 64) >= 1)
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)(a1 + 40);
      int v23 = 256;
      while (1)
      {
        uint64_t v24 = v22 + 20 * v20;
        *(_WORD *)(v24 + 8) = 0;
        int v25 = (__int16 *)(v24 + 8);
        if ((int)v21 >= (v20 << 8) + 256) {
          break;
        }
        __int16 v26 = 0;
        uint64_t v27 = (int)v21;
        int v28 = (int *)(*(void *)(a1 + 8) + 8 * (int)v21 + 4);
        do
        {
          int v29 = *v28;
          v28 += 2;
          if (v29 < 0)
          {
            BOOL v16 = v26++ == 0;
            *int v25 = v26;
            if (v16)
            {
              *(_DWORD *)(v22 + 20 * v20 + 16) = v21;
              __int16 v26 = 1;
            }
          }
          ++v27;
          LODWORD(v21) = v21 + 1;
        }
        while (v23 != v27);
        if (v26) {
          uint64_t v30 = (int *)(a1 + 56);
        }
        else {
          uint64_t v30 = (int *)(a1 + 48);
        }
        if (v26 == 1) {
          uint64_t v30 = (int *)(a1 + 52);
        }
        int v31 = *v30;
        if (*v30) {
          goto LABEL_42;
        }
        int v32 = (_DWORD *)(v22 + 20 * v20);
        if (!v26)
        {
          int v31 = 0;
          goto LABEL_43;
        }
        uint64_t v33 = v20;
LABEL_46:
        *(_DWORD *)(v22 + 20 * v33 + 4) = v20;
        *int v32 = v20;
        *uint64_t v30 = v20++;
        v23 += 256;
        uint64_t v21 = v27;
        if ((int)v27 >= *(_DWORD *)(a1 + 64)) {
          goto LABEL_2;
        }
      }
      int v31 = *v19;
      if (*v19)
      {
        uint64_t v30 = (int *)(a1 + 48);
        uint64_t v27 = v21;
LABEL_42:
        int v32 = (_DWORD *)(v22 + 20 * v20);
LABEL_43:
        uint64_t v21 = v27;
      }
      else
      {
        int v32 = (_DWORD *)(v22 + 20 * v20);
        uint64_t v30 = (int *)(a1 + 48);
      }
      uint64_t v34 = (int *)(v22 + 20 * v31);
      *int v32 = *v34;
      *(_DWORD *)(v22 + 20 * v20 + 4) = *v30;
      uint64_t v33 = *v34;
      uint64_t v27 = v21;
      int v32 = v34;
      goto LABEL_46;
    }
  }
LABEL_2:
  uint64_t v4 = (uint64_t *)(a1 + 32);
  int v5 = *(_DWORD *)(a1 + 64);
  if (!*(void *)(a1 + 32))
  {
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>((void **)(a1 + 32), v5, 0);
    int v5 = *(_DWORD *)(a1 + 64);
    if (v5 >= 1)
    {
      for (uint64_t i = 0; i < v5; ++i)
      {
        uint64_t v7 = *(void *)(a1 + 8);
        uint64_t v8 = *(unsigned int *)(v7 + 8 * i + 4);
        if ((v8 & 0x80000000) == 0)
        {
          uint64_t v9 = *(int *)(v7 + 8 * v8);
          unsigned int v10 = (v9 ^ i);
          if (v9 != i)
          {
            uint64_t v11 = *v4;
            uint64_t v12 = *v4 + 2 * v8;
            unsigned int v15 = *(unsigned __int8 *)(v12 + 1);
            unint64_t v14 = (unsigned char *)(v12 + 1);
            unsigned int v13 = v15;
            if (v8) {
              BOOL v16 = v13 == 0;
            }
            else {
              BOOL v16 = 0;
            }
            if (!v16 || (unsigned int v13 = 0, *(_DWORD *)(v7 + 8 * v9 + 4) == v8))
            {
              if (v13 < v10)
              {
                do
                {
                  int v17 = v9 ^ v13;
                  unsigned int v13 = *(unsigned __int8 *)(v11 + 2 * (int)(v9 ^ v13));
                  if (*(unsigned char *)(v11 + 2 * v17)) {
                    BOOL v18 = v13 >= v10;
                  }
                  else {
                    BOOL v18 = 1;
                  }
                }
                while (!v18);
                unint64_t v14 = (unsigned char *)(v11 + 2 * v17);
              }
            }
            *(unsigned char *)(v11 + 2 * (int)((v9 ^ i) ^ v9)) = v13;
            *unint64_t v14 = v10;
            int v5 = *(_DWORD *)(a1 + 64);
          }
        }
      }
    }
  }
  *(_DWORD *)(a1 + 60) = v5;
  *(_DWORD *)(a1 + 68) = **(_DWORD **)(a1 + 16);
  *(_DWORD *)(a1 + 72) = 1;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(uint64_t a1, void *a2, unsigned __int8 *a3)
{
  uint64_t v4 = a2;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *a2;
  int v8 = *(_DWORD *)(v6 + 8 * *a2);
  unsigned int v9 = *a3;
  if (v8 < 0 || (v10 = v8 ^ v9, uint64_t v11 = *(int *)(v6 + 8 * v10 + 4), (v11 & 0x80000000) != 0))
  {
    uint64_t result = cedar::da<unsigned int,-1,-2,true,1,0ul>::_pop_enode(a1, *(_DWORD *)(v6 + 8 * *a2), *a3, v7);
    unsigned int v22 = *a3;
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = v23 + 2 * *v4;
    unsigned int v27 = *(unsigned __int8 *)(v24 + 1);
    __int16 v26 = (unsigned char *)(v24 + 1);
    unsigned int v25 = v27;
    if ((v8 & 0x80000000) == 0 && v25 < v22)
    {
      do
      {
        int v28 = result ^ v25 ^ v22;
        unsigned int v25 = *(unsigned __int8 *)(v23 + 2 * v28);
        if (*(unsigned char *)(v23 + 2 * v28)) {
          BOOL v29 = v25 >= v22;
        }
        else {
          BOOL v29 = 1;
        }
      }
      while (!v29);
      __int16 v26 = (unsigned char *)(v23 + 2 * v28);
    }
    *(unsigned char *)(v23 + 2 * (int)result) = v25;
    *__int16 v26 = v22;
  }
  else
  {
    uint64_t result = v8 ^ v9;
    if (v11 != v7)
    {
      int v13 = *(_DWORD *)(v6 + 8 * v11);
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = *(unsigned __int8 *)(v14 + 2 * v7 + 1);
      LOBYTE(v16) = v15;
      LOBYTE(v17) = *(unsigned char *)(v14 + 2 * v11 + 1);
      while (1)
      {
        uint64_t v18 = 2 * (v13 ^ v17);
        int v17 = *(unsigned __int8 *)(v14 + v18);
        if (!*(unsigned char *)(v14 + v18)) {
          break;
        }
        int v16 = *(unsigned __int8 *)(v14 + 2 * (v8 ^ v16));
        if (!v16)
        {
          uint64_t v19 = a1;
          int v20 = *(_DWORD *)(v6 + 8 * *a2);
          int v21 = v9;
          goto LABEL_18;
        }
      }
      uint64_t v19 = a1;
      int v20 = *(_DWORD *)(v6 + 8 * v11);
      int v15 = *(unsigned __int8 *)(v14 + 2 * v11 + 1);
      int v21 = -1;
LABEL_18:
      uint64_t v30 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_set_child(v19, v101, v20, v15, v21);
      int v31 = v30;
      if (v101 == v30)
      {
        signed int place = cedar::da<unsigned int,-1,-2,true,1,0ul>::_find_place(a1);
      }
      else
      {
        v99 = v4;
        int v32 = *(_DWORD *)(a1 + 56);
        if (v32)
        {
          int v33 = *(_DWORD *)(*(void *)(a1 + 40) + 20 * v32);
          int v34 = (__int16)((_WORD)v30 - (unsigned __int16)v101 + 1);
          int v97 = v33;
          int v95 = v34;
          do
          {
            uint64_t v35 = *(void *)(a1 + 40);
            int v36 = v32;
            int v37 = *(__int16 *)(v35 + 20 * v32 + 8);
            if (v37 >= v34 && v34 < *(__int16 *)(v35 + 20 * v32 + 10))
            {
              uint64_t v38 = v35 + 20 * v32;
              signed int v41 = *(_DWORD *)(v38 + 16);
              int v39 = (signed int *)(v38 + 16);
              signed int v40 = v41;
              uint64_t v42 = *(void *)(a1 + 8);
              signed int place = v41;
              do
              {
                int v44 = v101;
                uint64_t v4 = v99;
                while (1)
                {
                  int v45 = *++v44;
                  if ((*(_DWORD *)(v42 + 8 * (place ^ v101[0] ^ v45) + 4) & 0x80000000) == 0) {
                    break;
                  }
                  if (v44 == v31)
                  {
                    *int v39 = place;
                    goto LABEL_36;
                  }
                }
                int v46 = *(_DWORD *)(v42 + 8 * place + 4);
                signed int place = -v46;
              }
              while (v40 + v46);
            }
            *(_WORD *)(v35 + 20 * v36 + 10) = v34;
            uint64_t v47 = a1 + 2 * v37;
            int v49 = *(__int16 *)(v47 + 80);
            size_t v48 = (_WORD *)(v47 + 80);
            if (v34 < v49) {
              *size_t v48 = v34;
            }
            uint64_t v50 = v35 + 20 * v36;
            int v32 = *(_DWORD *)(v50 + 4);
            int v51 = *(_DWORD *)(v50 + 12);
            *(_DWORD *)(v50 + 12) = v51 + 1;
            if (!v51)
            {
              cedar::da<unsigned int,-1,-2,true,1,0ul>::_transfer_block(v35, v36, (_DWORD *)(a1 + 56), (int *)(a1 + 52));
              int v34 = v95;
              int v33 = v97;
            }
          }
          while (v36 != v33);
        }
        signed int place = cedar::da<unsigned int,-1,-2,true,1,0ul>::_add_block(a1) << 8;
        uint64_t v4 = v99;
LABEL_36:
        unint64_t v10 = v8 ^ v9;
      }
      int v94 = place ^ v101[0];
      LODWORD(v52) = *(_DWORD *)v4;
      if (v17) {
        int v53 = v8;
      }
      else {
        int v53 = v13;
      }
      if (!v17) {
        LODWORD(v52) = v11;
      }
      int v100 = v52;
      if (v17 && v101[0] == v9)
      {
        uint64_t v52 = (int)v52;
        *(unsigned char *)(*(void *)(a1 + 32) + 2 * (int)v52 + 1) = v9;
      }
      else
      {
        uint64_t v52 = (int)v52;
      }
      int v54 = v94;
      *(_DWORD *)(*(void *)(a1 + 8) + 8 * v52) = v94;
      if (v101 <= v31)
      {
        if (v9) {
          int v55 = -1;
        }
        else {
          int v55 = 0;
        }
        int v93 = v55;
        int v96 = v53;
        uint64_t v98 = (uint64_t)v53 >> 8;
        v91 = (int *)(a1 + 52);
        unsigned __int8 v56 = v101;
        uint64_t v92 = 2 * v10;
        while (1)
        {
          int v57 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_pop_enode(a1, v54, *v56, v100);
          if (v56 == v31) {
            unsigned __int8 v58 = 0;
          }
          else {
            unsigned __int8 v58 = v56[1];
          }
          int v59 = v53 ^ *v56;
          *(unsigned char *)(*(void *)(a1 + 32) + 2 * v57) = v58;
          if (v17 && v59 == v10) {
            goto LABEL_88;
          }
          uint64_t v60 = *(void *)(a1 + 8);
          int v61 = (int *)(v60 + 8 * v57);
          uint64_t v62 = v59;
          int v63 = (int *)(v60 + 8 * v59);
          int v64 = *v63;
          int *v61 = *v63;
          if (v64 >= 1 && *v56)
          {
            uint64_t v65 = *(void *)(a1 + 32);
            int v66 = *(unsigned __int8 *)(v65 + 2 * v59 + 1);
            *(unsigned char *)(v65 + 2 * v57 + 1) = v66;
            uint64_t v67 = *(void *)(a1 + 8);
            int v68 = *v61;
            do
            {
              *(_DWORD *)(v67 + 8 * (v68 ^ v66) + 4) = v57;
              int v68 = *v61;
              int v66 = *(unsigned __int8 *)(v65 + 2 * (*v61 ^ v66));
            }
            while (v66);
          }
          uint64_t v69 = *v4;
          if (!v17 && v59 == v69)
          {
            *uint64_t v4 = v57;
            uint64_t v69 = v57;
          }
          BOOL v70 = v17 == 0;
          if (v59 != v10) {
            BOOL v70 = 0;
          }
          if (!v70) {
            break;
          }
          uint64_t v71 = *(void *)(a1 + 32);
          uint64_t v72 = v71 + 2 * v69;
          unsigned int v75 = *(unsigned __int8 *)(v72 + 1);
          uint64_t v74 = (unsigned char *)(v72 + 1);
          LOBYTE(v73) = v75;
          if (v75 < v9)
          {
            do
            {
              uint64_t v76 = v8 ^ v73;
              unsigned int v73 = *(unsigned __int8 *)(v71 + 2 * v76);
              if (*(unsigned char *)(v71 + 2 * v76)) {
                BOOL v77 = v73 >= v9;
              }
              else {
                BOOL v77 = 1;
              }
            }
            while (!v77);
            uint64_t v74 = (unsigned char *)(v71 + 2 * v76);
          }
          *(unsigned char *)(v71 + v92) = v73;
          *uint64_t v74 = v9;
          *(unsigned char *)(*(void *)(a1 + 32) + 2 * v62 + 1) = 0;
          *int v63 = v93;
          *(_DWORD *)(v60 + 8 * v62 + 4) = *v4;
LABEL_87:
          int v53 = v96;
LABEL_88:
          if (++v56 > v31) {
            goto LABEL_89;
          }
        }
        unint64_t v10 = (unint64_t)v4;
        uint64_t v78 = *(void *)(a1 + 40);
        int v79 = v98;
        uint64_t v80 = v78 + 20 * (int)v98;
        int v82 = *(unsigned __int16 *)(v80 + 8);
        unint64_t v81 = (__int16 *)(v80 + 8);
        *unint64_t v81 = v82 + 1;
        long long v83 = (int *)(v81 + 4);
        if (!v82)
        {
          *long long v83 = v59;
          *(void *)(*(void *)(a1 + 8) + 8 * v59) = -v59 | ((unint64_t)-v59 << 32);
          if (v59 >= 0x100)
          {
            cedar::da<unsigned int,-1,-2,true,1,0ul>::_transfer_block(*(void *)(a1 + 40), v98, (_DWORD *)(a1 + 48), v91);
            int v79 = v98;
          }
          goto LABEL_84;
        }
        uint64_t v84 = *v83;
        uint64_t v85 = *(void *)(a1 + 8);
        uint64_t v86 = *(unsigned int *)(v85 + 8 * v84 + 4);
        *(void *)(v85 + 8 * v59) = -(int)v84 | (unint64_t)(v86 << 32);
        *(_DWORD *)(*(void *)(a1 + 8) + 8 * -(int)v86) = -v59;
        *(_DWORD *)(*(void *)(a1 + 8) + 8 * v84 + 4) = -v59;
        if (*v81 == 2)
        {
          int v79 = v98;
          if (v59 < 0x100) {
            goto LABEL_83;
          }
        }
        else
        {
          int v79 = v98;
          if (v59 < 0x100 || *(_DWORD *)(v78 + 20 * (int)v98 + 12) != 1) {
            goto LABEL_83;
          }
        }
        cedar::da<unsigned int,-1,-2,true,1,0ul>::_transfer_block(*(void *)(a1 + 40), v79, v91, (int *)(a1 + 56));
        int v79 = v98;
LABEL_83:
        *(_DWORD *)(v78 + 20 * v79 + 12) = 0;
LABEL_84:
        uint64_t v87 = v78 + 20 * v79;
        int v89 = *(__int16 *)(v87 + 10);
        v88 = (_WORD *)(v87 + 10);
        int v90 = *(__int16 *)(a1 + 2 * *v81 + 80);
        if (v89 < v90) {
          _WORD *v88 = v90;
        }
        *(_WORD *)(*(void *)(a1 + 32) + 2 * v62) = 0;
        uint64_t v4 = (void *)v10;
        LODWORD(v10) = v8 ^ v9;
        int v54 = v94;
        goto LABEL_87;
      }
LABEL_89:
      if (v17) {
        return v54 ^ v9;
      }
      else {
        return v10;
      }
    }
  }
  return result;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_pop_enode(uint64_t a1, int a2, int a3, int a4)
{
  if (a2 < 0) {
    int place = cedar::da<unsigned int,-1,-2,true,1,0ul>::_find_place(a1);
  }
  else {
    int place = a3 ^ a2;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = place;
  uint64_t v11 = (int *)(v9 + 8 * place);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = (uint64_t)place >> 8;
  uint64_t v14 = v12 + 20 * (place >> 8);
  __int16 v16 = *(_WORD *)(v14 + 8);
  int v15 = (_WORD *)(v14 + 8);
  *int v15 = v16 - 1;
  if (v16 == 1)
  {
    if (v10 < 0x100) {
      goto LABEL_14;
    }
    uint64_t v23 = (_DWORD *)(a1 + 52);
    uint64_t v24 = (int *)(a1 + 48);
    goto LABEL_13;
  }
  uint64_t v17 = v9 + 8 * v10;
  int v18 = *v11;
  *(_DWORD *)(v9 + 8 * -*v11 + 4) = *(_DWORD *)(v17 + 4);
  uint64_t v19 = *(int *)(v17 + 4);
  *(_DWORD *)(v9 - 8 * v19) = v18;
  uint64_t v20 = v12 + 20 * (int)v13;
  int v22 = *(_DWORD *)(v20 + 16);
  int v21 = (_DWORD *)(v20 + 16);
  if (v10 == v22) {
    *int v21 = -(int)v19;
  }
  if (v10 >= 0x100 && *v15 == 1 && *(_DWORD *)(v12 + 20 * (int)v13 + 12) != 1)
  {
    uint64_t v23 = (_DWORD *)(a1 + 56);
    uint64_t v24 = (int *)(a1 + 52);
    uint64_t v12 = *(void *)(a1 + 40);
LABEL_13:
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_transfer_block(v12, v13, v23, v24);
  }
LABEL_14:
  if (a3) {
    int v25 = -1;
  }
  else {
    int v25 = 0;
  }
  *uint64_t v11 = v25;
  *(_DWORD *)(v9 + 8 * v10 + 4) = a4;
  if (a2 < 0) {
    *(_DWORD *)(*(void *)(a1 + 8) + 8 * a4) = v10 ^ a3;
  }
  return v10;
}

unsigned char *cedar::da<unsigned int,-1,-2,true,1,0ul>::_set_child(uint64_t a1, unsigned char *a2, int a3, int a4, int a5)
{
  if (a4)
  {
    --a2;
  }
  else
  {
    *a2 = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 2 * a3;
    a4 = *(unsigned __int8 *)(v5 + v6);
    if (!*(unsigned char *)(v5 + v6)) {
      goto LABEL_9;
    }
  }
  if (a4 < a5)
  {
    do
    {
      *++a2 = a4;
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = 2 * (a4 ^ a3);
      a4 = *(unsigned __int8 *)(v7 + v8);
      if (*(unsigned char *)(v7 + v8)) {
        BOOL v9 = a4 < a5;
      }
      else {
        BOOL v9 = 0;
      }
    }
    while (v9);
  }
LABEL_9:
  if (a5 != -1) {
    *++a2 = a5;
  }
  if (a4)
  {
    do
    {
      *++a2 = a4;
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = 2 * (a4 ^ a3);
      a4 = *(unsigned __int8 *)(v10 + v11);
    }
    while (*(unsigned char *)(v10 + v11));
  }
  return a2;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_find_place(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 52);
  if (v1) {
    return *(unsigned int *)(*(void *)(a1 + 40) + 20 * v1 + 16);
  }
  int v1 = *(_DWORD *)(a1 + 56);
  if (v1) {
    return *(unsigned int *)(*(void *)(a1 + 40) + 20 * v1 + 16);
  }
  else {
    return cedar::da<unsigned int,-1,-2,true,1,0ul>::_add_block(a1) << 8;
  }
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_transfer_block(uint64_t result, int a2, _DWORD *a3, int *a4)
{
  int v4 = a2;
  uint64_t v5 = result + 20 * a2;
  int v8 = *(_DWORD *)(v5 + 4);
  uint64_t v6 = (int *)(v5 + 4);
  int v7 = v8;
  if (v8 == a2)
  {
    int v9 = 0;
  }
  else
  {
    int v10 = *(_DWORD *)(result + 20 * a2);
    *(_DWORD *)(result + 20 * v10 + 4) = v7;
    int v9 = *v6;
    *(_DWORD *)(result + 20 * *v6) = v10;
    if (*a3 != a2) {
      goto LABEL_5;
    }
  }
  *a3 = v9;
LABEL_5:
  if (*a4)
  {
    uint64_t v11 = (int *)(result + 20 * a2);
LABEL_8:
    uint64_t v12 = (int *)(result + 20 * *a4);
    *uint64_t v11 = *v12;
    *uint64_t v6 = *a4;
    int v4 = *v12;
    uint64_t v11 = v12;
    goto LABEL_9;
  }
  uint64_t v11 = (int *)(result + 20 * a2);
  if (!*((_WORD *)v11 + 4)) {
    goto LABEL_8;
  }
LABEL_9:
  *(_DWORD *)(result + 20 * v4 + 4) = a2;
  *uint64_t v11 = a2;
  *a4 = a2;
  return result;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_add_block(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 64);
  if (v2 == *(_DWORD *)(a1 + 60))
  {
    *(_DWORD *)(a1 + 60) = 2 * v2;
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::node>((void **)(a1 + 8), 2 * v2, 2 * v2);
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>((void **)(a1 + 32), *(_DWORD *)(a1 + 60), *(_DWORD *)(a1 + 64));
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>((void **)(a1 + 40), *(int *)(a1 + 60) >> 8, *(int *)(a1 + 64) >> 8);
    int v2 = *(_DWORD *)(a1 + 64);
  }
  *(_DWORD *)(*(void *)(a1 + 40) + 20 * (v2 >> 8) + 16) = v2;
  *(void *)(*(void *)(a1 + 8) + 8 * v2) = (-255 - v2) | ((unint64_t)~v2 << 32);
  uint64_t v3 = *(int *)(a1 + 64);
  uint64_t v4 = v3 + 1;
  unint64_t v5 = 0xFFFFFFFE00000000 - (v3 << 32);
  unsigned int v6 = -(int)v3;
  do
  {
    *(void *)(*(void *)(a1 + 8) + 8 * v4) = v5 + v6;
    uint64_t v7 = *(int *)(a1 + 64);
    uint64_t v8 = v4++ - 1;
    v5 -= 0x100000000;
    --v6;
  }
  while (v8 < v7 + 253);
  *(void *)(*(void *)(a1 + 8) + 8 * ((int)v7 + 255)) = (-254 - v7) | ((unint64_t)-(int)v7 << 32);
  int v9 = *(_DWORD *)(a1 + 64);
  int v10 = v9 >> 8;
  int v11 = *(_DWORD *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = (uint64_t)v9 >> 8;
  uint64_t v14 = (int *)(v12 + 20 * v10);
  if (v11)
  {
    int v15 = (int *)(v12 + 20 * v11);
    *uint64_t v14 = *v15;
    *(_DWORD *)(v12 + 20 * (int)v13 + 4) = *(_DWORD *)(a1 + 56);
    LODWORD(v13) = *v15;
    uint64_t v14 = v15;
  }
  *(_DWORD *)(v12 + 20 * (int)v13 + 4) = v10;
  *uint64_t v14 = v10;
  *(_DWORD *)(a1 + 56) = v10;
  int v16 = *(_DWORD *)(a1 + 64) + 256;
  *(_DWORD *)(a1 + 64) = v16;
  return ((v16 >> 8) - 1);
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateChildren(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void *))(*a1 + 112))(a1);
  if (result)
  {
    uint64_t v7 = a1[5];
    if (!v7) {
      __assert_rtn("enumerateChildren", "cedarpp.h", 261, "_ninfo");
    }
    uint64_t v8 = *a2;
    unint64_t v9 = HIDWORD(*a2);
    if (v9)
    {
      unsigned int v10 = -(int)v9;
      if ((v10 & 0x80000000) != 0)
      {
LABEL_5:
        if (*(unsigned char *)(a1[3] + -v10)) {
          return std::function<void ()(char,trie::CedarTrieCursor const&,BOOL &)>::operator()(*(void *)(a3 + 24), *(unsigned char *)(a1[3] + -v10));
        }
        return result;
      }
    }
    else
    {
      unsigned int v10 = *(_DWORD *)(a1[2] + 8 * v8);
      if ((v10 & 0x80000000) != 0) {
        goto LABEL_5;
      }
    }
    unint64_t v11 = v10;
    if (v8 && ((uint64_t v12 = a1[2], *(int *)(v12 + 8 * v11) < 1) || *(_DWORD *)(v12 + 8 * v11 + 4) != v8)) {
      uint64_t v13 = (unsigned __int8 *)(v7 + 2 * v8 + 1);
    }
    else {
      uint64_t v13 = (unsigned __int8 *)(v7 + 2 * v11);
    }
    int v14 = *v13;
    if (v14)
    {
      do
      {
        unint64_t v15 = v14 ^ v11;
        uint64_t result = std::function<void ()(char,trie::CedarTrieCursor const&,BOOL &)>::operator()(*(void *)(a3 + 24), v14);
        LOBYTE(v14) = *(unsigned char *)(a1[5] + 2 * v15);
      }
      while ((_BYTE)v14);
    }
  }
  return result;
}

uint64_t std::function<void ()(char,trie::CedarTrieCursor const&,BOOL &)>::operator()(uint64_t a1, char a2)
{
  char v3 = a2;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)a1 + 48))(a1, &v3);
}

void trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateEntries(void *a1, unint64_t *a2, uint64_t a3, unsigned int a4)
{
  if ((*(unsigned int (**)(void *))(*a1 + 112))(a1))
  {
    memset(&__p, 0, sizeof(__p));
    std::string::size_type v35 = 0;
    char v33 = 0;
    uint64_t v8 = a1 + 1;
    unint64_t v9 = *a2;
    unint64_t v36 = *a2;
    int v10 = cedar::da<unsigned int,-1,-2,true,1,0ul>::begin(a1 + 1, &v36, &v35);
    if (v10 != -2)
    {
      unint64_t v11 = HIDWORD(v9);
      uint64_t v31 = a3;
      std::string::size_type v32 = a4;
      while (1)
      {
        unint64_t v12 = v35;
        uint64_t v13 = v36;
        unint64_t v14 = HIDWORD(v36);
        if ((a4 & 0x80000000) != 0 || v35 <= v32)
        {
          std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          char v16 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            std::string::size_type size = __p.__r_.__value_.__l.__size_;
          }
          if (size < v35)
          {
            std::string::resize(&__p, v35, 0);
            char v16 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          }
          if (v16 >= 0) {
            p_p = &__p;
          }
          else {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          p_p->__r_.__value_.__s.__data_[v12] = 0;
          uint64_t v18 = v13;
          unint64_t v19 = v12;
          if (v14)
          {
            uint64_t v18 = v13;
            unsigned int v30 = a4;
            uint64_t v20 = a1[3];
            size_t v21 = strlen((const char *)(v20 - *(int *)(a1[2] + 8 * v13)));
            if (v21 >= v12) {
              size_t v22 = v12;
            }
            else {
              size_t v22 = v21;
            }
            if (v12 >= v21) {
              unint64_t v19 = v12 - v21;
            }
            else {
              unint64_t v19 = 0;
            }
            size_t v23 = v20 - v22;
            a4 = v30;
            memcpy((char *)p_p + v19, (const void *)(v23 + (v13 >> 32)), v22);
          }
          for (; v19; --v19)
          {
            uint64_t v24 = a1[2];
            uint64_t v25 = *(int *)(v24 + 8 * v18 + 4);
            *((unsigned char *)&p_p[-1].__r_.__value_.__r.__words[2] + v19 + 7) = *(unsigned char *)(v24 + 8 * v25) ^ v18;
            uint64_t v18 = v25;
          }
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            __int16 v26 = &__p;
          }
          else {
            __int16 v26 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(*(void *)(v31 + 24), v10, (uint64_t)v26, v12, (uint64_t)&v33);
          unint64_t v11 = HIDWORD(v9);
          uint64_t v8 = a1 + 1;
        }
        if (v14)
        {
          if (!v11)
          {
            uint64_t v13 = v13;
            uint64_t v27 = a1[2];
            v12 -= *(int *)(v27 + 8 * v13) + (uint64_t)(int)v14;
            break;
          }
          goto LABEL_3;
        }
        uint64_t v27 = a1[2];
        uint64_t v29 = *(int *)(v27 + 8 * v13);
        unsigned int v28 = *(unsigned __int8 *)(a1[5] + 2 * v29);
        if (!*(unsigned char *)(a1[5] + 2 * v29)) {
          break;
        }
LABEL_37:
        unint64_t v36 = v29 ^ v28;
        std::string::size_type v35 = v12 + 1;
        int v10 = cedar::da<unsigned int,-1,-2,true,1,0ul>::begin(v8, &v36, &v35);
        if (v10 == -2) {
          goto LABEL_3;
        }
      }
      while (v13 != v9)
      {
        unsigned int v28 = *(unsigned __int8 *)(a1[5] + 2 * v13);
        uint64_t v13 = *(int *)(v27 + 8 * v13 + 4);
        --v12;
        if (v28)
        {
          uint64_t v29 = *(int *)(v27 + 8 * v13);
          goto LABEL_37;
        }
      }
    }
LABEL_3:
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_18E66751C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::begin(void *a1, unint64_t *a2, void *a3)
{
  uint64_t v3 = a1[4];
  if (!v3) {
    __assert_rtn("begin", "cedarpp.h", 690, "_ninfo");
  }
  unint64_t v7 = *a2;
  unint64_t v8 = HIDWORD(*a2);
  if (v8)
  {
    int v9 = -(int)v8;
    if (-(int)v8 < 0) {
      goto LABEL_16;
    }
  }
  else
  {
    int v9 = *(_DWORD *)(a1[1] + 8 * v7);
    if (v9 < 0) {
      goto LABEL_16;
    }
  }
  unsigned int v10 = *(unsigned __int8 *)(v3 + 2 * v7 + 1);
  if (v7)
  {
    if (!*(unsigned char *)(v3 + 2 * v7 + 1))
    {
      uint64_t v11 = a1[1];
LABEL_14:
      uint64_t v13 = (unsigned int *)(v11 + 8 * (v9 ^ v10));
      return *v13;
    }
    goto LABEL_10;
  }
  unsigned int v10 = *(unsigned __int8 *)(v3 + 2 * (v9 ^ v10));
  if (v10)
  {
LABEL_10:
    uint64_t v11 = a1[1];
    do
    {
      unint64_t v12 = v9 ^ v10;
      *a2 = v12;
      int v9 = *(_DWORD *)(v11 + 8 * v12);
      unsigned int v10 = *(unsigned __int8 *)(v3 + 2 * v12 + 1);
      ++*a3;
    }
    while (v10 && (v9 & 0x80000000) == 0);
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_14;
    }
    LODWORD(v7) = *(_DWORD *)a2;
LABEL_16:
    uint64_t v14 = -v9;
    size_t v15 = strlen((const char *)(a1[2] + v14));
    *a2 = v7 | ((unint64_t)(v15 - v9) << 32);
    *a3 += v15;
    uint64_t v13 = (unsigned int *)(a1[2] + v14 + v15 + 1);
    return *v13;
  }
  return 4294967294;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::getPayload(uint64_t a1, unint64_t *a2, _DWORD *a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 112))(a1);
  if (result)
  {
    unint64_t v7 = *a2;
    unint64_t v9 = 0;
    unint64_t v10 = v7;
    int v8 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_find(a1 + 8, (uint64_t)&unk_18E67976E, &v10, &v9, 0);
    *a3 = v8;
    return v8 != -1;
  }
  return result;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_find(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, unint64_t a5)
{
  unint64_t v5 = *a3;
  unint64_t v6 = HIDWORD(*a3);
  if (!v6)
  {
    uint64_t v7 = *(void *)(a1 + 8);
    unsigned int v8 = *(_DWORD *)(v7 + 8 * v5);
    if ((v8 & 0x80000000) == 0)
    {
      while (1)
      {
        unint64_t v9 = *a4;
        if (*a4 == a5) {
          break;
        }
        unint64_t v10 = v8 ^ *(unsigned __int8 *)(a2 + v9);
        if (*(_DWORD *)(v7 + 8 * v10 + 4) != v5) {
          return 4294967294;
        }
        *a4 = v9 + 1;
        *a3 = v10;
        unsigned int v8 = *(_DWORD *)(v7 + 8 * v10);
        LODWORD(v5) = v10;
        if ((v8 & 0x80000000) != 0) {
          goto LABEL_6;
        }
      }
      if (*(_DWORD *)(v7 + 8 * v8 + 4) == v5)
      {
        unint64_t v19 = (unsigned int *)(v7 + 8 * v8);
        return *v19;
      }
      return 0xFFFFFFFFLL;
    }
LABEL_6:
    unint64_t v6 = -v8;
  }
  unint64_t v11 = *a4;
  unint64_t v12 = *(void *)(a1 + 16) + v6;
  if (*a4 >= a5)
  {
    unint64_t v16 = *a4;
  }
  else
  {
    uint64_t v13 = (unsigned __int8 *)(*(void *)(a1 + 16) + v6);
    unint64_t v14 = *a4;
    while (1)
    {
      int v15 = *v13++;
      if (*(unsigned __int8 *)(a2 + v14) != v15) {
        break;
      }
      *a4 = ++v14;
      if (a5 == v14)
      {
        unint64_t v14 = a5;
        break;
      }
    }
    if (v14 == v11)
    {
      unint64_t v16 = v11;
    }
    else
    {
      *((_DWORD *)a3 + 1) = v6 - v11 + v14;
      unint64_t v16 = *a4;
    }
    if (v16 < a5) {
      return 4294967294;
    }
  }
  unint64_t v18 = v12 - v11;
  if (*(unsigned char *)(v18 + v16)) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v19 = (unsigned int *)(a5 + v18 + 1);
  return *v19;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::advance(uint64_t a1, unint64_t *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = *a2;
  unint64_t v6 = 0;
  unint64_t v7 = v4;
  if (cedar::da<unsigned int,-1,-2,true,1,0ul>::_find(a1 + 8, a3, &v7, &v6, a4) == -2) {
    return -1;
  }
  else {
    return v7;
  }
}

BOOL trie::CedarMinimalPrefixTrie<unsigned int,char>::isValid(uint64_t a1, void *a2)
{
  return *a2 != -1;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::root()
{
  return 0;
}

void trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(uint64_t a1, const void *a2, size_t a3, uint64_t a4, uint64_t a5)
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v17[0] = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, void *, const void *, size_t))(*(void *)a1 + 120))(a1, v17, a2, a3);
  if ((*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)a1 + 112))(a1, &v16))
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (a3 >= 0x17)
    {
      uint64_t v11 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((a3 | 7) != 0x17) {
        uint64_t v11 = a3 | 7;
      }
      uint64_t v12 = v11 + 1;
      unint64_t v10 = (void **)operator new(v11 + 1);
      __dst[1] = (void *)a3;
      unint64_t v15 = v12 | 0x8000000000000000;
      __dst[0] = v10;
    }
    else
    {
      HIBYTE(v15) = a3;
      unint64_t v10 = __dst;
      if (!a3)
      {
LABEL_10:
        *((unsigned char *)v10 + a3) = 0;
        uint64_t v13 = operator new(0x28uLL);
        *uint64_t v13 = &unk_1EDD69DC8;
        v13[1] = __dst;
        v13[2] = a2;
        _OWORD v13[3] = a3;
        v13[4] = a4;
        long long v17[3] = v13;
        (*(void (**)(uint64_t, uint64_t *, void *, uint64_t))(*(void *)a1 + 136))(a1, &v16, v17, a5);
        std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100](v17);
        if (SHIBYTE(v15) < 0) {
          operator delete(__dst[0]);
        }
        return;
      }
    }
    memmove(v10, a2, a3);
    goto LABEL_10;
  }
}

void sub_18E667A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK4trie22CedarMinimalPrefixTrieIjcE20enumerateCompletionsENSt3__117basic_string_viewIcNS2_11char_traitsIcEEEERKNS2_8functionIFvjS6_RbEEEiEUlRKjS6_S8_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t *a1, int *a2, uint64_t a3, uint64_t a4)
{
  size_t v8 = *(void *)(a3 + 8);
  uint64_t v9 = a1[3];
  unint64_t v10 = v9 + v8;
  uint64_t v11 = a1[1];
  int v12 = *(char *)(v11 + 23);
  if (v12 < 0) {
    unint64_t v13 = *(void *)(v11 + 8);
  }
  else {
    unint64_t v13 = *(unsigned __int8 *)(v11 + 23);
  }
  unint64_t v14 = *(const void **)a3;
  if (v13 < v10)
  {
    std::string::resize((std::string *)a1[1], v9 + v8, 0);
    uint64_t v11 = a1[1];
    uint64_t v9 = a1[3];
    LOBYTE(v12) = *(unsigned char *)(v11 + 23);
  }
  uint64_t v15 = v11;
  if ((v12 & 0x80) == 0)
  {
    if (!v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v15 = *(void *)v11;
  if (v8)
  {
LABEL_8:
    memmove((void *)(v15 + v9), v14, v8);
    uint64_t v11 = a1[1];
    LOBYTE(v12) = *(unsigned char *)(v11 + 23);
  }
LABEL_9:
  int v16 = *a2;
  if ((v12 & 0x80) != 0) {
    uint64_t v11 = *(void *)v11;
  }
  uint64_t v17 = *(void *)(a1[4] + 24);
  return std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(v17, v16, v11, v10, a4);
}

__n128 std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EDD69DC8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  int v2 = (char *)operator new(0x28uLL);
  *(void *)int v2 = &unk_1EDD69DC8;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

void std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::enumeratePrefixStrings(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  char v13 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1);
  uint64_t v12 = result;
  if (a3)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(*(void *)a1 + 120))(a1, &v12, a2 + v9, 1);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a1 + 112))(a1, &v12);
      if (!result) {
        break;
      }
      int v11 = 0;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(void *)a1 + 128))(a1, &v12, &v11);
      if (result)
      {
        if (a3 >= v9 + 1) {
          uint64_t v10 = v9 + 1;
        }
        else {
          uint64_t v10 = a3;
        }
        uint64_t result = std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(*(void *)(a4 + 24), v11, a2, v10, (uint64_t)&v13);
        ++v9;
        if (v13) {
          return result;
        }
      }
      else
      {
        ++v9;
      }
    }
    while (v9 != a3);
  }
  return result;
}

BOOL trie::CedarMinimalPrefixTrie<unsigned int,char>::lookup(uint64_t a1, uint64_t a2, unint64_t a3, int *a4)
{
  unint64_t v8 = 0;
  unint64_t v9 = 0;
  int v5 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_find(a1 + 8, a2, &v9, &v8, a3);
  if (v5 == -2) {
    int v6 = -1;
  }
  else {
    int v6 = v5;
  }
  *a4 = v6;
  return v6 != -1;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::load(uint64_t a1, int *a2, unint64_t a3)
{
  uint64_t v6 = a1 + 8;
  cedar::da<unsigned int,-1,-2,true,1,0ul>::clear(a1 + 8, 0);
  if (a3 >= 8) {
    unint64_t v7 = (a3 & 0xFFFFFFFFFFFFFFF8) - *a2;
  }
  else {
    unint64_t v7 = 0;
  }
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 16) = (char *)a2 + *a2;
  if ((v7 & 7) != 0) {
    int v8 = (v7 >> 3) + 1;
  }
  else {
    int v8 = v7 >> 3;
  }
  *(_DWORD *)(a1 + 72) = v8;
  *(_DWORD *)(a1 + 84) = 1;
  cedar::da<unsigned int,-1,-2,true,1,0ul>::restore(v6);
  return 1;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::build(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a2) >> 3) != (uint64_t)(a3[1] - *a3) >> 2) {
    __assert_rtn("build", "CedarMinimalPrefixTrie.h", 78, "keys.size() == values.size()");
  }
  if (v4 == v3)
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    LODWORD(v11) = 1;
    do
    {
      uint64_t v12 = (uint64_t **)(v3 + v8);
      if (*((char *)v12 + 23) < 0)
      {
        unint64_t v14 = *v12;
        char v13 = v12[1];
      }
      else
      {
        char v13 = (uint64_t *)*((unsigned __int8 *)v12 + 23);
        unint64_t v14 = (uint64_t *)v12;
      }
      uint64_t v11 = v11 & (*(unsigned int (**)(uint64_t, uint64_t *, uint64_t *, uint64_t))(*(void *)a1 + 152))(a1, v14, v13, *a3 + v9);
      ++v10;
      uint64_t v3 = *a2;
      v9 += 4;
      v8 += 24;
    }
    while (v10 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  cedar::da<unsigned int,-1,-2,true,1,0ul>::restore(a1 + 8);
  return v11;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::build(uint64_t a1, void *a2)
{
  std::string __p = 0;
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  if (a2[1] != *a2)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    LODWORD(v6) = 1;
    do
    {
      if ((unint64_t)v5 >= v4)
      {
        uint64_t v8 = (v5 - v3) >> 2;
        unint64_t v9 = v8 + 1;
        if ((unint64_t)(v8 + 1) >> 62) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if ((uint64_t)(v4 - (void)v3) >> 1 > v9) {
          unint64_t v9 = (uint64_t)(v4 - (void)v3) >> 1;
        }
        if (v4 - (unint64_t)v3 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v10 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v10 = v9;
        }
        if (v10) {
          unint64_t v10 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v10);
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v12 = (_DWORD *)(v10 + 4 * v8);
        *uint64_t v12 = v6;
        unint64_t v7 = v12 + 1;
        while (v5 != v3)
        {
          int v13 = *((_DWORD *)v5 - 1);
          v5 -= 4;
          *--uint64_t v12 = v13;
        }
        unint64_t v4 = v10 + 4 * v11;
        std::string __p = v12;
        unint64_t v19 = v4;
        if (v3) {
          operator delete(v3);
        }
        uint64_t v3 = (char *)v12;
      }
      else
      {
        *(_DWORD *)int v5 = v6;
        unint64_t v7 = v5 + 4;
      }
      unint64_t v18 = v7;
      unint64_t v6 = (v6 + 1);
      int v5 = (char *)v7;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 3) >= v6);
  }
  uint64_t v14 = (*(uint64_t (**)(uint64_t, void *, void **))(*(void *)a1 + 64))(a1, a2, &__p);
  if (__p)
  {
    unint64_t v18 = __p;
    operator delete(__p);
  }
  return v14;
}

void sub_18E66816C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::serialize@<X0>(void *a1@<X8>)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v4);
  std::ostream::write();
  std::ostream::write();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1, (uint64_t)v5);
  v4[0] = *MEMORY[0x1E4FBA408];
  uint64_t v2 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v4 + *(void *)(v4[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v4[2] = v2;
  v5[0] = MEMORY[0x1E4FBA470] + 16;
  if (v6 < 0) {
    operator delete((void *)v5[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x192FAF250](&v7);
}

void sub_18E66831C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  *(void *)(v29 + *(void *)(*MEMORY[0x1E4FBA408] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  if (a26 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x192FAF250](&a29);
  _Unwind_Resume(a1);
}

void *trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1EDD69E20;
  v5[1] = a4;
  v5[3] = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(*(void *)a1 + 96))(a1, a2, a3, v5);
  return std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100](v5);
}

void sub_18E6684D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK4trie4TrieIjcNS_15CedarTrieCursorEE20enumerateCompletionsEPKcmRKNSt3__18functionIFvxNS5_17basic_string_viewIcNS5_11char_traitsIcEEEERbEEEiEUljSA_SB_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4)
{
  return std::function<void ()(long long,std::string_view,BOOL &)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, a3[1], a4);
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDD69E20;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDD69E20;
  result[1] = v3;
  return result;
}

void std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
}

void *trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1EDD69E78;
  v5[1] = a4;
  v5[3] = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(*(void *)a1 + 88))(a1, a2, a3, v5);
  return std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100](v5);
}

void sub_18E668680(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK4trie4TrieIjcNS_15CedarTrieCursorEE22enumeratePrefixStringsEPKcmRKNSt3__18functionIFvxNS5_17basic_string_viewIcNS5_11char_traitsIcEEEERbEEEEUljSA_SB_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4)
{
  return std::function<void ()(long long,std::string_view,BOOL &)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, a3[1], a4);
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDD69E78;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDD69E78;
  result[1] = v3;
  return result;
}

void std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
}

uint64_t trie::Trie<unsigned int,char,trie::CedarTrieCursor>::lookup(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unsigned int v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *))(*(void *)a1 + 80))(a1, a2, a3, &v6);
  *a4 = v6;
  return result;
}

uint64_t trie::Trie<unsigned int,char,trie::CedarTrieCursor>::build(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  memset(&v37, 0, sizeof(v37));
  std::string __p = 0;
  std::string::size_type v35 = 0;
  unint64_t v36 = 0;
  if (a2)
  {
    for (uint64_t i = 0; i != a2; ++i)
    {
      unint64_t v10 = *(void **)(a3 + 8 * i);
      size_t v11 = *(void *)(a4 + 8 * i);
      std::vector<std::string>::pointer end = v37.__end_;
      if (v37.__end_ >= v37.__end_cap_.__value_)
      {
        unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v37.__end_ - (char *)v37.__begin_) >> 3);
        unint64_t v15 = v14 + 1;
        if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3) > v15) {
          unint64_t v15 = 0x5555555555555556 * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v16 = v15;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v37.__end_cap_;
        if (v16) {
          unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v16);
        }
        else {
          uint64_t v17 = 0;
        }
        __v.__first_ = (std::__split_buffer<std::string>::pointer)v16;
        __v.__begin_ = (std::__split_buffer<std::string>::pointer)(v16 + 24 * v14);
        __v.__end_ = __v.__begin_;
        __v.__end_cap_.__value_ = (std::string *)(v16 + 24 * v17);
        std::string::basic_string[abi:ne180100](__v.__begin_->__r_.__value_.__r.__words, v10, v11);
        ++__v.__end_;
        std::vector<std::string>::__swap_out_circular_buffer(&v37, &__v);
        int v13 = v37.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__v);
      }
      else
      {
        std::string::basic_string[abi:ne180100](v37.__end_->__r_.__value_.__r.__words, *(void **)(a3 + 8 * i), *(void *)(a4 + 8 * i));
        int v13 = end + 1;
      }
      v37.__end_ = v13;
      if (a5)
      {
        uint64_t v18 = *(void *)(a5 + 8 * i);
        unint64_t v19 = v35;
        if ((unint64_t)v35 >= v36)
        {
          size_t v21 = __p;
          uint64_t v22 = (v35 - __p) >> 2;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v24 = v36 - (void)__p;
          if ((uint64_t)(v36 - (void)__p) >> 1 > v23) {
            unint64_t v23 = v24 >> 1;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25) {
            unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v25);
          }
          else {
            uint64_t v26 = 0;
          }
          uint64_t v27 = (char *)(v25 + 4 * v22);
          *(_DWORD *)uint64_t v27 = v18;
          uint64_t v20 = v27 + 4;
          while (v19 != __p)
          {
            int v28 = *((_DWORD *)v19 - 1);
            v19 -= 4;
            *((_DWORD *)v27 - 1) = v28;
            v27 -= 4;
          }
          std::string __p = v27;
          unint64_t v36 = v25 + 4 * v26;
          if (v21) {
            operator delete(v21);
          }
        }
        else
        {
          *(_DWORD *)std::string::size_type v35 = v18;
          uint64_t v20 = v35 + 4;
        }
        std::string::size_type v35 = v20;
      }
    }
  }
  uint64_t v29 = *a1;
  if (a5) {
    uint64_t v30 = (*(uint64_t (**)(void))(v29 + 64))();
  }
  else {
    uint64_t v30 = (*(uint64_t (**)(void))(v29 + 56))();
  }
  uint64_t v31 = v30;
  if (__p) {
    operator delete(__p);
  }
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v37;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  return v31;
}

void sub_18E668A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *__p, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, std::__split_buffer<std::string> *a10, uint64_t a11, void *__pa, void *a13, uint64_t a14, char a15)
{
  if (__pa)
  {
    a13 = __pa;
    operator delete(__pa);
  }
  __pa = &a15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

void trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie(void *a1)
{
  trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie(a1);
  JUMPOUT(0x192FAF2C0);
}

void *trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie(void *a1)
{
  *a1 = &unk_1EDD69C58;
  cedar::da<unsigned int,-1,-2,true,1,0ul>::clear((uint64_t)(a1 + 1), 0);
  return a1;
}

void CEM::AdaptationController::sortEmojiTokensIfEnabled(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  v98[1] = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)a1 == 2)
  {
    __p[0] = 0;
    __v.__first_ = 0;
    unsigned int v6 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_find(a1 + 72, a2, (unint64_t *)__p, (unint64_t *)&__v, a3);
    if (v6 <= 0xFFFFFFFD)
    {
      unsigned int v7 = v6;
      uint64_t v8 = *(void *)(a1 + 56);
      {
      }
      if (*(char *)(v8 + 167) < 0)
      {
        uint64_t v9 = *(void *)(v8 + 144);
        uint64_t v10 = *(void *)(v8 + 152);
      }
      else
      {
        uint64_t v9 = v8 + 144;
        uint64_t v10 = *(unsigned __int8 *)(v8 + 167);
      }
      if (byte_1E91D6E4F >= 0) {
        size_t v11 = byte_1E91D6E4F;
      }
      else {
        size_t v11 = unk_1E91D6E40;
      }
      if (byte_1E91D6E4F >= 0) {
        uint64_t v12 = &CEM::AdaptationDatabaseController::getRecentEmojisForStringId(unsigned int,unsigned long)const::sql;
      }
      else {
        uint64_t v12 = (uint64_t *)CEM::AdaptationDatabaseController::getRecentEmojisForStringId(unsigned int,unsigned long)const::sql;
      }
      LODWORD(__v.__first_) = v7;
      LODWORD(__v.__end_cap_.__value_) = 1;
      LODWORD(__v.__end_cap_.__value_) = 3;
      int v97 = 1;
      v89[0] = 0;
      long long v88 = 0uLL;
      int v94 = (void **)&v88;
      char v95 = 0;
      *(void *)&long long v88 = operator new(0x40uLL);
      *((void *)&v88 + 1) = v88;
      v89[0] = v88 + 64;
      *((void *)&v88 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&__v, (uint64_t)v98, v88);
      CEM::Statement::Statement((uint64_t)__p, v9, v10, v12, v11, (uint64_t *)&v88);
      int v94 = (void **)&v88;
      std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v94);
      for (uint64_t i = 32; i != -32; i -= 32)
        std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__v + i);
      CEM::AdaptationDatabase::executeStatement((CEM::AdaptationDatabase *)&v88, *(CEM::Statement **)(v8 + 128), (uint64_t)__p);
      uint64_t v15 = *((void *)&v88 + 1);
      uint64_t v14 = v88;
      memset(&v87, 0, sizeof(v87));
      if (*((void *)&v88 + 1) != (void)v88)
      {
        do
        {
          std::string::basic_string[abi:ne180100]<0>(&__v, "emoji");
          unint64_t v16 = std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::find<std::string>(v14, &__v);
          if (SHIBYTE(__v.__end_) < 0) {
            operator delete(__v.__first_);
          }
          uint64_t v17 = v14 + 8;
          if ((void *)(v14 + 8) != v16 && *((_DWORD *)v16 + 20) == 3)
          {
            uint64_t v18 = (long long *)(v16 + 7);
            std::vector<std::string>::pointer end = v87.__end_;
            if (v87.__end_ >= v87.__end_cap_.__value_)
            {
              unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v87.__end_ - (char *)v87.__begin_) >> 3);
              unint64_t v22 = v21 + 1;
              if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * (((char *)v87.__end_cap_.__value_ - (char *)v87.__begin_) >> 3) > v22) {
                unint64_t v22 = 0x5555555555555556 * (((char *)v87.__end_cap_.__value_ - (char *)v87.__begin_) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v87.__end_cap_.__value_ - (char *)v87.__begin_) >> 3) >= 0x555555555555555) {
                unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v23 = v22;
              }
              __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v87.__end_cap_;
              if (v23)
              {
                unint64_t v25 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v23);
              }
              else
              {
                unint64_t v25 = 0;
                uint64_t v24 = 0;
              }
              std::__split_buffer<std::string>::pointer v27 = v25 + v21;
              __v.__first_ = v25;
              __v.__begin_ = v27;
              __v.__end_ = v27;
              __v.__end_cap_.__value_ = &v25[v24];
              if (*((char *)v16 + 79) < 0)
              {
                std::string::__init_copy_ctor_external(v27, (const std::string::value_type *)v16[7], v16[8]);
                std::__split_buffer<std::string>::pointer v27 = __v.__end_;
              }
              else
              {
                long long v28 = *v18;
                v27->__r_.__value_.__r.__words[2] = v16[9];
                *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v28;
              }
              __v.__end_ = v27 + 1;
              std::vector<std::string>::__swap_out_circular_buffer(&v87, &__v);
              uint64_t v26 = v87.__end_;
              std::__split_buffer<std::string>::~__split_buffer(&__v);
            }
            else
            {
              if (*((char *)v16 + 79) < 0)
              {
                std::string::__init_copy_ctor_external(v87.__end_, (const std::string::value_type *)v16[7], v16[8]);
              }
              else
              {
                long long v20 = *v18;
                v87.__end_->__r_.__value_.__r.__words[2] = v16[9];
                *(_OWORD *)&end->__r_.__value_.__l.__data_ = v20;
              }
              uint64_t v26 = end + 1;
            }
            v87.__end_ = v26;
          }
          uint64_t v14 = v17 + 16;
        }
        while (v17 + 16 != v15);
      }
      __v.__first_ = (std::__split_buffer<std::string>::pointer)&v88;
      std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
      CEM::Statement::~Statement(__p);
      std::vector<std::string>::pointer begin = v87.__begin_;
      unint64_t v30 = (unint64_t)v87.__end_;
      if (v87.__begin_ != v87.__end_)
      {
        memset(&__v, 0, 32);
        LODWORD(__v.__end_cap_.__value_) = 1065353216;
        uint64_t v31 = *a4;
        uint64_t v32 = a4[1];
        if (v32 != *a4)
        {
          unint64_t v33 = 0;
          while (1)
          {
            CEM::getUTF8StringFromCFString(__p, *(CFStringRef *)(*(void *)(v31 + 16 * v33) + 8));
            unint64_t v34 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)__p);
            unint64_t v35 = v34;
            unint64_t v36 = (unint64_t)__v.__begin_;
            if (__v.__begin_)
            {
              uint8x8_t v37 = (uint8x8_t)vcnt_s8((int8x8_t)__v.__begin_);
              v37.i16[0] = vaddlv_u8(v37);
              unint64_t v38 = v37.u32[0];
              if (v37.u32[0] > 1uLL)
              {
                unint64_t v30 = v34;
                if ((std::__split_buffer<std::string>::pointer)v34 >= __v.__begin_) {
                  unint64_t v30 = v34 % (unint64_t)__v.__begin_;
                }
              }
              else
              {
                unint64_t v30 = ((unint64_t)&__v.__begin_[-1].__r_.__value_.__r.__words[2] + 7) & v34;
              }
              int v39 = (unsigned __int8 **)*((void *)&__v.__first_->__r_.__value_.__l.__data_ + v30);
              if (v39)
              {
                for (uint64_t j = *v39; j; uint64_t j = *(unsigned __int8 **)j)
                {
                  unint64_t v41 = *((void *)j + 1);
                  if (v41 == v35)
                  {
                    if (std::equal_to<std::string>::operator()[abi:ne180100](j + 16, (unsigned __int8 *)__p)) {
                      goto LABEL_115;
                    }
                  }
                  else
                  {
                    if (v38 > 1)
                    {
                      if (v41 >= v36) {
                        v41 %= v36;
                      }
                    }
                    else
                    {
                      v41 &= v36 - 1;
                    }
                    if (v41 != v30) {
                      break;
                    }
                  }
                }
              }
            }
            uint64_t v42 = (std::string *)operator new(0x30uLL);
            v42->__r_.__value_.__r.__words[0] = 0;
            v42->__r_.__value_.__l.__size_ = v35;
            *(_OWORD *)&v42->__r_.__value_.__r.__words[2] = *(_OWORD *)__p;
            uint64_t v43 = v91;
            __p[0] = 0;
            __p[1] = 0;
            v91 = 0;
            v42[1].__r_.__value_.__l.__size_ = (std::string::size_type)v43;
            v42[1].__r_.__value_.__r.__words[2] = v33;
            float v44 = (float)((unint64_t)__v.__end_cap_.__value_->__r_.__value_.__r.__words + 1);
            if (!v36 || (float)(*(float *)&__v.__end_cap_.__value_ * (float)v36) < v44) {
              break;
            }
LABEL_105:
            std::__split_buffer<std::string>::pointer first = __v.__first_;
            int v61 = (std::string::size_type *)*((void *)&__v.__first_->__r_.__value_.__l.__data_ + v30);
            if (v61)
            {
              v42->__r_.__value_.__r.__words[0] = *v61;
            }
            else
            {
              v42->__r_.__value_.__r.__words[0] = (std::string::size_type)__v.__end_;
              __v.__end_ = v42;
              first->__r_.__value_.__r.__words[v30] = (std::string::size_type)&__v.__end_;
              if (!v42->__r_.__value_.__r.__words[0]) {
                goto LABEL_114;
              }
              unint64_t v62 = *(void *)(v42->__r_.__value_.__r.__words[0] + 8);
              if ((v36 & (v36 - 1)) != 0)
              {
                if (v62 >= v36) {
                  v62 %= v36;
                }
              }
              else
              {
                v62 &= v36 - 1;
              }
              int v61 = &__v.__first_->__r_.__value_.__r.__words[v62];
            }
            std::string::size_type *v61 = (std::string::size_type)v42;
LABEL_114:
            ++__v.__end_cap_.__value_;
LABEL_115:
            if (SHIBYTE(v91) < 0) {
              operator delete(__p[0]);
            }
            ++v33;
            uint64_t v31 = *a4;
            uint64_t v32 = a4[1];
            if (v33 >= (v32 - *a4) >> 4)
            {
              std::vector<std::string>::pointer begin = v87.__begin_;
              unint64_t v30 = (unint64_t)v87.__end_;
              goto LABEL_129;
            }
          }
          BOOL v45 = (v36 & (v36 - 1)) != 0;
          if (v36 < 3) {
            BOOL v45 = 1;
          }
          unint64_t v46 = v45 | (2 * v36);
          unint64_t v47 = vcvtps_u32_f32(v44 / *(float *)&__v.__end_cap_.__value_);
          if (v46 <= v47) {
            int8x8_t prime = (int8x8_t)v47;
          }
          else {
            int8x8_t prime = (int8x8_t)v46;
          }
          if (*(void *)&prime == 1)
          {
            int8x8_t prime = (int8x8_t)2;
          }
          else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
          {
            int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
            unint64_t v36 = (unint64_t)__v.__begin_;
          }
          if (*(void *)&prime > v36) {
            goto LABEL_71;
          }
          if (*(void *)&prime < v36)
          {
            unint64_t v55 = vcvtps_u32_f32((float)(unint64_t)__v.__end_cap_.__value_ / *(float *)&__v.__end_cap_.__value_);
            if (v36 < 3 || (uint8x8_t v56 = (uint8x8_t)vcnt_s8((int8x8_t)v36), v56.i16[0] = vaddlv_u8(v56), v56.u32[0] > 1uLL))
            {
              unint64_t v55 = std::__next_prime(v55);
            }
            else
            {
              uint64_t v57 = 1 << -(char)__clz(v55 - 1);
              if (v55 >= 2) {
                unint64_t v55 = v57;
              }
            }
            if (*(void *)&prime <= v55) {
              int8x8_t prime = (int8x8_t)v55;
            }
            if (*(void *)&prime >= v36)
            {
              unint64_t v36 = (unint64_t)__v.__begin_;
            }
            else
            {
              if (prime)
              {
LABEL_71:
                if (*(void *)&prime >> 61) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                int v49 = (std::string *)operator new(8 * *(void *)&prime);
                std::__split_buffer<std::string>::pointer v50 = __v.__first_;
                __v.__first_ = v49;
                if (v50) {
                  operator delete(v50);
                }
                uint64_t v51 = 0;
                __v.__begin_ = (std::__split_buffer<std::string>::pointer)prime;
                do
                  __v.__first_->__r_.__value_.__r.__words[v51++] = 0;
                while (*(void *)&prime != v51);
                std::__split_buffer<std::string>::pointer v52 = __v.__end_;
                if (__v.__end_)
                {
                  std::string::size_type size = __v.__end_->__r_.__value_.__l.__size_;
                  uint8x8_t v54 = (uint8x8_t)vcnt_s8(prime);
                  v54.i16[0] = vaddlv_u8(v54);
                  if (v54.u32[0] > 1uLL)
                  {
                    if (size >= *(void *)&prime) {
                      size %= *(void *)&prime;
                    }
                  }
                  else
                  {
                    size &= *(void *)&prime - 1;
                  }
                  __v.__first_->__r_.__value_.__r.__words[size] = (std::string::size_type)&__v.__end_;
                  unsigned __int8 v58 = (std::string *)v52->__r_.__value_.__r.__words[0];
                  if (v52->__r_.__value_.__r.__words[0])
                  {
                    do
                    {
                      std::string::size_type v59 = v58->__r_.__value_.__l.__size_;
                      if (v54.u32[0] > 1uLL)
                      {
                        if (v59 >= *(void *)&prime) {
                          v59 %= *(void *)&prime;
                        }
                      }
                      else
                      {
                        v59 &= *(void *)&prime - 1;
                      }
                      if (v59 != size)
                      {
                        if (!__v.__first_->__r_.__value_.__r.__words[v59])
                        {
                          __v.__first_->__r_.__value_.__r.__words[v59] = (std::string::size_type)v52;
                          goto LABEL_96;
                        }
                        v52->__r_.__value_.__r.__words[0] = v58->__r_.__value_.__r.__words[0];
                        v58->__r_.__value_.__r.__words[0] = **((void **)&__v.__first_->__r_.__value_.__l.__data_ + v59);
                        **((void **)&__v.__first_->__r_.__value_.__l.__data_ + v59) = v58;
                        unsigned __int8 v58 = v52;
                      }
                      std::string::size_type v59 = size;
LABEL_96:
                      std::__split_buffer<std::string>::pointer v52 = v58;
                      unsigned __int8 v58 = (std::string *)v58->__r_.__value_.__r.__words[0];
                      std::string::size_type size = v59;
                    }
                    while (v58);
                  }
                }
                unint64_t v36 = (unint64_t)prime;
                goto LABEL_100;
              }
              std::__split_buffer<std::string>::pointer v63 = __v.__first_;
              __v.__first_ = 0;
              if (v63) {
                operator delete(v63);
              }
              unint64_t v36 = 0;
              __v.__begin_ = 0;
            }
          }
LABEL_100:
          if ((v36 & (v36 - 1)) != 0)
          {
            if (v35 >= v36) {
              unint64_t v30 = v35 % v36;
            }
            else {
              unint64_t v30 = v35;
            }
          }
          else
          {
            unint64_t v30 = (v36 - 1) & v35;
          }
          goto LABEL_105;
        }
        uint64_t v31 = a4[1];
LABEL_129:
        long long v88 = 0uLL;
        v89[0] = 0;
        if (begin == (std::vector<std::string>::pointer)v30)
        {
          int v64 = 0;
        }
        else
        {
          int v64 = 0;
          do
          {
            unint64_t v65 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)begin);
            std::__split_buffer<std::string>::pointer v66 = __v.__begin_;
            if (__v.__begin_)
            {
              unint64_t v67 = v65;
              uint8x8_t v68 = (uint8x8_t)vcnt_s8((int8x8_t)__v.__begin_);
              v68.i16[0] = vaddlv_u8(v68);
              unint64_t v69 = v68.u32[0];
              if (v68.u32[0] > 1uLL)
              {
                unint64_t v70 = v65;
                if ((std::__split_buffer<std::string>::pointer)v65 >= __v.__begin_) {
                  unint64_t v70 = v65 % (unint64_t)__v.__begin_;
                }
              }
              else
              {
                unint64_t v70 = ((unint64_t)&__v.__begin_[-1].__r_.__value_.__r.__words[2] + 7) & v65;
              }
              uint64_t v71 = (unsigned __int8 **)*((void *)&__v.__first_->__r_.__value_.__l.__data_ + v70);
              if (v71)
              {
                for (k = *v71; k; k = *(unsigned __int8 **)k)
                {
                  unint64_t v73 = *((void *)k + 1);
                  if (v73 == v67)
                  {
                    if (std::equal_to<std::string>::operator()[abi:ne180100](k + 16, (unsigned __int8 *)begin))
                    {
                      uint64_t v74 = *a4 + 16 * *((void *)k + 5);
                      if ((unint64_t)v64 >= v89[0])
                      {
                        uint64_t v75 = (uint64_t)((uint64_t)v64 - v88) >> 4;
                        if ((unint64_t)(v75 + 1) >> 60) {
                          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                        }
                        unint64_t v76 = (uint64_t)(v89[0] - v88) >> 3;
                        if (v76 <= v75 + 1) {
                          unint64_t v76 = v75 + 1;
                        }
                        if (v89[0] - (void)v88 >= 0x7FFFFFFFFFFFFFF0uLL) {
                          unint64_t v77 = 0xFFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v77 = v76;
                        }
                        int v93 = v89;
                        uint64_t v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v77);
                        int v79 = &v78[16 * v75];
                        __p[0] = v78;
                        __p[1] = v79;
                        uint64_t v92 = &v78[16 * v80];
                        *(_OWORD *)int v79 = *(_OWORD *)v74;
                        *(void *)uint64_t v74 = 0;
                        *(void *)(v74 + 8) = 0;
                        v91 = v79 + 16;
                        std::vector<std::shared_ptr<CEM::EmojiToken>>::__swap_out_circular_buffer(&v88, __p);
                        int v64 = (_OWORD *)*((void *)&v88 + 1);
                        std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)__p);
                      }
                      else
                      {
                        *v64++ = *(_OWORD *)v74;
                        *(void *)uint64_t v74 = 0;
                        *(void *)(v74 + 8) = 0;
                      }
                      *((void *)&v88 + 1) = v64;
                      break;
                    }
                  }
                  else
                  {
                    if (v69 > 1)
                    {
                      if (v73 >= (unint64_t)v66) {
                        v73 %= (unint64_t)v66;
                      }
                    }
                    else
                    {
                      v73 &= (unint64_t)&v66[-1].__r_.__value_.__r.__words[2] + 7;
                    }
                    if (v73 != v70) {
                      break;
                    }
                  }
                }
              }
            }
            ++begin;
          }
          while (begin != (std::vector<std::string>::pointer)v30);
          uint64_t v31 = *a4;
          uint64_t v32 = a4[1];
        }
        for (; v31 != v32; v31 += 16)
        {
          if (*(void *)v31)
          {
            if ((unint64_t)v64 >= v89[0])
            {
              uint64_t v81 = (uint64_t)((uint64_t)v64 - v88) >> 4;
              if ((unint64_t)(v81 + 1) >> 60) {
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v82 = (uint64_t)(v89[0] - v88) >> 3;
              if (v82 <= v81 + 1) {
                unint64_t v82 = v81 + 1;
              }
              if (v89[0] - (void)v88 >= 0x7FFFFFFFFFFFFFF0uLL) {
                unint64_t v83 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v83 = v82;
              }
              int v93 = v89;
              uint64_t v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v83);
              uint64_t v85 = &v84[16 * v81];
              __p[0] = v84;
              __p[1] = v85;
              uint64_t v92 = &v84[16 * v86];
              *(_OWORD *)uint64_t v85 = *(_OWORD *)v31;
              *(void *)uint64_t v31 = 0;
              *(void *)(v31 + 8) = 0;
              v91 = v85 + 16;
              std::vector<std::shared_ptr<CEM::EmojiToken>>::__swap_out_circular_buffer(&v88, __p);
              int v64 = (_OWORD *)*((void *)&v88 + 1);
              std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)__p);
            }
            else
            {
              *v64++ = *(_OWORD *)v31;
              *(void *)uint64_t v31 = 0;
              *(void *)(v31 + 8) = 0;
            }
            *((void *)&v88 + 1) = v64;
          }
        }
        std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate(a4);
        *(_OWORD *)a4 = v88;
        a4[2] = v89[0];
        v89[0] = 0;
        long long v88 = 0uLL;
        __p[0] = &v88;
        std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
        std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::~__hash_table((uint64_t)&__v);
      }
      __p[0] = &v87;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    }
  }
}

void sub_18E6695C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
}

void std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<std::shared_ptr<CEM::EmojiToken>>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a1);
}

void *std::vector<std::shared_ptr<CEM::EmojiToken>>::__swap_out_circular_buffer(void *result, void *a2)
{
  uint64_t v3 = (void *)*result;
  uint64_t v2 = (void *)result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    long long v5 = *((_OWORD *)v2 - 1);
    v2 -= 2;
    *(_OWORD *)(v4 - 16) = v5;
    v4 -= 16;
    void *v2 = 0;
    v2[1] = 0;
  }
  a2[1] = v4;
  unsigned int v6 = (void *)*result;
  *uint64_t result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    *(void *)(a1 + 16) = v2 - 16;
    uint64_t v4 = *(std::__shared_weak_count **)(v2 - 8);
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 16;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned long>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
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

BOOL CEM::AdaptationController::initialize(CEM::AdaptationController *this)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  std::__fs::filesystem::path::__string_view v2 = std::__fs::filesystem::path::__parent_path((const std::__fs::filesystem::path *)((char *)this + 32));
  if (v2.__size_ > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v2.__size_ >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v4 = (v2.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v2.__size_ | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v4 = v2.__size_ | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v5 = v4 + 1;
    p_dst = (std::__fs::filesystem::path *)operator new(v4 + 1);
    __dst.__pn_.__r_.__value_.__l.__size_ = v2.__size_;
    __dst.__pn_.__r_.__value_.__r.__words[2] = v5 | 0x8000000000000000;
    __dst.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__pn_.__r_.__value_.__s + 23) = v2.__size_;
    p_dst = &__dst;
    if (!v2.__size_) {
      goto LABEL_9;
    }
  }
  memmove(p_dst, v2.__data_, v2.__size_);
LABEL_9:
  p_dst->__pn_.__r_.__value_.__s.__data_[v2.__size_] = 0;
  std::__fs::filesystem::path v8 = __dst;
  std::__fs::filesystem::__status(&v8, 0);
  BOOL v6 = __dst.__pn_.__r_.__value_.__s.__data_[0] != 255 && __dst.__pn_.__r_.__value_.__s.__data_[0]
    || std::__fs::filesystem::__create_directories(&v8, 0);
  if (SHIBYTE(v8.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v8.__pn_.__r_.__value_.__l.__data_);
    if (v6) {
LABEL_15:
    }
      operator new();
  }
  else if (v6)
  {
    goto LABEL_15;
  }
  *(_DWORD *)this = 0;
  return v6;
}

void sub_18E66A51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint8_t buf,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,std::__shared_weak_count *a40)
{
}

void *std::__function::__value_func<void ()(std::string_view,unsigned int)>::~__value_func[abi:ne180100](void *a1)
{
  std::__fs::filesystem::path::__string_view v2 = (void *)a1[3];
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

void *std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::target_type()
{
}

uint64_t std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN3CEM20AdaptationController10initializeEvE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

BOOL std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::operator()(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  int v6 = *a3;
  return trie::CedarMinimalPrefixTrie<unsigned int,char>::addEntry(*(void *)(a1 + 8) + 64, v3, v4, &v6);
}

uint64_t std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDD69D70;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDD69D70;
  result[1] = v3;
  return result;
}

void std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::~__func()
{
}

__n128 __Block_byref_object_copy__91(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__92(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

__n128 __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
  int v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t CEM::ReadOnlyFile<unsigned short>::~ReadOnlyFile(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (*(void *)a1)
  {
    if (*(unsigned char *)(a1 + 68))
    {
      munmap(*(void **)a1, *(void *)(a1 + 8));
    }
    else
    {
      if (*(_DWORD *)(a1 + 64) != 2) {
        goto LABEL_10;
      }
      uint64_t v3 = (const char *)(a1 + 16);
      if (*(char *)(a1 + 39) < 0) {
        uint64_t v3 = *(const char **)v3;
      }
      int v4 = open(v3, 2);
      int v5 = v4;
      uint64_t v2 = *(void **)a1;
      if ((v4 & 0x80000000) == 0)
      {
        write(v4, *(const void **)a1, *(void *)(a1 + 8));
        close(v5);
        uint64_t v2 = *(void **)a1;
      }
      if (v2) {
LABEL_10:
      }
        MEMORY[0x192FAF290](v2, 0x1000C80BDFB0063);
    }
  }
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned short> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned short>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned short>,CEM::ReadOnlyFile<unsigned short>>,std::allocator<CEM::ReadOnlyFile<unsigned short>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x800000018E67551ELL)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned short> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned short>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned short>,CEM::ReadOnlyFile<unsigned short>>,std::allocator<CEM::ReadOnlyFile<unsigned short>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    CEM::ReadOnlyFile<unsigned short>::~ReadOnlyFile(result);
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

void std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned short> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned short>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned short>,CEM::ReadOnlyFile<unsigned short>>,std::allocator<CEM::ReadOnlyFile<unsigned short>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FAF2C0);
}

CFStringRef CEM::EmojiData::createString(CEM::EmojiData *this, unsigned int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*((void *)this + 2);
  if (v2)
  {
    uint64_t v4 = *((unsigned __int16 *)this + 22);
    if (a2 > v4 && *((unsigned __int16 *)this + 21) >= (unsigned __int16)(a2 - v4))
    {
      CFStringRef result = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const char *)(*v2 + *(unsigned int *)(*v2 + 16 * (~v4 + a2) + 18)), 0x8000100u);
      if (result) {
        return result;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = a2;
        _os_log_error_impl(&dword_18E64B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to create CFString for emoji at index %d", (uint8_t *)v6, 8u);
      }
    }
  }
  return 0;
}

void ___ZL34_isLegacyUnqualifiedEmojiCodepointj_block_invoke()
{
  CFMutableStringRef Mutable = CFCharacterSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  for (uint64_t i = 0; i != 816; i += 4)
  {
    v2.location = *(unsigned int *)&_isLegacyUnqualifiedEmojiCodepoint::unqualifiedCodepoints[i];
    v2.length = 1;
    CFCharacterSetAddCharactersInRange(Mutable, v2);
  }
  _isLegacyUnqualifiedEmojiCodepoint::__unqualifiedCodepointsCharacterSet = (uint64_t)Mutable;
}

uint64_t nlp::CFFinalize(uint64_t (***this)(void), const void *a2)
{
  return (*this[2])();
}

uint64_t _CFInit_EmojiLocaleDataWrapper(uint64_t result)
{
  *(void *)(result + 16) = &unk_1EDD6A0C0;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t nlp::CFType::CopyDebugDesc(nlp::CFType *this)
{
  return 0;
}

uint64_t nlp::CFType::CopyFormattingDesc(nlp::CFType *this, const __CFDictionary *a2)
{
  return 0;
}

uint64_t nlp::CFType::Hash(nlp::CFType *this)
{
  return 0;
}

uint64_t nlp::CFType::Equal(nlp::CFType *this, const nlp::CFType *a2)
{
  return 0;
}

void EmojiLocaleDataWrapper::~EmojiLocaleDataWrapper(EmojiLocaleDataWrapper *this)
{
  *(void *)this = &unk_1EDD6A0C0;
  std::unique_ptr<CEM::EmojiLocaleData>::reset[abi:ne180100]((uint64_t *)this + 1, 0);
  JUMPOUT(0x192FAF2C0);
}

{
  *(void *)this = &unk_1EDD6A0C0;
  std::unique_ptr<CEM::EmojiLocaleData>::reset[abi:ne180100]((uint64_t *)this + 1, 0);
}

uint64_t *std::unique_ptr<CEM::EmojiLocaleData>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *CFStringRef result = a2;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 792));
    CEM::AdaptationController::~AdaptationController((CEM::AdaptationController *)(v2 + 112));
    std::unique_ptr<CEM::TextToSpeechStrings>::reset[abi:ne180100]((uint64_t *)(v2 + 88), 0);
    std::unique_ptr<CEM::VoiceoverStrings>::reset[abi:ne180100]((uint64_t **)(v2 + 80), 0);
    std::unique_ptr<CEM::LocalizedStringTable>::reset[abi:ne180100]((uint64_t *)(v2 + 72), 0);
    if (*(char *)(v2 + 71) < 0) {
      operator delete(*(void **)(v2 + 48));
    }
    nlp::CFScopedPtr<__CFStringTokenizer *>::reset((const void **)(v2 + 40), 0);
    nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)(v2 + 32), 0);
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)(v2 + 24), 0);
    std::unique_ptr<CEM::EmojiSearchTrie>::reset[abi:ne180100]((uint64_t *)(v2 + 16), 0);
    std::unique_ptr<CEM::EmojiSearchTrie>::reset[abi:ne180100]((uint64_t *)(v2 + 8), 0);
    std::unique_ptr<CEM::EmojiSearchTrie>::reset[abi:ne180100]((uint64_t *)v2, 0);
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

void CEM::AdaptationController::~AdaptationController(CEM::AdaptationController *this)
{
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

uint64_t *std::unique_ptr<CEM::TextToSpeechStrings>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *CFStringRef result = a2;
  if (v2)
  {

    nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)v2, 0);
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

uint64_t **std::unique_ptr<CEM::VoiceoverStrings>::reset[abi:ne180100](uint64_t **result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *CFStringRef result = a2;
  if (v2)
  {
    std::unique_ptr<CEM::LocalizedStringTable>::reset[abi:ne180100](v2, 0);
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

uint64_t *std::unique_ptr<CEM::LocalizedStringTable>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *CFStringRef result = a2;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 40));
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)(v2 + 32), 0);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v2 + 24), 0);
    nlp::CFScopedPtr<__CFBundle *>::reset((const void **)(v2 + 16));
    nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)(v2 + 8), 0);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)v2, 0);
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

void nlp::CFScopedPtr<__CFStringTokenizer *>::reset(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

uint64_t *std::unique_ptr<CEM::EmojiSearchTrie>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *CFStringRef result = a2;
  if (v2)
  {
    if (*(char *)(v2 + 119) < 0) {
      operator delete(*(void **)(v2 + 96));
    }
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 88);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    trie::MarisaTrie<unsigned int,char>::~MarisaTrie((void *)(v2 + 16));
    JUMPOUT(0x192FAF2C0);
  }
  return result;
}

const char **std::__find_impl[abi:ne180100]<char const* const*,char const* const*,std::string,std::__identity>(const char **a1, const char **a2, const void **a3)
{
  uint64_t v3 = a1;
  if (a1 != a2)
  {
    char v5 = *((unsigned char *)a3 + 23);
    if (v5 >= 0) {
      size_t v6 = *((unsigned __int8 *)a3 + 23);
    }
    else {
      size_t v6 = (size_t)a3[1];
    }
    if (v5 >= 0) {
      uint64_t v7 = a3;
    }
    else {
      uint64_t v7 = *a3;
    }
    while (v6 != strlen(*v3) || memcmp(v7, *v3, v6))
    {
      if (++v3 == a2) {
        return a2;
      }
    }
  }
  return v3;
}

void *createEmojiSearchTrie(void *a1, CFLocaleRef locale, int a3)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E4F1D218]);
  CFStringRef v7 = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
  CFStringRef v8 = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E4F1D220]);
  uint64_t v10 = (CEM *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E4F1D210]);
  if (Value && CFEqual(Value, @"en"))
  {
    if (v7) {
      BOOL v11 = CFEqual(v7, @"US");
    }
    else {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  if (v8 && CFEqual(v8, @"Latn"))
  {
    CEM::getUTF8StringFromCFString(__p, Value);
    int64_t v12 = (char *)std::__find_impl[abi:ne180100]<char const* const*,char const* const*,std::string,std::__identity>((const char **)createEmojiSearchTrie(__CFLocale const*,CEMEmojiSearchType)::indianLanguageCodesCustomLoading, (const char **)&__block_descriptor_tmp_214, (const void **)__p)- (char *)createEmojiSearchTrie(__CFLocale const*,CEMEmojiSearchType)::indianLanguageCodesCustomLoading;
    if (v23 < 0) {
      operator delete(__p[0]);
    }
    if (v12 != 72)
    {
      CFURLRef v13 = CEM::copyResourceURLFromFrameworkBundle(v10, @"dat", @"IndicLatnTries", 0, v9);
      __p[0] = v13;
      if (v13)
      {
        CFURLRef v14 = v13;
        if (CFURLResourceIsReachable(v13, 0)) {
          operator new();
        }
        CFRelease(v14);
      }
    }
  }
  if (a3
    && (CFEqual(Value, @"zh")
     || CFEqual(Value, @"yue")
     || CFEqual(Value, @"ja")))
  {
    if (CFStringCompare(Value, @"ja", 0)) {
      CFStringRef v16 = @"StaticAssets/zh.shared";
    }
    else {
      CFStringRef v16 = @"StaticAssets/ja";
    }
    CFURLRef v17 = CEM::copyResourceURLFromFrameworkBundle((CEM *)@"LocaleData", @"dat", v16, 0, v15);
    __p[0] = v17;
    if (CFURLResourceIsReachable(v17, 0)) {
      operator new();
    }
    if (v17) {
      CFRelease(v17);
    }
  }
  if (v11)
  {
    __p[0] = CEM::copyResourceURLFromFrameworkBundle((CEM *)@"LocaleData-en", @"dat", 0, 0, v9);
    if (__p[0]) {
      operator new();
    }
  }
  else
  {
    __p[0] = CEM::copyResourceURLFromFrameworkBundle((CEM *)@"LocaleData", @"dat", 0, (__CFString *)locale, v9);
    if (__p[0]
      || (a3 ? (unint64_t v19 = @"FindReplace") : (unint64_t v19 = @"CharacterPicker"),
          (__p[0] = CEM::copyResourceURLFromFrameworkBundle((CEM *)v19, @"dat", 0, (__CFString *)locale, v18)) != 0))
    {
      operator new();
    }
  }
  CFStringRef result = (void *)CFStringCompare(Value, @"en", 0);
  if (!result)
  {
    CFStringRef result = CEM::copyResourceURLFromFrameworkBundle((CEM *)@"LocaleData-en", @"dat", 0, 0, v21);
    __p[0] = result;
    if (result) {
      operator new();
    }
  }
  *a1 = 0;
  return result;
}

void sub_18E66B5FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x192FAF2C0](v2, 0x10F2C40A1E3B818);
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)va);
  _Unwind_Resume(a1);
}

void CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(uint64_t *a1, const __CFString *a2, CFRange a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  CFIndex location = a3.location;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  CFIndex range = a3.length;
  if (a3.length <= 0x4000)
  {
    uint64_t v6 = (uint64_t)a1;
    uint64_t v7 = *a1;
    if (!*a1 || (v103 = a1, (*(_WORD *)(v7 + 120) & 2) == 0))
    {
      if (a4 <= 6 && (v103 = a1, ((1 << a4) & 0x72) != 0))
      {
        if (!v7) {
          return;
        }
      }
      else
      {
        v103 = a1 + 1;
        if (!a1[1]) {
          return;
        }
      }
    }
    CFStringRef v131 = CFStringCreateWithSubstring(0, a2, a3);
    char v130 = 0;
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v131);
    v129 = MutableCopy;
    CFStringLowercase(MutableCopy, *(CFLocaleRef *)(v6 + 32));
    CFIndex Length = CFStringGetLength(MutableCopy);
    if (Length >= range)
    {
      uint64_t v121 = 0;
      v122 = &v121;
      uint64_t v123 = 0x4002000000;
      v124 = __Block_byref_object_copy__165;
      v125 = __Block_byref_object_dispose__166;
      std::string __p = 0;
      uint64_t v128 = 0;
      v127 = 0;
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 0x40000000;
      v118 = ___ZNK3CEM15EmojiLocaleData39enumerateSearchResultsInStringWithBlockEPK10__CFString7CFRangem18CEMEmojiSearchTypebU13block_pointerFvRKNSt3__16vectorINS6_10shared_ptrINS_10EmojiTokenEEENS6_9allocatorISA_EEEES4_PbE_block_invoke;
      v119 = &unk_1E55D55D0;
      v120 = &v121;
      uint64_t v112 = v6;
      CFStringRef theString = MutableCopy;
      if (!MutableCopy) {
        goto LABEL_85;
      }
      v141.CFIndex location = 0;
      v141.length = range;
      CFStringRef v10 = CFStringCreateWithSubstring(0, MutableCopy, v141);
      v136 = (std::string *)v10;
      if (!v10) {
        goto LABEL_85;
      }
      CEM::getUTF8StringFromCFString(&v135, v10);
      memset(&v134, 0, sizeof(v134));
      if (SHIBYTE(v135.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v133, v135.__r_.__value_.__l.__data_, v135.__r_.__value_.__l.__size_);
      }
      else {
        std::string v133 = v135;
      }
      std::string::basic_string[abi:ne180100]<0>(&v132, " ");
      CFIndex v102 = Length;
      std::string::size_type v11 = 0;
      for (uint64_t i = 0; ; ++i)
      {
        int v13 = SHIBYTE(v133.__r_.__value_.__r.__words[2]);
        std::string::size_type v14 = HIBYTE(v133.__r_.__value_.__r.__words[2]);
        if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0) {
          break;
        }
        if (v11 >= HIBYTE(v133.__r_.__value_.__r.__words[2]) || i == -1) {
          goto LABEL_59;
        }
        CFStringRef v16 = &v133;
        std::string::size_type v17 = HIBYTE(v133.__r_.__value_.__r.__words[2]);
LABEL_27:
        if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v19 = &v132;
        }
        else {
          unint64_t v19 = (std::string *)v132.__r_.__value_.__r.__words[0];
        }
        if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          int64_t size = HIBYTE(v132.__r_.__value_.__r.__words[2]);
        }
        else {
          int64_t size = v132.__r_.__value_.__l.__size_;
        }
        std::string::size_type v21 = v11;
        if (size)
        {
          unint64_t v22 = (char *)v16 + v11;
          char v23 = (char *)v16 + v17;
          int64_t v24 = v17 - v11;
          if (v24 >= size)
          {
            int v27 = v19->__r_.__value_.__s.__data_[0];
            do
            {
              int64_t v28 = v24 - size;
              if (v28 == -1) {
                break;
              }
              uint64_t v29 = (char *)memchr(v22, v27, v28 + 1);
              if (!v29) {
                break;
              }
              unint64_t v30 = v29;
              if (!memcmp(v29, v19, size))
              {
                if (v30 == v23) {
                  break;
                }
                std::string::size_type v21 = v30 - (char *)v16;
                if (v30 - (char *)v16 == -1) {
                  break;
                }
                goto LABEL_51;
              }
              unint64_t v22 = v30 + 1;
              int64_t v24 = v23 - (v30 + 1);
            }
            while (v24 >= size);
          }
          if (v13 < 0)
          {
            std::string::size_type v14 = v133.__r_.__value_.__l.__size_;
            unint64_t v25 = (std::string *)v133.__r_.__value_.__r.__words[0];
            uint64_t v26 = (char *)(v133.__r_.__value_.__r.__words[0] + (int)v11);
          }
          else
          {
            unint64_t v25 = &v133;
            uint64_t v26 = (char *)&v133 + (int)v11;
          }
          std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<char *>,std::__wrap_iter<char *>>(&v137, v26, (char *)v25 + v14, (char *)v25 + v14 - v26);
          *(void *)&long long v116 = &v134;
          std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100]((std::vector<std::string> **)&v116, &v137);
          if (SHIBYTE(v138) < 0) {
            operator delete((void *)v137);
          }
          if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0) {
            std::string::size_type v11 = v133.__r_.__value_.__l.__size_;
          }
          else {
            std::string::size_type v11 = HIBYTE(v133.__r_.__value_.__r.__words[2]);
          }
        }
        else
        {
LABEL_51:
          uint64_t v31 = (std::string *)v133.__r_.__value_.__r.__words[0];
          if (v13 >= 0) {
            uint64_t v31 = &v133;
          }
          std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<char *>,std::__wrap_iter<char *>>(&v137, (char *)v31 + (int)v11, (char *)v31 + (int)v21, (int)v21 - (uint64_t)(int)v11);
          *(void *)&long long v116 = &v134;
          std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100]((std::vector<std::string> **)&v116, &v137);
          if (SHIBYTE(v138) < 0) {
            operator delete((void *)v137);
          }
          std::string::size_type v32 = HIBYTE(v132.__r_.__value_.__r.__words[2]);
          if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            std::string::size_type v32 = v132.__r_.__value_.__l.__size_;
          }
          std::string::size_type v11 = v32 + v21;
        }
      }
      std::string::size_type v17 = v133.__r_.__value_.__l.__size_;
      if (v11 < v133.__r_.__value_.__l.__size_ && i != -1)
      {
        CFStringRef v16 = (std::string *)v133.__r_.__value_.__r.__words[0];
        goto LABEL_27;
      }
LABEL_59:
      if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v132.__r_.__value_.__l.__data_);
        LOBYTE(v13) = *((unsigned char *)&v133.__r_.__value_.__s + 23);
      }
      uint64_t v6 = v112;
      CFMutableStringRef MutableCopy = (CFMutableStringRef)theString;
      if ((v13 & 0x80) != 0) {
        operator delete(v133.__r_.__value_.__l.__data_);
      }
      std::string::size_type v34 = v134.__r_.__value_.__l.__size_;
      std::string::size_type v33 = v134.__r_.__value_.__r.__words[0];
      if (v134.__r_.__value_.__r.__words[0] != v134.__r_.__value_.__l.__size_)
      {
        while (2)
        {
          LOBYTE(v116) = 0;
          uint64_t v35 = *(unsigned __int8 *)(v33 + 23);
          if (*(char *)(v33 + 23) < 0)
          {
            unint64_t v36 = *(const char **)v33;
            uint64_t v37 = *(void *)(v33 + 8);
          }
          else
          {
            unint64_t v36 = (const char *)v33;
            uint64_t v37 = *(unsigned __int8 *)(v33 + 23);
          }
          while (v37)
          {
            int v38 = v36[--v37];
            if (v38 == 46)
            {
              if (v37 == -1) {
                break;
              }
              if ((v35 & 0x80) != 0)
              {
                if (v37 == *(void *)(v33 + 8) - 1) {
                  break;
                }
                int v39 = *(const char **)v33;
              }
              else
              {
                if (v37 == v35 - 1) {
                  break;
                }
                int v39 = (const char *)v33;
              }
              CFStringRef v40 = CFStringCreateWithCString(0, v39, 0x8000100u);
              *(void *)&long long v137 = v40;
              if (v40)
              {
                CFRange v41 = CFStringFind(theString, v40, 0);
                if (v41.location != -1 && v41.length) {
                  ((void (*)(void *, CFIndex, CFIndex, long long *))v118)(v117, v41.location, v41.length, &v116);
                }
                int v42 = v116;
                CFRelease(v40);
                if (v42) {
                  goto LABEL_81;
                }
              }
              break;
            }
          }
          v33 += 24;
          if (v33 != v34) {
            continue;
          }
          break;
        }
      }
LABEL_81:
      *(void *)&long long v137 = &v134;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v137);
      if (SHIBYTE(v135.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v135.__r_.__value_.__l.__data_);
      }
      CFIndex Length = v102;
      if (v136) {
        CFRelease(v136);
      }
LABEL_85:
      memset(&v135, 0, sizeof(v135));
      long long v116 = xmmword_18E674C60;
      if (!*(void *)(v6 + 16)) {
        goto LABEL_105;
      }
      if (Length >= 1)
      {
        uint64_t v43 = 0;
        do
        {
          for (uint64_t j = (uint64_t *)v122[5]; j != (uint64_t *)v122[6]; j += 2)
          {
            uint64_t v45 = j[1];
            if (*j < v43 && v45 + *j > v43)
            {
              if (*j != -1)
              {
                v43 += v45;
                goto LABEL_103;
              }
              break;
            }
          }
          if (v43 >= 1)
          {
            UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v43 - 1);
            if (!isWhitespace(CharacterAtIndex)) {
              goto LABEL_102;
            }
          }
          *(void *)&long long v137 = &unk_1EDD69688;
          *((void *)&v137 + 1) = theString;
          CFIndex v138 = range;
          v139 = &v137;
          CEM::EmojiLocaleData::emojiTokensForStringPrefix(&v134.__r_.__value_.__l.__data_, v6, a2, v43, range - v43, a4, a5, *(void *)(v6 + 16), (uint64_t *)&v116, (uint64_t)&v137);
          std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate((uint64_t *)&v135);
          std::string v135 = v134;
          memset(&v134, 0, sizeof(v134));
          v133.__r_.__value_.__r.__words[0] = (std::string::size_type)&v134;
          std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v133);
          std::__function::__value_func<BOOL ()(long)>::~__value_func[abi:ne180100](&v137);
          if (v135.__r_.__value_.__l.__size_ == v135.__r_.__value_.__r.__words[0])
          {
LABEL_102:
            ++v43;
          }
          else
          {
            uint64_t v48 = *((void *)&v116 + 1);
            uint64_t v49 = v116 + location;
            (*(void (**)(uint64_t, std::string *, void, void, char *))(a6 + 16))(a6, &v135, v116 + location, *((void *)&v116 + 1), &v130);
            uint64_t v43 = v49 + v48;
          }
LABEL_103:
          ;
        }
        while (v43 < Length);
      }
      CFMutableStringRef MutableCopy = (CFMutableStringRef)theString;
      if (!v130)
      {
LABEL_105:
        v142.CFIndex location = 0;
        v142.length = range;
        CFStringTokenizerSetString(*(CFStringTokenizerRef *)(v6 + 40), MutableCopy, v142);
        std::__split_buffer<std::string>::pointer v50 = 0;
        uint64_t v51 = 0;
        unint64_t v52 = 0;
        v115 = 0;
        memset(&v134, 0, sizeof(v134));
        while (1)
        {
          uint64_t v53 = v112;
          if (!CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)(v112 + 40))) {
            break;
          }
          CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(void *)(v112 + 40));
          unint64_t v55 = (CFIndex *)v122[5];
          uint8x8_t v56 = (CFIndex *)v122[6];
          if (v55 == v56)
          {
LABEL_120:
            if ((unint64_t)v51 >= v52)
            {
              uint64_t v62 = v51 - v50;
              unint64_t v63 = v62 + 1;
              if ((unint64_t)(v62 + 1) >> 61) {
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v52 - (void)v50) >> 2 > v63) {
                unint64_t v63 = (uint64_t)(v52 - (void)v50) >> 2;
              }
              if (v52 - (unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v64 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v64 = v63;
              }
              if (v64) {
                unint64_t v64 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long>>(v64);
              }
              else {
                uint64_t v65 = 0;
              }
              std::__split_buffer<std::string>::pointer v66 = (CFIndex *)(v64 + 8 * v62);
              *std::__split_buffer<std::string>::pointer v66 = CurrentTokenRange.location;
              unint64_t v67 = v66 + 1;
              while (v51 != v50)
              {
                CFIndex v68 = *--v51;
                *--std::__split_buffer<std::string>::pointer v66 = v68;
              }
              unint64_t v52 = v64 + 8 * v65;
              if (v50) {
                operator delete(v50);
              }
              std::__split_buffer<std::string>::pointer v50 = v66;
              uint64_t v51 = v67;
            }
            else
            {
              *v51++ = CurrentTokenRange.location;
            }
            CFIndex v69 = CurrentTokenRange.location + CurrentTokenRange.length;
            std::string::size_type v70 = v134.__r_.__value_.__l.__size_;
            if (v134.__r_.__value_.__l.__size_ >= v134.__r_.__value_.__r.__words[2])
            {
              uint64_t v72 = (void *)v134.__r_.__value_.__r.__words[0];
              uint64_t v73 = (uint64_t)(v134.__r_.__value_.__l.__size_ - v134.__r_.__value_.__r.__words[0]) >> 3;
              unint64_t v74 = v73 + 1;
              if ((unint64_t)(v73 + 1) >> 61) {
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              }
              int64_t v75 = v134.__r_.__value_.__r.__words[2] - v134.__r_.__value_.__r.__words[0];
              if ((uint64_t)(v134.__r_.__value_.__r.__words[2] - v134.__r_.__value_.__r.__words[0]) >> 2 > v74) {
                unint64_t v74 = v75 >> 2;
              }
              if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v76 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v76 = v74;
              }
              if (v76)
              {
                unint64_t v76 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long>>(v76);
                std::string::size_type v70 = v134.__r_.__value_.__l.__size_;
                uint64_t v72 = (void *)v134.__r_.__value_.__r.__words[0];
              }
              else
              {
                uint64_t v77 = 0;
              }
              uint64_t v78 = (CFIndex *)(v76 + 8 * v73);
              *uint64_t v78 = v69;
              std::string::size_type v71 = (std::string::size_type)(v78 + 1);
              while ((void *)v70 != v72)
              {
                CFIndex v79 = *(void *)(v70 - 8);
                v70 -= 8;
                *--uint64_t v78 = v79;
              }
              v134.__r_.__value_.__r.__words[0] = (std::string::size_type)v78;
              v134.__r_.__value_.__l.__size_ = v71;
              v134.__r_.__value_.__r.__words[2] = v76 + 8 * v77;
              if (v72) {
                operator delete(v72);
              }
            }
            else
            {
              *(void *)v134.__r_.__value_.__l.__size_ = v69;
              std::string::size_type v71 = v70 + 8;
            }
            v134.__r_.__value_.__l.__size_ = v71;
          }
          else
          {
            CFIndex v57 = CurrentTokenRange.length + CurrentTokenRange.location;
            while (1)
            {
              CFIndex v58 = v55[1] + *v55;
              BOOL v59 = CurrentTokenRange.location >= *v55 && CurrentTokenRange.location < v58;
              BOOL v60 = !v59 || v57 <= *v55;
              if (!v60 && v57 <= v58) {
                break;
              }
              v55 += 2;
              if (v55 == v56) {
                goto LABEL_120;
              }
            }
          }
        }
        CEM::getUTF8StringFromCFString(&v133, theString);
        if (v50 != v51)
        {
          uint64_t v80 = 0;
          uint64_t v81 = 0;
          CFStringRef v106 = (CFStringRef)(v112 + 48);
          v101 = 0;
          uint64_t v82 = -1;
          unint64_t v83 = v50;
          while (1)
          {
            uint64_t v114 = 0;
            uint64_t v84 = *v83;
            uint64_t v114 = *v83;
            long long v116 = xmmword_18E674C60;
            uint64_t v85 = *(unsigned __int8 *)(v53 + 71);
            int v86 = (char)v85;
            if ((v85 & 0x80u) != 0) {
              uint64_t v85 = *(void *)(v53 + 56);
            }
            if (v85 != 2) {
              break;
            }
            if (v86 >= 0) {
              isa = (_WORD *)(v112 + 48);
            }
            else {
              isa = v106->isa;
            }
            if (*isa != 28523)
            {
              if (*isa != 26746)
              {
                BOOL v88 = *isa == 24938;
                goto LABEL_172;
              }
              char v92 = 1;
LABEL_178:
              char v113 = v92;
              int v93 = (long long *)operator new(0x20uLL);
              *(void *)int v93 = &unk_1EDD6A150;
              *((void *)v93 + 1) = &v134;
              *((void *)v93 + 2) = &v114;
              *((void *)v93 + 3) = &v113;
              v139 = v93;
              CEM::EmojiLocaleData::emojiTokensForStringPrefix(&v132.__r_.__value_.__l.__data_, v112, theString, v84, range - v84, a4, a5, *v103, (uint64_t *)&v116, (uint64_t)&v137);
              goto LABEL_179;
            }
            *(void *)&long long v137 = &unk_1EDD696E0;
            v139 = &v137;
            CEM::EmojiLocaleData::emojiTokensForStringPrefix(&v132.__r_.__value_.__l.__data_, v112, theString, v84, range - v84, a4, a5, *v103, (uint64_t *)&v116, (uint64_t)&v137);
LABEL_179:
            std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate((uint64_t *)&v135);
            std::string v135 = v132;
            memset(&v132, 0, sizeof(v132));
            v136 = &v132;
            std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v136);
            std::__function::__value_func<BOOL ()(long)>::~__value_func[abi:ne180100](&v137);
            uint64_t v53 = v112;
            if ((a5 & 1) != 0
              || v82 == -1
              || (uint64_t)v116 < v82
              || (uint64_t)v116 >= v82 + v81
              || *((void *)&v116 + 1) + (void)v116 <= v82
              || *((void *)&v116 + 1) + (void)v116 > v82 + v81)
            {
              if (v135.__r_.__value_.__l.__size_ == v135.__r_.__value_.__r.__words[0]) {
                goto LABEL_196;
              }
              uint64_t v94 = *(unsigned __int8 *)(v112 + 71);
              int v95 = (char)v94;
              if ((v94 & 0x80u) != 0) {
                uint64_t v94 = *(void *)(v112 + 56);
              }
              if (v94 != 2) {
                goto LABEL_193;
              }
              int v96 = v95 >= 0 ? (_WORD *)(v112 + 48) : v106->isa;
              if (*v96 != 28523) {
                goto LABEL_193;
              }
              if (!v101)
              {
                v143.length = range;
                v143.CFIndex location = 0;
                uint64_t v80 = CFStringTokenizerCreate(0, theString, v143, 0, *(CFLocaleRef *)(v112 + 32));
                v115 = v80;
              }
              long long v99 = v116;
              if ((!CFStringTokenizerGoToTokenAtIndex(v80, v116)
                 || CFStringTokenizerGetCurrentTokenRange(v80).location == (void)v99)
                && CFStringTokenizerGoToTokenAtIndex(v80, *((void *)&v99 + 1) + v99 - 1)
                && (CFRange v100 = CFStringTokenizerGetCurrentTokenRange(v80),
                    v100.location + v100.length >= *((void *)&v99 + 1) + (void)v99))
              {
                if (v100.location != -1)
                {
                  v101 = v80;
LABEL_193:
                  uint64_t v81 = *((void *)&v116 + 1);
                  uint64_t v82 = v116;
                  uint64_t v97 = v116 + location;
                  uint64_t v98 = &v133;
                  if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                    uint64_t v98 = (std::string *)v133.__r_.__value_.__r.__words[0];
                  }
                  CEM::AdaptationController::sortEmojiTokensIfEnabled(v112 + 112, (uint64_t)v98 + v97, *((unint64_t *)&v116 + 1), (uint64_t *)&v135);
                  (*(void (**)(uint64_t, std::string *, uint64_t, uint64_t, char *))(a6 + 16))(a6, &v135, v97, v81, &v130);
LABEL_196:
                  if (v130) {
                    goto LABEL_210;
                  }
                  goto LABEL_197;
                }
                v101 = v80;
              }
              else
              {
                v101 = v80;
              }
            }
LABEL_197:
            if (++v83 == v51) {
              goto LABEL_210;
            }
          }
          if (v85 == 3)
          {
            if (v86 >= 0) {
              int v89 = (unsigned __int16 *)(v112 + 48);
            }
            else {
              int v89 = (unsigned __int16 *)v106->isa;
            }
            int v90 = *v89;
            int v91 = *((unsigned __int8 *)v89 + 2);
            BOOL v88 = v90 == 30073 && v91 == 101;
LABEL_172:
            char v92 = v88;
          }
          else
          {
            char v92 = 0;
          }
          goto LABEL_178;
        }
        uint64_t v80 = 0;
LABEL_210:
        if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v133.__r_.__value_.__l.__data_);
        }
        if (v134.__r_.__value_.__r.__words[0])
        {
          v134.__r_.__value_.__l.__size_ = v134.__r_.__value_.__r.__words[0];
          operator delete(v134.__r_.__value_.__l.__data_);
        }
        if (v50) {
          operator delete(v50);
        }
        if (v80) {
          CFRelease(v80);
        }
      }
      *(void *)&long long v137 = &v135;
      std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v137);
      _Block_object_dispose(&v121, 8);
      if (__p)
      {
        v127 = __p;
        operator delete(__p);
      }
      CFMutableStringRef MutableCopy = v129;
    }
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    if (v131) {
      CFRelease(v131);
    }
  }
}

void sub_18E66C318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *__p,uint64_t a42,uint64_t a43,const void *a44,uint64_t a45,const void *a46,uint64_t a47,uint64_t a48,int a49,__int16 a50,char a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *a62)
{
  a29 = v62 - 208;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a29);
  if (*(char *)(v62 - 153) < 0) {
    operator delete(a62);
  }
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v62 - 144), 0);
  _Block_object_dispose(&a36, 8);
  if (__p)
  {
    a42 = (uint64_t)__p;
    operator delete(__p);
  }
  nlp::CFScopedPtr<__CFString *>::reset(&a44);
  nlp::CFScopedPtr<__CFString const*>::reset(&a46, 0);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__165(void *a1, uint64_t a2)
{
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 4std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100]((uint64_t *)this + 7, 0) = 0;
  *(void *)(a2 + 4trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = 0;
  *(void *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__166(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 4trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = v2;
    operator delete(v2);
  }
}

void ___ZNK3CEM15EmojiLocaleData39enumerateSearchResultsInStringWithBlockEPK10__CFString7CFRangem18CEMEmojiSearchTypebU13block_pointerFvRKNSt3__16vectorINS6_10shared_ptrINS_10EmojiTokenEEENS6_9allocatorISA_EEEES4_PbE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = (char *)v5[6];
  unint64_t v6 = v5[7];
  if ((unint64_t)v7 >= v6)
  {
    CFLocaleRef v9 = (char *)v5[5];
    uint64_t v10 = (v7 - v9) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v6 - (void)v9;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      if (v13 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      std::string::size_type v14 = (char *)operator new(16 * v13);
    }
    else
    {
      std::string::size_type v14 = 0;
    }
    CFLocaleRef v15 = &v14[16 * v10];
    *(void *)CFLocaleRef v15 = a2;
    *((void *)v15 + 1) = a3;
    CFStringRef v8 = v15 + 16;
    if (v7 != v9)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v7 - 1);
        v15 -= 16;
        v7 -= 16;
      }
      while (v7 != v9);
      uint64_t v7 = (char *)v5[5];
    }
    void v5[5] = v15;
    v5[6] = v8;
    v5[7] = &v14[16 * v13];
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    *(void *)uint64_t v7 = a2;
    *((void *)v7 + 1) = a3;
    CFStringRef v8 = v7 + 16;
  }
  v5[6] = v8;
}

BOOL isWhitespace(UniChar theChar)
{
  {
    isWhitespace(unsigned short)::whitespaceCharacter = (uint64_t)CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  }
  return CFCharacterSetIsCharacterMember((CFCharacterSetRef)isWhitespace(unsigned short)::whitespaceCharacter, theChar) != 0;
}

void sub_18E66C6B8(_Unwind_Exception *a1)
{
}

uint64_t CEM::EmojiLocaleData::emojiTokensForStringPrefix(char **a1, uint64_t a2, CFStringRef theString, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t a10)
{
  char v51 = a7;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a8)
  {
    int v12 = a6;
    if (a4 + a5 > CFStringGetLength(theString)) {
      __assert_rtn("findEmojiForStringPrefix", "CEMEmojiSearchTrie.cpp", 121, "range.location + range.length <= CFStringGetLength(string)");
    }
    if (v12) {
      int v16 = v12;
    }
    else {
      int v16 = 2;
    }
    int v52 = v16;
    unint64_t v55 = 0;
    uint8x8_t v56 = 0;
    uint64_t v57 = 0;
    CFStringRef theStringa = theString;
    uint64_t v72 = a4;
    int64_t v73 = a5;
    CharactersPtr = CFStringGetCharactersPtr(theString);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    }
    int64_t v74 = 0;
    int64_t v75 = 0;
    std::string::size_type v71 = CStringPtr;
    unsigned int v62 = 0;
    *(_OWORD *)BOOL v60 = 0u;
    long long v61 = 0u;
    if (a5 >= 1)
    {
      uint64_t v18 = 0;
      int64_t v19 = 0;
      uint64_t v50 = a4;
      uint64_t v54 = a4 + 1;
      long long v20 = buffer;
      uint64_t v21 = 64;
      while (1)
      {
        if ((unint64_t)v19 >= 4) {
          uint64_t v22 = 4;
        }
        else {
          uint64_t v22 = v19;
        }
        int64_t v23 = v73;
        if (v73 <= v19)
        {
          LOBYTE(v25) = 0;
          goto LABEL_23;
        }
        if (CharactersPtr)
        {
          int64_t v24 = (UniChar *)&CharactersPtr[v19 + v72];
        }
        else
        {
          if (v71)
          {
            unsigned int v25 = v71[v72 + v19];
            goto LABEL_22;
          }
          int64_t v30 = v74;
          if (v75 <= v19 || v74 > v19)
          {
            uint64_t v32 = v22 + v18;
            uint64_t v33 = v21 - v22;
            int64_t v34 = v19 - v22;
            int64_t v35 = v34 + 64;
            if (v34 + 64 >= v73) {
              int64_t v35 = v73;
            }
            int64_t v74 = v34;
            int64_t v75 = v35;
            if (v73 >= v33) {
              int64_t v23 = v33;
            }
            v76.length = v23 + v32;
            v76.CFIndex location = v72 + v34;
            CFStringGetCharacters(theStringa, v76, buffer);
            int64_t v30 = v74;
          }
          int64_t v24 = &v20[-v30];
        }
        unsigned int v25 = *v24;
        if ((unsigned __int16)v25 == 8217)
        {
          LOBYTE(v25) = 39;
          goto LABEL_23;
        }
LABEL_22:
        if ((unsigned __int16)v25 >= 0x80u)
        {
          if ((unsigned __int16)v25 > 0x7FFu)
          {
            LOWORD(v2trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = ((unsigned __int16)v25 >> 12) | 0xFFE0;
            v63[1] = (v25 >> 6) & 0x3F | 0x80;
            uint64_t v29 = 2;
          }
          else
          {
            unsigned int v28 = (v25 >> 6) | 0xFFFFFFC0;
            uint64_t v29 = 1;
          }
          v63[0] = v28;
          unint64_t v26 = v29 + 1;
          v63[v29] = v25 & 0x3F | 0x80;
          goto LABEL_24;
        }
LABEL_23:
        v63[0] = v25;
        unint64_t v26 = 1;
LABEL_24:
        internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(a8 + 32), (uint64_t)v63, v26, (uint64_t)v60, &v58);
        v60[0] = v58;
        std::string::operator=((std::string *)&v60[1], &__p);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (v60[0] != (void *)0xFFFFFFFFLL)
        {
          CFIndex v58 = (void *)(v54 + v19);
          uint64_t v27 = *(void *)(a10 + 24);
          if (!v27) {
            std::__throw_bad_function_call[abi:ne180100]();
          }
          if ((*(unsigned int (**)(uint64_t, void **))(*(void *)v27 + 48))(v27, &v58)
            && CEM::EmojiSearchTrie::getPayload(a8, (uint64_t)v60, v52, &v62))
          {
            if ((v51 & 1) == 0) {
              uint8x8_t v56 = v55;
            }
            CEM::EmojiSearchTrie::payloadToIndexes((uint64_t *)a8, v62, (uint64_t)&v55);
            *a9 = v50;
            a9[1] = v19 + 1;
          }
          ++v19;
          --v18;
          ++v21;
          ++v20;
          if (a5 != v19) {
            continue;
          }
        }
        if (SHIBYTE(v61) < 0) {
          operator delete(v60[1]);
        }
        break;
      }
    }
    unint64_t v36 = v55;
    uint64_t v37 = v56;
    if (v55 != v56)
    {
      int v38 = v55;
      do
      {
        CEM::EmojiLocaleData::createEmojiToken(v60, a2, v12, *v38);
        if (v60[0])
        {
          int v39 = (void **)a1[1];
          unint64_t v40 = (unint64_t)a1[2];
          if ((unint64_t)v39 >= v40)
          {
            uint64_t v42 = ((char *)v39 - *a1) >> 4;
            unint64_t v43 = v42 + 1;
            if ((unint64_t)(v42 + 1) >> 60) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v44 = v40 - (void)*a1;
            if (v44 >> 3 > v43) {
              unint64_t v43 = v44 >> 3;
            }
            if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v45 = v43;
            }
            CFIndex v68 = a1 + 2;
            unint64_t v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v45);
            unint64_t v47 = &v46[16 * v42];
            *(void *)buffer = v46;
            uint64_t v65 = v47;
            unint64_t v67 = &v46[16 * v48];
            *(_OWORD *)unint64_t v47 = *(_OWORD *)v60;
            std::__split_buffer<std::string>::pointer v66 = v47 + 16;
            std::vector<std::shared_ptr<CEM::EmojiToken>>::__swap_out_circular_buffer(a1, buffer);
            CFRange v41 = (void **)a1[1];
            std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)buffer);
          }
          else
          {
            *int v39 = v60[0];
            v39[1] = v60[1];
            CFRange v41 = v39 + 2;
            a1[1] = (char *)(v39 + 2);
          }
          a1[1] = (char *)v41;
        }
        else if (v60[1])
        {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v60[1]);
        }
        ++v38;
      }
      while (v38 != v37);
    }
    if (v36) {
      operator delete(v36);
    }
  }
  return sortEmojiTokens(a1, *(unsigned char *)(a2 + 784), (uint64_t)theString, a4, a5, a6, a7, a8);
}

void sub_18E66CB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
}

void *std::__function::__value_func<BOOL ()(long)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<long>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

void *std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::target_type()
{
}

uint64_t std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK3CEM15EmojiLocaleData39enumerateSearchResultsInStringWithBlockEPK10__CFString7CFRangem18CEMEmojiSearchTypebU13block_pointerFvRKNSt3__16vectorINS6_10shared_ptrINS_10EmojiTokenEEENS6_9allocatorISA_EEEES4_PbEE3$_2"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

BOOL std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 8);
  char v5 = *(void **)v3;
  uint64_t v4 = *(void **)(v3 + 8);
  if (v5 != v4)
  {
    while (*v5 != v2)
    {
      if (++v5 == v4)
      {
        char v5 = v4;
        break;
      }
    }
  }
  if (v5 == v4) {
    return 0;
  }
  if (**(unsigned char **)(a1 + 24)) {
    return 1;
  }
  return v2 - **(void **)(a1 + 16) > 1;
}

__n128 std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EDD6A150;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = result;
  return result;
}

__n128 std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_1EDD6A150;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

void std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::~__func()
{
}

void *std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::target_type()
{
}

uint64_t std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK3CEM15EmojiLocaleData39enumerateSearchResultsInStringWithBlockEPK10__CFString7CFRangem18CEMEmojiSearchTypebU13block_pointerFvRKNSt3__16vectorINS6_10shared_ptrINS_10EmojiTokenEEENS6_9allocatorISA_EEEES4_PbEE3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::operator()()
{
  return 1;
}

void std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1EDD696E0;
}

void *std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  *__n128 result = &unk_1EDD696E0;
  return result;
}

void std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::~__func()
{
}

uint64_t CEM::EmojiLocaleData::createEmojiToken(void *a1, uint64_t a2, int a3, unsigned int a4)
{
  uint64_t result = CEM::EmojiLocaleData::emojiIndexIsSupported(a2, a3, a4);
  if (result)
  {
    CFStringRef v8 = *(unsigned __int16 **)(a2 + 104);
    if (!v8
      || (unsigned int v9 = v8[22], v10 = a4 >= v9, v11 = a4 - v9, v11 == 0 || !v10)
      || v8[21] < (unsigned __int16)v11)
    {
      CFStringRef v8 = *(unsigned __int16 **)(a2 + 96);
    }
    int v12 = operator new(0x48uLL);
    v12[1] = 0;
    v12[2] = 0;
    *int v12 = &unk_1EDD69ED0;
    uint64_t result = CEM::EmojiToken::EmojiToken((uint64_t)(v12 + 3), a4, (CEM::EmojiData *)v8, a2);
    *a1 = result;
    a1[1] = v12;
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

void sub_18E66CF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  std::__shared_weak_count::~__shared_weak_count(v17);
  operator delete(v20);
  if (a2 != 1) {
    _Unwind_Resume(a1);
  }
  __cxa_begin_catch(a1);
  void *v16 = 0;
  v16[1] = 0;
  __cxa_end_catch();
}

uint64_t sortEmojiTokens(char **a1, UInt8 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = *a1;
  BOOL v10 = a1[1];
  unint64_t v11 = 126 - 2 * __clz((v10 - v9) >> 4);
  bytes[0] = a2;
  if (v10 == v9) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v11;
  }
  std::__introsort<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,false>(v9, v10, (char *)bytes, v12, 1, a6, a7, a8, v76);
  memset(v84, 0, sizeof(v84));
  int v85 = 1065353216;
  long long v82 = 0uLL;
  v83[0] = 0;
  std::string::size_type v14 = *a1;
  unint64_t v13 = a1[1];
  uint64_t v81 = (uint64_t *)a1;
  uint64_t v15 = v13 - *a1;
  if (v13 != *a1)
  {
    if (v15 < 0) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    *(void *)&long long v89 = v83;
    *(void *)bytes = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v15 >> 4);
    *(void *)&bytes[8] = *(void *)bytes;
    *(void *)&long long v88 = *(void *)bytes;
    *((void *)&v88 + 1) = *(void *)bytes + 16 * v16;
    std::vector<std::shared_ptr<CEM::EmojiToken>>::__swap_out_circular_buffer(&v82, bytes);
    std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)bytes);
    std::string::size_type v14 = *a1;
    unint64_t v13 = a1[1];
  }
  if (v14 != v13)
  {
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v77 = "_longCharForGenderPersonCategory";
    uint64_t v78 = "false && \"An unsupported CEMEmojiGender member was supplied and does not have a corresponding person codepoint\"";
    CFIndex v79 = v13;
    do
    {
      std::string::size_type v17 = *(CEM::EmojiToken **)v14;
      uint64_t v18 = (std::__shared_weak_count *)*((void *)v14 + 1);
      if (v18)
      {
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
        unint64_t v19 = CEM::EmojiToken::baseIndex(v17);
        std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      }
      else
      {
        unint64_t v19 = CEM::EmojiToken::baseIndex(v17);
      }
      unint64_t v20 = *((void *)&v84[0] + 1);
      if (*((void *)&v84[0] + 1))
      {
        uint8x8_t v21 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)v84 + 8));
        v21.i16[0] = vaddlv_u8(v21);
        unint64_t v22 = v21.u32[0];
        if (v21.u32[0] > 1uLL)
        {
          unint64_t v23 = v19;
          if (*((void *)&v84[0] + 1) <= v19) {
            unint64_t v23 = v19 % *((void *)&v84[0] + 1);
          }
        }
        else
        {
          unint64_t v23 = (DWORD2(v84[0]) - 1) & v19;
        }
        int64_t v24 = *(void **)(*(void *)&v84[0] + 8 * v23);
        if (v24)
        {
          unsigned int v25 = (void *)*v24;
          if (*v24)
          {
            while (1)
            {
              unint64_t v26 = v25[1];
              if (v26 == v19) {
                break;
              }
              if (v22 > 1)
              {
                if (v26 >= v20) {
                  v26 %= v20;
                }
              }
              else
              {
                v26 &= v20 - 1;
              }
              if (v26 != v23) {
                goto LABEL_36;
              }
LABEL_32:
              unsigned int v25 = (void *)*v25;
              if (!v25) {
                goto LABEL_36;
              }
            }
            uint64_t v27 = v25[2];
            unsigned int v28 = (std::__shared_weak_count *)v25[3];
            if (v28) {
              atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            int64_t v30 = *(CEM::EmojiToken **)v14;
            uint64_t v29 = (std::__shared_weak_count *)*((void *)v14 + 1);
            if (v29)
            {
              atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
              BOOL v31 = *(unsigned __int16 *)(v27 + 22) == *((unsigned __int16 *)v30 + 11);
              std::__shared_weak_count::__release_shared[abi:ne180100](v29);
              if (v28) {
                goto LABEL_24;
              }
            }
            else
            {
              BOOL v31 = *(unsigned __int16 *)(v27 + 22) == *((unsigned __int16 *)v30 + 11);
              if (v28) {
LABEL_24:
              }
                std::__shared_weak_count::__release_shared[abi:ne180100](v28);
            }
            if (v31) {
              goto LABEL_118;
            }
            goto LABEL_32;
          }
        }
      }
LABEL_36:
      if (!*(_DWORD *)(*(void *)v14 + 28))
      {
        uint64_t v63 = *((void *)&v82 + 1);
        if (*((void *)&v82 + 1) >= v83[0])
        {
          uint64_t v66 = (uint64_t)(*((void *)&v82 + 1) - v82) >> 4;
          unint64_t v67 = v66 + 1;
          if ((unint64_t)(v66 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v68 = v83[0] - v82;
          if ((uint64_t)(v83[0] - v82) >> 3 > v67) {
            unint64_t v67 = v68 >> 3;
          }
          if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v69 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v69 = v67;
          }
          *(void *)&long long v89 = v83;
          std::string::size_type v70 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v69);
          std::string::size_type v71 = &v70[16 * v66];
          *(void *)bytes = v70;
          *(void *)&bytes[8] = v71;
          *((void *)&v88 + 1) = &v70[16 * v72];
          long long v73 = *(_OWORD *)v14;
          *(_OWORD *)std::string::size_type v71 = *(_OWORD *)v14;
          if (*((void *)&v73 + 1)) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v73 + 1) + 8), 1uLL, memory_order_relaxed);
          }
          *(void *)&long long v88 = v71 + 16;
          std::vector<std::shared_ptr<CEM::EmojiToken>>::__swap_out_circular_buffer(&v82, bytes);
          uint64_t v65 = *((void *)&v82 + 1);
          std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)bytes);
        }
        else
        {
          **((void **)&v82 + 1) = *(void *)v14;
          uint64_t v64 = *((void *)v14 + 1);
          *(void *)(v63 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = v64;
          if (v64) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v64 + 8), 1uLL, memory_order_relaxed);
          }
          uint64_t v65 = v63 + 16;
        }
        *((void *)&v82 + 1) = v65;
        std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::insert[abi:ne180100]((uint64_t *)v84, (uint64_t)v14);
        goto LABEL_118;
      }
      for (uint64_t i = 0; i != 4; ++i)
      {
        unsigned int v33 = kDefaultInclusiveWomanManSortOrdering[i];
        if (!v33) {
          continue;
        }
        CFStringRef v34 = *(const __CFString **)(*(void *)v14 + 8);
        if (CFStringGetLength(v34) > 16)
        {
          CFStringRef v35 = v34;
          goto LABEL_80;
        }
        long long v89 = 0u;
        long long v90 = 0u;
        *(_OWORD *)bytes = 0u;
        long long v88 = 0u;
        CFIndex Length = CFStringGetLength(v34);
        if (Length < 1) {
          goto LABEL_62;
        }
        CFIndex v37 = 0;
        uint64_t v38 = 0;
        do
        {
          unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(v34, v37);
          CFIndex v40 = v37 + 1;
          if (CharacterAtIndex >> 10 == 54 && v40 < Length)
          {
            unsigned int v42 = CFStringGetCharacterAtIndex(v34, v37 + 1);
            if (v42 >> 10 != 55)
            {
              ++v37;
              continue;
            }
            unsigned int CharacterAtIndex = v42 + (CharacterAtIndex << 10) - 56613888;
          }
          else
          {
            CFIndex v40 = v37;
          }
          *(_DWORD *)&bytes[4 * v38++] = CharacterAtIndex;
          CFIndex v37 = v40 + 1;
        }
        while (v37 < Length && v37 != 16);
        if (v37 < Length) {
          uint64_t v43 = 0;
        }
        else {
          uint64_t v43 = v38;
        }
        if ((*(_DWORD *)bytes - 128104) < 2 || *(_DWORD *)bytes == 129489)
        {
          if (v33 <= 3)
          {
            *(_DWORD *)bytes = dword_18E676A24[v33 - 1];
            goto LABEL_75;
          }
          int v75 = 39;
LABEL_123:
          __assert_rtn(v77, "CEMGenderFactory.cpp", v75, v78);
        }
LABEL_62:
        int v44 = *(_DWORD *)&bytes[4];
        uint64_t v43 = 1;
        if (*(_DWORD *)&bytes[4] == 65039) {
          uint64_t v43 = 2;
        }
        if (v33 != 3)
        {
          *(_DWORD *)&bytes[4 * v43] = 8205;
          if (v33 == 1)
          {
            int v45 = 9794;
          }
          else
          {
            if (v33 != 2)
            {
              int v75 = 54;
              uint64_t v77 = "_longCharForGenderLegacyEncoding";
              uint64_t v78 = "false && \"An unsupported CEMEmojiGender member was supplied and does not have a corresponding gender symbol\"";
              goto LABEL_123;
            }
            int v45 = 9792;
          }
          BOOL v46 = v44 == 65039;
          uint64_t v47 = 8;
          if (v46) {
            uint64_t v47 = 12;
          }
          *(_DWORD *)((unint64_t)bytes | v47) = v45;
          uint64_t v48 = 16;
          if (!v46) {
            uint64_t v48 = 12;
          }
          *(_DWORD *)&bytes[v48] = 65039;
          uint64_t v43 = 4;
          if (v46) {
            uint64_t v43 = 5;
          }
        }
LABEL_75:
        CFDataRef v49 = CFDataCreate(allocator, bytes, 4 * v43);
        CFStringRef v35 = CFStringCreateFromExternalRepresentation(allocator, v49, 0x1C000100u);
        if (!v35)
        {
          CFStringRef v35 = (const __CFString *)CFRetain(v34);
          if (!v49) {
            goto LABEL_80;
          }
LABEL_79:
          CFRelease(v49);
          goto LABEL_80;
        }
        if (v49) {
          goto LABEL_79;
        }
LABEL_80:
        CFStringRef v86 = v35;
        if (v35)
        {
          char v51 = (void *)*v81;
          uint64_t v50 = (void *)v81[1];
          if ((void *)*v81 == v50) {
            goto LABEL_101;
          }
          while (CFStringCompare(*(CFStringRef *)(*v51 + 8), v35, 0))
          {
            v51 += 2;
            if (v51 == v50)
            {
              char v51 = v50;
              break;
            }
          }
          if (v51 != (void *)v81[1])
          {
            uint64_t v52 = *((void *)&v82 + 1);
            if (*((void *)&v82 + 1) >= v83[0])
            {
              uint64_t v55 = (uint64_t)(*((void *)&v82 + 1) - v82) >> 4;
              unint64_t v56 = v55 + 1;
              if ((unint64_t)(v55 + 1) >> 60) {
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v57 = v83[0] - v82;
              if ((uint64_t)(v83[0] - v82) >> 3 > v56) {
                unint64_t v56 = v57 >> 3;
              }
              if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v58 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v58 = v56;
              }
              *(void *)&long long v89 = v83;
              BOOL v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v58);
              BOOL v60 = &v59[16 * v55];
              *(void *)bytes = v59;
              *(void *)&bytes[8] = v60;
              *((void *)&v88 + 1) = &v59[16 * v61];
              long long v62 = *(_OWORD *)v51;
              *(_OWORD *)BOOL v60 = *(_OWORD *)v51;
              if (*((void *)&v62 + 1)) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v62 + 1) + 8), 1uLL, memory_order_relaxed);
              }
              *(void *)&long long v88 = v60 + 16;
              std::vector<std::shared_ptr<CEM::EmojiToken>>::__swap_out_circular_buffer(&v82, bytes);
              uint64_t v54 = *((void *)&v82 + 1);
              std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)bytes);
            }
            else
            {
              **((void **)&v82 + 1) = *v51;
              uint64_t v53 = v51[1];
              *(void *)(v52 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = v53;
              if (v53) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v53 + 8), 1uLL, memory_order_relaxed);
              }
              uint64_t v54 = v52 + 16;
            }
            *((void *)&v82 + 1) = v54;
            std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::insert[abi:ne180100]((uint64_t *)v84, (uint64_t)v51);
            CFStringRef v35 = v86;
          }
          if (v35) {
LABEL_101:
          }
            CFRelease(v35);
        }
      }
LABEL_118:
      v14 += 16;
    }
    while (v14 != v79);
  }
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate(v81);
  *(_OWORD *)uint64_t v81 = v82;
  v81[2] = v83[0];
  v83[0] = 0;
  long long v82 = 0uLL;
  *(void *)bytes = &v82;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)bytes);
  return std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::~unordered_set[abi:ne180100]((uint64_t)v84);
}

void sub_18E66D6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void **a24)
{
  a24 = (void **)&a15;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](&a24);
  std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::~unordered_set[abi:ne180100]((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,false>(char *a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v11 = a5;
LABEL_2:
  v359 = a2 - 16;
  v362 = a2;
  v356 = a2 - 48;
  v357 = a2 - 32;
  uint64_t v15 = a1;
  while (1)
  {
    a1 = v15;
    uint64_t v16 = v362;
    uint64_t v17 = v362 - v15;
    uint64_t v18 = (v362 - v15) >> 4;
    if (v10 || !v9)
    {
      switch(v18)
      {
        case 0:
        case 1:
          return;
        case 2:
          uint64_t v178 = *(void *)v359;
          unsigned int v179 = *(unsigned __int16 *)(*(void *)v359 + 22);
          if (v179 - 1295 <= 4)
          {
            uint64_t v180 = *(void *)a1;
            unsigned int v181 = *(unsigned __int16 *)(*(void *)a1 + 22);
            if (v181 - 1295 <= 4)
            {
              if (v181 >= v179) {
                return;
              }
              goto LABEL_502;
            }
          }
          if (!*a3) {
            return;
          }
          uint64_t v316 = 0;
          int v317 = *(_DWORD *)(v178 + 28);
          long long v365 = xmmword_18E674C70;
          v318 = (char *)&v366;
          break;
        case 3:
          char v182 = *a3;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, (void *)a1 + 2, v359, v182, a5, a6, a7, a8, a9);
          return;
        case 4:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, (void *)a1 + 2, (void *)a1 + 4, v359, a3, a6, a7, a8);
          return;
        case 5:
          std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,0>(a1, (void *)a1 + 2, (void *)a1 + 4, (void *)a1 + 6, v359, a3, a7, a8);
          return;
        default:
          JUMPOUT(0);
      }
      while (*((_DWORD *)&v365 + v316) != v317)
      {
        if (++v316 == 4) {
          goto LABEL_495;
        }
      }
      v318 = (char *)&v365 + 4 * v316;
LABEL_495:
      uint64_t v347 = 0;
      unint64_t v348 = (v318 - (char *)&v365) >> 2;
      int v349 = *(_DWORD *)(*(void *)a1 + 28);
      long long v365 = xmmword_18E674C70;
      v350 = (char *)&v366;
      while (*((_DWORD *)&v365 + v347) != v349)
      {
        if (++v347 == 4) {
          goto LABEL_500;
        }
      }
      v350 = (char *)&v365 + 4 * v347;
LABEL_500:
      if (v348 >= (v350 - (char *)&v365) >> 2) {
        return;
      }
      uint64_t v180 = *(void *)a1;
      uint64_t v178 = *(void *)v359;
LABEL_502:
      *(void *)a1 = v178;
      *((void *)v362 - 2) = v180;
      uint64_t v351 = *((void *)a1 + 1);
      *((void *)a1 + 1) = *((void *)v362 - 1);
      *((void *)v362 - 1) = v351;
      return;
    }
    if (v17 <= 383) {
      break;
    }
    if (!a4)
    {
      long long v212 = xmmword_18E674C70;
      if (a1 == v362) {
        return;
      }
      int64_t v213 = (unint64_t)(v18 - 2) >> 1;
      int64_t v214 = v213;
      while (2)
      {
        int64_t v215 = v214;
        if (v213 < v214) {
          goto LABEL_375;
        }
        uint64_t v216 = (2 * v214) | 1;
        v217 = &a1[16 * v216];
        if (2 * v215 + 2 < v18)
        {
          v218 = v217 + 16;
          unsigned int v219 = *(unsigned __int16 *)(*(void *)v217 + 22);
          if (v219 - 1295 > 4 || (unsigned int v220 = *(unsigned __int16 *)(*v218 + 22), v220 - 1295 > 4))
          {
            if (*a3)
            {
              uint64_t v221 = 0;
              int v222 = *(_DWORD *)(*(void *)v217 + 28);
              long long v365 = v212;
              while (*((_DWORD *)&v365 + v221) != v222)
              {
                if (++v221 == 4)
                {
                  v223 = (char *)&v366;
                  goto LABEL_312;
                }
              }
              v223 = (char *)&v365 + 4 * v221;
LABEL_312:
              uint64_t v224 = 0;
              unint64_t v225 = (v223 - (char *)&v365) >> 2;
              int v226 = *(_DWORD *)(*v218 + 28);
              long long v365 = v212;
              do
              {
                if (*((_DWORD *)&v365 + v224) == v226)
                {
                  v227 = (char *)&v365 + 4 * v224;
                  goto LABEL_317;
                }
                ++v224;
              }
              while (v224 != 4);
              v227 = (char *)&v366;
LABEL_317:
              if (v225 < (v227 - (char *)&v365) >> 2) {
                goto LABEL_318;
              }
            }
          }
          else
          {
            if (v220 >= v219) {
              goto LABEL_319;
            }
LABEL_318:
            v217 += 16;
            uint64_t v216 = 2 * v215 + 2;
          }
        }
LABEL_319:
        v228 = &a1[16 * v215];
        unsigned int v229 = *(unsigned __int16 *)(*(void *)v217 + 22);
        if (v229 - 1295 > 4 || (unsigned int v230 = *(unsigned __int16 *)(*(void *)v228 + 22), v230 - 1295 > 4))
        {
          if (*a3)
          {
            uint64_t v231 = 0;
            int v232 = *(_DWORD *)(*(void *)v217 + 28);
            long long v365 = v212;
            while (*((_DWORD *)&v365 + v231) != v232)
            {
              if (++v231 == 4)
              {
                v233 = (char *)&v366;
                goto LABEL_329;
              }
            }
            v233 = (char *)&v365 + 4 * v231;
LABEL_329:
            uint64_t v234 = 0;
            unint64_t v235 = (v233 - (char *)&v365) >> 2;
            int v236 = *(_DWORD *)(*(void *)v228 + 28);
            long long v365 = v212;
            while (*((_DWORD *)&v365 + v234) != v236)
            {
              if (++v234 == 4)
              {
                v237 = (char *)&v366;
                goto LABEL_334;
              }
            }
            v237 = (char *)&v365 + 4 * v234;
LABEL_334:
            if (v235 < (v237 - (char *)&v365) >> 2) {
              goto LABEL_375;
            }
          }
        }
        else if (v230 < v229)
        {
          goto LABEL_375;
        }
        long long v238 = *(_OWORD *)v228;
        *(void *)v228 = 0;
        *((void *)v228 + 1) = 0;
        long long v358 = v238;
        uint64_t v239 = v238;
LABEL_336:
        v240 = v217;
        long long v241 = *(_OWORD *)v217;
        *(void *)v217 = 0;
        *((void *)v217 + 1) = 0;
        v242 = (std::__shared_weak_count *)*((void *)v228 + 1);
        *(_OWORD *)v228 = v241;
        if (v242)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v242);
          long long v212 = xmmword_18E674C70;
        }
        if (v213 < v216)
        {
LABEL_373:
          v264 = (std::__shared_weak_count *)*((void *)v240 + 1);
          *(_OWORD *)v240 = v358;
          uint64_t v16 = v362;
          if (v264)
          {
            std::__shared_weak_count::__release_shared[abi:ne180100](v264);
            long long v212 = xmmword_18E674C70;
          }
LABEL_375:
          int64_t v214 = v215 - 1;
          if (v215) {
            continue;
          }
          uint64_t v265 = (unint64_t)v17 >> 4;
          while (2)
          {
            v266 = v16;
            uint64_t v267 = 0;
            uint64_t v268 = *(void *)a1;
            uint64_t v363 = *((void *)a1 + 1);
            *(void *)a1 = 0;
            *((void *)a1 + 1) = 0;
            v269 = a1;
LABEL_378:
            v270 = &v269[16 * v267 + 16];
            uint64_t v271 = 2 * v267;
            uint64_t v267 = (2 * v267) | 1;
            uint64_t v272 = v271 + 2;
            if (v272 < v265)
            {
              v273 = v270 + 16;
              unsigned int v274 = *(unsigned __int16 *)(*(void *)v270 + 22);
              if (v274 - 1295 <= 4)
              {
                unsigned int v275 = *(unsigned __int16 *)(*v273 + 22);
                if (v275 - 1295 <= 4)
                {
                  if (v275 >= v274) {
                    goto LABEL_396;
                  }
LABEL_395:
                  v270 += 16;
                  uint64_t v267 = v272;
                  goto LABEL_396;
                }
              }
              if (*a3)
              {
                uint64_t v276 = 0;
                int v277 = *(_DWORD *)(*(void *)v270 + 28);
                long long v365 = v212;
                while (*((_DWORD *)&v365 + v276) != v277)
                {
                  if (++v276 == 4)
                  {
                    v278 = (char *)&v366;
                    goto LABEL_389;
                  }
                }
                v278 = (char *)&v365 + 4 * v276;
LABEL_389:
                uint64_t v279 = 0;
                unint64_t v280 = (v278 - (char *)&v365) >> 2;
                int v281 = *(_DWORD *)(*v273 + 28);
                long long v365 = v212;
                while (*((_DWORD *)&v365 + v279) != v281)
                {
                  if (++v279 == 4)
                  {
                    v282 = (char *)&v366;
                    goto LABEL_394;
                  }
                }
                v282 = (char *)&v365 + 4 * v279;
LABEL_394:
                if (v280 < (v282 - (char *)&v365) >> 2) {
                  goto LABEL_395;
                }
              }
            }
LABEL_396:
            long long v283 = *(_OWORD *)v270;
            *(void *)v270 = 0;
            *((void *)v270 + 1) = 0;
            v284 = (std::__shared_weak_count *)*((void *)v269 + 1);
            *(_OWORD *)v269 = v283;
            if (v284)
            {
              std::__shared_weak_count::__release_shared[abi:ne180100](v284);
              long long v212 = xmmword_18E674C70;
            }
            v269 = v270;
            if (v267 > (uint64_t)((unint64_t)(v265 - 2) >> 1))
            {
              uint64_t v16 = v266 - 16;
              if (v270 == v266 - 16)
              {
                v293 = (std::__shared_weak_count *)*((void *)v270 + 1);
                *(void *)v270 = v268;
                *((void *)v270 + 1) = v363;
                if (v293) {
                  goto LABEL_444;
                }
              }
              else
              {
                long long v285 = *((_OWORD *)v266 - 1);
                *(void *)uint64_t v16 = 0;
                *((void *)v266 - 1) = 0;
                v286 = (std::__shared_weak_count *)*((void *)v270 + 1);
                *(_OWORD *)v270 = v285;
                if (v286) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v286);
                }
                v287 = (std::__shared_weak_count *)*((void *)v266 - 1);
                *((void *)v266 - 2) = v268;
                *((void *)v266 - 1) = v363;
                if (v287) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v287);
                }
                uint64_t v288 = v270 + 16 - a1;
                long long v212 = xmmword_18E674C70;
                if (v288 >= 17)
                {
                  unint64_t v289 = (((unint64_t)v288 >> 4) - 2) >> 1;
                  v290 = &a1[16 * v289];
                  unsigned int v291 = *(unsigned __int16 *)(*(void *)v290 + 22);
                  if (v291 - 1295 > 4 || (unsigned int v292 = *(unsigned __int16 *)(*(void *)v270 + 22), v292 - 1295 > 4))
                  {
                    if (*a3)
                    {
                      uint64_t v294 = 0;
                      int v295 = *(_DWORD *)(*(void *)v290 + 28);
                      long long v365 = xmmword_18E674C70;
                      while (*((_DWORD *)&v365 + v294) != v295)
                      {
                        if (++v294 == 4)
                        {
                          v296 = (char *)&v366;
                          goto LABEL_417;
                        }
                      }
                      v296 = (char *)&v365 + 4 * v294;
LABEL_417:
                      uint64_t v297 = 0;
                      unint64_t v298 = (v296 - (char *)&v365) >> 2;
                      int v299 = *(_DWORD *)(*(void *)v270 + 28);
                      long long v365 = xmmword_18E674C70;
                      while (*((_DWORD *)&v365 + v297) != v299)
                      {
                        if (++v297 == 4)
                        {
                          v300 = (char *)&v366;
                          goto LABEL_422;
                        }
                      }
                      v300 = (char *)&v365 + 4 * v297;
LABEL_422:
                      if (v298 < (v300 - (char *)&v365) >> 2) {
                        goto LABEL_423;
                      }
                    }
                  }
                  else
                  {
                    if (v292 >= v291) {
                      goto LABEL_445;
                    }
LABEL_423:
                    long long v301 = *(_OWORD *)v270;
                    *(void *)v270 = 0;
                    *((void *)v270 + 1) = 0;
                    long long v364 = v301;
                    uint64_t v302 = v301;
                    while (1)
                    {
                      v303 = v290;
                      long long v304 = *(_OWORD *)v290;
                      *(void *)v290 = 0;
                      *((void *)v290 + 1) = 0;
                      v305 = (std::__shared_weak_count *)*((void *)v270 + 1);
                      *(_OWORD *)v270 = v304;
                      if (v305)
                      {
                        std::__shared_weak_count::__release_shared[abi:ne180100](v305);
                        long long v212 = xmmword_18E674C70;
                      }
                      if (!v289) {
                        break;
                      }
                      unint64_t v289 = (v289 - 1) >> 1;
                      v290 = &a1[16 * v289];
                      unsigned int v306 = *(unsigned __int16 *)(*(void *)v290 + 22);
                      if (v306 - 1295 > 4 || (unsigned int v307 = *(unsigned __int16 *)(v302 + 22), v307 - 1295 > 4))
                      {
                        if (!*a3) {
                          break;
                        }
                        uint64_t v308 = 0;
                        int v309 = *(_DWORD *)(*(void *)v290 + 28);
                        long long v365 = v212;
                        while (*((_DWORD *)&v365 + v308) != v309)
                        {
                          if (++v308 == 4)
                          {
                            v310 = (char *)&v366;
                            goto LABEL_437;
                          }
                        }
                        v310 = (char *)&v365 + 4 * v308;
LABEL_437:
                        uint64_t v311 = 0;
                        unint64_t v312 = (v310 - (char *)&v365) >> 2;
                        int v313 = *(_DWORD *)(v302 + 28);
                        long long v365 = v212;
                        while (*((_DWORD *)&v365 + v311) != v313)
                        {
                          if (++v311 == 4)
                          {
                            v314 = (char *)&v366;
                            goto LABEL_442;
                          }
                        }
                        v314 = (char *)&v365 + 4 * v311;
LABEL_442:
                        v270 = v303;
                        if (v312 >= (v314 - (char *)&v365) >> 2) {
                          break;
                        }
                      }
                      else
                      {
                        v270 = v303;
                        if (v307 >= v306) {
                          break;
                        }
                      }
                    }
                    v293 = (std::__shared_weak_count *)*((void *)v303 + 1);
                    *(_OWORD *)v303 = v364;
                    if (v293)
                    {
LABEL_444:
                      std::__shared_weak_count::__release_shared[abi:ne180100](v293);
                      long long v212 = xmmword_18E674C70;
                    }
                  }
                }
              }
LABEL_445:
              if (v265-- <= 2) {
                return;
              }
              continue;
            }
            goto LABEL_378;
          }
        }
        break;
      }
      uint64_t v243 = 2 * v216;
      uint64_t v216 = (2 * v216) | 1;
      v217 = &a1[16 * v216];
      uint64_t v244 = v243 + 2;
      if (v244 < v18)
      {
        v245 = v217 + 16;
        unsigned int v246 = *(unsigned __int16 *)(*(void *)v217 + 22);
        if (v246 - 1295 > 4 || (unsigned int v247 = *(unsigned __int16 *)(*v245 + 22), v247 - 1295 > 4))
        {
          if (*a3)
          {
            uint64_t v248 = 0;
            int v249 = *(_DWORD *)(*(void *)v217 + 28);
            long long v365 = v212;
            while (*((_DWORD *)&v365 + v248) != v249)
            {
              if (++v248 == 4)
              {
                v250 = (char *)&v366;
                goto LABEL_350;
              }
            }
            v250 = (char *)&v365 + 4 * v248;
LABEL_350:
            uint64_t v251 = 0;
            unint64_t v252 = (v250 - (char *)&v365) >> 2;
            int v253 = *(_DWORD *)(*v245 + 28);
            long long v365 = v212;
            do
            {
              if (*((_DWORD *)&v365 + v251) == v253)
              {
                v254 = (char *)&v365 + 4 * v251;
                goto LABEL_355;
              }
              ++v251;
            }
            while (v251 != 4);
            v254 = (char *)&v366;
LABEL_355:
            if (v252 < (v254 - (char *)&v365) >> 2) {
              goto LABEL_356;
            }
          }
        }
        else
        {
          if (v247 >= v246) {
            goto LABEL_357;
          }
LABEL_356:
          v217 += 16;
          uint64_t v216 = v244;
        }
      }
LABEL_357:
      unsigned int v255 = *(unsigned __int16 *)(*(void *)v217 + 22);
      if (v255 - 1295 > 4 || (unsigned int v256 = *(unsigned __int16 *)(v239 + 22), v256 - 1295 > 4))
      {
        v228 = v240;
        if (*a3)
        {
          uint64_t v257 = 0;
          int v258 = *(_DWORD *)(*(void *)v217 + 28);
          long long v365 = v212;
          while (*((_DWORD *)&v365 + v257) != v258)
          {
            if (++v257 == 4)
            {
              v259 = (char *)&v366;
              goto LABEL_367;
            }
          }
          v259 = (char *)&v365 + 4 * v257;
LABEL_367:
          uint64_t v260 = 0;
          unint64_t v261 = (v259 - (char *)&v365) >> 2;
          int v262 = *(_DWORD *)(v239 + 28);
          long long v365 = v212;
          do
          {
            if (*((_DWORD *)&v365 + v260) == v262)
            {
              v263 = (char *)&v365 + 4 * v260;
              goto LABEL_372;
            }
            ++v260;
          }
          while (v260 != 4);
          v263 = (char *)&v366;
LABEL_372:
          BOOL v9 = v261 >= (v263 - (char *)&v365) >> 2;
          v228 = v240;
          if (!v9) {
            goto LABEL_373;
          }
        }
      }
      else
      {
        v228 = v240;
        if (v256 < v255) {
          goto LABEL_373;
        }
      }
      goto LABEL_336;
    }
    unint64_t v19 = (unint64_t)v18 >> 1;
    unint64_t v20 = &a1[16 * ((unint64_t)v18 >> 1)];
    char v21 = *a3;
    if ((unint64_t)v17 < 0x801)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(v20, a1, v359, v21, a5, a6, a7, a8, v352);
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, v20, v359, v21, a5, a6, a7, a8, v352);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>((void *)a1 + 2, (void *)v20 - 2, v357, *a3, v22, v23, v24, v25, v353);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>((void *)a1 + 4, &a1[16 * v19 + 16], v356, *a3, v26, v27, v28, v29, v354);
      uint64_t v16 = v362;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>((void *)v20 - 2, v20, &a1[16 * v19 + 16], *a3, v30, v31, v32, v33, v355);
      long long v35 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)v20;
      *(_OWORD *)unint64_t v20 = v35;
    }
    --a4;
    if (v11) {
      goto LABEL_27;
    }
    uint64_t v36 = *((void *)a1 - 2);
    unsigned int v37 = *(unsigned __int16 *)(v36 + 22);
    if (v37 - 1295 > 4 || (unsigned int v38 = *(unsigned __int16 *)(*(void *)a1 + 22), v38 - 1295 > 4))
    {
      if (*a3)
      {
        uint64_t v39 = 0;
        int v40 = *(_DWORD *)(v36 + 28);
        long long v365 = xmmword_18E674C70;
        while (*((_DWORD *)&v365 + v39) != v40)
        {
          if (++v39 == 4)
          {
            CFRange v41 = (char *)&v366;
            goto LABEL_21;
          }
        }
        CFRange v41 = (char *)&v365 + 4 * v39;
LABEL_21:
        uint64_t v42 = 0;
        unint64_t v43 = (v41 - (char *)&v365) >> 2;
        int v44 = *(_DWORD *)(*(void *)a1 + 28);
        long long v365 = xmmword_18E674C70;
        while (*((_DWORD *)&v365 + v42) != v44)
        {
          if (++v42 == 4)
          {
            int v45 = (char *)&v366;
            goto LABEL_26;
          }
        }
        int v45 = (char *)&v365 + 4 * v42;
LABEL_26:
        if (v43 < (v45 - (char *)&v365) >> 2) {
          goto LABEL_27;
        }
      }
LABEL_125:
      long long v118 = *(_OWORD *)a1;
      *(void *)a1 = 0;
      *((void *)a1 + 1) = 0;
      unsigned int v119 = *(unsigned __int16 *)(v118 + 22);
      unsigned int v120 = v119 - 1295;
      if (v119 - 1295 > 4 || (unsigned int v121 = *(unsigned __int16 *)(*(void *)v359 + 22), v121 - 1295 > 4))
      {
        int v122 = *a3;
        if (!*a3) {
          goto LABEL_159;
        }
        uint64_t v123 = 0;
        int v124 = *(_DWORD *)(v118 + 28);
        long long v365 = xmmword_18E674C70;
        while (*((_DWORD *)&v365 + v123) != v124)
        {
          if (++v123 == 4)
          {
            v125 = (char *)&v366;
            goto LABEL_135;
          }
        }
        v125 = (char *)&v365 + 4 * v123;
LABEL_135:
        uint64_t v126 = 0;
        unint64_t v127 = (v125 - (char *)&v365) >> 2;
        int v128 = *(_DWORD *)(*(void *)v359 + 28);
        long long v365 = xmmword_18E674C70;
        while (*((_DWORD *)&v365 + v126) != v128)
        {
          if (++v126 == 4)
          {
            v129 = (char *)&v366;
            goto LABEL_140;
          }
        }
        v129 = (char *)&v365 + 4 * v126;
LABEL_140:
        if (v127 >= (v129 - (char *)&v365) >> 2)
        {
LABEL_159:
          uint64_t v15 = a1;
          while (1)
          {
            v15 += 16;
            if (v15 >= v16) {
              goto LABEL_178;
            }
            if (v120 > 4 || (unsigned int v138 = *(unsigned __int16 *)(*(void *)v15 + 22), v138 - 1295 > 4))
            {
              if (v122)
              {
                uint64_t v139 = 0;
                int v140 = *(_DWORD *)(v118 + 28);
                long long v365 = xmmword_18E674C70;
                while (*((_DWORD *)&v365 + v139) != v140)
                {
                  if (++v139 == 4)
                  {
                    CFRange v141 = (char *)&v366;
                    goto LABEL_171;
                  }
                }
                CFRange v141 = (char *)&v365 + 4 * v139;
LABEL_171:
                uint64_t v142 = 0;
                unint64_t v143 = (v141 - (char *)&v365) >> 2;
                int v144 = *(_DWORD *)(*(void *)v15 + 28);
                long long v365 = xmmword_18E674C70;
                while (*((_DWORD *)&v365 + v142) != v144)
                {
                  if (++v142 == 4)
                  {
                    v145 = (char *)&v366;
                    goto LABEL_176;
                  }
                }
                v145 = (char *)&v365 + 4 * v142;
LABEL_176:
                if (v143 < (v145 - (char *)&v365) >> 2) {
                  goto LABEL_177;
                }
              }
            }
            else if (v138 < v119)
            {
              goto LABEL_178;
            }
          }
        }
      }
      else
      {
        int v122 = *a3;
        if (v121 >= v119) {
          goto LABEL_159;
        }
      }
      uint64_t v15 = a1;
      while (1)
      {
        while (1)
        {
          v15 += 16;
          if (v120 > 4) {
            break;
          }
          unsigned int v130 = *(unsigned __int16 *)(*(void *)v15 + 22);
          if (v130 - 1295 > 4) {
            break;
          }
          if (v130 < v119) {
            goto LABEL_178;
          }
        }
        if (v122)
        {
          uint64_t v131 = 0;
          int v132 = *(_DWORD *)(v118 + 28);
          long long v365 = xmmword_18E674C70;
          while (*((_DWORD *)&v365 + v131) != v132)
          {
            if (++v131 == 4)
            {
              std::string v133 = (char *)&v366;
              goto LABEL_152;
            }
          }
          std::string v133 = (char *)&v365 + 4 * v131;
LABEL_152:
          uint64_t v134 = 0;
          unint64_t v135 = (v133 - (char *)&v365) >> 2;
          int v136 = *(_DWORD *)(*(void *)v15 + 28);
          long long v365 = xmmword_18E674C70;
          while (*((_DWORD *)&v365 + v134) != v136)
          {
            if (++v134 == 4)
            {
              long long v137 = (char *)&v366;
              goto LABEL_157;
            }
          }
          long long v137 = (char *)&v365 + 4 * v134;
LABEL_157:
          if (v135 < (v137 - (char *)&v365) >> 2) {
            break;
          }
        }
      }
LABEL_177:
      int v122 = 1;
LABEL_178:
      v146 = v16;
      if (v15 < v16)
      {
        v146 = v16;
        do
        {
          while (1)
          {
            v146 -= 16;
            if (v120 > 4) {
              break;
            }
            unsigned int v147 = *(unsigned __int16 *)(*(void *)v146 + 22);
            if (v147 - 1295 > 4) {
              break;
            }
            if (v147 >= v119) {
              goto LABEL_196;
            }
          }
          if (!v122) {
            break;
          }
          uint64_t v148 = 0;
          int v149 = *(_DWORD *)(v118 + 28);
          long long v365 = xmmword_18E674C70;
          while (*((_DWORD *)&v365 + v148) != v149)
          {
            if (++v148 == 4)
            {
              v150 = (char *)&v366;
              goto LABEL_190;
            }
          }
          v150 = (char *)&v365 + 4 * v148;
LABEL_190:
          uint64_t v151 = 0;
          unint64_t v152 = (v150 - (char *)&v365) >> 2;
          int v153 = *(_DWORD *)(*(void *)v146 + 28);
          long long v365 = xmmword_18E674C70;
          while (*((_DWORD *)&v365 + v151) != v153)
          {
            if (++v151 == 4)
            {
              v154 = (char *)&v366;
              goto LABEL_195;
            }
          }
          v154 = (char *)&v365 + 4 * v151;
LABEL_195:
          ;
        }
        while (v152 < (v154 - (char *)&v365) >> 2);
      }
LABEL_196:
      if (v15 < v146)
      {
        uint64_t v155 = *(void *)v15;
        do
        {
          *(void *)uint64_t v15 = *(void *)v146;
          *(void *)v146 = v155;
          uint64_t v156 = *((void *)v15 + 1);
          *((void *)v15 + 1) = *((void *)v146 + 1);
          *((void *)v146 + 1) = v156;
          int v157 = *a3;
          do
          {
            while (1)
            {
              v15 += 16;
              if (v120 <= 4)
              {
                uint64_t v155 = *(void *)v15;
                unsigned int v158 = *(unsigned __int16 *)(*(void *)v15 + 22);
                if (v158 - 1295 <= 4) {
                  break;
                }
              }
              if (v157)
              {
                uint64_t v159 = 0;
                int v160 = *(_DWORD *)(v118 + 28);
                long long v365 = xmmword_18E674C70;
                while (*((_DWORD *)&v365 + v159) != v160)
                {
                  if (++v159 == 4)
                  {
                    v161 = (char *)&v366;
                    goto LABEL_209;
                  }
                }
                v161 = (char *)&v365 + 4 * v159;
LABEL_209:
                uint64_t v162 = 0;
                unint64_t v163 = (v161 - (char *)&v365) >> 2;
                uint64_t v155 = *(void *)v15;
                int v164 = *(_DWORD *)(*(void *)v15 + 28);
                long long v365 = xmmword_18E674C70;
                while (*((_DWORD *)&v365 + v162) != v164)
                {
                  if (++v162 == 4)
                  {
                    v165 = (char *)&v366;
                    goto LABEL_214;
                  }
                }
                v165 = (char *)&v365 + 4 * v162;
LABEL_214:
                if (v163 < (v165 - (char *)&v365) >> 2) {
                  goto LABEL_228;
                }
              }
            }
          }
          while (v158 >= v119);
          do
          {
LABEL_228:
            while (1)
            {
              v146 -= 16;
              if (v120 > 4) {
                break;
              }
              unsigned int v173 = *(unsigned __int16 *)(*(void *)v146 + 22);
              if (v173 - 1295 > 4) {
                break;
              }
              if (v173 >= v119) {
                goto LABEL_231;
              }
            }
            if (!v157) {
              break;
            }
            uint64_t v166 = 0;
            int v167 = *(_DWORD *)(v118 + 28);
            long long v365 = xmmword_18E674C70;
            while (*((_DWORD *)&v365 + v166) != v167)
            {
              if (++v166 == 4)
              {
                v168 = (char *)&v366;
                goto LABEL_222;
              }
            }
            v168 = (char *)&v365 + 4 * v166;
LABEL_222:
            uint64_t v169 = 0;
            unint64_t v170 = (v168 - (char *)&v365) >> 2;
            int v171 = *(_DWORD *)(*(void *)v146 + 28);
            long long v365 = xmmword_18E674C70;
            while (*((_DWORD *)&v365 + v169) != v171)
            {
              if (++v169 == 4)
              {
                v172 = (char *)&v366;
                goto LABEL_227;
              }
            }
            v172 = (char *)&v365 + 4 * v169;
LABEL_227:
            ;
          }
          while (v170 < (v172 - (char *)&v365) >> 2);
LABEL_231:
          ;
        }
        while (v15 < v146);
      }
      v174 = v15 - 16;
      BOOL v9 = v15 - 16 >= a1;
      BOOL v10 = v15 - 16 == a1;
      if (v15 - 16 != a1)
      {
        long long v175 = *(_OWORD *)v174;
        *(void *)v174 = 0;
        *((void *)v15 - 1) = 0;
        v176 = (std::__shared_weak_count *)*((void *)a1 + 1);
        *(_OWORD *)a1 = v175;
        if (v176)
        {
          long long v352 = v118;
          std::__shared_weak_count::__release_shared[abi:ne180100](v176);
          long long v118 = v352;
        }
      }
      char v11 = 0;
      v177 = (std::__shared_weak_count *)*((void *)v15 - 1);
      *((_OWORD *)v15 - 1) = v118;
      if (v177)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v177);
        char v11 = 0;
      }
    }
    else
    {
      if (v38 >= v37) {
        goto LABEL_125;
      }
LABEL_27:
      long long v46 = *(_OWORD *)a1;
      *(void *)a1 = 0;
      *((void *)a1 + 1) = 0;
      int v47 = *a3;
      uint64_t v48 = a1;
      do
      {
        while (1)
        {
          CFDataRef v49 = v48;
          uint64_t v51 = *((void *)v48 + 2);
          v48 += 16;
          uint64_t v50 = v51;
          unsigned int v52 = *(unsigned __int16 *)(v51 + 22);
          if (v52 - 1295 > 4) {
            break;
          }
          unsigned int v53 = *(unsigned __int16 *)(v46 + 22);
          if (v53 - 1295 > 4) {
            break;
          }
          if (v53 >= v52) {
            goto LABEL_44;
          }
        }
        if (!v47) {
          break;
        }
        uint64_t v54 = 0;
        int v55 = *(_DWORD *)(v50 + 28);
        long long v365 = xmmword_18E674C70;
        while (*((_DWORD *)&v365 + v54) != v55)
        {
          if (++v54 == 4)
          {
            unint64_t v56 = (char *)&v366;
            goto LABEL_38;
          }
        }
        unint64_t v56 = (char *)&v365 + 4 * v54;
LABEL_38:
        uint64_t v57 = 0;
        unint64_t v58 = (v56 - (char *)&v365) >> 2;
        int v59 = *(_DWORD *)(v46 + 28);
        long long v365 = xmmword_18E674C70;
        while (*((_DWORD *)&v365 + v57) != v59)
        {
          if (++v57 == 4)
          {
            BOOL v60 = (char *)&v366;
            goto LABEL_43;
          }
        }
        BOOL v60 = (char *)&v365 + 4 * v57;
LABEL_43:
        ;
      }
      while (v58 < (v60 - (char *)&v365) >> 2);
LABEL_44:
      uint64_t v61 = v16;
      if (v49 == a1)
      {
        uint64_t v61 = v16;
        while (v48 < v61)
        {
          uint64_t v108 = *((void *)v61 - 2);
          v61 -= 16;
          uint64_t v107 = v108;
          unsigned int v109 = *(unsigned __int16 *)(v108 + 22);
          if (v109 - 1295 > 4 || (unsigned int v110 = *(unsigned __int16 *)(v46 + 22), v110 - 1295 > 4))
          {
            if (v47)
            {
              uint64_t v111 = 0;
              int v112 = *(_DWORD *)(v107 + 28);
              long long v365 = xmmword_18E674C70;
              while (*((_DWORD *)&v365 + v111) != v112)
              {
                if (++v111 == 4)
                {
                  char v113 = (char *)&v366;
                  goto LABEL_118;
                }
              }
              char v113 = (char *)&v365 + 4 * v111;
LABEL_118:
              uint64_t v114 = 0;
              unint64_t v115 = (v113 - (char *)&v365) >> 2;
              int v116 = *(_DWORD *)(v46 + 28);
              long long v365 = xmmword_18E674C70;
              while (*((_DWORD *)&v365 + v114) != v116)
              {
                if (++v114 == 4)
                {
                  v117 = (char *)&v366;
                  goto LABEL_123;
                }
              }
              v117 = (char *)&v365 + 4 * v114;
LABEL_123:
              if (v115 < (v117 - (char *)&v365) >> 2) {
                break;
              }
            }
          }
          else if (v110 < v109)
          {
            break;
          }
        }
      }
      else
      {
        while (1)
        {
          while (1)
          {
            uint64_t v63 = *((void *)v61 - 2);
            v61 -= 16;
            uint64_t v62 = v63;
            unsigned int v64 = *(unsigned __int16 *)(v63 + 22);
            if (v64 - 1295 > 4) {
              break;
            }
            unsigned int v65 = *(unsigned __int16 *)(v46 + 22);
            if (v65 - 1295 > 4) {
              break;
            }
            if (v65 < v64) {
              goto LABEL_61;
            }
          }
          if (v47)
          {
            uint64_t v66 = 0;
            int v67 = *(_DWORD *)(v62 + 28);
            long long v365 = xmmword_18E674C70;
            while (*((_DWORD *)&v365 + v66) != v67)
            {
              if (++v66 == 4)
              {
                uint64_t v68 = (char *)&v366;
                goto LABEL_55;
              }
            }
            uint64_t v68 = (char *)&v365 + 4 * v66;
LABEL_55:
            uint64_t v69 = 0;
            unint64_t v70 = (v68 - (char *)&v365) >> 2;
            int v71 = *(_DWORD *)(v46 + 28);
            long long v365 = xmmword_18E674C70;
            while (*((_DWORD *)&v365 + v69) != v71)
            {
              if (++v69 == 4)
              {
                uint64_t v72 = (char *)&v366;
                goto LABEL_60;
              }
            }
            uint64_t v72 = (char *)&v365 + 4 * v69;
LABEL_60:
            if (v70 < (v72 - (char *)&v365) >> 2) {
              break;
            }
          }
        }
      }
LABEL_61:
      uint64_t v15 = v48;
      if (v48 < v61)
      {
        long long v73 = v61;
        do
        {
          *(void *)uint64_t v15 = *(void *)v73;
          *(void *)long long v73 = v50;
          uint64_t v74 = *((void *)v15 + 1);
          *((void *)v15 + 1) = *((void *)v73 + 1);
          *((void *)v73 + 1) = v74;
          int v75 = *a3;
          while (1)
          {
            while (1)
            {
              uint64_t v76 = *((void *)v15 + 2);
              v15 += 16;
              uint64_t v50 = v76;
              unsigned int v77 = *(unsigned __int16 *)(v76 + 22);
              if (v77 - 1295 > 4) {
                break;
              }
              unsigned int v78 = *(unsigned __int16 *)(v46 + 22);
              if (v78 - 1295 > 4) {
                break;
              }
              if (v78 >= v77) {
                goto LABEL_93;
              }
            }
            if (!v75) {
              break;
            }
            uint64_t v79 = 0;
            int v80 = *(_DWORD *)(v50 + 28);
            long long v365 = xmmword_18E674C70;
            while (*((_DWORD *)&v365 + v79) != v80)
            {
              if (++v79 == 4)
              {
                uint64_t v81 = (char *)&v366;
                goto LABEL_74;
              }
            }
            uint64_t v81 = (char *)&v365 + 4 * v79;
LABEL_74:
            uint64_t v82 = 0;
            unint64_t v83 = (v81 - (char *)&v365) >> 2;
            int v84 = *(_DWORD *)(v46 + 28);
            long long v365 = xmmword_18E674C70;
            while (*((_DWORD *)&v365 + v82) != v84)
            {
              if (++v82 == 4)
              {
                int v85 = (char *)&v366;
                goto LABEL_79;
              }
            }
            int v85 = (char *)&v365 + 4 * v82;
LABEL_79:
            if (v83 >= (v85 - (char *)&v365) >> 2) {
              goto LABEL_93;
            }
          }
          while (1)
          {
LABEL_93:
            while (1)
            {
              uint64_t v94 = *((void *)v73 - 2);
              v73 -= 16;
              uint64_t v93 = v94;
              unsigned int v95 = *(unsigned __int16 *)(v94 + 22);
              if (v95 - 1295 > 4) {
                break;
              }
              unsigned int v96 = *(unsigned __int16 *)(v46 + 22);
              if (v96 - 1295 > 4) {
                break;
              }
              if (v96 < v95) {
                goto LABEL_96;
              }
            }
            if (v75)
            {
              uint64_t v86 = 0;
              int v87 = *(_DWORD *)(v93 + 28);
              long long v365 = xmmword_18E674C70;
              while (*((_DWORD *)&v365 + v86) != v87)
              {
                if (++v86 == 4)
                {
                  long long v88 = (char *)&v366;
                  goto LABEL_87;
                }
              }
              long long v88 = (char *)&v365 + 4 * v86;
LABEL_87:
              uint64_t v89 = 0;
              unint64_t v90 = (v88 - (char *)&v365) >> 2;
              int v91 = *(_DWORD *)(v46 + 28);
              long long v365 = xmmword_18E674C70;
              while (*((_DWORD *)&v365 + v89) != v91)
              {
                if (++v89 == 4)
                {
                  char v92 = (char *)&v366;
                  goto LABEL_92;
                }
              }
              char v92 = (char *)&v365 + 4 * v89;
LABEL_92:
              if (v90 < (v92 - (char *)&v365) >> 2) {
                break;
              }
            }
          }
LABEL_96:
          ;
        }
        while (v15 < v73);
      }
      uint64_t v97 = v15 - 16;
      if (v15 - 16 != a1)
      {
        long long v98 = *(_OWORD *)v97;
        *(void *)uint64_t v97 = 0;
        *((void *)v15 - 1) = 0;
        long long v99 = (std::__shared_weak_count *)*((void *)a1 + 1);
        *(_OWORD *)a1 = v98;
        if (v99)
        {
          long long v352 = v46;
          std::__shared_weak_count::__release_shared[abi:ne180100](v99);
          long long v46 = v352;
        }
      }
      CFRange v100 = (std::__shared_weak_count *)*((void *)v15 - 1);
      *((_OWORD *)v15 - 1) = v46;
      if (v100) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v100);
      }
      if (v48 < v61) {
        goto LABEL_105;
      }
      BOOL v101 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, v15 - 16, a3, v34, a5, a6, a7, a8);
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(v15, v362, a3, v102, v103, v104, v105, v106))
      {
        a2 = v15 - 16;
        if (v101) {
          return;
        }
        goto LABEL_2;
      }
      if (!v101)
      {
LABEL_105:
        std::__introsort<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,false>(a1, v15 - 16, a3, a4, v11 & 1);
        char v11 = 0;
      }
    }
  }
  if (v11)
  {
    long long v183 = xmmword_18E674C70;
    if (a1 == v362) {
      return;
    }
    v184 = a1 + 16;
    if (a1 + 16 == v362) {
      return;
    }
    v185 = a1;
    while (2)
    {
      v186 = v185;
      v185 = v184;
      unsigned int v187 = *(unsigned __int16 *)(*((void *)v186 + 2) + 22);
      if (v187 - 1295 > 4 || (unsigned int v188 = *(unsigned __int16 *)(*(void *)v186 + 22), v188 - 1295 > 4))
      {
        if (*a3)
        {
          uint64_t v189 = 0;
          int v190 = *(_DWORD *)(*(void *)v185 + 28);
          long long v365 = v183;
          do
          {
            if (*((_DWORD *)&v365 + v189) == v190)
            {
              v191 = (char *)&v365 + 4 * v189;
              goto LABEL_267;
            }
            ++v189;
          }
          while (v189 != 4);
          v191 = (char *)&v366;
LABEL_267:
          uint64_t v192 = 0;
          unint64_t v193 = (v191 - (char *)&v365) >> 2;
          int v194 = *(_DWORD *)(*(void *)v186 + 28);
          long long v365 = v183;
          do
          {
            if (*((_DWORD *)&v365 + v192) == v194)
            {
              v195 = (char *)&v365 + 4 * v192;
              goto LABEL_272;
            }
            ++v192;
          }
          while (v192 != 4);
          v195 = (char *)&v366;
LABEL_272:
          if (v193 < (v195 - (char *)&v365) >> 2) {
            goto LABEL_273;
          }
        }
      }
      else
      {
        if (v188 >= v187) {
          goto LABEL_296;
        }
LABEL_273:
        long long v196 = *(_OWORD *)v185;
        *(void *)v185 = 0;
        *((void *)v185 + 1) = 0;
        long long v360 = v196;
        uint64_t v197 = v196;
        v198 = v185;
        while (1)
        {
          v199 = v198;
          v198 = v186;
          long long v200 = *(_OWORD *)v186;
          *(void *)v186 = 0;
          *((void *)v186 + 1) = 0;
          v201 = (std::__shared_weak_count *)*((void *)v199 + 1);
          *(_OWORD *)v199 = v200;
          if (v201)
          {
            std::__shared_weak_count::__release_shared[abi:ne180100](v201);
            long long v183 = xmmword_18E674C70;
          }
          if (v198 == a1) {
            break;
          }
          v186 = v198 - 16;
          unsigned int v202 = *(unsigned __int16 *)(v197 + 22);
          if (v202 - 1295 > 4 || (unsigned int v203 = *(unsigned __int16 *)(*(void *)v186 + 22), v203 - 1295 > 4))
          {
            if (!*a3) {
              goto LABEL_294;
            }
            uint64_t v204 = 0;
            int v205 = *(_DWORD *)(v197 + 28);
            long long v365 = v183;
            do
            {
              if (*((_DWORD *)&v365 + v204) == v205)
              {
                v206 = (char *)&v365 + 4 * v204;
                goto LABEL_288;
              }
              ++v204;
            }
            while (v204 != 4);
            v206 = (char *)&v366;
LABEL_288:
            uint64_t v207 = 0;
            unint64_t v208 = (v206 - (char *)&v365) >> 2;
            int v209 = *(_DWORD *)(*(void *)v186 + 28);
            long long v365 = v183;
            do
            {
              if (*((_DWORD *)&v365 + v207) == v209)
              {
                v210 = (char *)&v365 + 4 * v207;
                goto LABEL_293;
              }
              ++v207;
            }
            while (v207 != 4);
            v210 = (char *)&v366;
LABEL_293:
            if (v208 >= (v210 - (char *)&v365) >> 2) {
              goto LABEL_294;
            }
          }
          else if (v203 >= v202)
          {
            goto LABEL_294;
          }
        }
        v198 = a1;
LABEL_294:
        v211 = (std::__shared_weak_count *)*((void *)v198 + 1);
        *(_OWORD *)v198 = v360;
        if (v211)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v211);
          long long v183 = xmmword_18E674C70;
        }
      }
LABEL_296:
      v184 = v185 + 16;
      if (v185 + 16 == v362) {
        return;
      }
      continue;
    }
  }
  long long v319 = xmmword_18E674C70;
  if (a1 != v362)
  {
    v320 = a1 + 16;
    if (a1 + 16 != v362)
    {
      while (2)
      {
        v321 = a1;
        a1 = v320;
        unsigned int v322 = *(unsigned __int16 *)(*((void *)v321 + 2) + 22);
        if (v322 - 1295 > 4 || (unsigned int v323 = *(unsigned __int16 *)(*(void *)v321 + 22), v323 - 1295 > 4))
        {
          if (*a3)
          {
            uint64_t v324 = 0;
            int v325 = *(_DWORD *)(*(void *)a1 + 28);
            long long v365 = v319;
            do
            {
              if (*((_DWORD *)&v365 + v324) == v325)
              {
                v326 = (char *)&v365 + 4 * v324;
                goto LABEL_465;
              }
              ++v324;
            }
            while (v324 != 4);
            v326 = (char *)&v366;
LABEL_465:
            uint64_t v327 = 0;
            unint64_t v328 = (v326 - (char *)&v365) >> 2;
            int v329 = *(_DWORD *)(*(void *)v321 + 28);
            long long v365 = v319;
            do
            {
              if (*((_DWORD *)&v365 + v327) == v329)
              {
                v330 = (char *)&v365 + 4 * v327;
                goto LABEL_470;
              }
              ++v327;
            }
            while (v327 != 4);
            v330 = (char *)&v366;
LABEL_470:
            if (v328 < (v330 - (char *)&v365) >> 2) {
              goto LABEL_471;
            }
          }
        }
        else
        {
          if (v323 >= v322) {
            goto LABEL_492;
          }
LABEL_471:
          long long v331 = *(_OWORD *)a1;
          *(void *)a1 = 0;
          *((void *)a1 + 1) = 0;
          long long v361 = v331;
          uint64_t v332 = v331;
          v333 = a1;
          do
          {
            while (1)
            {
              v334 = v333;
              v333 = v321;
              long long v335 = *(_OWORD *)v321;
              *(void *)v321 = 0;
              *((void *)v321 + 1) = 0;
              v336 = (std::__shared_weak_count *)*((void *)v334 + 1);
              *(_OWORD *)v334 = v335;
              if (v336)
              {
                std::__shared_weak_count::__release_shared[abi:ne180100](v336);
                long long v319 = xmmword_18E674C70;
              }
              v321 = v333 - 16;
              unsigned int v337 = *(unsigned __int16 *)(v332 + 22);
              if (v337 - 1295 > 4) {
                break;
              }
              unsigned int v338 = *(unsigned __int16 *)(*(void *)v321 + 22);
              if (v338 - 1295 > 4) {
                break;
              }
              if (v338 >= v337) {
                goto LABEL_490;
              }
            }
            if (!*a3) {
              break;
            }
            uint64_t v339 = 0;
            int v340 = *(_DWORD *)(v332 + 28);
            long long v365 = v319;
            do
            {
              if (*((_DWORD *)&v365 + v339) == v340)
              {
                v341 = (char *)&v365 + 4 * v339;
                goto LABEL_484;
              }
              ++v339;
            }
            while (v339 != 4);
            v341 = (char *)&v366;
LABEL_484:
            uint64_t v342 = 0;
            unint64_t v343 = (v341 - (char *)&v365) >> 2;
            int v344 = *(_DWORD *)(*(void *)v321 + 28);
            long long v365 = v319;
            do
            {
              if (*((_DWORD *)&v365 + v342) == v344)
              {
                v345 = (char *)&v365 + 4 * v342;
                goto LABEL_489;
              }
              ++v342;
            }
            while (v342 != 4);
            v345 = (char *)&v366;
LABEL_489:
            ;
          }
          while (v343 < (v345 - (char *)&v365) >> 2);
LABEL_490:
          v346 = (std::__shared_weak_count *)*((void *)v333 + 1);
          *(_OWORD *)v333 = v361;
          if (v346)
          {
            std::__shared_weak_count::__release_shared[abi:ne180100](v346);
            long long v319 = xmmword_18E674C70;
          }
        }
LABEL_492:
        v320 = a1 + 16;
        if (a1 + 16 == v362) {
          return;
        }
        continue;
      }
    }
  }
}

uint64_t std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::~unordered_set[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      uint64_t v4 = (std::__shared_weak_count *)v2[3];
      if (v4) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  char v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

void std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::insert[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  char v5 = *(CEM::EmojiToken **)a2;
  unint64_t v6 = *(std::__shared_weak_count **)(a2 + 8);
  if (v6)
  {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    unsigned int v7 = CEM::EmojiToken::baseIndex(v5);
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  else
  {
    unsigned int v7 = CEM::EmojiToken::baseIndex(v5);
  }
  unint64_t v8 = a1[1];
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    unint64_t v10 = v9.u32[0];
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v2 = v7;
      if (v8 <= v7) {
        unint64_t v2 = v7 % v8;
      }
    }
    else
    {
      unint64_t v2 = (v8 - 1) & v7;
    }
    char v11 = *(void **)(*a1 + 8 * v2);
    if (v11)
    {
      uint64_t v12 = (void *)*v11;
      if (*v11)
      {
        while (1)
        {
          unint64_t v13 = v12[1];
          if (v13 == v7) {
            break;
          }
          if (v10 > 1)
          {
            if (v13 >= v8) {
              v13 %= v8;
            }
          }
          else
          {
            v13 &= v8 - 1;
          }
          if (v13 != v2) {
            goto LABEL_29;
          }
LABEL_25:
          uint64_t v12 = (void *)*v12;
          if (!v12) {
            goto LABEL_29;
          }
        }
        uint64_t v14 = v12[2];
        uint64_t v15 = (std::__shared_weak_count *)v12[3];
        if (v15) {
          atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v17 = *(CEM::EmojiToken **)a2;
        uint64_t v16 = *(std::__shared_weak_count **)(a2 + 8);
        if (v16)
        {
          atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
          BOOL v18 = *(unsigned __int16 *)(v14 + 22) == *((unsigned __int16 *)v17 + 11);
          std::__shared_weak_count::__release_shared[abi:ne180100](v16);
          if (!v15) {
            goto LABEL_18;
          }
        }
        else
        {
          BOOL v18 = *(unsigned __int16 *)(v14 + 22) == *((unsigned __int16 *)v17 + 11);
          if (!v15)
          {
LABEL_18:
            if (v18) {
              return;
            }
            goto LABEL_25;
          }
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v15);
        goto LABEL_18;
      }
    }
  }
LABEL_29:
  unint64_t v19 = a1 + 2;
  unint64_t v20 = operator new(0x20uLL);
  *unint64_t v20 = 0;
  v20[1] = v7;
  uint64_t v21 = *(void *)(a2 + 8);
  v20[2] = *(void *)a2;
  _OWORD v20[3] = v21;
  if (v21) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v21 + 8), 1uLL, memory_order_relaxed);
  }
  float v22 = (float)(unint64_t)(a1[3] + 1);
  float v23 = *((float *)a1 + 8);
  if (!v8 || (float)(v23 * (float)v8) < v22)
  {
    BOOL v24 = (v8 & (v8 - 1)) == 0;
    if (v8 < 3) {
      BOOL v24 = 0;
    }
    unint64_t v25 = (2 * v8) | !v24;
    unint64_t v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26) {
      int8x8_t prime = (int8x8_t)v26;
    }
    else {
      int8x8_t prime = (int8x8_t)v25;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v8 = a1[1];
    if (*(void *)&prime > v8) {
      goto LABEL_43;
    }
    if (*(void *)&prime < v8)
    {
      unint64_t v34 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v8 < 3 || (uint8x8_t v35 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v35.i16[0] = vaddlv_u8(v35), v35.u32[0] > 1uLL))
      {
        unint64_t v34 = std::__next_prime(v34);
      }
      else
      {
        uint64_t v36 = 1 << -(char)__clz(v34 - 1);
        if (v34 >= 2) {
          unint64_t v34 = v36;
        }
      }
      if (*(void *)&prime <= v34) {
        int8x8_t prime = (int8x8_t)v34;
      }
      if (*(void *)&prime >= v8)
      {
        unint64_t v8 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_43:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v28 = operator new(8 * *(void *)&prime);
          uint64_t v29 = (void *)*a1;
          *a1 = (uint64_t)v28;
          if (v29) {
            operator delete(v29);
          }
          uint64_t v30 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v30++) = 0;
          while (*(void *)&prime != v30);
          uint64_t v31 = (void *)*v19;
          if (*v19)
          {
            unint64_t v32 = v31[1];
            uint8x8_t v33 = (uint8x8_t)vcnt_s8(prime);
            v33.i16[0] = vaddlv_u8(v33);
            if (v33.u32[0] > 1uLL)
            {
              if (v32 >= *(void *)&prime) {
                v32 %= *(void *)&prime;
              }
            }
            else
            {
              v32 &= *(void *)&prime - 1;
            }
            *(void *)(*a1 + 8 * v32) = v19;
            unsigned int v37 = (void *)*v31;
            if (*v31)
            {
              do
              {
                unint64_t v38 = v37[1];
                if (v33.u32[0] > 1uLL)
                {
                  if (v38 >= *(void *)&prime) {
                    v38 %= *(void *)&prime;
                  }
                }
                else
                {
                  v38 &= *(void *)&prime - 1;
                }
                if (v38 != v32)
                {
                  if (!*(void *)(*a1 + 8 * v38))
                  {
                    *(void *)(*a1 + 8 * v3trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = v31;
                    goto LABEL_68;
                  }
                  *uint64_t v31 = *v37;
                  *unsigned int v37 = **(void **)(*a1 + 8 * v38);
                  **(void **)(*a1 + 8 * v3trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = v37;
                  unsigned int v37 = v31;
                }
                unint64_t v38 = v32;
LABEL_68:
                uint64_t v31 = v37;
                unsigned int v37 = (void *)*v37;
                unint64_t v32 = v38;
              }
              while (v37);
            }
          }
          unint64_t v8 = (unint64_t)prime;
          goto LABEL_72;
        }
        uint64_t v42 = (void *)*a1;
        *a1 = 0;
        if (v42) {
          operator delete(v42);
        }
        unint64_t v8 = 0;
        a1[1] = 0;
      }
    }
LABEL_72:
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v2 = v7 % v8;
      }
      else {
        unint64_t v2 = v7;
      }
    }
    else
    {
      unint64_t v2 = (v8 - 1) & v7;
    }
  }
  uint64_t v39 = *a1;
  int v40 = *(void **)(*a1 + 8 * v2);
  if (v40)
  {
    *unint64_t v20 = *v40;
LABEL_85:
    *int v40 = v20;
    goto LABEL_86;
  }
  *unint64_t v20 = *v19;
  *unint64_t v19 = v20;
  *(void *)(v39 + 8 * v2) = v19;
  if (*v20)
  {
    unint64_t v41 = *(void *)(*v20 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v41 >= v8) {
        v41 %= v8;
      }
    }
    else
    {
      v41 &= v8 - 1;
    }
    int v40 = (void *)(*a1 + 8 * v41);
    goto LABEL_85;
  }
LABEL_86:
  ++a1[3];
}

void sub_18E66F478(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<CEM::EmojiToken>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<CEM::EmojiToken>,void *>>>::operator()[abi:ne180100](char a1, void *__p)
{
  if (a1)
  {
    uint64_t v3 = (std::__shared_weak_count *)__p[3];
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(void *result, void *a2, void *a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  unsigned int v10 = *(unsigned __int16 *)(*a2 + 22);
  unsigned int v11 = v10 - 1295;
  if (v10 - 1295 > 4 || (unsigned int v12 = *(unsigned __int16 *)(*result + 22), v12 - 1295 > 4))
  {
    if (!a4)
    {
      uint64_t v17 = *a3;
      unsigned int v18 = *(unsigned __int16 *)(*a3 + 22);
      if (v18 - 1295 > 4 || v11 > 4 || v10 >= v18) {
        return result;
      }
      goto LABEL_54;
    }
    uint64_t v14 = 0;
    int v15 = *(_DWORD *)(v9 + 28);
    long long v65 = xmmword_18E674C70;
    uint64_t v16 = (char *)&a9;
    while (*((_DWORD *)&v65 + v14) != v15)
    {
      if (++v14 == 4) {
        goto LABEL_19;
      }
    }
    uint64_t v16 = (char *)&v65 + 4 * v14;
LABEL_19:
    uint64_t v21 = 0;
    unint64_t v22 = (v16 - (char *)&v65) >> 2;
    int v23 = *(_DWORD *)(*result + 28);
    long long v65 = xmmword_18E674C70;
    BOOL v24 = (char *)&a9;
    while (*((_DWORD *)&v65 + v21) != v23)
    {
      if (++v21 == 4) {
        goto LABEL_24;
      }
    }
    BOOL v24 = (char *)&v65 + 4 * v21;
LABEL_24:
    BOOL v13 = v22 >= (v24 - (char *)&v65) >> 2;
  }
  else
  {
    BOOL v13 = v12 >= v10;
  }
  int v25 = !v13;
  uint64_t v17 = *a3;
  unsigned int v26 = *(unsigned __int16 *)(*a3 + 22);
  if (v26 - 1295 <= 4 && v11 < 5)
  {
    BOOL v31 = v10 >= v26;
LABEL_47:
    int v37 = !v31;
    if (v25)
    {
      uint64_t v32 = *result;
      if (v37)
      {
        *uint64_t result = v17;
        *a3 = v32;
        unint64_t v38 = a3 + 1;
        ++result;
LABEL_88:
        uint64_t v39 = v38;
        goto LABEL_89;
      }
      goto LABEL_58;
    }
    if (!v37) {
      return result;
    }
LABEL_54:
    *a2 = v17;
    *a3 = v9;
    uint64_t v39 = a2 + 1;
    uint64_t v40 = a2[1];
    a2[1] = a3[1];
    a3[1] = v40;
    uint64_t v41 = *a2;
    unsigned int v42 = *(unsigned __int16 *)(*a2 + 22);
    if (v42 - 1295 > 4 || (uint64_t v43 = *result, v44 = *(unsigned __int16 *)(*result + 22), v44 - 1295 > 4))
    {
      if (!a4) {
        return result;
      }
      uint64_t v50 = 0;
      int v51 = *(_DWORD *)(v41 + 28);
      long long v65 = xmmword_18E674C70;
      unsigned int v52 = (char *)&a9;
      while (*((_DWORD *)&v65 + v50) != v51)
      {
        if (++v50 == 4) {
          goto LABEL_73;
        }
      }
      unsigned int v52 = (char *)&v65 + 4 * v50;
LABEL_73:
      uint64_t v56 = 0;
      unint64_t v57 = (v52 - (char *)&v65) >> 2;
      uint64_t v43 = *result;
      int v58 = *(_DWORD *)(*result + 28);
      long long v65 = xmmword_18E674C70;
      int v59 = (char *)&a9;
      while (*((_DWORD *)&v65 + v56) != v58)
      {
        if (++v56 == 4) {
          goto LABEL_78;
        }
      }
      int v59 = (char *)&v65 + 4 * v56;
LABEL_78:
      if (v57 >= (v59 - (char *)&v65) >> 2) {
        return result;
      }
    }
    else if (v44 >= v42)
    {
      return result;
    }
    *result++ = v41;
    *a2 = v43;
LABEL_89:
    uint64_t v64 = *result;
    *uint64_t result = *v39;
    *uint64_t v39 = v64;
    return result;
  }
  if (a4)
  {
    uint64_t v28 = 0;
    int v29 = *(_DWORD *)(v17 + 28);
    long long v65 = xmmword_18E674C70;
    uint64_t v30 = (char *)&a9;
    while (*((_DWORD *)&v65 + v28) != v29)
    {
      if (++v28 == 4) {
        goto LABEL_41;
      }
    }
    uint64_t v30 = (char *)&v65 + 4 * v28;
LABEL_41:
    uint64_t v33 = 0;
    unint64_t v34 = (v30 - (char *)&v65) >> 2;
    int v35 = *(_DWORD *)(v9 + 28);
    long long v65 = xmmword_18E674C70;
    uint64_t v36 = (char *)&a9;
    while (*((_DWORD *)&v65 + v33) != v35)
    {
      if (++v33 == 4) {
        goto LABEL_46;
      }
    }
    uint64_t v36 = (char *)&v65 + 4 * v33;
LABEL_46:
    BOOL v31 = v34 >= (v36 - (char *)&v65) >> 2;
    goto LABEL_47;
  }
  if (!v25) {
    return result;
  }
  uint64_t v32 = *result;
LABEL_58:
  *uint64_t result = v9;
  *a2 = v32;
  uint64_t v45 = result[1];
  result[1] = a2[1];
  a2[1] = v45;
  uint64_t v46 = *a3;
  unsigned int v47 = *(unsigned __int16 *)(*a3 + 22);
  if (v47 - 1295 <= 4)
  {
    uint64_t v48 = *a2;
    unsigned int v49 = *(unsigned __int16 *)(*a2 + 22);
    if (v49 - 1295 <= 4)
    {
      if (v49 >= v47) {
        return result;
      }
LABEL_87:
      *a2 = v46;
      *a3 = v48;
      unint64_t v38 = a3 + 1;
      uint64_t result = a2 + 1;
      goto LABEL_88;
    }
  }
  if (a4)
  {
    uint64_t v53 = 0;
    int v54 = *(_DWORD *)(v46 + 28);
    long long v65 = xmmword_18E674C70;
    int v55 = (char *)&a9;
    while (*((_DWORD *)&v65 + v53) != v54)
    {
      if (++v53 == 4) {
        goto LABEL_81;
      }
    }
    int v55 = (char *)&v65 + 4 * v53;
LABEL_81:
    uint64_t v60 = 0;
    unint64_t v61 = (v55 - (char *)&v65) >> 2;
    uint64_t v48 = *a2;
    int v62 = *(_DWORD *)(*a2 + 28);
    long long v65 = xmmword_18E674C70;
    uint64_t v63 = (char *)&a9;
    while (*((_DWORD *)&v65 + v60) != v62)
    {
      if (++v60 == 4) {
        goto LABEL_86;
      }
    }
    uint64_t v63 = (char *)&v65 + 4 * v60;
LABEL_86:
    if (v61 < (v63 - (char *)&v65) >> 2) {
      goto LABEL_87;
    }
  }
  return result;
}

void *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(void *a1, void *a2, void *a3, void *a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, a2, a3, *a5, (uint64_t)a5, a6, a7, a8, v50);
  uint64_t v14 = *a4;
  unsigned int v15 = *(unsigned __int16 *)(*a4 + 22);
  if (v15 - 1295 > 4 || (v16 = *a3, unsigned int v17 = *(unsigned __int16 *)(*a3 + 22), v17 - 1295 > 4))
  {
    if (!*a5) {
      return result;
    }
    uint64_t v18 = 0;
    int v19 = *(_DWORD *)(v14 + 28);
    long long v50 = xmmword_18E674C70;
    unint64_t v20 = (char *)&v51;
    while (*((_DWORD *)&v50 + v18) != v19)
    {
      if (++v18 == 4) {
        goto LABEL_11;
      }
    }
    unint64_t v20 = (char *)&v50 + 4 * v18;
LABEL_11:
    uint64_t v21 = 0;
    unint64_t v22 = (v20 - (char *)&v50) >> 2;
    uint64_t v16 = *a3;
    int v23 = *(_DWORD *)(*a3 + 28);
    long long v50 = xmmword_18E674C70;
    BOOL v24 = (char *)&v51;
    while (*((_DWORD *)&v50 + v21) != v23)
    {
      if (++v21 == 4) {
        goto LABEL_16;
      }
    }
    BOOL v24 = (char *)&v50 + 4 * v21;
LABEL_16:
    if (v22 >= (v24 - (char *)&v50) >> 2) {
      return result;
    }
  }
  else if (v17 >= v15)
  {
    return result;
  }
  *a3 = v14;
  *a4 = v16;
  uint64_t v25 = a3[1];
  a3[1] = a4[1];
  a4[1] = v25;
  uint64_t v26 = *a3;
  unsigned int v27 = *(unsigned __int16 *)(*a3 + 22);
  if (v27 - 1295 > 4 || (uint64_t v28 = *a2, v29 = *(unsigned __int16 *)(*a2 + 22), v29 - 1295 > 4))
  {
    if (!*a5) {
      return result;
    }
    uint64_t v30 = 0;
    int v31 = *(_DWORD *)(v26 + 28);
    long long v50 = xmmword_18E674C70;
    uint64_t v32 = (char *)&v51;
    while (*((_DWORD *)&v50 + v30) != v31)
    {
      if (++v30 == 4) {
        goto LABEL_27;
      }
    }
    uint64_t v32 = (char *)&v50 + 4 * v30;
LABEL_27:
    uint64_t v33 = 0;
    unint64_t v34 = (v32 - (char *)&v50) >> 2;
    uint64_t v28 = *a2;
    int v35 = *(_DWORD *)(*a2 + 28);
    long long v50 = xmmword_18E674C70;
    uint64_t v36 = (char *)&v51;
    while (*((_DWORD *)&v50 + v33) != v35)
    {
      if (++v33 == 4) {
        goto LABEL_32;
      }
    }
    uint64_t v36 = (char *)&v50 + 4 * v33;
LABEL_32:
    if (v34 >= (v36 - (char *)&v50) >> 2) {
      return result;
    }
  }
  else if (v29 >= v27)
  {
    return result;
  }
  *a2 = v26;
  *a3 = v28;
  uint64_t v37 = a2[1];
  a2[1] = a3[1];
  a3[1] = v37;
  uint64_t v38 = *a2;
  unsigned int v39 = *(unsigned __int16 *)(*a2 + 22);
  if (v39 - 1295 <= 4)
  {
    uint64_t v40 = *a1;
    unsigned int v41 = *(unsigned __int16 *)(*a1 + 22);
    if (v41 - 1295 <= 4)
    {
      if (v41 >= v39) {
        return result;
      }
LABEL_49:
      *a1 = v38;
      *a2 = v40;
      uint64_t v49 = a1[1];
      a1[1] = a2[1];
      a2[1] = v49;
      return result;
    }
  }
  if (*a5)
  {
    uint64_t v42 = 0;
    int v43 = *(_DWORD *)(v38 + 28);
    long long v50 = xmmword_18E674C70;
    unsigned int v44 = (char *)&v51;
    while (*((_DWORD *)&v50 + v42) != v43)
    {
      if (++v42 == 4) {
        goto LABEL_43;
      }
    }
    unsigned int v44 = (char *)&v50 + 4 * v42;
LABEL_43:
    uint64_t v45 = 0;
    unint64_t v46 = (v44 - (char *)&v50) >> 2;
    uint64_t v40 = *a1;
    int v47 = *(_DWORD *)(*a1 + 28);
    long long v50 = xmmword_18E674C70;
    uint64_t v48 = (char *)&v51;
    while (*((_DWORD *)&v50 + v45) != v47)
    {
      if (++v45 == 4) {
        goto LABEL_48;
      }
    }
    uint64_t v48 = (char *)&v50 + 4 * v45;
LABEL_48:
    if (v46 < (v48 - (char *)&v50) >> 2) {
      goto LABEL_49;
    }
  }
  return result;
}

void *std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,0>(void *a1, void *a2, void *a3, void *a4, void *a5, char *a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, a2, a3, a4, a6, (uint64_t)a6, a7, a8);
  uint64_t v15 = *a5;
  unsigned int v16 = *(unsigned __int16 *)(*a5 + 22);
  if (v16 - 1295 > 4 || (uint64_t v17 = *a4, v18 = *(unsigned __int16 *)(*a4 + 22), v18 - 1295 > 4))
  {
    if (!*a6) {
      return result;
    }
    uint64_t v19 = 0;
    int v20 = *(_DWORD *)(v15 + 28);
    long long v63 = xmmword_18E674C70;
    uint64_t v21 = (char *)&v64;
    while (*((_DWORD *)&v63 + v19) != v20)
    {
      if (++v19 == 4) {
        goto LABEL_11;
      }
    }
    uint64_t v21 = (char *)&v63 + 4 * v19;
LABEL_11:
    uint64_t v22 = 0;
    unint64_t v23 = (v21 - (char *)&v63) >> 2;
    uint64_t v17 = *a4;
    int v24 = *(_DWORD *)(*a4 + 28);
    long long v63 = xmmword_18E674C70;
    uint64_t v25 = (char *)&v64;
    while (*((_DWORD *)&v63 + v22) != v24)
    {
      if (++v22 == 4) {
        goto LABEL_16;
      }
    }
    uint64_t v25 = (char *)&v63 + 4 * v22;
LABEL_16:
    if (v23 >= (v25 - (char *)&v63) >> 2) {
      return result;
    }
  }
  else if (v18 >= v16)
  {
    return result;
  }
  *a4 = v15;
  *a5 = v17;
  uint64_t v26 = a4[1];
  a4[1] = a5[1];
  a5[1] = v26;
  uint64_t v27 = *a4;
  unsigned int v28 = *(unsigned __int16 *)(*a4 + 22);
  if (v28 - 1295 > 4 || (uint64_t v29 = *a3, v30 = *(unsigned __int16 *)(*a3 + 22), v30 - 1295 > 4))
  {
    if (!*a6) {
      return result;
    }
    uint64_t v31 = 0;
    int v32 = *(_DWORD *)(v27 + 28);
    long long v63 = xmmword_18E674C70;
    uint64_t v33 = (char *)&v64;
    while (*((_DWORD *)&v63 + v31) != v32)
    {
      if (++v31 == 4) {
        goto LABEL_27;
      }
    }
    uint64_t v33 = (char *)&v63 + 4 * v31;
LABEL_27:
    uint64_t v34 = 0;
    unint64_t v35 = (v33 - (char *)&v63) >> 2;
    uint64_t v29 = *a3;
    int v36 = *(_DWORD *)(*a3 + 28);
    long long v63 = xmmword_18E674C70;
    uint64_t v37 = (char *)&v64;
    while (*((_DWORD *)&v63 + v34) != v36)
    {
      if (++v34 == 4) {
        goto LABEL_32;
      }
    }
    uint64_t v37 = (char *)&v63 + 4 * v34;
LABEL_32:
    if (v35 >= (v37 - (char *)&v63) >> 2) {
      return result;
    }
  }
  else if (v30 >= v28)
  {
    return result;
  }
  *a3 = v27;
  *a4 = v29;
  uint64_t v38 = a3[1];
  a3[1] = a4[1];
  a4[1] = v38;
  uint64_t v39 = *a3;
  unsigned int v40 = *(unsigned __int16 *)(*a3 + 22);
  if (v40 - 1295 > 4 || (uint64_t v41 = *a2, v42 = *(unsigned __int16 *)(*a2 + 22), v42 - 1295 > 4))
  {
    if (!*a6) {
      return result;
    }
    uint64_t v43 = 0;
    int v44 = *(_DWORD *)(v39 + 28);
    long long v63 = xmmword_18E674C70;
    uint64_t v45 = (char *)&v64;
    while (*((_DWORD *)&v63 + v43) != v44)
    {
      if (++v43 == 4) {
        goto LABEL_43;
      }
    }
    uint64_t v45 = (char *)&v63 + 4 * v43;
LABEL_43:
    uint64_t v46 = 0;
    unint64_t v47 = (v45 - (char *)&v63) >> 2;
    uint64_t v41 = *a2;
    int v48 = *(_DWORD *)(*a2 + 28);
    long long v63 = xmmword_18E674C70;
    uint64_t v49 = (char *)&v64;
    while (*((_DWORD *)&v63 + v46) != v48)
    {
      if (++v46 == 4) {
        goto LABEL_48;
      }
    }
    uint64_t v49 = (char *)&v63 + 4 * v46;
LABEL_48:
    if (v47 >= (v49 - (char *)&v63) >> 2) {
      return result;
    }
  }
  else if (v42 >= v40)
  {
    return result;
  }
  *a2 = v39;
  *a3 = v41;
  uint64_t v50 = a2[1];
  a2[1] = a3[1];
  a3[1] = v50;
  uint64_t v51 = *a2;
  unsigned int v52 = *(unsigned __int16 *)(*a2 + 22);
  if (v52 - 1295 <= 4)
  {
    uint64_t v53 = *a1;
    unsigned int v54 = *(unsigned __int16 *)(*a1 + 22);
    if (v54 - 1295 <= 4)
    {
      if (v54 >= v52) {
        return result;
      }
LABEL_65:
      *a1 = v51;
      *a2 = v53;
      uint64_t v62 = a1[1];
      a1[1] = a2[1];
      a2[1] = v62;
      return result;
    }
  }
  if (*a6)
  {
    uint64_t v55 = 0;
    int v56 = *(_DWORD *)(v51 + 28);
    long long v63 = xmmword_18E674C70;
    unint64_t v57 = (char *)&v64;
    while (*((_DWORD *)&v63 + v55) != v56)
    {
      if (++v55 == 4) {
        goto LABEL_59;
      }
    }
    unint64_t v57 = (char *)&v63 + 4 * v55;
LABEL_59:
    uint64_t v58 = 0;
    unint64_t v59 = (v57 - (char *)&v63) >> 2;
    uint64_t v53 = *a1;
    int v60 = *(_DWORD *)(*a1 + 28);
    long long v63 = xmmword_18E674C70;
    unint64_t v61 = (char *)&v64;
    while (*((_DWORD *)&v63 + v58) != v60)
    {
      if (++v58 == 4) {
        goto LABEL_64;
      }
    }
    unint64_t v61 = (char *)&v63 + 4 * v58;
LABEL_64:
    if (v59 < (v61 - (char *)&v63) >> 2) {
      goto LABEL_65;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(char *a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (a2 - a1) >> 4;
  BOOL result = 1;
  switch(v11)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v13 = *((void *)a2 - 2);
      unsigned int v14 = *(unsigned __int16 *)(v13 + 22);
      if (v14 - 1295 <= 4)
      {
        uint64_t v15 = *(void *)a1;
        unsigned int v16 = *(unsigned __int16 *)(*(void *)a1 + 22);
        if (v16 - 1295 <= 4)
        {
          if (v16 >= v14) {
            return result;
          }
LABEL_66:
          *(void *)a1 = v13;
          *((void *)a2 - 2) = v15;
          uint64_t v53 = *((void *)a1 + 1);
          *((void *)a1 + 1) = *((void *)a2 - 1);
          *((void *)a2 - 1) = v53;
          return 1;
        }
      }
      if (*a3)
      {
        uint64_t v46 = 0;
        int v47 = *(_DWORD *)(v13 + 28);
        long long v56 = xmmword_18E674C70;
        int v48 = (char *)&v57;
        while (*((_DWORD *)&v56 + v46) != v47)
        {
          if (++v46 == 4) {
            goto LABEL_60;
          }
        }
        int v48 = (char *)&v56 + 4 * v46;
LABEL_60:
        uint64_t v49 = 0;
        unint64_t v50 = (v48 - (char *)&v56) >> 2;
        uint64_t v15 = *(void *)a1;
        int v51 = *(_DWORD *)(*(void *)a1 + 28);
        long long v56 = xmmword_18E674C70;
        unsigned int v52 = (char *)&v57;
        while (*((_DWORD *)&v56 + v49) != v51)
        {
          if (++v49 == 4) {
            goto LABEL_65;
          }
        }
        unsigned int v52 = (char *)&v56 + 4 * v49;
LABEL_65:
        if (v50 >= (v52 - (char *)&v56) >> 2) {
          return 1;
        }
        goto LABEL_66;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, (void *)a1 + 2, (void *)a2 - 2, *a3, a5, a6, a7, a8, v54);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, (void *)a1 + 2, (void *)a1 + 4, (void *)a2 - 2, a3, a6, a7, a8);
      return 1;
    case 5:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,0>(a1, (void *)a1 + 2, (void *)a1 + 4, (void *)a1 + 6, (void *)a2 - 2, a3, a7, a8);
      return 1;
    default:
      uint64_t v17 = a1 + 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, (void *)a1 + 2, (void *)a1 + 4, *a3, a5, a6, a7, a8, v54);
      unsigned int v18 = a1 + 48;
      if (a1 + 48 == a2) {
        return 1;
      }
      int v19 = 0;
      long long v20 = xmmword_18E674C70;
      while (2)
      {
        unsigned int v21 = *(unsigned __int16 *)(*(void *)v18 + 22);
        if (v21 - 1295 > 4 || (unsigned int v22 = *(unsigned __int16 *)(*(void *)v17 + 22), v22 - 1295 > 4))
        {
          if (!*a3) {
            goto LABEL_49;
          }
          uint64_t v23 = 0;
          int v24 = *(_DWORD *)(*(void *)v18 + 28);
          long long v56 = v20;
          while (*((_DWORD *)&v56 + v23) != v24)
          {
            if (++v23 == 4)
            {
              uint64_t v25 = (char *)&v57;
              goto LABEL_18;
            }
          }
          uint64_t v25 = (char *)&v56 + 4 * v23;
LABEL_18:
          uint64_t v26 = 0;
          unint64_t v27 = (v25 - (char *)&v56) >> 2;
          int v28 = *(_DWORD *)(*(void *)v17 + 28);
          long long v56 = v20;
          while (*((_DWORD *)&v56 + v26) != v28)
          {
            if (++v26 == 4)
            {
              uint64_t v29 = (char *)&v57;
              goto LABEL_23;
            }
          }
          uint64_t v29 = (char *)&v56 + 4 * v26;
LABEL_23:
          if (v27 >= (v29 - (char *)&v56) >> 2) {
            goto LABEL_49;
          }
        }
        else if (v22 >= v21)
        {
          goto LABEL_49;
        }
        long long v30 = *(_OWORD *)v18;
        *(void *)unsigned int v18 = 0;
        *((void *)v18 + 1) = 0;
        long long v55 = v30;
        uint64_t v31 = v30;
        int v32 = v18;
        while (1)
        {
          uint64_t v33 = v32;
          int v32 = v17;
          long long v34 = *(_OWORD *)v17;
          *(void *)uint64_t v17 = 0;
          *((void *)v17 + 1) = 0;
          unint64_t v35 = (std::__shared_weak_count *)*((void *)v33 + 1);
          *(_OWORD *)uint64_t v33 = v34;
          if (v35)
          {
            std::__shared_weak_count::__release_shared[abi:ne180100](v35);
            long long v20 = xmmword_18E674C70;
          }
          if (v17 == a1) {
            break;
          }
          v17 -= 16;
          unsigned int v36 = *(unsigned __int16 *)(v31 + 22);
          if (v36 - 1295 > 4 || (unsigned int v37 = *(unsigned __int16 *)(*(void *)v17 + 22), v37 - 1295 > 4))
          {
            if (!*a3) {
              goto LABEL_46;
            }
            uint64_t v38 = 0;
            int v39 = *(_DWORD *)(v31 + 28);
            long long v56 = v20;
            while (*((_DWORD *)&v56 + v38) != v39)
            {
              if (++v38 == 4)
              {
                unsigned int v40 = (char *)&v57;
                goto LABEL_38;
              }
            }
            unsigned int v40 = (char *)&v56 + 4 * v38;
LABEL_38:
            uint64_t v41 = 0;
            unint64_t v42 = (v40 - (char *)&v56) >> 2;
            int v43 = *(_DWORD *)(*(void *)v17 + 28);
            long long v56 = v20;
            while (*((_DWORD *)&v56 + v41) != v43)
            {
              if (++v41 == 4)
              {
                int v44 = (char *)&v57;
                goto LABEL_43;
              }
            }
            int v44 = (char *)&v56 + 4 * v41;
LABEL_43:
            if (v42 >= (v44 - (char *)&v56) >> 2) {
              goto LABEL_46;
            }
          }
          else if (v37 >= v36)
          {
            goto LABEL_46;
          }
        }
        int v32 = a1;
LABEL_46:
        uint64_t v45 = (std::__shared_weak_count *)*((void *)v32 + 1);
        *(_OWORD *)int v32 = v55;
        if (v45)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v45);
          long long v20 = xmmword_18E674C70;
        }
        if (++v19 == 8) {
          return v18 + 16 == a2;
        }
LABEL_49:
        uint64_t v17 = v18;
        v18 += 16;
        if (v18 == a2) {
          return 1;
        }
        continue;
      }
  }
}

BOOL CEM::EmojiLocaleData::emojiIndexIsSupported(uint64_t a1, int a2, unsigned int a3)
{
  if ((CEM::EmojiData::isValidIndex(*(CEM::EmojiData **)(a1 + 96), a3) & 1) == 0)
  {
    unint64_t v6 = *(CEM::EmojiData **)(a1 + 104);
    if (!v6 || !CEM::EmojiData::isValidIndex(v6, a3)) {
      return 0;
    }
  }
  if (a2 != 1) {
    return 1;
  }
  uint64_t v7 = *(unsigned __int8 *)(a1 + 71);
  int v8 = (char)v7;
  if ((v7 & 0x80u) != 0) {
    uint64_t v7 = *(void *)(a1 + 56);
  }
  if (v7 == 2)
  {
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = a1 + 48;
    uint64_t v9 = v11;
    unsigned int v12 = (_WORD *)(v8 >= 0 ? v10 : v9);
    if (*v12 == 24938) {
      return 1;
    }
  }
  uint64_t v13 = operator new(0x1AuLL);
  *uint64_t v13 = xmmword_18E67564A;
  *(_OWORD *)((char *)v13 + 1std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100]((uint64_t *)this + 7, 0) = *(long long *)((char *)&xmmword_18E67564A + 10);
  unint64_t v14 = 13;
  uint64_t v15 = (unsigned __int16 *)v13;
  do
  {
    unint64_t v16 = v14 >> 1;
    uint64_t v17 = &v15[v14 >> 1];
    unsigned int v19 = *v17;
    unsigned int v18 = v17 + 1;
    v14 += ~(v14 >> 1);
    if (v19 < a3) {
      uint64_t v15 = v18;
    }
    else {
      unint64_t v14 = v16;
    }
  }
  while (v14);
  BOOL v20 = v15 == (unsigned __int16 *)((char *)v13 + 26) || *v15 > a3;
  operator delete(v13);
  return v20;
}

void *std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::target_type()
{
}

uint64_t std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK3CEM15EmojiLocaleData39enumerateSearchResultsInStringWithBlockEPK10__CFString7CFRangem18CEMEmojiSearchTypebU13block_pointerFvRKNSt3__16vectorINS6_10shared_ptrINS_10EmojiTokenEEENS6_9allocatorISA_EEEES4_PbEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

BOOL std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::operator()(uint64_t a1, CFIndex *a2)
{
  CFIndex v2 = *a2;
  if (*(void *)(a1 + 16) == v2) {
    return 1;
  }
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 8), v2);
  return isWhitespace(CharacterAtIndex);
}

__n128 std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EDD69688;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = result;
  return result;
}

__n128 std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::__clone(uint64_t a1)
{
  CFIndex v2 = (char *)operator new(0x18uLL);
  *(void *)CFIndex v2 = &unk_1EDD69688;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = result;
  return result;
}

void std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::~__func()
{
}

void CEM::EmojiLocaleData::exactMatchEmojiTokensForSingleWord(uint64_t *a1, uint64_t a2, const __CFString *a3, const __CFString *a4, int a5, uint64_t *a6, int a7)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  CFLocaleGetValue(*(CFLocaleRef *)(a2 + 32), (CFLocaleKey)*MEMORY[0x1E4F1D218]);
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  uint64_t v14 = *a6;
  if (!v14) {
    goto LABEL_66;
  }
  int v66 = a5;
  CEM::getUTF8StringFromCFString(&__p, a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v64, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v64 = __p;
  }
  std::string::basic_string[abi:ne180100]<0>(v60, "’");
  std::string::basic_string[abi:ne180100]<0>(&v56, "'");
  CEM::replace((uint64_t)&v67, &v64, (uint64_t)v60, (uint64_t)&v56);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = v67;
  if (v57.__r_.__value_.__s.__data_[15] < 0) {
    operator delete(v56);
  }
  if (SBYTE7(v61) < 0) {
    operator delete(v60[0]);
  }
  if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v64.__r_.__value_.__l.__data_);
  }
  uint64_t v15 = *(unsigned __int8 *)(v14 + 119);
  int v16 = (char)v15;
  if ((v15 & 0x80u) != 0) {
    uint64_t v15 = *(void *)(v14 + 104);
  }
  CFStringRef v55 = a3;
  if (v15 == 2)
  {
    if (v16 >= 0) {
      uint64_t v17 = (unsigned __int16 *)(v14 + 96);
    }
    else {
      uint64_t v17 = *(unsigned __int16 **)(v14 + 96);
    }
    int v18 = *v17;
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    unsigned __int8 v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if (v18 == 28261 && a5 == 1)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      if (size == 2)
      {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        long long v23 = 0uLL;
        if (LOWORD(p_p->__r_.__value_.__l.__data_) == 24947 || LOWORD(p_p->__r_.__value_.__l.__data_) == 25971) {
          goto LABEL_46;
        }
      }
    }
  }
  else
  {
    unsigned __int8 v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  int v24 = (char)v20;
  if ((v20 & 0x80u) == 0) {
    std::string::size_type v25 = v20;
  }
  else {
    std::string::size_type v25 = __p.__r_.__value_.__l.__size_;
  }
  long long v23 = 0uLL;
  if (v25 != 1)
  {
    int v26 = a5;
    if (!a5)
    {
      int v26 = 2;
      int v66 = 2;
    }
    v62[0] = 0;
    v62[1] = 0;
    uint64_t v63 = 0;
    if (a7)
    {
      std::string::size_type v27 = __p.__r_.__value_.__r.__words[0];
      int v28 = (char *)operator new(0x20uLL);
      if (v24 >= 0) {
        uint64_t v29 = &__p;
      }
      else {
        uint64_t v29 = (std::string *)v27;
      }
      *(void *)int v28 = &unk_1EDD69738;
      *((void *)v28 + 1) = v14;
      *((void *)v28 + 2) = &v66;
      *((void *)v28 + 3) = v62;
      uint64_t v68 = v28;
      trie::MarisaTrie<unsigned int,char>::enumerateCompletions(v14 + 16, (uint64_t)v29, v25, (uint64_t)&v67, 0xFFFFFFFFLL);
      std::__function::__value_func<void ()(unsigned int,std::string_view,BOOL &)>::~__value_func[abi:ne180100](&v67);
LABEL_44:
      long long v23 = *(_OWORD *)v62;
LABEL_45:
      unsigned __int8 v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      goto LABEL_46;
    }
    *(_OWORD *)int v60 = 0uLL;
    long long v61 = 0uLL;
    if ((v20 & 0x80u) == 0) {
      unint64_t v50 = &__p;
    }
    else {
      unint64_t v50 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(v14 + 32), (uint64_t)v50, v25, (uint64_t)v60, &v67);
    if (SHIBYTE(v61) < 0) {
      operator delete(v60[1]);
    }
    if (v67.__r_.__value_.__r.__words[0] == 0xFFFFFFFF)
    {
LABEL_83:
      if (SHIBYTE(v68) < 0) {
        operator delete((void *)v67.__r_.__value_.__l.__size_);
      }
      long long v23 = 0uLL;
      if (v62[0])
      {
        v62[1] = v62[0];
        operator delete(v62[0]);
        long long v23 = 0uLL;
      }
      goto LABEL_45;
    }
    if (a4)
    {
      internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(v14 + 32), (uint64_t)"_", 1uLL, (uint64_t)&v67, v60);
      if (v60[0] != (void *)0xFFFFFFFFLL)
      {
        CEM::getUTF8StringFromCFString(v58, a4);
        if ((v59 & 0x80u) == 0) {
          int v51 = v58;
        }
        else {
          int v51 = (void **)v58[0];
        }
        if ((v59 & 0x80u) == 0) {
          unint64_t v52 = v59;
        }
        else {
          unint64_t v52 = (unint64_t)v58[1];
        }
        internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(v14 + 32), (uint64_t)v51, v52, (uint64_t)v60, &v56);
        v60[0] = v56;
        std::string::operator=((std::string *)&v60[1], &v57);
        if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v57.__r_.__value_.__l.__data_);
        }
        uint64_t v53 = v60[0];
        if (v60[0] != (void *)0xFFFFFFFFLL)
        {
          v67.__r_.__value_.__l.__data_ = (std::string::pointer)v60[0];
          std::string::operator=((std::string *)&v67.__r_.__value_.__r.__words[1], (const std::string *)&v60[1]);
        }
        if ((char)v59 < 0) {
          operator delete(v58[0]);
        }
        if (v53 == (void *)0xFFFFFFFFLL)
        {
          if (SHIBYTE(v61) < 0) {
            operator delete(v60[1]);
          }
          goto LABEL_83;
        }
      }
      if (SHIBYTE(v61) < 0) {
        operator delete(v60[1]);
      }
    }
    LODWORD(v60[0]) = 0;
    if (CEM::EmojiSearchTrie::getPayload(v14, (uint64_t)&v67, v26, v60)) {
      CEM::EmojiSearchTrie::payloadToIndexes((uint64_t *)v14, v60[0], (uint64_t)v62);
    }
    if (SHIBYTE(v68) < 0) {
      operator delete((void *)v67.__r_.__value_.__l.__size_);
    }
    goto LABEL_44;
  }
LABEL_46:
  if ((v20 & 0x80) != 0)
  {
    long long v54 = v23;
    operator delete(__p.__r_.__value_.__l.__data_);
    long long v23 = v54;
  }
  long long v30 = v23;
  if ((void)v23 != *((void *)&v23 + 1))
  {
    uint64_t v31 = (unsigned __int16 *)v23;
    do
    {
      CEM::EmojiLocaleData::createEmojiToken(v60, a2, a5, *v31);
      if (v60[0])
      {
        int v32 = (void **)a1[1];
        unint64_t v33 = a1[2];
        if ((unint64_t)v32 >= v33)
        {
          uint64_t v35 = ((uint64_t)v32 - *a1) >> 4;
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v37 = v33 - *a1;
          if (v37 >> 3 > v36) {
            unint64_t v36 = v37 >> 3;
          }
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v38 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v36;
          }
          uint64_t v69 = a1 + 2;
          int v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v38);
          unsigned int v40 = &v39[16 * v35];
          v67.__r_.__value_.__r.__words[0] = (std::string::size_type)v39;
          v67.__r_.__value_.__l.__size_ = (std::string::size_type)v40;
          uint64_t v68 = &v39[16 * v41];
          *(_OWORD *)unsigned int v40 = *(_OWORD *)v60;
          v67.__r_.__value_.__r.__words[2] = (std::string::size_type)(v40 + 16);
          std::vector<std::shared_ptr<CEM::EmojiToken>>::__swap_out_circular_buffer(a1, &v67);
          long long v34 = (void **)a1[1];
          std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)&v67);
        }
        else
        {
          *int v32 = v60[0];
          v32[1] = v60[1];
          long long v34 = v32 + 2;
          a1[1] = (uint64_t)(v32 + 2);
        }
        a1[1] = (uint64_t)v34;
      }
      else if (v60[1])
      {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v60[1]);
      }
      ++v31;
    }
    while (v31 != *((unsigned __int16 **)&v30 + 1));
  }
  a3 = v55;
  if ((void)v30) {
    operator delete((void *)v30);
  }
LABEL_66:
  CEM::getUTF8StringFromCFString(&v67, a3);
  if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unint64_t v42 = &v67;
  }
  else {
    unint64_t v42 = (std::string *)v67.__r_.__value_.__r.__words[0];
  }
  if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v43 = HIBYTE(v67.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v43 = v67.__r_.__value_.__l.__size_;
  }
  CEM::AdaptationController::sortEmojiTokensIfEnabled(a2 + 112, (uint64_t)v42, v43, a1);
  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v67.__r_.__value_.__l.__data_);
  }
  if ((a5 - 7) <= 0xFFFFFFFC) {
    sortEmojiTokens((char **)a1, *(unsigned char *)(a2 + 784), v44, v45, v46, v47, v48, v49);
  }
}

void sub_18E670BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, int a14, __int16 a15, char a16, char a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,void *a29,int a30,__int16 a31,char a32,char a33,int a34,__int16 a35,char a36,char a37,void *a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,uint64_t a48,void *a49,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  if (a37 < 0) {
    operator delete(a29);
  }
  if (*(char *)(v54 - 113) < 0) {
    operator delete(*(void **)(v54 - 136));
  }
  if (a38)
  {
    a39 = (uint64_t)a38;
    operator delete(a38);
  }
  if (a54 < 0) {
    operator delete(a49);
  }
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a28);
  _Unwind_Resume(a1);
}

void *CEM::getUTF8StringFromCFString(void *this, CFStringRef theString)
{
  CFIndex v2 = this;
  if (theString)
  {
    CStringPtr = (char *)CFStringGetCStringPtr(theString, 0x8000100u);
    if (!CStringPtr)
    {
      CFIndex Length = CFStringGetLength(theString);
      CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      operator new[]();
    }
    return std::string::basic_string[abi:ne180100]<0>(v2, CStringPtr);
  }
  else
  {
    *this = 0;
    this[1] = 0;
    this[2] = 0;
  }
  return this;
}

void sub_18E670E58(_Unwind_Exception *a1)
{
  MEMORY[0x192FAF290](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void *std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<char *>,std::__wrap_iter<char *>>(void *result, char *a2, char *a3, unint64_t a4)
{
  uint64_t v4 = result;
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
    __n128 result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *uint64_t v4 = result;
    uint64_t v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)uint64_t v4 = v10;
    uint64_t v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)uint64_t v4 = 0;
  return result;
}

std::vector<std::string> **std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](std::vector<std::string> **a1, long long *a2)
{
  uint64_t v4 = *a1;
  std::vector<std::string>::pointer end = (*a1)->__end_;
  p_end_cap = (std::allocator<std::string> *)&(*a1)->__end_cap_;
  if ((unint64_t)end >= *(void *)p_end_cap)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)v4->__begin_) >> 3);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    if (0x5555555555555556 * ((uint64_t)(*(void *)p_end_cap - (unint64_t)v4->__begin_) >> 3) > v10) {
      unint64_t v10 = 0x5555555555555556 * ((uint64_t)(*(void *)p_end_cap - (unint64_t)v4->__begin_) >> 3);
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)p_end_cap - (unint64_t)v4->__begin_) >> 3) >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v10;
    }
    __v.__end_cap_.__value_ = p_end_cap;
    if (v11) {
      unint64_t v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v11);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = (std::string *)(v11 + 24 * v9);
    __v.__first_ = (std::__split_buffer<std::string>::pointer)v11;
    __v.__begin_ = v13;
    __v.__end_cap_.__value_ = (std::string *)(v11 + 24 * v12);
    long long v14 = *a2;
    v13->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    __v.__end_ = v13 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(v4, &__v);
    uint64_t v8 = v4->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
  }
  else
  {
    long long v7 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v7;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    uint64_t v8 = end + 1;
  }
  v4->__end_ = v8;
  return a1;
}

BOOL CEM::deviceIsChinese(CEM *this)
{
  if (CEM::getDeviceRegionCode(void)::onceToken != -1) {
    dispatch_once(&CEM::getDeviceRegionCode(void)::onceToken, &__block_literal_global_53);
  }
  return !CEM::getDeviceRegionCode(void)::__regionCode
      || CFEqual((CFStringRef)CEM::getDeviceRegionCode(void)::__regionCode, @"CH");
}

void *___ZN3CEML19getDeviceRegionCodeEv_block_invoke()
{
  __n128 result = dlopen("/usr/lib/libMobileGestalt.dylib", 261);
  if (result)
  {
    __n128 result = dlsym(result, "MGCopyAnswer");
    if (result) {
      __n128 result = (void *)((uint64_t (*)(__CFString *, void))result)(@"RegionCode", 0);
    }
  }
  CEM::getDeviceRegionCode(void)::__regionCode = (uint64_t)result;
  return result;
}

BOOL CEM::shouldShowTaiwanFlagEmoji(CEM *this)
{
  if (CEM::shouldShowTaiwanFlagEmoji(void)::onceToken != -1) {
    dispatch_once(&CEM::shouldShowTaiwanFlagEmoji(void)::onceToken, &__block_literal_global_209);
  }
  if (CEM::shouldShowTaiwanFlagEmoji(void)::_deviceIsChinese) {
    return 0;
  }
  CFLocaleRef v2 = CFLocaleCopyCurrent();
  if (!v2) {
    return 1;
  }
  CFLocaleRef v3 = v2;
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
  if (Value) {
    BOOL v1 = CFStringCompare(Value, @"CN", 0) != kCFCompareEqualTo;
  }
  else {
    BOOL v1 = 1;
  }
  CFRelease(v3);
  return v1;
}

void sub_18E6711C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL ___ZN3CEM25shouldShowTaiwanFlagEmojiEv_block_invoke(CEM *a1)
{
  BOOL result = CEM::deviceIsChinese(a1);
  CEM::shouldShowTaiwanFlagEmoji(void)::_deviceBOOL IsChinese = result;
  return result;
}

const __CFString *CEM::copyPreferredLocaleIdentifierFromFrameworkBundleWithLocale(CEM *this, __CFBundle *a2, const __CFLocale *a3)
{
  CFStringRef ValueAtIndex = 0;
  if (!this || !a2) {
    return ValueAtIndex;
  }
  CFLocaleRef OverrideLocaleForLocale = CEM::createOverrideLocaleForLocale(a2, a2);
  CFLocaleRef v7 = OverrideLocaleForLocale;
  values[0] = 0;
  values[1] = OverrideLocaleForLocale;
  if (OverrideLocaleForLocale) {
    CFLocaleRef v8 = OverrideLocaleForLocale;
  }
  else {
    CFLocaleRef v8 = a2;
  }
  values[0] = (void *)MEMORY[0x192FAEE00](v8);
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)values, 1, MEMORY[0x1E4F1D510]);
  CFArrayRef v11 = CFBundleCopyBundleLocalizations(this);
  CFArrayRef v12 = CFBundleCopyLocalizationsForPreferences(v11, v10);
  CFArrayRef v13 = v12;
  if (v12 && !CFArrayGetCount(v12))
  {
    CFStringRef ValueAtIndex = 0;
  }
  else
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v13, 0);
    CFLocaleRef v14 = CFLocaleCreate(v9, ValueAtIndex);
    CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D218];
    CFStringRef Value = (const __CFString *)CFLocaleGetValue(v8, (CFLocaleKey)*MEMORY[0x1E4F1D218]);
    CFStringRef v17 = (const __CFString *)CFLocaleGetValue(v14, v15);
    if (CFStringCompare(Value, v17, 0)) {
      CFStringRef ValueAtIndex = 0;
    }
    else {
      CFRetain(ValueAtIndex);
    }
    if (v14) {
      CFRelease(v14);
    }
    if (!v13) {
      goto LABEL_17;
    }
  }
  CFRelease(v13);
LABEL_17:
  if (v11) {
    CFRelease(v11);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFRelease(v7);
  }
  return ValueAtIndex;
}

void sub_18E671398(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  CFLocaleRef v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  char v5 = va_arg(va2, const void *);
  va_copy(va3, va2);
  CFLocaleRef v7 = va_arg(va3, const void *);
  uint64_t v9 = va_arg(va3, void);
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)va);
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)va1);
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)va2);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va3, 0);
  _Unwind_Resume(a1);
}

CFLocaleRef CEM::createOverrideLocaleForLocale(CEM *this, const __CFLocale *a2)
{
  CFStringRef v2 = (const __CFString *)MEMORY[0x192FAEE00](this, a2);
  if (CFStringCompare(v2, @"ars", 0))
  {
    if (CFStringCompare(v2, @"nn", 0))
    {
      if (CFStringCompare(v2, @"yue-Hant", 0))
      {
        if (CFStringCompare(v2, @"en_CA", 0) && CFStringCompare(v2, @"en_JP", 0)) {
          return 0;
        }
        CFStringRef v4 = @"en_US";
      }
      else
      {
        CFStringRef v4 = @"zh_HK";
      }
    }
    else
    {
      CFStringRef v4 = @"nb_NO";
    }
  }
  else
  {
    CFStringRef v4 = @"ar";
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  return CFLocaleCreate(v5, v4);
}

void nlp::CFScopedPtr<__CFArray const*>::reset(const void **a1)
{
  CFStringRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  *a1 = 0;
}

CFLocaleRef CEM::createNormalizedLocale(CEM *this, const __CFLocale *a2)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v3 = (const __CFString *)MEMORY[0x192FAEE00](this, a2);
  CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v2, v3);
  CFStringRef LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(v2, ComponentsFromLocaleIdentifier);
  CFLocaleRef v6 = CFLocaleCreate(v2, LocaleIdentifierFromComponents);
  if (LocaleIdentifierFromComponents) {
    CFRelease(LocaleIdentifierFromComponents);
  }
  if (ComponentsFromLocaleIdentifier) {
    CFRelease(ComponentsFromLocaleIdentifier);
  }
  return v6;
}

void sub_18E6715C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

CFBundleRef CEM::SearchEngineResources::createSearchEngineBundleForLocale(CEM::SearchEngineResources *this, const __CFLocale *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!this) {
    return 0;
  }
  NormalizedLocale = CEM::createNormalizedLocale(this, a2);
  error[1] = NormalizedLocale;
  CFLocaleRef OverrideLocaleForLocale = CEM::createOverrideLocaleForLocale(NormalizedLocale, v3);
  int v18 = OverrideLocaleForLocale;
  if (!OverrideLocaleForLocale) {
    goto LABEL_33;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = MEMORY[0x192FAEE00](NormalizedLocale);
    __int16 v21 = 2112;
    uint64_t v22 = MEMORY[0x192FAEE00](OverrideLocaleForLocale);
    _os_log_impl(&dword_18E64B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Attempting to discover search engine resources by using override locale '%@' for locale '%@'", buf, 0x16u);
  }
  CFBundleRef SearchEngineBundleForLocale = (CFBundleRef)CEM::SearchEngineResources::createSearchEngineBundleForLocale(OverrideLocaleForLocale, v6);
  CFRelease(OverrideLocaleForLocale);
  if (!SearchEngineBundleForLocale)
  {
LABEL_33:
    if (!NormalizedLocale
      || (CFStringRef Value = (const __CFString *)CFLocaleGetValue(NormalizedLocale, (CFLocaleKey)*MEMORY[0x1E4F1D218]),
          CFStringRef v9 = (const __CFString *)CFLocaleGetValue(NormalizedLocale, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]),
          !Value)
      || (CFStringRef v10 = v9, CFStringCompare(Value, @"en", 0))
      || v10 && CFStringCompare(v10, @"US", 0))
    {
      int v18 = 0;
    }
    else
    {
      CFURLRef v11 = CEM::copyResourceURLFromFrameworkBundle((CEM *)@"term_index", @"plist", @"SearchModel-en", 0, v4);
      int v18 = v11;
      if (v11)
      {
LABEL_11:
        CFURLRef propertyValueTypeRefPtr = 0;
        error[0] = 0;
        CFURLCopyResourcePropertyForKey(v11, (CFStringRef)*MEMORY[0x1E4F1D740], &propertyValueTypeRefPtr, error);
        if (error[0])
        {
          CFStringRef v12 = CFErrorCopyDescription(error[0]);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v20 = (uint64_t)v12;
            _os_log_error_impl(&dword_18E64B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not determine parent directory for term index asset URL: '%@'", buf, 0xCu);
          }
          CFRelease(error[0]);
          if (v12) {
            CFRelease(v12);
          }
        }
        CFBundleRef SearchEngineBundleForLocale = CFBundleCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], propertyValueTypeRefPtr);
        CFRelease(propertyValueTypeRefPtr);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = MEMORY[0x192FAEE00](NormalizedLocale);
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v13;
          _os_log_impl(&dword_18E64B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Search engine is supported by locale '%@'", buf, 0xCu);
        }
        CFRelease(v11);
        goto LABEL_19;
      }
    }
    CFURLRef v11 = CEM::copyResourceURLFromFrameworkBundle((CEM *)@"term_index", @"plist", 0, (__CFString *)NormalizedLocale, v4);
    int v18 = v11;
    if (!v11)
    {
      uint64_t v15 = MEMORY[0x192FAEE00](NormalizedLocale);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v15;
        _os_log_error_impl(&dword_18E64B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not find emoji search engine resources for locale '%@'", buf, 0xCu);
      }
      CFBundleRef SearchEngineBundleForLocale = 0;
      if (NormalizedLocale) {
        goto LABEL_20;
      }
      return SearchEngineBundleForLocale;
    }
    goto LABEL_11;
  }
LABEL_19:
  if (NormalizedLocale) {
LABEL_20:
  }
    CFRelease(NormalizedLocale);
  return SearchEngineBundleForLocale;
}

void sub_18E671948(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

os_log_t __cem_logging_get_default_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.CoreEmoji", "StandardLogger");
  cem_logging_get_default_log_log = (uint64_t)result;
  return result;
}

os_log_t __cem_logging_get_adaptation_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.CoreEmoji", "AdaptationLogger");
  cem_logging_get_adaptation_log_log = (uint64_t)result;
  return result;
}

void *_CFInit_EmojiTokenWrapper(void *result)
{
  result[2] = &unk_1EDD6A080;
  result[3] = 0;
  result[4] = 0;
  result[5] = 0;
  return result;
}

void EmojiTokenWrapper::~EmojiTokenWrapper(const void **this)
{
  *this = &unk_1EDD6A080;
  nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(this + 3, 0);
  CFAllocatorRef v2 = (std::__shared_weak_count *)this[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  JUMPOUT(0x192FAF2C0);
}

{
  std::__shared_weak_count *v2;

  *this = &unk_1EDD6A080;
  nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(this + 3, 0);
  CFAllocatorRef v2 = (std::__shared_weak_count *)this[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

uint64_t CEM::EmojiToken::EmojiToken(uint64_t a1, int a2, uint64_t a3, CEM::EmojiData *this, uint64_t a5)
{
  unsigned __int16 v5 = a3;
  *(void *)a1 = a5;
  *(void *)(a1 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = 0;
  CFLocaleRef v6 = (const void **)(a1 + 8);
  *(_WORD *)(a1 + 22) = a3;
  *(void *)(a1 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = this;
  if ((a3 & 0x100000000) == 0 || (CEM::EmojiData::isValidIndex(this, (unsigned __int16)a3) & 1) == 0)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "not an emoji");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E55D5190, MEMORY[0x1E4FBA1E8]);
  }
  CFStringRef String = CEM::EmojiData::createString(*(CEM::EmojiData **)(a1 + 40), v5);
  nlp::CFScopedPtr<__CFString const*>::reset(v6, String);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(unsigned __int16 *)(v9 + 44);
  if (v10 >= v5)
  {
    LOBYTE(v12) = 0;
    *(_DWORD *)(a1 + 16) = 0;
    *(unsigned char *)(a1 + 2nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
    *(_WORD *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 2trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = 0;
  }
  else
  {
    if (*(unsigned __int16 *)(v9 + 42) >= (unsigned __int16)(v5 - v10)) {
      int v11 = *(unsigned __int8 *)(**(void **)(v9 + 16) + 16 * (~v10 + v5) + 12) >> 4;
    }
    else {
      int v11 = 0;
    }
    *(_DWORD *)(a1 + 16) = v11;
    if (*(unsigned __int16 *)(v9 + 42) >= (unsigned __int16)(v5 - v10)) {
      char v13 = *(unsigned char *)(**(void **)(v9 + 16) + 16 * (~v10 + v5) + 13);
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)(a1 + 2nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = v13;
    if (*(unsigned __int16 *)(v9 + 42) >= (unsigned __int16)(v5 - v10)) {
      __int16 v14 = *(_WORD *)(**(void **)(v9 + 16) + 16 * (~v10 + v5) + 16);
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)(a1 + 24) = v14;
    if (*(unsigned __int16 *)(v9 + 42) >= (unsigned __int16)(v5 - v10)) {
      int v15 = *(unsigned char *)(**(void **)(v9 + 16) + 16 * (~v10 + v5) + 12) & 0xF;
    }
    else {
      int v15 = 0;
    }
    *(_DWORD *)(a1 + 2trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = v15;
    if (*(unsigned __int16 *)(v9 + 42) >= (unsigned __int16)(v5 - v10)) {
      int v12 = (*(unsigned __int16 *)(**(void **)(v9 + 16) + 16 * (~v10 + v5) + 10) >> 2) & 1;
    }
    else {
      LOBYTE(v12) = 0;
    }
  }
  *(unsigned char *)(a1 + 32) = v12;
  return a1;
}

void sub_18E671D1C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  nlp::CFScopedPtr<__CFString const*>::reset(v2, 0);
  _Unwind_Resume(a1);
}

uint64_t CEM::EmojiToken::EmojiToken(uint64_t a1, unsigned int a2, CEM::EmojiData *this, uint64_t a4)
{
  *(void *)a1 = a4;
  *(void *)(a1 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = 0;
  CFLocaleRef v6 = (const void **)(a1 + 8);
  *(_WORD *)(a1 + 22) = a2;
  *(void *)(a1 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = this;
  if (!CEM::EmojiData::isValidIndex(this, a2))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "not an emoji");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E55D5190, MEMORY[0x1E4FBA1E8]);
  }
  CFStringRef String = CEM::EmojiData::createString(*(CEM::EmojiData **)(a1 + 40), a2);
  nlp::CFScopedPtr<__CFString const*>::reset(v6, String);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(unsigned __int16 *)(v8 + 44);
  if (a2 <= v9)
  {
    LOBYTE(v11) = 0;
    *(_DWORD *)(a1 + 16) = 0;
    *(unsigned char *)(a1 + 2nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
    *(_WORD *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 2trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = 0;
  }
  else
  {
    if (*(unsigned __int16 *)(v8 + 42) >= (unsigned __int16)(a2 - v9)) {
      int v10 = *(unsigned __int8 *)(**(void **)(v8 + 16) + 16 * (~v9 + a2) + 12) >> 4;
    }
    else {
      int v10 = 0;
    }
    *(_DWORD *)(a1 + 16) = v10;
    if (*(unsigned __int16 *)(v8 + 42) >= (unsigned __int16)(a2 - v9)) {
      char v12 = *(unsigned char *)(**(void **)(v8 + 16) + 16 * (~v9 + a2) + 13);
    }
    else {
      char v12 = 0;
    }
    *(unsigned char *)(a1 + 2nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = v12;
    if (*(unsigned __int16 *)(v8 + 42) >= (unsigned __int16)(a2 - v9)) {
      __int16 v13 = *(_WORD *)(**(void **)(v8 + 16) + 16 * (~v9 + a2) + 16);
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)(a1 + 24) = v13;
    if (*(unsigned __int16 *)(v8 + 42) >= (unsigned __int16)(a2 - v9)) {
      int v14 = *(unsigned char *)(**(void **)(v8 + 16) + 16 * (~v9 + a2) + 12) & 0xF;
    }
    else {
      int v14 = 0;
    }
    *(_DWORD *)(a1 + 2trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = v14;
    if (*(unsigned __int16 *)(v8 + 42) >= (unsigned __int16)(a2 - v9)) {
      int v11 = (*(unsigned __int16 *)(**(void **)(v8 + 16) + 16 * (~v9 + a2) + 10) >> 2) & 1;
    }
    else {
      LOBYTE(v11) = 0;
    }
  }
  *(unsigned char *)(a1 + 32) = v11;
  return a1;
}

void sub_18E671F38(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  nlp::CFScopedPtr<__CFString const*>::reset(v2, 0);
  _Unwind_Resume(a1);
}

uint64_t CEM::EmojiToken::baseIndex(CEM::EmojiToken *this)
{
  if (!*((_DWORD *)this + 4) && !*((unsigned char *)this + 20)) {
    return *((unsigned __int16 *)this + 11);
  }
  uint64_t v1 = *((void *)this + 5);
  uint64_t v2 = *((unsigned __int16 *)this + 11);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 44);
  if (v2 > v3
    && *(unsigned __int16 *)(v1 + 42) >= (unsigned __int16)(v2 - v3))
  {
    return *(unsigned __int16 *)(**(void **)(v1 + 16) + 16 * (~v3 + v2) + 14);
  }
  else
  {
    return 0;
  }
}

uint64_t CEM::EmojiToken::createWrapper(uint64_t *a1, const void *a2)
{
  CFAllocatorGetDefault();
  {
    unk_1EB3F6200 = 0u;
    unk_1EB3F61F0 = 0u;
    _CFGetTypeID_EmojiTokenWrapper(void)::typeID = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v5 = Instance;
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = *(std::__shared_weak_count **)(Instance + 32);
  *(void *)(v5 + 24) = v7;
  *(void *)(v5 + 32) = v6;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (a2) {
    nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::acquire((const void **)(v5 + 40), a2);
  }
  return v5;
}

void sub_18E6720A8(_Unwind_Exception *a1)
{
}

__CFArray *CEM::EmojiToken::createWrappers(uint64_t **a1, const void *a2)
{
  if (a1[1] == *a1) {
    return 0;
  }
  CFMutableStringRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  while (v5 != v6)
  {
    uint64_t Wrapper = (const void *)CEM::EmojiToken::createWrapper(v5, a2);
    CFArrayAppendValue(Mutable, Wrapper);
    CFRelease(Wrapper);
    v5 += 2;
  }
  return Mutable;
}

void CEM::EmojiToken::copyNameWithCount(CEM::EmojiToken *a1)
{
}

void sub_18E6727FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(v10 - 88));
  nlp::CFScopedPtr<__CFLocale const*>::reset(v9, 0);
  MEMORY[0x192FAF2C0](v9, 0xE0C402B90B96ALL);
  std::mutex::unlock(v8);
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void CEM::EmojiToken::createCopy(CEM::EmojiToken *this)
{
}

void sub_18E672994(_Unwind_Exception *a1)
{
  MEMORY[0x192FAF2C0](v1, 0x1060C4030A14F29);
  _Unwind_Resume(a1);
}

uint64_t CEM::EmojiToken::createBaseTokenCopy(CEM::EmojiToken *this)
{
  if (CEM::EmojiToken::baseIndex(this) != *((unsigned __int16 *)this + 11)) {
    operator new();
  }
  return 0;
}

void sub_18E672A60(_Unwind_Exception *a1)
{
  MEMORY[0x192FAF2C0](v1, 0x1060C4030A14F29);
  _Unwind_Resume(a1);
}

CEM::EmojiToken *CEM::EmojiToken::createCopyRemovingModifiers(CEM::EmojiToken *this)
{
  if (!*((_DWORD *)this + 4) && !*((unsigned char *)this + 20))
  {
    CEM::EmojiToken::createCopy(this);
  }
  BaseTokenCFStringRef Copy = CEM::EmojiToken::createBaseTokenCopy(this);
  uint64_t v6 = 0;
  uint64_t v7 = BaseTokenCopy;
  if (BaseTokenCopy)
  {
    uint64_t v2 = BaseTokenCopy;
    do
    {
      uint64_t v7 = 0;
      std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100]((uint64_t *)&v6, v2);
      uint64_t v3 = v6;
      uint64_t v4 = CEM::EmojiToken::createBaseTokenCopy(v6);
      std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&v7, v4);
      uint64_t v2 = v7;
    }
    while (v7);
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v6 = 0;
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100]((uint64_t *)&v6, 0);
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&v7, 0);
  return v3;
}

void sub_18E672B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t CEM::Statement::Statement(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, size_t a5, uint64_t *a6)
{
  *(void *)a1 = a2;
  *(void *)(a1 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = a3;
  *(void *)(a1 + 16) = a4;
  *(void *)(a1 + 24) = a5;
  memset(&v29, 0, sizeof(v29));
  if (a3)
  {
    std::string::append(&v29, "-", 1uLL);
    std::string::append(&v29, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
    uint64_t v9 = *(const void **)(a1 + 16);
    size_t v8 = *(void *)(a1 + 24);
  }
  else
  {
    size_t v8 = a5;
    uint64_t v9 = a4;
  }
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    uint64_t v10 = operator new(v11 + 1);
    *(void *)(a1 + 4std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&a9, 0) = v8;
    *(void *)(a1 + 4trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = v12 | 0x8000000000000000;
    *(void *)(a1 + 32) = v10;
  }
  else
  {
    *(unsigned char *)(a1 + 55) = v8;
    uint64_t v10 = (void *)(a1 + 32);
    if (!v8) {
      goto LABEL_12;
    }
  }
  memmove(v10, v9, v8);
LABEL_12:
  std::string::size_type v13 = 0;
  *((unsigned char *)v10 + vtrie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = 0;
  std::string::size_type v14 = *(unsigned __int8 *)(a1 + 55);
  if ((v14 & 0x80u) == 0) {
    uint64_t v15 = a1 + 32;
  }
  else {
    uint64_t v15 = *(void *)(a1 + 32);
  }
  if ((v14 & 0x80u) != 0) {
    std::string::size_type v14 = *(void *)(a1 + 40);
  }
LABEL_17:
  int v16 = (void *)(v15 + v13);
  CFStringRef v17 = (char *)(v15 + v14);
  while (v17 - (unsigned char *)v16 >= 2)
  {
    int v18 = (char *)memchr(v16, 123, v17 - (unsigned char *)v16 - 1);
    if (!v18) {
      break;
    }
    if (*(_WORD *)v18 == 32123)
    {
      if (v18 != v17)
      {
        std::string::size_type v19 = (std::string::size_type)&v18[-v15];
        if (v19 != -1)
        {
          if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v20 = &v29;
          }
          else {
            uint64_t v20 = (std::string *)v29.__r_.__value_.__r.__words[0];
          }
          if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type size = HIBYTE(v29.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type size = v29.__r_.__value_.__l.__size_;
          }
          std::string::replace((std::string *)(a1 + 32), v19, 2uLL, (const std::string::value_type *)v20, size);
          std::string::size_type v22 = HIBYTE(v29.__r_.__value_.__r.__words[2]);
          if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            std::string::size_type v22 = v29.__r_.__value_.__l.__size_;
          }
          std::string::size_type v13 = v22 + v19;
          std::string::size_type v14 = *(unsigned __int8 *)(a1 + 55);
          if ((v14 & 0x80u) == 0) {
            uint64_t v15 = a1 + 32;
          }
          else {
            uint64_t v15 = *(void *)(a1 + 32);
          }
          if ((v14 & 0x80u) != 0) {
            std::string::size_type v14 = *(void *)(a1 + 40);
          }
          if (v14 >= v13) {
            goto LABEL_17;
          }
        }
      }
      break;
    }
    int v16 = v18 + 1;
  }
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  uint64_t v23 = *a6;
  uint64_t v24 = a6[1];
  v29.__r_.__value_.__r.__words[0] = a1 + 56;
  v29.__r_.__value_.__s.__data_[8] = 0;
  uint64_t v25 = v24 - v23;
  if (v24 != v23)
  {
    if (v25 < 0) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    int v26 = (char *)operator new(v24 - v23);
    uint64_t v27 = 0;
    *(void *)(a1 + 56) = v26;
    *(void *)(a1 + 64) = v26;
    *(void *)(a1 + 72) = &v26[32 * (v25 >> 5)];
    do
    {
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&v26[v27], v23 + v27);
      v27 += 32;
    }
    while (v23 + v27 != v24);
    *(void *)(a1 + 64) = &v26[v27];
  }
  *(void *)(a1 + 8std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&a9, 0) = 0;
  *(void *)(a1 + 8trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = 0;
  *(void *)(a1 + 96) = 0;
  *(_DWORD *)(a1 + 104) = 101;
  return a1;
}

void sub_18E672DC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 55) < 0) {
    operator delete(*v16);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

sqlite3 *CEM::Statement::prepare(CEM::Statement *this)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log_t result = (sqlite3 *)*((void *)this + 12);
  if (result)
  {
    uint64_t v3 = (const char *)*((void *)this + 11);
    if (!v3)
    {
      uint64_t v3 = (char *)this + 32;
      if (*((char *)this + 55) < 0) {
        uint64_t v3 = *(const char **)v3;
      }
    }
    os_log_t result = (sqlite3 *)sqlite3_prepare_v2(result, v3, -1, (sqlite3_stmt **)this + 10, (const char **)this + 11);
    if (result)
    {
      if (cem_logging_get_adaptation_log_onceToken != -1) {
        dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
      }
      uint64_t v4 = cem_logging_get_adaptation_log_log;
      if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = (void *)((char *)this + 32);
        if (*((char *)this + 55) < 0) {
          uint64_t v5 = (void *)*v5;
        }
        uint64_t v6 = sqlite3_errmsg(*((sqlite3 **)this + 12));
        int v7 = 136315394;
        size_t v8 = v5;
        __int16 v9 = 2082;
        uint64_t v10 = v6;
        _os_log_error_impl(&dword_18E64B000, v4, OS_LOG_TYPE_ERROR, "Could not prepare SQL statement: '%s'. Error: '%{public}s'", (uint8_t *)&v7, 0x16u);
      }
      return (sqlite3 *)sqlite3_finalize(*((sqlite3_stmt **)this + 10));
    }
  }
  return result;
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x1E4FBA4F0] + 16;
  __cxa_throw(exception, MEMORY[0x1E4FBA340], (void (*)(void *))std::bad_variant_access::~bad_variant_access);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CEM::Statement::bindParameters(void)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::monostate,unsigned int,double,std::string,std::vector<unsigned char,std::char_traits<char><unsigned char>>> const&>(uint64_t *a1, unsigned __int8 **a2)
{
  uint64_t v2 = *a1;
  uint64_t result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(void *)*a1 + 80), *(_DWORD *)(*a1 + 16), (const void *)**a2, *((_DWORD *)a2 + 2) - *a2, 0);
  **(_DWORD **)(v2 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = result;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CEM::Statement::bindParameters(void)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::monostate,unsigned int,double,std::string,std::vector<unsigned char,std::char_traits<char><unsigned char>>> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(sqlite3_stmt **)(*(void *)*a1 + 80);
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = (const char *)a2;
  }
  else {
    uint64_t v5 = *(const char **)a2;
  }
  if (v4 >= 0) {
    int v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    int v6 = *(_DWORD *)(a2 + 8);
  }
  uint64_t result = sqlite3_bind_text(v3, *(_DWORD *)(v2 + 16) + 1, v5, v6, 0);
  **(_DWORD **)(v2 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = result;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CEM::Statement::bindParameters(void)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::monostate,unsigned int,double,std::string,std::vector<unsigned char,std::char_traits<char><unsigned char>>> const&>(uint64_t *a1, double *a2)
{
  uint64_t v2 = *a1;
  uint64_t result = sqlite3_bind_double(*(sqlite3_stmt **)(*(void *)*a1 + 80), *(_DWORD *)(*a1 + 16), *a2);
  **(_DWORD **)(v2 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = result;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CEM::Statement::bindParameters(void)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::monostate,unsigned int,double,std::string,std::vector<unsigned char,std::char_traits<char><unsigned char>>> const&>(uint64_t *a1, int *a2)
{
  uint64_t v2 = *a1;
  uint64_t result = sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)*a1 + 80), *(_DWORD *)(*a1 + 16) + 1, *a2);
  **(_DWORD **)(v2 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = result;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CEM::Statement::bindParameters(void)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::monostate,unsigned int,double,std::string,std::vector<unsigned char,std::char_traits<char><unsigned char>>> const&>(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t result = sqlite3_bind_null(*(sqlite3_stmt **)(*(void *)*a1 + 80), *(_DWORD *)(*a1 + 16));
  **(_DWORD **)(v1 + trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((void *)this + 8) = result;
  return result;
}

void std::__shared_ptr_emplace<CEM::AdaptationDatabase>::__on_zero_shared(uint64_t a1)
{
  uint64_t v2 = *(sqlite3 **)(a1 + 48);
  if (v2) {
    sqlite3_close(v2);
  }
  std::mutex::~mutex((std::mutex *)(a1 + 56));
  if (*(char *)(a1 + 47) < 0)
  {
    uint64_t v3 = *(void **)(a1 + 24);
    operator delete(v3);
  }
}

void std::__shared_ptr_emplace<CEM::AdaptationDatabase>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDD69F08;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FAF2C0);
}

void std::__shared_ptr_emplace<CEM::AdaptationDatabase>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDD69F08;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x1E4FBA438] + 16;
  __cxa_throw(exception, MEMORY[0x1E4FBA2E0], MEMORY[0x1E4FBA208]);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = 0;
    do
    {
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::__copy_constructor(a3 + v6, a1 + v6);
      v6 += 32;
    }
    while (a1 + v6 != a2);
    a3 += v6;
  }
  return a3;
}

void *std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::find<std::string>(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = (void *)(a1 + 8);
  do
  {
    char v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0) {
      int v7 = v3;
    }
    else {
      int v7 = v3 + 1;
    }
    if (v6 >= 0) {
      uint64_t v5 = v3;
    }
    uint64_t v3 = (void *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

void *std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::target_type()
{
}

uint64_t std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK3CEM28AdaptationDatabaseController26enumerateStringAndStringIdENSt3__18functionIFvNS1_17basic_string_viewIcNS1_11char_traitsIcEEEEjEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::operator()(uint64_t a1, uint64_t a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "id");
  int v4 = std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::find<std::string>(a2, __p);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "string");
  uint64_t v5 = std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::find<std::string>(a2, __p);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ((void *)(a2 + 8) == v4)
  {
    if (cem_logging_get_adaptation_log_onceToken != -1) {
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
    }
    __int16 v9 = cem_logging_get_adaptation_log_log;
    if (!os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(__p[0]) = 0;
LABEL_27:
    _os_log_error_impl(&dword_18E64B000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)__p, 2u);
    return;
  }
  if ((void *)(a2 + 8) == v5)
  {
    if (cem_logging_get_adaptation_log_onceToken != -1) {
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
    }
    __int16 v9 = cem_logging_get_adaptation_log_log;
    if (!os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(__p[0]) = 0;
    goto LABEL_27;
  }
  if (*((_DWORD *)v4 + 20) != 1)
  {
    if (cem_logging_get_adaptation_log_onceToken != -1) {
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
    }
    __int16 v9 = cem_logging_get_adaptation_log_log;
    if (!os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(__p[0]) = 0;
    uint64_t v10 = "Could not extract uint32_t from std::variant<T> column value map. enumerateStringAndStringId(...);";
    goto LABEL_27;
  }
  if (*((_DWORD *)v5 + 20) == 3)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    if (*((char *)v5 + 79) < 0)
    {
      int v7 = (void *)v5[7];
      size_t v8 = (void *)v5[8];
    }
    else
    {
      int v7 = v5 + 7;
      size_t v8 = (void *)*((unsigned __int8 *)v5 + 79);
    }
    int v11 = *((_DWORD *)v4 + 14);
    __p[0] = v7;
    __p[1] = v8;
    int v15 = v11;
    uint64_t v12 = *(void *)(v6 + 24);
    if (!v12) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, void **, int *))(*(void *)v12 + 48))(v12, __p, &v15);
    return;
  }
  if (cem_logging_get_adaptation_log_onceToken != -1) {
    dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_4);
  }
  __int16 v9 = cem_logging_get_adaptation_log_log;
  if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
  {
    LOWORD(__p[0]) = 0;
    uint64_t v10 = "Could not extract std::string from std::variant<T> column value map. enumerateStringAndStringId(...);";
    goto LABEL_27;
  }
}

uint64_t std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDD69790;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDD69790;
  result[1] = v3;
  return result;
}

void std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::~__func()
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
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

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7490](locArray, prefArray);
}

uint64_t CFBundleCopyLocalizedStringTableForLocalization()
{
  return MEMORY[0x1F40D74B8]();
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x1F40D74D8](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1F40D7718](alloc);
}

CFCharacterSetRef CFCharacterSetCreateWithBitmapRepresentation(CFAllocatorRef alloc, CFDataRef theData)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7728](alloc, theData);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x1F40D7778](theSet, *(void *)&theChar);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1F40D77B8]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A80](err);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7C00](allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C10](allocator, dictionary);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C20](locale);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1F40D7C48](locale, key);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
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

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8400](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.CFIndex location = v3;
  return result;
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

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.CFIndex location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1F40D86B0](tokenizer, index);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1F40D86C0](string, range, transform, reverse);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1F40D87B0](url, key, propertyValueTypeRefPtr, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D87F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1F40D8808](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x1F40D8948](url, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  CFIndex v1 = (const std::string_view::value_type *)MEMORY[0x1F417E3D0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
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

uint64_t std::ostream::write()
{
  return MEMORY[0x1F417E840]();
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

BOOL std::__fs::filesystem::__create_directories(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x1F417EB80](a1, a2);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1F417EBC8](a1, __ec);
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

void std::ios_base::init(std::ios_base *this, void *__sb)
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

void operator delete(void *__p, const std::nothrow_t *a2)
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
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

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
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

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}