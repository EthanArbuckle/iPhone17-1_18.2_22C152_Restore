void **CSCppMutableContext::add_symbol_owner@<X0>(void **this@<X0>, CSCppSymbolOwner *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t *v5;

  if (*((unsigned char *)a2 + 111))
  {
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
  }
  else
  {
    v5 = (uint64_t *)this;
    CSCppMutableContext::copy_symbol_owner((CSCppMutableContext *)this, a2, a3, (long long *)a4);
    return std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100](v5, (long long *)a4);
  }
  return this;
}

void sub_1B907B1BC(_Unwind_Exception *exception_object)
{
  v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSCppMutableContext::remove_symbol_owner(CSCppMutableContext *this, CSCppSymbolOwner *a2)
{
  if (*((void *)this + 1) - *(void *)this < 0x20uLL) {
    return 0;
  }
  SymbolOwnerInList = _findSymbolOwnerInList((uint64_t **)this, (uint64_t)a2);
  if (*((uint64_t **)this + 1) == SymbolOwnerInList) {
    return 0;
  }
  v5 = (long long *)SymbolOwnerInList;
  v6 = _findSymbolOwnerInList((uint64_t **)this + 6, (uint64_t)a2);
  v7 = (long long *)*((void *)this + 7);
  if (v7 == (long long *)v6)
  {
    CSCppMutableContext::remove_symbol_owner((uint64_t)this, v5);
  }
  else
  {
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::shared_ptr<CSCppSymbolOwner> *,std::shared_ptr<CSCppSymbolOwner> *,std::shared_ptr<CSCppSymbolOwner> *>((uint64_t)&v17, (long long *)v6 + 1, v7, (uint64_t)v6);
    uint64_t v9 = v8;
    uint64_t v10 = *((void *)this + 7);
    if (v10 != v8)
    {
      do
      {
        v11 = *(std::__shared_weak_count **)(v10 - 8);
        if (v11) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v11);
        }
        v10 -= 16;
      }
      while (v10 != v9);
    }
    *((void *)this + 7) = v9;
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::shared_ptr<CSCppSymbolOwner> *,std::shared_ptr<CSCppSymbolOwner> *,std::shared_ptr<CSCppSymbolOwner> *>((uint64_t)&v18, v5 + 1, *((long long **)this + 1), (uint64_t)v5);
    uint64_t v13 = v12;
    uint64_t v14 = *((void *)this + 1);
    if (v14 != v12)
    {
      do
      {
        v15 = *(std::__shared_weak_count **)(v14 - 8);
        if (v15) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v15);
        }
        v14 -= 16;
      }
      while (v14 != v13);
    }
    *((void *)this + 1) = v13;
  }
  return 1;
}

uint64_t *_findSymbolOwnerInList(uint64_t **a1, uint64_t a2)
{
  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    while (1)
    {
      uint64_t v6 = *v2;
      v5 = (std::__shared_weak_count *)v2[1];
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      }
      if (v6 == a2) {
        break;
      }
      v2 += 2;
      if (v2 == v3) {
        return v3;
      }
    }
  }
  return v2;
}

uint64_t CSCppMutableContext::replace_symbol_owner(void **this, CSCppSymbolOwner *a2, CSCppSymbolOwner *a3)
{
  CSCppMutableContext::add_symbol_owner(this, a2, 1, (uint64_t)&v8);
  SymbolOwnerInList = _findSymbolOwnerInList((uint64_t **)this, (uint64_t)a3);
  if (this[1] != SymbolOwnerInList) {
    CSCppMutableContext::remove_symbol_owner((uint64_t)this, (long long *)SymbolOwnerInList);
  }
  uint64_t v6 = v8;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v6;
}

void sub_1B907B3B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSCppMutableContext::make_symbol_owner_mutable(CSCppMutableContext *this, CSCppSymbolOwner *a2)
{
  if (*((unsigned char *)a2 + 111)) {
    return 0;
  }
  SymbolOwnerInList = _findSymbolOwnerInList((uint64_t **)this, (uint64_t)a2);
  if (*((uint64_t **)this + 1) == SymbolOwnerInList) {
    return 0;
  }
  uint64_t v5 = (uint64_t)SymbolOwnerInList;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((uint64_t *)this + 3, (long long *)SymbolOwnerInList);
  std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::shared_ptr<CSCppSymbolOwner> *,std::shared_ptr<CSCppSymbolOwner> *,std::shared_ptr<CSCppSymbolOwner> *>((uint64_t)&v12, (long long *)(v5 + 16), *((long long **)this + 1), v5);
  uint64_t v7 = v6;
  uint64_t v8 = *((void *)this + 1);
  if (v8 != v6)
  {
    do
    {
      uint64_t v9 = *(std::__shared_weak_count **)(v8 - 8);
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
      v8 -= 16;
    }
    while (v8 != v7);
  }
  *((void *)this + 1) = v7;
  CSCppMutableContext::copy_symbol_owner(this, a2, 0, &v12);
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((uint64_t *)this, &v12);
  uint64_t v10 = v12;
  if (*((void *)&v12 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v12 + 1));
  }
  return v10;
}

void sub_1B907B4A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSCppMutableContext::make_all_symbol_owners_immutable(uint64_t this)
{
  uint64_t v1 = *(uint64_t **)(this + 48);
  v2 = *(uint64_t **)(this + 56);
  while (v1 != v2)
  {
    uint64_t v3 = *v1;
    v1 += 2;
    *(_DWORD *)(v3 + 108) &= ~0x1000000u;
  }
  return this;
}

void CSCppMutableContext::mark_all_obsoleted_symbol_owners(CSCppMutableContext *this)
{
  v2 = (uint64_t *)*((void *)this + 3);
  for (unint64_t i = *((void *)this + 4); (unint64_t)v2 < i; v2 += 2)
  {
    uint64_t v5 = *v2;
    v4 = (std::__shared_weak_count *)v2[1];
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      *(_DWORD *)(v5 + 108) = *(_DWORD *)(v5 + 108) & 0xFE7FFFFF | 0x800000;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      unint64_t i = *((void *)this + 4);
    }
    else
    {
      *(_DWORD *)(v5 + 108) = *(_DWORD *)(v5 + 108) & 0xFE7FFFFF | 0x800000;
    }
  }
}

void *CSGetBinaryPathForExclaveWithUUIDBytes(void *a1)
{
  get_exclave_core_uuid_to_path_map();
  get_exclave_kit_uuid_to_path_map();
  v2 = std::__hash_table<UUID,UUIDHashFunctor,UUIDEqualsFunctor,std::allocator<UUID>>::find<UUID>(&get_exclave_core_uuid_to_path_map(void)::exclave_core_uuid_to_path_map, a1);
  uint64_t v3 = std::__hash_table<UUID,UUIDHashFunctor,UUIDEqualsFunctor,std::allocator<UUID>>::find<UUID>(&get_exclave_kit_uuid_to_path_map(void)::exclave_kit_uuid_to_path_map, a1);
  v4 = v3;
  if (!v2)
  {
    if (!v3) {
      return 0;
    }
    result = v3 + 4;
    if ((*((char *)v4 + 55) & 0x80000000) == 0) {
      return result;
    }
    return (void *)*result;
  }
  if (v3)
  {
    if (os_variant_has_internal_content())
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1B8F92000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "UUID found in both ExclaveCore and ExclaveKit\n", v6, 2u);
      }
    }
    return 0;
  }
  result = v2 + 4;
  if (*((char *)v2 + 55) < 0) {
    return (void *)*result;
  }
  return result;
}

void get_exclave_core_uuid_to_path_map(void)
{
  {
    get_exclave_core_uuid_to_path_map(void)::exclave_core_uuid_to_path_map = 0u;
    *(_OWORD *)&qword_1E9EF9B88 = 0u;
    dword_1E9EF9B98 = 1065353216;
  }
  if (atomic_load_explicit((atomic_ullong *volatile)&get_exclave_core_uuid_to_path_map(void)::once, memory_order_acquire) != -1)
  {
    v2 = &v0;
    uint64_t v1 = &v2;
    std::__call_once(&get_exclave_core_uuid_to_path_map(void)::once, &v1, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_core_uuid_to_path_map(void)::$_0 &&>>);
  }
}

void get_exclave_kit_uuid_to_path_map(void)
{
  {
    get_exclave_kit_uuid_to_path_map(void)::exclave_kit_uuid_to_path_map = 0u;
    *(_OWORD *)&qword_1E9EF9BC0 = 0u;
    dword_1E9EF9BD0 = 1065353216;
  }
  if (atomic_load_explicit((atomic_ullong *volatile)&get_exclave_kit_uuid_to_path_map(void)::once, memory_order_acquire) != -1)
  {
    v2 = &v0;
    uint64_t v1 = &v2;
    std::__call_once(&get_exclave_kit_uuid_to_path_map(void)::once, &v1, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_kit_uuid_to_path_map(void)::$_0 &&>>);
  }
}

uint64_t CSSymbolicatorCreateWithExclaveUUIDAndFlags(void *a1, int a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3802000000;
  v11 = __Block_byref_object_copy__16;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  long long v12 = __Block_byref_object_dispose__16;
  v4 = (char *)CSGetBinaryPathForExclaveWithUUIDBytes(a1);
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 0x40000000;
    v7[2] = __CSSymbolicatorCreateWithExclaveUUIDAndFlags_block_invoke;
    v7[3] = &unk_1E61D0B50;
    v7[4] = &v8;
    v7[5] = a1;
    CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification(v4, a2, 0, (uint64_t)v7);
  }
  uint64_t v5 = v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_1B907B87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void *__CSSymbolicatorCreateWithExclaveUUIDAndFlags_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char SymbolOwner = CSSymbolicatorGetSymbolOwner(a2, a3);
  __n128 result = CSSymbolOwnerGetCFUUIDBytes(SymbolOwner, v7);
  uint64_t v9 = *(uint64_t **)(a1 + 40);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  if (v11 == *result && v10 == result[1])
  {
    __n128 result = (void *)CSRetain(a2, a3);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v13 + 40) = result;
    *(void *)(v13 + 48) = v14;
  }
  return result;
}

uint64_t CSSymbolicatorForeachExclaveCoreSymbolicator(uint64_t a1)
{
  return CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags(0, a1);
}

uint64_t CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags(int a1, uint64_t a2)
{
  get_exclave_core_uuid_to_path_map();
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2000000000;
  uint64_t v14 = 0;
  memset(v9, 0, sizeof(v9));
  int v10 = 1065353216;
  uint64_t v4 = qword_1E9EF9B88;
  if (qword_1E9EF9B88)
  {
    do
    {
      uint64_t v5 = (char *)(v4 + 32);
      if (!std::__hash_table<std::__hash_value_type<std::string,std::vector<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::string>>>>::find<std::string>(v9, (unsigned __int8 *)(v4 + 32)))
      {
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v9, (unsigned __int8 *)(v4 + 32), v4 + 32);
        if (*(char *)(v4 + 55) < 0) {
          uint64_t v5 = *(char **)v5;
        }
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 0x40000000;
        v8[2] = __CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags_block_invoke;
        v8[3] = &unk_1E61D0B78;
        v8[4] = a2;
        v8[5] = &v11;
        CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification(v5, a1, 0, (uint64_t)v8);
      }
      uint64_t v4 = *(void *)v4;
    }
    while (v4);
    uint64_t v6 = v12[3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v9);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1B907BA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)va);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t CSSymbolicatorForeachExclaveKitSymbolicator(uint64_t a1)
{
  return CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags(0, a1);
}

uint64_t CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags(int a1, uint64_t a2)
{
  get_exclave_kit_uuid_to_path_map();
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  uint64_t v14 = 0;
  memset(v9, 0, sizeof(v9));
  int v10 = 1065353216;
  uint64_t v4 = qword_1E9EF9BC0;
  if (qword_1E9EF9BC0)
  {
    do
    {
      uint64_t v5 = (char *)(v4 + 32);
      if (!std::__hash_table<std::__hash_value_type<std::string,std::vector<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::string>>>>::find<std::string>(v9, (unsigned __int8 *)(v4 + 32)))
      {
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v9, (unsigned __int8 *)(v4 + 32), v4 + 32);
        if (*(char *)(v4 + 55) < 0) {
          uint64_t v5 = *(char **)v5;
        }
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 0x40000000;
        v8[2] = __CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags_block_invoke;
        v8[3] = &unk_1E61D0BA0;
        v8[4] = a2;
        v8[5] = &v11;
        CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification(v5, a1, 0, (uint64_t)v8);
      }
      uint64_t v4 = *(void *)v4;
    }
    while (v4);
    uint64_t v6 = v12[3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v9);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1B907BC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)va);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_core_uuid_to_path_map(void)::$_0 &&>>()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  std::string::basic_string[abi:ne180100]<0>(&__p, "/System/ExclaveCore/");
  memset(&v16, 0, sizeof(v16));
  v14[0] = &v16;
  LOBYTE(v14[1]) = 0;
  v16.__begin_ = (std::vector<std::string>::pointer)operator new(0x18uLL);
  v16.__end_ = v16.__begin_;
  v16.__end_cap_.__value_ = v16.__begin_ + 1;
  v16.__end_ = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v16.__end_cap_, (long long *)&__p, (long long *)&__p.__end_cap_, v16.__begin_);
  if (SHIBYTE(__p.__end_) < 0) {
    operator delete(__p.__first_);
  }
  if (os_variant_has_internal_content())
  {
    char v0 = getenv("CS_TEST_EXCLAVECORE_DIR");
    if (v0)
    {
      uint64_t v1 = v0;
      if (!is_root_directory(v0))
      {
        std::string::basic_string[abi:ne180100]<0>(v14, v1);
        std::vector<std::string>::pointer end = v16.__end_;
        if (v16.__end_ >= v16.__end_cap_.__value_)
        {
          unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)v16.__end_ - (char *)v16.__begin_) >> 3);
          unint64_t v5 = v4 + 1;
          if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v16.__end_cap_.__value_ - (char *)v16.__begin_) >> 3) > v5) {
            unint64_t v5 = 0x5555555555555556 * (((char *)v16.__end_cap_.__value_ - (char *)v16.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v16.__end_cap_.__value_ - (char *)v16.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v6 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v6 = v5;
          }
          __p.__end_cap_.__value_ = (std::allocator<std::string> *)&v16.__end_cap_;
          if (v6) {
            uint64_t v7 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>((uint64_t)&v16.__end_cap_, v6);
          }
          else {
            uint64_t v7 = 0;
          }
          uint64_t v8 = v7 + v4;
          __p.__first_ = v7;
          __p.__begin_ = v8;
          __p.__end_cap_.__value_ = &v7[v6];
          long long v9 = *(_OWORD *)v14;
          v8->__r_.__value_.__r.__words[2] = v15;
          *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
          v14[1] = 0;
          std::string::size_type v15 = 0;
          v14[0] = 0;
          __p.__end_ = v8 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v16, &__p);
          uint64_t v10 = v16.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__p);
          v16.__end_ = v10;
          if (SHIBYTE(v15) < 0) {
            operator delete(v14[0]);
          }
        }
        else
        {
          long long v3 = *(_OWORD *)v14;
          v16.__end_->__r_.__value_.__r.__words[2] = v15;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v3;
          v16.__end_ = end + 1;
        }
      }
    }
  }
  std::vector<std::string>::pointer begin = v16.__begin_;
  for (std::vector<std::string>::pointer i = v16.__end_; begin != i; ++begin)
  {
    uint64_t v13 = (char *)begin;
    if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0) {
      uint64_t v13 = (char *)begin->__r_.__value_.__r.__words[0];
    }
    __p.__first_ = (std::__split_buffer<std::string>::pointer)&unk_1F12CA210;
    __p.__end_cap_.__value_ = (std::string *)&__p;
    recursively_list_files_and_uuids_in_directory(v13, (uint64_t)&__p);
    std::__function::__value_func<void ()(std::string const&,UUID const&)>::~__value_func[abi:ne180100](&__p);
  }
  v14[0] = &v16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
}

void sub_1B907BEE8(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, char *__pa, std::__split_buffer<std::string> *a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (a14 < 0) {
    operator delete(__pa);
  }
  __pa = &a15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(__p);
}

void recursively_list_files_and_uuids_in_directory(char *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  std::vector<std::string> v16 = a1;
  if (access(a1, 4) && os_variant_has_internal_content())
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)a1;
    unint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "Failed to access directory: %s\n";
LABEL_15:
    _os_log_impl(&dword_1B8F92000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&buf, 0xCu);
    return;
  }
  unint64_t v6 = (const std::__fs::filesystem::path *)std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&buf, &v16);
  std::__fs::filesystem::__status(v6, 0);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (LOBYTE(__p.__imp_.__ptr_) != 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v16;
    unint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "Path is not a directory: %s\n";
    goto LABEL_15;
  }
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)&__p, &v16);
  MEMORY[0x1BA9D1BD0](&buf, &__p, 0, 0);
  if (*(char *)(&__p.__rec_ + 7) < 0) {
    operator delete(__p.__imp_.__ptr_);
  }
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> v7 = *(std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> *)&buf.__r_.__value_.__l.__data_;
  if (buf.__r_.__value_.__l.__size_)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(buf.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
    size = (std::__shared_weak_count *)buf.__r_.__value_.__l.__size_;
    __p.__imp_ = v7;
    __p.__rec_ = buf.__r_.__value_.__s.__data_[16];
    if (buf.__r_.__value_.__l.__size_)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(buf.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](size);
    }
  }
  else
  {
    __p.__imp_.__ptr_ = (std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *)buf.__r_.__value_.__r.__words[0];
    __p.__imp_.__cntrl_ = 0;
    __p.__rec_ = buf.__r_.__value_.__s.__data_[16];
  }
  while (__p.__imp_.__ptr_)
  {
    long long v9 = std::__fs::filesystem::recursive_directory_iterator::__dereference(&__p);
    if (SHIBYTE(v9->__p_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&p, v9->__p_.__pn_.__r_.__value_.__l.__data_, v9->__p_.__pn_.__r_.__value_.__l.__size_);
    }
    else {
      std::string p = (std::string)v9->__p_;
    }
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&v13.__pn_, (char *)&p);
    std::__fs::filesystem::__status(&v13, 0);
    int v10 = v17;
    if (SHIBYTE(v13.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v13.__pn_.__r_.__value_.__l.__data_);
    }
    if (v10 != 2)
    {
      uint64_t v11 = (p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &p
          : (std::string *)p.__r_.__value_.__r.__words[0];
      if (CSFileIsSuitableForCS((const char *)v11))
      {
        if ((p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_std::string p = &p;
        }
        else {
          p_std::string p = (std::string *)p.__r_.__value_.__r.__words[0];
        }
        v13.__pn_.__r_.__value_.__r.__words[0] = -1;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 1174405120;
        v18[2] = ___ZL45recursively_list_files_and_uuids_in_directoryPKcNSt3__18functionIFvRKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEERK4UUIDEEE_block_invoke;
        v18[3] = &__block_descriptor_tmp_10_5;
        std::__function::__value_func<void ()(std::string const&,UUID const&)>::__value_func[abi:ne180100]((uint64_t)v19, a2);
        if (SHIBYTE(p.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v20, p.__r_.__value_.__l.__data_, p.__r_.__value_.__l.__size_);
        }
        else {
          std::string v20 = p;
        }
        iterate_symbol_owners_from_path((char *)p_p, 0, 0, (uint64_t)&v13, 0, (uint64_t)v18);
        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v20.__r_.__value_.__l.__data_);
        }
        std::__function::__value_func<void ()(std::string const&,UUID const&)>::~__value_func[abi:ne180100](v19);
      }
    }
    if (SHIBYTE(p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(p.__r_.__value_.__l.__data_);
    }
    std::__fs::filesystem::recursive_directory_iterator::__increment(&__p, 0);
  }
  if (__p.__imp_.__cntrl_) {
    std::__shared_weak_count::__release_shared[abi:ne180100](__p.__imp_.__cntrl_);
  }
  if (buf.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)buf.__r_.__value_.__l.__size_);
  }
}

void sub_1B907C2F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZL45recursively_list_files_and_uuids_in_directoryPKcNSt3__18functionIFvRKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEERK4UUIDEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

void __copy_helper_block_e8_32c93_ZTSNSt3__18functionIFvRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERK4UUIDEEE64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  std::__function::__value_func<void ()(std::string const&,UUID const&)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
  unint64_t v4 = (std::string *)(a1 + 64);
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 64), *(void *)(a2 + 72));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 64);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
}

void sub_1B907C480(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(std::string const&,UUID const&)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *__destroy_helper_block_e8_32c93_ZTSNSt3__18functionIFvRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERK4UUIDEEE64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 87) < 0) {
    operator delete(*(void **)(a1 + 64));
  }

  return std::__function::__value_func<void ()(std::string const&,UUID const&)>::~__value_func[abi:ne180100]((void *)(a1 + 32));
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(std::string *this, char **a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  long long v3 = *a2;
  unint64_t v4 = v3 - 1;
  while (*++v4)
    ;
  std::string::append[abi:ne180100]<char const*,0>(this, v3, v4);
  return this;
}

void sub_1B907C51C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, char *a2, char *a3)
{
  unint64_t v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    int v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    int v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    uint64_t v14 = this;
    if ((v6 & 0x80) != 0) {
      uint64_t v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    for (std::vector<std::string>::pointer i = (char *)v14 + size; v4 != a3; ++i)
    {
      char v16 = *v4++;
      *std::vector<std::string>::pointer i = v16;
    }
    *std::vector<std::string>::pointer i = 0;
    std::string::size_type v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v17;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
  }
  else
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      uint64_t v12 = __p;
    }
    else {
      uint64_t v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return this;
}

void sub_1B907C694(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::__init_with_size[abi:ne180100]<char const*,char const*>(void *result, char *a2, char *a3, unint64_t a4)
{
  unint64_t v4 = result;
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
    v4[2] = v9 | 0x8000000000000000;
    void *v4 = result;
    unint64_t v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)unint64_t v4 = v10;
    unint64_t v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)unint64_t v4 = 0;
  return result;
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(std::string *a1, char *a2)
{
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  LODWORD(v3) = a2[23];
  BOOL v4 = (int)v3 < 0;
  uint64_t v5 = *((void *)a2 + 1);
  if ((int)v3 < 0) {
    a2 = *(char **)a2;
  }
  uint64_t v3 = v3;
  if (v4) {
    uint64_t v3 = v5;
  }
  std::string::append[abi:ne180100]<char const*,0>(a1, a2, &a2[v3]);
  return a1;
}

void sub_1B907C7A4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__value_func<void ()(std::string const&,UUID const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::~__func()
{
}

void *std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F12CA210;
  return result;
}

void std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F12CA210;
}

void std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::operator()(int a1, uint64_t a2, UUID *this)
{
  uint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a2 + 8);
  }
  if (v3)
  {
    if (!UUID::is_null(this))
    {
      unint64_t v7 = this;
      unint64_t v6 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)&get_exclave_core_uuid_to_path_map(void)::exclave_core_uuid_to_path_map, this, (uint64_t)&std::piecewise_construct, &v7);
      std::string::operator=((std::string *)(v6 + 4), (const std::string *)a2);
    }
  }
}

uint64_t std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target_type()
{
}

void *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(uint64_t a1, void *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v7 = a2[1] ^ *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    char v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (std::vector<std::string>::pointer i = *v10; i; std::vector<std::string>::pointer i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == *a2 && i[3] == a2[1]) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t v14 = (void *)(a1 + 16);
  std::vector<std::string>::pointer i = operator new(0x38uLL);
  *std::vector<std::string>::pointer i = 0;
  i[1] = v7;
  *((_OWORD *)i + 1) = **a4;
  i[5] = 0;
  i[6] = 0;
  i[4] = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v21 = *(void *)a1;
  uint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    *std::vector<std::string>::pointer i = *v22;
LABEL_42:
    *uint64_t v22 = i;
    goto LABEL_43;
  }
  *std::vector<std::string>::pointer i = *v14;
  *uint64_t v14 = i;
  *(void *)(v21 + 8 * v4) = v14;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8) {
        v23 %= v8;
      }
    }
    else
    {
      v23 &= v8 - 1;
    }
    uint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1B907CBE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::pair<std::string,unsigned long long>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(std::string const&,UUID const&)>::~__value_func[abi:ne180100](void *a1)
{
  v2 = (void *)a1[3];
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

void std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_kit_uuid_to_path_map(void)::$_0 &&>>()
{
  *(void *)&long long v40 = *MEMORY[0x1E4F143B8];
  memset(&v34, 0, sizeof(v34));
  std::string::basic_string[abi:ne180100]<0>(&buf, "/System/Volumes/Preboot/Cryptexes/ExclaveOS");
  std::string::basic_string[abi:ne180100]<0>(&buf.__end_cap_.__value_, "/private/preboot/Cryptexes/ExclaveOS");
  std::string::basic_string[abi:ne180100]<0>(v39, "/System/Cryptexes/ExclaveOS");
  __p[0] = 0;
  __p[1] = 0;
  v36[0] = 0;
  v36[1] = __p;
  char v37 = 0;
  __p[0] = operator new(0x48uLL);
  __p[1] = __p[0];
  v36[0] = (char *)__p[0] + 72;
  uint64_t v0 = 0;
  __p[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)v36, (long long *)&buf, &v40, (std::string *)__p[0]);
  do
  {
    if (SHIBYTE(v39[v0 + 2]) < 0) {
      operator delete((void *)v39[v0]);
    }
    v0 -= 3;
  }
  while (v0 != -9);
  uint64_t v1 = (char *)__p[0];
  v2 = (char *)__p[1];
  while (1)
  {
    if (v1 == v2)
    {
      char v4 = 0;
      v32.__r_.__value_.__s.__data_[0] = 0;
      goto LABEL_16;
    }
    uint64_t v3 = v1;
    if (v1[23] < 0) {
      uint64_t v3 = *(const char **)v1;
    }
    if (!access(v3, 4)) {
      break;
    }
    v1 += 24;
  }
  if (v1[23] < 0)
  {
    std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)v1, *((void *)v1 + 1));
  }
  else
  {
    long long v5 = *(_OWORD *)v1;
    v32.__r_.__value_.__r.__words[2] = *((void *)v1 + 2);
    *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v5;
  }
  char v4 = 1;
LABEL_16:
  char v33 = v4;
  buf.__first_ = (std::__split_buffer<std::string>::pointer)__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (v33)
  {
    if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      size_t size = HIBYTE(v32.__r_.__value_.__r.__words[2]);
    }
    else {
      size_t size = v32.__r_.__value_.__l.__size_;
    }
    unint64_t v7 = __p;
    std::string::basic_string[abi:ne180100]((uint64_t)__p, size + 19);
    if (v36[0] < 0) {
      unint64_t v7 = (void **)__p[0];
    }
    if (size)
    {
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v8 = &v32;
      }
      else {
        unint64_t v8 = (std::string *)v32.__r_.__value_.__r.__words[0];
      }
      memmove(v7, v8, size);
    }
    strcpy((char *)v7 + size, "/System/ExclaveKit/");
    std::vector<std::string>::pointer end = v34.__end_;
    if (v34.__end_ >= v34.__end_cap_.__value_)
    {
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_ - (char *)v34.__begin_) >> 3);
      unint64_t v12 = v11 + 1;
      if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) > v12) {
        unint64_t v12 = 0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v13 = v12;
      }
      buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v34.__end_cap_;
      if (v13) {
        uint64_t v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>((uint64_t)&v34.__end_cap_, v13);
      }
      else {
        uint64_t v14 = 0;
      }
      float v15 = v14 + v11;
      buf.__first_ = v14;
      buf.__begin_ = v15;
      buf.__end_cap_.__value_ = &v14[v13];
      long long v16 = *(_OWORD *)__p;
      v15->__r_.__value_.__r.__words[2] = v36[0];
      *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
      __p[1] = 0;
      v36[0] = 0;
      __p[0] = 0;
      buf.__end_ = v15 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v34, &buf);
      BOOL v17 = v34.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&buf);
      v34.__end_ = v17;
      if (SHIBYTE(v36[0]) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v10 = *(_OWORD *)__p;
      v34.__end_->__r_.__value_.__r.__words[2] = v36[0];
      *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
      v34.__end_ = end + 1;
    }
  }
  else if (is_device_sptm_enabled() {
         && os_variant_has_internal_content()
  }
         && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.__first_) = 0;
    _os_log_impl(&dword_1B8F92000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to locate official Exclave Kit binaries on disk", (uint8_t *)&buf, 2u);
  }
  if (os_variant_has_internal_content())
  {
    unint64_t v18 = getenv("CS_TEST_EXCLAVEKIT_DIR");
    if (v18)
    {
      unint64_t v19 = v18;
      if (!is_root_directory(v18))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, v19);
        std::vector<std::string>::pointer v20 = v34.__end_;
        if (v34.__end_ >= v34.__end_cap_.__value_)
        {
          unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_ - (char *)v34.__begin_) >> 3);
          unint64_t v23 = v22 + 1;
          if (v22 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) > v23) {
            unint64_t v23 = 0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v24 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v24 = v23;
          }
          buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v34.__end_cap_;
          if (v24) {
            v25 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>((uint64_t)&v34.__end_cap_, v24);
          }
          else {
            v25 = 0;
          }
          v26 = v25 + v22;
          buf.__first_ = v25;
          buf.__begin_ = v26;
          buf.__end_cap_.__value_ = &v25[v24];
          long long v27 = *(_OWORD *)__p;
          v26->__r_.__value_.__r.__words[2] = v36[0];
          *(_OWORD *)&v26->__r_.__value_.__l.__data_ = v27;
          __p[1] = 0;
          v36[0] = 0;
          __p[0] = 0;
          buf.__end_ = v26 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v34, &buf);
          v28 = v34.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&buf);
          v34.__end_ = v28;
          if (SHIBYTE(v36[0]) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v21 = *(_OWORD *)__p;
          v34.__end_->__r_.__value_.__r.__words[2] = v36[0];
          *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
          v34.__end_ = v20 + 1;
        }
      }
    }
  }
  std::vector<std::string>::pointer begin = v34.__begin_;
  for (std::vector<std::string>::pointer i = v34.__end_; begin != i; ++begin)
  {
    v31 = (char *)begin;
    if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0) {
      v31 = (char *)begin->__r_.__value_.__r.__words[0];
    }
    buf.__first_ = (std::__split_buffer<std::string>::pointer)&unk_1F12CA2A0;
    buf.__end_cap_.__value_ = (std::string *)&buf;
    recursively_list_files_and_uuids_in_directory(v31, (uint64_t)&buf);
    std::__function::__value_func<void ()(std::string const&,UUID const&)>::~__value_func[abi:ne180100](&buf);
  }
  if (v33 && SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
  v32.__r_.__value_.__r.__words[0] = (std::string::size_type)&v34;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
}

void sub_1B907D1B0(_Unwind_Exception *a1, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, int a8, uint64_t *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, void *__pa, std::__split_buffer<std::string> *a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  if (a24 < 0) {
    operator delete(__pa);
  }
  if ((_BYTE)__p)
  {
    if (SHIBYTE(a11) < 0) {
      operator delete(a9);
    }
  }
  a9 = &a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

void std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::~__func()
{
}

void *std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F12CA2A0;
  return result;
}

void std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F12CA2A0;
}

void std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::operator()(int a1, uint64_t a2, UUID *this)
{
  uint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a2 + 8);
  }
  if (v3)
  {
    if (!UUID::is_null(this))
    {
      unint64_t v7 = this;
      unint64_t v6 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)&get_exclave_kit_uuid_to_path_map(void)::exclave_kit_uuid_to_path_map, this, (uint64_t)&std::piecewise_construct, &v7);
      std::string::operator=((std::string *)(v6 + 4), (const std::string *)a2);
    }
  }
}

uint64_t std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target_type()
{
}

void **CSCppDsymData::binary_path(CSCppDsymData *this)
{
  v2 = (void **)((char *)this + 48);
  if (*((char *)this + 71) < 0)
  {
    if (!*((void *)this + 7)) {
      goto LABEL_14;
    }
    uint64_t v3 = (const char *)*v2;
    if (*(unsigned char *)*v2 != 126) {
      goto LABEL_14;
    }
  }
  else
  {
    if (!*((unsigned char *)this + 71)) {
      return 0;
    }
    if (*(unsigned char *)v2 != 126) {
      return v2;
    }
    uint64_t v3 = (char *)this + 48;
  }
  memset(&v5, 0, sizeof(v5));
  if (!glob(v3, 2048, 0, &v6))
  {
    std::string::__assign_external(&v5, *(const std::string::value_type **)v6.gl_pathv);
    globfree(&v6);
  }
  if (*((char *)this + 71) < 0) {
    operator delete(*v2);
  }
  *(std::string *)v2 = v5;
  if ((*((unsigned char *)this + 71) & 0x80) != 0)
  {
LABEL_14:
    if (*((void *)this + 7)) {
      return (void **)*v2;
    }
    return 0;
  }
  if (!*((unsigned char *)this + 71)) {
    return 0;
  }
  return v2;
}

void sub_1B907D4E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CSCppDsymData::CSCppDsymData(CSCppDsymData *this, const char *a2)
{
  *((void *)this + 8) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  strlcpy((char *)this + 72, a2, 0x400uLL);
}

void sub_1B907D548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  if (*(char *)(v10 + 71) < 0) {
    operator delete(*(void **)(v10 + 48));
  }
  a10 = (void **)(v10 + 24);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a10);
  a10 = (void **)v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

void make_dsym_data_from_path_and_uuid(const char *a1@<X0>, const CFUUIDBytes *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1 && a2 && !access(a1, 0))
  {
    CSCppDsymData::CSCppDsymData((CSCppDsymData *)&v5, a1);
    *(_OWORD *)a3 = v5;
    *(void *)(a3 + 16) = v6;
    long long v5 = 0uLL;
    *(_OWORD *)(a3 + 24) = v7;
    *(void *)(a3 + 40) = v8;
    uint64_t v6 = 0;
    long long v7 = 0uLL;
    uint64_t v8 = 0;
    *(_OWORD *)(a3 + 48) = v9;
    *(void *)(a3 + 64) = v10;
    uint64_t v10 = 0;
    long long v9 = 0uLL;
    memcpy((void *)(a3 + 72), v11, 0x400uLL);
    *(unsigned char *)(a3 + 1096) = 1;
    CSCppDsymData::~CSCppDsymData((void **)&v5);
  }
  else
  {
    *(unsigned char *)a3 = 0;
    *(unsigned char *)(a3 + 1096) = 0;
  }
}

uint64_t CSCppInternedPathTransformer::CSCppInternedPathTransformer(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *(void *)a1 = &unk_1F12CA320;
  *(void *)(a1 + 8) = a2;
  *(_OWORD *)(a1 + 16) = 0u;
  uint64_t v5 = a1 + 16;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_DWORD *)(a1 + 48) = 1065353216;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a4[1] - *a4) >> 3) >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a3[1] - *a3) >> 3)) {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a3[1] - *a3) >> 3);
  }
  else {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a4[1] - *a4) >> 3);
  }
  if (v6)
  {
    uint64_t v9 = 0;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::string const&,std::string const&>(v5, (unsigned __int8 *)(*a3 + v9), (long long *)(*a3 + v9), (long long *)(*a4 + v9));
      v9 += 24;
      --v6;
    }
    while (v6);
  }
  return a1;
}

void sub_1B907D748(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t *CSCppInternedPathTransformer::find_replacement(CSCppInternedPathTransformer *this, const char *__s2)
{
  for (std::vector<std::string>::pointer i = (uint64_t *)*((void *)this + 4); i; std::vector<std::string>::pointer i = (uint64_t *)*i)
  {
    int v4 = *((char *)i + 39);
    if (v4 >= 0) {
      uint64_t v5 = (const char *)(i + 2);
    }
    else {
      uint64_t v5 = (const char *)i[2];
    }
    if (v4 >= 0) {
      size_t v6 = *((unsigned __int8 *)i + 39);
    }
    else {
      size_t v6 = i[3];
    }
    if (!strncmp(v5, __s2, v6)) {
      break;
    }
  }
  return i;
}

unsigned __int8 *CSCppInternedPathTransformer::transform(CSCppStringCache **this, char *a2)
{
  v2 = (unsigned __int8 *)a2;
  replacement = CSCppInternedPathTransformer::find_replacement((CSCppInternedPathTransformer *)this, a2);
  if (replacement)
  {
    uint64_t v5 = replacement;
    if (*((char *)replacement + 39) < 0) {
      uint64_t v6 = replacement[3];
    }
    else {
      uint64_t v6 = *((unsigned __int8 *)replacement + 39);
    }
    long long v7 = (const char *)&v2[v6];
    if (*((char *)replacement + 63) >= 0) {
      size_t v8 = *((unsigned __int8 *)replacement + 63);
    }
    else {
      size_t v8 = replacement[6];
    }
    size_t v9 = strlen(v7);
    uint64_t v10 = __p;
    std::string::basic_string[abi:ne180100]((uint64_t)__p, v8 + v9);
    if (v15 < 0) {
      uint64_t v10 = (void **)__p[0];
    }
    if (v8)
    {
      if (*((char *)v5 + 63) >= 0) {
        unint64_t v11 = v5 + 5;
      }
      else {
        unint64_t v11 = (const void *)v5[5];
      }
      memmove(v10, v11, v8);
    }
    if (v9) {
      memmove((char *)v10 + v8, v7, v9);
    }
    *((unsigned char *)v10 + v8 + v9) = 0;
    if (v15 >= 0) {
      uint64_t v12 = (char *)__p;
    }
    else {
      uint64_t v12 = (char *)__p[0];
    }
    v2 = CSCppStringCache::intern(this[1], v12);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
  }
  return v2;
}

void sub_1B907D8D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CSCppInternedPathTransformer::~CSCppInternedPathTransformer(CSCppInternedPathTransformer *this)
{
  *(void *)this = &unk_1F12CA320;
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)this + 16);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F12CA320;
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)this + 16);

  JUMPOUT(0x1BA9D1CD0);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::string const&,std::string const&>(uint64_t a1, unsigned __int8 *a2, long long *a3, long long *a4)
{
  size_t v9 = (void *)(a1 + 24);
  unint64_t v10 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    char v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (std::vector<std::string>::pointer i = *v15; i; std::vector<std::string>::pointer i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::string const&,std::string const&>(a1, v11, a3, a4, (uint64_t)v27);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    BOOL v20 = 1;
    if (v12 >= 3) {
      BOOL v20 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v12);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v23);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *(void *)v27[0] = *v24;
    *unint64_t v24 = v27[0];
  }
  else
  {
    *(void *)v27[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v27[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v27[0])
    {
      unint64_t v25 = *(void *)(*(void *)v27[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12) {
          v25 %= v12;
        }
      }
      else
      {
        v25 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v25) = v27[0];
    }
  }
  std::vector<std::string>::pointer i = (unsigned __int8 *)v27[0];
  v27[0] = 0;
  ++*v9;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v27, 0);
  return i;
}

void sub_1B907DC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::string const&,std::string const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, long long *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  unint64_t v10 = (char *)operator new(0x40uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *(void *)unint64_t v10 = 0;
  *((void *)v10 + 1) = a2;
  uint64_t result = std::pair<std::string const,std::string>::pair[abi:ne180100]<true,0>((std::string *)(v10 + 16), a3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_1B907DC98(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,std::string>::pair[abi:ne180100]<true,0>(std::string *this, long long *a2, long long *a3)
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
  uint64_t v6 = this + 1;
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

void sub_1B907DD2C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

uint64_t _UUIDBytesToPath<CFUUIDBytes>(unsigned __int8 *a1, char *__str, size_t __size)
{
  if (a1) {
    BOOL v3 = __str == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v5 = !v3 && __size > 0x25;
  if (v5 == 1) {
    snprintf(__str, __size, "%02hhX%02hhX%02hhX%02hhX/%02hhX%02hhX/%02hhX%02hhX/%02hhX%02hhX/%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX/", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
  }
  return v5;
}

void CSSymbolicationSessionCreateWithFlags()
{
}

void sub_1B907DEB4(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9D1CD0](v1, 0x10A1C4031C43930);
  _Unwind_Resume(a1);
}

uint64_t CSSymbolicationSessionCreateSymbolicatorForPidWithFlags(char a1, uint64_t a2, int a3)
{
  if (!(a1 & 7 | (8 * (a2 & 3)))) {
    return 0;
  }
  uint64_t result = SymbolicationSession::create_pid_symbolicator((SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL), a3);
  unint64_t v4 = (atomic_uint *)result;
  if (result)
  {
    CSCppReferenceCount::retain(result);
    CSCppReferenceCount::release(v4, 1);
    return 2;
  }
  return result;
}

uint64_t CSSymbolicationSessionCreateNonFaultingSymbolicatorForPid(char a1, uint64_t a2, int a3)
{
  CSSymbolicatorGetFlagsForNonFaultingBehavior();

  return CSSymbolicationSessionCreateSymbolicatorForPidWithFlags(a1, a2, a3);
}

uint64_t CSSymbolicationSessionProcessATRCProcessAndDSCChunks(uint64_t result, uint64_t a2, __CFData *a3, __CFData *a4)
{
  if (result & 7 | (8 * (a2 & 3))) {
    return SymbolicationSession::process_ats_dsc_and_pid_chunks((SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL), a3, a4);
  }
  return result;
}

uint64_t CSSymbolicationSessionProcessATRCKernelChunk(uint64_t result, uint64_t a2, __CFData *a3)
{
  if (result & 7 | (8 * (a2 & 3))) {
    return SymbolicationSession::process_ats_kernel_chunk((SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL), a3);
  }
  return result;
}

__CFString *CSSymbolicationSessionCopyDescriptionWithIndent(char a1, uint64_t a2, int a3)
{
  if (!(a1 & 7 | (8 * (a2 & 3)))) {
    return 0;
  }
  unint64_t v4 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  for (std::vector<std::string>::pointer i = CFStringCreateMutable(0, 0); a3; --a3)
    CFStringAppendCString(i, "\t", 0x8000100u);
  CFStringAppendFormat(i, 0, @"<SymbolicationSession: %p> flags: 0x%x process count: %llu", v4, *(unsigned int *)(v4 + 256), *(void *)(v4 + 168));
  return i;
}

uint64_t CSSymbolicationSessionSetGroupKey(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result & 7 | (8 * (a2 & 3))) {
    *(void *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + 264) = a3;
  }
  return result;
}

uint64_t CSSymbolicationSessionForeachPid(char a1, uint64_t a2, uint64_t a3)
{
  if (a1 & 7 | (8 * (a2 & 3))) {
    return SymbolicationSession::foreach_pid(a2 & 0xFFFFFFFFFFFFFFFCLL, a3);
  }
  else {
    return 0;
  }
}

void *CSSymbolicationSessionGetDSCSlideForPid(char a1, uint64_t a2, int a3)
{
  if (a1 & 7 | (8 * (a2 & 3))) {
    return SymbolicationSession::dsc_slide_for_pid((SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL), a3);
  }
  else {
    return 0;
  }
}

uint64_t CSExceptionSafeThreadRunBlock(CSCppExceptionSafeThread *a1)
{
  v2 = CSCppExceptionSafeThread::main(a1);

  return CSCppExceptionSafeThread::run((uint64_t)v2, (uint64_t)a1, 0);
}

void *CSCppExceptionSafeThread::main(CSCppExceptionSafeThread *this)
{
  {
    CSCppExceptionSafeThread::CSCppExceptionSafeThread((CSCppExceptionSafeThread *)&CSCppExceptionSafeThread::main(void)::thread_singleton);
  }
  return &CSCppExceptionSafeThread::main(void)::thread_singleton;
}

void sub_1B907E194(_Unwind_Exception *a1)
{
}

uint64_t CSExceptionSafeThreadRunBlockWithHandler(CSCppExceptionSafeThread *a1, uint64_t a2)
{
  unint64_t v4 = CSCppExceptionSafeThread::main(a1);

  return CSCppExceptionSafeThread::run((uint64_t)v4, (uint64_t)a1, a2);
}

uint64_t CSExceptionSafeThreadProtectBlockWithHandler(CSCppExceptionSafeThread *a1, uint64_t a2)
{
  BOOL is_current_thread = CSCppExceptionSafeThread::is_current_thread(a1);
  if (is_current_thread)
  {
    uint64_t v5 = CSCppExceptionSafeThread::main((CSCppExceptionSafeThread *)is_current_thread);
    return CSCppExceptionSafeThread::run((uint64_t)v5, (uint64_t)a1, a2);
  }
  else
  {
    (*((void (**)(CSCppExceptionSafeThread *))a1 + 2))(a1);
    return 4096;
  }
}

_OWORD *kCSTypeRetainCallBack(const __CFAllocator *a1, uint64_t *a2)
{
  BOOL v3 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  _OWORD *v3 = *(_OWORD *)a2;
  CSRetain(*a2, a2[1]);
  return v3;
}

void kCSTypeReleaseCallBack(const __CFAllocator *a1, void *a2)
{
  CSRelease(*(atomic_uint **)a2, *((void *)a2 + 1));

  free(a2);
}

BOOL kCSTypeEqualCallBack(uint64_t *a1, uint64_t *a2)
{
  return CSEqual(*a1, a1[1], *a2, a2[1]);
}

uint64_t kCSTypeHashCallBack(void *a1)
{
  return a1[1] ^ *a1;
}

__n128 kCSTypeWeakRetainCallBack(const __CFAllocator *a1, __n128 *a2)
{
  BOOL v3 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  __n128 result = *a2;
  _OWORD *v3 = *a2;
  return result;
}

void kCSTypeWeakReleaseCallBack(const __CFAllocator *a1, void *a2)
{
}

uint64_t CSCppMMapSourceInfo::path(CSCppMMapSourceInfo *this, uint64_t a2)
{
  return *((unsigned int *)this + 2) + a2;
}

uint64_t _copyMMapArchiveFromCacheWithUUID<CFUUIDBytes>(__n128 *a1, void *a2, unint64_t *a3, __int16 *a4)
{
  if (!a1 || UUID::is_null((UUID *)a1)) {
    return 0;
  }

  return CSCppMMapArchiveCache::archive_for_uuid(a1, 0, 1, a2, a3, a4, 0, v8);
}

void CSCppDyldSharedCacheMemory::CSCppDyldSharedCacheMemory(uint64_t a1, uint64_t a2, char *a3, char *a4, _OWORD *a5)
{
  *(void *)a1 = &unk_1F12CA360;
  size_t v8 = (void *)(a1 + 40);
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 16), a3);
  if (a4) {
    uint64_t v9 = a4;
  }
  else {
    uint64_t v9 = "";
  }
  unint64_t v10 = (UUID *)std::string::basic_string[abi:ne180100]<0>(v8, v9);
  *(_OWORD *)(a1 + 64) = 0u;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 89) = 0u;
  *(_OWORD *)(a1 + 168) = *(_OWORD *)UUID::null_uuid(v10);
  *(_OWORD *)(a1 + 184) = *a5;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  new_partial_file_memory();
}

void sub_1B907E790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  uint64_t v14 = *(void *)(v9 + 96);
  *(void *)(v9 + 96) = 0;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  if (*(char *)(v9 + 63) < 0) {
    operator delete(*v11);
  }
  if (*(char *)(v9 + 39) < 0) {
    operator delete(*v10);
  }
  _Unwind_Resume(a1);
}

void CSCppDyldSharedCacheMemory::CSCppDyldSharedCacheMemory(UUID *a1, uint64_t a2, char *a3, char *a4)
{
  size_t v8 = UUID::null_uuid(a1);

  CSCppDyldSharedCacheMemory::CSCppDyldSharedCacheMemory((uint64_t)a1, v7, a3, a4, v8);
}

const char *___ZN26CSCppDyldSharedCacheMemoryC2E17CSCppArchitecturePKcS2_PK4UUID_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return TMemoryView<SizeAndEndianness<Pointer64,LittleEndian>>::needed_mapping_size_for_dyld_shared_cache_at(&v3, 0);
}

uint64_t CSCppDyldSharedCacheMemory::TEXT_address_of_path(CSCppDyldSharedCacheMemory *this, const char *a2, unint64_t *a3)
{
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2000000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  uint64_t v14 = 0;
  v9[0] = 0;
  v9[1] = v9;
  _OWORD v9[2] = 0x2000000000;
  char v10 = 0;
  uint64_t v6 = (const char *)_dyld_shared_cache_real_path();
  if (v6) {
    strcmp(a2, v6);
  }
  CSCppDyldSharedCacheMemory::foreach_text_segment((uint64_t)this);
  if (a3) {
    *a3 = v12[3];
  }
  uint64_t v7 = v16[3];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

void sub_1B907EA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN26CSCppDyldSharedCacheMemoryC2E17CSCppArchitecturePKcS2_PK4UUID_block_invoke_2(uint64_t result, unint64_t *a2)
{
  unint64_t v2 = *a2;
  uint64_t v3 = *(void *)(*(void *)(result + 40) + 72);
  if (v3)
  {
    unint64_t v4 = *(void *)(*(void *)(result + 40) + 64);
    if (v4 >= v2 && v4 + v3 <= a2[1] + v2)
    {
      *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4 - v2 + a2[2];
      operator new();
    }
  }
  if (*((_DWORD *)a2 + 7) == 1) {
    operator new();
  }
  return result;
}

void sub_1B907EC78(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9D1CD0](v1, 0x1093C406FCC8570);
  _Unwind_Resume(a1);
}

void CSCppDyldSharedCacheMemory::~CSCppDyldSharedCacheMemory(CSCppDyldSharedCacheMemory *this)
{
  *(void *)this = &unk_1F12CA360;
  uint64_t v3 = (void **)((char *)this + 144);
  std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *((void *)this + 12);
  *((void *)this + 12) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
}

{
  uint64_t vars8;

  CSCppDyldSharedCacheMemory::~CSCppDyldSharedCacheMemory(this);

  JUMPOUT(0x1BA9D1CD0);
}

unint64_t CSCppDyldSharedCacheMemory::file_range_for_memory_range(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 144);
  uint64_t v4 = *(void *)(a1 + 152) - (void)v3;
  if (!v4) {
    return 0;
  }
  unint64_t v5 = v4 >> 5;
  uint64_t v6 = *(void **)(a1 + 144);
  do
  {
    unint64_t v7 = v5 >> 1;
    size_t v8 = &v6[4 * (v5 >> 1)];
    unint64_t v10 = *v8;
    uint64_t v9 = v8 + 4;
    v5 += ~(v5 >> 1);
    if (*a2 < v10) {
      unint64_t v5 = v7;
    }
    else {
      uint64_t v6 = v9;
    }
  }
  while (v5);
  if (v6 == v3) {
    return 0;
  }
  unint64_t v11 = *(v6 - 4);
  unint64_t v12 = *a2 - v11;
  if (*a2 < v11 || a2[1] + *a2 > *(v6 - 3) + v11) {
    return 0;
  }
  if (a3) {
    *a3 = *(v6 - 1);
  }
  return v12 + *(v6 - 2);
}

uint64_t CSCppDyldSharedCacheMemory::foreach_text_segment(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  uint64_t v13 = 0;
  if (*(char *)(a1 + 39) < 0)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    uint64_t v2 = *(void *)(a1 + 24);
    if (!v2) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = *(unsigned __int8 *)(a1 + 39);
    uint64_t v3 = a1 + 16;
    if (!*(unsigned char *)(a1 + 39)) {
      goto LABEL_10;
    }
  }
  uint64_t v4 = v3 - 1;
  while (v2)
  {
    int v5 = *(unsigned __int8 *)(v4 + v2--);
    if (v5 == 47)
    {
      if (v2 == -1) {
        break;
      }
      std::string::basic_string(&v9, (const std::string *)(a1 + 16), 0, v2 + 1, (std::allocator<char> *)v14);
      goto LABEL_11;
    }
  }
LABEL_10:
  std::string::basic_string[abi:ne180100]<0>(&v9, "");
LABEL_11:
  uint64_t v6 = &v9;
  if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    uint64_t v6 = (std::string *)v9.__r_.__value_.__r.__words[0];
  }
  v14[0] = v6;
  v14[1] = 0;
  UUID::is_null((UUID *)(a1 + 184));
  dyld_shared_cache_find_iterate_text();
  uint64_t v7 = v11[3];
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

void sub_1B907EFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
}

uint64_t ___ZNK26CSCppDyldSharedCacheMemory20foreach_text_segmentEU13block_pointerFvPKcyyE_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t CSCppDyldSharedCacheMemory::foreach_text_memory(uint64_t a1)
{
  return CSCppDyldSharedCacheMemory::foreach_text_segment(a1);
}

uint64_t ___ZNK26CSCppDyldSharedCacheMemory19foreach_text_memoryEU13block_pointerFvPKcP15CSCppFileMemoryE_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  v10[0] = a3;
  v10[1] = a4;
  CSCppDyldSharedCacheMemory::file_range_for_memory_range(v6, v10, 0);
  if (v7) {
    operator new();
  }
  if (a3 - *(void *)(v6 + 216) < *(void *)(v6 + 224)) {
    operator new();
  }
  size_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v8();
}

void sub_1B907F280(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK26CSCppDyldSharedCacheMemory20TEXT_address_of_pathEPKcPy_block_invoke(uint64_t result, char *__s1, uint64_t a3, uint64_t a4)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v7 = result;
    uint64_t result = strcmp(__s1, *(const char **)(result + 56));
    if (!result || *(unsigned char *)(v7 + 72) && (uint64_t result = strcmp(__s1, *(const char **)(v7 + 64)), !result))
    {
      *(void *)(*(void *)(*(void *)(v7 + 40) + 8) + 24) = a3;
      *(void *)(*(void *)(*(void *)(v7 + 48) + 8) + 24) = a4;
      *(unsigned char *)(*(void *)(*(void *)(v7 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t CSCppDyldSharedCacheMemory::bytes_at(uint64_t a1, unint64_t a2, unint64_t a3)
{
  v7[0] = a2;
  v7[1] = a3;
  uint64_t v6 = 0;
  unint64_t v4 = CSCppDyldSharedCacheMemory::file_range_for_memory_range(a1, v7, &v6);
  uint64_t result = v6;
  if (v6) {
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)v6 + 32))(v6, v4, v3);
  }
  return result;
}

uint64_t CSCppDyldSharedCacheMemory::footprint(CSCppDyldSharedCacheMemory *this)
{
  uint64_t v2 = *((void *)this + 18);
  uint64_t v3 = *((void *)this + 19);
  uint64_t v4 = v3 - v2 + 232;
  uint64_t v5 = *((void *)this + 12);
  if (v5)
  {
    v4 += (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5);
    uint64_t v2 = *((void *)this + 18);
    uint64_t v3 = *((void *)this + 19);
  }
  while (v2 != v3)
  {
    uint64_t v6 = *(void *)(v2 + 24);
    if (v6) {
      v4 += (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6);
    }
    v2 += 32;
  }
  return v4;
}

uint64_t CSCppDyldSharedCacheMemory::to_string@<X0>(CSCppDyldSharedCacheMemory *this@<X0>, void *a2@<X8>)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v14);
  uint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v14, (uint64_t)"CSCppDyldSharedCache path:", 26);
  int v5 = *((char *)this + 39);
  if (v5 >= 0) {
    uint64_t v6 = (char *)this + 16;
  }
  else {
    uint64_t v6 = (char *)*((void *)this + 2);
  }
  if (v5 >= 0) {
    uint64_t v7 = *((unsigned __int8 *)this + 39);
  }
  else {
    uint64_t v7 = *((void *)this + 3);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)v6, v7);
  if (std::string::compare((const std::string *)((char *)this + 40), ""))
  {
    size_t v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v14, (uint64_t)", (symbol owner: ", 17);
    int v9 = *((char *)this + 63);
    if (v9 >= 0) {
      uint64_t v10 = (char *)this + 40;
    }
    else {
      uint64_t v10 = (char *)*((void *)this + 5);
    }
    if (v9 >= 0) {
      uint64_t v11 = *((unsigned __int8 *)this + 63);
    }
    else {
      uint64_t v11 = *((void *)this + 6);
    }
    uint64_t v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)v10, v11);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)")", 1);
  }
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v15, a2);
  uint64_t v14 = *MEMORY[0x1E4FBA418];
  *(void *)((char *)&v15[-1] + *(void *)(v14 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v15[0] = MEMORY[0x1E4FBA470] + 16;
  if (v16 < 0) {
    operator delete((void *)v15[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1BA9D1C60](&v17);
}

void sub_1B907F64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CSCppDyldSharedCacheMemory::is_task(CSCppDyldSharedCacheMemory *this)
{
  return 1;
}

uint64_t CSCppDyldSharedCacheMemory::is_dyld_shared_cache(CSCppDyldSharedCacheMemory *this)
{
  return 1;
}

uint64_t std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>,std::reverse_iterator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation*>,std::reverse_iterator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation*>,std::reverse_iterator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>,std::reverse_iterator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation*>,std::reverse_iterator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation*>,std::reverse_iterator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
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
      *(_OWORD *)(v7 - 32) = *(_OWORD *)(a3 - 32);
      *(void *)(v7 - 16) = *(void *)(a3 - 16);
      uint64_t v8 = *(void *)(a3 - 8);
      *(void *)(a3 - 8) = 0;
      *(void *)(v7 - 8) = v8;
      uint64_t v7 = *((void *)&v14 + 1) - 32;
      *((void *)&v14 + 1) -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>,std::reverse_iterator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>,std::reverse_iterator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>,std::reverse_iterator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation*>>::operator()[abi:ne180100]((void *)a1);
  }
  return a1;
}

void *std::_AllocatorDestroyRangeReverse<std::allocator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>,std::reverse_iterator<CSCppDyldSharedCacheMemory::CSCppAddressTranslation*>>::operator()[abi:ne180100](void *result)
{
  uint64_t v1 = *(void *)(result[2] + 8);
  uint64_t v2 = *(void *)(result[1] + 8);
  while (v1 != v2)
  {
    uint64_t result = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = 0;
    if (result) {
      uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
    v1 += 32;
  }
  return result;
}

void **std::__split_buffer<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void *std::__split_buffer<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__destruct_at_end[abi:ne180100](void *result, uint64_t a2)
{
  uint64_t v2 = result[2];
  if (v2 != a2)
  {
    uint64_t v4 = result;
    do
    {
      v4[2] = v2 - 32;
      uint64_t result = *(void **)(v2 - 8);
      *(void *)(v2 - 8) = 0;
      if (result) {
        uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
      }
      uint64_t v2 = v4[2];
    }
    while (v2 != a2);
  }
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,false>(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = (long long *)a2;
  uint64_t v10 = (long long *)result;
  unint64_t v24 = a2;
  unint64_t v25 = (long long *)result;
LABEL_2:
  for (uint64_t i = 1 - a4; ; ++i)
  {
    uint64_t v12 = (char *)v9 - (char *)v10;
    unint64_t v13 = ((char *)v9 - (char *)v10) >> 5;
    if (!(!v6 & v5))
    {
      switch(v13)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          unint64_t v22 = *((void *)v9 - 4);
          unint64_t v24 = (unint64_t)(v9 - 2);
          if (v22 < *(void *)v10) {
            uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v25, (uint64_t *)&v24);
          }
          break;
        case 3uLL:
          unint64_t v24 = (unint64_t)(v9 - 2);
          uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v10, v10 + 2, (void *)v9 - 4);
          break;
        case 4uLL:
          unint64_t v24 = (unint64_t)(v9 - 2);
          uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v10, v10 + 2, v10 + 4, (void *)v9 - 4);
          break;
        case 5uLL:
          unint64_t v24 = (unint64_t)(v9 - 2);
          uint64_t result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v10, v10 + 2, v10 + 4, v10 + 6, (void *)v9 - 4);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v12 <= 767)
    {
      if (a5) {
        return std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((uint64_t)v10, (uint64_t)v9);
      }
      else {
        return std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((uint64_t)v10, (uint64_t)v9);
      }
    }
    if (i == 1) {
      break;
    }
    unint64_t v14 = v13 >> 1;
    uint64_t v15 = v9 - 2;
    if ((unint64_t)v12 > 0x1000)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v10, &v10[2 * (v13 >> 1)], v15);
      unint64_t v16 = v24;
      uint64_t v17 = 32 * v14 - 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v25 + 2, (long long *)((char *)v25 + v17), (void *)(v24 - 64));
      uint64_t v18 = 32 * v14 + 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v25 + 4, (long long *)((char *)v25 + v18), (void *)(v16 - 96));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((long long *)((char *)v25 + v17), &v25[2 * v14], (long long *)((char *)v25 + v18));
      size_t v23 = &v25[2 * v14];
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v25, (uint64_t *)&v23);
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(&v10[2 * (v13 >> 1)], v10, v15);
    }
    if (a5)
    {
      uint64_t v9 = (long long *)v24;
    }
    else
    {
      uint64_t v9 = (long long *)v24;
      if (*((void *)v25 - 4) >= *(void *)v25)
      {
        uint64_t result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>((uint64_t)v25, v24);
        uint64_t v10 = (long long *)result;
        goto LABEL_22;
      }
    }
    float v19 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>((uint64_t)v25, (unint64_t)v9);
    if ((v20 & 1) == 0) {
      goto LABEL_20;
    }
    BOOL v21 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v25, v19);
    uint64_t v10 = v19 + 2;
    uint64_t result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v19 + 2, v9);
    if (result)
    {
      if (v21) {
        return result;
      }
      unint64_t v24 = (unint64_t)v19;
      uint64_t v10 = v25;
      uint64_t v9 = v19;
    }
    else
    {
      if (!v21)
      {
LABEL_20:
        uint64_t result = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,false>(v25, v19, a3, -i, a5 & 1);
        uint64_t v10 = v19 + 2;
LABEL_22:
        a5 = 0;
        unint64_t v25 = v10;
        a4 = -i;
        goto LABEL_2;
      }
      unint64_t v25 = v19 + 2;
    }
  }
  if (v10 != v9) {
    return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((unint64_t *)v10, v9, v9, a3);
  }
  return result;
}

uint64_t std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(long long **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  long long v10 = **a1;
  uint64_t v4 = *((void *)*a1 + 2);
  uint64_t v5 = *((void *)*a1 + 3);
  *((void *)v2 + 3) = 0;
  long long *v2 = *(_OWORD *)v3;
  *((void *)v2 + 2) = *(void *)(v3 + 16);
  uint64_t v6 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = 0;
  uint64_t v7 = *((void *)v2 + 3);
  *((void *)v2 + 3) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  *(_OWORD *)uint64_t v3 = v10;
  uint64_t result = *(void *)(v3 + 24);
  *(void *)(v3 + 16) = v4;
  *(void *)(v3 + 24) = v5;
  if (result)
  {
    uint64_t v9 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v9();
  }
  return result;
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result + 32;
    if (result + 32 != a2)
    {
      uint64_t v5 = 0;
      uint64_t v6 = result;
      do
      {
        uint64_t v7 = v6;
        uint64_t v6 = v4;
        unint64_t v8 = *(void *)(v7 + 32);
        if (v8 < *(void *)v7)
        {
          long long v17 = *(_OWORD *)(v7 + 40);
          uint64_t v9 = *(void *)(v7 + 56);
          uint64_t v10 = v5;
          *(void *)(v7 + 56) = 0;
          while (1)
          {
            uint64_t v11 = v3 + v10;
            *(_OWORD *)(v11 + 32) = *(_OWORD *)(v3 + v10);
            uint64_t v12 = *(void *)(v3 + v10 + 16);
            uint64_t v13 = *(void *)(v3 + v10 + 24);
            *(void *)(v11 + 24) = 0;
            uint64_t v14 = *(void *)(v3 + v10 + 56);
            *(void *)(v11 + 48) = v12;
            *(void *)(v11 + 56) = v13;
            if (v14) {
              (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
            }
            if (!v10) {
              break;
            }
            unint64_t v15 = *(void *)(v3 + v10 - 32);
            v10 -= 32;
            if (v8 >= v15)
            {
              uint64_t v16 = v3 + v10 + 32;
              goto LABEL_12;
            }
          }
          uint64_t v16 = v3;
LABEL_12:
          *(void *)uint64_t v16 = v8;
          *(_OWORD *)(v16 + 8) = v17;
          uint64_t result = *(void *)(v16 + 24);
          *(void *)(v16 + 24) = v9;
          if (result) {
            uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
          }
        }
        uint64_t v4 = v6 + 32;
        v5 += 32;
      }
      while (v6 + 32 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result + 32;
    if (result + 32 != a2)
    {
      uint64_t v5 = (void *)(result + 56);
      do
      {
        uint64_t v6 = v3;
        uint64_t v3 = v4;
        unint64_t v7 = *(void *)(v6 + 32);
        if (v7 < *(void *)v6)
        {
          long long v14 = *(_OWORD *)(v6 + 40);
          uint64_t v8 = *(void *)(v6 + 56);
          uint64_t v9 = v5;
          *(void *)(v6 + 56) = 0;
          do
          {
            *(_OWORD *)(v9 - 3) = *(_OWORD *)(v9 - 7);
            uint64_t v10 = *(v9 - 5);
            uint64_t v11 = *(v9 - 4);
            *(v9 - 4) = 0;
            uint64_t v12 = *v9;
            *(v9 - 1) = v10;
            *uint64_t v9 = v11;
            if (v12) {
              (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
            }
            unint64_t v13 = *(v9 - 11);
            v9 -= 4;
          }
          while (v7 < v13);
          *(v9 - 3) = v7;
          *((_OWORD *)v9 - 1) = v14;
          uint64_t result = *v9;
          *uint64_t v9 = v8;
          if (result) {
            uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
          }
        }
        uint64_t v4 = v3 + 32;
        v5 += 4;
      }
      while (v3 + 32 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(long long *a1, long long *a2, void *a3)
{
  uint64_t v10 = a1;
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  unint64_t v3 = *(void *)a2;
  unint64_t v4 = *a3;
  if (*(void *)a2 < *(void *)a1)
  {
    if (v4 < v3)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v10, (uint64_t *)&v8);
      return 1;
    }
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v10, (uint64_t *)&v9);
    if (*v8 >= *(void *)v9) {
      return 1;
    }
    uint64_t v5 = &v9;
    uint64_t v6 = (uint64_t *)&v8;
LABEL_9:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(v5, v6);
    return 2;
  }
  if (v4 < v3)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v9, (uint64_t *)&v8);
    if (*(void *)v9 >= *(void *)v10) {
      return 1;
    }
    uint64_t v5 = &v10;
    uint64_t v6 = (uint64_t *)&v9;
    goto LABEL_9;
  }
  return 0;
}

long long *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>(uint64_t a1, unint64_t a2)
{
  unint64_t v20 = a2;
  long long v3 = *(_OWORD *)a1;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  unint64_t v6 = v3;
  if ((unint64_t)v3 >= *(void *)(a2 - 32))
  {
    uint64_t v9 = (long long *)(a1 + 32);
    do
    {
      unint64_t v7 = v9;
      if ((unint64_t)v9 >= a2) {
        break;
      }
      v9 += 2;
    }
    while ((unint64_t)v3 >= *(void *)v7);
  }
  else
  {
    unint64_t v7 = (long long *)a1;
    do
    {
      unint64_t v8 = *((void *)v7 + 4);
      v7 += 2;
    }
    while ((unint64_t)v3 >= v8);
  }
  BOOL v21 = v7;
  long long v19 = v3;
  if ((unint64_t)v7 < a2)
  {
    do
    {
      unint64_t v10 = *(void *)(a2 - 32);
      a2 -= 32;
    }
    while ((unint64_t)v3 < v10);
    unint64_t v20 = a2;
  }
  if ((unint64_t)v7 < a2)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v21, (uint64_t *)&v20);
      unint64_t v7 = v21;
      do
      {
        unint64_t v11 = *((void *)v7 + 4);
        v7 += 2;
      }
      while (v6 >= v11);
      BOOL v21 = v7;
      unint64_t v12 = v20;
      do
      {
        unint64_t v13 = *(void *)(v12 - 32);
        v12 -= 32;
      }
      while (v6 < v13);
      unint64_t v20 = v12;
    }
    while ((unint64_t)v7 < v12);
  }
  if (v7 - 2 != (long long *)a1)
  {
    *(_OWORD *)a1 = *(v7 - 2);
    uint64_t v14 = *((void *)v7 - 2);
    uint64_t v15 = *((void *)v7 - 1);
    *((void *)v7 - 1) = 0;
    uint64_t v16 = *(void *)(a1 + 24);
    *(void *)(a1 + 16) = v14;
    *(void *)(a1 + 24) = v15;
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
    }
  }
  *(v7 - 2) = v19;
  uint64_t v17 = *((void *)v7 - 1);
  *((void *)v7 - 2) = v4;
  *((void *)v7 - 1) = v5;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  return v21;
}

long long *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = 0;
  long long v5 = *(_OWORD *)a1;
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  long long v22 = v5;
  unint64_t v8 = v5;
  do
  {
    unint64_t v9 = *(void *)(a1 + v4 + 32);
    v4 += 32;
  }
  while (v9 < (unint64_t)v5);
  unint64_t v10 = a1 + v4;
  unint64_t v24 = (long long *)(a1 + v4);
  if (v4 == 32)
  {
    do
    {
      if (v10 >= a2) {
        break;
      }
      unint64_t v12 = *(void *)(a2 - 32);
      a2 -= 32;
    }
    while (v12 >= (unint64_t)v5);
  }
  else
  {
    do
    {
      unint64_t v11 = *(void *)(a2 - 32);
      a2 -= 32;
    }
    while (v11 >= (unint64_t)v5);
  }
  unint64_t v23 = a2;
  unint64_t v13 = (long long *)(a1 + v4);
  if (v10 < a2)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v24, (uint64_t *)&v23);
      unint64_t v13 = v24;
      do
      {
        unint64_t v14 = *((void *)v13 + 4);
        v13 += 2;
      }
      while (v14 < v8);
      unint64_t v24 = v13;
      unint64_t v15 = v23;
      do
      {
        unint64_t v16 = *(void *)(v15 - 32);
        v15 -= 32;
      }
      while (v16 >= v8);
      unint64_t v23 = v15;
    }
    while ((unint64_t)v13 < v15);
  }
  if (v13 - 2 != (long long *)a1)
  {
    *(_OWORD *)a1 = *(v13 - 2);
    uint64_t v17 = *((void *)v13 - 2);
    uint64_t v18 = *((void *)v13 - 1);
    *((void *)v13 - 1) = 0;
    uint64_t v19 = *(void *)(a1 + 24);
    *(void *)(a1 + 16) = v17;
    *(void *)(a1 + 24) = v18;
    if (v19) {
      (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
    }
  }
  *(v13 - 2) = v22;
  uint64_t v20 = *((void *)v13 - 1);
  *((void *)v13 - 2) = v6;
  *((void *)v13 - 1) = v7;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  return v13 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(long long *a1, long long *a2)
{
  long long v22 = a1;
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 5;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unint64_t v6 = *((void *)a2 - 4);
      BOOL v21 = a2 - 2;
      if (v6 < *(void *)a1)
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v22, (uint64_t *)&v21);
        return 1;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a1 + 2, (void *)a2 - 4);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a1 + 2, a1 + 4, (void *)a2 - 4);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a1 + 2, a1 + 4, a1 + 6, (void *)a2 - 4);
      return 1;
    default:
      uint64_t v7 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a1 + 2, (void *)a1 + 8);
      unint64_t v8 = a1 + 6;
      if (a1 + 6 == a2) {
        return 1;
      }
      int v9 = 0;
      unint64_t v10 = (uint64_t *)a1 + 15;
      break;
  }
  while (1)
  {
    unint64_t v11 = *(void *)v8;
    if (*(void *)v8 < *(void *)v7)
    {
      long long v20 = *(long long *)((char *)v8 + 8);
      uint64_t v12 = *((void *)v8 + 3);
      *((void *)v8 + 3) = 0;
      unint64_t v13 = v10;
      unint64_t v14 = v22;
      while (1)
      {
        *(_OWORD *)(v13 - 3) = *(_OWORD *)(v13 - 7);
        uint64_t v15 = *(v13 - 5);
        uint64_t v16 = *(v13 - 4);
        *(v13 - 4) = 0;
        uint64_t v17 = *v13;
        *(v13 - 1) = v15;
        *unint64_t v13 = v16;
        if (v17) {
          (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
        }
        if (v13 - 7 == (uint64_t *)v14) {
          break;
        }
        unint64_t v18 = *(v13 - 11);
        v13 -= 4;
        if (v11 >= v18)
        {
          unint64_t v14 = (long long *)(v13 - 3);
          break;
        }
      }
      *(void *)unint64_t v14 = v11;
      *(long long *)((char *)v14 + 8) = v20;
      uint64_t v19 = *((void *)v14 + 3);
      *((void *)v14 + 3) = v12;
      if (v19) {
        (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
      }
      if (++v9 == 8) {
        return v8 + 2 == a2;
      }
    }
    uint64_t v7 = v8;
    v10 += 4;
    v8 += 2;
    if (v8 == a2) {
      return 1;
    }
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(long long *a1, long long *a2, long long *a3, void *a4)
{
  unint64_t v11 = a2;
  uint64_t v12 = a1;
  int v9 = a4;
  unint64_t v10 = a3;
  uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a2, a3);
  if (*a4 < *(void *)a3)
  {
    uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v10, (uint64_t *)&v9);
    if (*(void *)v10 < *(void *)a2)
    {
      uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v11, (uint64_t *)&v10);
      if (*(void *)v11 < *(void *)a1) {
        return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v12, (uint64_t *)&v11);
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(long long *a1, long long *a2, long long *a3, long long *a4, void *a5)
{
  unint64_t v14 = a2;
  uint64_t v15 = a1;
  uint64_t v12 = a4;
  unint64_t v13 = a3;
  unint64_t v11 = a5;
  uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a2, a3, a4);
  if (*a5 < *(void *)a4)
  {
    uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v12, (uint64_t *)&v11);
    if (*(void *)v12 < *(void *)a3)
    {
      uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v13, (uint64_t *)&v12);
      if (*(void *)v13 < *(void *)a2)
      {
        uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v14, (uint64_t *)&v13);
        if (*(void *)v14 < *(void *)a1) {
          return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v15, (uint64_t *)&v14);
        }
      }
    }
  }
  return result;
}

long long *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(unint64_t *a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v19 = a1;
  if (a1 != (unint64_t *)a2)
  {
    unint64_t v6 = a2;
    uint64_t v7 = a1;
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) >> 5;
    if ((char *)a2 - (char *)a1 >= 33)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[4 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((uint64_t)v7, a4, v9, v12);
        v12 -= 4;
        --v11;
      }
      while (v11);
    }
    unint64_t v18 = v6;
    if (v6 == a3)
    {
      a3 = v6;
    }
    else
    {
      unint64_t v13 = v6;
      do
      {
        if (*(void *)v13 < *v19)
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v18, (uint64_t *)&v19);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((uint64_t)v19, a4, v9, v19);
          unint64_t v13 = v18;
        }
        v13 += 2;
        unint64_t v18 = v13;
      }
      while (v13 != a3);
      uint64_t v7 = v19;
      uint64_t v8 = (char *)v6 - (char *)v19;
    }
    if (v8 >= 33)
    {
      unint64_t v14 = (unint64_t)v8 >> 5;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v7, (uint64_t)v6, a4, v14);
        v6 -= 2;
        BOOL v15 = v14 >= 2;
        BOOL v16 = v14-- == 2;
      }
      while (!v16 && v15);
      return v18;
    }
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(uint64_t result, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    long long v5 = a4;
    uint64_t v6 = result;
    uint64_t v7 = (uint64_t)a4 - result;
    uint64_t v8 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 5)
    {
      uint64_t v10 = v7 >> 4;
      uint64_t v11 = (v7 >> 4) + 1;
      uint64_t v12 = (unint64_t *)(result + 32 * v11);
      uint64_t v13 = v10 + 2;
      if (v10 + 2 >= a3)
      {
        unint64_t v14 = *v12;
      }
      else
      {
        unint64_t v14 = *v12;
        unint64_t v15 = v12[4];
        if (*v12 <= v15) {
          unint64_t v14 = v12[4];
        }
        if (*v12 < v15)
        {
          v12 += 4;
          uint64_t v11 = v13;
        }
      }
      unint64_t v16 = *a4;
      if (v14 >= *a4)
      {
        long long v25 = *(_OWORD *)(a4 + 1);
        unint64_t v17 = a4[3];
        a4[3] = 0;
        do
        {
          unint64_t v18 = v5;
          long long v5 = v12;
          *(_OWORD *)unint64_t v18 = *(_OWORD *)v12;
          unint64_t v19 = v12[2];
          unint64_t v20 = v5[3];
          v5[3] = 0;
          unint64_t v21 = v18[3];
          v18[2] = v19;
          v18[3] = v20;
          if (v21) {
            (*(void (**)(unint64_t))(*(void *)v21 + 8))(v21);
          }
          if (v8 < v11) {
            break;
          }
          uint64_t v12 = (unint64_t *)(v6 + 32 * ((2 * v11) | 1));
          if (2 * v11 + 2 >= a3)
          {
            unint64_t v22 = *v12;
            uint64_t v11 = (2 * v11) | 1;
          }
          else
          {
            unint64_t v22 = *v12;
            unint64_t v23 = v12[4];
            if (*v12 <= v23) {
              unint64_t v22 = v12[4];
            }
            if (*v12 >= v23)
            {
              uint64_t v11 = (2 * v11) | 1;
            }
            else
            {
              v12 += 4;
              uint64_t v11 = 2 * v11 + 2;
            }
          }
        }
        while (v22 >= v16);
        unint64_t *v5 = v16;
        *(_OWORD *)(v5 + 1) = v25;
        uint64_t result = v5[3];
        v5[3] = v17;
        if (result)
        {
          unint64_t v24 = *(uint64_t (**)(void))(*(void *)result + 8);
          return v24();
        }
      }
    }
  }
  return result;
}

void *std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v6 = (uint64_t)result;
    long long v16 = *(_OWORD *)result;
    uint64_t v8 = result[2];
    uint64_t v7 = result[3];
    result[3] = 0;
    uint64_t v9 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(result, a3, a4);
    uint64_t v10 = v9;
    uint64_t v11 = (_OWORD *)(a2 - 32);
    if (v9 == (void *)(a2 - 32))
    {
      *(_OWORD *)uint64_t v9 = v16;
      uint64_t result = (void *)v9[3];
      unint64_t v10[2] = v8;
      v10[3] = v7;
      if (result) {
        return (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
      }
    }
    else
    {
      *(_OWORD *)uint64_t v9 = *v11;
      _OWORD v9[2] = *(void *)(a2 - 16);
      uint64_t v12 = *(void *)(a2 - 8);
      *(void *)(a2 - 8) = 0;
      uint64_t v13 = v9[3];
      v10[3] = v12;
      if (v13) {
        (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
      }
      uint64_t v14 = (uint64_t)(v10 + 4);
      _OWORD *v11 = v16;
      uint64_t v15 = *(void *)(a2 - 8);
      *(void *)(a2 - 16) = v8;
      *(void *)(a2 - 8) = v7;
      if (v15) {
        (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
      }
      return (void *)std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v6, v14, a3, (v14 - v6) >> 5);
    }
  }
  return result;
}

void sub_1B9080ABC(_Unwind_Exception *exception_object)
{
  if (v1) {
    CSCppDyldSplitSharedCacheMemory::analyze_primary_cache_for_symbols_file(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  uint64_t v5 = a3 - 2;
  if (a3 < 2) {
    uint64_t v5 = a3 - 1;
  }
  uint64_t v6 = v5 >> 1;
  do
  {
    uint64_t v7 = &a1[4 * v4 + 4];
    uint64_t v8 = 2 * v4;
    uint64_t v4 = (2 * v4) | 1;
    if (v8 + 2 < a3 && *v7 < v7[4])
    {
      v7 += 4;
      uint64_t v4 = v8 + 2;
    }
    *(_OWORD *)a1 = *(_OWORD *)v7;
    uint64_t v9 = v7[2];
    uint64_t v10 = v7[3];
    v7[3] = 0;
    uint64_t v11 = a1[3];
    a1[2] = v9;
    a1[3] = v10;
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    }
    a1 = v7;
  }
  while (v4 <= v6);
  return v7;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v5 = result;
    unint64_t v6 = v4 >> 1;
    uint64_t v7 = result + 32 * (v4 >> 1);
    uint64_t v8 = a2 - 32;
    unint64_t v9 = *(void *)(a2 - 32);
    if (*(void *)v7 < v9)
    {
      long long v16 = *(_OWORD *)(a2 - 24);
      uint64_t v10 = *(void *)(a2 - 8);
      *(void *)(a2 - 8) = 0;
      do
      {
        uint64_t v11 = v8;
        uint64_t v8 = v7;
        *(_OWORD *)uint64_t v11 = *(_OWORD *)v7;
        uint64_t v12 = *(void *)(v7 + 16);
        uint64_t v13 = *(void *)(v8 + 24);
        *(void *)(v8 + 24) = 0;
        uint64_t v14 = *(void *)(v11 + 24);
        *(void *)(v11 + 16) = v12;
        *(void *)(v11 + 24) = v13;
        if (v14) {
          (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
        }
        if (!v6) {
          break;
        }
        unint64_t v6 = (v6 - 1) >> 1;
        uint64_t v7 = v5 + 32 * v6;
      }
      while (*(void *)v7 < v9);
      *(void *)uint64_t v8 = v9;
      *(_OWORD *)(v8 + 8) = v16;
      uint64_t result = *(void *)(v8 + 24);
      *(void *)(v8 + 24) = v10;
      if (result)
      {
        uint64_t v15 = *(uint64_t (**)(void))(*(void *)result + 8);
        return v15();
      }
    }
  }
  return result;
}

void std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__clear[abi:ne180100](v2);
    long long v3 = **a1;
    operator delete(v3);
  }
}

void *std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__clear[abi:ne180100](void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = *result;
  for (uint64_t i = result[1]; i != v2; i -= 32)
  {
    uint64_t result = *(void **)(i - 8);
    *(void *)(i - 8) = 0;
    if (result) {
      uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
  }
  v1[1] = v2;
  return result;
}

TMMapArchive *CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked(CSCppMMapArchiveCache *this, TMMapArchive *a2, CSCppSymbolOwner *a3)
{
  long long v3 = a2;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (!*((_DWORD *)this + 20))
    {
      CSCppTextSectionDataDescriptor::CSCppTextSectionDataDescriptor((CSCppTextSectionDataDescriptor *)v17, a2);
      uint64_t v13 = *((void *)v3 + 14);
      if (CSCppArchitecture::is_64_bit((CSCppArchitecture *)&v13))
      {
        CSCppTextSectionDataDescriptor::get_text_section<Pointer64>((uint64_t)v17, (uint64_t)v3, &v13);
        uint64_t v5 = v13;
        unint64_t v6 = v14;
        uint64_t v7 = v15;
      }
      else
      {
        unint64_t text = CSCppTextSectionDataDescriptor::get_text_section<Pointer32>((unint64_t)v17, (uint64_t)v3);
        uint64_t v7 = v9;
        uint64_t v5 = text;
        unint64_t v6 = HIDWORD(text);
      }
      new_mmap_archive_with_unint64_t text = this;
      if (v7)
      {
        uint64_t v13 = v5;
        unint64_t v14 = v6;
        uint64_t v15 = v7;
        v12[0] = CSCppMMapArchiveCache::compute_text_section_slide_for_mmap<Pointer64>((uint64_t)this, (uint64_t)v3, &v13)+ v5;
        v12[1] = v6;
        v12[2] = v7;
        new_mmap_archive_with_unint64_t text = _create_new_mmap_archive_with_text_data<TRangeValue<Pointer64,unsigned char *>>((unsigned int *)this, (unsigned int *)v12);
      }
      std::mutex::~mutex(&v21);
      long long v16 = (void **)&v20;
      std::vector<std::unique_ptr<CSCppMemory>>::__destroy_vector::operator()[abi:ne180100](&v16);
      if (v19 < 0) {
        operator delete(v18[4]);
      }
      std::__tree<TRange<Pointer64>>::destroy((uint64_t)v18, v18[1]);
      if (new_mmap_archive_with_text != this) {
        CSCppMMapArchiveCache::make_archive_wrapper();
      }
    }
    return 0;
  }
  return v3;
}

void sub_1B9080F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  CSCppTextSectionDataDescriptor::~CSCppTextSectionDataDescriptor((CSCppTextSectionDataDescriptor *)va);
  _Unwind_Resume(a1);
}

void CSCppMMapArchiveCache::make_archive_wrapper()
{
}

void sub_1B9080FF4(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9D1CD0](v1, 0x10E1C408645BDD7);
  _Unwind_Resume(a1);
}

void *CSCppMMapArchiveCache::_add_archive_wrapper_locked(CSCppMMapArchiveCache *this, TMMapArchive *a2, ArchiveWrapper *a3)
{
  if ((*((unsigned char *)a2 + 24) & 8) != 0) {
    uint64_t v5 = (TMMapArchive *)*((void *)a2 + 5);
  }
  else {
    uint64_t v5 = 0;
  }
  CSCppMMapArchiveCache::_kill_existing_matching_entries_locked(this, v5);

  return CSCppMMapArchiveCache::_add_archive_wrapper_locked_no_kill(this, a2, v6);
}

CSCppMMapArchiveCache *CSCppMMapArchiveCache::augment_mmap_archive_to_include_text_section(CSCppMMapArchiveCache *this, TMMapArchive *a2, CSCppSymbolOwner *a3)
{
  pthread_mutex_lock(&_cache_lock);
  unint64_t v6 = CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked(this, a2, v5);
  if (v6) {
    this = (CSCppMMapArchiveCache *)*((void *)v6 + 2);
  }
  pthread_mutex_unlock(&_cache_lock);
  return this;
}

void sub_1B90810C8(_Unwind_Exception *a1)
{
}

TMMapArchive *CSCppMMapArchiveCache::_lookup_archive_wrapper_in_local_cache_locked(__n128 *this, const UUID *a2, int a3, void *a4, unint64_t *a5, __int16 *a6, os_unfair_lock_s **a7, CSCppSymbolOwner *a8)
{
  if (!UUID::is_null((UUID *)this))
  {
    if (!_mmap_archive_cache) {
      operator new();
    }
    long long v16 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__equal_range_multi<UUID>((void *)_mmap_archive_cache, this);
    unint64_t v18 = v17;
    if (a7) {
      unsigned int v19 = (CSCppSymbolicator::flags(a7[1]) >> 2) & 1;
    }
    else {
      unsigned int v19 = 0;
    }
    while (1)
    {
      if (v16 == v18) {
        return 0;
      }
      uint64_t v20 = v16[4];
      int v21 = *(_DWORD *)(v20 + 24);
      if ((v21 & 8) != 0)
      {
        uint64_t v22 = *(const UUID **)(v20 + 40);
        if (v21 < 0) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v22 = 0;
        if (v21 < 0) {
          goto LABEL_12;
        }
      }
      if (v22 == a2)
      {
        unint64_t v24 = *(CSCppMMapArchiveCache **)(v20 + 16);
        int v25 = *((_DWORD *)v24 + 7);
        if ((v25 & 0x1000) != 0)
        {
          BOOL v26 = *((_DWORD *)v24 + 20) == 0;
          if (!a7) {
            goto LABEL_21;
          }
        }
        else
        {
          BOOL v26 = 1;
          if (!a7)
          {
LABEL_21:
            BOOL v27 = 0;
            goto LABEL_25;
          }
        }
        if ((*((unsigned char *)a7 + 110) & 0x40) == 0) {
          goto LABEL_21;
        }
        v28 = a7[16];
        if (!v28) {
          v28 = a7[15];
        }
        BOOL v27 = v28 != 0;
LABEL_25:
        BOOL v29 = (v25 & 0x10) == 0 && v27;
        if ((v26 & v19 & 1) == 0 && !v29)
        {
LABEL_30:
          CSCppReferenceCount::retain(v20);
          uint64_t result = (TMMapArchive *)v20;
          goto LABEL_31;
        }
        unsigned int v34 = v19;
        uint64_t result = CSCppMMapArchiveCache::_lookup_archive_wrapper_in_daemon_cache_locked(this, a2, a3, a4, a5, a6, (__int16 *)a7, v15);
        if (!result)
        {
          if (!v34) {
            goto LABEL_30;
          }
          uint64_t result = CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked(v24, (TMMapArchive *)a7, v30);
          goto LABEL_50;
        }
        uint64_t v31 = *((void *)result + 2);
        if (!v31) {
          goto LABEL_30;
        }
        if (v34)
        {
          if (*(_DWORD *)(v31 + 80)) {
            BOOL v32 = 0;
          }
          else {
            BOOL v32 = v29;
          }
          if (*(_DWORD *)(v31 + 80)) {
            char v33 = result;
          }
          else {
            char v33 = 0;
          }
          if (!v32)
          {
            uint64_t result = v33;
LABEL_50:
            if (!result) {
              goto LABEL_30;
            }
LABEL_31:
            if (a4) {
              *a4 = *(unsigned int *)(*((void *)result + 2) + 4);
            }
            if (a5) {
              *(_WORD *)a5 = *((_WORD *)result + 24);
            }
            if (a6) {
              *a6 = *((_WORD *)result + 25);
            }
            return result;
          }
        }
        else if (!v29)
        {
          goto LABEL_30;
        }
        if ((*(unsigned char *)(v31 + 28) & 0x10) == 0) {
          goto LABEL_30;
        }
        goto LABEL_31;
      }
LABEL_12:
      long long v16 = (void *)*v16;
    }
  }
  return 0;
}

TMMapArchive *CSCppMMapArchiveCache::_lookup_archive_wrapper_in_daemon_cache_locked(__n128 *this, const UUID *a2, int a3, void *a4, unint64_t *a5, __int16 *a6, __int16 *a7, CSCppSymbolOwner *a8)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  if (a2)
  {
    if (*((void *)a7 + 18)) {
      return 0;
    }
    goto LABEL_6;
  }
  if (a7)
  {
LABEL_6:
    BOOL v13 = (CSCppSymbolicator::flags(*((os_unfair_lock_s **)a7 + 1)) & 4) == 0;
    goto LABEL_8;
  }
  BOOL v13 = 1;
LABEL_8:
  uint64_t v22 = 0;
  uid_t v14 = geteuid();
  MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry((MMapArchiveFileSystem::ArchiveEntry *)v23, this, 0, v14, 0, 7, 0xFFFF);
  unint64_t v21 = 0;
  *(_DWORD *)uint64_t v20 = 0;
  uint64_t v15 = (_xpc_connection_s **)mmap_storage_daemon();
  if (CSCppDaemonConnection::read_mmap_archive(v15, v23, &v22, &v21, &v20[1], v20)) {
    return 0;
  }
  if ((*((unsigned char *)v22 + 29) & 0x10) != 0
    || (*((_DWORD *)v22 + 20) ? (char v19 = 1) : (char v19 = v13),
        (v19 & 1) != 0
     || (unint64_t v17 = CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked(v22, (TMMapArchive *)a7, v16)) == 0))
  {
    operator new();
  }
  munmap(v22, v21);
  if (a4) {
    *a4 = *(unsigned int *)(*((void *)v17 + 2) + 4);
  }
  if (a5) {
    *(_WORD *)a5 = v20[1];
  }
  if (a6) {
    *a6 = v20[0];
  }
  return v17;
}

uint64_t mmap_storage_daemon(void)
{
  if (!_mmap_storage_daemon) {
    operator new();
  }
  return _mmap_storage_daemon;
}

void sub_1B9081524(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9D1CD0](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

uint64_t CSCppMMapArchiveCache::archive_for_uuid(__n128 *this, const UUID *a2, int a3, void *a4, unint64_t *a5, __int16 *a6, os_unfair_lock_s **a7, CSCppSymbolOwner *a8)
{
  pthread_mutex_lock(&_cache_lock);
  long long v16 = CSCppMMapArchiveCache::_lookup_archive_wrapper_in_local_cache_locked(this, a2, a3, a4, a5, a6, a7, v15);
  if (v16
    || (long long v16 = CSCppMMapArchiveCache::_lookup_archive_wrapper_in_daemon_cache_locked(this, a2, a3, a4, a5, a6, (__int16 *)a7, v17)) != 0)
  {
    uint64_t v18 = *((void *)v16 + 2);
  }
  else
  {
    uint64_t v18 = 0;
  }
  pthread_mutex_unlock(&_cache_lock);
  return v18;
}

void sub_1B908160C(_Unwind_Exception *a1)
{
}

uint64_t *CSCppMMapArchiveCache::_kill_existing_matching_entries_locked(CSCppMMapArchiveCache *this, TMMapArchive *a2)
{
  if (!_mmap_archive_cache) {
    operator new();
  }
  for (uint64_t result = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__equal_range_multi<UUID>((void *)_mmap_archive_cache, (CSCppMMapArchiveCache *)((char *)this + 52)); result != v4; uint64_t result = (uint64_t *)*result)
  {
    uint64_t v5 = result[4];
    int v6 = *(_DWORD *)(v5 + 24);
    if ((v6 & 8) != 0) {
      uint64_t v7 = *(TMMapArchive **)(v5 + 40);
    }
    else {
      uint64_t v7 = 0;
    }
    if (v7 == a2) {
      *(_DWORD *)(v5 + 24) = v6 | 0x80000000;
    }
  }
  return result;
}

void *CSCppMMapArchiveCache::_add_archive_wrapper_locked_no_kill(CSCppMMapArchiveCache *this, TMMapArchive *a2, ArchiveWrapper *a3)
{
  unint64_t v4 = a2;
  if (!_mmap_archive_cache) {
    operator new();
  }
  return std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<UUID const&,ArchiveWrapper *&>((void *)_mmap_archive_cache, (CSCppMMapArchiveCache *)((char *)this + 52), &v4);
}

uint64_t CSCppMMapArchiveCache::add_archive_wrapper(CSCppMMapArchiveCache *this, TMMapArchive *a2, ArchiveWrapper *a3)
{
  pthread_mutex_lock(&_cache_lock);
  CSCppMMapArchiveCache::_add_archive_wrapper_locked(this, a2, v5);
  return pthread_mutex_unlock(&_cache_lock);
}

void sub_1B9081788(_Unwind_Exception *a1)
{
}

TMMapArchive *CSCppMMapArchiveCache::_add_archive_to_daemon_locked(TMMapArchive *a1, unint64_t *a2, _DWORD *a3, char *__source)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (CSCppMMapArchiveCache::_should_store_to_daemon)
  {
    *(void *)__dst = 0;
    strlcpy(__dst, __source, 8uLL);
    MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry((MMapArchiveFileSystem::ArchiveEntry *)v12, (__n128 *)((char *)a1 + 52), *(uint64_t *)__dst, -1, 0, 7, 0);
    int v10 = 0;
    uint64_t v9 = a1;
    uint64_t v7 = (_xpc_connection_s **)mmap_storage_daemon();
    if (CSCppDaemonConnection::write_mmap_archive(v7, v12, &v10, &v9, a2))
    {
      if (v10 == 4) {
        CSCppMMapArchiveCache::_should_store_to_daemon = 0;
      }
    }
    else if (!v10)
    {
      mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)a1, *((unsigned int *)a1 + 1));
      a1 = v9;
      *a3 = 2;
    }
  }
  return a1;
}

void CSCppMMapArchiveCache::add_archive(unsigned int *a1, int a2, TMMapArchive *a3, int a4, char *a5)
{
  int v11 = a2;
  pthread_mutex_lock(&_cache_lock);
  CSCppMMapArchiveCache::_kill_existing_matching_entries_locked((CSCppMMapArchiveCache *)a1, a3);
  unint64_t v10 = a1[1];
  if (a2 == 1)
  {
    if (a4) {
      CSCppMMapArchiveCache::_add_archive_to_daemon_locked((TMMapArchive *)a1, &v10, &v11, a5);
    }
  }
  operator new();
}

void sub_1B90819C8(_Unwind_Exception *a1)
{
}

uint64_t CSCppMMapArchiveCache::release_archive(uint64_t this, TMMapArchive *a2)
{
  if (this)
  {
    uint64_t v2 = this;
    long long v3 = (void *)(this + 52);
    this = UUID::is_null((UUID *)(this + 52));
    if ((this & 1) == 0)
    {
      pthread_mutex_lock(&_cache_lock);
      unint64_t v4 = (void *)_mmap_archive_cache;
      if (!_mmap_archive_cache) {
        operator new();
      }
      for (uint64_t i = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__equal_range_multi<UUID>((void *)_mmap_archive_cache, v3); i != v5; uint64_t i = (uint64_t *)*i)
      {
        uint64_t v7 = i[4];
        if (*(void *)(v7 + 16) == v2)
        {
          unsigned int v8 = atomic_load((unsigned int *)(v7 + 8));
          if (v8 == 1 || (*(unsigned char *)(v7 + 24) & 0x10) != 0 && (unsigned int v9 = atomic_load((unsigned int *)(v7 + 8)), v9 == 2)) {
            std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::erase(v4, i);
          }
          if ((*(unsigned char *)(v7 + 24) & 0x10) != 0 && (unsigned int v10 = atomic_load((unsigned int *)(v7 + 8)), v10 == 2)) {
            signed int v11 = 2;
          }
          else {
            signed int v11 = 1;
          }
          CSCppReferenceCount::release((atomic_uint *)v7, v11);
          return pthread_mutex_unlock(&_cache_lock);
        }
      }
      return pthread_mutex_unlock(&_cache_lock);
    }
  }
  return this;
}

void sub_1B9081B14(_Unwind_Exception *a1)
{
}

void CSCppMMapArchiveCache::add_signature_archive<__CFData const*>(unsigned int *a1, uint64_t a2, TMMapArchive *a3, int a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&_cache_lock);
  if (!_mmap_archive_cache) {
    operator new();
  }
  CSCppMMapArchiveCache::_kill_existing_matching_entries_locked((CSCppMMapArchiveCache *)a1, a3);
  unint64_t v10 = 0;
  int v9 = 4;
  if (a4)
  {
    mach_vm_size_t v7 = a1[1];
    address[0] = 0;
    address[1] = v7;
    mach_vm_allocate(*MEMORY[0x1E4F14960], address, v7, 3);
    unsigned int v8 = (TMMapArchive *)address[0];
    if (address[0])
    {
      memcpy((void *)address[0], a1, a1[1]);
      unsigned int v8 = (TMMapArchive *)address[0];
    }
    CSCppMMapArchiveCache::_add_archive_to_daemon_locked(v8, &v10, &v9, "system");
    if (v9 == 2) {
      address[0] = 0;
    }
    MachVMAllocatePtr<TMMapArchive>::~MachVMAllocatePtr(address);
  }
  operator new();
}

void sub_1B9081CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  MachVMAllocatePtr<TMMapArchive>::~MachVMAllocatePtr((mach_vm_address_t *)va);
  pthread_mutex_unlock(&_cache_lock);
  _Unwind_Resume(a1);
}

uint64_t CSCppMMapArchiveCache::compute_text_section_slide_for_mmap<Pointer64>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v4 = *(void **)(a2 + 32);
  uint64_t v5 = *(void **)(a2 + 40);
  if (v4 != v5)
  {
    uint64_t v6 = *a3;
    while (1)
    {
      mach_vm_size_t v7 = (const char *)(v4[3] ? v4[3] : v4[2]);
      if (!strncmp(v7, "__TEXT", 6uLL) && (unint64_t)(v6 - *v4) < v4[1]) {
        break;
      }
      v4 += 4;
      if (v4 == v5) {
        return 0;
      }
    }
  }
  if (v4 == v5) {
    return 0;
  }
  uint64_t v8 = *(unsigned int *)(a1 + 8);
  if (!v8) {
    return 0;
  }
  int v9 = (const char *)v4[3];
  unint64_t v10 = (const char *)(a1 + 112);
  uint64_t v11 = 32 * v8;
  while (1)
  {
    uint64_t v12 = v9;
    if (!v9) {
      uint64_t v12 = (const char *)v4[2];
    }
    if (!strncmp(v10, v12, 0x10uLL)) {
      break;
    }
    v10 += 32;
    v11 -= 32;
    if (!v11) {
      return 0;
    }
  }
  return *((void *)v10 - 2) - *v4;
}

TMMapArchive *_create_new_mmap_archive_with_text_data<TRangeValue<Pointer64,unsigned char *>>(unsigned int *a1, unsigned int *a2)
{
  long long v3 = (TMMapArchive *)a1;
  unint64_t v4 = (TMMapArchive *)(*((void *)a2 + 1) + a1[1]);
  v15[0] = 0;
  v15[1] = v4;
  mach_vm_allocate(*MEMORY[0x1E4F14960], (mach_vm_address_t *)v15, (mach_vm_size_t)v4, 3);
  uint64_t v5 = v15[0];
  if (v15[0])
  {
    uint64_t v6 = *a2;
    uint64_t v8 = *((void *)a2 + 1);
    mach_vm_size_t v7 = (const void *)*((void *)a2 + 2);
    uint64_t v9 = v6 | (v8 << 32);
    long long v10 = *((_OWORD *)v3 + 1);
    *(_OWORD *)v15[0] = *(_OWORD *)v3;
    long long v11 = *((_OWORD *)v3 + 2);
    long long v12 = *((_OWORD *)v3 + 3);
    long long v13 = *((_OWORD *)v3 + 5);
    *((_OWORD *)v5 + 4) = *((_OWORD *)v3 + 4);
    *((_OWORD *)v5 + 5) = v13;
    *((_OWORD *)v5 + 2) = v11;
    *((_OWORD *)v5 + 3) = v12;
    *((_OWORD *)v5 + 1) = v10;
    *((_DWORD *)v5 + 1) = v4;
    *((_DWORD *)v5 + 12) = TMMapArchive::calculate_checksum((int32x4_t *)v5);
    *(void *)((char *)v5 + 76) = v9;
    TMMapArchive::copy_payload_from_archive(v5, v3);
    *((_DWORD *)v5 + 7) |= 0x1000u;
    *((_DWORD *)v5 + 12) = TMMapArchive::calculate_checksum((int32x4_t *)v5);
    memcpy((char *)v5+ 32 * *((_DWORD *)v5 + 2)+ 24 * *((_DWORD *)v5 + 3)+ (24 * *((_DWORD *)v5 + 4))+ (unint64_t)(4 * *((_DWORD *)v5 + 4))+ (36 * *((_DWORD *)v5 + 5))+ (20 * *((_DWORD *)v5 + 6))+ *((unsigned int *)v5 + 22)+ 96, v7, v8);
    long long v3 = v15[0];
    v15[0] = 0;
  }
  MachVMAllocatePtr<TMMapArchive>::~MachVMAllocatePtr((mach_vm_address_t *)v15);
  return v3;
}

void sub_1B9081F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, mach_vm_address_t a9)
{
}

void CSCppTextSectionDataDescriptor::~CSCppTextSectionDataDescriptor(CSCppTextSectionDataDescriptor *this)
{
  std::mutex::~mutex((std::mutex *)((char *)this + 144));
  uint64_t v2 = (void **)((char *)this + 88);
  std::vector<std::unique_ptr<CSCppMemory>>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 79) < 0) {
    operator delete(*((void **)this + 7));
  }
  std::__tree<TRange<Pointer64>>::destroy((uint64_t)this + 24, *((void **)this + 4));
}

char *TMMapArchive::copy_payload_from_archive(TMMapArchive *this, const TMMapArchive *a2)
{
  unint64_t v4 = (char *)this + 96;
  uint64_t v5 = (char *)a2 + 96;
  int v6 = *((_DWORD *)this + 2);
  uint64_t v7 = (32 * v6);
  unsigned int v8 = 32 * *((_DWORD *)a2 + 2);
  if (v8 >= 32 * v6) {
    size_t v9 = v7;
  }
  else {
    size_t v9 = v8;
  }
  memcpy((char *)this + 96, (char *)a2 + 96, v9);
  unsigned int v10 = 24 * *((_DWORD *)a2 + 3);
  if (v10 >= 24 * *((_DWORD *)this + 3)) {
    size_t v11 = (24 * *((_DWORD *)this + 3));
  }
  else {
    size_t v11 = v10;
  }
  memcpy(&v4[v7], &v5[32 * *((_DWORD *)a2 + 2)], v11);
  unsigned int v12 = 24 * *((_DWORD *)a2 + 4);
  if (v12 >= 24 * *((_DWORD *)this + 4)) {
    size_t v13 = (24 * *((_DWORD *)this + 4));
  }
  else {
    size_t v13 = v12;
  }
  memcpy(&v4[32 * *((_DWORD *)this + 2) + 24 * *((_DWORD *)this + 3)], &v5[32 * *((_DWORD *)a2 + 2) + 24 * *((_DWORD *)a2 + 3)], v13);
  unsigned int v14 = 36 * *((_DWORD *)a2 + 5);
  if (v14 >= 36 * *((_DWORD *)this + 5)) {
    size_t v15 = (36 * *((_DWORD *)this + 5));
  }
  else {
    size_t v15 = v14;
  }
  memcpy(&v4[32 * *((_DWORD *)this + 2) + 24 * *((_DWORD *)this + 3) + 24 * *((_DWORD *)this + 4)], &v5[32 * *((_DWORD *)a2 + 2) + 24 * *((_DWORD *)a2 + 3) + 24 * *((_DWORD *)a2 + 4)], v15);
  long long v16 = &v4[vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)this + 8), (int32x4_t)xmmword_1B9086FC0))];
  unint64_t v17 = &v5[vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)a2 + 8), (int32x4_t)xmmword_1B9086FC0))];
  unsigned int v18 = 20 * *((_DWORD *)a2 + 6);
  if (v18 >= 20 * *((_DWORD *)this + 6)) {
    size_t v19 = (20 * *((_DWORD *)this + 6));
  }
  else {
    size_t v19 = v18;
  }
  memcpy(v16, v17, v19);
  uint64_t v20 = &v4[vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)this + 8), (int32x4_t)xmmword_1B9086FC0))
          + (20 * *((_DWORD *)this + 6))];
  unint64_t v21 = &v5[vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)a2 + 8), (int32x4_t)xmmword_1B9086FC0))
          + (20 * *((_DWORD *)a2 + 6))];
  unsigned int v22 = *((_DWORD *)this + 22);
  unsigned int v23 = *((_DWORD *)a2 + 22);
  if (v23 >= v22) {
    size_t v24 = v22;
  }
  else {
    size_t v24 = v23;
  }
  memcpy(v20, v21, v24);
  int32x4_t v25 = *(int32x4_t *)((char *)this + 12);
  BOOL v26 = &v4[*((unsigned int *)this + 22)
          + vaddlvq_u32((uint32x4_t)vmulq_s32(v25, (int32x4_t)xmmword_1B908B8E0))
          + (32 * *((_DWORD *)this + 2))];
  BOOL v27 = &v5[*((unsigned int *)a2 + 22)
          + vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)a2 + 12), (int32x4_t)xmmword_1B908B8E0))
          + (32 * *((_DWORD *)a2 + 2))];
  unsigned int v28 = 4 * HIDWORD(*(void *)((char *)a2 + 12));
  if (v28 >= 4 * v25.i32[1]) {
    size_t v29 = (4 * v25.i32[1]);
  }
  else {
    size_t v29 = v28;
  }
  memcpy(v26, v27, v29);
  unsigned int v30 = *((_DWORD *)this + 20);
  unsigned int v31 = *((_DWORD *)a2 + 20);
  if (v31 >= v30) {
    size_t v32 = v30;
  }
  else {
    size_t v32 = v31;
  }
  memcpy(&v4[32 * *((_DWORD *)this + 2)+ 24 * *((_DWORD *)this + 3)+ (24 * *((_DWORD *)this + 4))+ (unint64_t)(4 * *((_DWORD *)this + 4))+ (36 * *((_DWORD *)this + 5))+ (20 * *((_DWORD *)this + 6))+ *((unsigned int *)this + 22)], &v5[32 * *((_DWORD *)a2 + 2)+ 24 * *((_DWORD *)a2 + 3)+ (24 * *((_DWORD *)a2 + 4))+ (unint64_t)(4 * *((_DWORD *)a2 + 4))+ (36 * *((_DWORD *)a2 + 5))+ (20 * *((_DWORD *)a2 + 6))+ *((unsigned int *)a2 + 22)], v32);
  unsigned int v33 = *((_DWORD *)this + 21);
  unsigned int v34 = *((_DWORD *)a2 + 21);
  if (v34 >= v33) {
    size_t v35 = v33;
  }
  else {
    size_t v35 = v34;
  }
  memcpy(&v4[32 * *((_DWORD *)this + 2)+ 24 * *((_DWORD *)this + 3)+ (24 * *((_DWORD *)this + 4))+ (unint64_t)(4 * *((_DWORD *)this + 4))+ (36 * *((_DWORD *)this + 5))+ (20 * *((_DWORD *)this + 6))+ *((unsigned int *)this + 22)+ *((unsigned int *)this + 20)], &v5[32 * *((_DWORD *)a2 + 2)+ 24 * *((_DWORD *)a2 + 3)+ (24 * *((_DWORD *)a2 + 4))+ (unint64_t)(4 * *((_DWORD *)a2 + 4))+ (36 * *((_DWORD *)a2 + 5))+ (20 * *((_DWORD *)a2 + 6))+ *((unsigned int *)a2 + 22)+ *((unsigned int *)a2 + 20)], v35);
  uint64_t result = TMMapArchive::optional_data(a2);
  if (result)
  {
    long long __src = *(_OWORD *)result;
    uint64_t v42 = *((void *)result + 2);
    uint64_t result = (char *)TMMapArchive::strtab_end(this);
    char v37 = (char *)this + *((unsigned int *)this + 1);
    BOOL v38 = v37 > result;
    size_t v39 = v37 - result;
    if (v38)
    {
      if (DWORD2(__src) <= 0xC) {
        size_t v40 = 12;
      }
      else {
        size_t v40 = DWORD2(__src);
      }
      if (v39 >= v40) {
        return (char *)memcpy(result, &__src, v40);
      }
    }
  }
  return result;
}

uint64_t ArchiveWrapper::ArchiveWrapper(uint64_t a1, uint64_t a2, CFTypeRef cf, int a4, uint64_t a5, uint64_t a6, __int16 a7, __int16 a8)
{
  *(_DWORD *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 24) = a4;
  *(_WORD *)(a1 + 48) = a7;
  *(_WORD *)(a1 + 50) = a8;
  if (a6)
  {
    a4 |= 8u;
    *(_DWORD *)(a1 + 24) = a4;
  }
  if ((a4 & 8) != 0) {
    uint64_t v9 = a6;
  }
  else {
    uint64_t v9 = 0;
  }
  *(void *)(a1 + 32) = a5;
  *(void *)(a1 + 40) = v9;
  *(void *)a1 = &unk_1F12CA3E0;
  *(void *)(a1 + 56) = cf;
  if (cf && (a4 & 4) != 0) {
    CFRetain(cf);
  }
  return a1;
}

void ArchiveWrapper::~ArchiveWrapper(ArchiveWrapper *this)
{
  ArchiveWrapper::~ArchiveWrapper(this);

  JUMPOUT(0x1BA9D1CD0);
}

{
  int v1;

  *(void *)this = &unk_1F12CA3E0;
  uint64_t v1 = *((_DWORD *)this + 6);
  if (v1)
  {
    mach_vm_deallocate(*MEMORY[0x1E4F14960], *((void *)this + 2), *(unsigned int *)(*((void *)this + 2) + 4));
  }
  else if ((v1 & 0x12) != 0)
  {
    munmap(*((void **)this + 2), *((void *)this + 4));
  }
  else
  {
    CFRelease(*((CFTypeRef *)this + 7));
  }
}

void *std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<UUID const&,ArchiveWrapper *&>(void *a1, _OWORD *a2, void *a3)
{
  int v6 = operator new(0x28uLL);
  *((_OWORD *)v6 + 1) = *a2;
  v6[4] = *a3;
  unint64_t v7 = v6[3] ^ v6[2];
  void *v6 = 0;
  v6[1] = v7;
  inserted = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_prepare((uint64_t)a1, v7, v6 + 2);
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_perform(a1, v6, inserted);
  return v6;
}

void sub_1B9082604(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<std::pair<UUID const,ArchiveWrapper *>>(void *a1, uint64_t a2)
{
  unint64_t v4 = operator new(0x28uLL);
  *((_OWORD *)v4 + 1) = *(_OWORD *)a2;
  v4[4] = *(void *)(a2 + 16);
  unint64_t v5 = v4[3] ^ v4[2];
  void *v4 = 0;
  v4[1] = v5;
  inserted = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4 + 2);
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_perform(a1, v4, inserted);
  return v4;
}

void sub_1B908268C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

char *utility_basename(const char *a1)
{
  size_t v2 = strlen(a1);
  if (v2 == 1)
  {
    unint64_t v5 = (char *)malloc_type_malloc(2uLL, 0x780D56C1uLL);
    int v6 = v5;
    unint64_t v7 = a1;
    goto LABEL_17;
  }
  size_t v3 = v2;
  if (v2)
  {
    uint64_t v8 = 0;
    do
    {
      size_t v9 = v2 + v8;
      int v10 = a1[v2 - 1 + v8--];
    }
    while (v9 != 1 && v10 != 47);
    if (v2 + v8)
    {
      if (v8 == -1)
      {
        int v6 = (char *)malloc_type_malloc(v2, 0xBAF419B6uLL);
        strlcpy(v6, a1, v3);
        return v6;
      }
      size_t v11 = &a1[v2];
      unint64_t v5 = (char *)malloc_type_malloc(-v8, 0x505CB428uLL);
      int v6 = v5;
      unint64_t v7 = &v11[v8 + 1];
    }
    else
    {
      if (v10 == 47) {
        unsigned int v12 = a1 + 1;
      }
      else {
        unsigned int v12 = a1;
      }
      unint64_t v5 = (char *)malloc_type_malloc(&a1[v2] - v12 + 1, 0x22F42F5FuLL);
      int v6 = v5;
      unint64_t v7 = v12;
    }
LABEL_17:
    strcpy(v5, v7);
    return v6;
  }

  return strdup(a1);
}

BOOL do_candidate_sources_satisfy_existing(int a1, int a2)
{
  return (a1 & ~a2 & CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData()) == 0;
}

BOOL deny_nfs_mount_lookup(const char *__s1)
{
  uint64_t v2 = 0;
  do
  {
    int v3 = strncmp(__s1, (&off_1E61D0C80)[v2], (size_t)(&off_1E61D0C80)[v2 + 1]);
    if (!v3) {
      break;
    }
    BOOL v4 = v2 == 6;
    v2 += 2;
  }
  while (!v4);
  return v3 == 0;
}

void CSCppDaemonConnection::CSCppDaemonConnection(CSCppDaemonConnection *this)
{
  *(void *)this = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.coresymbolicationd", global_queue, 2uLL);
  *(void *)this = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_5);
    xpc_connection_resume(*(xpc_connection_t *)this);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1B8F92000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to acquire mach service port, symbol cache unavailable\n", v4, 2u);
    }
    fwrite("Unable to acquire mach service port, symbol cache unavailable\n", 0x3EuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    *(void *)this = 0;
  }
}

size_t ___ZN21CSCppDaemonConnectionC2Ev_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  size_t result = MEMORY[0x1BA9D29B0](a2);
  if (result == MEMORY[0x1E4F145A8])
  {
    if (a2 == MEMORY[0x1E4F14528])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::__split_buffer<std::string> buf = 136315138;
        unint64_t v5 = "com.apple.coresymbolicationd";
        _os_log_impl(&dword_1B8F92000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Invalid connection: %s\n", buf, 0xCu);
      }
      return fprintf((FILE *)*MEMORY[0x1E4F143C8], "Invalid connection: %s\n", "com.apple.coresymbolicationd");
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      _os_log_impl(&dword_1B8F92000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Client side event: Unhandled xpc type\n", buf, 2u);
    }
    return fwrite("Client side event: Unhandled xpc type\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  }
  return result;
}

void CSCppDaemonConnection::send_sync_message(_xpc_connection_s **a1@<X0>, uint64_t a2@<X1>, XPCObject *a3@<X8>)
{
  BOOL v4 = *a1;
  if (*a1)
  {
    unint64_t v5 = (void *)XPCObject::operator*(a2);
    BOOL v4 = (_xpc_connection_s *)xpc_connection_send_message_with_reply_sync(v4, v5);
    if (MEMORY[0x1BA9D29B0]() == MEMORY[0x1E4F145A8])
    {
      xpc_release(v4);
      BOOL v4 = 0;
    }
  }

  XPCObject::XPCObject(a3, v4, 0);
}

uint64_t CSCppDaemonConnection::read_mmap_archive(_xpc_connection_s **this, int8x16_t *a2, TMMapArchive **a3, unint64_t *a4, unsigned __int16 *a5, unsigned __int16 *a6)
{
  XPCDictionary::XPCDictionary((XPCDictionary *)&v32);
  XPCDictionary::set_uint64(&v32, "cmd", 4uLL);
  MMapArchiveFileSystem::ArchiveEntry::encode(a2, &region);
  unsigned int v12 = (void *)XPCObject::operator*((uint64_t)&region);
  XPCDictionary::set_object(&v32, "entry", v12);
  XPCObject::~XPCObject((XPCObject *)&region);
  *a3 = 0;
  XPCObject::XPCObject((XPCObject *)v30, &v32);
  CSCppDaemonConnection::send_sync_message(this, (uint64_t)v30, (XPCObject *)&v31);
  XPCObject::~XPCObject((XPCObject *)v30);
  if (!XPCObject::operator BOOL(&v31)
    || (uint64_t v13 = XPCObject::operator*((uint64_t)&v31), MEMORY[0x1BA9D29B0](v13) != MEMORY[0x1E4F14590]))
  {
    XPCObject::~XPCObject((XPCObject *)&v31);
    uint64_t v14 = 1;
    goto LABEL_4;
  }
  XPCObject::XPCObject((XPCObject *)&v29, &v31);
  long long v16 = (void *)XPCObject::operator*((uint64_t)&v29);
  xpc_object_t value = xpc_dictionary_get_value(v16, "shmem");
  if (value)
  {
    region = 0;
    size_t v18 = xpc_shmem_map(value, &region);
    size_t v19 = v18;
    if (v18)
    {
      if (v18 >= 0x60)
      {
        uint64_t v20 = (TMMapArchive *)region;
        size_t v21 = *((unsigned int *)region + 1);
        if (v21)
        {
          if (v18 >= v21)
          {
            int v22 = *((_DWORD *)region + 12);
            if (v22 == TMMapArchive::calculate_checksum((int32x4_t *)region)
              && TMMapArchive::are_offsets_in_bounds(v20))
            {
              *a4 = v19;
              unsigned int v23 = (void *)XPCObject::operator*((uint64_t)&v29);
              unsigned __int16 uint64 = xpc_dictionary_get_uint64(v23, "major_version");
              int32x4_t v25 = (void *)XPCObject::operator*((uint64_t)&v29);
              unsigned __int16 v26 = xpc_dictionary_get_uint64(v25, "minor_version");
              if (uint64) {
                unsigned __int16 v27 = v26;
              }
              else {
                unsigned __int16 v27 = 0;
              }
              if (a5)
              {
                unsigned __int16 v28 = uint64;
                if ((uint64 & 0xFFFE) == 0) {
                  unsigned __int16 v28 = 1;
                }
                *a5 = v28;
              }
              if (a6) {
                *a6 = v27;
              }
              goto LABEL_23;
            }
          }
        }
      }
      munmap(region, v19);
    }
  }
  uint64_t v20 = 0;
LABEL_23:
  *a3 = v20;
  XPCObject::~XPCObject(&v29);
  if (v20) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = 3;
  }
  XPCObject::~XPCObject((XPCObject *)&v31);
LABEL_4:
  XPCObject::~XPCObject(&v32);
  return v14;
}

void sub_1B9082D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v5 = va_arg(va1, void);
  XPCObject::~XPCObject((XPCObject *)va);
  XPCObject::~XPCObject((void **)va1);
  _Unwind_Resume(a1);
}

uint64_t CSCppDaemonConnection::write_mmap_archive(_xpc_connection_s **this, int8x16_t *a2, int *a3, TMMapArchive **a4, unint64_t *a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v10 = (unsigned int *)*a4;
  XPCDictionary::XPCDictionary((XPCDictionary *)&v28);
  XPCDictionary::set_uint64(&v28, "cmd", 5uLL);
  MMapArchiveFileSystem::ArchiveEntry::encode(a2, v29);
  size_t v11 = (void *)XPCObject::operator*((uint64_t)v29);
  XPCDictionary::set_object(&v28, "entry", v11);
  XPCObject::~XPCObject((XPCObject *)v29);
  xpc_object_t v12 = xpc_shmem_create(v10, v10[1]);
  XPCDictionary::set_object(&v28, "archive_shmem", v12);
  xpc_release(v12);
  XPCObject::XPCObject((XPCObject *)v26, &v28);
  CSCppDaemonConnection::send_sync_message(this, (uint64_t)v26, (XPCObject *)&v27);
  XPCObject::~XPCObject((XPCObject *)v26);
  if (XPCObject::operator BOOL(&v27))
  {
    uint64_t v13 = XPCObject::operator*((uint64_t)&v27);
    if (MEMORY[0x1BA9D29B0](v13) == MEMORY[0x1E4F14590])
    {
      XPCObject::XPCObject((XPCObject *)&v25, &v27);
      int uint64 = XPCDictionary::get_uint64(&v25, "write_errno");
      *a3 = uint64;
      if (!uint64)
      {
        XPCDictionary::get_object(&v25, "results", &v24);
        if (XPCObject::operator BOOL(&v24) && XPCObject::xpc_type((XPCObject *)&v24) == MEMORY[0x1E4F14568])
        {
          unint64_t v17 = (void *)XPCObject::operator*((uint64_t)&v27);
          xpc_object_t value = xpc_dictionary_get_value(v17, "shmem");
          if (value)
          {
            region = 0;
            unint64_t v19 = xpc_shmem_map(value, &region);
            if (v19)
            {
              uint64_t v20 = (TMMapArchive *)region;
              if (TMMapArchive::validate((int32x4_t *)region))
              {
                XPCObject::XPCObject((XPCObject *)v22, &v24);
                MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry(v29, v22);
                int8x16_t v21 = (int8x16_t)v29[1];
                *a2 = (int8x16_t)v29[0];
                a2[1] = v21;
                a2[2] = (int8x16_t)v29[2];
                a2[3].i8[0] = v30;
                XPCObject::~XPCObject((XPCObject *)v22);
                *a4 = v20;
                *a5 = v19;
                XPCObject::~XPCObject((XPCObject *)&v24);
                uint64_t v14 = 0;
                goto LABEL_10;
              }
              munmap(region, v19);
            }
          }
        }
        XPCObject::~XPCObject((XPCObject *)&v24);
      }
      uint64_t v14 = 3;
LABEL_10:
      XPCObject::~XPCObject(&v25);
      XPCObject::~XPCObject((XPCObject *)&v27);
      goto LABEL_4;
    }
  }
  XPCObject::~XPCObject((XPCObject *)&v27);
  uint64_t v14 = 1;
LABEL_4:
  XPCObject::~XPCObject(&v28);
  return v14;
}

void sub_1B9082FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v5 = va_arg(va1, void);
  va_copy(va2, va1);
  unint64_t v7 = va_arg(va2, void *);
  uint64_t v9 = va_arg(va2, void);
  va_copy(va3, va2);
  uint64_t v10 = va_arg(va3, void);
  XPCObject::~XPCObject((XPCObject *)va);
  XPCObject::~XPCObject((void **)va1);
  XPCObject::~XPCObject((XPCObject *)va2);
  XPCObject::~XPCObject((void **)va3);
  _Unwind_Resume(a1);
}

BOOL TMMapArchive::validate(int32x4_t *this)
{
  if (!this->i32[1]) {
    return 0;
  }
  __int32 v2 = this[3].i32[0];
  if (v2 != TMMapArchive::calculate_checksum(this)) {
    return 0;
  }

  return TMMapArchive::are_offsets_in_bounds((TMMapArchive *)this);
}

uint64_t *UUID::null_uuid(UUID *this)
{
  return &UUID::null_uuid(void)::fake;
}

BOOL UUID::is_null(UUID *this)
{
  if (UUID::null_uuid(void)::fake == *(void *)this && unk_1E9EF92D0 == *(void *)&(*this)[8]) {
    return 1;
  }
  if ((*this)[0]) {
    return 0;
  }
  unint64_t v3 = 0;
  do
  {
    unint64_t v4 = v3;
    if (v3 == 15) {
      break;
    }
    ++v3;
  }
  while (!(*this)[v4 + 1]);
  return v4 > 0xE;
}

double UUID::get_complement(int8x16_t *this)
{
  *(void *)&double result = vmvnq_s8(*this).u64[0];
  return result;
}

uint64_t _StringToUUIDBytes<CFUUIDBytes>(const char *a1, unsigned __int8 *a2)
{
  if (!a1
    || !a2
    || strlen(a1) < 0x24
    || !make_byte(*a1, a1[1], a2)
    || !make_byte(a1[2], a1[3], a2 + 1)
    || !make_byte(a1[4], a1[5], a2 + 2)
    || !make_byte(a1[6], a1[7], a2 + 3)
    || a1[8] != 45
    || !make_byte(a1[9], a1[10], a2 + 4)
    || !make_byte(a1[11], a1[12], a2 + 5)
    || a1[13] != 45
    || !make_byte(a1[14], a1[15], a2 + 6)
    || !make_byte(a1[16], a1[17], a2 + 7)
    || a1[18] != 45
    || !make_byte(a1[19], a1[20], a2 + 8)
    || !make_byte(a1[21], a1[22], a2 + 9)
    || a1[23] != 45
    || !make_byte(a1[24], a1[25], a2 + 10)
    || !make_byte(a1[26], a1[27], a2 + 11)
    || !make_byte(a1[28], a1[29], a2 + 12)
    || !make_byte(a1[30], a1[31], a2 + 13)
    || !make_byte(a1[32], a1[33], a2 + 14))
  {
    return 0;
  }
  int v4 = a1[34];
  int v5 = a1[35];

  return make_byte(v4, v5, a2 + 15);
}

uint64_t _UUIDBytesToString<CFUUIDBytes>(unsigned __int8 *a1, char *__str, size_t __size)
{
  if (a1) {
    BOOL v3 = __str == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v5 = !v3 && __size > 0x24;
  if (v5 == 1) {
    snprintf(__str, __size, "%02hhX%02hhX%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
  }
  return v5;
}

uint64_t make_byte(int a1, int a2, unsigned __int8 *a3)
{
  if ((a1 - 48) > 9)
  {
    if ((a1 - 65) > 5 && (a1 - 97) > 5) {
      return 0;
    }
    unsigned __int8 v3 = 16 * a1 - 112;
  }
  else
  {
    unsigned __int8 v3 = 16 * a1;
  }
  *a3 = v3;
  char v4 = a2 - 48;
  if ((a2 - 48) < 0xA)
  {
LABEL_11:
    *a3 = v3 | v4;
    return 1;
  }
  if ((a2 - 65) <= 5)
  {
    char v4 = a2 - 55;
    goto LABEL_11;
  }
  if ((a2 - 97) <= 5)
  {
    char v4 = a2 - 87;
    goto LABEL_11;
  }
  return 0;
}

__n128 MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry(MMapArchiveFileSystem::ArchiveEntry *this, __n128 *a2, uint64_t a3, int a4, int a5, __int16 a6, __int16 a7)
{
  __n128 result = *a2;
  *(__n128 *)this = *a2;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = a3;
  *((_DWORD *)this + 8) = a4;
  *((_DWORD *)this + 9) = 0;
  *((_DWORD *)this + 10) = a5;
  *((_WORD *)this + 22) = a6;
  *((_WORD *)this + 23) = a7;
  *((unsigned char *)this + 48) = 0;
  return result;
}

int8x16_t *MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry(int8x16_t *a1, void **a2)
{
  XPCObject::XPCObject((XPCObject *)&v7, a2);
  *a1 = *(int8x16_t *)XPCArray::get_uuid(&v7, 0);
  a1[1].i64[0] = XPCArray::get_uint64(&v7, 1uLL);
  a1[1].i64[1] = XPCArray::get_uint64(&v7, 2uLL);
  a1[2].i32[0] = XPCArray::get_uint64(&v7, 3uLL);
  a1[2].i32[1] = XPCArray::get_uint64(&v7, 4uLL);
  a1[2].i32[2] = XPCArray::get_uint64(&v7, 5uLL);
  if (XPCArray::count(&v7) < 8)
  {
    a1[2].i32[3] = 1;
    a1[3].i8[0] = 0;
  }
  else
  {
    a1[2].i16[6] = XPCArray::get_uint64(&v7, 6uLL);
    a1[2].i16[7] = XPCArray::get_uint64(&v7, 7uLL);
    BOOL v3 = XPCArray::count(&v7) == 9 && XPCArray::get_uint64(&v7, 8uLL) != 0;
    a1[3].i8[0] = v3;
    if (a1[2].i16[6] == 3)
    {
      UUID::get_complement(a1);
      a1->i64[0] = v4;
      a1->i64[1] = v5;
    }
  }
  XPCObject::~XPCObject(&v7);
  return a1;
}

void sub_1B908359C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  XPCObject::~XPCObject((void **)va);
  _Unwind_Resume(a1);
}

void MMapArchiveFileSystem::ArchiveEntry::encode(int8x16_t *this@<X0>, void *a2@<X8>)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  XPCArray::XPCArray((XPCArray *)&v6);
  if (this[2].i16[6] == 3)
  {
    UUID::get_complement(this);
    *(void *)&v7.byte0 = v4;
    *(void *)&v7.byte8 = v5;
    XPCArray::set_uuid(&v6, 0xFFFFFFFFFFFFFFFFLL, &v7);
  }
  else
  {
    XPCArray::set_uuid(&v6, 0xFFFFFFFFFFFFFFFFLL, (const CFUUIDBytes *)this);
  }
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[1].u64[0]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[1].u64[1]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u32[0]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u32[1]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u32[2]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u16[6]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u16[7]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[3].u8[0]);
  XPCObject::XPCObject(a2, &v6);
  XPCObject::~XPCObject(&v6);
}

void sub_1B90836E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t CSMMapArchiveCacheSetShouldStoreToDaemon(uint64_t result)
{
  CSCppMMapArchiveCache::_should_store_to_daemon = result;
  return result;
}

BOOL CSCppDyldSharedCache::has_stripped_locals_data(CSCppDyldSharedCache *this)
{
  return *((void *)this + 9) && *((void *)this + 10) != 0;
}

uint64_t CSCppDyldSharedCache::local_symbols_range(CSCppDyldSharedCache *this)
{
  return *((void *)this + 9);
}

BOOL CSCppDyldSharedCache::uses_unmapped_symbols_file(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) > 0x18Fu && *((_OWORD *)this + 25) != 0;
}

BOOL CSCppDyldSharedCache::is_split_cache(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) > 0x18Fu;
}

BOOL CSCppDyldSharedCache::uses_universal_cache_struct_layout(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) > 0x1C8u;
}

BOOL CSCppDyldSharedCache::is_universal_cache(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) >= 0x1C9u && *((void *)this + 13) == 2;
}

uint64_t CSCppDyldSharedCache::for_each_subcache_entry_uuid(_DWORD *a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _DWORD *))(a2 + 16))(a2, a1 + 22);
  unsigned int v4 = a1[4];
  if (v4 >= 0x1C9)
  {
    uint64_t v5 = (uint64_t)a1 + a1[98];
    int v6 = a1[99];
    return _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry,void({block_pointer})(unsigned char const*)>((uint64_t)a1, v5, v6, a2);
  }
  if (v4 < 0x188)
  {
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = (uint64_t)a1 + a1[98];
  if (v4 < 0x18C)
  {
LABEL_9:
    int v9 = 0;
    goto LABEL_10;
  }
  int v9 = a1[99];
LABEL_10:

  return _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry_v1,void({block_pointer})(unsigned char const*)>((uint64_t)a1, v8, v9, a2);
}

uint64_t _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry,void({block_pointer})(unsigned char const*)>(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  LODWORD(v5) = a3;
  if (*(_DWORD *)(a1 + 16) >= 0x190u && *(_OWORD *)(a1 + 400) != 0) {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a1 + 400);
  }
  if (!v5) {
    return 0;
  }
  uint64_t v5 = v5;
  uint64_t v8 = v5;
  do
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a2);
    a2 += 56;
    --v8;
  }
  while (v8);
  return v5;
}

uint64_t _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry_v1,void({block_pointer})(unsigned char const*)>(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  LODWORD(v5) = a3;
  if (*(_DWORD *)(a1 + 16) >= 0x190u && *(_OWORD *)(a1 + 400) != 0) {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a1 + 400);
  }
  if (!v5) {
    return 0;
  }
  uint64_t v5 = v5;
  uint64_t v8 = v5;
  do
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a2);
    a2 += 24;
    --v8;
  }
  while (v8);
  return v5;
}

_DWORD *CSCppDyldSharedCache::extract_universal_subcache_paths@<X0>(_DWORD *this@<X0>, uint64_t *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (this[4] >= 0x18Cu)
  {
    uint64_t v3 = this[99];
    if (v3)
    {
      unsigned int v4 = 0;
      uint64_t v5 = (char *)this + this[98];
      int v6 = v5 + 24;
      do
      {
        if (v5)
        {
          if ((unint64_t)v4 >= a2[2])
          {
            this = (_DWORD *)std::vector<std::string>::__emplace_back_slow_path<char const(&)[32]>(a2, v6);
            unsigned int v4 = this;
          }
          else
          {
            this = std::string::basic_string[abi:ne180100]<0>(v4, v6);
            v4 += 3;
            a2[1] = (uint64_t)v4;
          }
          a2[1] = (uint64_t)v4;
        }
        v6 += 56;
        --v3;
      }
      while (v3);
    }
  }
  return this;
}

void sub_1B9083AF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t CSCppDyldSharedCache::for_each_mapped_cache(char *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, a1);
  unsigned int v5 = *((_DWORD *)a1 + 4);
  if (v5 < 0x1C9)
  {
    if (v5 >= 0x18C)
    {
      size_t v11 = &a1[*((unsigned int *)a1 + 98)];
      uint64_t v12 = *((unsigned int *)a1 + 99);
      if (v11 && v12 != 0)
      {
        uint64_t v14 = (uint64_t *)(v11 + 16);
        do
        {
          uint64_t v15 = *v14;
          v14 += 3;
          uint64_t result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, &a1[v15]);
          --v12;
        }
        while (v12);
      }
    }
  }
  else
  {
    int v6 = &a1[*((unsigned int *)a1 + 98)];
    uint64_t v7 = *((unsigned int *)a1 + 99);
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      int v9 = (uint64_t *)(v6 + 16);
      do
      {
        uint64_t v10 = *v9;
        v9 += 7;
        uint64_t result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, &a1[v10]);
        --v7;
      }
      while (v7);
    }
  }
  return result;
}

uint64_t CSCppDyldSharedCache::dsc_uuid(CSCppDyldSharedCache *this)
{
  return (uint64_t)this + 88;
}

void CSCppDyldSharedCache::ranges_with_permissions(CSCppDyldSharedCache *this@<X0>, int a2@<W1>, int a3@<W2>, void *a4@<X8>)
{
  unsigned int v5 = &v26;
  uint64_t v26 = 0;
  unsigned __int16 v27 = &v26;
  uint64_t v28 = 0x4002000000;
  size_t v29 = __Block_byref_object_copy__17;
  __int8 v30 = __Block_byref_object_dispose__17;
  std::__fs::filesystem::recursive_directory_iterator __p = 0;
  size_t v32 = 0;
  uint64_t v33 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 0x40000000;
  int8x16_t v21 = ___ZNK20CSCppDyldSharedCache23ranges_with_permissionsEjj_block_invoke;
  int v22 = &unk_1E61D0CE8;
  int v24 = a2;
  int v25 = a3;
  unsigned int v23 = &v26;
  if (*((_DWORD *)this + 5))
  {
    unint64_t v7 = 0;
    BOOL v8 = (char *)this + *((unsigned int *)this + 4);
    do
    {
      v21((uint64_t)v20, (uint64_t)v8);
      ++v7;
      v8 += 32;
    }
    while (v7 < *((unsigned int *)this + 5));
    unsigned int v5 = v27;
    int v9 = (void *)v27[5];
  }
  else
  {
    int v9 = 0;
  }
  if (v9 == (void *)v5[6])
  {
    unint64_t v10 = v5[7];
    if ((unint64_t)v9 >= v10)
    {
      uint64_t v12 = v10 - (void)v9;
      uint64_t v13 = v12 >> 3;
      if ((unint64_t)(v12 >> 3) <= 1) {
        uint64_t v13 = 1;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      uint64_t v15 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>((uint64_t)(v5 + 7), v14);
      unint64_t v17 = &v15[2 * v16];
      size_t v11 = v15 + 2;
      void *v15 = 0;
      v15[1] = 0;
      unint64_t v19 = (char *)v5[5];
      size_t v18 = (char *)v5[6];
      if (v18 != v19)
      {
        do
        {
          *((_OWORD *)v15 - 1) = *((_OWORD *)v18 - 1);
          v15 -= 2;
          v18 -= 16;
        }
        while (v18 != v19);
        size_t v18 = (char *)v5[5];
      }
      v5[5] = (uint64_t)v15;
      v5[6] = (uint64_t)v11;
      v5[7] = (uint64_t)v17;
      if (v18) {
        operator delete(v18);
      }
    }
    else
    {
      size_t v11 = v9 + 2;
      *int v9 = 0;
      v9[1] = 0;
    }
    v5[6] = (uint64_t)v11;
    unsigned int v5 = v27;
  }
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  std::vector<TRange<Pointer64>>::__init_with_size[abi:ne180100]<TRange<Pointer64>*,TRange<Pointer64>*>(a4, (const void *)v5[5], v5[6], (v5[6] - v5[5]) >> 4);
  _Block_object_dispose(&v26, 8);
  if (__p)
  {
    size_t v32 = __p;
    operator delete(__p);
  }
}

void sub_1B9083DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
  __int32 v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

uint64_t CSCppDyldSharedCache::enumerate_mapping_infos(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (*(_DWORD *)(result + 20))
    {
      unint64_t v4 = 0;
      uint64_t v5 = result + *(unsigned int *)(result + 16);
      do
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5);
        ++v4;
        v5 += 32;
      }
      while (v4 < *(unsigned int *)(v2 + 20));
    }
  }
  return result;
}

void ___ZNK20CSCppDyldSharedCache23ranges_with_permissionsEjj_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 28);
  if ((*(_DWORD *)(a1 + 40) & ~v2) == 0 && (*(_DWORD *)(a1 + 44) & v2) == 0)
  {
    unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = (_OWORD *)v4[6];
    unint64_t v6 = v4[7];
    if ((unint64_t)v5 >= v6)
    {
      uint64_t v8 = v4[5];
      uint64_t v9 = ((uint64_t)v5 - v8) >> 4;
      if ((unint64_t)(v9 + 1) >> 60) {
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v10 = v6 - v8;
      uint64_t v11 = v10 >> 3;
      if (v10 >> 3 <= (unint64_t)(v9 + 1)) {
        uint64_t v11 = v9 + 1;
      }
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v11;
      }
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>((uint64_t)(v4 + 7), v12);
      unint64_t v14 = &v13[16 * v9];
      uint64_t v16 = &v13[16 * v15];
      *(_OWORD *)unint64_t v14 = *(_OWORD *)a2;
      unint64_t v7 = v14 + 16;
      size_t v18 = (char *)v4[5];
      unint64_t v17 = (char *)v4[6];
      if (v17 != v18)
      {
        do
        {
          *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
          v14 -= 16;
          v17 -= 16;
        }
        while (v17 != v18);
        unint64_t v17 = (char *)v4[5];
      }
      v4[5] = v14;
      v4[6] = v7;
      v4[7] = v16;
      if (v17) {
        operator delete(v17);
      }
    }
    else
    {
      _OWORD *v5 = *(_OWORD *)a2;
      unint64_t v7 = v5 + 1;
    }
    v4[6] = v7;
  }
}

void CSCppDyldSharedCache::data_segment_ranges(CSCppDyldSharedCache *this@<X0>, void *a2@<X8>)
{
}

uint64_t CSCppDyldSharedCache::text_segment_range(CSCppDyldSharedCache *this)
{
  CSCppDyldSharedCache::ranges_with_permissions(this, 4, 0, __p);
  uint64_t v1 = *(void *)__p[0];
  __p[1] = __p[0];
  operator delete(__p[0]);
  return v1;
}

BOOL CSCppDyldSharedCache::stripped_locals_data_for (uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  if (!*(void *)(a1 + 72)) {
    return 0;
  }
  BOOL result = 0;
  if (a3 && *(void *)(a1 + 80))
  {
    unint64_t v6 = a3[5];
    unint64_t v7 = (unsigned int *)((char *)a3 + a3[4]);
    if (*(_DWORD *)(a1 + 16) < 0x190u)
    {
      if (v6)
      {
        if (*v7 == a2)
        {
          unint64_t v9 = 0;
          BOOL result = 1;
LABEL_20:
          *(void *)a4 = *a3;
          unint64_t v17 = &v7[3 * v9];
          int v13 = v17[1];
          *(_DWORD *)(a4 + 8) = v13;
          unint64_t v14 = v17 + 2;
          goto LABEL_21;
        }
        unint64_t v9 = 0;
        uint64_t v15 = v7 + 3;
        while (v6 - 1 != v9)
        {
          int v16 = *v15;
          v15 += 3;
          ++v9;
          if (v16 == a2)
          {
            BOOL result = v9 < v6;
            goto LABEL_20;
          }
        }
      }
    }
    else if (v6)
    {
      if (*(void *)v7 == a2)
      {
        unint64_t v8 = 0;
        BOOL result = 1;
LABEL_15:
        *(void *)a4 = *a3;
        unint64_t v12 = &v7[4 * v8];
        int v13 = v12[2];
        *(_DWORD *)(a4 + 8) = v13;
        unint64_t v14 = v12 + 3;
LABEL_21:
        int v18 = *v14 + v13;
        unsigned int v19 = a3[3];
        *(void *)(a4 + 24) = a3[2];
        *(_DWORD *)(a4 + 12) = v18;
        *(_DWORD *)(a4 + 16) = v19;
        return result;
      }
      unint64_t v8 = 0;
      uint64_t v10 = (uint64_t *)(v7 + 4);
      while (v6 - 1 != v8)
      {
        uint64_t v11 = *v10;
        v10 += 2;
        ++v8;
        if (v11 == a2)
        {
          BOOL result = v8 < v6;
          goto LABEL_15;
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t std::vector<std::string>::__emplace_back_slow_path<char const(&)[32]>(uint64_t *a1, char *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  __v.__first_ = v10;
  __v.__begin_ = v10 + v4;
  __v.__end_cap_.__value_ = &v10[v9];
  std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, a2);
  __v.__end_ = __v.__begin_ + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v11 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v11;
}

void sub_1B9084230(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void *std::vector<TRange<Pointer64>>::__init_with_size[abi:ne180100]<TRange<Pointer64>*,TRange<Pointer64>*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    BOOL result = std::vector<std::shared_ptr<CSCppSymbolOwner>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1B90842A4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t (*mach_exc_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 2411) >= 0xFFFFFFFA) {
    return catch_mach_exc_subsystem[5 * (v1 - 2405) + 5];
  }
  else {
    return 0;
  }
}

uint64_t _Xmach_exception_raise(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    int v3 = -304;
    if (*(_DWORD *)(result + 24) != 2) {
      goto LABEL_3;
    }
    unsigned int v4 = *(_DWORD *)(result + 4);
    if (v4 < 0x44 || v4 > 0x54) {
      goto LABEL_3;
    }
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
    {
      int v3 = -300;
      goto LABEL_3;
    }
    unsigned int v5 = *(_DWORD *)(result + 64);
    if (v5 <= 2 && v5 <= (v4 - 68) >> 3 && v4 == 8 * v5 + 68)
    {
      BOOL result = catch_mach_exception_raise();
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
  }
  int v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xmach_exception_raise_state(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_17;
  }
  unsigned int v3 = *(_DWORD *)(result + 4);
  BOOL v4 = v3 < 0x30 || v3 > 0x1480;
  if (v4
    || (uint64_t v5 = *(unsigned int *)(result + 36), v5 > 2)
    || ((unsigned int v6 = 8 * v5, v5 <= (v3 - 48) >> 3) ? (v7 = v3 >= 8 * (int)v5 + 48) : (v7 = 0),
        !v7
     || (uint64_t v8 = result + v6, v9 = *(_DWORD *)(v8 + 44), v9 > 0x510)
     || ((unsigned int v10 = v3 - v6, v9 <= (v10 - 48) >> 2) ? (v11 = v10 == 4 * v9 + 48) : (v11 = 0), !v11)))
  {
LABEL_17:
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v12 = *MEMORY[0x1E4F14068];
LABEL_18:
    *(void *)(a2 + 24) = v12;
    return result;
  }
  uint64_t v13 = v8 - 16;
  *(_DWORD *)(a2 + 40) = 1296;
  unint64_t v14 = (_DWORD *)(v13 + 56);
  BOOL result = catch_mach_exception_raise_state(*(unsigned int *)(result + 12), *(unsigned int *)(result + 32), (void *)(result + 40), v5, v13 + 56, (const void *)(v13 + 64), v9, a2 + 44, (unsigned int *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v12 = *MEMORY[0x1E4F14068];
  if (result) {
    goto LABEL_18;
  }
  *(void *)(a2 + 24) = v12;
  *(_DWORD *)(a2 + 36) = *v14;
  *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
  return result;
}

uint64_t _Xmach_exception_raise_state_identity(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 2) {
    goto LABEL_3;
  }
  unsigned int v5 = *(_DWORD *)(result + 4);
  if (v5 < 0x4C || v5 > 0x149C) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v7 = *(_DWORD *)(result + 64);
  if (v7 > 2) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (v7 > (v5 - 76) >> 3) {
    goto LABEL_3;
  }
  unsigned int v8 = 8 * v7;
  if (v5 < 8 * v7 + 76) {
    goto LABEL_3;
  }
  uint64_t v9 = result + v8;
  unsigned int v10 = *(_DWORD *)(v9 + 72);
  if (v10 > 0x510 || (unsigned int v11 = v5 - v8, v10 > (v11 - 76) >> 2) || v11 != 4 * v10 + 76)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
LABEL_4:
    *(void *)(a2 + 24) = v4;
    return result;
  }
  *(_DWORD *)(a2 + 40) = 1296;
  uint64_t v12 = (_DWORD *)(v9 + 68);
  BOOL result = catch_mach_exception_raise();
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (result) {
    goto LABEL_4;
  }
  *(void *)(a2 + 24) = v4;
  *(_DWORD *)(a2 + 36) = *v12;
  *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
  return result;
}

uint64_t _Xmach_exception_raise_identity_protected(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    int v3 = -304;
    if (*(_DWORD *)(result + 24) != 1) {
      goto LABEL_3;
    }
    unsigned int v4 = *(_DWORD *)(result + 4);
    if (v4 < 0x40 || v4 > 0x50) {
      goto LABEL_3;
    }
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      int v3 = -300;
      goto LABEL_3;
    }
    unsigned int v5 = *(_DWORD *)(result + 60);
    if (v5 <= 2 && v5 <= (v4 - 64) >> 3 && v4 == 8 * v5 + 64)
    {
      BOOL result = catch_mach_exception_raise_identity_protected(*(unsigned int *)(result + 12), *(void *)(result + 48), *(_DWORD *)(result + 28), *(unsigned int *)(result + 56), (void *)(result + 64));
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
  }
  int v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t mach_exc_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 2411) >= 0xFFFFFFFA
    && (unsigned int v5 = (void (*)(void))catch_mach_exc_subsystem[5 * (v4 - 2405) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t CSSymbolicatorCreateWithSymbolOwnersAndCSCppTask()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void CSCppReferenceCount::retain()
{
  putchar(10);
  uint64_t v0 = utility_basename("/Library/Caches/com.apple.xbs/Sources/CoreSymbolication/CoreSymbolication/CSCppReferenceCount.hpp");
  printf("ASSERT(%s) %s %d, %s\n", "test_value != 0", v0, 27, "attempted object resurrection");
  if (qword_1EB5179C0) {
    printf("__crashreporter_info__: %s\n", (const char *)qword_1EB5179C0);
  }
  abort();
}

void CSCppReferenceCount::release()
{
  putchar(10);
  uint64_t v0 = utility_basename("/Library/Caches/com.apple.xbs/Sources/CoreSymbolication/CoreSymbolication/CSCppReferenceCount.hpp");
  printf("ASSERT(%s) %s %d, %s\n", "test_value >= value", v0, 43, "over release");
  if (qword_1EB5179C0) {
    printf("__crashreporter_info__: %s\n", (const char *)qword_1EB5179C0);
  }
  abort();
}

uint64_t sod_header_from_local_dyld_shared_cache<SizeAndEndianness<Pointer32,LittleEndian>,Pointer32>()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _do_sod_header_from_local_dyld_shared_cache<SizeAndEndianness<Pointer32,LittleEndian>,Pointer32>()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void new_file_memory_for_uuid_and_arch(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = __cxa_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = (*(uint64_t (**)(void *))(*(void *)v1 + 16))(v1);
    int v3 = 136315394;
    int v4 = "CSCppFileMemory *new_file_memory_for_uuid_and_arch(const char *, const UUID &, CSCppArchitecture, uint32_t)";
    __int16 v5 = 2080;
    uint64_t v6 = v2;
    _os_log_impl(&dword_1B8F92000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Caught exception in %s:\n %s\n", (uint8_t *)&v3, 0x16u);
  }
}

uint64_t _do_sod_header_from_local_dyld_shared_cache<SizeAndEndianness<Pointer64,LittleEndian>,Pointer64>()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CSCppDyldSplitSharedCacheMemory::analyze_primary_cache_for_symbols_file(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t CSCppDyldSplitSharedCacheMemory::initialize_subcaches_from_file_list(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t iterate_symbol_owners_from_disk_dsc(uint64_t *a1)
{
  uint64_t result = OUTLINED_FUNCTION_0_0(a1);
  if (result)
  {
    OUTLINED_FUNCTION_0();
    uint64_t result = (*(uint64_t (**)(void))(v5 + 8))();
  }
  *(void *)uint64_t v1 = v3;
  *(_DWORD *)(v1 + 8) = v2;
  return result;
}

uint64_t create_symbol_owner_data_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(const char *a1)
{
  uint64_t result = printf("ASSERT(%s) %s %d, %s\n", "traw_symbol_owner_data->retain_count() == 1", a1, 2243, "Wrong refcount on traw_symbol_owner_data");
  if (qword_1EB5179C0) {
    return printf("__crashreporter_info__: %s\n", (const char *)qword_1EB5179C0);
  }
  return result;
}

uint64_t CSSymbolicatorCreateWithTaskPidFlagsAndNotification_cold_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void std::__optional_copy_base<std::vector<unsigned long long>,false>::__optional_copy_base[abi:ne180100](void **a1)
{
  int v2 = *a1;
  if (v2) {
    OUTLINED_FUNCTION_0_1(v2, (uint64_t)a1);
  }
}

uint64_t _createCSSymbolicatorFromFlatbuffer<__CFData const*>(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void ___ZN20TMachOHeaderIteratorI17SizeAndEndiannessI9Pointer6412LittleEndianEE7iterateEv_block_invoke_cold_2(void *a1, const char *a2)
{
  bzero(a1, 0x801uLL);
  size_t v3 = strlen(a2);
  uint64_t v11 = 1024;
  if (v3 < 0x400) {
    uint64_t v11 = v3;
  }
  if (v11)
  {
    do
    {
      OUTLINED_FUNCTION_0_2(v3, v4, v5, v6, v7, v8, v9, v10, v13);
      OUTLINED_FUNCTION_1();
    }
    while (!v12);
  }
}

void create_sampling_context_for_task_pid_symbolicator_cold_1(void *a1, uint64_t a2, void ***a3, char **a4)
{
  int v6 = __cxa_begin_catch(a1);
  int v7 = (FILE *)*MEMORY[0x1E4F143C8];
  int v8 = (const char *)(*(uint64_t (**)(void *))(*(void *)v6 + 16))(v6);
  fprintf(v7, "Caught exception in create_sampling_context_for_task:\n%s\n", v8);
  int v9 = *a3;
  if (*a3)
  {
    int v10 = *a3;
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100](&v10);
    MEMORY[0x1BA9D1CD0](v9, 0x20C40960023A9);
    *a3 = 0;
  }
  sampling_context_t::~sampling_context_t(a4);
  MEMORY[0x1BA9D1CD0]();
  __cxa_end_catch();
}

void ___ZN20SymbolicationSession30process_ats_dsc_and_pid_chunksEPK8__CFDataS2__block_invoke_2_cold_1(uint64_t *a1)
{
  if (OUTLINED_FUNCTION_0_0(a1))
  {
    OUTLINED_FUNCTION_0();
    (*(void (**)(void))(v1 + 16))();
  }
  OUTLINED_FUNCTION_2();
}

uint64_t ___ZN20SymbolicationSession30process_ats_dsc_and_pid_chunksEPK8__CFDataS2__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 16))();
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7470](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

void CFShow(CFTypeRef obj)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
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

uint64_t OSKextCopyLoadedKextInfo()
{
  return MEMORY[0x1F40E9290]();
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

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E390](this, __s);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::recursive_directory_iterator::__dereference(const std::__fs::filesystem::recursive_directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x1F417E3B8](this);
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E5D0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
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

{
  return MEMORY[0x1F417E8D0]();
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

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::__increment(std::__fs::filesystem::recursive_directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x1F417EB90](this, __ec);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::recursive_directory_iterator(std::__fs::filesystem::recursive_directory_iterator *this, const std::__fs::filesystem::path *__p, std::__fs::filesystem::directory_options __opt, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x1F417EB98](this, __p, __opt, __ec);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

{
  return (std::string *)MEMORY[0x1F417EE98](retstr, __val);
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void __cxa_bad_cast(void)
{
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1F40C9E40]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1F40C9E48]();
}

uint64_t _dyld_process_info_create()
{
  return MEMORY[0x1F40C9EA8]();
}

uint64_t _dyld_process_info_for_each_image()
{
  return MEMORY[0x1F40C9EB0]();
}

uint64_t _dyld_process_info_get_aot_cache()
{
  return MEMORY[0x1F40C9EB8]();
}

uint64_t _dyld_process_info_get_cache()
{
  return MEMORY[0x1F40C9EC0]();
}

uint64_t _dyld_process_info_get_platform()
{
  return MEMORY[0x1F40C9EC8]();
}

uint64_t _dyld_process_info_get_state()
{
  return MEMORY[0x1F40C9ED0]();
}

uint64_t _dyld_process_info_notify()
{
  return MEMORY[0x1F40C9ED8]();
}

uint64_t _dyld_process_info_notify_main()
{
  return MEMORY[0x1F40C9EE0]();
}

uint64_t _dyld_process_info_notify_release()
{
  return MEMORY[0x1F40C9EE8]();
}

uint64_t _dyld_process_info_release()
{
  return MEMORY[0x1F40C9EF0]();
}

uint64_t _dyld_shared_cache_real_path()
{
  return MEMORY[0x1F40C9F20]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1F40C9F90]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

uint64_t aot_address_in_shared_cache()
{
  return MEMORY[0x1F417D0B0]();
}

uint64_t aot_get_shared_cache_fragment_type()
{
  return MEMORY[0x1F417D0B8]();
}

uint64_t aot_get_x86_address()
{
  return MEMORY[0x1F417D0C0]();
}

uint64_t aot_get_x86_address_shared_cache()
{
  return MEMORY[0x1F417D0C8]();
}

uint64_t aot_init_shared_cache_info()
{
  return MEMORY[0x1F417D0D0]();
}

uint64_t aot_symbolication_session_create()
{
  return MEMORY[0x1F417D0D8]();
}

uint64_t aot_symbolication_session_destroy()
{
  return MEMORY[0x1F417D0E0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

uint64_t dyld_for_each_installed_shared_cache()
{
  return MEMORY[0x1F40CBE08]();
}

uint64_t dyld_image_content_for_segment()
{
  return MEMORY[0x1F40CBE40]();
}

uint64_t dyld_image_copy_uuid()
{
  return MEMORY[0x1F40CBE48]();
}

uint64_t dyld_image_for_each_segment_info()
{
  return MEMORY[0x1F40CBE50]();
}

uint64_t dyld_image_get_file_path()
{
  return MEMORY[0x1F40CBE58]();
}

uint64_t dyld_image_get_installname()
{
  return MEMORY[0x1F40CBE60]();
}

uint64_t dyld_is_simulator_platform()
{
  return MEMORY[0x1F40CBE78]();
}

uint64_t dyld_process_create_for_task()
{
  return MEMORY[0x1F40CBE88]();
}

uint64_t dyld_process_dispose()
{
  return MEMORY[0x1F40CBE90]();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return MEMORY[0x1F40CBEA0]();
}

uint64_t dyld_process_snapshot_dispose()
{
  return MEMORY[0x1F40CBEA8]();
}

uint64_t dyld_process_snapshot_for_each_image()
{
  return MEMORY[0x1F40CBEB0]();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return MEMORY[0x1F40CBEB8]();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return MEMORY[0x1F40CBED0]();
}

uint64_t dyld_shared_cache_file_path()
{
  return MEMORY[0x1F40CBED8]();
}

uint64_t dyld_shared_cache_find_iterate_text()
{
  return MEMORY[0x1F40CBEE0]();
}

uint64_t dyld_shared_cache_for_each_image()
{
  return MEMORY[0x1F40CBEE8]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x1F40CBEF0]();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return MEMORY[0x1F40CBEF8]();
}

uint64_t dyld_shared_cache_is_mapped_private()
{
  return MEMORY[0x1F40CBF00]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
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

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

char *__cdecl getwd(char *a1)
{
  return (char *)MEMORY[0x1F40CC588](a1);
}

int glob(const char *a1, int a2, int (__cdecl *a3)(const char *, int), glob_t *a4)
{
  return MEMORY[0x1F40CC598](a1, *(void *)&a2, a3, a4);
}

void globfree(glob_t *a1)
{
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC608](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

uint64_t kas_info()
{
  return MEMORY[0x1F40CC6E8]();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

mach_msg_return_t mach_msg_send(mach_msg_header_t *a1)
{
  return MEMORY[0x1F40CC990](a1);
}

mach_msg_return_t mach_msg_server_once(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return MEMORY[0x1F40CC998](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_context(ipc_space_read_t task, mach_port_name_t name, mach_port_context_t *context)
{
  return MEMORY[0x1F40CC9E8](*(void *)&task, *(void *)&name, context);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_set_context(ipc_space_t task, mach_port_name_t name, mach_port_context_t context)
{
  return MEMORY[0x1F40CCA38](*(void *)&task, *(void *)&name, context);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x1F40CCA50](*(void *)&task);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1F40CCA68](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40CCA78](*(void *)&target, address, size);
}

kern_return_t mach_vm_protect(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1F40CCA90](*(void *)&target_task, address, size, *(void *)&set_maximum, *(void *)&new_protection);
}

kern_return_t mach_vm_read_overwrite(vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, mach_vm_address_t data, mach_vm_size_t *outsize)
{
  return MEMORY[0x1F40CCAA0](*(void *)&target_task, address, size, data, outsize);
}

kern_return_t mach_vm_region_recurse(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return MEMORY[0x1F40CCAB0](*(void *)&target_task, address, size, nesting_depth, info, infoCnt);
}

kern_return_t mach_vm_remap_new(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_read_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1F40CCAC0](*(void *)&target_task, target_address, size, mask, *(void *)&flags, *(void *)&src_task, src_address, *(void *)&copy);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1F40CCEA0](__rqtp, __rmtp);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1F40CD750](*(void *)&t, x);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD8A8](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
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

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1F40CDB90](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1F40CDC68](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

uint64_t rosetta_get_runtime_location()
{
  return MEMORY[0x1F417D0E8]();
}

uint64_t rosetta_is_process_translated()
{
  return MEMORY[0x1F417D0F0]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
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

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1A8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x1F40CE478](*(void *)&task, *(void *)&corspe_task, kcd_addr_begin, kcd_size);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1F40CE490]();
}

kern_return_t task_resume(task_read_t target_task)
{
  return MEMORY[0x1F40CE4B0](*(void *)&target_task);
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x1F40CE4B8](*(void *)&suspend_token);
}

kern_return_t task_suspend2(task_read_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x1F40CE4D0](*(void *)&target_task, suspend_token);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1F40CE4D8](*(void *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_get_state(thread_read_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  return MEMORY[0x1F40CE528](*(void *)&target_act, *(void *)&flavor, old_state, old_stateCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_set_exception_ports(thread_act_t thread, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  return MEMORY[0x1F40CE558](*(void *)&thread, *(void *)&exception_mask, *(void *)&new_port, *(void *)&behavior, *(void *)&new_flavor);
}

kern_return_t thread_set_state(thread_act_t target_act, thread_state_flavor_t flavor, thread_state_t new_state, mach_msg_type_number_t new_stateCnt)
{
  return MEMORY[0x1F40CE560](*(void *)&target_act, *(void *)&flavor, new_state, *(void *)&new_stateCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

kern_return_t vm_map_page_query(vm_map_read_t target_map, vm_offset_t offset, integer_t *disposition, integer_t *ref_count)
{
  return MEMORY[0x1F40CE6D0](*(void *)&target_map, offset, disposition, ref_count);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1F40CEA98](xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x1F40CEAA0](xarray, index);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CF268](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1F40CF278](xshmem, region);
}