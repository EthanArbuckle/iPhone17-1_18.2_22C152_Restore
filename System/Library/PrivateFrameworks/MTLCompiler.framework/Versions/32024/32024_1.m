_DWORD *llvm::DenseMap<unsigned int,llvm::SmallVector<unsigned int,2u>,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,llvm::SmallVector<unsigned int,2u>>>::grow(uint64_t a1, int a2)
{
  uint64_t v3;
  llvm *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  unsigned int v8;
  _DWORD *result;
  uint64_t v10;
  uint64_t v11;
  uint64_t vars8;

  v3 = *(unsigned int *)(a1 + 16);
  v4 = *(llvm **)a1;
  v5 = (a2 - 1) | ((unint64_t)(a2 - 1) >> 1);
  v6 = v5 | (v5 >> 2) | ((v5 | (v5 >> 2)) >> 4);
  v7 = ((v6 | (v6 >> 8)) >> 16) | v6 | (v6 >> 8);
  if ((v7 + 1) > 0x40) {
    v8 = v7 + 1;
  }
  else {
    v8 = 64;
  }
  *(_DWORD *)(a1 + 16) = v8;
  result = (_DWORD *)MEMORY[0x25A28D370](32 * v8, 8);
  *(void *)a1 = result;
  if (v4)
  {
    llvm::DenseMapBase<llvm::DenseMap<unsigned int,llvm::SmallVector<unsigned int,2u>,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,llvm::SmallVector<unsigned int,2u>>>,unsigned int,llvm::SmallVector<unsigned int,2u>,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,llvm::SmallVector<unsigned int,2u>>>::moveFromOldBuckets(a1, (uint64_t)v4, (uint64_t)v4 + 32 * v3);
    return (_DWORD *)llvm::deallocate_buffer(v4, (void *)(32 * v3));
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    v10 = *(unsigned int *)(a1 + 16);
    if (v10)
    {
      v11 = 32 * v10;
      do
      {
        *result = -1;
        result += 8;
        v11 -= 32;
      }
      while (v11);
    }
  }
  return result;
}

void llvm::DenseMapBase<llvm::DenseMap<unsigned int,llvm::SmallVector<unsigned int,2u>,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,llvm::SmallVector<unsigned int,2u>>>,unsigned int,llvm::SmallVector<unsigned int,2u>,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,llvm::SmallVector<unsigned int,2u>>>::moveFromOldBuckets(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v6 = *(unsigned int *)(a1 + 16);
  if (v6)
  {
    v7 = *(_DWORD **)a1;
    uint64_t v8 = 32 * v6;
    do
    {
      _DWORD *v7 = -1;
      v7 += 8;
      v8 -= 32;
    }
    while (v8);
  }
  while (a2 != a3)
  {
    if (*(_DWORD *)a2 <= 0xFFFFFFFD)
    {
      v11 = 0;
      llvm::DenseMapBase<llvm::DenseMap<unsigned int,llvm::SmallVector<unsigned int,2u>,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,llvm::SmallVector<unsigned int,2u>>>,unsigned int,llvm::SmallVector<unsigned int,2u>,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,llvm::SmallVector<unsigned int,2u>>>::LookupBucketFor<unsigned int>((uint64_t *)a1, (_DWORD *)a2, &v11);
      v9 = v11;
      _DWORD *v11 = *(_DWORD *)a2;
      llvm::SmallVector<unsigned int,2u>::SmallVector((void *)v9 + 1, a2 + 8);
      ++*(_DWORD *)(a1 + 8);
      v10 = *(void **)(a2 + 8);
      if ((void *)(a2 + 24) != v10) {
        free(v10);
      }
    }
    a2 += 32;
  }
}

void *llvm::SmallVector<unsigned int,2u>::SmallVector(void *a1, uint64_t a2)
{
  *a1 = a1 + 2;
  a1[1] = 0x200000000;
  if (*(_DWORD *)(a2 + 8)) {
    llvm::SmallVectorImpl<unsigned int>::operator=((uint64_t)a1, a2);
  }
  return a1;
}

{
  *a1 = a1 + 2;
  a1[1] = 0x200000000;
  if (*(_DWORD *)(a2 + 8)) {
    llvm::SmallVectorImpl<unsigned int>::operator=((uint64_t)a1, a2);
  }
  return a1;
}

void sub_255781AA4(_Unwind_Exception *exception_object)
{
  v3 = v2;
  if (*v1 != v3) {
    free(*v1);
  }
  _Unwind_Resume(exception_object);
}

double llvm::SmallVectorImpl<unsigned int>::assignRemote(uint64_t a1, uint64_t a2)
{
  v5 = (void *)(a1 + 16);
  v4 = *(void **)a1;
  if (v4 != v5) {
    free(v4);
  }
  *(void *)a1 = *(void *)a2;
  double result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  *(void *)a2 = a2 + 16;
  *(void *)(a2 + 8) = 0;
  return result;
}

_DWORD *llvm::DenseMapBase<llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>,unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::FindAndConstruct(uint64_t *a1, _DWORD *a2)
{
  v7 = 0;
  char v4 = llvm::DenseMapBase<llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>,unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::LookupBucketFor<unsigned int>(a1, a2, &v7);
  inserted = v7;
  if ((v4 & 1) == 0)
  {
    inserted = llvm::DenseMapBase<llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>,unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::InsertIntoBucketImpl<unsigned int>((uint64_t)a1, (uint64_t)a2, a2, v7);
    *(void *)inserted = *a2;
  }
  return inserted;
}

uint64_t llvm::DenseMapBase<llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>,unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::LookupBucketFor<unsigned int>(uint64_t *a1, _DWORD *a2, void *a3)
{
  int v3 = *((_DWORD *)a1 + 4);
  if (v3)
  {
    uint64_t v4 = *a1;
    int v5 = v3 - 1;
    unsigned int v6 = (37 * *a2) & (v3 - 1);
    v7 = (_DWORD *)(*a1 + 8 * v6);
    int v8 = *v7;
    if (*a2 == *v7)
    {
      uint64_t result = 1;
    }
    else
    {
      v10 = 0;
      int v11 = 1;
      uint64_t result = 1;
      while (v8 != -1)
      {
        if (v10) {
          BOOL v12 = 0;
        }
        else {
          BOOL v12 = v8 == -2;
        }
        if (v12) {
          v10 = v7;
        }
        unsigned int v13 = v6 + v11++;
        unsigned int v6 = v13 & v5;
        v7 = (_DWORD *)(v4 + 8 * (v13 & v5));
        int v8 = *v7;
        if (*a2 == *v7) {
          goto LABEL_5;
        }
      }
      uint64_t result = 0;
      if (v10) {
        v7 = v10;
      }
    }
  }
  else
  {
    v7 = 0;
    uint64_t result = 0;
  }
LABEL_5:
  *a3 = v7;
  return result;
}

_DWORD *llvm::DenseMapBase<llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>,unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::InsertIntoBucketImpl<unsigned int>(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  int v6 = *(_DWORD *)(a1 + 8);
  unsigned int v7 = *(_DWORD *)(a1 + 16);
  if (4 * v6 + 4 >= 3 * v7)
  {
    v7 *= 2;
  }
  else if (v7 + ~v6 - *(_DWORD *)(a1 + 12) > v7 >> 3)
  {
    goto LABEL_3;
  }
  llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::grow(a1, v7);
  v9 = 0;
  llvm::DenseMapBase<llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>,unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::LookupBucketFor<unsigned int>((uint64_t *)a1, a3, &v9);
  a4 = v9;
LABEL_3:
  ++*(_DWORD *)(a1 + 8);
  if (*a4 != -1) {
    --*(_DWORD *)(a1 + 12);
  }
  return a4;
}

_DWORD *llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::grow(uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  uint64_t v4 = *(llvm **)a1;
  unint64_t v5 = (a2 - 1) | ((unint64_t)(a2 - 1) >> 1);
  unint64_t v6 = v5 | (v5 >> 2) | ((v5 | (v5 >> 2)) >> 4);
  int v7 = ((v6 | (v6 >> 8)) >> 16) | v6 | (v6 >> 8);
  if ((v7 + 1) > 0x40) {
    unsigned int v8 = v7 + 1;
  }
  else {
    unsigned int v8 = 64;
  }
  *(_DWORD *)(a1 + 16) = v8;
  uint64_t result = (_DWORD *)MEMORY[0x25A28D370](8 * v8, 4);
  *(void *)a1 = result;
  if (v4)
  {
    llvm::DenseMapBase<llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>,unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::moveFromOldBuckets(a1, v4, (_DWORD *)v4 + 2 * v3);
    return (_DWORD *)llvm::deallocate_buffer(v4, (void *)(8 * v3));
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    uint64_t v10 = *(unsigned int *)(a1 + 16);
    if (v10)
    {
      uint64_t v11 = 8 * v10;
      do
      {
        *uint64_t result = -1;
        result += 2;
        v11 -= 8;
      }
      while (v11);
    }
  }
  return result;
}

uint64_t llvm::DenseMapBase<llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>,unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::moveFromOldBuckets(uint64_t result, _DWORD *a2, _DWORD *a3)
{
  uint64_t v5 = result;
  *(void *)(result + 8) = 0;
  uint64_t v6 = *(unsigned int *)(result + 16);
  if (v6)
  {
    int v7 = *(_DWORD **)result;
    uint64_t v8 = 8 * v6;
    do
    {
      _DWORD *v7 = -1;
      v7 += 2;
      v8 -= 8;
    }
    while (v8);
  }
  while (a2 != a3)
  {
    if (*a2 <= 0xFFFFFFFD)
    {
      uint64_t v10 = 0;
      uint64_t result = llvm::DenseMapBase<llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>,unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::LookupBucketFor<unsigned int>((uint64_t *)v5, a2, &v10);
      v9 = v10;
      _DWORD *v10 = *a2;
      v9[1] = a2[1];
      ++*(_DWORD *)(v5 + 8);
    }
    a2 += 2;
  }
  return result;
}

void sub_255781F74(_Unwind_Exception *exception_object)
{
  uint64_t v3 = v2;
  if (*v1 != v3) {
    free(*v1);
  }
  _Unwind_Resume(exception_object);
}

unsigned char *llvm::SmallVectorImpl<llvm::Metadata *>::insert<llvm::Metadata * const*,void>(unsigned int *a1, uint64_t a2, uint64_t *__src, uint64_t *a4)
{
  uint64_t v5 = __src;
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = (a2 - *(void *)a1) >> 3;
  uint64_t v9 = a1[2];
  if (*(void *)a1 + 8 * v9 == a2)
  {
    llvm::SmallVectorImpl<llvm::Metadata *>::append<llvm::Metadata * const*,void>(a1, __src, a4);
    return (unsigned char *)(*(void *)a1 + 8 * v8);
  }
  else
  {
    unint64_t v10 = a4 - __src;
    if (v9 + v10 > a1[3]) {
      llvm::SmallVectorBase<unsigned int>::grow_pod();
    }
    uint64_t v11 = (unsigned char *)(v7 + 8 * v8);
    BOOL v12 = (unsigned char *)(v7 + 8 * v9);
    unint64_t v13 = (v12 - v11) >> 3;
    if (v13 >= v10)
    {
      llvm::SmallVectorImpl<llvm::Value *>::append<std::move_iterator<llvm::Value **>,void>((uint64_t)a1, &v12[-8 * v10], (char *)(v7 + 8 * v9));
      if (&v12[-8 * v10] != v11) {
        memmove(&v11[8 * v10], v11, &v12[-8 * v10] - v11);
      }
      if (a4 != v5) {
        memmove(v11, v5, (char *)a4 - (char *)v5);
      }
    }
    else
    {
      unsigned int v14 = v9 + ((unint64_t)((char *)a4 - (char *)__src) >> 3);
      a1[2] = v14;
      if (v8 != v9)
      {
        memcpy((void *)(v7 + 8 * v14 - 8 * v13), v11, v12 - v11);
        v15 = v11;
        do
        {
          uint64_t v16 = *v5++;
          *v15++ = v16;
          --v13;
        }
        while (v13);
      }
      if (v5 != a4) {
        memcpy(v12, v5, (char *)a4 - (char *)v5);
      }
    }
  }
  return v11;
}

uint64_t llvm::DenseMap<unsigned int,llvm::SmallVector<unsigned int,2u>,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,llvm::SmallVector<unsigned int,2u>>>::~DenseMap(uint64_t a1)
{
  return a1;
}

void llvm::DenseMapBase<llvm::DenseMap<unsigned int,llvm::SmallVector<unsigned int,2u>,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,llvm::SmallVector<unsigned int,2u>>>,unsigned int,llvm::SmallVector<unsigned int,2u>,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,llvm::SmallVector<unsigned int,2u>>>::destroyAll(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 32 * v1;
    uint64_t v3 = *(void *)a1 + 24;
    do
    {
      if (*(_DWORD *)(v3 - 24) <= 0xFFFFFFFD)
      {
        uint64_t v4 = *(void **)(v3 - 16);
        if ((void *)v3 != v4) {
          free(v4);
        }
      }
      v3 += 32;
      v2 -= 32;
    }
    while (v2);
  }
}

uint64_t llvm::DenseMap<unsigned int,unsigned int,llvm::DenseMapInfo<unsigned int,void>,llvm::detail::DenseMapPair<unsigned int,unsigned int>>::~DenseMap(uint64_t a1)
{
  return a1;
}

uint64_t MTLCompilerDumpModule(void)
{
  return 0;
}

uint64_t MTLCompilerObject::MTLCompilerObject(uint64_t a1, long long *a2)
{
  *(void *)(a1 + 24) = 0;
  uint64_t v3 = a1 + 24;
  *(void *)(a1 + 16) = a1 + 24;
  uint64_t v4 = a1 + 16;
  *(void *)(a1 + 32) = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 114) = 0u;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 136), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    *(void *)(a1 + 152) = *((void *)a2 + 2);
    *(_OWORD *)(a1 + 136) = v5;
  }
  if (disableFreezer(void)::disableFreezerOnce != -1) {
    dispatch_once(&disableFreezer(void)::disableFreezerOnce, &__block_literal_global_0);
  }
  *(void *)(a1 + 88) = MTLGPUCompilerCreate();
  std::__tree<std::__value_type<llvm::Function *,llvm::Value *>,std::__map_value_compare<llvm::Function *,std::__value_type<llvm::Function *,llvm::Value *>,std::less<llvm::Function *>,true>,std::allocator<std::__value_type<llvm::Function *,llvm::Value *>>>::destroy(v4, *(void **)(a1 + 24));
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = v3;
  return a1;
}

void sub_2557822B4(_Unwind_Exception *a1)
{
  free((void *)v1[15]);
  v1[15] = 0;
  long long v5 = (void *)v1[8];
  if (v5)
  {
    v1[9] = (uint64_t)v5;
    operator delete(v5);
  }
  uint64_t v6 = *v3;
  if (*v3)
  {
    v1[6] = (uint64_t)v6;
    operator delete(v6);
  }
  std::__tree<std::__value_type<llvm::Function *,llvm::Value *>,std::__map_value_compare<llvm::Function *,std::__value_type<llvm::Function *,llvm::Value *>,std::less<llvm::Function *>,true>,std::allocator<std::__value_type<llvm::Function *,llvm::Value *>>>::destroy(v2, (void *)v1[3]);
  uint64_t v7 = v1[1];
  v1[1] = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  uint64_t v8 = *v1;
  *uint64_t v1 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Unwind_Resume(a1);
}

void MTLCompilerObject::~MTLCompilerObject(MTLCompilerObject *this)
{
  uint64_t v2 = *((void *)this + 9);
  uint64_t v3 = v2 - *((void *)this + 8);
  if (v3)
  {
    uint64_t v4 = 0;
    if ((unint64_t)(v3 >> 3) <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v3 >> 3;
    }
    do
    {
      uint64_t v6 = *(void (***)(void))(*((void *)this + 8) + 8 * v4);
      if (v6)
      {
        MTLCompilerPluginInterface::~MTLCompilerPluginInterface(v6);
        MEMORY[0x25A28E250]();
      }
      ++v4;
    }
    while (v5 != v4);
    uint64_t v2 = *((void *)this + 8);
  }
  *((void *)this + 9) = v2;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  uint64_t v7 = *((void *)this + 5);
  uint64_t v8 = *((void *)this + 6);
  while (v7 != v8)
  {
    LLVMDisposeMemoryBuffer();
    v7 += 8;
  }
  MTLGPUCompilerDestroy();
  if (*((char *)this + 159) < 0) {
    operator delete(*((void **)this + 17));
  }
  free(*((void **)this + 15));
  *((void *)this + 15) = 0;
  uint64_t v9 = (void *)*((void *)this + 8);
  if (v9)
  {
    *((void *)this + 9) = v9;
    operator delete(v9);
  }
  unint64_t v10 = (void *)*((void *)this + 5);
  if (v10)
  {
    *((void *)this + 6) = v10;
    operator delete(v10);
  }
  std::__tree<std::__value_type<llvm::Function *,llvm::Value *>,std::__map_value_compare<llvm::Function *,std::__value_type<llvm::Function *,llvm::Value *>,std::less<llvm::Function *>,true>,std::allocator<std::__value_type<llvm::Function *,llvm::Value *>>>::destroy((uint64_t)this + 16, *((void **)this + 3));
  uint64_t v11 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  uint64_t v12 = *(void *)this;
  *(void *)this = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
}

void *MTLCompilerObject::getFunctionFromLib(char **this, void *__handle, const char *__symbol)
{
  uint64_t v5 = dlsym(__handle, __symbol);
  if (!v5)
  {
    dlerror();
    MTLCompilerErrorObject::setFormattedErrorMessage(this + 15, "Error: %s \n", __symbol);
  }
  return v5;
}

void *MTLCompilerObject::getComposeImageFuncSPI(MTLCompilerObject *this)
{
  uint64_t result = (void *)*((void *)this + 13);
  if (!result)
  {
    uint64_t v3 = (void *)*((void *)this + 12);
    if (v3 || (uint64_t v3 = openLibComposeFilters(), (*((void *)this + 12) = v3) != 0))
    {
      uint64_t result = dlsym(v3, "composeImageFilterFunctionsSPI");
      *((void *)this + 13) = result;
    }
    else
    {
      return (void *)*((void *)this + 13);
    }
  }
  return result;
}

void *openLibComposeFilters(void)
{
  std::string::basic_string[abi:ne180100]<0>(&v5, "/System/Library/PrivateFrameworks/GPUCompiler.framework/Libraries/");
  v0 = std::string::append(&v5, "libComposeFilters.dylib");
  long long v1 = *(_OWORD *)&v0->__r_.__value_.__l.__data_;
  int64_t v7 = v0->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v1;
  v0->__r_.__value_.__l.__size_ = 0;
  v0->__r_.__value_.__r.__words[2] = 0;
  v0->__r_.__value_.__r.__words[0] = 0;
  if (v7 >= 0) {
    uint64_t v2 = __p;
  }
  else {
    uint64_t v2 = (void **)__p[0];
  }
  uint64_t v3 = dlopen((const char *)v2, 5);
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_25578262C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void *MTLCompilerObject::getComposeImageFuncFromLibrariesSPI(MTLCompilerObject *this)
{
  uint64_t result = (void *)*((void *)this + 14);
  if (!result)
  {
    uint64_t v3 = (void *)*((void *)this + 12);
    if (v3 || (uint64_t v3 = openLibComposeFilters(), (*((void *)this + 12) = v3) != 0))
    {
      uint64_t result = dlsym(v3, "composeImageFilterFunctionsFromModulesSPI");
      *((void *)this + 14) = result;
    }
    else
    {
      return (void *)*((void *)this + 14);
    }
  }
  return result;
}

void MTLCodeGenServiceCreate()
{
}

void sub_2557826FC(_Unwind_Exception *a1)
{
  MEMORY[0x25A28E250](v1, 0x10B2C40789B1B96);
  _Unwind_Resume(a1);
}

MTLCompilerObject *MTLCodeGenServiceDestroy(MTLCompilerObject *result)
{
  if (result)
  {
    MTLCompilerObject::~MTLCompilerObject(result);
    JUMPOUT(0x25A28E250);
  }
  return result;
}

llvm::NamedMDNode *MTLCompilerObject::collectFunctionConstants(MTLCompilerObject *this, llvm::Module *a2, FunctionDesc *a3)
{
  __p[0] = "air.function_constants";
  __int16 v31 = 259;
  uint64_t result = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(a2, (const llvm::Twine *)__p);
  if (result)
  {
    std::string v5 = result;
    uint64_t v6 = (uint64_t *)((char *)a3 + 72);
    unsigned int NumOperands = llvm::NamedMDNode::getNumOperands(result);
    uint64_t v8 = NumOperands;
    std::vector<FunctionConstantDesc>::reserve(v6, NumOperands);
    if (NumOperands)
    {
      uint64_t v9 = 0;
      do
      {
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v29 = 0;
        uint64_t Operand = llvm::NamedMDNode::getOperand(v5);
        uint64_t v11 = Operand;
        uint64_t v12 = *(unsigned int *)(Operand + 8);
        if (v12 >= 4)
        {
          uint64_t v13 = Operand - 8 * v12;
          unsigned int v14 = *(llvm::MDString **)(v13 + 16);
          uint64_t v15 = *(void *)(v13 + 24);
          String = (const char *)llvm::MDString::getString(*(llvm::MDString **)(v13 + 8));
          v18 = (void *)llvm::MDString::getString(v14);
          if (v18)
          {
            std::string::basic_string[abi:ne180100](&__dst, v18, v17);
          }
          else
          {
            long long __dst = 0uLL;
            uint64_t v27 = 0;
          }
          if (SHIBYTE(v29) < 0) {
            operator delete(__p[0]);
          }
          *(_OWORD *)__p = __dst;
          uint64_t v29 = v27;
          size_t v19 = strlen(String);
          uint64_t v30 = dataTypeFromString(String, v19);
          uint64_t v20 = *(void *)(v15 + 128);
          v21 = (void *)(v20 + 24);
          if (*(_DWORD *)(v20 + 32) >= 0x41u) {
            v21 = (void *)*v21;
          }
          __int16 v31 = *v21;
          if (*(_DWORD *)(v11 + 8) == 5 && (uint64_t v22 = *(void *)(v11 - 8)) != 0)
          {
            uint64_t v23 = *(void *)(v22 + 128);
            v24 = (void *)(v23 + 24);
            if (*(_DWORD *)(v23 + 32) >= 0x41u) {
              v24 = (void *)*v24;
            }
            __int16 v25 = *(_DWORD *)v24 != 0;
          }
          else
          {
            __int16 v25 = 1;
          }
          __int16 v32 = v25;
          std::vector<FunctionConstantDesc>::push_back[abi:ne180100](v6, (long long *)__p);
        }
        if (SHIBYTE(v29) < 0) {
          operator delete(__p[0]);
        }
        ++v9;
      }
      while (v8 != v9);
    }
    return (llvm::NamedMDNode *)std::vector<FunctionConstantDesc>::shrink_to_fit((uint64_t)v6);
  }
  return result;
}

void sub_255782920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<FunctionConstantDesc>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<FunctionConstantDesc>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 40 * v6;
    std::vector<FunctionConstantDesc>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<FunctionConstantDesc>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_2557829EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<FunctionConstantDesc>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<FunctionConstantDesc>::push_back[abi:ne180100](uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(result - 8);
  if (v7 >= v6)
  {
    unint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v7 - *a1) >> 3);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x666666666666666) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x333333333333333) {
      unint64_t v14 = 0x666666666666666;
    }
    else {
      unint64_t v14 = v12;
    }
    v19[4] = result;
    if (v14) {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<FunctionConstantDesc>>(result, v14);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = &v15[40 * v11];
    v19[0] = v15;
    v19[1] = v16;
    v19[3] = &v15[40 * v14];
    long long v17 = *a2;
    *((void *)v16 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v16 = v17;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    uint64_t v18 = *((void *)a2 + 3);
    *((_DWORD *)v16 + 8) = *((_DWORD *)a2 + 8);
    *((void *)v16 + 3) = v18;
    v19[2] = v16 + 40;
    std::vector<FunctionConstantDesc>::__swap_out_circular_buffer(a1, v19);
    uint64_t v10 = a1[1];
    uint64_t result = std::__split_buffer<FunctionConstantDesc>::~__split_buffer((uint64_t)v19);
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    uint64_t v9 = *((void *)a2 + 3);
    *(_DWORD *)(v7 + 32) = *((_DWORD *)a2 + 8);
    *(void *)(v7 + 24) = v9;
    uint64_t v10 = v7 + 40;
    a1[1] = v7 + 40;
  }
  a1[1] = v10;
  return result;
}

void sub_255782B48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<FunctionConstantDesc>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<FunctionConstantDesc>::shrink_to_fit(uint64_t result)
{
  unint64_t v1 = *(void *)result;
  int64x2_t v2 = *(int64x2_t *)(result + 8);
  int64x2_t v3 = vshrq_n_s64(vsubq_s64(v2, vdupq_n_s64(*(void *)result)), 3uLL);
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * v3.i64[0];
  unint64_t v5 = v4;
  if (0xCCCCCCCCCCCCCCCDLL * v3.i64[1] > v4)
  {
    unint64_t v6 = (uint64_t *)result;
    uint64_t v7 = result + 16;
    uint64_t v14 = v7;
    if (v2.i64[0] == v1)
    {
      long long v8 = 0;
      uint64_t v9 = 0;
    }
    else
    {
      long long v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<FunctionConstantDesc>>(v7, v4);
    }
    uint64_t v10 = v8;
    unint64_t v11 = &v8[40 * v5];
    unint64_t v12 = v11;
    unint64_t v13 = &v8[40 * v9];
    std::vector<FunctionConstantDesc>::__swap_out_circular_buffer(v6, &v10);
    return std::__split_buffer<FunctionConstantDesc>::~__split_buffer((uint64_t)&v10);
  }
  return result;
}

void sub_255782C14(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

void std::vector<MTLTagType>::push_back[abi:ne180100](uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 16;
  unint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = *(void **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    long long v8 = *(void **)a1;
    uint64_t v9 = ((uint64_t)v6 - *(void *)a1) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
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
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>(v4, v12);
      long long v8 = *(void **)a1;
      unint64_t v6 = *(void **)(a1 + 8);
    }
    else
    {
      unint64_t v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = *a2;
    uint64_t v7 = v14 + 8;
    while (v6 != v8)
    {
      uint64_t v16 = *--v6;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *unint64_t v6 = *a2;
    uint64_t v7 = v6 + 1;
  }
  *(void *)(a1 + 8) = v7;
}

void FunctionDesc::~FunctionDesc(FunctionDesc *this)
{
  int64x2_t v2 = (void *)*((void *)this + 12);
  if (v2)
  {
    *((void *)this + 13) = v2;
    operator delete(v2);
  }
  int64x2_t v3 = (void **)((char *)this + 72);
  std::vector<FunctionConstantDesc>::__destroy_vector::operator()[abi:ne180100](&v3);
}

BOOL stringStartsWith(const char *a1, const char *__s)
{
  size_t v4 = strlen(__s);
  return strncmp(a1, __s, v4) == 0;
}

uint64_t isEntryPointFunctionType(int a1)
{
  return ((unint64_t)entryPointsType[a1] < 9) & (0x18Eu >> entryPointsType[a1]);
}

uint64_t fixLinkage(llvm::Module *this, const char *a2)
{
  char v3 = 1;
  char v13 = 1;
  if (*a2)
  {
    uint64_t v11 = a2;
    char v3 = 3;
  }
  char v12 = v3;
  NamedMetadata = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(this, (const llvm::Twine *)&v11);
  uint64_t Operand = llvm::NamedMDNode::getOperand(NamedMetadata);
  uint64_t v6 = *(void *)(*(void *)(Operand - 8 * *(unsigned int *)(Operand + 8)) + 128);
  uint64_t v7 = (char *)this + 24;
  long long v8 = (char *)*((void *)this + 4);
  if (v8 != (char *)this + 24)
  {
    do
    {
      if (v8) {
        uint64_t v9 = (llvm::GlobalValue *)(v8 - 56);
      }
      else {
        uint64_t v9 = 0;
      }
      if ((llvm::GlobalValue::isDeclaration(v9) & 1) == 0) {
        *((_DWORD *)v9 + 8) = *((_DWORD *)v9 + 8) & 0xFFFFBFC0 | 0x4007;
      }
      long long v8 = (char *)*((void *)v8 + 1);
    }
    while (v8 != v7);
  }
  llvm::GlobalValue::setLinkage(v6, 0);
  return v6;
}

double llvm::Module::setTargetTriple(uint64_t a1, void *__src, size_t __len)
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
    p_dst = (long long *)operator new(v7 + 1);
    *((void *)&__dst + 1) = __len;
    unint64_t v12 = v8 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v12) = __len;
  p_dst = &__dst;
  if (__len) {
LABEL_8:
  }
    memmove(p_dst, __src, __len);
  *((unsigned char *)p_dst + __len) = 0;
  uint64_t v9 = (void **)(a1 + 216);
  if (*(char *)(a1 + 239) < 0) {
    operator delete(*v9);
  }
  double result = *(double *)&__dst;
  *(_OWORD *)uint64_t v9 = __dst;
  *(void *)(a1 + 232) = v12;
  return result;
}

uint64_t MTLCompilerObject::applyConstantValues(uint64_t a1, llvm::LLVMContext *this, uint64_t a3, uint64_t a4, const char *a5, unint64_t a6, uint64_t a7, const char **a8)
{
  v18[0] = this;
  unint64_t v12 = (MTLCompilerErrorObject *)(a1 + 120);
  v18[2] = llvm::LLVMContext::getDiagnosticContext(this);
  v18[1] = llvm::LLVMContext::getDiagnosticHandlerCallBack(this);
  llvm::LLVMContext::setDiagnosticHandlerCallBack();
  unsigned int v17 = 0;
  char v13 = parseFunctionConstants(this, a5, a6, &v17);
  int v14 = MTLGPUCompilerSpecializeFunction();
  free(v13);
  if (!v14)
  {
    if (a8) {
      uint64_t v15 = *a8;
    }
    else {
      uint64_t v15 = "Failed to specialize function.";
    }
    MTLCompilerErrorObject::setErrorMessage(v12, v15);
  }
  ScopedDiagnosticHandler::~ScopedDiagnosticHandler((ScopedDiagnosticHandler *)v18);
  return 0;
}

void sub_2557830B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ScopedDiagnosticHandler::~ScopedDiagnosticHandler((ScopedDiagnosticHandler *)va);
  _Unwind_Resume(a1);
}

void softDiagnosticHandler(uint64_t a1, MTLCompilerErrorObject *a2)
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v6 = 0;
  printDiagnosticError(a1, (uint64_t)__p);
  if (!*(unsigned char *)(a1 + 12))
  {
    if (v6 >= 0) {
      size_t v4 = __p;
    }
    else {
      size_t v4 = (void **)__p[0];
    }
    MTLCompilerErrorObject::setErrorMessage(a2, (const char *)v4);
  }
  if (SHIBYTE(v6) < 0) {
    operator delete(__p[0]);
  }
}

void sub_255783140(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t getSerializedModule@<X0>(signed int __val@<W1>, void *a2@<X8>)
{
  if (__val <= 3901)
  {
    if (!__val || __val == 3802) {
      goto LABEL_23;
    }
  }
  else if (__val == 32023 || __val == 31001 || __val == 3902)
  {
    goto LABEL_23;
  }
  std::to_string(&v10, __val);
  size_t v4 = std::string::insert(&v10, 0, "Unexpected llvmVersion (");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v11.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  uint64_t v6 = std::string::append(&v11, ") passed to getMTLBitcodeVersionFromLLVMVersion, using MTLBitcodeVersionDefault instead");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  std::string::size_type v13 = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  std::string::basic_string[abi:ne180100]<0>(&v11, (char *)&unk_2557AB8A6);
  int v9 = -1;
  MTLBuildRequestTypeToString(&v9, &v10);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    getSerializedModule();
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13) < 0) {
    operator delete(__p[0]);
  }
LABEL_23:
  uint64_t result = MTLWriteAIRBitcodeToMemoryBuffer();
  *a2 = result;
  return result;
}

void sub_255783304(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (v28 < 0) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

uint64_t MTLCompilerObject::serializeLibraryReply(uint64_t a1, void *a2, char *__s1, char a4, llvm::Module **a5, unint64_t a6, unsigned int a7, uint64_t a8, char a9, unsigned int __val, uint64_t *a11)
{
  v193[30] = *MEMORY[0x263EF8340];
  uint64_t v179 = 0;
  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long __n_4 = 0u;
  memset(v171, 0, sizeof(v171));
  int v172 = 1065353216;
  uint64_t v170 = 104;
  if (__s1)
  {
    DWORD2(v173) = 104;
    HIDWORD(v173) = strlen(__s1) + 1;
    uint64_t v170 = HIDWORD(v173) + 104;
  }
  if (a4)
  {
    if (a6)
    {
      unsigned int VersionMetadata = readVersionMetadata(*a5, "air.version", 0, 1, 6);
      uint64_t v18 = (MTLCompilerObject *)readVersionMetadata(*a5, "air.language_version", 1u, 1, 0);
      unint64_t v130 = __PAIR64__(v18, VersionMetadata);
      uint64_t v19 = 0;
      LOBYTE(v173) = v173 | 1;
      uint64_t v167 = 0;
      uint64_t v168 = 0;
      uint64_t v169 = 0;
      uint64_t v20 = a5;
      unint64_t v21 = a6;
      do
      {
        uint64_t v22 = *v20;
        if ((a9 & 1) == 0) {
          parseFunctions(*v20, &v167);
        }
        uint64_t v18 = MTLCompilerObject::collectFunctionConstants(v18, v22, (FunctionDesc *)(v167 + v19));
        ++v20;
        v19 += 120;
        --v21;
      }
      while (v21);
      uint64_t v24 = v167;
      uint64_t v23 = v168;
    }
    else
    {
      unint64_t v130 = 0;
      uint64_t v24 = 0;
      uint64_t v23 = 0;
      LOBYTE(v173) = 1;
      uint64_t v167 = 0;
      uint64_t v168 = 0;
      uint64_t v169 = 0;
    }
    uint64_t v163 = 0;
    v164 = &v163;
    uint64_t v165 = 0x2020000000;
    v159[0] = MEMORY[0x263EF8330];
    v159[1] = 3221225472;
    v160 = ___ZN17MTLCompilerObject21serializeLibraryReplyEPmPcbPPN4llvm6ModuleEmmP21SerializedLibraryInfobjP21FrameworkPassesOutput_block_invoke;
    v161 = &unk_2653C28C0;
    v162 = &v163;
    v155[0] = MEMORY[0x263EF8330];
    v155[1] = 3221225472;
    v156 = ___ZN17MTLCompilerObject21serializeLibraryReplyEPmPcbPPN4llvm6ModuleEmmP21SerializedLibraryInfobjP21FrameworkPassesOutput_block_invoke_2;
    v157 = &unk_2653C28E8;
    v158 = &v163;
    uint64_t v26 = 12;
    uint64_t v166 = 12;
    uint64_t v134 = v24;
    uint64_t v135 = v23;
    unint64_t v27 = (v23 - v24) / 120;
    v136 = a5;
    if (v23 != v24)
    {
      uint64_t v28 = 0;
      if (v27 <= 1) {
        uint64_t v29 = 1;
      }
      else {
        uint64_t v29 = (v23 - v24) / 120;
      }
      do
      {
        uint64_t v30 = v167;
        uint64_t v31 = v167 + v28;
        ((void (*)(void *, void))v160)(v159, *(unsigned int *)(v167 + v28 + 48));
        ((void (*)(void *, void))v160)(v159, *(unsigned int *)(v31 + 52));
        ((void (*)(void *, void))v160)(v159, *(unsigned int *)(v30 + v28 + 56));
        ((void (*)(void *, void))v160)(v159, *(unsigned int *)(v30 + v28 + 60));
        ((void (*)(void *, void))v160)(v159, *(unsigned int *)(v30 + v28 + 64));
        ((void (*)(void *, void))v160)(v159, *(unsigned __int8 *)(v30 + v28 + 68));
        ((void (*)(void *, void))v160)(v159, *(unsigned __int8 *)(v30 + v28 + 69));
        v156((uint64_t)v155, (void *)(v30 + v28 + 32));
        v28 += 120;
        --v29;
      }
      while (v29);
      uint64_t v26 = v164[3];
      a5 = v136;
    }
    *(void *)&long long __n_4 = __PAIR64__(v26, v170);
    v170 += v26;
    unint64_t v154 = 0;
    unint64_t v129 = a6;
    v128 = a2;
    ptr = malloc_type_malloc(v27 << 10, 0xFA8FEB0CuLL);
    size_t size = v27 << 10;
    uint64_t v149 = 0;
    unint64_t v150 = 0;
    unint64_t v151 = 0;
    if (v135 != v134)
    {
      size_t v32 = 0;
      uint64_t v33 = 0;
      if (v27 <= 1) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = v27;
      }
      uint64_t v133 = v34;
      while (1)
      {
        uint64_t v139 = v167;
        uint64_t v35 = v167 + 120 * v33;
        *(_DWORD *)(v35 + 56) = v32;
        *(_DWORD *)(v35 + 60) = 0;
        memset(v148, 0, sizeof(v148));
        v137 = (int *)(v35 + 48);
        if ((entryPointsType[*(int *)(v35 + 48)] & 0xFFFFFFFFFFFFFFFDLL) == 1)
        {
          uint64_t v36 = v139 + 120 * v33;
          uint64_t v39 = *(void *)(v36 + 8);
          uint64_t v38 = v36 + 8;
          uint64_t v37 = v39;
          if (v39) {
            uint64_t v40 = *(unsigned int *)(v37 + 8);
          }
          else {
            uint64_t v40 = 0;
          }
          v41 = *(llvm::Function **)v35;
          if (*(_WORD *)(*(void *)v35 + 18)) {
            llvm::Function::BuildLazyArguments(*(llvm::Function **)v35);
          }
          if (v40)
          {
            uint64_t v42 = 0;
            uint64_t v43 = *((void *)v41 + 11);
            uint64_t v44 = 8 * v40;
            do
            {
              uint64_t v45 = *(void *)(*(void *)v38 - 8 * *(unsigned int *)(*(void *)v38 + 8) + v42);
              DataLayout = (const llvm::DataLayout *)llvm::Module::getDataLayout(*(llvm::Module **)(*(void *)v35 + 40));
              llvm::DataLayout::DataLayout((llvm::DataLayout *)v189, DataLayout);
              MTLArgumentData::MTLArgumentData((MTLArgumentData *)&v182);
              v180[1] = 0;
              v180[0] = 0;
              int v181 = 0;
              parseArgumentMetadata((uint64_t)&v182, v45, v43, 0, (uint64_t)v189, 0, (uint64_t *)v180, 7);
              if ((v182 & 2) != 0)
              {
                unint64_t v47 = v150;
                if (v150 >= v151)
                {
                  uint64_t v48 = std::vector<MTLArgumentData>::__push_back_slow_path<MTLArgumentData const&>(&v149, &v182);
                }
                else
                {
                  std::allocator<MTLArgumentData>::construct[abi:ne180100]<MTLArgumentData,MTLArgumentData const&>((uint64_t)&v151, v150, &v182);
                  uint64_t v48 = v47 + 288;
                }
                unint64_t v150 = v48;
              }
              llvm::DenseMap<llvm::Metadata *,std::vector<MTLStructMemberInfo> *,llvm::DenseMapInfo<llvm::Metadata *,void>,llvm::detail::DenseMapPair<llvm::Metadata *,std::vector<MTLStructMemberInfo> *>>::~DenseMap((uint64_t)v180);
              v180[0] = (void **)&v188;
              std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100](v180);
              if (v187) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v187);
              }
              if (v186) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v186);
              }
              if (v185) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v185);
              }
              v43 += 40;
              MEMORY[0x25A28CD60](v189);
              v42 += 8;
            }
            while (v44 != v42);
          }
        }
        uint64_t v138 = v33;
        uint64_t v50 = v149;
        unint64_t v49 = v150;
        unint64_t v51 = (uint64_t)(v150 - v149) / 288;
        int v52 = 0;
        if (v150 != v149)
        {
          if (v51 <= 1) {
            uint64_t v53 = 1;
          }
          else {
            uint64_t v53 = (uint64_t)(v150 - v149) / 288;
          }
          uint64_t v54 = 96;
          do
          {
            uint64_t v55 = *(void *)(v149 + v54);
            if (v55)
            {
              int v56 = *(_DWORD *)(v55 + 8);
              int v57 = v56 - isPatchControlPointInputUnused(v55) - 3;
            }
            else
            {
              int v57 = 1;
            }
            v52 += v57;
            v54 += 288;
            --v53;
          }
          while (v53);
        }
        if (v32 >= 0xFFFFFFFFFFFFFFFCLL) {
          goto LABEL_191;
        }
        if (size >= v32 + 4)
        {
          v59 = (char *)ptr;
        }
        else
        {
          if (size) {
            unint64_t v58 = size;
          }
          else {
            unint64_t v58 = 128;
          }
          while (v58 < v32 + 4)
          {
            if (v58 >> 1 >= ~v58) {
              unint64_t v58 = v32 + 4;
            }
            else {
              v58 += v58 >> 1;
            }
          }
          v59 = (char *)malloc_type_realloc(ptr, v58, 0x227314A4uLL);
          ptr = v59;
          if (!v59) {
            goto LABEL_191;
          }
          size_t size = v58;
        }
        *(_DWORD *)&v59[v32] = v52;
        unint64_t v154 = v32 + 4;
        if (v49 != v50)
        {
          uint64_t v60 = 0;
          if (v51 <= 1) {
            unint64_t v51 = 1;
          }
          do
          {
            uint64_t v61 = v149 + 288 * v60;
            uint64_t v64 = *(void *)(v61 + 96);
            uint64_t v63 = v61 + 96;
            uint64_t v62 = v64;
            if (v64)
            {
              int v65 = *(_DWORD *)(v62 + 8);
              uint64_t v66 = (v65 - isPatchControlPointInputUnused(v62));
              if (v66 >= 4)
              {
                for (uint64_t i = 3; i != v66; ++i)
                {
                  uint64_t v68 = *(void *)(*(void *)v63 - 8 * *(unsigned int *)(*(void *)v63 + 8) + 8 * i);
                  MTLArgumentData::MTLArgumentData((MTLArgumentData *)v189);
                  parseControlPointInputMetadata(v68, (uint64_t)v189);
                  serializeOneVertexAttribute((int *)v189, (char **)&ptr);
                  *(void *)&long long v182 = v193;
                  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v182);
                  if (v192) {
                    std::__shared_weak_count::__release_shared[abi:ne180100](v192);
                  }
                  if (v191) {
                    std::__shared_weak_count::__release_shared[abi:ne180100](v191);
                  }
                  if (v190) {
                    std::__shared_weak_count::__release_shared[abi:ne180100](v190);
                  }
                }
              }
            }
            else
            {
              serializeOneVertexAttribute((int *)(v149 + 288 * v60), (char **)&ptr);
            }
            ++v60;
          }
          while (v60 != v51);
        }
        std::vector<MTLArgumentData>::resize(&v149, 0);
        unint64_t v69 = v154;
        if (v154 > 0xFFFFFFFFFFFFFFFBLL) {
LABEL_191:
        }
          abort();
        uint64_t v70 = v139 + 120 * v138;
        uint64_t v73 = *(void *)(v70 + 72);
        v71 = (uint64_t *)(v70 + 72);
        uint64_t v72 = v73;
        uint64_t v74 = v71[1];
        size_t v32 = v154 + 4;
        unint64_t v75 = size;
        if (size >= v154 + 4)
        {
          v76 = (char *)ptr;
        }
        else
        {
          if (!size) {
            unint64_t v75 = 128;
          }
          while (v75 < v32)
          {
            if (v75 >> 1 >= ~v75) {
              unint64_t v75 = v154 + 4;
            }
            else {
              v75 += v75 >> 1;
            }
          }
          v76 = (char *)malloc_type_realloc(ptr, v75, 0x227314A4uLL);
          ptr = v76;
          if (!v76) {
            goto LABEL_191;
          }
          size_t size = v75;
        }
        *(_DWORD *)&v76[v69] = -858993459 * ((v74 - v72) >> 3);
        unint64_t v154 = v69 + 4;
        uint64_t v77 = *v71;
        uint64_t v78 = v71[1];
        while (v77 != v78)
        {
          if (*(char *)(v77 + 23) < 0)
          {
            v80 = *(const void **)v77;
            size_t v79 = *(void *)(v77 + 8);
          }
          else
          {
            size_t v79 = *(unsigned __int8 *)(v77 + 23);
            v80 = (const void *)v77;
          }
          size_t v81 = v79 + 1;
          if (__CFADD__(v32, v79 + 1)) {
            goto LABEL_191;
          }
          unint64_t v82 = v81 + v32;
          if (v75 < v81 + v32)
          {
            if (!v75)
            {
              size_t size = 128;
              unint64_t v75 = 128;
            }
            while (v75 < v82)
            {
              if (v75 >> 1 >= ~v75) {
                unint64_t v75 = v81 + v32;
              }
              else {
                v75 += v75 >> 1;
              }
            }
            v76 = (char *)malloc_type_realloc(v76, v75, 0x227314A4uLL);
            ptr = v76;
            if (!v76) {
              goto LABEL_191;
            }
            size_t size = v75;
          }
          memcpy(&v76[v32], v80, v79);
          v76[v79 + v32] = 0;
          unint64_t v154 = v82;
          if (v82 == -1) {
            goto LABEL_191;
          }
          char v83 = *(unsigned char *)(v77 + 24);
          if (v75 <= v82)
          {
            if (!v75)
            {
              size_t size = 128;
              unint64_t v75 = 128;
            }
            while (v75 <= v82)
            {
              if (v75 >> 1 >= ~v75) {
                unint64_t v75 = v82 + 1;
              }
              else {
                v75 += v75 >> 1;
              }
            }
            v76 = (char *)malloc_type_realloc(v76, v75, 0x227314A4uLL);
            ptr = v76;
            if (!v76) {
              goto LABEL_191;
            }
            size_t size = v75;
          }
          v76[v82] = v83;
          unint64_t v154 = v82 + 1;
          if (v82 > 0xFFFFFFFFFFFFFFFALL) {
            goto LABEL_191;
          }
          __int16 v84 = *(_WORD *)(v77 + 32);
          unint64_t v85 = v82 + 5;
          if (v75 < v82 + 5)
          {
            do
            {
              if (v75 >> 1 >= ~v75) {
                unint64_t v75 = v82 + 5;
              }
              else {
                v75 += v75 >> 1;
              }
            }
            while (v75 < v85);
            v76 = (char *)malloc_type_realloc(v76, v75, 0x227314A4uLL);
            ptr = v76;
            if (!v76) {
              goto LABEL_191;
            }
            size_t size = v75;
          }
          v86 = &v76[v82 + 1];
          *(_WORD *)v86 = v84;
          *((_WORD *)v86 + 1) = 0;
          unint64_t v154 = v82 + 5;
          if (v82 == -6) {
            goto LABEL_191;
          }
          __int16 v87 = *(_WORD *)(v77 + 34);
          size_t v32 = v82 + 6;
          if (v75 <= v85)
          {
            if (!v75)
            {
              size_t size = 128;
              unint64_t v75 = 128;
            }
            while (v75 <= v85)
            {
              if (v75 >> 1 >= ~v75) {
                unint64_t v75 = v82 + 6;
              }
              else {
                v75 += v75 >> 1;
              }
            }
            v76 = (char *)malloc_type_realloc(v76, v75, 0x227314A4uLL);
            ptr = v76;
            if (!v76) {
              goto LABEL_191;
            }
            size_t size = v75;
          }
          v76[v85] = v87;
          unint64_t v154 = v82 + 6;
          v77 += 40;
        }
        if (entryPointsType[*v137] == 1)
        {
          uint64_t v88 = v138;
          uint64_t v89 = v139 + 120 * v138;
          uint64_t v92 = *(void *)(v89 + 16);
          uint64_t v91 = v89 + 16;
          uint64_t v90 = v92;
          a5 = v136;
          if (!v92) {
            goto LABEL_154;
          }
          uint64_t v90 = *(unsigned int *)(v90 + 8);
          if (!v90) {
            goto LABEL_154;
          }
          uint64_t v93 = 0;
          uint64_t v94 = 8 * v90;
          while (1)
          {
            uint64_t v95 = *(void *)(*(void *)v91 - 8 * *(unsigned int *)(*(void *)v91 + 8) + v93);
            String = (void *)llvm::MDString::getString(*(llvm::MDString **)(v95 - 8 * *(unsigned int *)(v95 + 8)));
            if (v97 == 29)
            {
              BOOL v98 = *String == 0x646E65722E726961 && String[1] == 0x65677261745F7265;
              BOOL v99 = v98 && String[2] == 0x5F79617272615F74;
              if (v99 && *(void *)((char *)String + 21) == 0x7865646E695F7961) {
                break;
              }
            }
            v93 += 8;
            if (v94 == v93)
            {
              LOBYTE(v90) = 0;
              goto LABEL_154;
            }
          }
          LOBYTE(v90) = dataTypeFromMetadata(1u, v95);
        }
        else
        {
          LOBYTE(v90) = 0;
        }
        a5 = v136;
        uint64_t v88 = v138;
LABEL_154:
        *(unsigned char *)(v139 + 120 * v88 + 68) = v90;
        v189[0] = (void **)v148;
        std::vector<MTLArgumentData>::__destroy_vector::operator()[abi:ne180100](v189);
        uint64_t v33 = v88 + 1;
        if (v33 == v133) {
          goto LABEL_158;
        }
      }
    }
    size_t v32 = 0;
LABEL_158:
    v189[0] = (void **)&v149;
    std::vector<MTLArgumentData>::__destroy_vector::operator()[abi:ne180100](v189);
    *((void *)&__n_4 + 1) = __PAIR64__(v32, v170);
    v170 += v32;
    *(void *)&long long v175 = v170;
    DWORD2(v175) = v170;
    std::vector<std::unique_ptr<llvm::MemoryBuffer>>::vector(v180, v129);
    if (v129)
    {
      uint64_t v101 = 0;
      unsigned int v102 = 0;
      uint64_t v103 = 64;
      do
      {
        if (v135 != v134) {
          *(_DWORD *)(v167 + v103) = v102;
        }
        getSerializedModule(__val, v189);
        v104 = v180[0][v101];
        v180[0][v101] = v189[0];
        if (v104) {
          (*(void (**)(void *))(*(void *)v104 + 8))(v104);
        }
        a5[v101] = 0;
        v102 += *((_DWORD *)v180[0][v101] + 4) - *((_DWORD *)v180[0][v101] + 2) + 4;
        ++v101;
        v103 += 120;
      }
      while (v129 != v101);
    }
    else
    {
      unsigned int v102 = 0;
    }
    v170 += v102;
    HIDWORD(v175) = v102;
    if (a8) {
      SerializedLibraryInfo::serializeDynamicLibraryDataHeader(a8, &v173, &v170);
    }
    if (a11)
    {
      if (a11[1]) {
        uint64_t v105 = *a11;
      }
      else {
        uint64_t v105 = 0;
      }
      CompilerOutputReflectionBlock::CompilerOutputReflectionBlock(v189, v105);
      addBlocksForOutput(v171, a11, 0, (uint64_t *)v189);
      HIDWORD(v179) = sizeOfSerializedCompilerBlocks((uint64_t)v171);
      LODWORD(v179) = v170;
      v170 += HIDWORD(v179);
      CompilerOutputReflectionBlock::~CompilerOutputReflectionBlock((void **)v189);
    }
    *(void *)&long long v176 = __PAIR64__(a7, v170);
    v170 += a7;
    v106 = malloc_type_malloc(v170, 0xD4A6EA62uLL);
    uint64_t v25 = (uint64_t)v106;
    long long v107 = v173;
    long long v108 = v175;
    v106[1] = __n_4;
    v106[2] = v108;
    _OWORD *v106 = v107;
    long long v109 = v176;
    long long v110 = v177;
    long long v111 = v178;
    *((void *)v106 + 12) = v179;
    v106[4] = v110;
    v106[5] = v111;
    v106[3] = v109;
    if (__s1)
    {
      memcpy((char *)v106 + DWORD2(v173), __s1, HIDWORD(v173));
      free(__s1);
    }
    *(void *)&long long v182 = 0;
    *((void *)&v182 + 1) = &v182;
    uint64_t v183 = 0x2020000000;
    v184 = (_DWORD *)(v25 + __n_4);
    _DWORD *v184 = v130;
    uint64_t v112 = *((void *)&v182 + 1);
    ++v184;
    **(_DWORD **)(*((void *)&v182 + 1) + 24) = HIDWORD(v130);
    *(void *)(v112 + 24) += 4;
    v143 = &v182;
    v144[0] = MEMORY[0x263EF8330];
    v144[1] = 3221225472;
    v145 = ___ZN17MTLCompilerObject21serializeLibraryReplyEPmPcbPPN4llvm6ModuleEmmP21SerializedLibraryInfobjP21FrameworkPassesOutput_block_invoke_3;
    v146 = &unk_2653C28C0;
    v147 = &v182;
    v140[0] = MEMORY[0x263EF8330];
    v140[1] = 3221225472;
    v141 = ___ZN17MTLCompilerObject21serializeLibraryReplyEPmPcbPPN4llvm6ModuleEmmP21SerializedLibraryInfobjP21FrameworkPassesOutput_block_invoke_4;
    v142 = &unk_2653C28E8;
    BOOL v98 = v168 == v167;
    unint64_t v113 = 0xEEEEEEEEEEEEEEEFLL * ((v168 - v167) >> 3);
    uint64_t v114 = *((void *)&v182 + 1);
    **(_DWORD **)(*((void *)&v182 + 1) + 24) = v113;
    *(void *)(v114 + 24) += 4;
    if (!v98)
    {
      uint64_t v115 = 0;
      if (v113 <= 1) {
        uint64_t v116 = 1;
      }
      else {
        uint64_t v116 = v113;
      }
      do
      {
        uint64_t v117 = v167;
        uint64_t v118 = v167 + v115;
        v145((uint64_t)v144, *(_DWORD *)(v167 + v115 + 48));
        v145((uint64_t)v144, *(_DWORD *)(v118 + 52));
        v145((uint64_t)v144, *(_DWORD *)(v117 + v115 + 56));
        v145((uint64_t)v144, *(_DWORD *)(v117 + v115 + 60));
        v145((uint64_t)v144, *(_DWORD *)(v117 + v115 + 64));
        v145((uint64_t)v144, *(unsigned __int8 *)(v117 + v115 + 68));
        v145((uint64_t)v144, *(unsigned __int8 *)(v117 + v115 + 69));
        v141((uint64_t)v140, (const void **)(v117 + v115 + 32));
        v115 += 120;
        --v116;
      }
      while (v116);
    }
    v119 = ptr;
    memcpy((void *)(v25 + DWORD2(__n_4)), ptr, v32);
    if (a8) {
      SerializedLibraryInfo::serializeDynamicLibraryData(a8, (unsigned int *)&v173, v25);
    }
    if (a11 && HIDWORD(v179))
    {
      memset(v189, 0, 64);
      serializeCompilerBlocks((void *)(v25 + v179), HIDWORD(v179), (uint64_t)v171, (uint64_t)v189);
    }
    if (v129)
    {
      uint64_t v120 = 0;
      v121 = (char *)(v25 + DWORD2(v175));
      do
      {
        v122 = v180[0][v120];
        v123 = (const void *)v122[1];
        uint64_t v124 = v122[2];
        int v125 = v124 - v123;
        *(_DWORD *)v121 = v124 - v123;
        v126 = v121 + 4;
        memcpy(v126, v123, (v124 - v123));
        v121 = &v126[v125];
        ++v120;
      }
      while (v129 != v120);
    }
    void *v128 = v170;
    _Block_object_dispose(&v182, 8);
    v189[0] = (void **)v180;
    std::vector<std::unique_ptr<llvm::MemoryBuffer>>::__destroy_vector::operator()[abi:ne180100](v189);
    free(v119);
    _Block_object_dispose(&v163, 8);
    v189[0] = (void **)&v167;
    std::vector<FunctionDesc>::__destroy_vector::operator()[abi:ne180100](v189);
  }
  else
  {
    MTLCompilerErrorObject::setErrorMessage((MTLCompilerErrorObject *)(a1 + 120), __s1);
    free(__s1);
    uint64_t v25 = 0;
  }
  std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::~__hash_table((uint64_t)v171);
  return v25;
}

void sub_2557842EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  STACK[0x370] = (unint64_t)&STACK[0x238];
  std::vector<std::unique_ptr<llvm::MemoryBuffer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x370]);
  free(a40);
  _Block_object_dispose(&a53, 8);
  STACK[0x250] = (unint64_t)&a57;
  std::vector<FunctionDesc>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x250]);
  std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::~__hash_table((uint64_t)&a61);
  _Unwind_Resume(a1);
}

uint64_t ___ZN17MTLCompilerObject21serializeLibraryReplyEPmPcbPPN4llvm6ModuleEmmP21SerializedLibraryInfobjP21FrameworkPassesOutput_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t ___ZN17MTLCompilerObject21serializeLibraryReplyEPmPcbPPN4llvm6ModuleEmmP21SerializedLibraryInfobjP21FrameworkPassesOutput_block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v2 = a2[1];
  if (!v2 || *(unsigned char *)(v2 + *a2 - 1)) {
    LODWORD(v2) = v2 + 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

void std::vector<MTLArgumentData>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = 0x8E38E38E38E38E39 * ((v3 - *a1) >> 5);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<MTLArgumentData>::__append(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 288 * a2;
    while (v3 != v7)
    {
      v3 -= 288;
      std::allocator<MTLArgumentData>::destroy[abi:ne180100]((uint64_t)(a1 + 2), v3);
    }
    a1[1] = v7;
  }
}

uint64_t SerializedLibraryInfo::serializeDynamicLibraryDataHeader(uint64_t a1, _DWORD *a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  a2[14] = *a3;
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v7 = *(void *)(a1 + 8);
    if (!v7) {
      goto LABEL_6;
    }
LABEL_5:
    LODWORD(v7) = v7 + 1;
    goto LABEL_6;
  }
  LODWORD(v7) = *(unsigned __int8 *)(a1 + 23);
  if (*(unsigned char *)(a1 + 23)) {
    goto LABEL_5;
  }
  LODWORD(v7) = 0;
LABEL_6:
  uint64_t v8 = v6 + v7;
  *a3 = v8;
  a2[15] = v7;
  a2[16] = v8;
  unsigned int v9 = SerializedLibraryInfo::serializeStringArraySize(a1, (long long **)(a1 + 24));
  uint64_t v10 = *a3 + v9;
  *a3 = v10;
  a2[17] = v9;
  a2[18] = v10;
  unsigned int v11 = SerializedLibraryInfo::serializeStringArraySize(a1, (long long **)(a1 + 48));
  uint64_t v12 = *a3 + v11;
  *a3 = v12;
  a2[19] = v11;
  a2[20] = v12;
  unsigned int v13 = SerializedLibraryInfo::serializeStringArraySize(a1, (long long **)(a1 + 72));
  uint64_t v14 = *a3 + v13;
  *a3 = v14;
  a2[21] = v13;
  a2[22] = v14;
  uint64_t result = SerializedLibraryInfo::serializeStringArraySize(a1, (long long **)(a1 + 96));
  a2[23] = result;
  *a3 += result;
  return result;
}

uint64_t ___ZN17MTLCompilerObject21serializeLibraryReplyEPmPcbPPN4llvm6ModuleEmmP21SerializedLibraryInfobjP21FrameworkPassesOutput_block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  **(_DWORD **)(v2 + 24) = a2;
  *(void *)(v2 + 24) += 4;
  return result;
}

void *___ZN17MTLCompilerObject21serializeLibraryReplyEPmPcbPPN4llvm6ModuleEmmP21SerializedLibraryInfobjP21FrameworkPassesOutput_block_invoke_4(uint64_t a1, const void **a2)
{
  uint64_t v2 = (char *)*a2;
  size_t v3 = (size_t)a2[1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t result = memcpy(*(void **)(v4 + 24), *a2, v3);
  uint64_t v6 = (unsigned char *)(*(void *)(v4 + 24) + v3);
  *(void *)(v4 + 24) = v6;
  if (!v3 || v2[v3 - 1])
  {
    *uint64_t v6 = 0;
    ++*(void *)(v4 + 24);
  }
  return result;
}

void SerializedLibraryInfo::serializeDynamicLibraryData(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  if (a2[15])
  {
    uint64_t v6 = (char *)(a3 + a2[14]);
    uint64_t v7 = (const char *)a1;
    if (*(char *)(a1 + 23) < 0) {
      uint64_t v7 = *(const char **)a1;
    }
    strcpy(v6, v7);
  }
  SerializedLibraryInfo::serializeStringArray(a1, (long long **)(a1 + 24), (_DWORD *)(a3 + a2[16]));
  SerializedLibraryInfo::serializeStringArray(a1, (long long **)(a1 + 48), (_DWORD *)(a3 + a2[18]));
  SerializedLibraryInfo::serializeStringArray(a1, (long long **)(a1 + 72), (_DWORD *)(a3 + a2[20]));
  uint64_t v8 = (_DWORD *)(a3 + a2[22]);
  SerializedLibraryInfo::serializeStringArray(a1, (long long **)(a1 + 96), v8);
}

uint64_t countArgumentBufferResources(uint64_t result, void *a2)
{
  uint64_t v2 = a2[1];
  if (*a2 != v2)
  {
    size_t v3 = (int32x2_t *)result;
    int v4 = *(unsigned __int8 *)(result + 12);
    int32x2_t v5 = *(int32x2_t *)result;
    __int32 v6 = *(_DWORD *)(result + 8);
    uint64_t v7 = *a2 + 104;
    do
    {
      memset(v15, 0, 13);
      if (*(void *)(v7 - 8))
      {
        uint64_t result = countArgumentBufferResources(v15, v7);
        int32x2_t v8 = (int32x2_t)v15[0];
        LODWORD(v9) = v15[1];
        int v10 = BYTE4(v15[1]);
      }
      else
      {
        unsigned int v9 = *(unsigned int **)(v7 - 48);
        if (!v9)
        {
          int v10 = 0;
LABEL_16:
          int32x2_t v8 = 0;
          goto LABEL_17;
        }
        unsigned int v11 = *v9;
        if ((*v9 & 0x1000) != 0)
        {
          int v4 = 1;
          v3[1].i8[4] = 1;
          unsigned int v11 = *v9;
        }
        int v12 = (v11 >> 4) & 0x1F;
        if ((v12 - 1) < 2)
        {
          int v10 = 0;
          LODWORD(v9) = 0;
          int32x2_t v8 = (int32x2_t)1;
        }
        else if (v12 == 5)
        {
          int v10 = 0;
          int32x2_t v8 = 0;
          LODWORD(v9) = 1;
        }
        else
        {
          if (v12 != 4)
          {
            int v10 = 0;
            LODWORD(v9) = 0;
            goto LABEL_16;
          }
          int v10 = 0;
          LODWORD(v9) = 0;
          int32x2_t v8 = (int32x2_t)0x100000000;
        }
      }
LABEL_17:
      unsigned int v13 = *(_DWORD *)(v7 - 64);
      if (v13 <= 1) {
        unsigned int v13 = 1;
      }
      int32x2_t v5 = vmla_s32(v5, v8, vdup_n_s32(v13));
      int32x2_t *v3 = v5;
      v6 += v9 * v13;
      v3[1].i32[0] = v6;
      v4 |= v10;
      v3[1].i8[4] = v4;
      uint64_t v14 = v7 + 72;
      v7 += 176;
    }
    while (v14 != v2);
  }
  return result;
}

uint64_t MTLSimCompiler::validSimulatorMetadata(MTLSimCompiler *this, llvm::Module *a2)
{
  uint64_t v4 = 0;
  uint64_t v54 = *MEMORY[0x263EF8340];
  while (1)
  {
    int32x2_t v5 = entryPointsMetadata[v4];
    __int16 v53 = 257;
    if (*v5)
    {
      v52[0] = v5;
      char v6 = 3;
    }
    else
    {
      char v6 = 1;
    }
    LOBYTE(v53) = v6;
    NamedMetadata = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(a2, (const llvm::Twine *)v52);
    int32x2_t v8 = NamedMetadata;
    if (NamedMetadata)
    {
      if ((int)llvm::NamedMDNode::getNumOperands(NamedMetadata) > 0) {
        break;
      }
    }
    if (++v4 == 7) {
      goto LABEL_8;
    }
  }
  uint64_t Operand = llvm::NamedMDNode::getOperand(v8);
  if (!Operand)
  {
LABEL_8:
    MTLCompilerErrorObject::setErrorMessage((MTLSimCompiler *)((char *)this + 8), "invalid function metadata");
    return 0;
  }
  int v34 = entryPointsType[v4];
  unsigned int v11 = (void *)(Operand - 8 * *(unsigned int *)(Operand + 8));
  uint64_t v12 = *(void *)(*v11 + 128);
  uint64_t v13 = v11[2];
  uint64_t v14 = *(unsigned int *)(v13 + 8);
  if (*(_WORD *)(v12 + 18)) {
    llvm::Function::BuildLazyArguments((llvm::Function *)v12);
  }
  if ((v34 - 1) > 2) {
    abort();
  }
  if ((int)v14 >= 1)
  {
    unsigned int v32 = 0;
    unsigned int v33 = 0;
    unsigned int v35 = 0;
    unsigned int v15 = 0;
    unsigned int v36 = 0;
    unsigned int v16 = 0;
    uint64_t v17 = *(void *)(v12 + 88);
    uint64_t v18 = (char **)((char *)this + 8);
    uint64_t v19 = v13;
    while (2)
    {
      uint64_t v20 = *(void *)(v19 - 8 * *(unsigned int *)(v13 + 8));
      DataLayout = (const llvm::DataLayout *)llvm::Module::getDataLayout(a2);
      llvm::DataLayout::DataLayout((llvm::DataLayout *)v52, DataLayout);
      MTLArgumentData::MTLArgumentData((MTLArgumentData *)&v41);
      v39[0] = 0;
      v39[1] = 0;
      int v40 = 0;
      parseArgumentMetadata((uint64_t)&v41, v20, v17, 0, (uint64_t)v52, 0, (uint64_t *)v39, 7);
      switch((v41 >> 4) & 0x1F)
      {
        case 1u:
          ++v35;
          goto LABEL_18;
        case 2u:
LABEL_18:
          if (v42 >= 0x1F)
          {
            MTLCompilerErrorObject::setFormattedErrorMessage(v18, "buffer binding has argument index %u that is greater than %u", v42, 30);
            goto LABEL_55;
          }
          ++v16;
          goto LABEL_52;
        case 4u:
          if (v42 <= 0x1E) {
            goto LABEL_52;
          }
          MTLCompilerErrorObject::setFormattedErrorMessage(v18, "texture binding has argument index %u that is greater than %u");
          goto LABEL_55;
        case 5u:
          if (v42 < 0x10) {
            goto LABEL_52;
          }
          MTLCompilerErrorObject::setFormattedErrorMessage(v18, "sampler binding has argument index %u that is greater than %u");
          goto LABEL_55;
        case 7u:
          if (v34 != 2) {
            goto LABEL_52;
          }
          if ((v41 & 0x8000) != 0)
          {
            if ((v41 & 8) != 0)
            {
              if (__src)
              {
                std::string::basic_string[abi:ne180100](&__p, __src, __len);
                if (v38 >= 0) {
                  p_p = (const char *)&__p;
                }
                else {
                  p_p = (const char *)__p;
                }
              }
              else
              {
                long long __p = 0uLL;
                p_p = (const char *)&__p;
                uint64_t v38 = 0;
              }
              size_t v29 = strlen(p_p);
              int v30 = dataTypeFromString(p_p, v29);
              if (SHIBYTE(v38) < 0) {
                operator delete((void *)__p);
              }
              ++v32;
              v33 += MTLDataTypeGetComponentCount(v30);
            }
          }
          else
          {
            String = (void *)llvm::MDString::getString(*(llvm::MDString **)(v46 - 8 * *(unsigned int *)(v46 + 8) + 8));
            if (v23 == 24)
            {
              BOOL v26 = memcmp(String, "air.viewport_array_index", 0x18uLL) == 0;
            }
            else
            {
              if (v23 != 29) {
                goto LABEL_52;
              }
              BOOL v26 = *String == 0x646E65722E726961
                 && String[1] == 0x65677261745F7265
                 && String[2] == 0x5F79617272615F74
                 && *(void *)((char *)String + 21) == 0x7865646E695F7961;
            }
            if (v26) {
              unsigned int v28 = v33 + 1;
            }
            else {
              unsigned int v28 = v33;
            }
            unsigned int v33 = v28;
          }
LABEL_52:
          if (v45
            && (*(void *)((char *)&__p + 5) = 0,
                *(void *)&long long __p = 0,
                countArgumentBufferResources((uint64_t)&__p, v50),
                v16 += __p,
                v36 += DWORD1(__p),
                v15 += DWORD2(__p),
                BYTE12(__p)))
          {
            MTLCompilerErrorObject::setFormattedErrorMessage(v18, "pointers to an argument buffer inside another argument buffer are not supportted in the simulator");
LABEL_55:
            char v31 = 0;
          }
          else
          {
            v17 += 40;
            char v31 = 1;
          }
          llvm::DenseMap<llvm::Metadata *,std::vector<MTLStructMemberInfo> *,llvm::DenseMapInfo<llvm::Metadata *,void>,llvm::detail::DenseMapPair<llvm::Metadata *,std::vector<MTLStructMemberInfo> *>>::~DenseMap((uint64_t)v39);
          v39[0] = (void **)&v51;
          std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100](v39);
          if (v49) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v49);
          }
          if (v48) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v48);
          }
          if (v47) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v47);
          }
          MEMORY[0x25A28CD60](v52);
          if ((v31 & 1) == 0) {
            return 0;
          }
          v19 += 8;
          if (--v14) {
            continue;
          }
          if (v16 >= 0x20)
          {
            MTLCompilerErrorObject::setFormattedErrorMessage(v18, "only %u buffers are supported in the simulator but %u were used", 31, v16);
            return 0;
          }
          if (v15 >= 0x11)
          {
            MTLCompilerErrorObject::setFormattedErrorMessage(v18, "only %u sampelrs are supported in the simulator but %u were used", 16, v15);
            return 0;
          }
          if (v36 >= 0x20)
          {
            MTLCompilerErrorObject::setFormattedErrorMessage(v18, "only %u textures are supported in the simulator but %u were used", 31, 31);
            return 0;
          }
          if (v35 >= 0xF)
          {
            MTLCompilerErrorObject::setFormattedErrorMessage(v18, "only %u constant buffers binding are supported in the simulator but %u were used", 14, v35);
            return 0;
          }
          if (v32 >= 0x3C)
          {
            MTLCompilerErrorObject::setFormattedErrorMessage(v18, "fragment shader has %u interpolated inputs but only %u are supported in the simulator", v32, 59);
            return 0;
          }
          if (v33 < 0x3D) {
            return 1;
          }
          MTLCompilerErrorObject::setFormattedErrorMessage(v18, "fragment shader has %u interpolated component inputs but only %u are supported", v33, 60);
          break;
        default:
          goto LABEL_52;
      }
      return 0;
    }
  }
  return 1;
}

void sub_255784DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
}

uint64_t MTLSimCompiler::buildRequestWithOptions(MTLSimCompiler *this, const void *a2, unint64_t a3, unsigned int a4, llvm::Module *a5, const void **a6, unint64_t *a7, const void **a8, unint64_t *a9, const void **a10, unint64_t *a11, const char **a12)
{
  *(void *)this = 0;
  uint64_t v17 = (const char **)((char *)this + 8);
  v33[0] = *(llvm::LLVMContext **)a5;
  v33[2] = (llvm::LLVMContext *)llvm::LLVMContext::getDiagnosticContext(v33[0]);
  v33[1] = (llvm::LLVMContext *)llvm::LLVMContext::getDiagnosticHandlerCallBack(v33[0]);
  llvm::LLVMContext::setDiagnosticHandlerCallBack();
  if (MTLDowngradeAIRModule() && MTLSimCompiler::validSimulatorMetadata(this, a5))
  {
    uint64_t v18 = 0;
    while (1)
    {
      uint64_t v19 = entryPointsMetadata[v18];
      __int16 v32 = 257;
      if (*v19)
      {
        __p[0] = v19;
        char v20 = 3;
      }
      else
      {
        char v20 = 1;
      }
      LOBYTE(v32) = v20;
      NamedMetadata = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(a5, (const llvm::Twine *)__p);
      if (NamedMetadata) {
        break;
      }
      if (++v18 == 7) {
        goto LABEL_13;
      }
    }
    uint64_t Operand = llvm::NamedMDNode::getOperand(NamedMetadata);
    Name = (void *)llvm::Value::getName(*(llvm::Value **)(*(void *)(Operand - 8 * *(unsigned int *)(Operand + 8))
                                                        + 128));
    if (Name)
    {
      std::string::basic_string[abi:ne180100](__p, Name, v26);
      goto LABEL_14;
    }
LABEL_13:
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v31 = 0;
LABEL_14:
    *(void *)this = serializeModuleToBufferAsMetallib();
    if (SHIBYTE(v31) < 0) {
      operator delete(__p[0]);
    }
    *a6 = (const void *)LLVMGetBufferStart();
    uint64_t v28 = LLVMGetBufferSize();
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    *a7 = v28;
    *a8 = 0;
    *a9 = 0;
    *a10 = 0;
    *a11 = 0;
  }
  else
  {
    uint64_t v22 = MEMORY[0x25A28D8E0](a5);
    MEMORY[0x25A28E250](v22, 0x10B2C407FF26C1CLL);
    uint64_t v23 = *v17;
    uint64_t v24 = 1;
  }
  *a12 = v23;
  ScopedDiagnosticHandler::~ScopedDiagnosticHandler((ScopedDiagnosticHandler *)v33);
  return v24;
}

void sub_255785054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, char a19)
{
}

uint64_t serializeModuleToBufferAsMetallib()
{
  LLVMGetTarget();
  MTLMetalLibCreateExecutableWithTriple();
  LLVMExtraMakeSharedModule();
  MTLMetalFunctionCreate();
  MTLMetalLibInsertFunction();
  uint64_t v0 = MTLWriteMetalLibToMemoryBuffer();
  LLVMExtraDisposeSharedModule();
  return v0;
}

void MTLSimCompilerCreate()
{
}

uint64_t MTLSimCompilerSetGPUCompiler(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  return result;
}

uint64_t MTLSimCompilerBuildRequestWithOptions(MTLSimCompiler *a1, const void *a2, unint64_t a3, unsigned int a4, llvm::Module *a5, const void **a6, unint64_t *a7, const void **a8, unint64_t *a9, const void **a10, unint64_t *a11, const char **a12)
{
  return MTLSimCompiler::buildRequestWithOptions(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

void MTLSimCompiler::deleteCompilerReply(void **this)
{
  if (*this)
  {
    LLVMDisposeMemoryBuffer();
    *this = 0;
  }
  free(this[1]);
  this[1] = 0;
}

uint64_t MTLSimCompilerDelete(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    free(*(void **)(result + 8));
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = 0;
    JUMPOUT(0x25A28E250);
  }
  return result;
}

uint64_t MTLCompilerObject::createLoaderScript(uint64_t a1, char *__s, uint64_t a3)
{
  strlen(__s);
  uint64_t v5 = LLVMCreateMemoryBufferWithMemoryRange();
  if (MTLCreateScript())
  {
    MTLGPUCompilerSetLoaderScript();
  }
  else
  {
    MTLCompilerErrorObject::setFormattedErrorMessage((char **)(a1 + 120), "error while parsing script: %s", 0);
    free(0);
    (*(void (**)(uint64_t, void, void, void))(a3 + 16))(a3, 2 * (*(void *)(a1 + 120) != 0), 0, 0);
    return 0;
  }
  return v5;
}

void MTLCompilerObject::downgradeAndLoadModuleRequest(MTLCompilerObject *a1, uint64_t a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  v35[0] = 0;
  long long v36 = 0u;
  uint64_t v32 = 0;
  *(_OWORD *)int v34 = 0u;
  *(_OWORD *)uint64_t v31 = 0u;
  uint64_t v33 = -1;
  v35[1] = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v42 = 0;
  uint64_t v4 = *(_DWORD **)(a2 + 32);
  int v5 = v4[55];
  if (v5 == 10 || v5 == 1) {
    int v6 = *v4 >> 31;
  }
  else {
    int v6 = 0;
  }
  MEMORY[0x25A28CF80](v30);
  v29[0] = v30;
  v29[2] = llvm::LLVMContext::getDiagnosticContext((llvm::LLVMContext *)v30);
  v29[1] = llvm::LLVMContext::getDiagnosticHandlerCallBack((llvm::LLVMContext *)v30);
  uint64_t v7 = llvm::LLVMContext::setDiagnosticHandlerCallBack();
  unsigned __int16 v49 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  memset(v52, 0, sizeof(v52));
  long long v53 = 0u;
  memset(v54, 0, sizeof(v54));
  MTLCompilerObject::getReadParametersFromRequest(v7, (uint64_t)&v49, *(void *)a2, *(void *)(a2 + 8), (unsigned int *)(*(void *)(a2 + 32) + 88), *(void *)(a2 + 32));
  int32x2_t v8 = MTLCompilerObject::readModuleFromBinaryRequest((uint64_t)a1, &v49, (llvm::LLVMContext *)v30, (MTLFunctionType *)(a2 + 40), (void **)&v40, (unint64_t *)&v40 + 1, v5 == 1);
  *(void *)(a2 + 4_Block_object_dispose(&STACK[0x250], 8) = v8;
  unsigned int v9 = (llvm::Module **)(a2 + 48);
  if (!v8)
  {
    (*(void (**)(void, void, void, void))(*(void *)(a2 + 24) + 16))(*(void *)(a2 + 24), 2 * (*((void *)a1 + 15) != 0), 0, 0);
LABEL_29:
    free((void *)v40);
    goto LABEL_30;
  }
  if (!v6)
  {
    uint64_t v12 = *(void *)(a2 + 32);
    if ((*(unsigned char *)(v12 + 3) & 4) != 0)
    {
      *(void *)(a2 + 4_Block_object_dispose(&STACK[0x250], 8) = MTLCompilerObject::invokeFunctionLoader((uint64_t)a1, (unsigned int *)v12, *(void *)(a2 + 8), (llvm::LLVMContext *)v30, v8, v40, *((uint64_t *)&v40 + 1), *(void *)(a2 + 24));
      **(_DWORD **)(a2 + 32) &= ~0x4000000u;
    }
    free((void *)v40);
    *(void *)&long long v40 = 0;
    uint64_t v13 = *(void *)(a2 + 32);
    if ((*(unsigned char *)(v13 + 3) & 2) != 0)
    {
      if (!*v9) {
        goto LABEL_30;
      }
      *(void *)(a2 + 4_Block_object_dispose(&STACK[0x250], 8) = MTLCompilerObject::invokeLowerModule((int)a1, v13, (int)v30, *v9, *(MTLFunctionType *)(a2 + 40), *(void *)(a2 + 24));
      **(_DWORD **)(a2 + 32) &= ~0x2000000u;
    }
    if (*v9)
    {
      uint64_t v11 = *(void *)(a2 + 32);
      goto LABEL_18;
    }
LABEL_30:
    int v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_31;
  }
  char v10 = MTLCompilerObject::runFrameworkPasses(a1, (uint64_t *)a2, v31, (llvm::LLVMContext *)v30, (uint64_t)&v45);
  uint64_t v11 = *(void *)(a2 + 32);
  if ((v10 & 1) == 0 && (*(unsigned char *)(v11 + 4) & 2) == 0) {
    goto LABEL_29;
  }
LABEL_18:
  if (*(_DWORD *)(v11 + 12) != 12)
  {
    (*(void (**)(void, void, void, void, const char *))(*(void *)(a2 + 24) + 16))(*(void *)(a2 + 24), 2 * (*((void *)a1 + 15) != 0), 0, 0, "Invalid air downgrade request data size");
    goto LABEL_29;
  }
  uint64_t v14 = *(void *)a2 + *(unsigned int *)(v11 + 8);
  if (*(unsigned char *)(v14 + 8))
  {
    {
      dword_269EF85C4 = 0;
      MTLCompilerObject::downgradeAndLoadModuleRequest(BinaryRequestData &)::stats = 0u;
      unk_269EF85B4 = 0u;
      unk_269EF85DC = 0u;
      unk_269EF85EC = 0u;
      unk_269EF85FC = 0u;
    }
    {
      MTLCompilerObject::downgradeAndLoadModuleRequest(BinaryRequestData &)::symbol_serialized_data = (uint64_t)&unk_269EF8628;
      qword_269EF8620 = 0x400000000;
      qword_269EF8688 = (uint64_t)&unk_269EF8698;
      qword_269EF8690 = 0x1000000000;
      qword_269EF8798 = (uint64_t)&unk_269EF87A8;
      qword_269EF87A0 = 0x1000000000;
      qword_269EF8868 = (uint64_t)&qword_269EF8878;
      qword_269EF8870 = 0;
      qword_269EF8878 = (uint64_t)&unk_269EF8890;
      qword_269EF8888 = 0;
      qword_269EF8880 = 0;
      __cxa_atexit((void (*)(void *))MTLBoundsCheck::SerializedData::~SerializedData, &MTLCompilerObject::downgradeAndLoadModuleRequest(BinaryRequestData &)::symbol_serialized_data, &dword_2556FA000);
    }
    qword_269EF859C = qword_269EF859C & 0xFFFFFFFFFFFFFFEFLL | (8 * *(unsigned __int8 *)(v14 + 8)) & 0x10 | 0xC0000;
    if (!*(void *)a1) {
      operator new();
    }
    llvm::legacy::PassManager::run(*(llvm::legacy::PassManager **)a1, *v9);
  }
  if (!MTLDowngradeAIRModule())
  {
    (*(void (**)(void, void, void, void))(*(void *)(a2 + 24) + 16))(*(void *)(a2 + 24), 2 * (*((void *)a1 + 15) != 0), 0, 0);
    goto LABEL_30;
  }
  uint64_t v15 = *(void *)(a2 + 32);
  if ((*(unsigned char *)(v15 + 5) & 2) != 0)
  {
    if (((v46 - v45) & 0xFFFFFFFF0) != 0) {
      unsigned int v16 = 12 * ((unint64_t)(v46 - v45) >> 4) + 4;
    }
    else {
      unsigned int v16 = 0;
    }
  }
  else
  {
    unsigned int v16 = 0;
  }
  int v24 = (*(_DWORD *)v15 >> 30) & 1;
  uint64_t v25 = (uint64_t *)v31;
  if (!v6) {
    uint64_t v25 = 0;
  }
  int v17 = 1;
  uint64_t v18 = (void *)MTLCompilerObject::serializeLibraryReply((uint64_t)a1, &v48, 0, 1, (llvm::Module **)(a2 + 48), 1uLL, v16, 0, v24, *(_DWORD *)(v14 + 4), v25);
LABEL_31:
  ScopedDiagnosticHandler::~ScopedDiagnosticHandler((ScopedDiagnosticHandler *)v29);
  llvm::LLVMContext::~LLVMContext((llvm::LLVMContext *)v30);
  if (v17)
  {
    if (v18)
    {
      long long __p = 0;
      unint64_t v27 = 0;
      uint64_t v28 = 0;
      std::vector<CompileTimeData>::__init_with_size[abi:ne180100]<CompileTimeData*,CompileTimeData*>(&__p, v45, (uint64_t)v46, (v46 - v45) >> 4);
      serializeCompileTimeDataInReply((uint64_t)v18, (uint64_t)&__p);
      if (__p)
      {
        unint64_t v27 = __p;
        operator delete(__p);
      }
      (*(void (**)(void))(*(void *)(a2 + 24) + 16))();
      free(v18);
    }
    else
    {
      (*(void (**)(void, void, void, void))(*(void *)(a2 + 24) + 16))(*(void *)(a2 + 24), 2 * (*((void *)a1 + 15) != 0), 0, 0);
    }
    if ((void)v40)
    {
      free((void *)v40);
      long long v40 = 0uLL;
    }
  }
  for (uint64_t i = 22; i != 19; --i)
    std::unique_ptr<void,LLVMMemoryBufferDeleter>::reset[abi:ne180100]((uint64_t *)&v31[i], 0);
  char v20 = (void *)v41;
  *(void *)&long long v41 = 0;
  if (v20) {
    free(v20);
  }
  unint64_t v21 = v35[1];
  v35[1] = 0;
  if (v21) {
    free(v21);
  }
  uint64_t v22 = v34[0];
  v34[0] = 0;
  if (v22) {
    free(v22);
  }
  uint64_t v23 = v31[0];
  v31[0] = 0;
  if (v23) {
    free(v23);
  }
  if (v45)
  {
    uint64_t v46 = v45;
    operator delete(v45);
  }
}

void sub_25578593C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, int a19, __int16 a20,char a21,char a22)
{
  MEMORY[0x25A28E250](v22, 0xA1C40BD48D6D6);
  ScopedDiagnosticHandler::~ScopedDiagnosticHandler((ScopedDiagnosticHandler *)&a15);
  llvm::LLVMContext::~LLVMContext((llvm::LLVMContext *)&a18);
  FrameworkPassesOutput::~FrameworkPassesOutput((FrameworkPassesOutput *)&a20);
  uint64_t v25 = *(void **)(v23 - 240);
  if (v25)
  {
    *(void *)(v23 - 232) = v25;
    operator delete(v25);
  }
  _Unwind_Resume(a1);
}

uint64_t fatalDiagnosticHandler(uint64_t result)
{
  if (!*(unsigned char *)(result + 12))
  {
    memset(v1, 0, sizeof(v1));
    printDiagnosticError(result, (uint64_t)v1);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      fatalDiagnosticHandler(v1);
    }
    abort();
  }
  return result;
}

void sub_255785A34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void MTLBoundsCheck::SerializedData::~SerializedData(MTLBoundsCheck::SerializedData *this)
{
  uint64_t v2 = (char *)this + 608;
  size_t v3 = (char *)*((void *)this + 76);
  if (v3 != (char *)this + 632) {
    free(v3);
  }
  uint64_t v4 = (char *)*((void *)this + 74);
  if (v4 != v2) {
    free(v4);
  }
  int v5 = (char *)*((void *)this + 48);
  if (v5 != (char *)this + 400) {
    free(v5);
  }
  int v6 = (char *)*((void *)this + 14);
  if (v6 != (char *)this + 128) {
    free(v6);
  }
  llvm::SmallVector<std::string,4u>::~SmallVector((char **)this);
}

void FrameworkPassesOutput::~FrameworkPassesOutput(FrameworkPassesOutput *this)
{
  for (uint64_t i = 176; i != 152; i -= 8)
    std::unique_ptr<void,LLVMMemoryBufferDeleter>::reset[abi:ne180100]((uint64_t *)((char *)this + i), 0);
  size_t v3 = (void *)*((void *)this + 18);
  *((void *)this + 1_Block_object_dispose(&STACK[0x250], 8) = 0;
  if (v3) {
    free(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v4) {
    free(v4);
  }
  int v5 = (void *)*((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v5) {
    free(v5);
  }
  int v6 = *(void **)this;
  *(void *)this = 0;
  if (v6) {
    free(v6);
  }
}

void MTLCompilerObject::stitchFunctionDag(uint64_t a1, llvm::LLVMContext *this, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  v116[0] = this;
  v116[2] = llvm::LLVMContext::getDiagnosticContext(this);
  v116[1] = llvm::LLVMContext::getDiagnosticHandlerCallBack(this);
  uint64_t v96 = a1;
  llvm::LLVMContext::setDiagnosticHandlerCallBack();
  uint64_t v113 = a4;
  unint64_t v114 = a5;
  unint64_t v115 = 0;
  if (a5 <= 3) {
    abort();
  }
  unint64_t v115 = 4;
  char v10 = DeserialContext::deserializeCStringNoCopy((DeserialContext *)&v113, 0);
  unsigned __int16 v117 = 0;
  long long v118 = 0u;
  long long v119 = 0u;
  memset(v120, 0, 26);
  long long v121 = 0u;
  memset(v122, 0, sizeof(v122));
  unint64_t v11 = v115;
  if (v114 <= v115 || v114 - v115 < 4) {
    goto LABEL_172;
  }
  int v12 = *(_DWORD *)(v113 + v115);
  unint64_t v13 = v115 + 4;
  v115 += 4;
  if (v12 == 1634300534)
  {
    if (v114 > v13 && v114 - v13 >= 4)
    {
      int v14 = *(_DWORD *)(v113 + v13);
      unint64_t v115 = v11 + 8;
      LODWORD(v120[0]) = v14;
      if (v114 > v11 + 8 && v114 - (v11 + 8) >= 4)
      {
        int v15 = *(_DWORD *)(v113 + v11 + 8);
        unint64_t v115 = v11 + 12;
        HIDWORD(v120[0]) = v15;
        if (v114 > v11 + 12 && v114 - (v11 + 12) > 3)
        {
          unint64_t v13 = v11 + 16;
          unint64_t v115 = v11 + 16;
          goto LABEL_12;
        }
      }
    }
LABEL_172:
    abort();
  }
LABEL_12:
  __s = (char *)v10;
  if (v114 <= v13 || v114 - v13 <= 3) {
    abort();
  }
  unint64_t v16 = *(unsigned int *)(v113 + v13);
  unint64_t v115 = v13 + 4;
  long long v110 = 0;
  long long v111 = 0;
  uint64_t v112 = 0;
  std::vector<llvm::Metadata *>::reserve(&v110, v16);
  long long v107 = 0;
  long long v108 = 0;
  long long v109 = 0;
  v104 = 0;
  uint64_t v105 = 0;
  v106 = 0;
  std::vector<llvm::Metadata *>::reserve(&v107, v16);
  if (!v16)
  {
LABEL_83:
    unint64_t v58 = v115;
    if (v114 <= v115 || v114 - v115 < 4) {
LABEL_174:
    }
      abort();
    int v60 = *(_DWORD *)(v113 + v115);
    unint64_t v61 = v115 + 4;
    v115 += 4;
    if (v60 == 1853189491)
    {
      if (v114 <= v61 || v114 - v61 <= 3) {
        goto LABEL_174;
      }
      unsigned int v62 = *(_DWORD *)(v113 + v61);
      unint64_t v115 = v58 + 8;
    }
    else
    {
      unsigned int v62 = 0;
    }
    long long v101 = 0u;
    long long v102 = 0u;
    int v103 = 1065353216;
    std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::__rehash<true>((uint64_t)&v101, (unint64_t)(float)v62);
    for (; v62; --v62)
    {
      unint64_t v63 = v115;
      if (v114 <= v115 || v114 - v115 <= 3) {
        abort();
      }
      int v65 = *(_DWORD *)(v113 + v115);
      unint64_t v66 = v115 + 4;
      v115 += 4;
      if (v65 == 1634952050)
      {
        if (v114 <= v66 || v114 - v66 <= 3) {
          abort();
        }
        uint64_t v68 = *(unsigned int *)(v113 + v66);
        unint64_t v69 = v63 + 8;
        unint64_t v115 = v69;
        if (v69 >= v114 || (unint64_t v115 = v69 + v68, v69 + v68 > v114)) {
          abort();
        }
        uint64_t v70 = (int *)(v113 + v69 + *(unsigned int *)(v113 + v69));
        v71 = (unsigned __int16 *)((char *)v70 - *v70);
        if (*v71 >= 9u && (uint64_t v72 = v71[4]) != 0) {
          uint64_t v73 = (int *)((char *)v70 + v72 + *(unsigned int *)((char *)v70 + v72));
        }
        else {
          uint64_t v73 = 0;
        }
        uint64_t v74 = (unsigned __int16 *)((char *)v73 - *v73);
        if (*v74 >= 7u && (uint64_t v75 = v74[3]) != 0) {
          v76 = (int *)((char *)v73 + v75 + *(unsigned int *)((char *)v73 + v75));
        }
        else {
          v76 = 0;
        }
        uint64_t v77 = (unsigned int *)((char *)v76 + *(unsigned __int16 *)((char *)v76 - *v76 + 4));
        std::string::basic_string[abi:ne180100](__p, (char *)v77 + *v77 + 4, *(unsigned int *)((char *)v77 + *v77));
        __src = 0;
        __src = (char *)LLVMCreateMemoryBufferWithMemoryRange();
        std::__hash_table<std::__hash_value_type<std::string,LLVMOpaqueMemoryBuffer *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,LLVMOpaqueMemoryBuffer *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,LLVMOpaqueMemoryBuffer *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,LLVMOpaqueMemoryBuffer *>>>::__emplace_unique_key_args<std::string,std::string,LLVMOpaqueMemoryBuffer *&>((uint64_t)&v101, (unsigned __int8 *)__p, (uint64_t)__p, (uint64_t *)&__src);
        if (v100 < 0) {
          operator delete(__p[0]);
        }
      }
    }
    unint64_t v78 = v115;
    if (v114 > v115 && v114 - v115 >= 4)
    {
      int v79 = *(_DWORD *)(v113 + v115);
      unint64_t v80 = v115 + 4;
      v115 += 4;
      if (v79 != 1886676589)
      {
LABEL_125:
        if (v114 > v80 && v114 - v80 >= 4)
        {
          int v82 = *(_DWORD *)(v113 + v80);
          unint64_t v83 = v80 + 4;
          unint64_t v115 = v80 + 4;
          if (v82 != 1634888036) {
            goto LABEL_134;
          }
          if (v114 <= v83 || v114 - v83 < 4) {
            goto LABEL_173;
          }
          uint64_t v84 = *(unsigned int *)(v113 + v83);
          unint64_t v85 = v80 + 8;
          unint64_t v115 = v85;
          if (!v84)
          {
LABEL_134:
            uint64_t v86 = 0;
            goto LABEL_135;
          }
          if (v85 < v114)
          {
            unint64_t v115 = v85 + v84;
            if (v85 + v84 <= v114)
            {
              uint64_t v86 = v113 + v85;
LABEL_135:
              __src = 0;
              __p[0] = 0;
              strlen(__s);
              LLVMCreateMemoryBufferWithMemoryRange();
              if (MTLCreateScript())
              {
                free(__src);
                __src = 0;
                MTLGPUCompilerSetStitcherScript();
                BOOL v87 = MTLGPUCompilerStitchFunctionsToBuffer() != 0;
              }
              else
              {
                MTLCompilerErrorObject::setFormattedErrorMessage((char **)(a1 + 120), "error while parsing script: %s", __src);
                free(__src);
                BOOL v87 = 0;
                __src = 0;
              }
              LLVMDisposeMemoryBuffer();
              if (v86) {
                BOOL v89 = v87;
              }
              else {
                BOOL v89 = 0;
              }
              if (v89)
              {
                uint64_t v97 = 0;
                MTLCompilerObject::insertStitchedFunctionsIntoArchive(a1, v86, v88, (uint64_t)__p[0]);
              }
              uint64_t v90 = (uint64_t *)v107;
              uint64_t v91 = v108;
              while (v90 != v91)
              {
                LLVMDisposeMemoryBuffer();
                ++v90;
              }
              for (uint64_t i = (void *)v102; i; uint64_t i = (void *)*i)
                LLVMDisposeMemoryBuffer();
              if (v87)
              {
                uint64_t v97 = 0;
                uint64_t v93 = MTLCompilerObject::serializeLibraryToArchiveReply(v96, (size_t *)&v97, (const char **)&__src, 1, 1, (uint64_t)__p[0], 0);
                if (__p[0]) {
                  LLVMDisposeMemoryBuffer();
                }
                (*(void (**)(uint64_t, void, char *, char *, void))(a6 + 16))(a6, 0, v93, v97, 0);
                free(v93);
              }
              else
              {
                if (__src)
                {
                  MTLCompilerErrorObject::setFormattedErrorMessage((char **)(v96 + 120), "error: %s", __src);
                  free(__src);
                  __src = 0;
                }
                (*(void (**)(uint64_t, void, void, void))(a6 + 16))(a6, 2 * (*(void *)(v96 + 120) != 0), 0, 0);
              }
              std::__hash_table<std::__hash_value_type<std::string,MTLCompilerDataType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLCompilerDataType>>>::~__hash_table((uint64_t)&v101);
              goto LABEL_157;
            }
          }
        }
LABEL_173:
        abort();
      }
      BOOL v19 = v114 >= v80;
      unint64_t v81 = v114 - v80;
      if (v81 != 0 && v19 && v81 > 3)
      {
        unint64_t v80 = v78 + 8;
        unint64_t v115 = v78 + 8;
        goto LABEL_125;
      }
    }
    abort();
  }
  int v17 = 0;
  while (1)
  {
    for (v120[2] = 0; ; v120[2] = DeserialContext::deserializeCStringNoCopy((DeserialContext *)&v113, 0))
    {
      while (1)
      {
        unint64_t v18 = v115;
        BOOL v19 = v114 > v115 && v114 - v115 >= 4;
        if (!v19) {
          goto LABEL_164;
        }
        int v20 = *(_DWORD *)(v113 + v115);
        unint64_t v21 = v115 + 4;
        v115 += 4;
        if (v20 != 1651007859) {
          break;
        }
        if (v114 <= v21 || (unint64_t v115 = v18 + 36, v18 + 36 > v114)) {
          abort();
        }
        uint64_t v22 = v113 + v21;
        uint64_t v23 = v105;
        if (v105 >= v106)
        {
          uint64_t v25 = (v105 - (unsigned char *)v104) >> 3;
          if ((unint64_t)(v25 + 1) >> 61) {
            std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v26 = (v106 - (unsigned char *)v104) >> 2;
          if (v26 <= v25 + 1) {
            unint64_t v26 = v25 + 1;
          }
          if ((unint64_t)(v106 - (unsigned char *)v104) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v27) {
            uint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)&v106, v27);
          }
          else {
            uint64_t v28 = 0;
          }
          size_t v29 = &v28[8 * v25];
          *(void *)size_t v29 = v22;
          int v24 = v29 + 8;
          uint64_t v31 = (char *)v104;
          int v30 = v105;
          if (v105 != v104)
          {
            do
            {
              uint64_t v32 = *((void *)v30 - 1);
              v30 -= 8;
              *((void *)v29 - 1) = v32;
              v29 -= 8;
            }
            while (v30 != v31);
            int v30 = (char *)v104;
          }
          v104 = v29;
          uint64_t v105 = v24;
          v106 = &v28[8 * v27];
          if (v30) {
            operator delete(v30);
          }
        }
        else
        {
          *(void *)uint64_t v105 = v22;
          int v24 = v23 + 8;
        }
        uint64_t v105 = v24;
      }
      if (v20 != 1953656940) {
        break;
      }
    }
    if (v20 != 1651078243) {
LABEL_164:
    }
      abort();
    if (v114 <= v21 || v114 - v21 <= 3) {
      abort();
    }
    uint64_t v33 = *(unsigned int *)(v113 + v21);
    unint64_t v34 = v18 + 8;
    unint64_t v115 = v34;
    if (v34 >= v114 || (unint64_t v115 = v34 + v33, v34 + v33 > v114)) {
      abort();
    }
    unsigned __int16 v117 = 0;
    *(void *)&long long v118 = v33;
    *((void *)&v118 + 1) = v113 + v34;
    *(void *)&long long v101 = 1;
    unsigned int v35 = MTLCompilerObject::readModuleFromBinaryRequest(a1, &v117, this, (MTLFunctionType *)&v101, 0, 0, 0);
    if (!v35) {
      break;
    }
    uint64_t v36 = LLVMCreateMemoryBufferWithMemoryRange();
    uint64_t v37 = v36;
    long long v38 = v108;
    if (v108 >= v109)
    {
      uint64_t v40 = ((char *)v108 - (unsigned char *)v107) >> 3;
      if ((unint64_t)(v40 + 1) >> 61) {
        std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v41 = ((char *)v109 - (unsigned char *)v107) >> 2;
      if (v41 <= v40 + 1) {
        unint64_t v41 = v40 + 1;
      }
      if ((unint64_t)((char *)v109 - (unsigned char *)v107) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v42 = v41;
      }
      if (v42) {
        uint64_t v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)&v109, v42);
      }
      else {
        uint64_t v43 = 0;
      }
      uint64_t v44 = (uint64_t *)&v43[8 * v40];
      *uint64_t v44 = v37;
      long long v39 = v44 + 1;
      uint64_t v46 = (char *)v107;
      uint64_t v45 = (char *)v108;
      if (v108 != v107)
      {
        do
        {
          uint64_t v47 = *((void *)v45 - 1);
          v45 -= 8;
          *--uint64_t v44 = v47;
        }
        while (v45 != v46);
        uint64_t v45 = (char *)v107;
      }
      long long v107 = v44;
      long long v108 = v39;
      long long v109 = (uint64_t *)&v43[8 * v42];
      if (v45) {
        operator delete(v45);
      }
    }
    else
    {
      *long long v108 = v36;
      long long v39 = v38 + 1;
    }
    long long v108 = v39;
    uint64_t v48 = v111;
    if (v111 >= v112)
    {
      uint64_t v50 = (v111 - (unsigned char *)v110) >> 3;
      if ((unint64_t)(v50 + 1) >> 61) {
        std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v51 = (v112 - (unsigned char *)v110) >> 2;
      if (v51 <= v50 + 1) {
        unint64_t v51 = v50 + 1;
      }
      if ((unint64_t)(v112 - (unsigned char *)v110) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v52 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v52 = v51;
      }
      if (v52) {
        long long v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)&v112, v52);
      }
      else {
        long long v53 = 0;
      }
      uint64_t v54 = (llvm::Module **)&v53[8 * v50];
      *uint64_t v54 = v35;
      unsigned __int16 v49 = (char *)(v54 + 1);
      int v56 = (char *)v110;
      uint64_t v55 = v111;
      if (v111 != v110)
      {
        do
        {
          int v57 = (llvm::Module *)*((void *)v55 - 1);
          v55 -= 8;
          *--uint64_t v54 = v57;
        }
        while (v55 != v56);
        uint64_t v55 = (char *)v110;
      }
      long long v110 = v54;
      long long v111 = v49;
      uint64_t v112 = &v53[8 * v52];
      if (v55) {
        operator delete(v55);
      }
    }
    else
    {
      *(void *)long long v111 = v35;
      unsigned __int16 v49 = v48 + 8;
    }
    long long v111 = v49;
    if (++v17 == v16) {
      goto LABEL_83;
    }
  }
  (*(void (**)(uint64_t, void, void, void))(a6 + 16))(a6, 2 * (*(void *)(a1 + 120) != 0), 0, 0);
LABEL_157:
  if (v104)
  {
    uint64_t v105 = (char *)v104;
    operator delete(v104);
  }
  if (v107)
  {
    long long v108 = (uint64_t *)v107;
    operator delete(v107);
  }
  if (v110)
  {
    long long v111 = (char *)v110;
    operator delete(v110);
  }
  ScopedDiagnosticHandler::~ScopedDiagnosticHandler((ScopedDiagnosticHandler *)v116);
}

void sub_255786670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  if (__p)
  {
    a30 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a32)
  {
    a33 = (uint64_t)a32;
    operator delete(a32);
  }
  if (a35)
  {
    a36 = (uint64_t)a35;
    operator delete(a35);
  }
  ScopedDiagnosticHandler::~ScopedDiagnosticHandler((ScopedDiagnosticHandler *)&a41);
  _Unwind_Resume(a1);
}

void MTLCompilerObject::insertStitchedFunctionsIntoArchive(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a4;
  long long v4 = 0u;
  long long v5 = 0u;
  int v6 = 1065353216;
  MTLCompilerObject::extractFunctionsFromMetallib();
}

void sub_2557868E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__hash_table<std::__hash_value_type<std::string,MTLCompilerDataType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLCompilerDataType>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void MTLCompilerObject::extractFunctionsFromMetallib()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  llvm::MemoryBufferRef::MemoryBufferRef();
  uint64_t v0 = 0;
  operator new();
}

void sub_255786D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,char a33,int a34,char *a35)
{
  llvm::SmallVector<std::string,4u>::~SmallVector(&a35);
  if ((a33 & 1) != 0 && a31) {
    (*(void (**)(uint64_t))(*(void *)a31 + 8))(a31);
  }
  (*(void (**)(uint64_t))(*(void *)v35 + 8))(v35);
  if (a22) {
    (*(void (**)(uint64_t))(*(void *)a22 + 8))(a22);
  }
  _Unwind_Resume(a1);
}

uint64_t MTLCompilerObject::invokeLoaderForSpecializedFunction(uint64_t a1, void **a2, uint64_t a3, unsigned int *a4, unint64_t a5, llvm::LLVMContext *a6, uint64_t a7)
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v19 = 0;
  if (a3)
  {
    MTLMetalLibGetFunctionNo();
    MTLMetalFunctionGetModule();
    uint64_t Name = MTLMetalFunctionGetName();
    MEMORY[0x25A28E090](__p, Name);
    llvm::CloneModule();
    int v14 = v17;
    MTLMetalLibDestroy();
  }
  else
  {
    MEMORY[0x25A28E090](__p, (char *)a4 + a4[22]);
    int v14 = *a2;
  }
  *a4 |= 0xC000000u;
  MTLCompilerObject::invokeFunctionLoader(a1, a4, a5, a6, v14, 0, 0, a7);
  uint64_t v15 = serializeModuleToBufferAsMetallib();
  if (v14 == *a2) {
    *a2 = 0;
  }
  if (SHIBYTE(v19) < 0) {
    operator delete(__p[0]);
  }
  return v15;
}

void sub_255786FC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t llvm::object::MetalLibObjectFile::moduleOfFunction@<X0>(uint64_t this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = this;
  if (*(_WORD *)(this + 70))
  {
    uint64_t v7 = *(void *)(this + 408);
  }
  else
  {
    uint64_t v5 = a2 - *(void *)(this + 280);
    unsigned int v6 = *(_DWORD *)(*(void *)(this + 352) + (v5 >> 1));
    if (v6 == -1)
    {
      this = llvm::object::MetalLibObjectFile::materializeModuleForFunctionNo((llvm::object::MetalLibObjectFile *)this);
      uint64_t v7 = v9;
      if (v9)
      {
        char v8 = *(unsigned char *)(a3 + 8) | 1;
        goto LABEL_6;
      }
      unsigned int v6 = *(_DWORD *)(*(void *)(v3 + 352) + 4 * (v5 >> 3));
    }
    uint64_t v7 = *(void *)(v3 + 400) + 8 * v6;
  }
  char v8 = *(unsigned char *)(a3 + 8) & 0xFE;
LABEL_6:
  *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x250], 8) = v8;
  *(void *)a3 = v7;
  return this;
}

uint64_t MTLCompilerObject::insertFunctionInArchive()
{
  if (MTLGPUArchiverFromId())
  {
    LLVMCreateMemoryBufferWithMemoryRange();
    LLVMCreateMemoryBufferWithMemoryRange();
    long long v1 = 0u;
    long long v2 = 0u;
    int v3 = 1065353216;
    MTLCompilerObject::extractFunctionsFromMetallib();
  }
  return 0;
}

void sub_25578720C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::vector<CompileTimeData>::push_back[abi:ne180100](void **a1, _OWORD *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(_OWORD **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((char *)v7 - (unsigned char *)*a1) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)*a1;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12) {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SmallVertexPartialLoad>>(v4, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    int v14 = &v13[16 * v9];
    uint64_t v15 = &v13[16 * v12];
    *(_OWORD *)int v14 = *a2;
    char v8 = v14 + 16;
    int v17 = (char *)*a1;
    unint64_t v16 = (char *)a1[1];
    if (v16 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v16 - 1);
        v14 -= 16;
        v16 -= 16;
      }
      while (v16 != v17);
      unint64_t v16 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    _OWORD *v7 = *a2;
    char v8 = v7 + 1;
  }
  a1[1] = v8;
}

uint64_t MTLCompilerObject::checkNoStageInAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 - 8 * *(unsigned int *)(a2 + 8) + 16);
  if (v2)
  {
    uint64_t v3 = *(unsigned int *)(v2 + 8);
    if ((int)v3 >= 1)
    {
      uint64_t v5 = 0;
      while (1)
      {
        uint64_t v6 = *(void *)(v2 - 8 * *(unsigned int *)(v2 + 8) + 8 * v5);
        String = (void *)llvm::MDString::getString(*(llvm::MDString **)(v6 - 8 * *(unsigned int *)(v6 + 8) + 8));
        size_t v9 = v8;
        if (v8 <= 15) {
          break;
        }
        if (v8 == 29)
        {
          unint64_t v10 = "air.patch_control_point_input";
LABEL_18:
          if (memcmp(String, v10, v9)) {
            goto LABEL_19;
          }
          goto LABEL_21;
        }
        if (v8 != 16) {
          goto LABEL_19;
        }
        if (*String != 0x747265762E726961 || String[1] != 0x7475706E695F7865) {
          goto LABEL_19;
        }
LABEL_21:
        uint64_t v12 = *(unsigned int *)(v6 + 8);
        if (!v12)
        {
LABEL_31:
          MTLCompilerErrorObject::setErrorMessage((MTLCompilerErrorObject *)(a1 + 120), "Function requires stage_in attributes but no descriptor was set.");
          return 0;
        }
        uint64_t v13 = v6;
        while (1)
        {
          int v14 = *(llvm::MDString **)(v13 - 8 * *(unsigned int *)(v6 + 8));
          if (v14)
          {
            if (!*(unsigned char *)v14)
            {
              uint64_t v15 = (void *)llvm::MDString::getString(v14);
              if (v16 == 14 && *v15 == 0x5F6772612E726961 && *(void *)((char *)v15 + 6) == 0x646573756E755F67) {
                break;
              }
            }
          }
          v13 += 8;
          if (!--v12) {
            goto LABEL_31;
          }
        }
LABEL_19:
        if (++v5 == v3) {
          return 1;
        }
      }
      if (v8 == 12)
      {
        unint64_t v10 = "air.stage_in";
      }
      else
      {
        if (v8 != 15) {
          goto LABEL_19;
        }
        unint64_t v10 = "air.patch_input";
      }
      goto LABEL_18;
    }
  }
  return 1;
}

void MTLCompilerObject::backendCompileStatelessRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v33 = 0u;
  uint64_t v34 = 0;
  memset(v32, 0, 24);
  v32[3] = (void *)-1;
  uint64_t v35 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v42 = 0;
  uint64_t v31 = 0;
  memset(v30, 0, sizeof(v30));
  unint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  int v4 = **(_DWORD **)(a2 + 32);
  int v24 = 10;
  MTLBuildRequestTypeToString(&v24, __p);
  if (logCompileBegin(std::string const&,unsigned long long &,char const*,std::string const&)::onceToken != -1) {
    dispatch_once(&logCompileBegin(std::string const&,unsigned long long &,char const*,std::string const&)::onceToken, &__block_literal_global_200);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1 + 136;
    if (*(char *)(a1 + 159) < 0) {
      uint64_t v5 = *(void *)(a1 + 136);
    }
    uint64_t v6 = __p;
    if (DiagnosticContext < 0) {
      uint64_t v6 = (void **)__p[0];
    }
    uint64_t v7 = "dynamic library";
    *(_DWORD *)buf = 136446722;
    if ((v4 & 0x40000000) == 0) {
      uint64_t v7 = "visible function";
    }
    *(void *)uint64_t v46 = v5;
    *(_WORD *)&v46[8] = 2082;
    *(void *)&v46[10] = v6;
    *(_WORD *)&v46[18] = 2080;
    *(void *)&long long v47 = v7;
    _os_log_impl(&dword_2556FA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Compilation BEGIN (ParentProcessName=%{public}s) Build request: %{public}s - %s", buf, 0x20u);
  }
  uint64_t v8 = mach_absolute_time();
  if (SHIBYTE(DiagnosticContext) < 0) {
    operator delete(__p[0]);
  }
  MEMORY[0x25A28CF80](&v24);
  __p[0] = &v24;
  uint64_t DiagnosticContext = llvm::LLVMContext::getDiagnosticContext((llvm::LLVMContext *)&v24);
  __p[1] = (void *)llvm::LLVMContext::getDiagnosticHandlerCallBack((llvm::LLVMContext *)&v24);
  uint64_t v9 = llvm::LLVMContext::setDiagnosticHandlerCallBack();
  *(_WORD *)buf = 0;
  *(_OWORD *)&v46[4] = 0u;
  long long v47 = 0u;
  memset(v48, 0, sizeof(v48));
  long long v49 = 0u;
  memset(v50, 0, sizeof(v50));
  MTLCompilerObject::getReadParametersFromRequest(v9, (uint64_t)buf, *(void *)a2, *(void *)(a2 + 8), (unsigned int *)(*(void *)(a2 + 32) + 88), *(void *)(a2 + 32));
  ModuleFromBinaryRequest = MTLCompilerObject::readModuleFromBinaryRequest(a1, (unsigned __int16 *)buf, (llvm::LLVMContext *)&v24, (MTLFunctionType *)(a2 + 40), (void **)&v40, (unint64_t *)&v40 + 1, 0);
  *(void *)(a2 + 4_Block_object_dispose(&STACK[0x250], 8) = ModuleFromBinaryRequest;
  if (!ModuleFromBinaryRequest)
  {
    (*(void (**)(void, void, void, void))(*(void *)(a2 + 24) + 16))(*(void *)(a2 + 24), 2 * (*(void *)(a1 + 120) != 0), 0, 0);
LABEL_35:
    int v16 = 1;
    goto LABEL_36;
  }
  if ((MTLCompilerObject::runFrameworkPasses((MTLCompilerObject *)a1, (uint64_t *)a2, v32, (llvm::LLVMContext *)&v24, (uint64_t)&v27) & 1) == 0)
  {
    if ((void)v40) {
      free((void *)v40);
    }
    goto LABEL_35;
  }
  MTLCompilerObject::backendCompileModule(a1, (uint64_t *)a2, (uint64_t)v30, v11, (uint64_t)&v27);
  uint64_t v12 = *(void *)(a2 + 32);
  if ((*(unsigned char *)(v12 + 5) & 2) != 0)
  {
    if ((v28 - (unsigned char *)v27) >> 4 == -2) {
      unint64_t v13 = 0;
    }
    else {
      unint64_t v13 = 12 * (((v28 - (unsigned char *)v27) >> 4) + 2) + 4;
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  uint64_t v14 = 0;
  uint64_t v23 = 0;
  if ((*(unsigned char *)(v12 + 2) & 0x80) != 0)
  {
    uint64_t v14 = MTLGPUArchiverFromId();
    uint64_t v22 = v14;
    if (!v14
      || !MTLCompilerObject::storeToBinaryArchive(a1, *(unsigned int **)(a2 + 32), *(void *)(a2 + 8), (uint64_t)buf, (uint64_t)v30, *(void *)(a2 + 40), v32, (uint64_t)&v22, (char **)&v23))
    {
      (*(void (**)(void))(*(void *)(a2 + 24) + 16))();
      if ((void)v40) {
        free((void *)v40);
      }
      free(v23);
      MTLGPUArchiverDestroy();
      goto LABEL_35;
    }
  }
  int v15 = MTLCompilerObject::serializeBackendCompilationOutput(a1, *(_DWORD *)(a2 + 16), a2, (uint64_t *)v32, (uint64_t)v30, (uint64_t)&v27, v8, v13);
  if (v14)
  {
    if (v15 && !MTLGPUArchiverFlush())
    {
      (*(void (**)(void))(*(void *)(a2 + 24) + 16))();
      free(v23);
    }
    MTLGPUArchiverDestroy();
  }
  int v16 = 0;
LABEL_36:
  ScopedDiagnosticHandler::~ScopedDiagnosticHandler((ScopedDiagnosticHandler *)__p);
  llvm::LLVMContext::~LLVMContext((llvm::LLVMContext *)&v24);
  if (!v16 && (void)v40)
  {
    free((void *)v40);
    long long v40 = 0uLL;
  }
  if (v27)
  {
    uint64_t v28 = v27;
    operator delete(v27);
  }
  for (uint64_t i = 22; i != 19; --i)
    std::unique_ptr<void,LLVMMemoryBufferDeleter>::reset[abi:ne180100]((uint64_t *)&v32[i], 0);
  unint64_t v18 = (void *)v41;
  *(void *)&long long v41 = 0;
  if (v18) {
    free(v18);
  }
  uint64_t v19 = v35;
  uint64_t v35 = 0;
  if (v19) {
    free(v19);
  }
  int v20 = (void *)v33;
  *(void *)&long long v33 = 0;
  if (v20) {
    free(v20);
  }
  unint64_t v21 = v32[0];
  v32[0] = 0;
  if (v21) {
    free(v21);
  }
}

void sub_255787968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }
  FrameworkPassesOutput::~FrameworkPassesOutput((FrameworkPassesOutput *)&a32);
  _Unwind_Resume(a1);
}

BOOL MTLCompilerObject::storeToBinaryArchive(uint64_t a1, unsigned int *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, char **a9)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  *a9 = 0;
  unint64_t v13 = (char *)a2 + a2[49];
  int v14 = strncmp(v13 + 4, "AIRP", 4uLL);
  if (v14)
  {
    __int32 RequiredStagesPresentMask = 0;
    char v15 = 0;
  }
  else
  {
    int v16 = (const Air::PipelineScript *)&v13[*(unsigned int *)v13];
    __int32 RequiredStagesPresentMask = getRequiredStagesPresentMask(v16);
    v17.i32[0] = RequiredStagesPresentMask;
    char v15 = vaddlv_u8((uint8x8_t)vcnt_s8(v17));
    unint64_t v18 = (unsigned __int16 *)((char *)v16 - *(int *)v16);
    if (*v18 >= 9u)
    {
      uint64_t v19 = v18[4];
      if (v19)
      {
        int v60 = *((unsigned __int8 *)v16 + v19);
        goto LABEL_7;
      }
    }
  }
  int v60 = 0;
LABEL_7:
  LLVMCreateMemoryBufferWithMemoryRange();
  uint64_t v20 = LLVMCreateMemoryBufferWithMemoryRange();
  long long v63 = 0u;
  long long v64 = 0u;
  int v65 = 1065353216;
  uint64_t v21 = a2[40] + a2[36];
  if (v14) {
    BOOL v22 = 1;
  }
  else {
    BOOL v22 = v21 == 0;
  }
  int v23 = !v22;
  if (!v22) {
    MTLCompilerObject::readVisibleFunctions(v20, a2, a3, (uint64_t)&v63);
  }
  if (a6 == 2 && a7[5]) {
    _MTLEncodeLinkingInfo();
  }
  uint64_t v61 = a6;
  LLVMCreateMemoryBufferWithMemoryRange();
  unint64_t v25 = a2[46];
  uint64_t v24 = a2[47];
  uint64_t v26 = a2[48];
  uint64_t v62 = MTLGPUArchiverAddUnit();
  if (!v14)
  {
    uint64_t v29 = malloc_type_malloc(0x30uLL, 0x102204031A510F6uLL);
    unint64_t v27 = v29;
    unsigned int v28 = a2[69];
    if (!v28)
    {
      *((void *)v29 + 4) = -1;
      *(void *)&long long v44 = -1;
      *((void *)&v44 + 1) = -1;
      *uint64_t v29 = v44;
      v29[1] = v44;
      *((_DWORD *)v29 + 10) = v60;
      *((unsigned char *)v29 + 45) = 0;
      *((unsigned char *)v29 + 44) = v15;
      goto LABEL_23;
    }
LABEL_22:
    memcpy(v27, (char *)a2 + a2[68], v28);
    goto LABEL_23;
  }
  unint64_t v27 = 0;
  unsigned int v28 = a2[69];
  if (v28) {
    goto LABEL_22;
  }
LABEL_23:
  if (!v62)
  {
    uint64_t v32 = 0;
    BOOL v42 = 0;
    goto LABEL_86;
  }
  int v30 = (char *)a2 + v24;
  int v31 = MTLGPUArchiverSetUnitHash();
  if (v14 || !v31 || !v21)
  {
    uint64_t v32 = 0;
    if (!v31)
    {
      BOOL v43 = 0;
      long long v40 = (uint64_t *)v27;
      goto LABEL_52;
    }
    long long v40 = (uint64_t *)v27;
    uint64_t v41 = v61;
    uint64_t v38 = v62;
LABEL_42:
    if (a7[21] && a7[22])
    {
      BOOL v43 = MTLGPUArchiverSetUnitReflection() != 0;
      long long v40 = (uint64_t *)v27;
      uint64_t v41 = v61;
      uint64_t v38 = v62;
      if (v14)
      {
LABEL_52:
        if (!v40) {
          goto LABEL_55;
        }
LABEL_82:
        uint64_t v54 = (void *)a7[18];
        a7[18] = v40;
        if (v54) {
          free(v54);
        }
        uint64_t v45 = 48;
        goto LABEL_85;
      }
    }
    else
    {
      BOOL v43 = 1;
      if (v14) {
        goto LABEL_52;
      }
    }
    if (v43)
    {
      switch(v41)
      {
        case 1:
          *long long v40 = v38;
          goto LABEL_60;
        case 2:
          v40[3] = v38;
          unsigned __int8 v46 = *((unsigned char *)v40 + 45) | 1;
          goto LABEL_62;
        case 3:
          v40[4] = v38;
          goto LABEL_60;
        case 7:
          v40[1] = v38;
LABEL_60:
          unsigned __int8 v46 = *((unsigned char *)v40 + 45) | 2;
          goto LABEL_62;
        case 8:
          v40[2] = v38;
          unsigned __int8 v46 = *((unsigned char *)v40 + 45) | 4;
LABEL_62:
          *((unsigned char *)v40 + 45) = v46;
          break;
        default:
          BOOL v43 = 0;
          *a9 = strdup("Unsupported function or pipeline type");
          unsigned __int8 v46 = *((unsigned char *)v40 + 45);
          break;
      }
      char v47 = *((unsigned char *)v40 + 44) - 1;
      *((unsigned char *)v40 + 44) = v47;
      if (v43 && !v47 && RequiredStagesPresentMask == v46)
      {
        *((unsigned char *)v40 + 45) = RequiredStagesPresentMask | 0x10;
        switch(v60)
        {
          case 1:
            uint64_t v48 = malloc_type_malloc(0x10uLL, 0x2004093837F09uLL);
            long long v49 = v48;
            if (RequiredStagesPresentMask) {
              uint64_t v50 = v40[3];
            }
            else {
              uint64_t v50 = 0;
            }
            v48[1] = v50;
            *uint64_t v48 = *v40;
            break;
          case 2:
          case 3:
            long long v49 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
            *long long v49 = v38;
            break;
          case 4:
            uint64_t v51 = malloc_type_malloc(0x18uLL, 0x2004093837F09uLL);
            long long v49 = v51;
            if ((RequiredStagesPresentMask & 4) != 0) {
              uint64_t v52 = v40[2];
            }
            else {
              uint64_t v52 = 0;
            }
            *uint64_t v51 = v52;
            if (RequiredStagesPresentMask) {
              uint64_t v53 = v40[3];
            }
            else {
              uint64_t v53 = 0;
            }
            v51[2] = v53;
            v51[1] = v40[1];
            break;
          default:
            long long v49 = 0;
            *a9 = strdup("Unsupported function or pipeline type");
            break;
        }
        BOOL v43 = MTLGPUArchiverAddPipeline() != 0;
        if (v49) {
          free(v49);
        }
      }
      goto LABEL_82;
    }
    goto LABEL_52;
  }
  uint64_t v32 = malloc_type_malloc(8 * v21, 0x2004093837F09uLL);
  int v57 = v23;
  unint64_t v58 = a7;
  if (!*((_DWORD *)v30 + 1) && v25 >= 2)
  {
    int v33 = 0;
    uint64_t v34 = (_OWORD *)((char *)a2 + v26 + 32);
    unint64_t v35 = 2;
    do
    {
      long long v36 = v34[1];
      v66[0] = *v34;
      v66[1] = v36;
      if (std::__hash_table<std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>>>::find<MTLUINT256_t>(&v63, (unint64_t *)v66))
      {
        v32[v33++] = LLVMCreateMemoryBufferWithMemoryRange();
      }
      v34 += 2;
      if (*(_DWORD *)&v30[4 * v35]) {
        BOOL v37 = 1;
      }
      else {
        BOOL v37 = v35 >= v25;
      }
      ++v35;
    }
    while (!v37);
  }
  uint64_t v38 = v62;
  int v39 = MTLGPUArchiverAddLinkedModules();
  a7 = v58;
  long long v40 = (uint64_t *)v27;
  uint64_t v41 = v61;
  if (v39)
  {
    int v23 = v57;
    goto LABEL_42;
  }
  BOOL v43 = 0;
  int v23 = v57;
  if (v27) {
    goto LABEL_82;
  }
LABEL_55:
  uint64_t v45 = 0;
LABEL_85:
  a7[19] = v45;
  BOOL v42 = v43;
LABEL_86:
  LLVMDisposeMemoryBuffer();
  LLVMDisposeMemoryBuffer();
  LLVMDisposeMemoryBuffer();
  if (v23)
  {
    do
    {
      LLVMDisposeMemoryBuffer();
      ++v32;
      --v21;
    }
    while (v21);
    for (uint64_t i = (uint64_t **)v64; i; uint64_t i = (uint64_t **)*i)
      free(i[6]);
  }
  std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::~__hash_table((uint64_t)&v63);
  return v42;
}

void sub_255788064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t MTLCompilerObject::runKernelPasses(MTLCompilerObject *a1, uint64_t a2)
{
  if (*(_DWORD *)(*(void *)(a2 + 32) + 28) < 0xCu) {
    return 1;
  }
  uint64_t result = MTLCompilerObject::checkVertexDescriptorAndAddVertexFetchingToKernelModule(a1, a2);
  if (result) {
    return 1;
  }
  return result;
}

uint64_t MTLCompilerObject::checkVertexDescriptorAndAddVertexFetchingToKernelModule(MTLCompilerObject *this, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)a2 + *(unsigned int *)(v4 + 24);
  int v6 = *(_DWORD *)(v5 + 8);
  if (v6)
  {
    if ((v6 & 0x20) != 0) {
      unint64_t v10 = (char *)(v5 + 20);
    }
    else {
      unint64_t v10 = (char *)(v5 + 12);
    }
    MTLCompilerObject::validateSerializedVertexDescriptor(this, v10, *(unsigned int *)(v4 + 28));
    if ((*(unsigned char *)(v5 + 8) & 4) == 0)
    {
      long long __p = 0;
      int v16 = 0;
      uint64_t v17 = 0;
      char v11 = *((unsigned char *)this + 128);
      uint64_t v12 = (MTLCompilerObject *)((char *)this + 120);
      uint64_t v19 = v12;
      char v20 = v11;
      if (!MTLAddVertexFetchingToModulePass::addVertexFetchingToModule(&v19, *(llvm::Type ***)(a2 + 48), 1, (unsigned __int16 *)v10, 0, 0, 0, 0, v11, v11, *(_DWORD *)(*(void *)(a2 + 32) + 4), &__p))
      {
        if (*(void *)(a2 + 48))
        {
          uint64_t v14 = MEMORY[0x25A28D8E0]();
          MEMORY[0x25A28E250](v14, 0x10B2C407FF26C1CLL);
        }
        *(void *)(a2 + 4_Block_object_dispose(&STACK[0x250], 8) = 0;
        (*(void (**)(void, void, void, void))(*(void *)(a2 + 24) + 16))(*(void *)(a2 + 24), 2 * (*(void *)v12 != 0), 0, 0);
        if (__p)
        {
          int v16 = __p;
          operator delete(__p);
        }
        return 0;
      }
      if (__p)
      {
        int v16 = __p;
        operator delete(__p);
      }
    }
    return 1;
  }
  if ((v6 & 4) != 0) {
    return 1;
  }
  uint64_t v7 = *(llvm::Module **)(a2 + 48);
  long long __p = "air.kernel";
  __int16 v18 = 259;
  NamedMetadata = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(v7, (const llvm::Twine *)&__p);
  uint64_t Operand = llvm::NamedMDNode::getOperand(NamedMetadata);
  if (MTLCompilerObject::checkNoStageInAttributes((uint64_t)this, Operand)) {
    return 1;
  }
  (*(void (**)(void, void, void, void))(*(void *)(a2 + 24) + 16))(*(void *)(a2 + 24), 2 * (*((void *)this + 15) != 0), 0, 0);
  return 0;
}

void sub_2557882B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t MTLCompilerObject::generateAIRReflectionType(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (!*(unsigned char *)(result + 128))
  {
    uint64_t v6 = MTLWriteAIRReflectionToMemoryBuffer();
    return std::unique_ptr<void,LLVMMemoryBufferDeleter>::reset[abi:ne180100]((uint64_t *)(a3 + 8 * a4 + 160), v6);
  }
  return result;
}

void *deserializePluginDataForFunctionType<MTLSerializedStatelessFunctionData>(void *result, uint64_t a2)
{
  uint64_t v2 = result[4];
  if (*(_DWORD *)(v2 + 28) >= 0x2Cu)
  {
    uint64_t v4 = (const unsigned __int8 *)(*result + *(unsigned int *)(v2 + 24));
    uint64_t v5 = *(unsigned int *)v4;
    if (v5)
    {
      uint64_t result = MTLDeserializePluginDataDictionary(&v4[v5]);
      *(void *)(a2 + 112) = result;
    }
    uint64_t v6 = *((unsigned int *)v4 + 1);
    if (v6)
    {
      uint64_t result = MTLDeserializePluginDataDictionary(&v4[v6]);
      *(void *)(a2 + 120) = result;
    }
  }
  return result;
}

void MTLCompilerObject::FragmentVaryingsInfo::~FragmentVaryingsInfo(char **this)
{
  std::__tree<std::__value_type<std::string,TextureTokenData>,std::__map_value_compare<std::string,std::__value_type<std::string,TextureTokenData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TextureTokenData>>>::destroy((uint64_t)(this + 6), this[7]);
  uint64_t v2 = this[3];
  if (v2)
  {
    this[4] = v2;
    operator delete(v2);
  }
  uint64_t v3 = *this;
  if (*this)
  {
    this[1] = v3;
    operator delete(v3);
  }
}

void *MTLCompilerObject::addDebugInstrumentationToModule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v73[21] = *MEMORY[0x263EF8340];
  uint64_t v7 = *(const void **)a3;
  uint64_t v6 = *(void *)(a3 + 8);
  {
    LODWORD(xmmword_269EF88EC) = 0;
    MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::stats = 0u;
    unk_269EF88DC = 0u;
    unk_269EF8904 = 0u;
    *(long long *)((char *)&xmmword_269EF890C + _Block_object_dispose(&STACK[0x250], 8) = 0u;
    unk_269EF8924 = 0u;
  }
  {
    MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::serializedData = (uint64_t)&unk_269EF8950;
    qword_269EF8948 = 0x400000000;
    qword_269EF89B0 = (uint64_t)&unk_269EF89C0;
    qword_269EF89B8 = 0x1000000000;
    qword_269EF8AC0 = (uint64_t)&unk_269EF8AD0;
    qword_269EF8AC8 = 0x1000000000;
    qword_269EF8B90 = (uint64_t)&qword_269EF8BA0;
    qword_269EF8B98 = 0;
    qword_269EF8BA0 = (uint64_t)&qword_269EF8BB8;
    qword_269EF8BB0 = 0;
    qword_269EF8BA8 = 0;
    __cxa_atexit((void (*)(void *))MTLBoundsCheck::SerializedData::~SerializedData, &MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::serializedData, &dword_2556FA000);
  }
  uint64_t v8 = (unsigned int *)objc_msgSend((id)objc_msgSend(*(id *)(a3 + 112), "objectForKeyedSubscript:", @"MTLBoundsCheck::Options"), "bytes");
  int v60 = (const char *)(*(void *)(a2 + 32) + *(unsigned int *)(*(void *)(a2 + 32) + 280));
  size_t v61 = strlen(v60);
  if (llvm::StringRef::find() != -1)
  {
    unint64_t v9 = *(void *)(v8 + 5) | 0x1000000000;
LABEL_7:
    *(void *)(v8 + 5) = v9;
    goto LABEL_8;
  }
  if (llvm::StringRef::find() != -1)
  {
    unint64_t v9 = *(void *)(v8 + 5) & 0xFFFFFFE9FEDFFBFELL | 1;
    goto LABEL_7;
  }
LABEL_8:
  unint64_t v10 = *(llvm::legacy::PassManager **)(a1 + 8);
  if (!v10
    || ((void)MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::cachedOptions == *(void *)v8
      ? (BOOL v11 = *((void *)&MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::cachedOptions
               + 1) == *((void *)v8 + 1))
      : (BOOL v11 = 0),
        v11 ? (BOOL v12 = qword_269EF88C0 == *((void *)v8 + 2)) : (BOOL v12 = 0),
        v12 ? (BOOL v13 = dword_269EF88C8 == (unint64_t)v8[6]) : (BOOL v13 = 0),
        !v13))
  {
    long long v14 = *(_OWORD *)v8;
    *(long long *)((char *)&MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::cachedOptions
                + 12) = *(_OWORD *)(v8 + 3);
    MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::cachedOptions = v14;
    operator new();
  }
  MTLUpdateBoundsRunPipeline(a2, v10, *(void **)(a3 + 120));
  qword_269EF892C = 0;
  xmmword_269EF890C = 0u;
  unk_269EF891C = 0u;
  xmmword_269EF88EC = 0u;
  unk_269EF88FC = 0u;
  MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::stats = 0u;
  unk_269EF88DC = 0u;
  int v66 = 0;
  long long v65 = 0u;
  long long v63 = 0u;
  *(_OWORD *)long long v64 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long __p = 0u;
  uint64_t v71 = 0;
  v72[0] = (char *)v73;
  v72[1] = (char *)0x400000000;
  char v15 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.MTLCompiler"), "resourcePath"), "stringByAppendingFormat:", @"/Versions/%d", 32024), "stringByAppendingString:", @"/libmetal_boundscheck.a"), "UTF8String");
  if (v15) {
    strlen(v15);
  }
  llvm::getLazyIRFileModule();
  v57[0] = "air.language_version";
  __int16 v58 = 259;
  NamedMetadata = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(v59, (const llvm::Twine *)v57);
  if (NamedMetadata) {
    llvm::Module::eraseNamedMetadata(v59, NamedMetadata);
  }
  v57[0] = "air.version";
  __int16 v58 = 259;
  uint64_t v17 = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(v59, (const llvm::Twine *)v57);
  if (v17) {
    llvm::Module::eraseNamedMetadata(v59, v17);
  }
  v57[0] = "air.compile_options";
  __int16 v58 = 259;
  __int16 v18 = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(v59, (const llvm::Twine *)v57);
  if (v18) {
    llvm::Module::eraseNamedMetadata(v59, v18);
  }
  uint64_t v19 = v59;
  v59 = 0;
  int v56 = v19;
  v62[3] = 0;
  llvm::Linker::linkModules();
  std::__function::__value_func<void ()(llvm::Module &,llvm::StringSet<llvm::MallocAllocator> const&)>::~__value_func[abi:ne180100](v62);
  if (v56)
  {
    uint64_t v20 = MEMORY[0x25A28D8E0]();
    MEMORY[0x25A28E250](v20, 0x10B2C407FF26C1CLL);
  }
  uint64_t v21 = v59;
  v59 = 0;
  if (v21)
  {
    uint64_t v22 = MEMORY[0x25A28D8E0]();
    MEMORY[0x25A28E250](v22, 0x10B2C407FF26C1CLL);
  }
  llvm::SmallVector<llvm::SMFixIt,4u>::~SmallVector(v72);
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (SHIBYTE(v69) < 0) {
    operator delete(*((void **)&v68 + 1));
  }
  if (SBYTE7(v68) < 0) {
    operator delete((void *)v67);
  }
  if (SBYTE7(v65) < 0) {
    operator delete(v64[0]);
  }
  uint64_t v23 = 80;
  *(void *)(a3 + 64) = 80;
  if (qword_269EF8948)
  {
    uint64_t v24 = 24 * qword_269EF8948;
    uint64_t v25 = MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::serializedData
        + 23;
    uint64_t v23 = 80;
    uint64_t v26 = (char *)(MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::serializedData
                 + 23);
    do
    {
      int v28 = *v26;
      v26 += 24;
      unsigned __int8 v27 = v28;
      if (v28 < 0) {
        uint64_t v29 = *(void *)(v25 - 15);
      }
      else {
        uint64_t v29 = v27;
      }
      v23 += v29 + 9;
      *(void *)(a3 + 64) = v23;
      uint64_t v25 = (uint64_t)v26;
      v24 -= 24;
    }
    while (v24);
  }
  size_t v30 = v23
      + 16 * qword_269EF89B8
      + 12 * qword_269EF8AC8
      + 8 * qword_269EF8B98
      + v6
      + qword_269EF8BA8;
  *(void *)(a3 + 64) = v30;
  int v31 = malloc_type_calloc(1uLL, v30, 0xF77D3E9FuLL);
  uint64_t v32 = *(void **)(a3 + 56);
  *(void *)(a3 + 56) = v31;
  if (v32)
  {
    free(v32);
    int v31 = *(void **)(a3 + 56);
  }
  *int v31 = *v8;
  v31[7] = qword_269EF8BB8;
  v31[8] = qword_269EF8BC0;
  *((_WORD *)v31 + 36) = word_269EF8BC8;
  int v33 = v31 + 80;
  int v34 = qword_269EF8948;
  *((_DWORD *)v31 + 2) = qword_269EF8948;
  *((_DWORD *)v31 + 3) = 72;
  if (v34)
  {
    uint64_t v35 = 0;
    unsigned int v36 = 0;
    unsigned int v37 = 8 * v34;
    v33 += 8 * v34;
    uint64_t v38 = (char *)v31;
    do
    {
      int v39 = (const char *)(MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::serializedData
                         + v35);
      if (*(char *)(MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::serializedData
                   + v35
                   + 23) < 0)
        size_t v40 = *((unsigned int *)v39 + 2);
      else {
        size_t v40 = *(unsigned __int8 *)(MTLCompilerObject::addDebugInstrumentationToModule(BinaryRequestData &,FrameworkPassesOutput &)::serializedData
      }
                                 + v35
                                 + 23);
      uint64_t v41 = *((unsigned int *)v31 + 3);
      BOOL v42 = &v38[v41];
      *(_DWORD *)&v38[v41 + 8] = v40;
      *(_DWORD *)&v38[v41 + 12] = v37;
      if (v39[23] < 0) {
        int v39 = *(const char **)v39;
      }
      strncpy(&v38[v41 + 8 + v37], v39, v40);
      int v43 = *((_DWORD *)v42 + 2) + 1;
      unsigned int v37 = v37 + v43 - 8;
      v33 += v43;
      ++v36;
      v38 += 8;
      v35 += 24;
    }
    while (qword_269EF8948 > v36);
  }
  uint64_t v44 = qword_269EF89B8;
  *((_DWORD *)v31 + 4) = qword_269EF89B8;
  unsigned int v45 = v33 - (v31 + 16);
  *((_DWORD *)v31 + 5) = v45;
  memcpy((char *)v31 + v45 + 16, (const void *)qword_269EF89B0, 16 * v44);
  LODWORD(v44) = v33 + 16 * v44;
  uint64_t v46 = qword_269EF8AC8;
  *((_DWORD *)v31 + 6) = qword_269EF8AC8;
  unsigned int v47 = v44 - (v31 + 24);
  *((_DWORD *)v31 + 7) = v47;
  int v48 = 3 * v46;
  memcpy((char *)v31 + v47 + 24, (const void *)qword_269EF8AC0, 12 * v46);
  uint64_t v49 = qword_269EF8B98;
  *((_DWORD *)v31 + _Block_object_dispose(&STACK[0x250], 8) = qword_269EF8B98;
  LODWORD(v44) = v44 + 4 * v48;
  unsigned int v50 = v44 - (v31 + 32);
  *((_DWORD *)v31 + 9) = v50;
  memcpy((char *)v31 + v50 + 32, (const void *)qword_269EF8B90, 8 * v49);
  LODWORD(v44) = v44 + 8 * v49;
  size_t v51 = qword_269EF8BA8;
  *((_DWORD *)v31 + 10) = qword_269EF8BA8;
  unsigned int v52 = v44 - (v31 + 40);
  *((_DWORD *)v31 + 11) = v52;
  memcpy((char *)v31 + v52 + 40, (const void *)qword_269EF8BA0, v51);
  *((_DWORD *)v31 + 12) = v6;
  uint64_t v53 = (char *)(v31 + 6);
  int v54 = v44 - v53 + v51;
  *((_DWORD *)v53 + 1) = v54;
  return memcpy(&v53[v54], v7, v6);
}

void sub_255788B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  std::unique_ptr<llvm::Module>::reset[abi:ne180100]((uint64_t *)va, 0);
  llvm::SMDiagnostic::~SMDiagnostic((llvm::SMDiagnostic *)va1);
  _Unwind_Resume(a1);
}

uint64_t MTLCompilerObject::AIRNTGetVertexFunctionScript(uint64_t a1, int *a2, uint64_t a3, int *a4)
{
  if (!a4) {
    return 0;
  }
  int v6 = Air::CloneVertexFunctionDescriptor<Air::VertexFunctionDescriptor>(a3, a4);
  uint64_t v7 = (unsigned __int16 *)((char *)a2 - *a2);
  unsigned int v8 = *v7;
  if (v8 >= 5 && v7[2]) {
    unint64_t v9 = (uint64_t *)((char *)a2 + v7[2]);
  }
  else {
    unint64_t v9 = 0;
  }
  if (v8 >= 7 && (uint64_t v10 = v7[3]) != 0) {
    int v11 = *((unsigned __int8 *)a2 + v10);
  }
  else {
    int v11 = 0;
  }
  *(unsigned char *)(a3 + 70) = 1;
  int v12 = *(_DWORD *)(a3 + 32) - *(_DWORD *)(a3 + 48) + *(_DWORD *)(a3 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, 10, v6);
  flatbuffers::FlatBufferBuilder::AddStruct<Air::Version>((flatbuffers::FlatBufferBuilder *)a3, 4, v9);
  unsigned int v13 = flatbuffers::FlatBufferBuilder::PushElement<unsigned char>(a3, 1);
  flatbuffers::FlatBufferBuilder::TrackField((void *)a3, 8, v13);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a3, 6, v11, 0);
  int v14 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v12);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)a3, v14, "AIRF", 0);
  return *(void *)(a3 + 48) + **(unsigned int **)(a3 + 48);
}

uint64_t Air::CloneVertexFunctionDescriptor<Air::VertexFunctionDescriptor>(uint64_t a1, int *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = -v4;
  int v6 = (unsigned __int16 *)((char *)a2 - v4);
  if (*v6 >= 0x2Du && (uint64_t v7 = v6[22]) != 0)
  {
    int v8 = Air::CloneLinkedFunctions<Air::LinkedFunctions>(a1, (int *)((char *)a2 + v7 + *(unsigned int *)((char *)a2 + v7)));
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v8 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 0x1Fu && *(_WORD *)((char *)a2 + v5 + 30))
  {
    long long v69 = (unsigned int *)((char *)a2
                         + *(unsigned __int16 *)((char *)a2 + v5 + 30)
                         + *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 30)));
    int v9 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_29CloneVertexFunctionDescriptorINS3_24VertexFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_39VertexFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v69, &v69, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v9 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 7u && *(_WORD *)((char *)a2 + v5 + 6))
  {
    int v10 = Air::CloneVertexDescriptor<Air::VertexDescriptor>(a1, (int *)((char *)a2+ *(unsigned __int16 *)((char *)a2 + v5 + 6)+ *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 6))));
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v10 = 0;
  }
  uint64_t v11 = 1;
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = (unsigned __int16 *)((char *)a2 + v5);
  if (*v15 >= 0x1Bu)
  {
    uint64_t v16 = v15[13];
    if (v16) {
      uint64_t v11 = *(void *)((char *)a2 + v16);
    }
    else {
      uint64_t v11 = 1;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 26, v11, 1);
  uint64_t v17 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v17 >= 0xDu && (uint64_t v18 = v17[6]) != 0) {
    uint64_t v19 = *(void *)((char *)a2 + v18);
  }
  else {
    uint64_t v19 = 16;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 12, v19, 16);
  uint64_t v20 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v20 >= 5u && (uint64_t v21 = v20[2]) != 0) {
    uint64_t v22 = *(void *)((char *)a2 + v21);
  }
  else {
    uint64_t v22 = 1;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 4, v22, 1);
  if (v8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 44, v8);
  }
  uint64_t v23 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v23 >= 0x29u && (uint64_t v24 = v23[20]) != 0) {
    int v25 = *(int *)((char *)a2 + v24);
  }
  else {
    int v25 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((void *)a1, 40, v25, 0);
  if (v9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 30, v9);
  }
  if (v10) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 6, v10);
  }
  uint64_t v26 = (unsigned __int16 *)((char *)a2 - *a2);
  v28 = *v26 >= 0x2Bu && (uint64_t v27 = v26[21]) != 0 && *((unsigned __int8 *)a2 + v27) != 0;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 42, v28, 0);
  uint64_t v29 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v29 >= 0x27u && (uint64_t v30 = v29[19]) != 0) {
    int v31 = *((unsigned __int8 *)a2 + v30);
  }
  else {
    int v31 = 255;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 38, v31, 255);
  uint64_t v32 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v32 >= 0x25u && (uint64_t v33 = v32[18]) != 0)
  {
    unsigned int v34 = *((unsigned __int8 *)a2 + v33);
    if (v34 >= 3) {
      goto LABEL_93;
    }
  }
  else
  {
    unsigned int v34 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 36, v34, 0);
  BOOL v35 = 0;
  unsigned int v36 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v36 >= 0x23u)
  {
    uint64_t v37 = v36[17];
    if (v37) {
      BOOL v35 = *((unsigned __int8 *)a2 + v37) != 0;
    }
    else {
      BOOL v35 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 34, v35, 0);
  BOOL v38 = 0;
  int v39 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v39 >= 0x21u)
  {
    uint64_t v40 = v39[16];
    if (v40) {
      BOOL v38 = *((unsigned __int8 *)a2 + v40) != 0;
    }
    else {
      BOOL v38 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 32, v38, 0);
  unsigned int v41 = 0;
  BOOL v42 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v42 >= 0x1Du)
  {
    uint64_t v43 = v42[14];
    if (v43)
    {
      unsigned int v41 = *((unsigned __int8 *)a2 + v43);
      if (v41 >= 2) {
        goto LABEL_93;
      }
    }
    else
    {
      unsigned int v41 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 28, v41, 0);
  unsigned int v44 = 0;
  unsigned int v45 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v45 >= 0x19u)
  {
    uint64_t v46 = v45[12];
    if (v46)
    {
      unsigned int v44 = *((unsigned __int8 *)a2 + v46);
      if (v44 >= 4) {
        goto LABEL_93;
      }
    }
    else
    {
      unsigned int v44 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 24, v44, 0);
  unsigned int v47 = 0;
  int v48 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v48 >= 0x17u)
  {
    uint64_t v49 = v48[11];
    if (v49)
    {
      unsigned int v47 = *((unsigned __int8 *)a2 + v49);
      if (v47 >= 2) {
        goto LABEL_93;
      }
    }
    else
    {
      unsigned int v47 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 22, v47, 0);
  unsigned int v50 = 0;
  size_t v51 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v51 >= 0x15u)
  {
    uint64_t v52 = v51[10];
    if (v52)
    {
      unsigned int v50 = *((unsigned __int8 *)a2 + v52);
      if (v50 >= 4) {
        goto LABEL_93;
      }
    }
    else
    {
      unsigned int v50 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 20, v50, 0);
  unsigned int v53 = 0;
  int v54 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v54 >= 0x13u)
  {
    uint64_t v55 = v54[9];
    if (v55)
    {
      unsigned int v53 = *((unsigned __int8 *)a2 + v55);
      if (v53 >= 3) {
        goto LABEL_93;
      }
    }
    else
    {
      unsigned int v53 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 18, v53, 0);
  unsigned int v56 = 0;
  int v57 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v57 >= 0x11u)
  {
    uint64_t v58 = v57[8];
    if (v58)
    {
      unsigned int v56 = *((unsigned __int8 *)a2 + v58);
      if (v56 >= 2) {
LABEL_93:
      }
        abort();
    }
    else
    {
      unsigned int v56 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 16, v56, 0);
  BOOL v59 = 0;
  int v60 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v60 >= 0xFu)
  {
    uint64_t v61 = v60[7];
    if (v61) {
      BOOL v59 = *((unsigned __int8 *)a2 + v61) != 0;
    }
    else {
      BOOL v59 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 14, v59, 0);
  unsigned int v62 = 0;
  long long v63 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v63 >= 0xBu)
  {
    uint64_t v64 = v63[5];
    if (v64)
    {
      unsigned int v62 = *((unsigned __int8 *)a2 + v64);
      if (v62 >= 4) {
        goto LABEL_93;
      }
    }
    else
    {
      unsigned int v62 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 10, v62, 0);
  long long v65 = (unsigned __int16 *)((char *)a2 - *a2);
  v67 = *v65 < 9u || (uint64_t v66 = v65[4]) == 0 || *((unsigned __int8 *)a2 + v66) != 0;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 8, v67, 1);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v14 - (unsigned __int16)v13 + (unsigned __int16)v12);
}

uint64_t MTLCompilerObject::AIRNTGetFragmentFunctionScript(uint64_t a1, int *a2, uint64_t a3, int *a4)
{
  if (!a4) {
    return 0;
  }
  int v6 = Air::CloneFragmentFunctionDescriptor<Air::FragmentFunctionDescriptor>(a3, a4);
  uint64_t v7 = (unsigned __int16 *)((char *)a2 - *a2);
  unsigned int v8 = *v7;
  if (v8 >= 5 && v7[2]) {
    int v9 = (uint64_t *)((char *)a2 + v7[2]);
  }
  else {
    int v9 = 0;
  }
  if (v8 >= 7 && (uint64_t v10 = v7[3]) != 0) {
    int v11 = *((unsigned __int8 *)a2 + v10);
  }
  else {
    int v11 = 0;
  }
  *(unsigned char *)(a3 + 70) = 1;
  int v12 = *(_DWORD *)(a3 + 32) - *(_DWORD *)(a3 + 48) + *(_DWORD *)(a3 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, 10, v6);
  flatbuffers::FlatBufferBuilder::AddStruct<Air::Version>((flatbuffers::FlatBufferBuilder *)a3, 4, v9);
  unsigned int v13 = flatbuffers::FlatBufferBuilder::PushElement<unsigned char>(a3, 2);
  flatbuffers::FlatBufferBuilder::TrackField((void *)a3, 8, v13);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a3, 6, v11, 0);
  int v14 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v12);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)a3, v14, "AIRF", 0);
  return *(void *)(a3 + 48) + **(unsigned int **)(a3 + 48);
}

uint64_t Air::CloneFragmentFunctionDescriptor<Air::FragmentFunctionDescriptor>(uint64_t a1, int *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = -v4;
  int v6 = (unsigned __int16 *)((char *)a2 - v4);
  if (*v6 >= 0x37u && (uint64_t v7 = v6[27]) != 0)
  {
    int v8 = Air::CloneLinkedFunctions<Air::LinkedFunctions>(a1, (int *)((char *)a2 + v7 + *(unsigned int *)((char *)a2 + v7)));
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v8 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 0x1Du && *(_WORD *)((char *)a2 + v5 + 28))
  {
    uint64_t v86 = (unsigned int *)((char *)a2
                         + *(unsigned __int16 *)((char *)a2 + v5 + 28)
                         + *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 28)));
    int v9 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_31CloneFragmentFunctionDescriptorINS3_26FragmentFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_41FragmentFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v86, &v86, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v9 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 0x17u && *(_WORD *)((char *)a2 + v5 + 22))
  {
    uint64_t v86 = (unsigned int *)((char *)a2
                         + *(unsigned __int16 *)((char *)a2 + v5 + 22)
                         + *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 22)));
    int v10 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air33FragmentColorAttachmentDescriptorEEEZNS3_31CloneFragmentFunctionDescriptorINS3_26FragmentFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_41FragmentFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE0_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v86, &v86, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v10 = 0;
  }
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 32);
  int v14 = (unsigned __int16 *)((char *)a2 + v5);
  if (*v14 >= 0x11u && (uint64_t v15 = v14[8]) != 0) {
    uint64_t v16 = *(void *)((char *)a2 + v15);
  }
  else {
    uint64_t v16 = -1;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 16, v16, -1);
  uint64_t v17 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v17 >= 0xFu && (uint64_t v18 = v17[7]) != 0) {
    uint64_t v19 = *(void *)((char *)a2 + v18);
  }
  else {
    uint64_t v19 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 14, v19, 0);
  uint64_t v20 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v20 >= 0xDu && (uint64_t v21 = v20[6]) != 0) {
    uint64_t v22 = *(void *)((char *)a2 + v21);
  }
  else {
    uint64_t v22 = 1;
  }
  uint64_t v23 = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 12, v22, 1);
  uint64_t v24 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v24 >= 5u)
  {
    uint64_t v25 = v24[2];
    if (v25) {
      uint64_t v23 = *(void *)((char *)a2 + v25);
    }
    else {
      uint64_t v23 = 1;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 4, v23, 1);
  if (v8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 54, v8);
  }
  uint64_t v26 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v26 >= 0x35u && (uint64_t v27 = v26[26]) != 0) {
    int v28 = *(int *)((char *)a2 + v27);
  }
  else {
    int v28 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((void *)a1, 52, v28, 0);
  if (v9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 28, v9);
  }
  if (v10) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 22, v10);
  }
  uint64_t v29 = (unsigned __int16 *)((char *)a2 - *a2);
  float v30 = 1.0;
  if (*v29 >= 0x13u)
  {
    uint64_t v31 = v29[9];
    if (v31) {
      float v30 = *(float *)((char *)a2 + v31);
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<float>((void *)a1, 18, v30, 1.0);
  uint64_t v32 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v32 >= 0x1Bu && (uint64_t v33 = v32[13]) != 0) {
    uint64_t v34 = *(unsigned __int16 *)((char *)a2 + v33);
  }
  else {
    uint64_t v34 = 0;
  }
  unsigned __int16 v35 = Air::ClonePixelFormat<Air::PixelFormat>(v34);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned short>((void *)a1, 26, v35, 0);
  uint64_t v36 = 0;
  uint64_t v37 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v37 >= 0x19u)
  {
    uint64_t v38 = v37[12];
    if (v38) {
      uint64_t v36 = *(unsigned __int16 *)((char *)a2 + v38);
    }
    else {
      uint64_t v36 = 0;
    }
  }
  unsigned __int16 v39 = Air::ClonePixelFormat<Air::PixelFormat>(v36);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned short>((void *)a1, 24, v39, 0);
  BOOL v40 = 0;
  unsigned int v41 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v41 >= 0x33u)
  {
    uint64_t v42 = v41[25];
    if (v42) {
      BOOL v40 = *((unsigned __int8 *)a2 + v42) != 0;
    }
    else {
      BOOL v40 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 50, v40, 0);
  BOOL v43 = 0;
  unsigned int v44 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v44 >= 0x31u)
  {
    uint64_t v45 = v44[24];
    if (v45) {
      BOOL v43 = *((unsigned __int8 *)a2 + v45) != 0;
    }
    else {
      BOOL v43 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 48, v43, 0);
  BOOL v46 = 0;
  unsigned int v47 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v47 >= 0x2Fu)
  {
    uint64_t v48 = v47[23];
    if (v48) {
      BOOL v46 = *((unsigned __int8 *)a2 + v48) != 0;
    }
    else {
      BOOL v46 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 46, v46, 0);
  BOOL v49 = 0;
  unsigned int v50 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v50 >= 0x2Du)
  {
    uint64_t v51 = v50[22];
    if (v51) {
      BOOL v49 = *((unsigned __int8 *)a2 + v51) != 0;
    }
    else {
      BOOL v49 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 44, v49, 0);
  unsigned int v52 = 0;
  unsigned int v53 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v53 >= 0x2Bu)
  {
    uint64_t v54 = v53[21];
    if (v54)
    {
      unsigned int v52 = *((unsigned __int8 *)a2 + v54);
      if (v52 >= 8) {
        goto LABEL_87;
      }
    }
    else
    {
      unsigned int v52 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 42, v52, 0);
  BOOL v55 = 0;
  unsigned int v56 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v56 >= 0x29u)
  {
    uint64_t v57 = v56[20];
    if (v57) {
      BOOL v55 = *((unsigned __int8 *)a2 + v57) != 0;
    }
    else {
      BOOL v55 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 40, v55, 0);
  unsigned int v58 = 0;
  BOOL v59 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v59 >= 0x27u)
  {
    uint64_t v60 = v59[19];
    if (v60)
    {
      unsigned int v58 = *((unsigned __int8 *)a2 + v60);
      if (v58 >= 0x10) {
LABEL_87:
      }
        abort();
    }
    else
    {
      unsigned int v58 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 38, v58, 0);
  BOOL v61 = 0;
  unsigned int v62 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v62 >= 0x25u)
  {
    uint64_t v63 = v62[18];
    if (v63) {
      BOOL v61 = *((unsigned __int8 *)a2 + v63) != 0;
    }
    else {
      BOOL v61 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 36, v61, 0);
  unsigned int v64 = 0;
  long long v65 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v65 >= 0x23u)
  {
    uint64_t v66 = v65[17];
    if (v66)
    {
      unsigned int v64 = *((unsigned __int8 *)a2 + v66);
      if (v64 >= 3) {
        goto LABEL_87;
      }
    }
    else
    {
      unsigned int v64 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 34, v64, 0);
  BOOL v67 = 0;
  long long v68 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v68 >= 0x21u)
  {
    uint64_t v69 = v68[16];
    if (v69) {
      BOOL v67 = *((unsigned __int8 *)a2 + v69) != 0;
    }
    else {
      BOOL v67 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 32, v67, 0);
  BOOL v70 = 0;
  uint64_t v71 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v71 >= 0x1Fu)
  {
    uint64_t v72 = v71[15];
    if (v72) {
      BOOL v70 = *((unsigned __int8 *)a2 + v72) != 0;
    }
    else {
      BOOL v70 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 30, v70, 0);
  BOOL v73 = 0;
  uint64_t v74 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v74 >= 0x15u)
  {
    uint64_t v75 = v74[10];
    if (v75) {
      BOOL v73 = *((unsigned __int8 *)a2 + v75) != 0;
    }
    else {
      BOOL v73 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 20, v73, 0);
  BOOL v76 = 0;
  uint64_t v77 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v77 >= 0xBu)
  {
    uint64_t v78 = v77[5];
    if (v78) {
      BOOL v76 = *((unsigned __int8 *)a2 + v78) != 0;
    }
    else {
      BOOL v76 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 10, v76, 0);
  BOOL v79 = 0;
  unint64_t v80 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v80 >= 9u)
  {
    uint64_t v81 = v80[4];
    if (v81) {
      BOOL v79 = *((unsigned __int8 *)a2 + v81) != 0;
    }
    else {
      BOOL v79 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 8, v79, 0);
  int v82 = (unsigned __int16 *)((char *)a2 - *a2);
  v84 = *v82 < 7u || (uint64_t v83 = v82[3]) == 0 || *((unsigned __int8 *)a2 + v83) != 0;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 6, v84, 1);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v13 - (unsigned __int16)v12 + (unsigned __int16)v11);
}

uint64_t MTLCompilerObject::AIRNTGetComputeFunctionScript(uint64_t a1, int *a2, uint64_t a3, int *a4)
{
  if (!a4) {
    return 0;
  }
  int v6 = Air::CloneComputeFunctionDescriptor<Air::ComputeFunctionDescriptor>(a3, a4);
  uint64_t v7 = (unsigned __int16 *)((char *)a2 - *a2);
  unsigned int v8 = *v7;
  if (v8 >= 5 && v7[2]) {
    int v9 = (uint64_t *)((char *)a2 + v7[2]);
  }
  else {
    int v9 = 0;
  }
  if (v8 >= 7 && (uint64_t v10 = v7[3]) != 0) {
    int v11 = *((unsigned __int8 *)a2 + v10);
  }
  else {
    int v11 = 0;
  }
  *(unsigned char *)(a3 + 70) = 1;
  int v12 = *(_DWORD *)(a3 + 32) - *(_DWORD *)(a3 + 48) + *(_DWORD *)(a3 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, 10, v6);
  flatbuffers::FlatBufferBuilder::AddStruct<Air::Version>((flatbuffers::FlatBufferBuilder *)a3, 4, v9);
  unsigned int v13 = flatbuffers::FlatBufferBuilder::PushElement<unsigned char>(a3, 3);
  flatbuffers::FlatBufferBuilder::TrackField((void *)a3, 8, v13);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a3, 6, v11, 0);
  int v14 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v12);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)a3, v14, "AIRF", 0);
  return *(void *)(a3 + 48) + **(unsigned int **)(a3 + 48);
}

uint64_t Air::CloneComputeFunctionDescriptor<Air::ComputeFunctionDescriptor>(uint64_t a1, int *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = -v4;
  int v6 = (unsigned __int16 *)((char *)a2 - v4);
  if (*v6 >= 0x17u && (uint64_t v7 = v6[11]) != 0)
  {
    int v8 = Air::CloneLinkedFunctions<Air::LinkedFunctions>(a1, (int *)((char *)a2 + v7 + *(unsigned int *)((char *)a2 + v7)));
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v8 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 0xDu && *(_WORD *)((char *)a2 + v5 + 12))
  {
    uint64_t v36 = (unsigned int *)((char *)a2
                         + *(unsigned __int16 *)((char *)a2 + v5 + 12)
                         + *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 12)));
    int v9 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_30CloneComputeFunctionDescriptorINS3_25ComputeFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_40ComputeFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v36, &v36, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v9 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 0xBu && *(_WORD *)((char *)a2 + v5 + 10))
  {
    int v10 = Air::CloneStageInputOutputDescriptor<Air::StageInputOutputDescriptor>(a1, (int *)((char *)a2+ *(unsigned __int16 *)((char *)a2 + v5 + 10)+ *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 10))));
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v10 = 0;
  }
  uint64_t v11 = 1;
  *(unsigned char *)(a1 + 70) = 1;
  int v12 = (unsigned __int16 *)((char *)a2 + v5);
  if (*v12 >= 9u)
  {
    uint64_t v13 = v12[4];
    if (v13) {
      uint64_t v11 = *(void *)((char *)a2 + v13);
    }
    else {
      uint64_t v11 = 1;
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 32);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 8, v11, 1);
  uint64_t v17 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v17 >= 7u && (uint64_t v18 = v17[3]) != 0) {
    uint64_t v19 = *(void *)((char *)a2 + v18);
  }
  else {
    uint64_t v19 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 6, v19, 0);
  if (v8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 22, v8);
  }
  if (v9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 12, v9);
  }
  if (v10) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 10, v10);
  }
  uint64_t v20 = (unsigned __int16 *)((char *)a2 - *a2);
  int v22 = *v20 >= 0x15u && (v21 = v20[10]) != 0 && *((unsigned __int8 *)a2 + v21) != 0;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 20, v22, 0);
  unsigned int v23 = 0;
  uint64_t v24 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v24 >= 0x13u)
  {
    uint64_t v25 = v24[9];
    if (v25)
    {
      unsigned int v23 = *((unsigned __int8 *)a2 + v25);
      if (v23 >= 3) {
        abort();
      }
    }
    else
    {
      unsigned int v23 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 18, v23, 0);
  BOOL v26 = 0;
  uint64_t v27 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v27 >= 0x11u)
  {
    uint64_t v28 = v27[8];
    if (v28) {
      BOOL v26 = *((unsigned __int8 *)a2 + v28) != 0;
    }
    else {
      BOOL v26 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 16, v26, 0);
  BOOL v29 = 0;
  float v30 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v30 >= 0xFu)
  {
    uint64_t v31 = v30[7];
    if (v31) {
      BOOL v29 = *((unsigned __int8 *)a2 + v31) != 0;
    }
    else {
      BOOL v29 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 14, v29, 0);
  BOOL v32 = 0;
  uint64_t v33 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v33 >= 5u)
  {
    uint64_t v34 = v33[2];
    if (v34) {
      BOOL v32 = *((unsigned __int8 *)a2 + v34) != 0;
    }
    else {
      BOOL v32 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 4, v32, 0);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v16 - (unsigned __int16)v15 + (unsigned __int16)v14);
}

uint64_t MTLCompilerObject::AIRNTGetTileFunctionScript(uint64_t a1, int *a2, uint64_t a3, int *a4)
{
  if (!a4) {
    return 0;
  }
  int v6 = Air::CloneTileFunctionDescriptor<Air::TileFunctionDescriptor>(a3, a4);
  uint64_t v7 = (unsigned __int16 *)((char *)a2 - *a2);
  unsigned int v8 = *v7;
  if (v8 >= 5 && v7[2]) {
    int v9 = (uint64_t *)((char *)a2 + v7[2]);
  }
  else {
    int v9 = 0;
  }
  if (v8 >= 7 && (uint64_t v10 = v7[3]) != 0) {
    int v11 = *((unsigned __int8 *)a2 + v10);
  }
  else {
    int v11 = 0;
  }
  *(unsigned char *)(a3 + 70) = 1;
  int v12 = *(_DWORD *)(a3 + 32) - *(_DWORD *)(a3 + 48) + *(_DWORD *)(a3 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, 10, v6);
  flatbuffers::FlatBufferBuilder::AddStruct<Air::Version>((flatbuffers::FlatBufferBuilder *)a3, 4, v9);
  unsigned int v13 = flatbuffers::FlatBufferBuilder::PushElement<unsigned char>(a3, 4);
  flatbuffers::FlatBufferBuilder::TrackField((void *)a3, 8, v13);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a3, 6, v11, 0);
  int v14 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v12);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)a3, v14, "AIRF", 0);
  return *(void *)(a3 + 48) + **(unsigned int **)(a3 + 48);
}

uint64_t Air::CloneTileFunctionDescriptor<Air::TileFunctionDescriptor>(uint64_t a1, int *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = -v4;
  int v6 = (unsigned __int16 *)((char *)a2 - v4);
  if (*v6 >= 0x17u && (uint64_t v7 = v6[11]) != 0)
  {
    int v8 = Air::CloneLinkedFunctions<Air::LinkedFunctions>(a1, (int *)((char *)a2 + v7 + *(unsigned int *)((char *)a2 + v7)));
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v8 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 0x11u && *(_WORD *)((char *)a2 + v5 + 16))
  {
    uint64_t v36 = (unsigned int *)((char *)a2
                         + *(unsigned __int16 *)((char *)a2 + v5 + 16)
                         + *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 16)));
    int v9 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_27CloneTileFunctionDescriptorINS3_22TileFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_37TileFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v36, &v36, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v9 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 0xFu && *(_WORD *)((char *)a2 + v5 + 14))
  {
    uint64_t v36 = (unsigned int *)((char *)a2
                         + *(unsigned __int16 *)((char *)a2 + v5 + 14)
                         + *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 14)));
    int v10 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air29TileColorAttachmentDescriptorEEEZNS3_27CloneTileFunctionDescriptorINS3_22TileFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_37TileFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE0_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v36, &v36, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v10 = 0;
  }
  *(unsigned char *)(a1 + 70) = 1;
  int v11 = (unsigned __int16 *)((char *)a2 + v5);
  if (*v11 >= 0xDu && (uint64_t v12 = v11[6]) != 0) {
    uint64_t v13 = *(void *)((char *)a2 + v12);
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 32);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 12, v13, 0);
  uint64_t v17 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v17 >= 0xBu && (uint64_t v18 = v17[5]) != 0) {
    uint64_t v19 = *(void *)((char *)a2 + v18);
  }
  else {
    uint64_t v19 = 1;
  }
  uint64_t v20 = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 10, v19, 1);
  uint64_t v21 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v21 >= 9u)
  {
    uint64_t v22 = v21[4];
    if (v22) {
      uint64_t v20 = *(void *)((char *)a2 + v22);
    }
    else {
      uint64_t v20 = 1;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 8, v20, 1);
  unsigned int v23 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v23 >= 7u && (uint64_t v24 = v23[3]) != 0) {
    uint64_t v25 = *(void *)((char *)a2 + v24);
  }
  else {
    uint64_t v25 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 6, v25, 0);
  if (v8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 22, v8);
  }
  if (v9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 16, v9);
  }
  if (v10) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 14, v10);
  }
  BOOL v26 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v26 >= 0x15u && (uint64_t v27 = v26[10]) != 0)
  {
    unsigned int v28 = *((unsigned __int8 *)a2 + v27);
    if (v28 >= 3) {
      abort();
    }
  }
  else
  {
    unsigned int v28 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 20, v28, 0);
  BOOL v29 = 0;
  float v30 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v30 >= 0x13u)
  {
    uint64_t v31 = v30[9];
    if (v31) {
      BOOL v29 = *((unsigned __int8 *)a2 + v31) != 0;
    }
    else {
      BOOL v29 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 18, v29, 0);
  BOOL v32 = 0;
  uint64_t v33 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v33 >= 5u)
  {
    uint64_t v34 = v33[2];
    if (v34) {
      BOOL v32 = *((unsigned __int8 *)a2 + v34) != 0;
    }
    else {
      BOOL v32 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 4, v32, 0);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v16 - (unsigned __int16)v15 + (unsigned __int16)v14);
}

uint64_t MTLCompilerObject::AIRNTGetObjectFunctionScript(uint64_t a1, int *a2, uint64_t a3, int *a4)
{
  if (!a4) {
    return 0;
  }
  int v6 = Air::CloneObjectFunctionDescriptor<Air::ObjectFunctionDescriptor>(a3, a4);
  uint64_t v7 = (unsigned __int16 *)((char *)a2 - *a2);
  unsigned int v8 = *v7;
  if (v8 >= 5 && v7[2]) {
    int v9 = (uint64_t *)((char *)a2 + v7[2]);
  }
  else {
    int v9 = 0;
  }
  if (v8 >= 7 && (uint64_t v10 = v7[3]) != 0) {
    int v11 = *((unsigned __int8 *)a2 + v10);
  }
  else {
    int v11 = 0;
  }
  *(unsigned char *)(a3 + 70) = 1;
  int v12 = *(_DWORD *)(a3 + 32) - *(_DWORD *)(a3 + 48) + *(_DWORD *)(a3 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, 10, v6);
  flatbuffers::FlatBufferBuilder::AddStruct<Air::Version>((flatbuffers::FlatBufferBuilder *)a3, 4, v9);
  unsigned int v13 = flatbuffers::FlatBufferBuilder::PushElement<unsigned char>(a3, 7);
  flatbuffers::FlatBufferBuilder::TrackField((void *)a3, 8, v13);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a3, 6, v11, 0);
  int v14 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v12);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)a3, v14, "AIRF", 0);
  return *(void *)(a3 + 48) + **(unsigned int **)(a3 + 48);
}

uint64_t Air::CloneObjectFunctionDescriptor<Air::ObjectFunctionDescriptor>(uint64_t a1, int *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = -v4;
  int v6 = (unsigned __int16 *)((char *)a2 - v4);
  if (*v6 >= 0x1Du && (uint64_t v7 = v6[14]) != 0)
  {
    int v8 = Air::CloneLinkedFunctions<Air::LinkedFunctions>(a1, (int *)((char *)a2 + v7 + *(unsigned int *)((char *)a2 + v7)));
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v8 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 0x13u && *(_WORD *)((char *)a2 + v5 + 18))
  {
    unsigned int v47 = (unsigned int *)((char *)a2
                         + *(unsigned __int16 *)((char *)a2 + v5 + 18)
                         + *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 18)));
    int v9 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_29CloneObjectFunctionDescriptorINS3_24ObjectFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_39ObjectFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v47, &v47, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v10 = 1;
  *(unsigned char *)(a1 + 70) = 1;
  int v11 = (unsigned __int16 *)((char *)a2 + v5);
  if (*v11 >= 0xFu)
  {
    uint64_t v12 = v11[7];
    if (v12) {
      uint64_t v10 = *(void *)((char *)a2 + v12);
    }
    else {
      uint64_t v10 = 1;
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 14, v10, 1);
  uint64_t v17 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v17 >= 0xDu)
  {
    uint64_t v18 = v17[6];
    if (v18) {
      uint64_t v16 = *(void *)((char *)a2 + v18);
    }
    else {
      uint64_t v16 = 1;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 12, v16, 1);
  uint64_t v19 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v19 >= 0xBu && (uint64_t v20 = v19[5]) != 0) {
    uint64_t v21 = *(void *)((char *)a2 + v20);
  }
  else {
    uint64_t v21 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 10, v21, 0);
  uint64_t v22 = 0;
  unsigned int v23 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v23 >= 9u)
  {
    uint64_t v24 = v23[4];
    if (v24) {
      uint64_t v22 = *(void *)((char *)a2 + v24);
    }
    else {
      uint64_t v22 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 8, v22, 0);
  uint64_t v25 = 0;
  BOOL v26 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v26 >= 7u)
  {
    uint64_t v27 = v26[3];
    if (v27) {
      uint64_t v25 = *(void *)((char *)a2 + v27);
    }
    else {
      uint64_t v25 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 6, v25, 0);
  if (v8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 28, v8);
  }
  if (v9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 18, v9);
  }
  unsigned int v28 = (unsigned __int16 *)((char *)a2 - *a2);
  v30 = *v28 >= 0x1Bu && (uint64_t v29 = v28[13]) != 0 && *((unsigned __int8 *)a2 + v29) != 0;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 26, v30, 0);
  unsigned int v31 = 0;
  BOOL v32 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v32 >= 0x19u)
  {
    uint64_t v33 = v32[12];
    if (v33)
    {
      unsigned int v31 = *((unsigned __int8 *)a2 + v33);
      if (v31 >= 3) {
LABEL_53:
      }
        abort();
    }
    else
    {
      unsigned int v31 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 24, v31, 0);
  BOOL v34 = 0;
  unsigned __int16 v35 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v35 >= 0x17u)
  {
    uint64_t v36 = v35[11];
    if (v36) {
      BOOL v34 = *((unsigned __int8 *)a2 + v36) != 0;
    }
    else {
      BOOL v34 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 22, v34, 0);
  BOOL v37 = 0;
  uint64_t v38 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v38 >= 0x15u)
  {
    uint64_t v39 = v38[10];
    if (v39) {
      BOOL v37 = *((unsigned __int8 *)a2 + v39) != 0;
    }
    else {
      BOOL v37 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 20, v37, 0);
  unsigned int v40 = 0;
  unsigned int v41 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v41 >= 0x11u)
  {
    uint64_t v42 = v41[8];
    if (v42)
    {
      unsigned int v40 = *((unsigned __int8 *)a2 + v42);
      if (v40 >= 2) {
        goto LABEL_53;
      }
    }
    else
    {
      unsigned int v40 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 16, v40, 0);
  BOOL v43 = 0;
  unsigned int v44 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v44 >= 5u)
  {
    uint64_t v45 = v44[2];
    if (v45) {
      BOOL v43 = *((unsigned __int8 *)a2 + v45) != 0;
    }
    else {
      BOOL v43 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 4, v43, 0);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v15 - (unsigned __int16)v14 + (unsigned __int16)v13);
}

uint64_t MTLCompilerObject::AIRNTGetMeshFunctionScript(uint64_t a1, int *a2, uint64_t a3, int *a4)
{
  if (!a4) {
    return 0;
  }
  int v6 = Air::CloneMeshFunctionDescriptor<Air::MeshFunctionDescriptor>(a3, a4);
  uint64_t v7 = (unsigned __int16 *)((char *)a2 - *a2);
  unsigned int v8 = *v7;
  if (v8 >= 5 && v7[2]) {
    int v9 = (uint64_t *)((char *)a2 + v7[2]);
  }
  else {
    int v9 = 0;
  }
  if (v8 >= 7 && (uint64_t v10 = v7[3]) != 0) {
    int v11 = *((unsigned __int8 *)a2 + v10);
  }
  else {
    int v11 = 0;
  }
  *(unsigned char *)(a3 + 70) = 1;
  int v12 = *(_DWORD *)(a3 + 32) - *(_DWORD *)(a3 + 48) + *(_DWORD *)(a3 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, 10, v6);
  flatbuffers::FlatBufferBuilder::AddStruct<Air::Version>((flatbuffers::FlatBufferBuilder *)a3, 4, v9);
  unsigned int v13 = flatbuffers::FlatBufferBuilder::PushElement<unsigned char>(a3, 8);
  flatbuffers::FlatBufferBuilder::TrackField((void *)a3, 8, v13);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a3, 6, v11, 0);
  int v14 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v12);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)a3, v14, "AIRF", 0);
  return *(void *)(a3 + 48) + **(unsigned int **)(a3 + 48);
}

uint64_t Air::CloneMeshFunctionDescriptor<Air::MeshFunctionDescriptor>(uint64_t a1, int *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = -v4;
  int v6 = (unsigned __int16 *)((char *)a2 - v4);
  if (*v6 >= 0x1Fu && (uint64_t v7 = v6[15]) != 0)
  {
    int v8 = Air::CloneLinkedFunctions<Air::LinkedFunctions>(a1, (int *)((char *)a2 + v7 + *(unsigned int *)((char *)a2 + v7)));
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v8 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 0x13u && *(_WORD *)((char *)a2 + v5 + 18))
  {
    unsigned int v50 = (unsigned int *)((char *)a2
                         + *(unsigned __int16 *)((char *)a2 + v5 + 18)
                         + *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 18)));
    int v9 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_27CloneMeshFunctionDescriptorINS3_22MeshFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_37MeshFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v50, &v50, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v10 = 1;
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 32);
  int v14 = (unsigned __int16 *)((char *)a2 + v5);
  if (*v14 >= 0xFu)
  {
    uint64_t v15 = v14[7];
    if (v15) {
      uint64_t v10 = *(void *)((char *)a2 + v15);
    }
    else {
      uint64_t v10 = 1;
    }
  }
  uint64_t v16 = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 14, v10, 1);
  uint64_t v17 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v17 >= 0xBu)
  {
    uint64_t v18 = v17[5];
    if (v18) {
      uint64_t v16 = *(void *)((char *)a2 + v18);
    }
    else {
      uint64_t v16 = 1;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 10, v16, 1);
  uint64_t v19 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v19 >= 9u && (uint64_t v20 = v19[4]) != 0) {
    uint64_t v21 = *(void *)((char *)a2 + v20);
  }
  else {
    uint64_t v21 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 8, v21, 0);
  uint64_t v22 = 0;
  unsigned int v23 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v23 >= 7u)
  {
    uint64_t v24 = v23[3];
    if (v24) {
      uint64_t v22 = *(void *)((char *)a2 + v24);
    }
    else {
      uint64_t v22 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 6, v22, 0);
  if (v8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 30, v8);
  }
  if (v9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 18, v9);
  }
  uint64_t v25 = (unsigned __int16 *)((char *)a2 - *a2);
  int v27 = *v25 >= 0x1Du && (v26 = v25[14]) != 0 && *((unsigned __int8 *)a2 + v26) != 0;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 28, v27, 0);
  unsigned int v28 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v28 >= 0x1Bu && (uint64_t v29 = v28[13]) != 0) {
    int v30 = *((unsigned __int8 *)a2 + v29);
  }
  else {
    int v30 = 255;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 26, v30, 255);
  unsigned int v31 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v31 >= 0x19u && (uint64_t v32 = v31[12]) != 0)
  {
    unsigned int v33 = *((unsigned __int8 *)a2 + v32);
    if (v33 >= 3) {
LABEL_53:
    }
      abort();
  }
  else
  {
    unsigned int v33 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 24, v33, 0);
  BOOL v34 = 0;
  unsigned __int16 v35 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v35 >= 0x17u)
  {
    uint64_t v36 = v35[11];
    if (v36) {
      BOOL v34 = *((unsigned __int8 *)a2 + v36) != 0;
    }
    else {
      BOOL v34 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 22, v34, 0);
  BOOL v37 = 0;
  uint64_t v38 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v38 >= 0x15u)
  {
    uint64_t v39 = v38[10];
    if (v39) {
      BOOL v37 = *((unsigned __int8 *)a2 + v39) != 0;
    }
    else {
      BOOL v37 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 20, v37, 0);
  unsigned int v40 = 0;
  unsigned int v41 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v41 >= 0x11u)
  {
    uint64_t v42 = v41[8];
    if (v42)
    {
      unsigned int v40 = *((unsigned __int8 *)a2 + v42);
      if (v40 >= 2) {
        goto LABEL_53;
      }
    }
    else
    {
      unsigned int v40 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 16, v40, 0);
  BOOL v43 = (unsigned __int16 *)((char *)a2 - *a2);
  v45 = *v43 < 0xDu || (uint64_t v44 = v43[6]) == 0 || *((unsigned __int8 *)a2 + v44) != 0;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 12, v45, 1);
  BOOL v46 = (unsigned __int16 *)((char *)a2 - *a2);
  v48 = *v46 >= 5u && (uint64_t v47 = v46[2]) != 0 && *((unsigned __int8 *)a2 + v47) != 0;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 4, v48, 0);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v13 - (unsigned __int16)v12 + (unsigned __int16)v11);
}

void MTLCompilerObject::AIRNTGetFunctionScriptFromPipeline(const Air::PipelineScript *a1@<X1>, MTLFunctionType a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v35 = 0;
  unsigned __int8 v36 = 0;
  long long v37 = xmmword_2557AA470;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v40 = 0;
  uint64_t v41 = 1;
  __int16 v42 = 256;
  uint64_t v43 = 0;
  switch(a2)
  {
    case MTLFunctionTypeVertex:
      int v6 = (int *)Air::PipelineScript::pipeline_as_render(a1);
      uint64_t v7 = (unsigned __int16 *)((char *)v6 - *v6);
      if (*v7 >= 9u && (uint64_t v8 = v7[4]) != 0) {
        int v9 = (int *)((char *)v6 + v8 + *(unsigned int *)((char *)v6 + v8));
      }
      else {
        int v9 = 0;
      }
      MTLCompilerObject::AIRNTGetVertexFunctionScript((uint64_t)v6, (int *)a1, (uint64_t)&v35, v9);
      goto LABEL_42;
    case MTLFunctionTypeFragment:
      if (Air::PipelineScript::pipeline_as_render(a1))
      {
        uint64_t v10 = (int *)Air::PipelineScript::pipeline_as_render(a1);
        uint64_t v11 = (unsigned __int16 *)((char *)v10 - *v10);
        if (*v11 >= 0xBu)
        {
          unsigned int v12 = v11[5];
          if (v12)
          {
LABEL_8:
            uint64_t v13 = (int *)((char *)v10 + v12 + *(int *)((char *)v10 + v12));
LABEL_41:
            MTLCompilerObject::AIRNTGetFragmentFunctionScript((uint64_t)v10, (int *)a1, (uint64_t)&v35, v13);
            goto LABEL_42;
          }
        }
LABEL_40:
        uint64_t v13 = 0;
        goto LABEL_41;
      }
      if (Air::PipelineScript::pipeline_as_tile_render(a1)) {
        goto LABEL_32;
      }
      if (Air::PipelineScript::pipeline_as_mesh_render(a1))
      {
        uint64_t v10 = (int *)Air::PipelineScript::pipeline_as_mesh_render(a1);
        int v30 = (unsigned __int16 *)((char *)v10 - *v10);
        if (*v30 >= 0xFu)
        {
          unsigned int v12 = v30[7];
          if (v12) {
            goto LABEL_8;
          }
        }
        goto LABEL_40;
      }
LABEL_42:
      int v31 = v36;
      long long v32 = v38;
      uint64_t v33 = v39;
      uint64_t v34 = (v38 + DWORD2(v38) - v39);
      *(void *)a3 = v35;
      *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x250], 8) = v31;
      *(void *)(a3 + 16) = *((void *)&v32 + 1);
      *(void *)(a3 + 24) = v32;
      *(void *)(a3 + 32) = v33;
      *(void *)(a3 + 40) = v34;
      if (v31)
      {
        uint64_t v35 = 0;
        unsigned __int8 v36 = 0;
      }
      long long v38 = 0u;
      long long v39 = 0u;
      flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)&v35);
      return;
    case MTLFunctionTypeKernel:
      if (Air::PipelineScript::pipeline_as_compute(a1))
      {
        int v14 = (int *)Air::PipelineScript::pipeline_as_compute(a1);
        uint64_t v15 = (unsigned __int16 *)((char *)v14 - *v14);
        if (*v15 >= 7u && (uint64_t v16 = v15[3]) != 0) {
          uint64_t v17 = (int *)((char *)v14 + v16 + *(unsigned int *)((char *)v14 + v16));
        }
        else {
          uint64_t v17 = 0;
        }
        MTLCompilerObject::AIRNTGetComputeFunctionScript((uint64_t)v14, (int *)a1, (uint64_t)&v35, v17);
      }
      else if (Air::PipelineScript::pipeline_as_tile_render(a1))
      {
LABEL_32:
        uint64_t v26 = (int *)Air::PipelineScript::pipeline_as_tile_render(a1);
        int v27 = (unsigned __int16 *)((char *)v26 - *v26);
        if (*v27 >= 7u && (unsigned int v28 = v27[3]) != 0) {
          uint64_t v29 = (int *)((char *)v26 + v28 + *(int *)((char *)v26 + v28));
        }
        else {
          uint64_t v29 = 0;
        }
        MTLCompilerObject::AIRNTGetTileFunctionScript((uint64_t)v26, (int *)a1, (uint64_t)&v35, v29);
      }
      goto LABEL_42;
    case MTLFunctionTypeMesh:
      if (Air::PipelineScript::pipeline_as_mesh_render(a1))
      {
        uint64_t v18 = (int *)Air::PipelineScript::pipeline_as_mesh_render(a1);
        uint64_t v19 = (unsigned __int16 *)((char *)v18 - *v18);
        if (*v19 >= 0xDu && (uint64_t v20 = v19[6]) != 0) {
          uint64_t v21 = (int *)((char *)v18 + v20 + *(unsigned int *)((char *)v18 + v20));
        }
        else {
          uint64_t v21 = 0;
        }
        MTLCompilerObject::AIRNTGetMeshFunctionScript((uint64_t)v18, (int *)a1, (uint64_t)&v35, v21);
      }
      goto LABEL_42;
    case MTLFunctionTypeObject:
      if (Air::PipelineScript::pipeline_as_mesh_render(a1))
      {
        uint64_t v22 = (int *)Air::PipelineScript::pipeline_as_mesh_render(a1);
        unsigned int v23 = (unsigned __int16 *)((char *)v22 - *v22);
        if (*v23 >= 0xBu && (uint64_t v24 = v23[5]) != 0) {
          uint64_t v25 = (int *)((char *)v22 + v24 + *(unsigned int *)((char *)v22 + v24));
        }
        else {
          uint64_t v25 = 0;
        }
        MTLCompilerObject::AIRNTGetObjectFunctionScript((uint64_t)v22, (int *)a1, (uint64_t)&v35, v25);
      }
      goto LABEL_42;
    default:
      goto LABEL_42;
  }
}

void sub_25578B1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t Air::PipelineScript::pipeline_as_compute(Air::PipelineScript *this)
{
  long long v1 = (unsigned __int16 *)((char *)this - *(int *)this);
  unsigned int v2 = *v1;
  if (v2 >= 9 && v1[4] && (v2 >= 0xB ? (v3 = *((unsigned char *)this + v1[4]) == 2) : (v3 = 0), v3 && (uint64_t v4 = v1[5]) != 0)) {
    return (uint64_t)this + v4 + *(unsigned int *)((char *)this + v4);
  }
  else {
    return 0;
  }
}

uint64_t Air::PipelineScript::pipeline_as_tile_render(Air::PipelineScript *this)
{
  long long v1 = (unsigned __int16 *)((char *)this - *(int *)this);
  unsigned int v2 = *v1;
  if (v2 >= 9 && v1[4] && (v2 >= 0xB ? (v3 = *((unsigned char *)this + v1[4]) == 3) : (v3 = 0), v3 && (uint64_t v4 = v1[5]) != 0)) {
    return (uint64_t)this + v4 + *(unsigned int *)((char *)this + v4);
  }
  else {
    return 0;
  }
}

uint64_t Air::PipelineScript::pipeline_as_render(Air::PipelineScript *this)
{
  long long v1 = (unsigned __int16 *)((char *)this - *(int *)this);
  unsigned int v2 = *v1;
  if (v2 >= 9 && v1[4] && (v2 >= 0xB ? (v3 = *((unsigned char *)this + v1[4]) == 1) : (v3 = 0), v3 && (uint64_t v4 = v1[5]) != 0)) {
    return (uint64_t)this + v4 + *(unsigned int *)((char *)this + v4);
  }
  else {
    return 0;
  }
}

void MTLCompilerObject::readVisibleFunctions(uint64_t a1, unsigned int *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7 = a2[36];
  if (v7)
  {
    uint64_t v8 = (unsigned int *)((char *)a2 + a2[37]);
    do
    {
      int v9 = (char *)malloc_type_malloc(0x78uLL, 0x1050040A24A0AE1uLL);
      MTLCompilerObject::getReadParametersFromRequest((uint64_t)v9, (uint64_t)v9, (uint64_t)a2, a3, v8, (uint64_t)a2);
      uint64_t v13 = v9 + 84;
      std::__hash_table<std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>(a4, (unint64_t *)(v9 + 84), (uint64_t)&std::piecewise_construct, &v13)[6] = v9;
      v8 += 14;
      --v7;
    }
    while (v7);
  }
  uint64_t v10 = a2[40];
  if (v10)
  {
    uint64_t v11 = (unsigned int *)((char *)a2 + a2[41]);
    do
    {
      unsigned int v12 = (char *)malloc_type_malloc(0x78uLL, 0x1050040A24A0AE1uLL);
      MTLCompilerObject::getReadParametersFromRequest((uint64_t)v12, (uint64_t)v12, (uint64_t)a2, a3, v11, (uint64_t)a2);
      uint64_t v13 = v12 + 84;
      std::__hash_table<std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>(a4, (unint64_t *)(v12 + 84), (uint64_t)&std::piecewise_construct, &v13)[6] = v12;
      v11 += 14;
      --v10;
    }
    while (v10);
  }
}

uint64_t getRequiredStagesPresentMask(const Air::PipelineScript *this)
{
  long long v1 = (unsigned __int16 *)((char *)this - *(int *)this);
  if (*v1 < 9u) {
    return 0;
  }
  uint64_t v2 = v1[4];
  if (!v2) {
    return 0;
  }
  int v4 = *((unsigned __int8 *)this + v2);
  if ((v4 - 2) < 2) {
    return 2;
  }
  if (v4 != 1)
  {
    if (v4 == 4)
    {
      uint64_t v5 = (int *)Air::PipelineScript::pipeline_as_mesh_render(this);
      int v6 = (unsigned __int16 *)((char *)v5 - *v5);
      if (*v6 >= 9u && (uint64_t v7 = v6[4]) != 0) {
        uint64_t v8 = (char *)v5 + v7 + *(unsigned int *)((char *)v5 + v7);
      }
      else {
        uint64_t v8 = 0;
      }
      int v14 = (int *)Air::PipelineScript::pipeline_as_mesh_render(this);
      uint64_t v15 = (unsigned __int16 *)((char *)v14 - *v14);
      int v16 = 2;
      if (*v15 >= 5u)
      {
        if (v15[2]) {
          int v16 = 6;
        }
        else {
          int v16 = 2;
        }
      }
      return v16 | (v8 != 0);
    }
    return 0;
  }
  uint64_t v10 = (int *)Air::PipelineScript::pipeline_as_render(this);
  uint64_t v11 = (unsigned __int16 *)((char *)v10 - *v10);
  if (*v11 >= 5u && (uint64_t v12 = v11[2]) != 0) {
    uint64_t v13 = (char *)v10 + v12 + *(unsigned int *)((char *)v10 + v12);
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v17 = (int *)Air::PipelineScript::pipeline_as_render(this);
  uint64_t v18 = (unsigned __int16 *)((char *)v17 - *v17);
  BOOL v19 = *v18 >= 7u && v18[3] != 0;
  return v19 | (2 * (v13 != 0));
}

void llvm::SMDiagnostic::~SMDiagnostic(llvm::SMDiagnostic *this)
{
  llvm::SmallVector<llvm::SMFixIt,4u>::~SmallVector((char **)this + 16);
  uint64_t v2 = (void *)*((void *)this + 13);
  if (v2)
  {
    *((void *)this + 14) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 103) < 0) {
    operator delete(*((void **)this + 10));
  }
  if (*((char *)this + 79) < 0) {
    operator delete(*((void **)this + 7));
  }
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
}

uint64_t ___ZL14disableFreezerv_block_invoke()
{
  uint64_t v0 = getpid();
  return MEMORY[0x270EDA490](18, v0, 0, 0, 0);
}

void MTLCompilerPluginInterface::~MTLCompilerPluginInterface(void (**this)(void))
{
  if (this[14]) {
    this[1]();
  }
  uint64_t v2 = this[12];
  if (v2) {
    free(v2);
  }
  BOOL v3 = this[11];
  if (v3) {
    free(v3);
  }
  int v4 = this[15];
  if (v4) {
    dlclose(v4);
  }
  if (this[18]) {
    deleteCompilerHelper();
  }
  if (this[16])
  {
    uint64_t v5 = this[9];
    if (v5) {
      v5();
    }
  }
}

BOOL MTLCompilerPluginInterface::init(MTLCompilerPluginInterface *this, char *__s1, const void *a3, size_t a4)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  *((unsigned char *)this + 137) = 0;
  if (!strncmp(__s1, "simulatorDummyPlugin", 0x15uLL))
  {
    *((void *)this + 11) = strdup(__s1);
    *((void *)this + 15) = 0;
    *((unsigned char *)this + 137) = 1;
    goto LABEL_91;
  }
  if (!*((unsigned char *)this + 136))
  {
    {
      std::string::basic_string[abi:ne180100]<0>(MTLCompilerPluginInterface::init(char const*,void const*,unsigned long)::validPathPrefixes, "/System/Library/Extensions/");
      std::string::basic_string[abi:ne180100]<0>(qword_26B295AB0, "/System/Library/PrivateFrameworks/");
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor, 0, &dword_2556FA000);
    }
    {
      std::string::basic_string[abi:ne180100]<0>(MTLCompilerPluginInterface::init(char const*,void const*,unsigned long)::validPluginSuffixes, ".framework");
      std::string::basic_string[abi:ne180100]<0>(qword_26B295AE0, ".bundle");
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_156, 0, &dword_2556FA000);
    }
    std::string::basic_string[abi:ne180100]<0>(&v54, __s1);
    BOOL v49 = a3;
    size_t v50 = a4;
    if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v10 = &v54;
    }
    else {
      uint64_t v10 = (std::string *)v54.__r_.__value_.__r.__words[0];
    }
    if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int64_t size = HIBYTE(v54.__r_.__value_.__r.__words[2]);
    }
    else {
      int64_t size = v54.__r_.__value_.__l.__size_;
    }
    uint64_t v12 = (std::string *)((char *)v10 + size);
    uint64_t v13 = MTLCompilerPluginInterface::init(char const*,void const*,unsigned long)::validPathPrefixes;
    while (1)
    {
      int v14 = *((char *)v13 + 23);
      uint64_t v15 = v14 >= 0 ? v13 : (uint64_t *)*v13;
      int64_t v16 = v14 >= 0 ? *((unsigned __int8 *)v13 + 23) : v13[1];
      if (!v16) {
        break;
      }
      if (size >= v16)
      {
        int v17 = *(char *)v15;
        int64_t v18 = size;
        BOOL v19 = v10;
        do
        {
          int64_t v20 = v18 - v16;
          if (v20 == -1) {
            break;
          }
          uint64_t v21 = (std::string *)memchr(v19, v17, v20 + 1);
          if (!v21) {
            break;
          }
          uint64_t v22 = v21;
          if (!memcmp(v21, v15, v16))
          {
            if (v22 == v12 || v22 != v10) {
              break;
            }
            goto LABEL_34;
          }
          BOOL v19 = (std::string *)((char *)&v22->__r_.__value_.__l.__data_ + 1);
          int64_t v18 = (char *)v12 - ((char *)&v22->__r_.__value_.__l.__data_ + 1);
        }
        while (v18 >= v16);
      }
      v13 += 3;
      if (v13 == MTLCompilerPluginInterface::init(char const*,void const*,unsigned long)::validPluginSuffixes)
      {
        int v23 = 1;
        goto LABEL_35;
      }
    }
LABEL_34:
    std::string::erase(&v54, 0, v16);
    int v23 = 0;
LABEL_35:
    long long __p = operator new(0x408uLL);
    long long v53 = xmmword_2557AA480;
    bzero(__p, 0x401uLL);
    if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v51, v54.__r_.__value_.__l.__data_, v54.__r_.__value_.__l.__size_);
    }
    else {
      std::string v51 = v54;
    }
    int v48 = v23;
    if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v24 = &v51;
    }
    else {
      uint64_t v24 = (std::string *)v51.__r_.__value_.__r.__words[0];
    }
    if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int64_t v25 = HIBYTE(v51.__r_.__value_.__r.__words[2]);
    }
    else {
      int64_t v25 = v51.__r_.__value_.__l.__size_;
    }
    uint64_t v26 = (char *)v24 + v25;
    int v27 = MTLCompilerPluginInterface::init(char const*,void const*,unsigned long)::validPluginSuffixes;
    while (1)
    {
      int v28 = *((char *)v27 + 23);
      uint64_t v29 = v28 >= 0 ? v27 : (uint64_t *)*v27;
      int64_t v30 = v28 >= 0 ? *((unsigned __int8 *)v27 + 23) : v27[1];
      if (!v30) {
        break;
      }
      if (v25 >= v30)
      {
        int v31 = *(char *)v29;
        int64_t v32 = v25;
        uint64_t v33 = v24;
        while (1)
        {
          int64_t v34 = v32 - v30;
          if (v34 == -1) {
            goto LABEL_53;
          }
          uint64_t v35 = (char *)memchr(v33, v31, v34 + 1);
          if (!v35) {
            goto LABEL_53;
          }
          unsigned __int8 v36 = v35;
          if (!memcmp(v35, v29, v30)) {
            break;
          }
          uint64_t v33 = (std::string *)(v36 + 1);
          int64_t v32 = v26 - (v36 + 1);
          if (v32 < v30) {
            goto LABEL_53;
          }
        }
        if (v36 != v26)
        {
          std::string::size_type v37 = v36 - (char *)v24;
          if (v36 - (char *)v24 != -1) {
            goto LABEL_65;
          }
        }
      }
LABEL_53:
      v27 += 3;
      if (v27 == (uint64_t *)&split_stack_call::backtrace_pcs_mutex) {
        goto LABEL_110;
      }
    }
    std::string::size_type v37 = 0;
LABEL_65:
    std::string::erase(&v51, v37, v25);
    if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v55, v54.__r_.__value_.__l.__data_, v54.__r_.__value_.__l.__size_);
    }
    else {
      std::string v55 = v54;
    }
    if (*((char *)v27 + 23) < 0) {
      uint64_t v38 = v27[1];
    }
    else {
      uint64_t v38 = *((unsigned __int8 *)v27 + 23);
    }
    std::string::erase(&v55, 0, v38 + v37);
    MEMORY[0x25A28E090](&__p, __s1);
    if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v55.__r_.__value_.__l.__data_);
    }
    if (v48)
    {
LABEL_110:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        MTLCompilerPluginInterface::init((uint64_t)__s1);
      }
      abort();
    }
    if (*((void *)this + 15))
    {
      char v39 = 1;
      a3 = v49;
      a4 = v50;
    }
    else
    {
      *((void *)this + 11) = strdup(__s1);
      if (v53 >= 0) {
        p_p = (const char *)&__p;
      }
      else {
        p_p = (const char *)__p;
      }
      uint64_t v41 = dlopen(p_p, 5);
      a3 = v49;
      a4 = v50;
      *((void *)this + 15) = v41;
      if (v41)
      {
        char v39 = 1;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v42 = *((void *)this + 11);
          uint64_t v43 = dlerror();
          MTLCompilerPluginInterface::init(v42, (uint64_t)v43, (uint8_t *)&v55);
        }
        char v39 = 0;
      }
    }
    if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v51.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v53) < 0) {
      operator delete(__p);
    }
    if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v54.__r_.__value_.__l.__data_);
      if ((v39 & 1) == 0) {
        return 0;
      }
    }
    else if ((v39 & 1) == 0)
    {
      return 0;
    }
LABEL_90:
    if (!*((unsigned char *)this + 137))
    {
      *(void *)this = dlsym(*((void **)this + 15), "MTLCompilerCreate");
      *((void *)this + 1) = dlsym(*((void **)this + 15), "MTLCompilerDelete");
      uint64_t v47 = dlsym(*((void **)this + 15), "MTLCompilerBuildRequestWithOptions");
      *((void *)this + 4) = v47;
      if (!v47) {
        *((void *)this + 3) = dlsym(*((void **)this + 15), "MTLCompilerBuildRequest");
      }
      *((void *)this + 10) = dlsym(*((void **)this + 15), "MTLCompilerBuildRequestWithSerializedBitcode");
      *((void *)this + 2) = dlsym(*((void **)this + 15), "MTLCompilerReleaseReply");
      if (*((unsigned char *)this + 136))
      {
        *((void *)this + 5) = dlsym(*((void **)this + 15), "AIRNTEmitPipelineImage");
        *((void *)this + 6) = dlsym(*((void **)this + 15), "AIRNTInitCompilationContext");
        *((void *)this + 7) = dlsym(*((void **)this + 15), "AIRNTDisposeCompilationContext");
        *((void *)this + _Block_object_dispose(&STACK[0x250], 8) = dlsym(*((void **)this + 15), "AIRNTInit");
        *((void *)this + 9) = dlsym(*((void **)this + 15), "AIRNTDispose");
      }
      goto LABEL_92;
    }
LABEL_91:
    *(void *)this = MTLSimCompilerCreate;
    *((void *)this + 1) = MTLSimCompilerDelete;
    *((void *)this + 4) = MTLSimCompilerBuildRequestWithOptions;
    *((void *)this + 2) = MTLSimCompilerReleaseReply;
LABEL_92:
    if (!*((void *)this + 14))
    {
      if (a3)
      {
        uint64_t v44 = malloc_type_malloc(a4, 0xC12905A0uLL);
        *((void *)this + 12) = v44;
        *((void *)this + 13) = a4;
        memcpy(v44, a3, a4);
      }
      *((void *)this + 14) = (*(uint64_t (**)(const void *, size_t))this)(a3, a4);
    }
    if (*((unsigned char *)this + 136) && !*((void *)this + 16))
    {
      int v45 = (uint64_t (*)(void))*((void *)this + 8);
      if (v45) {
        uint64_t v46 = v45();
      }
      else {
        uint64_t v46 = 0;
      }
      *((void *)this + 16) = v46;
    }
    return 1;
  }
  *((void *)this + 11) = strdup(__s1);
  uint64_t v8 = dlopen(__s1, 5);
  *((void *)this + 15) = v8;
  if (v8) {
    goto LABEL_90;
  }
  BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (result)
  {
    MTLCompilerPluginInterface::init((uint64_t *)this + 11);
    return 0;
  }
  return result;
}

void sub_25578BDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (byte_26B295ADF < 0) {
    MTLCompilerPluginInterface::init();
  }
  _Unwind_Resume(a1);
}

void std::vector<FunctionConstantDesc>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 40)
  {
    if (*(char *)(i - 17) < 0) {
      operator delete(*(void **)(i - 40));
    }
  }
  a1[1] = v2;
}

void printDiagnosticError(uint64_t a1, uint64_t a2)
{
  llvm::raw_string_ostream::raw_string_ostream((uint64_t)v4, a2);
  v3[0] = MEMORY[0x263F8BC10] + 16;
  v3[1] = v4;
  (*(void (**)(uint64_t, void *))(*(void *)a1 + 24))(a1, v3);
  if (v6 != v5) {
    llvm::raw_ostream::flush_nonempty((llvm::raw_ostream *)v4);
  }
  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)v4);
}

void sub_25578BF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)va);
  _Unwind_Resume(a1);
}

uint64_t llvm::raw_string_ostream::raw_string_ostream(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x250], 8) = 0;
  *(_DWORD *)(a1 + 56) = 1;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = MEMORY[0x263F8BBF0] + 16;
  *(void *)(a1 + 64) = a2;
  llvm::raw_ostream::SetUnbuffered((llvm::raw_ostream *)a1);
  return a1;
}

void sub_25578BFF8(_Unwind_Exception *a1)
{
  llvm::raw_ostream::~raw_ostream(v1);
  _Unwind_Resume(a1);
}

void logCompileError()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    getSerializedModule();
  }
}

void std::_AllocatorDestroyRangeReverse<std::allocator<MTLArgumentData>,std::reverse_iterator<MTLArgumentData*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<MTLArgumentData>::destroy[abi:ne180100](v3, v1);
      v1 += 288;
    }
    while (v1 != v2);
  }
}

char *serializeOneVertexAttribute(int *a1, char **a2)
{
  size_t v2 = *((void *)a1 + 3);
  size_t v3 = v2 + 1;
  int v4 = a2[2];
  if (__CFADD__(v4, v2 + 1)) {
    goto LABEL_35;
  }
  uint64_t v7 = (const void *)*((void *)a1 + 2);
  size_t v8 = (size_t)a2[1];
  if (v8 >= (unint64_t)&v4[v3])
  {
    int v9 = *a2;
  }
  else
  {
    if (!v8)
    {
      size_t v8 = 128;
      a2[1] = (char *)128;
    }
    while (v8 < (unint64_t)&v4[v3])
    {
      if (v8 >> 1 >= ~v8) {
        size_t v8 = (size_t)&v4[v3];
      }
      else {
        v8 += v8 >> 1;
      }
    }
    int v9 = (char *)malloc_type_realloc(*a2, v8, 0x227314A4uLL);
    *a2 = v9;
    if (!v9) {
      goto LABEL_35;
    }
    a2[1] = (char *)v8;
    int v4 = a2[2];
  }
  memcpy(&v4[(void)v9], v7, v2);
  a2[2][v2 + (void)*a2] = 0;
  unint64_t v10 = (unint64_t)&a2[2][v3];
  a2[2] = (char *)v10;
  if (v10 >= 0xFFFFFFFFFFFFFFFCLL) {
    goto LABEL_35;
  }
  unsigned int v12 = *a1;
  int v11 = a1[1];
  size_t v13 = (size_t)a2[1];
  if (v13 >= v10 + 4)
  {
    int v14 = *a2;
  }
  else
  {
    if (!v13)
    {
      size_t v13 = 128;
      a2[1] = (char *)128;
    }
    while (v13 < v10 + 4)
    {
      if (v13 >> 1 >= ~v13) {
        size_t v13 = v10 + 4;
      }
      else {
        v13 += v13 >> 1;
      }
    }
    int v14 = (char *)malloc_type_realloc(*a2, v13, 0x227314A4uLL);
    *a2 = v14;
    if (!v14) {
      goto LABEL_35;
    }
    a2[1] = (char *)v13;
    unint64_t v10 = (unint64_t)a2[2];
  }
  uint64_t v15 = &v14[v10];
  *(_WORD *)uint64_t v15 = v11;
  void v15[2] = BYTE2(v11);
  v15[3] = ((v12 << 17) & 0x40000000 | (((v12 >> 14) & 1) << 29) & 0x7FFFFFFF | ((v12 >> 3) << 31) | v11) >> 24;
  a2[2] += 4;
  int64_t v16 = (const char *)*((void *)a1 + 4);
  size_t v17 = strlen(v16);
  int v18 = dataTypeFromString(v16, v17);
  unint64_t v19 = (unint64_t)a2[2];
  if (v19 >= 0xFFFFFFFFFFFFFFFCLL) {
    goto LABEL_35;
  }
  int v20 = v18;
  size_t v21 = (size_t)a2[1];
  if (v21 >= v19 + 4)
  {
    BOOL result = *a2;
    goto LABEL_34;
  }
  if (!v21)
  {
    size_t v21 = 128;
    a2[1] = (char *)128;
  }
  while (v21 < v19 + 4)
  {
    if (v21 >> 1 >= ~v21) {
      size_t v21 = v19 + 4;
    }
    else {
      v21 += v21 >> 1;
    }
  }
  BOOL result = (char *)malloc_type_realloc(*a2, v21, 0x227314A4uLL);
  *a2 = result;
  if (!result) {
LABEL_35:
  }
    abort();
  a2[1] = (char *)v21;
  unint64_t v19 = (unint64_t)a2[2];
LABEL_34:
  *(_DWORD *)&result[v19] = v20;
  a2[2] += 4;
  return result;
}

uint64_t SerializedLibraryInfo::serializeStringArraySize(uint64_t a1, long long **a2)
{
  size_t v2 = *a2;
  size_t v3 = a2[1];
  uint64_t v4 = 4;
  while (v2 != v3)
  {
    if (*((char *)v2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)v2, *((void *)v2 + 1));
    }
    else
    {
      long long v5 = *v2;
      v8.__r_.__value_.__r.__words[2] = *((void *)v2 + 2);
      *(_OWORD *)&v8.__r_.__value_.__l.__data_ = v5;
    }
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::size_type size = v8.__r_.__value_.__l.__size_;
      operator delete(v8.__r_.__value_.__l.__data_);
    }
    else
    {
      std::string::size_type size = HIBYTE(v8.__r_.__value_.__r.__words[2]);
    }
    v4 += size + 1;
    size_t v2 = (long long *)((char *)v2 + 24);
  }
  return v4;
}

void SerializedLibraryInfo::serializeStringArray(uint64_t a1, long long **a2, _DWORD *a3)
{
  uint64_t v4 = *a2;
  size_t v3 = a2[1];
  BOOL v5 = v3 == *a2;
  *a3 = -1431655765 * ((unint64_t)((char *)v3 - (char *)*a2) >> 3);
  if (!v5)
  {
    uint64_t v6 = (char *)(a3 + 1);
    do
    {
      if (*((char *)v4 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__src, *(const std::string::value_type **)v4, *((void *)v4 + 1));
      }
      else
      {
        long long v7 = *v4;
        __src.__r_.__value_.__r.__words[2] = *((void *)v4 + 2);
        *(_OWORD *)&__src.__r_.__value_.__l.__data_ = v7;
      }
      if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0)
      {
        int v9 = (void *)__src.__r_.__value_.__r.__words[0];
        strcpy(v6, __src.__r_.__value_.__l.__data_);
        std::string::size_type size = __src.__r_.__value_.__l.__size_;
        operator delete(v9);
      }
      else
      {
        std::string::size_type size = HIBYTE(__src.__r_.__value_.__r.__words[2]);
        strcpy(v6, (const char *)&__src);
      }
      v6 += size + 1;
      uint64_t v4 = (long long *)((char *)v4 + 24);
    }
    while (v4 != v3);
  }
}

llvm::NamedMDNode *getMDNodeForFunctionType(llvm::Module *a1, MTLFunctionType a2)
{
  uint64_t v2 = a2 - 1;
  if (a2 - 1 >= 8 || ((0xF7u >> v2) & 1) == 0) {
    abort();
  }
  size_t v3 = *off_2653C29A0[v2];
  char v4 = 1;
  char v9 = 1;
  if (*v3)
  {
    long long v7 = v3;
    char v4 = 3;
  }
  char v8 = v4;
  BOOL result = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(a1, (const llvm::Twine *)&v7);
  if (result)
  {
    uint64_t v6 = result;
    if (llvm::NamedMDNode::getNumOperands(result)) {
      return (llvm::NamedMDNode *)llvm::NamedMDNode::getOperand(v6);
    }
    else {
      return 0;
    }
  }
  return result;
}

char **llvm::SmallVector<std::string,4u>::~SmallVector(char **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *((unsigned int *)a1 + 2);
  if (v3)
  {
    uint64_t v4 = 24 * v3;
    do
    {
      if (v2[v4 - 1] < 0) {
        operator delete(*(void **)&v2[v4 - 24]);
      }
      v4 -= 24;
    }
    while (v4);
    uint64_t v2 = *a1;
  }
  if (v2 != (char *)(a1 + 2)) {
    free(v2);
  }
  return a1;
}

uint64_t llvm::handleAllErrors<llvm::toString(llvm::Error)::{lambda(llvm::ErrorInfoBase const&)#1}>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  *a1 = 0;
  llvm::handleErrors<llvm::toString(llvm::Error)::{lambda(llvm::ErrorInfoBase const&)#1}>((uint64_t)&v3, a2, &v4);
  uint64_t result = v3;
  if (v3) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return result;
}

void sub_25578C5C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MTLCompilerObject::readModuleFromBinaryRequest();
  }
  _Unwind_Resume(exception_object);
}

uint64_t llvm::handleErrors<llvm::toString(llvm::Error)::{lambda(llvm::ErrorInfoBase const&)#1}>@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *(void **)result;
  if (*(void *)result)
  {
    *(void *)uint64_t result = 0;
    if ((*(unsigned int (**)(void *, void))(*v4 + 48))(v4, MEMORY[0x263F8BBC0]))
    {
      *a3 = 0;
      uint64_t v6 = (uint64_t *)v4[1];
      long long v7 = (uint64_t *)v4[2];
      if (v6 != v7)
      {
        char v8 = 0;
        do
        {
          int v14 = v8;
          *a3 = 0;
          uint64_t v9 = *v6;
          *uint64_t v6 = 0;
          uint64_t v12 = v9;
          llvm::handleErrorImpl<llvm::toString(llvm::Error)::{lambda(llvm::ErrorInfoBase const&)#1}>(&v12, a2, (uint64_t *)&v13);
          llvm::ErrorList::join(&v14, (void ***)&v13, &v15);
          char v8 = v15;
          *a3 = (uint64_t)v15;
          uint64_t v15 = 0;
          if (v13) {
            (*v13)[1]((void **)v13);
          }
          uint64_t v10 = v12;
          uint64_t v12 = 0;
          if (v10) {
            (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
          }
          if (v14) {
            (*((void (**)(void **))*v14 + 1))(v14);
          }
          ++v6;
        }
        while (v6 != v7);
      }
      return (*(uint64_t (**)(void *))(*v4 + 8))(v4);
    }
    else
    {
      int v11 = v4;
      llvm::handleErrorImpl<llvm::toString(llvm::Error)::{lambda(llvm::ErrorInfoBase const&)#1}>((uint64_t *)&v11, a2, a3);
      uint64_t result = (uint64_t)v11;
      int v11 = 0;
      if (result) {
        return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
      }
    }
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

void sub_25578C7C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8))(a10);
  }
  _Unwind_Resume(exception_object);
}

void **llvm::ErrorList::join@<X0>(void ***a1@<X0>, void ***a2@<X1>, void ***a3@<X8>)
{
  uint64_t result = *a1;
  long long v7 = *a2;
  if (!result) {
    goto LABEL_29;
  }
  if (v7)
  {
    if ((*((unsigned int (**)(void **, void))*result + 6))(result, MEMORY[0x263F8BBC0]))
    {
      char v8 = (uint64_t *)*a1;
      if (*a2)
      {
        uint64_t result = (void **)(*((uint64_t (**)(void **, void))**a2 + 6))(*a2, MEMORY[0x263F8BBC0]);
        uint64_t v9 = *a2;
        if (result)
        {
          *a2 = 0;
          uint64_t v10 = (uint64_t *)v9[1];
          int v11 = (uint64_t *)v9[2];
          if (v10 == v11) {
            goto LABEL_22;
          }
          uint64_t v35 = v9;
          uint64_t v12 = v8 + 1;
          size_t v13 = v8 + 3;
          int v14 = (void *)v8[2];
          do
          {
            if ((unint64_t)v14 >= *v13)
            {
              uint64_t v16 = ((uint64_t)v14 - *v12) >> 3;
              if ((unint64_t)(v16 + 1) >> 61) {
                std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v17 = *v13 - *v12;
              uint64_t v18 = v17 >> 2;
              if (v17 >> 2 <= (unint64_t)(v16 + 1)) {
                uint64_t v18 = v16 + 1;
              }
              if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v19 = v18;
              }
              uint64_t v40 = v8 + 3;
              if (v19) {
                int v20 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)(v8 + 3), v19);
              }
              else {
                int v20 = 0;
              }
              size_t v21 = (char *)&v20[v16];
              unsigned __int8 v36 = v20;
              std::string::size_type v37 = v21;
              char v39 = (char *)&v20[v19];
              uint64_t v22 = *v10;
              uint64_t *v10 = 0;
              *(void *)size_t v21 = v22;
              uint64_t v38 = v21 + 8;
              std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__swap_out_circular_buffer(v8 + 1, &v36);
              int v14 = (void *)v8[2];
              uint64_t result = std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::~__split_buffer((void **)&v36);
            }
            else
            {
              uint64_t v15 = *v10;
              uint64_t *v10 = 0;
              *v14++ = v15;
              v8[2] = (uint64_t)v14;
            }
            v8[2] = (uint64_t)v14;
            ++v10;
          }
          while (v10 != v11);
          uint64_t v9 = v35;
          if (v35) {
LABEL_22:
          }
            uint64_t result = (void **)(*((uint64_t (**)(void **))*v9 + 1))(v9);
LABEL_45:
          *a3 = *a1;
          goto LABEL_46;
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
      *a2 = 0;
      uint64_t result = (void **)(v8 + 3);
      unint64_t v25 = v8[3];
      uint64_t v26 = (void ***)v8[2];
      if ((unint64_t)v26 >= v25)
      {
        uint64_t v28 = v8[1];
        uint64_t v29 = ((uint64_t)v26 - v28) >> 3;
        if ((unint64_t)(v29 + 1) >> 61) {
          std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v30 = v25 - v28;
        uint64_t v31 = v30 >> 2;
        if (v30 >> 2 <= (unint64_t)(v29 + 1)) {
          uint64_t v31 = v29 + 1;
        }
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v32 = v31;
        }
        uint64_t v40 = v8 + 3;
        if (v32) {
          uint64_t v33 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)result, v32);
        }
        else {
          uint64_t v33 = 0;
        }
        int64_t v34 = (char *)&v33[v29];
        unsigned __int8 v36 = v33;
        std::string::size_type v37 = v34;
        char v39 = (char *)&v33[v32];
        *(void *)int64_t v34 = v9;
        uint64_t v38 = v34 + 8;
        std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__swap_out_circular_buffer(v8 + 1, &v36);
        int v27 = (void *)v8[2];
        uint64_t result = std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::~__split_buffer((void **)&v36);
      }
      else
      {
        *uint64_t v26 = v9;
        int v27 = v26 + 1;
        v8[2] = (uint64_t)v27;
      }
      v8[2] = (uint64_t)v27;
      goto LABEL_45;
    }
    if (!*a2 || !(*((unsigned int (**)(void **, void))**a2 + 6))(*a2, MEMORY[0x263F8BBC0])) {
      operator new();
    }
    int v23 = (uint64_t *)(*a2 + 1);
    uint64_t v24 = (uint64_t *)*v23;
    unsigned __int8 v36 = *a1;
    *a1 = 0;
    std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::insert(v23, v24, (uint64_t *)&v36);
    uint64_t result = v36;
    unsigned __int8 v36 = 0;
    if (result) {
      uint64_t result = (void **)(*((uint64_t (**)(void **))*result + 1))(result);
    }
    long long v7 = *a2;
LABEL_29:
    *a3 = v7;
    *a2 = 0;
    return result;
  }
  *a3 = result;
LABEL_46:
  *a1 = 0;
  return result;
}

void sub_25578CC7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  if (a12) {
    MTLCompilerObject::readModuleFromBinaryRequest();
  }
  _Unwind_Resume(exception_object);
}

uint64_t llvm::handleErrorImpl<llvm::toString(llvm::Error)::{lambda(llvm::ErrorInfoBase const&)#1}>@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)*a1 + 48))(*a1, MEMORY[0x263F8BB28]);
  uint64_t v7 = *a1;
  *a1 = 0;
  if (result)
  {
    uint64_t v8 = v7;
    llvm::ErrorHandlerTraits<void (&)(llvm::ErrorInfoBase &)>::apply<llvm::toString(llvm::Error)::{lambda(llvm::ErrorInfoBase const&)#1}>(a2, &v8, a3);
    uint64_t result = v8;
    uint64_t v8 = 0;
    if (result) {
      return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
    }
  }
  else
  {
    *a3 = v7;
  }
  return result;
}

void sub_25578CDF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    MTLCompilerObject::readModuleFromBinaryRequest();
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::insert(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = a2;
  unint64_t v6 = a1[1];
  unint64_t v9 = a1[2];
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = v9;
  if (v6 >= v9)
  {
    uint64_t v12 = *a1;
    unint64_t v13 = ((uint64_t)(v6 - *a1) >> 3) + 1;
    if (v13 >> 61) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = ((uint64_t)a2 - v12) >> 3;
    uint64_t v15 = v8 - v12;
    uint64_t v16 = v15 >> 2;
    if (v15 >> 2 <= v13) {
      uint64_t v16 = ((uint64_t)(v6 - *a1) >> 3) + 1;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v16;
    }
    uint64_t v25 = v7;
    if (v17) {
      uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>(v7, v17);
    }
    else {
      uint64_t v18 = 0;
    }
    size_t v21 = v18;
    uint64_t v22 = &v18[8 * v14];
    int v23 = v22;
    uint64_t v24 = &v18[8 * v17];
    std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::push_back(&v21, a3);
    uint64_t v4 = (uint64_t *)std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__swap_out_circular_buffer(a1, &v21, v4);
    std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::~__split_buffer(&v21);
  }
  else if (a2 == (uint64_t *)v6)
  {
    uint64_t v19 = *a3;
    *a3 = 0;
    *a2 = v19;
    a1[1] = (uint64_t)(a2 + 1);
  }
  else
  {
    std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__move_range((uint64_t)a1, a2, v6, (uint64_t)(a2 + 1));
    uint64_t v10 = *a3;
    *a3 = 0;
    uint64_t v11 = *v4;
    uint64_t *v4 = v10;
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    }
  }
  return v4;
}

void sub_25578CF58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = (void *)(a7 - 8);
    unint64_t v9 = (void *)(a7 - 8);
    do
    {
      uint64_t v10 = *--a3;
      *a3 = 0;
      *v9-- = v10;
      *((void *)&v16 + 1) = v8;
      v7 -= 8;
      uint64_t v8 = v9;
    }
    while (a3 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>>::operator()[abi:ne180100]((void *)a1);
  }
  return a1;
}

void *std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>>::operator()[abi:ne180100](void *result)
{
  uint64_t v1 = *(void ***)(result[2] + 8);
  uint64_t v2 = *(void ***)(result[1] + 8);
  while (v1 != v2)
  {
    uint64_t result = *v1;
    *uint64_t v1 = 0;
    if (result) {
      uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
    ++v1;
  }
  return result;
}

void **std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void *std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::__destruct_at_end[abi:ne180100](void *result, uint64_t a2)
{
  uint64_t v2 = result[2];
  if (v2 != a2)
  {
    uint64_t v4 = result;
    do
    {
      v4[2] = v2 - 8;
      uint64_t result = *(void **)(v2 - 8);
      *(void *)(v2 - _Block_object_dispose(&STACK[0x250], 8) = 0;
      if (result) {
        uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
      }
      uint64_t v2 = v4[2];
    }
    while (v2 != a2);
  }
  return result;
}

void *std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__move_range(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v7 = (void *)((char *)v6 + (void)a2 - a4);
  uint64_t v8 = v6;
  if ((unint64_t)v7 < a3)
  {
    unint64_t v9 = v7;
    uint64_t v8 = *(void **)(a1 + 8);
    do
    {
      uint64_t v10 = *v9;
      *v9++ = 0;
      *v8++ = v10;
    }
    while ((unint64_t)v9 < a3);
  }
  *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v8;
  return std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_backward_loop<std::_ClassicAlgPolicy>,std::__move_backward_trivial>,std::unique_ptr<llvm::ErrorInfoBase> *,std::unique_ptr<llvm::ErrorInfoBase> *,std::unique_ptr<llvm::ErrorInfoBase> *,0>(a2, v7, v6);
}

void *std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::push_back(void *result, uint64_t *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = (uint64_t *)result[2];
  if (v4 == (uint64_t *)result[3])
  {
    uint64_t v6 = *result;
    uint64_t v5 = (uint64_t *)result[1];
    uint64_t v7 = (uint64_t)v5 - *v3;
    if ((unint64_t)v5 <= *v3)
    {
      uint64_t v14 = (uint64_t)v4 - v6;
      BOOL v13 = v14 == 0;
      uint64_t v15 = v14 >> 2;
      if (v13) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = v15;
      }
      uint64_t v33 = v3[4];
      unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>(v33, v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      int v20 = (uint64_t *)v3[1];
      uint64_t v21 = v3[2] - (void)v20;
      if (v21)
      {
        uint64_t v22 = v21 >> 3;
        int v23 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * v22;
        uint64_t v25 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v26 = *v20;
          *v20++ = 0;
          *(void *)uint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
        int64x2_t v27 = *(int64x2_t *)(v3 + 1);
      }
      else
      {
        int64x2_t v27 = vdupq_n_s64((unint64_t)v20);
        int v23 = &v17[8 * (v16 >> 2)];
      }
      uint64_t v30 = (void *)*v3;
      void *v3 = v17;
      v3[1] = v19;
      int64x2_t v31 = v27;
      uint64_t v28 = v3[3];
      void v3[2] = v23;
      v3[3] = &v17[8 * v18];
      uint64_t v32 = v28;
      uint64_t result = std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::~__split_buffer(&v30);
      uint64_t v4 = (uint64_t *)v3[2];
    }
    else
    {
      uint64_t v8 = v7 >> 3;
      BOOL v9 = v7 >> 3 < -1;
      uint64_t v10 = (v7 >> 3) + 2;
      if (v9) {
        unint64_t v11 = v10;
      }
      else {
        unint64_t v11 = v8 + 1;
      }
      unint64_t v12 = v11 >> 1;
      uint64_t result = std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::unique_ptr<llvm::ErrorInfoBase> *,std::unique_ptr<llvm::ErrorInfoBase> *,std::unique_ptr<llvm::ErrorInfoBase> *,0>(v5, v4, &v5[-(v11 >> 1)]);
      v3[1] -= 8 * v12;
      void v3[2] = v4;
    }
  }
  uint64_t v29 = *a2;
  *a2 = 0;
  uint64_t *v4 = v29;
  v3[2] += 8;
  return result;
}

uint64_t std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__swap_out_circular_buffer(uint64_t *a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (uint64_t)(a1 + 2);
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>,std::reverse_iterator<std::unique_ptr<llvm::ErrorInfoBase>*>>((uint64_t)(a1 + 2), (uint64_t)a3, a3, *a1, (void *)*a1, v6, v6);
  a2[1] = v8;
  a2[2] = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::unique_ptr<llvm::ErrorInfoBase>*,std::unique_ptr<llvm::ErrorInfoBase>*,std::unique_ptr<llvm::ErrorInfoBase>*>(v7, a3, (uint64_t *)a1[1], (void *)a2[2]);
  uint64_t v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = (void *)a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  unint64_t v11 = (void *)a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

void *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_backward_loop<std::_ClassicAlgPolicy>,std::__move_backward_trivial>,std::unique_ptr<llvm::ErrorInfoBase> *,std::unique_ptr<llvm::ErrorInfoBase> *,std::unique_ptr<llvm::ErrorInfoBase> *,0>(void *a1, void *a2, void *a3)
{
  if (a2 != a1)
  {
    uint64_t v6 = a2;
    do
    {
      uint64_t v8 = *--v6;
      uint64_t v7 = v8;
      *uint64_t v6 = 0;
      uint64_t v10 = *--a3;
      uint64_t v9 = v10;
      *a3 = v7;
      if (v10) {
        (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
      }
    }
    while (v6 != a1);
  }
  return a2;
}

uint64_t *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::unique_ptr<llvm::ErrorInfoBase> *,std::unique_ptr<llvm::ErrorInfoBase> *,std::unique_ptr<llvm::ErrorInfoBase> *,0>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = a1;
  if (a1 != a2)
  {
    do
    {
      uint64_t v6 = *v4;
      uint64_t *v4 = 0;
      uint64_t v7 = *a3;
      *a3 = v6;
      if (v7) {
        (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
      }
      ++v4;
      ++a3;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void *std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::unique_ptr<llvm::ErrorInfoBase>*,std::unique_ptr<llvm::ErrorInfoBase>*,std::unique_ptr<llvm::ErrorInfoBase>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      uint64_t v5 = *a2;
      *a2++ = 0;
      *v4++ = v5;
    }
    while (a2 != a3);
    uint64_t v10 = v4;
  }
  char v8 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::unique_ptr<llvm::ErrorInfoBase>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v7);
  return v4;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::unique_ptr<llvm::ErrorInfoBase>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::unique_ptr<llvm::ErrorInfoBase>*>::operator()[abi:ne180100]((void **)a1);
  }
  return a1;
}

void **std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<llvm::ErrorInfoBase>>,std::unique_ptr<llvm::ErrorInfoBase>*>::operator()[abi:ne180100](void **result)
{
  uint64_t v1 = (void *)*result[2];
  uint64_t v2 = (void *)*result[1];
  while (v1 != v2)
  {
    uint64_t v3 = (void **)*--v1;
    uint64_t result = v3;
    *uint64_t v1 = 0;
    if (v3) {
      uint64_t result = (void **)((uint64_t (*)(void **))(*result)[1])(result);
    }
  }
  return result;
}

uint64_t *llvm::ErrorList::ErrorList(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = MEMORY[0x263F8BC30] + 16;
  a1[1] = 0;
  uint64_t v7 = a1 + 1;
  *a1 = v6;
  a1[2] = 0;
  a1[3] = 0;
  uint64_t v8 = (uint64_t)(a1 + 3);
  uint64_t v28 = a1 + 3;
  uint64_t v9 = std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)(a1 + 3), 1uLL);
  uint64_t v24 = v9;
  uint64_t v25 = (char *)v9;
  int64x2_t v27 = (char *)&v9[v10];
  uint64_t v11 = *a2;
  *a2 = 0;
  void *v9 = v11;
  uint64_t v26 = v9 + 1;
  std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__swap_out_circular_buffer(v7, &v24);
  unint64_t v12 = (void *)a1[2];
  std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::~__split_buffer(&v24);
  unint64_t v13 = a1[3];
  a1[2] = (uint64_t)v12;
  if ((unint64_t)v12 >= v13)
  {
    uint64_t v16 = ((uint64_t)v12 - *v7) >> 3;
    if ((unint64_t)(v16 + 1) >> 61) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v17 = v13 - *v7;
    uint64_t v18 = v17 >> 2;
    if (v17 >> 2 <= (unint64_t)(v16 + 1)) {
      uint64_t v18 = v16 + 1;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v18;
    }
    uint64_t v28 = (void *)v8;
    if (v19) {
      int v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>(v8, v19);
    }
    else {
      int v20 = 0;
    }
    uint64_t v21 = &v20[8 * v16];
    uint64_t v24 = v20;
    uint64_t v25 = v21;
    int64x2_t v27 = &v20[8 * v19];
    uint64_t v22 = *a3;
    *a3 = 0;
    *(void *)uint64_t v21 = v22;
    uint64_t v26 = v21 + 8;
    std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__swap_out_circular_buffer(v7, &v24);
    uint64_t v15 = (void *)a1[2];
    std::__split_buffer<std::unique_ptr<llvm::ErrorInfoBase>>::~__split_buffer(&v24);
  }
  else
  {
    uint64_t v14 = *a3;
    *a3 = 0;
    *unint64_t v12 = v14;
    uint64_t v15 = v12 + 1;
    a1[2] = (uint64_t)v15;
  }
  a1[2] = (uint64_t)v15;
  return a1;
}

void sub_25578D77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void **a14)
{
}

void std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__clear[abi:ne180100](v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void *std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__clear[abi:ne180100](void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = (void *)*result;
  uint64_t v3 = (void *)result[1];
  while (v3 != v2)
  {
    uint64_t v4 = (void *)*--v3;
    uint64_t result = v4;
    void *v3 = 0;
    if (v4) {
      uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
  }
  v1[1] = v2;
  return result;
}

uint64_t *std::unique_ptr<llvm::ErrorList>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    uint64_t v3 = (void **)(v2 + 8);
    std::vector<std::unique_ptr<llvm::ErrorInfoBase>>::__destroy_vector::operator()[abi:ne180100](&v3);
    return (uint64_t *)MEMORY[0x25A28E250](v2, 0xA1C4030951706);
  }
  return result;
}

void llvm::ErrorHandlerTraits<void (&)(llvm::ErrorInfoBase &)>::apply<llvm::toString(llvm::Error)::{lambda(llvm::ErrorInfoBase const&)#1}>(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *a1;
  (*(void (**)(void **__return_ptr, void))(*(void *)*a2 + 24))(__p, *a2);
  unint64_t v5 = llvm::SmallVectorTemplateCommon<std::string,void>::reserveForParamAndGetAddressImpl<llvm::SmallVectorTemplateBase<std::string,false>>(v4, (unint64_t)__p, 1);
  uint64_t v6 = *(void *)v4 + 24 * *(unsigned int *)(v4 + 8);
  long long v7 = *(_OWORD *)v5;
  *(void *)(v6 + 16) = *(void *)(v5 + 16);
  *(_OWORD *)uint64_t v6 = v7;
  *(void *)(v5 + _Block_object_dispose(&STACK[0x250], 8) = 0;
  *(void *)(v5 + 16) = 0;
  *(void *)unint64_t v5 = 0;
  ++*(_DWORD *)(v4 + 8);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  *a3 = 0;
}

void sub_25578D974(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t llvm::SmallVectorTemplateCommon<std::string,void>::reserveForParamAndGetAddressImpl<llvm::SmallVectorTemplateBase<std::string,false>>(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned int *)(a1 + 8);
  if (v3 + a3 > (unint64_t)*(unsigned int *)(a1 + 12))
  {
    unint64_t v5 = *(void *)a1 + 24 * v3;
    if (*(void *)a1 > a2 || v5 <= a2) {
      llvm::SmallVectorTemplateBase<std::string,false>::grow();
    }
    llvm::SmallVectorTemplateBase<std::string,false>::grow();
  }
  return a2;
}

void llvm::SmallVectorTemplateBase<std::string,false>::grow()
{
}

std::string *llvm::detail::join_impl<std::string *>@<X0>(std::string *result@<X0>, std::string *a2@<X1>, const std::string::value_type *a3@<X2>, std::string::size_type a4@<X3>, std::string *a5@<X8>)
{
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  if (result != a2)
  {
    uint64_t v8 = result;
    std::string::size_type v10 = (0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)result) >> 3) - 1) * a4;
    uint64_t v11 = result;
    do
    {
      if (SHIBYTE(v11->__r_.__value_.__r.__words[2]) < 0) {
        std::string::size_type size = v11->__r_.__value_.__l.__size_;
      }
      else {
        std::string::size_type size = HIBYTE(v11->__r_.__value_.__r.__words[2]);
      }
      v10 += size;
      ++v11;
    }
    while (v11 != a2);
    std::string::reserve(a5, v10);
    int v13 = SHIBYTE(v8->__r_.__value_.__r.__words[2]);
    if (v13 >= 0) {
      uint64_t v14 = (const std::string::value_type *)v8;
    }
    else {
      uint64_t v14 = (const std::string::value_type *)v8->__r_.__value_.__r.__words[0];
    }
    if (v13 >= 0) {
      std::string::size_type v15 = HIBYTE(v8->__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v15 = v8->__r_.__value_.__l.__size_;
    }
    uint64_t result = std::string::append(a5, v14, v15);
    for (uint64_t i = v8 + 1; i != a2; ++i)
    {
      std::string::append(a5, a3, a4);
      int v17 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
      if (v17 >= 0) {
        uint64_t v18 = (const std::string::value_type *)i;
      }
      else {
        uint64_t v18 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
      }
      if (v17 >= 0) {
        std::string::size_type v19 = HIBYTE(i->__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v19 = i->__r_.__value_.__l.__size_;
      }
      uint64_t result = std::string::append(a5, v18, v19);
    }
  }
  return result;
}

void sub_25578DB6C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

double ___ZL15logCompileBeginRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERyPKcS7__block_invoke()
{
  mach_timebase_info(&info);
  LODWORD(v0) = info.numer;
  LODWORD(v1) = info.denom;
  double result = (double)v0 / (double)v1;
  gMachTimeToNS = *(void *)&result;
  return result;
}

flatbuffers::FlatBufferBuilder *flatbuffers::FlatBufferBuilder::AddOffset<void>(flatbuffers::FlatBufferBuilder *result, uint64_t a2, int a3)
{
  if (a3)
  {
    unint64_t v5 = result;
    flatbuffers::FlatBufferBuilder::Align(result, 4uLL);
    int v6 = *((_DWORD *)v5 + 8) - *((_DWORD *)v5 + 12) + *((_DWORD *)v5 + 10) - a3 + 4;
    return (flatbuffers::FlatBufferBuilder *)flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v5, a2, v6, 0);
  }
  return result;
}

void *flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(void *result, uint64_t a2, int a3, int a4)
{
  unint64_t v5 = result;
  if (a3 != a4 || *((unsigned char *)result + 80))
  {
    unsigned int v6 = flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)result, a3);
    return flatbuffers::FlatBufferBuilder::TrackField(v5, a2, v6);
  }
  return result;
}

uint64_t flatbuffers::FlatBufferBuilder::PushElement<unsigned int>(uint64_t a1, int a2)
{
  flatbuffers::FlatBufferBuilder::Align((flatbuffers::FlatBufferBuilder *)a1, 4uLL);
  uint64_t v4 = *(void *)(a1 + 48);
  if ((unint64_t)(v4 - *(void *)(a1 + 56)) <= 3)
  {
    flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)a1, 4uLL);
    uint64_t v4 = *(void *)(a1 + 48);
  }
  *(_DWORD *)(v4 - 4) = a2;
  uint64_t v5 = v4 - 4;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x250], 8) = v5;
  return (*(_DWORD *)(a1 + 32) - v5 + *(_DWORD *)(a1 + 40));
}

void *flatbuffers::FlatBufferBuilder::TrackField(void *this, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = this;
  unsigned int v6 = (unint64_t *)this[7];
  if (this[6] - (void)v6 <= 7uLL)
  {
    this = (void *)flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)this, 8uLL);
    unsigned int v6 = (unint64_t *)v5[7];
  }
  *unsigned int v6 = a3 | (unint64_t)(a2 << 32);
  v5[7] += 8;
  ++*((_DWORD *)v5 + 16);
  unsigned int v7 = *((unsigned __int16 *)v5 + 34);
  if (v7 <= a2) {
    LOWORD(v7) = a2;
  }
  *((_WORD *)v5 + 34) = v7;
  return this;
}

void *flatbuffers::FlatBufferBuilder::Align(flatbuffers::FlatBufferBuilder *this, unint64_t a2)
{
  if (*((void *)this + 9) < a2) {
    *((void *)this + 9) = a2;
  }
  return flatbuffers::vector_downward::fill(this, (a2 - 1) & -(uint64_t)(*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10)));
}

void *flatbuffers::vector_downward::fill(void *this, unint64_t a2)
{
  uint64_t v3 = this;
  uint64_t v4 = this[6];
  if (v4 - this[7] >= a2)
  {
    this[6] = v4 - a2;
    if (!a2) {
      return this;
    }
  }
  else
  {
    this = (void *)flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)this, a2);
    v3[6] -= a2;
  }
  uint64_t v5 = 0;
  do
    *(unsigned char *)(v3[6] + v5++) = 0;
  while (a2 != v5);
  return this;
}

uint64_t flatbuffers::vector_downward::reallocate(flatbuffers::vector_downward *this, unint64_t a2)
{
  unint64_t v3 = *((void *)this + 4);
  uint64_t v4 = *((void *)this + 5);
  uint64_t v5 = v3 - *((void *)this + 6) + v4;
  uint64_t v6 = *((void *)this + 7) - v4;
  if (v3) {
    unint64_t v7 = v3 >> 1;
  }
  else {
    unint64_t v7 = *((void *)this + 2);
  }
  if (v7 <= a2) {
    unint64_t v7 = a2;
  }
  uint64_t v8 = (*((void *)this + 3) + v3 + v7 - 1) & -*((void *)this + 3);
  *((void *)this + 4) = v8;
  uint64_t v9 = *(void *)this;
  if (v4)
  {
    if (!v9)
    {
      unint64_t v12 = &unk_270454500;
      operator new[]();
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t, void, void))(*(void *)v9 + 32))(v9, v4, v3, v8, v5, v6);
  }
  else
  {
    if (!v9)
    {
      unint64_t v12 = &unk_270454500;
      operator new[]();
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 16))(v9, v8);
  }
  uint64_t v11 = result + *((void *)this + 4) - v5;
  *((void *)this + 5) = result;
  *((void *)this + 6) = v11;
  *((void *)this + 7) = result + v6;
  return result;
}

char *flatbuffers::Allocator::reallocate_downward(flatbuffers::Allocator *this, unsigned __int8 *a2, uint64_t a3, uint64_t a4, size_t a5, size_t a6)
{
  unint64_t v12 = (char *)(*(uint64_t (**)(flatbuffers::Allocator *, uint64_t))(*(void *)this + 16))(this, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(flatbuffers::Allocator *, unsigned __int8 *, uint64_t))(*(void *)this + 24))(this, a2, a3);
  return v12;
}

void flatbuffers::DefaultAllocator::~DefaultAllocator(flatbuffers::DefaultAllocator *this)
{
}

void flatbuffers::DefaultAllocator::allocate(flatbuffers::DefaultAllocator *this)
{
}

void flatbuffers::DefaultAllocator::deallocate(flatbuffers::DefaultAllocator *this, unsigned __int8 *a2)
{
  if (a2) {
    JUMPOUT(0x25A28E230);
  }
}

flatbuffers::FlatBufferBuilder *flatbuffers::FlatBufferBuilder::AddStruct<Air::Version>(flatbuffers::FlatBufferBuilder *result, uint64_t a2, uint64_t *a3)
{
  if (a3)
  {
    uint64_t v5 = result;
    flatbuffers::FlatBufferBuilder::Align(result, 4uLL);
    uint64_t v6 = *((void *)v5 + 6);
    if ((unint64_t)(v6 - *((void *)v5 + 7)) <= 0xB)
    {
      flatbuffers::vector_downward::reallocate(v5, 0xCuLL);
      uint64_t v6 = *((void *)v5 + 6);
    }
    *((void *)v5 + 6) = v6 - 12;
    uint64_t v7 = *a3;
    *(_DWORD *)(v6 - 4) = *((_DWORD *)a3 + 2);
    *(void *)(v6 - 12) = v7;
    unsigned int v8 = *((_DWORD *)v5 + 8) - *((_DWORD *)v5 + 12) + *((_DWORD *)v5 + 10);
    return (flatbuffers::FlatBufferBuilder *)flatbuffers::FlatBufferBuilder::TrackField(v5, a2, v8);
  }
  return result;
}

void *flatbuffers::FlatBufferBuilder::AddElement<unsigned char>(void *result, uint64_t a2, int a3, int a4)
{
  uint64_t v5 = result;
  if (a3 != a4 || *((unsigned char *)result + 80))
  {
    unsigned int v6 = flatbuffers::FlatBufferBuilder::PushElement<unsigned char>((uint64_t)result, a3);
    return flatbuffers::FlatBufferBuilder::TrackField(v5, a2, v6);
  }
  return result;
}

uint64_t flatbuffers::FlatBufferBuilder::PushElement<unsigned char>(uint64_t a1, char a2)
{
  flatbuffers::FlatBufferBuilder::Align((flatbuffers::FlatBufferBuilder *)a1, 1uLL);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 == *(void *)(a1 + 56))
  {
    flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)a1, 1uLL);
    uint64_t v4 = *(void *)(a1 + 48);
  }
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x250], 8) = v4 - 1;
  *(unsigned char *)(v4 - 1) = a2;
  return (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
}

uint64_t flatbuffers::FlatBufferBuilder::EndTable(flatbuffers::FlatBufferBuilder *this, __int16 a2)
{
  uint64_t v4 = flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, 0);
  if ((unsigned __int16)(*((_WORD *)this + 34) + 2) <= 4u) {
    unint64_t v5 = 4;
  }
  else {
    unint64_t v5 = (unsigned __int16)(*((_WORD *)this + 34) + 2);
  }
  *((_WORD *)this + 34) = v5;
  uint64_t v6 = *((void *)this + 6);
  if (v6 - *((void *)this + 7) < v5)
  {
    flatbuffers::vector_downward::reallocate(this, v5);
    uint64_t v6 = *((void *)this + 6);
  }
  *((void *)this + 6) = v6 - v5;
  bzero((void *)(v6 - v5), v5);
  unsigned __int16 v7 = v4 - a2;
  uint64_t v9 = (unsigned __int16 *)*((void *)this + 6);
  unint64_t v8 = *((void *)this + 7);
  v9[1] = v7;
  unsigned __int16 *v9 = *((_WORD *)this + 34);
  uint64_t v10 = *((unsigned int *)this + 16);
  uint64_t v11 = (char *)(v8 - 8 * v10);
  if (v10)
  {
    unint64_t v12 = (_WORD *)(v8 - 8 * v10);
    do
    {
      *(unsigned __int16 *)((char *)v9 + (unsigned __int16)v12[2]) = v4 - *v12;
      v12 += 4;
    }
    while ((unint64_t)v12 < v8);
  }
  *((void *)this + 7) = v11;
  *((_DWORD *)this + 16) = 0;
  *((_WORD *)this + 34) = 0;
  uint64_t v13 = *((void *)this + 4);
  unint64_t v14 = *((void *)this + 5);
  int v15 = v13 - v9 + v14;
  if (*((unsigned char *)this + 81) && v14 < (unint64_t)v11)
  {
    size_t v16 = *v9;
    uint64_t v17 = v14 + v13;
    uint64_t v18 = (unsigned int *)*((void *)this + 5);
    while (1)
    {
      uint64_t v19 = *v18;
      if (v16 == *(unsigned __int16 *)(v17 - v19) && !memcmp((const void *)(v17 - v19), v9, v16)) {
        break;
      }
      if (++v18 >= (unsigned int *)v11)
      {
        int v15 = v13 - v9 + v14;
        goto LABEL_17;
      }
    }
    uint64_t v9 = (unsigned __int16 *)((char *)v9 + (v13 - v9 + v14 - v4));
    *((void *)this + 6) = v9;
    int v15 = v19;
  }
LABEL_17:
  if (v15 == v13 + v14 - v9)
  {
    if ((unint64_t)((char *)v9 - v11) <= 3)
    {
      flatbuffers::vector_downward::reallocate(this, 4uLL);
      uint64_t v11 = (char *)*((void *)this + 7);
      uint64_t v13 = *((void *)this + 4);
      unint64_t v14 = *((void *)this + 5);
    }
    *(_DWORD *)uint64_t v11 = v15;
    *((void *)this + 7) = v11 + 4;
  }
  *(_DWORD *)(v14 + v13 - v4) = v15 - v4;
  *((unsigned char *)this + 70) = 0;
  return v4;
}

uint64_t flatbuffers::FlatBufferBuilder::Finish(flatbuffers::FlatBufferBuilder *this, int a2, const char *a3, int a4)
{
  *((void *)this + 7) = *((void *)this + 5);
  uint64_t v8 = 4;
  if (a4) {
    uint64_t v8 = 8;
  }
  flatbuffers::FlatBufferBuilder::PreAlign(this, v8 + 4 * (a3 != 0), *((void *)this + 9));
  if (a3)
  {
    uint64_t v9 = *((void *)this + 6);
    if ((unint64_t)(v9 - *((void *)this + 7)) <= 3)
    {
      flatbuffers::vector_downward::reallocate(this, 4uLL);
      uint64_t v9 = *((void *)this + 6);
    }
    *((void *)this + 6) = v9 - 4;
    *(_DWORD *)(v9 - 4) = *(_DWORD *)a3;
  }
  flatbuffers::FlatBufferBuilder::Align(this, 4uLL);
  uint64_t result = flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, *((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10) - a2 + 4);
  if (a4) {
    uint64_t result = flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, *((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10));
  }
  *((unsigned char *)this + 71) = 1;
  return result;
}

void *flatbuffers::FlatBufferBuilder::PreAlign(flatbuffers::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  if (*((void *)this + 9) < a3) {
    *((void *)this + 9) = a3;
  }
  return flatbuffers::vector_downward::fill(this, (a3 - 1) & (-a2 - (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10))));
}

void *flatbuffers::vector_downward::push(void *this, const unsigned __int8 *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v5 = this;
    uint64_t v6 = this[6];
    if (v6 - this[7] < a3)
    {
      flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)this, a3);
      uint64_t v6 = v5[6];
    }
    v5[6] = v6 - a3;
    return memcpy((void *)(v6 - a3), __src, a3);
  }
  return this;
}

void flatbuffers::FlatBufferBuilder::~FlatBufferBuilder(flatbuffers::FlatBufferBuilder *this)
{
  uint64_t v2 = *((void *)this + 11);
  if (v2)
  {
    std::__tree<std::__value_type<llvm::Function *,llvm::Value *>,std::__map_value_compare<llvm::Function *,std::__value_type<llvm::Function *,llvm::Value *>,std::less<llvm::Function *>,true>,std::allocator<std::__value_type<llvm::Function *,llvm::Value *>>>::destroy(*((void *)this + 11), *(void **)(v2 + 8));
    MEMORY[0x25A28E250](v2, 0x1060C40C2B13FB5);
  }
  flatbuffers::vector_downward::~vector_downward(this);
}

void flatbuffers::vector_downward::~vector_downward(flatbuffers::vector_downward *this)
{
  if (*((unsigned char *)this + 8) && *(void *)this) {
    (*(void (**)(void))(**(void **)this + 8))(*(void *)this);
  }
  *(void *)this = 0;
  *((unsigned char *)this + _Block_object_dispose(&STACK[0x250], 8) = 0;
}

void *flatbuffers::vector_downward::clear_buffer(void *this)
{
  unint64_t v1 = this;
  uint64_t v2 = this[5];
  if (v2)
  {
    uint64_t v3 = *this;
    if (*v1)
    {
      this = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 24))(v3);
    }
    else
    {
      uint64_t v4 = &unk_270454500;
      this = (void *)MEMORY[0x25A28E230](v2, 0x1000C8077774924);
    }
  }
  v1[5] = 0;
  return this;
}

void flatbuffers::DetachedBuffer::~DetachedBuffer(flatbuffers::DetachedBuffer *this)
{
  uint64_t v3 = (_OWORD *)((char *)this + 16);
  uint64_t v2 = *((void *)this + 2);
  if (v2)
  {
    uint64_t v4 = *(void *)this;
    if (*(void *)this) {
      (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
    }
    else {
      MEMORY[0x25A28E230](v2, 0x1000C8077774924);
    }
  }
  if (*((unsigned char *)this + 8) && *(void *)this) {
    (*(void (**)(void))(**(void **)this + 8))(*(void *)this);
  }
  *(void *)this = 0;
  *((unsigned char *)this + _Block_object_dispose(&STACK[0x250], 8) = 0;
  _OWORD *v3 = 0u;
  v3[1] = 0u;
}

void *std::__hash_table<std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,ReadModuleParameters *>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == *a2 && i[3] == a2[1] && i[4] == a2[2] && i[5] == a2[3]) {
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
  uint64_t i = operator new(0x38uLL);
  *uint64_t i = 0;
  i[1] = v7;
  long long v16 = (*a4)[1];
  *((_OWORD *)i + 1) = **a4;
  *((_OWORD *)i + 2) = v16;
  i[6] = 0;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v8 || (float)(v18 * (float)v8) < v17)
  {
    BOOL v19 = 1;
    if (v8 >= 3) {
      BOOL v19 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v8);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::__rehash<true>(a1, v22);
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
  uint64_t v23 = *(void *)a1;
  uint64_t v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *uint64_t i = *v24;
LABEL_48:
    void *v24 = i;
    goto LABEL_49;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v23 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v25 >= v8) {
        v25 %= v8;
      }
    }
    else
    {
      v25 &= v8 - 1;
    }
    uint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_48;
  }
LABEL_49:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_25578EAAC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

char **llvm::SmallVector<llvm::SMFixIt,4u>::~SmallVector(char **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *((unsigned int *)a1 + 2);
  if (v3)
  {
    uint64_t v4 = 40 * v3;
    do
    {
      if (v2[v4 - 1] < 0) {
        operator delete(*(void **)&v2[v4 - 24]);
      }
      v4 -= 40;
    }
    while (v4);
    uint64_t v2 = *a1;
  }
  if (v2 != (char *)(a1 + 2)) {
    free(v2);
  }
  return a1;
}

uint64_t fatalErrorHandler(void *a1, char *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&__str, a2);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    p_str = &__str;
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = p_str;
    _os_log_error_impl(&dword_2556FA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "LLVM ERROR: %s", buf, 0xCu);
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "Cannot select:");
  DWORD2(v31) = 10;
  std::string::basic_string[abi:ne180100]<0>(&v32, "unable to lower arguments");
  DWORD2(v33) = 10;
  std::string::basic_string[abi:ne180100]<0>(v34, "unable to translate");
  int v35 = 21;
  std::string::basic_string[abi:ne180100]<0>(v36, "cannot select");
  int v37 = 21;
  std::string::basic_string[abi:ne180100]<0>(v38, "unable to legalize");
  int v39 = 21;
  unint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v24 = 0;
  size_t v22 = (void **)&v24;
  LOBYTE(v23) = 0;
  uint64_t v3 = 0;
  uint64_t v24 = (std::string *)operator new(0xA0uLL);
  unint64_t v25 = v24;
  uint64_t v26 = &v24[6].__r_.__value_.__s.__data_[16];
  uint64_t v28 = v24;
  uint64_t v29 = v24;
  *(void *)md = &v26;
  uint64_t v41 = (void **)&v28;
  uint64_t v42 = (void **)&v29;
  uint64_t v4 = v24;
  char v43 = 0;
  do
  {
    unint64_t v5 = &buf[v3];
    if (*((char *)&v31 + v3 + 7) < 0)
    {
      std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v5, *((void *)v5 + 1));
      unint64_t v7 = v29;
    }
    else
    {
      long long v6 = *(_OWORD *)v5;
      v4->__r_.__value_.__r.__words[2] = *((void *)v5 + 2);
      *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v6;
      unint64_t v7 = v4;
    }
    LODWORD(v4[1].__r_.__value_.__l.__data_) = *(_DWORD *)((char *)&v31 + v3 + 8);
    uint64_t v4 = (std::string *)((char *)v7 + 32);
    uint64_t v29 = (std::string *)((char *)v7 + 32);
    v3 += 32;
  }
  while (v3 != 160);
  char v43 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<fatalErrorHandler(void *,char const*,BOOL)::CollectInfo>,fatalErrorHandler(void *,char const*,BOOL)::CollectInfo*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)md);
  uint64_t v8 = 0;
  unint64_t v25 = v4;
  do
  {
    if (SHIBYTE(v38[v8 + 2]) < 0) {
      operator delete((void *)v38[v8]);
    }
    v8 -= 4;
  }
  while (v8 != -20);
  uint64_t v9 = std::find_if[abi:ne180100]<std::__wrap_iter<fatalErrorHandler(void *,char const*,BOOL)::CollectInfo *>,fatalErrorHandler(void *,char const*,BOOL)::$_0>((uint64_t)v24, (uint64_t)v25, (const void **)&__str.__r_.__value_.__l.__data_);
  if (v25 == (std::string *)v9)
  {
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v10 = &__str;
    }
    else {
      uint64_t v10 = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      CC_LONG v11 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    }
    else {
      CC_LONG v11 = __str.__r_.__value_.__r.__words[1];
    }
    CC_SHA256(v10, v11, md);
    *(_OWORD *)buf = xmmword_2557AA490;
    long long v31 = unk_2557AA4A0;
    long long v32 = xmmword_2557AA4B0;
    long long v33 = unk_2557AA4C0;
    std::vector<fatalErrorHandler(void *,char const*,BOOL)::AllowHashInfo,std::allocator<fatalErrorHandler(void *,char const*,BOOL)::AllowHashInfo>>::vector[abi:ne180100](&v22, buf, 2uLL);
    for (uint64_t i = v22; i != v23; i += 4)
    {
      uint64_t v21 = 0;
      while (*((unsigned __int8 *)i + v21) == md[v21])
      {
        if (++v21 == 32)
        {
          uint64_t result = abort_with_reason();
          goto LABEL_41;
        }
      }
    }
    uint64_t v13 = (void *)[@"Error message SHA256: " mutableCopy];
    for (uint64_t j = 0; j != 32; ++j)
      objc_msgSend(v13, "appendFormat:", @"%02x", md[j]);
    [v13 UTF8String];
    uint64_t result = abort_with_reason();
  }
  else
  {
    std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    float v17 = &__str;
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
      float v17 = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    if (size)
    {
      int v19 = 0;
      unint64_t v20 = (std::string *)((char *)v17 + size);
      float v18 = v17;
      while (v18->__r_.__value_.__s.__data_[0] != 10 || ++v19 < *(_DWORD *)(v9 + 24))
      {
        float v18 = (std::string *)((char *)v18 + 1);
        if (!--size)
        {
          float v18 = v20;
          break;
        }
      }
    }
    else
    {
      float v18 = v17;
    }
    std::string::basic_string((std::string *)buf, &__str, 0, (char *)v18 - (char *)v17, (std::allocator<char> *)md);
    uint64_t result = abort_with_reason();
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_25578EF54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,char *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (__p) {
    operator delete(__p);
  }
  a24 = &a13;
  std::vector<fatalErrorHandler(void *,char const*,BOOL)::CollectInfo,std::allocator<fatalErrorHandler(void *,char const*,BOOL)::CollectInfo>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a24);
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(a1);
}

void std::vector<char *>::push_back[abi:ne180100](void **a1, void *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((char *)v7 - (unsigned char *)*a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - (void)*a1;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    unint64_t v14 = &v13[8 * v9];
    int v15 = &v13[8 * v12];
    *(void *)unint64_t v14 = *a2;
    uint64_t v8 = v14 + 8;
    float v17 = (char *)*a1;
    long long v16 = (char *)a1[1];
    if (v16 != *a1)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      long long v16 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    void *v7 = *a2;
    uint64_t v8 = v7 + 1;
  }
  a1[1] = v8;
}

void createLibraryInfo()
{
}

void sub_25578F338(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 33) < 0) {
    operator delete(*(void **)(v33 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t MTLCompilerObject::logCompilerFailure(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v26 = a2;
  unint64_t v27 = a3;
  if (a3 <= 7
    || ((uint64_t v6 = *a2, v28 = 8, !v6)
      ? (uint64_t v7 = 0)
      : (uint64_t v7 = DeserialContext::stringFromSerializedData((DeserialContext *)&v26)),
        (uint64_t v8 = [(id)gReplayLogDirectory stringByAppendingString:v7], v27 > v28)
      ? (BOOL v9 = v27 - v28 > 7)
      : (BOOL v9 = 0),
        !v9))
  {
LABEL_29:
    abort();
  }
  uint64_t v10 = v26;
  size_t v11 = *(void *)((char *)v26 + v28);
  unint64_t v12 = v28 + 8;
  v28 += 8;
  if (v11)
  {
    if (v12 >= v27) {
      goto LABEL_29;
    }
    unint64_t v28 = v11 + v12;
    if (v11 + v12 > v27) {
      goto LABEL_29;
    }
    uint64_t v13 = (void *)v8;
    id v25 = 0;
    unint64_t v14 = (void *)[MEMORY[0x263F08850] defaultManager];
    if ([v14 createDirectoryAtPath:gReplayLogDirectory withIntermediateDirectories:1 attributes:0 error:&v25])
    {
      int v15 = fopen((const char *)[v13 UTF8String], "wb");
      if (v15)
      {
        long long v16 = v15;
        size_t v17 = fwrite((char *)v10 + v12, 1uLL, v11, v15);
        fclose(v16);
        if (v17 == v11)
        {
          uint64_t v18 = malloc_type_malloc(1uLL, 0xCB5EF656uLL);
          unsigned char *v18 = 1;
          return (*(uint64_t (**)(uint64_t, void, unsigned char *, uint64_t, void))(a4 + 16))(a4, 0, v18, 1, 0);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          MTLCompilerObject::logCompilerFailure(v13);
        }
        uint64_t v24 = (char **)(a1 + 120);
        [v13 UTF8String];
        MTLCompilerErrorObject::setFormattedErrorMessage(v24, "Failed to write log file (wrote %llu bytes, expected %llu bytes): %s");
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          MTLCompilerObject::logCompilerFailure(v13);
        }
        uint64_t v24 = (char **)(a1 + 120);
        [v13 UTF8String];
        MTLCompilerErrorObject::setFormattedErrorMessage(v24, "Failure to create log file: %s");
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        MTLCompilerObject::logCompilerFailure(&v25);
      }
      uint64_t v24 = (char **)(a1 + 120);
      objc_msgSend((id)objc_msgSend(v25, "localizedDescription"), "UTF8String");
      MTLCompilerErrorObject::setFormattedErrorMessage(v24, "Failure to create log directory: %s");
    }
    uint64_t v21 = *v24;
    unint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, void, void, const char *))(a4 + 16);
    uint64_t v22 = a4;
    uint64_t v23 = 2;
  }
  else
  {
    unint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, void, void, const char *))(a4 + 16);
    uint64_t v21 = "MTLCompilerService received an empty replay block to log";
    uint64_t v22 = a4;
    uint64_t v23 = 1;
  }
  return v20(v22, v23, 0, 0, v21);
}

uint64_t MTLCompilerObject::generateMachO(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v191 = *MEMORY[0x263EF8340];
  long long v181 = 0u;
  long long v182 = 0u;
  int v183 = 1065353216;
  uint64_t v179 = 0;
  v180 = 0;
  long long v177 = 0;
  long long v178 = 0;
  if (*(_DWORD *)(a2 + 88))
  {
    uint64_t DynamicLibraryWriter = MTLGPUArchiverFromId();
  }
  else
  {
    if (*(unsigned char *)(a2 + 128)) {
      uint64_t DynamicLibraryWriter = MTLGPUArchiverCreateDynamicLibraryWriter();
    }
    else {
      uint64_t DynamicLibraryWriter = MTLGPUArchiverCreateExecutableWriter();
    }
    MTLGPUArchiverToId();
  }
  if (!DynamicLibraryWriter)
  {
    long long __p = 0;
    if (!MTLGPUArchiverDeleteWithId())
    {
      LODWORD(v176) = 16;
      MTLBuildRequestTypeToString(&v176, buf);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        MTLCompilerObject::generateMachO(a1);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      free(__p);
    }
    LODWORD(v176) = 16;
    MTLBuildRequestTypeToString(&v176, buf);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      MTLCompilerObject::generateMachO(a1);
    }
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    (*(void (**)(uint64_t, uint64_t, void, void, void *))(a4 + 16))(a4, 2, 0, 0, v180);
    free(v180);
    goto LABEL_320;
  }
  v180 = 0;
  if (!MTLGPUArchiverAddTool())
  {
    long long __p = 0;
    if (!MTLGPUArchiverDeleteWithId())
    {
      LODWORD(v176) = 16;
      MTLBuildRequestTypeToString(&v176, buf);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        MTLCompilerObject::generateMachO(a1);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      free(__p);
    }
    LODWORD(v176) = 16;
    MTLBuildRequestTypeToString(&v176, buf);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      MTLCompilerObject::generateMachO(a1);
    }
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    goto LABEL_122;
  }
  if (*(_DWORD *)(a2 + 116))
  {
    if (!LLVMCreateMemoryBufferWithMemoryRange())
    {
      long long v176 = 0;
      if (!MTLGPUArchiverDeleteWithId())
      {
        LODWORD(__p) = 16;
        MTLBuildRequestTypeToString(&__p, buf);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          MTLCompilerObject::generateMachO(a1);
        }
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        free(v176);
      }
      strcpy(buf, "Unable to store metal script");
      LODWORD(v172) = 16;
      MTLBuildRequestTypeToString(&v172, &__p);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        MTLCompilerObject::generateMachO(a1);
      }
      if (v175 < 0) {
        operator delete(__p);
      }
      (*(void (**)(uint64_t, uint64_t, void, void, void *))(a4 + 16))(a4, 2, 0, 0, v180);
      MTLGPUArchiverDestroy();
      goto LABEL_320;
    }
    int v5 = MTLGPUArchiverAddDescriptor();
    LLVMDisposeMemoryBuffer();
    if (!v5)
    {
      long long __p = 0;
      if (!MTLGPUArchiverDeleteWithId())
      {
        LODWORD(v176) = 16;
        MTLBuildRequestTypeToString(&v176, buf);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          MTLCompilerObject::generateMachO(a1);
        }
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        free(__p);
      }
      LODWORD(v176) = 16;
      MTLBuildRequestTypeToString(&v176, buf);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        MTLCompilerObject::generateMachO(a1);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
LABEL_122:
      (*(void (**)(uint64_t, uint64_t, void, void, void *))(a4 + 16))(a4, 2, 0, 0, v180);
      free(v180);
      MTLGPUArchiverDestroy();
      goto LABEL_320;
    }
  }
  uint64_t v167 = a2;
  if (!*(_DWORD *)(a2 + 108))
  {
LABEL_22:
    uint64_t v14 = v167;
    int v15 = malloc_type_malloc(8 * *(void *)(v167 + 8), 0x90BEEB8DuLL);
    long long v16 = v15;
    if (*(void *)(v167 + 8))
    {
      uint64_t v17 = 0;
      int v166 = 0;
      uint64_t v163 = v15;
      while (1)
      {
        uint64_t v18 = v14 + 104 * v17;
        int v19 = (const char *)(v14 + *(void *)(v18 + 152) + 4);
        int v20 = strncmp(v19, "AIRC", 4uLL);
        int v21 = strncmp(v19, "AIRS", 4uLL);
        if (*(unsigned char *)(v14 + 128) == 1)
        {
          *(void *)buf = 0;
          buf[8] = 0;
          *(_OWORD *)&uint8_t buf[16] = xmmword_2557AA470;
          uint64_t v187 = 0x1000000000000;
          long long v185 = 0u;
          long long v186 = 0u;
          uint64_t v188 = 1;
          __int16 v189 = 256;
          uint64_t v190 = 0;
          long long __p = (void *)0x100000000;
          int v174 = 0;
          flatbuffers::FlatBufferBuilder::AddStruct<Air::Version>((flatbuffers::FlatBufferBuilder *)buf, 4, (uint64_t *)&__p);
          unsigned int v22 = flatbuffers::FlatBufferBuilder::PushElement<unsigned char>((uint64_t)buf, 2);
          flatbuffers::FlatBufferBuilder::TrackField(buf, 6, v22);
          int v23 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)buf, 0);
          flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)buf, v23, "AIRD", 0);
          uint64_t v24 = LLVMCreateMemoryBufferWithMemoryRangeCopy();
          flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)buf);
        }
        else
        {
          uint64_t v24 = *(void *)(v14 + 104 * v17 + 160) ? LLVMCreateMemoryBufferWithMemoryRange() : 0;
        }
        uint64_t v25 = *(void *)(v14 + 104 * v17 + 176) ? LLVMCreateMemoryBufferWithMemoryRange() : 0;
        uint64_t v169 = v24;
        uint64_t v26 = *(void *)(v14 + 104 * v17 + 192) ? LLVMCreateMemoryBufferWithMemoryRange() : 0;
        int v27 = *(_DWORD *)(v18 + 136);
        v180 = 0;
        BOOL v28 = !v20 || v21 == 0;
        BOOL v29 = v28;
        BOOL v168 = v29;
        uint64_t v30 = MTLGPUArchiverAddUnit();
        if (!v30) {
          break;
        }
        if (v20 && (uint64_t v31 = v14 + 104 * v17, v33 = *(_DWORD *)(v31 + 144), v32 = (unsigned int *)(v31 + 144), v33))
        {
          unint64_t v34 = 0;
          uint64_t v35 = v14;
          unsigned __int8 v36 = (void *)(v14 + 104 * v17 + 232);
          LOBYTE(v37) = 1;
          do
          {
            std::__hash_table<std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>>>::find<MTLUINT256_t>(&v181, (unint64_t *)(v35 + *v36));
            BOOL v37 = v37 && MTLGPUArchiverAddLinkedModulesWithReferences() != 0;
            ++v34;
            v35 += 32;
          }
          while (v34 < *v32);
          uint64_t v14 = v167;
          long long v16 = v163;
          if (v168 || !v37) {
            goto LABEL_63;
          }
        }
        else if (v168)
        {
          break;
        }
        v16[v166] = v30;
        uint64_t v38 = v169;
        if (v27) {
          BOOL v39 = MTLGPUArchiverSetUnitHash() != 0;
        }
        else {
          BOOL v39 = 1;
        }
        ++v166;
        LOBYTE(v37) = v39;
        if (!*(void *)(v14 + 104 * v17 + 224)) {
          goto LABEL_64;
        }
        uint64_t v40 = v14 + *(void *)(v14 + 104 * v17 + 216);
        if (*(void *)(v40 + 40) && *(void *)(v40 + 56))
        {
          LLVMCreateMemoryBufferWithMemoryRange();
          LLVMCreateMemoryBufferWithMemoryRange();
          if (v39) {
            BOOL v39 = MTLGPUArchiverSetUnitReflection() != 0;
          }
          LLVMDisposeMemoryBuffer();
          LLVMDisposeMemoryBuffer();
        }
        LOBYTE(v37) = v39;
LABEL_63:
        uint64_t v38 = v169;
LABEL_64:
        if (v38) {
          LLVMDisposeMemoryBuffer();
        }
        if (v25) {
          LLVMDisposeMemoryBuffer();
        }
        if (v26) {
          LLVMDisposeMemoryBuffer();
        }
        if (v30) {
          BOOL v41 = v37;
        }
        else {
          BOOL v41 = 0;
        }
        if (!v41)
        {
          uint64_t v42 = v180;
          LODWORD(v176) = 16;
          MTLBuildRequestTypeToString(&v176, &__p);
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            uint64_t v53 = a1 + 136;
            if (*(char *)(a1 + 159) < 0) {
              uint64_t v53 = *(void *)(a1 + 136);
            }
            p_p = &__p;
            if (v175 < 0) {
              p_p = __p;
            }
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = v53;
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = p_p;
            *(_WORD *)&buf[22] = 2080;
            *(void *)&buf[24] = v42;
            _os_log_error_impl(&dword_2556FA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "MachO serialization failed (ParentProcessName=%{public}s): %{public}s - %s", buf, 0x20u);
          }
          if (v175 < 0) {
            operator delete(__p);
          }
          char v43 = v178;
          if (v178 >= v179)
          {
            uint64_t v45 = (v178 - (unsigned char *)v177) >> 3;
            if ((unint64_t)(v45 + 1) >> 61) {
              std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v46 = (v179 - (unsigned char *)v177) >> 2;
            if (v46 <= v45 + 1) {
              unint64_t v46 = v45 + 1;
            }
            if ((unint64_t)(v179 - (unsigned char *)v177) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v47 = v46;
            }
            if (v47) {
              int v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)&v179, v47);
            }
            else {
              int v48 = 0;
            }
            BOOL v49 = (void **)&v48[8 * v45];
            *BOOL v49 = v180;
            uint64_t v44 = (char *)(v49 + 1);
            std::string v51 = (char *)v177;
            size_t v50 = v178;
            if (v178 != v177)
            {
              do
              {
                unsigned int v52 = (void *)*((void *)v50 - 1);
                v50 -= 8;
                *--BOOL v49 = v52;
              }
              while (v50 != v51);
              size_t v50 = (char *)v177;
            }
            long long v177 = v49;
            long long v178 = v44;
            uint64_t v179 = &v48[8 * v47];
            if (v50) {
              operator delete(v50);
            }
          }
          else
          {
            *(void *)long long v178 = v180;
            uint64_t v44 = v43 + 8;
          }
          long long v178 = v44;
        }
        if ((unint64_t)++v17 >= *(void *)(v14 + 8)) {
          goto LABEL_123;
        }
      }
      LOBYTE(v37) = 1;
      goto LABEL_63;
    }
LABEL_123:
    unsigned int v55 = *(_DWORD *)(v14 + 100);
    uint64_t v56 = *(void *)(v14 + 56);
    v180 = 0;
    if (v55 >= 0x28)
    {
      uint64_t v61 = 0;
      uint64_t v62 = v167 + v56;
      unint64_t v63 = v55 / 0x28uLL;
      char v64 = 1;
      long long v65 = &_os_log_internal;
      while (2)
      {
        switch(*(_DWORD *)(v62 + 40 * v61))
        {
          case 0:
            uint64_t v66 = malloc_type_malloc(0x10uLL, 0x2004093837F09uLL);
            BOOL v67 = v66;
            uint64_t v68 = v62 + 40 * v61;
            char v69 = *(unsigned char *)(v68 + 32);
            BOOL v70 = (unsigned int *)(v68 + 8);
            if ((v69 & 2) != 0) {
              goto LABEL_149;
            }
            uint64_t v71 = *v70;
            if (v71 == -1)
            {
              uint64_t v72 = 0;
            }
            else
            {
              BOOL v70 = (unsigned int *)&v16[v71];
LABEL_149:
              uint64_t v72 = *(void *)v70;
            }
            *uint64_t v66 = v72;
            BOOL v73 = (unsigned int *)(v62 + 40 * v61 + 16);
            if (v69)
            {
              uint64_t v75 = *(void *)v73;
            }
            else
            {
              uint64_t v74 = *v73;
              if (v74 == -1) {
                uint64_t v75 = 0;
              }
              else {
                uint64_t v75 = v16[v74];
              }
            }
            v66[1] = v75;
            goto LABEL_178;
          case 1:
          case 2:
            BOOL v67 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
            uint64_t v88 = v62 + 40 * v61;
            char v89 = *(unsigned char *)(v88 + 32);
            uint64_t v90 = (unsigned int *)(v88 + 8);
            if ((v89 & 2) != 0) {
              goto LABEL_168;
            }
            uint64_t v91 = *v90;
            if (v91 == -1) {
              goto LABEL_170;
            }
            uint64_t v90 = (unsigned int *)&v16[v91];
LABEL_168:
            uint64_t v87 = *(void *)v90;
            goto LABEL_171;
          case 3:
            BOOL v76 = malloc_type_malloc(0x18uLL, 0x2004093837F09uLL);
            BOOL v67 = v76;
            uint64_t v77 = v62 + 40 * v61;
            char v78 = *(unsigned char *)(v77 + 32);
            BOOL v79 = (unsigned int *)(v77 + 16);
            if ((v78 & 2) != 0) {
              goto LABEL_156;
            }
            uint64_t v80 = *v79;
            if (v80 == -1)
            {
              uint64_t v81 = 0;
            }
            else
            {
              BOOL v79 = (unsigned int *)&v16[v80];
LABEL_156:
              uint64_t v81 = *(void *)v79;
            }
            v76[1] = v81;
            int v82 = (unsigned int *)(v62 + 40 * v61 + 24);
            if (v78) {
              goto LABEL_160;
            }
            uint64_t v83 = *v82;
            if (v83 == -1)
            {
              uint64_t v84 = 0;
            }
            else
            {
              int v82 = (unsigned int *)&v16[v83];
LABEL_160:
              uint64_t v84 = *(void *)v82;
            }
            v76[2] = v84;
            unint64_t v85 = (unsigned int *)(v62 + 40 * v61 + 8);
            if ((v78 & 4) != 0) {
              goto LABEL_164;
            }
            uint64_t v86 = *v85;
            if (v86 == -1)
            {
LABEL_170:
              uint64_t v87 = 0;
            }
            else
            {
              unint64_t v85 = (unsigned int *)&v16[v86];
LABEL_164:
              uint64_t v87 = *(void *)v85;
            }
LABEL_171:
            *BOOL v67 = v87;
LABEL_178:
            v180 = 0;
            if (v64)
            {
              int v92 = MTLGPUArchiverAddPipeline();
              free(v67);
              if (v92)
              {
                char v64 = 1;
                goto LABEL_202;
              }
            }
            else
            {
              free(v67);
            }
LABEL_182:
            uint64_t v93 = v180;
            LODWORD(v176) = 16;
            MTLBuildRequestTypeToString(&v176, &__p);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              uint64_t v104 = a1 + 136;
              if (*(char *)(a1 + 159) < 0) {
                uint64_t v104 = *(void *)(a1 + 136);
              }
              uint64_t v105 = &__p;
              if (v175 < 0) {
                uint64_t v105 = __p;
              }
              *(_DWORD *)buf = 136446722;
              *(void *)&uint8_t buf[4] = v104;
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = v105;
              *(_WORD *)&buf[22] = 2080;
              *(void *)&buf[24] = v93;
              _os_log_error_impl(&dword_2556FA000, v65, OS_LOG_TYPE_ERROR, "MachO serialization failed (ParentProcessName=%{public}s): %{public}s - %s", buf, 0x20u);
            }
            if (v175 < 0) {
              operator delete(__p);
            }
            uint64_t v94 = v178;
            if (v178 >= v179)
            {
              uint64_t v96 = (v178 - (unsigned char *)v177) >> 3;
              if ((unint64_t)(v96 + 1) >> 61) {
                std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v97 = (v179 - (unsigned char *)v177) >> 2;
              if (v97 <= v96 + 1) {
                unint64_t v97 = v96 + 1;
              }
              if ((unint64_t)(v179 - (unsigned char *)v177) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v98 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v98 = v97;
              }
              if (v98) {
                BOOL v99 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)&v179, v98);
              }
              else {
                BOOL v99 = 0;
              }
              char v100 = (void **)&v99[8 * v96];
              *char v100 = v180;
              uint64_t v95 = (char *)(v100 + 1);
              long long v102 = (char *)v177;
              long long v101 = v178;
              if (v178 != v177)
              {
                do
                {
                  int v103 = (void *)*((void *)v101 - 1);
                  v101 -= 8;
                  *--char v100 = v103;
                }
                while (v101 != v102);
                long long v101 = (char *)v177;
              }
              long long v177 = v100;
              long long v178 = v95;
              uint64_t v179 = &v99[8 * v98];
              if (v101) {
                operator delete(v101);
              }
            }
            else
            {
              *(void *)long long v178 = v180;
              uint64_t v95 = v94 + 8;
            }
            char v64 = 0;
            long long v178 = v95;
LABEL_202:
            if (++v61 == v63) {
              break;
            }
            continue;
          default:
            v180 = 0;
            goto LABEL_182;
        }
        break;
      }
    }
    free(v16);
    if (*(unsigned char *)(v167 + 128) == 1)
    {
      v180 = 0;
      int v57 = MTLGPUArchiverSetInstallName();
      BOOL v58 = v57 != 0;
      if (!v57 && v180)
      {
        LODWORD(__p) = 16;
        MTLBuildRequestTypeToString(&__p, buf);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          MTLCompilerObject::generateMachO(a1);
        }
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        BOOL v59 = v178;
        if (v178 >= v179)
        {
          uint64_t v106 = (v178 - (unsigned char *)v177) >> 3;
          if ((unint64_t)(v106 + 1) >> 61) {
            std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v107 = (v179 - (unsigned char *)v177) >> 2;
          if (v107 <= v106 + 1) {
            unint64_t v107 = v106 + 1;
          }
          if ((unint64_t)(v179 - (unsigned char *)v177) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v108 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v108 = v107;
          }
          if (v108) {
            long long v109 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)&v179, v108);
          }
          else {
            long long v109 = 0;
          }
          long long v110 = (void **)&v109[8 * v106];
          long long v111 = &v109[8 * v108];
          *long long v110 = v180;
          uint64_t v60 = (char *)(v110 + 1);
          uint64_t v113 = (char *)v177;
          uint64_t v112 = v178;
          if (v178 != v177)
          {
            do
            {
              unint64_t v114 = (void *)*((void *)v112 - 1);
              v112 -= 8;
              *--long long v110 = v114;
            }
            while (v112 != v113);
            uint64_t v112 = (char *)v177;
          }
          long long v177 = v110;
          long long v178 = v60;
          uint64_t v179 = v111;
          if (v112) {
            operator delete(v112);
          }
        }
        else
        {
          *(void *)long long v178 = v180;
          uint64_t v60 = v59 + 8;
        }
        BOOL v58 = 0;
        long long v178 = v60;
      }
    }
    else
    {
      BOOL v58 = 1;
    }
    for (uint64_t i = (void *)v182; i; uint64_t i = (void *)*i)
      MTLGPUArchiverUnitRefDestroy();
    v180 = 0;
    if (v58)
    {
      int v116 = MTLGPUArchiverPackUnits();
      if (v116 || !v180)
      {
        if (v116)
        {
          int v119 = *(unsigned __int8 *)(v167 + 129);
          if (!*(unsigned char *)(v167 + 129)) {
            sandbox_extension_consume();
          }
          int v124 = MTLGPUArchiverBuildToFD();
          if (!v124)
          {
            LODWORD(__p) = 16;
            MTLBuildRequestTypeToString(&__p, buf);
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              MTLCompilerObject::generateMachO(a1);
            }
            if ((buf[23] & 0x80000000) != 0) {
              operator delete(*(void **)buf);
            }
            int v125 = v178;
            if (v178 >= v179)
            {
              uint64_t v154 = (v178 - (unsigned char *)v177) >> 3;
              if ((unint64_t)(v154 + 1) >> 61) {
                std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v155 = (v179 - (unsigned char *)v177) >> 2;
              if (v155 <= v154 + 1) {
                unint64_t v155 = v154 + 1;
              }
              if ((unint64_t)(v179 - (unsigned char *)v177) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v156 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v156 = v155;
              }
              if (v156) {
                v157 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)&v179, v156);
              }
              else {
                v157 = 0;
              }
              v158 = (void **)&v157[8 * v154];
              v159 = &v157[8 * v156];
              uint64_t *v158 = v180;
              v126 = (char *)(v158 + 1);
              v161 = (char *)v177;
              v160 = v178;
              if (v178 != v177)
              {
                do
                {
                  v162 = (void *)*((void *)v160 - 1);
                  v160 -= 8;
                  *--v158 = v162;
                }
                while (v160 != v161);
                v160 = (char *)v177;
              }
              long long v177 = v158;
              long long v178 = v126;
              uint64_t v179 = v159;
              if (v160) {
                operator delete(v160);
              }
            }
            else
            {
              *(void *)long long v178 = v180;
              v126 = v125 + 8;
            }
            long long v178 = v126;
          }
          if (!v119) {
            sandbox_extension_release();
          }
          if (v124)
          {
            *(void *)buf = 0;
            (*(void (**)(uint64_t, void, unsigned char *, uint64_t, void))(a4 + 16))(a4, 0, buf, 8, 0);
LABEL_319:
            MTLGPUArchiverDestroy();
            goto LABEL_320;
          }
        }
      }
      else
      {
        LODWORD(__p) = 16;
        MTLBuildRequestTypeToString(&__p, buf);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          MTLCompilerObject::generateMachO(a1);
        }
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        unsigned __int16 v117 = v178;
        if (v178 >= v179)
        {
          uint64_t v120 = (v178 - (unsigned char *)v177) >> 3;
          if ((unint64_t)(v120 + 1) >> 61) {
            std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v121 = (v179 - (unsigned char *)v177) >> 2;
          if (v121 <= v120 + 1) {
            unint64_t v121 = v120 + 1;
          }
          if ((unint64_t)(v179 - (unsigned char *)v177) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v122 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v122 = v121;
          }
          if (v122) {
            uint64_t v123 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)&v179, v122);
          }
          else {
            uint64_t v123 = 0;
          }
          v127 = (void **)&v123[8 * v120];
          v128 = &v123[8 * v122];
          *v127 = v180;
          long long v118 = (char *)(v127 + 1);
          unint64_t v130 = (char *)v177;
          unint64_t v129 = v178;
          if (v178 != v177)
          {
            do
            {
              v131 = (void *)*((void *)v129 - 1);
              v129 -= 8;
              *--v127 = v131;
            }
            while (v129 != v130);
            unint64_t v129 = (char *)v177;
          }
          long long v177 = v127;
          long long v178 = v118;
          uint64_t v179 = v128;
          if (v129) {
            operator delete(v129);
          }
        }
        else
        {
          *(void *)long long v178 = v180;
          long long v118 = v117 + 8;
        }
        long long v178 = v118;
      }
    }
    long long __p = 0;
    if (MTLGPUArchiverDeleteWithId())
    {
      v132 = v178;
    }
    else
    {
      LODWORD(v176) = 16;
      MTLBuildRequestTypeToString(&v176, buf);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        MTLCompilerObject::generateMachO(a1);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      uint64_t v133 = v178;
      if (v178 >= v179)
      {
        uint64_t v134 = (v178 - (unsigned char *)v177) >> 3;
        if ((unint64_t)(v134 + 1) >> 61) {
          std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v135 = (v179 - (unsigned char *)v177) >> 2;
        if (v135 <= v134 + 1) {
          unint64_t v135 = v134 + 1;
        }
        if ((unint64_t)(v179 - (unsigned char *)v177) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v136 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v136 = v135;
        }
        if (v136) {
          v137 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Type *>>((uint64_t)&v179, v136);
        }
        else {
          v137 = 0;
        }
        uint64_t v138 = (void **)&v137[8 * v134];
        uint64_t v139 = &v137[8 * v136];
        *uint64_t v138 = __p;
        v132 = (char *)(v138 + 1);
        v141 = (char *)v177;
        v140 = v178;
        if (v178 != v177)
        {
          do
          {
            v142 = (void *)*((void *)v140 - 1);
            v140 -= 8;
            *--uint64_t v138 = v142;
          }
          while (v140 != v141);
          v140 = (char *)v177;
        }
        long long v177 = v138;
        long long v178 = v132;
        uint64_t v179 = v139;
        if (v140) {
          operator delete(v140);
        }
      }
      else
      {
        *(void *)long long v178 = __p;
        v132 = v133 + 8;
      }
      long long v178 = v132;
    }
    v143 = (const char **)v177;
    if (v132 == v177)
    {
      size_t v145 = 25;
    }
    else
    {
      if ((unint64_t)((v132 - (unsigned char *)v177) >> 3) <= 1) {
        uint64_t v144 = 1;
      }
      else {
        uint64_t v144 = (v132 - (unsigned char *)v177) >> 3;
      }
      size_t v145 = 25;
      do
      {
        v146 = *v143++;
        v145 += strlen(v146) + 1;
        --v144;
      }
      while (v144);
    }
    v147 = (char *)malloc_type_malloc(v145, 0xB0A412DBuLL);
    qmemcpy(v147, "Failed to generate machO:", 25);
    v148 = v147 + 25;
    uint64_t v149 = v177;
    if (v178 != v177)
    {
      unint64_t v150 = 0;
      do
      {
        unint64_t v151 = (const char *)v149[v150];
        size_t v152 = strlen(v151);
        memcpy(v148, v151, v152);
        v148 += v152;
        free(*((void **)v177 + v150));
        unsigned char *v148 = 10;
        ++v150;
        uint64_t v149 = v177;
      }
      while (v150 < (v178 - (unsigned char *)v177) >> 3);
    }
    unsigned char *v148 = 0;
    (*(void (**)(uint64_t, uint64_t, void, void, char *))(a4 + 16))(a4, 2, 0, 0, v147);
    free(v147);
    goto LABEL_319;
  }
  int v6 = 0;
  unint64_t v7 = 0;
  uint64_t v8 = v167 + *(void *)(v167 + 80);
  unint64_t v9 = *(unsigned int *)(v167 + 104);
  while (1)
  {
    if (v7 >= v9 || (unint64_t v10 = v7 + 32, v9 < v7 + 32)) {
      abort();
    }
    long long v11 = *(_OWORD *)(v8 + v7 + 16);
    *(_OWORD *)buf = *(_OWORD *)(v8 + v7);
    *(_OWORD *)&uint8_t buf[16] = v11;
    if (v9 <= v10 || v9 - v10 < 4 || v7 + 36 >= v9 || (v7 += 36 + *(unsigned int *)(v8 + v10), v7 > v9)) {
      abort();
    }
    LLVMCreateMemoryBufferWithMemoryRange();
    long long v176 = 0;
    uint64_t v12 = MTLGPUArchiverAddUnit();
    LLVMDisposeMemoryBuffer();
    if (!v12) {
      break;
    }
    uint64_t v13 = MTLGPUArchiverUnitRefCreateWithUnitId();
    long long __p = buf;
    std::__hash_table<std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)&v181, (unint64_t *)buf, (uint64_t)&std::piecewise_construct, (_OWORD **)&__p)[6] = v13;
    if (++v6 >= *(_DWORD *)(v167 + 108)) {
      goto LABEL_22;
    }
  }
  int v172 = 0;
  if (!MTLGPUArchiverDeleteWithId())
  {
    int v171 = 16;
    MTLBuildRequestTypeToString(&v171, &__p);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      MTLCompilerObject::generateMachO(a1);
    }
    if (v175 < 0) {
      operator delete(__p);
    }
    free(v172);
  }
  int v171 = 16;
  MTLBuildRequestTypeToString(&v171, &__p);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    MTLCompilerObject::generateMachO(a1);
  }
  if (v175 < 0) {
    operator delete(__p);
  }
  (*(void (**)(uint64_t, uint64_t, void, void, void *))(a4 + 16))(a4, 2, 0, 0, v176);
  free(v176);
  MTLGPUArchiverDestroy();
LABEL_320:
  if (v177)
  {
    long long v178 = (char *)v177;
    operator delete(v177);
  }
  return std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::~__hash_table((uint64_t)&v181);
}

void sub_255790D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  if (__p) {
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::~__hash_table((uint64_t)&a39);
  _Unwind_Resume(a1);
}

void MTLCompilerObject::generateBinaryArchiveID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v19 = 0;
  if (MTLGPUArchiverCreateExecutableWriter())
  {
    int v6 = (const char *)MTLGPUArchiverToId();
    if (v6)
    {
      int v7 = 1;
    }
    else
    {
      LODWORD(v16.__r_.__value_.__l.__data_) = 17;
      MTLBuildRequestTypeToString(&v16, __p);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        MTLCompilerObject::generateBinaryArchiveID();
      }
      if (SHIBYTE(v18) < 0) {
        operator delete(__p[0]);
      }
      int v7 = 0;
    }
    if ((MTLGPUArchiverFlush() & v7) != 0)
    {
      size_t v13 = strlen(v6) + 1;
      (*(void (**)(uint64_t, void, const char *, size_t, void))(a4 + 16))(a4, 0, v6, v13, 0);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, void, void, const char *))(a4 + 16))(a4, 2, 0, 0, "Failed to generate Binary archive ID");
    }
    MTLGPUArchiverDestroy();
  }
  else
  {
    LODWORD(v16.__r_.__value_.__l.__data_) = 17;
    MTLBuildRequestTypeToString(&v16, __p);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      MTLCompilerObject::generateMachO(a1);
    }
    if (SHIBYTE(v18) < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(&v16, "Failed to generate Binary archive ID: ");
    std::string::basic_string[abi:ne180100]<0>(v14, v19);
    if ((v15 & 0x80u) == 0) {
      uint64_t v8 = v14;
    }
    else {
      uint64_t v8 = (void **)v14[0];
    }
    if ((v15 & 0x80u) == 0) {
      std::string::size_type v9 = v15;
    }
    else {
      std::string::size_type v9 = (std::string::size_type)v14[1];
    }
    unint64_t v10 = std::string::append(&v16, (const std::string::value_type *)v8, v9);
    long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    int64_t v18 = v10->__r_.__value_.__r.__words[2];
    *(_OWORD *)long long __p = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    if ((char)v15 < 0) {
      operator delete(v14[0]);
    }
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
    if (v18 >= 0) {
      uint64_t v12 = __p;
    }
    else {
      uint64_t v12 = (void **)__p[0];
    }
    (*(void (**)(uint64_t, uint64_t, void, void, void **))(a4 + 16))(a4, 2, 0, 0, v12);
    free(v19);
    if (SHIBYTE(v18) < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_2557910D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::find_if[abi:ne180100]<std::__wrap_iter<fatalErrorHandler(void *,char const*,BOOL)::CollectInfo *>,fatalErrorHandler(void *,char const*,BOOL)::$_0>(uint64_t a1, uint64_t a2, const void **a3)
{
  uint64_t v3 = a1;
  if (a1 != a2)
  {
    unint64_t v6 = *((unsigned __int8 *)a3 + 23);
    while (1)
    {
      int v7 = *(char *)(v3 + 23);
      unint64_t v8 = v7 >= 0 ? *(unsigned __int8 *)(v3 + 23) : *(void *)(v3 + 8);
      if ((v6 & 0x80) != 0)
      {
        if (v8 == -1) {
LABEL_26:
        }
          std::string::__throw_out_of_range[abi:ne180100]();
        unint64_t v10 = *a3;
        size_t v9 = (unint64_t)a3[1] >= v8 ? v8 : (size_t)a3[1];
      }
      else
      {
        if (v8 == -1) {
          goto LABEL_26;
        }
        size_t v9 = v6 >= v8 ? v8 : v6;
        unint64_t v10 = a3;
      }
      long long v11 = v7 >= 0 ? (const void *)v3 : *(const void **)v3;
      if (!memcmp(v10, v11, v9) && v9 == v8) {
        break;
      }
      v3 += 32;
      if (v3 == a2) {
        return a2;
      }
    }
  }
  return v3;
}

void *std::vector<fatalErrorHandler(void *,char const*,BOOL)::AllowHashInfo,std::allocator<fatalErrorHandler(void *,char const*,BOOL)::AllowHashInfo>>::vector[abi:ne180100](void *a1, const void *a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >> 59) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    size_t v6 = 32 * a3;
    int v7 = (char *)operator new(32 * a3);
    *a1 = v7;
    a1[1] = v7;
    unint64_t v8 = &v7[32 * a3];
    a1[2] = v8;
    memmove(v7, a2, v6);
    a1[1] = v8;
  }
  return a1;
}

void sub_25579124C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<fatalErrorHandler(void *,char const*,BOOL)::CollectInfo>,fatalErrorHandler(void *,char const*,BOOL)::CollectInfo*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void **)(a1 + 16);
    uint64_t v4 = **(void **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 9) < 0) {
        operator delete(*(void **)(v3 - 32));
      }
      v3 -= 32;
    }
  }
  return a1;
}

void std::vector<fatalErrorHandler(void *,char const*,BOOL)::CollectInfo,std::allocator<fatalErrorHandler(void *,char const*,BOOL)::CollectInfo>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    int v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 9) < 0) {
          operator delete(*(v4 - 4));
        }
        v4 -= 4;
      }
      while (v4 != v2);
      int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
}

void sub_2557913B4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void *llvm::SmallVectorImpl<char>::append<char const*,void>(void *result, unsigned char *__src, unsigned char *a3)
{
  uint64_t v3 = result;
  size_t v4 = a3 - __src;
  uint64_t v5 = result[1];
  if (result[2] < (unint64_t)(v5 + a3 - __src)) {
    llvm::SmallVectorBase<unsigned long long>::grow_pod();
  }
  if (__src != a3)
  {
    uint64_t result = memcpy((void *)(*result + v5), __src, v4);
    uint64_t v5 = v3[1];
  }
  v3[1] = v5 + v4;
  return result;
}

void *llvm::SmallVectorTemplateBase<char,true>::push_back(void *result, char a2)
{
  uint64_t v2 = result[1];
  if ((unint64_t)(v2 + 1) > result[2]) {
    llvm::SmallVectorBase<unsigned long long>::grow_pod();
  }
  *(unsigned char *)(*result + v2) = a2;
  ++result[1];
  return result;
}

uint64_t SerializedLibraryInfo::addFunctionName(uint64_t *a1, long long *a2)
{
  uint64_t v3 = a1 + 3;
  unint64_t v4 = a1[4];
  if (v4 >= a1[5])
  {
    uint64_t result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[4] = result;
  return result;
}

uint64_t SerializedLibraryInfo::addVariable(uint64_t *a1, long long *a2)
{
  uint64_t v3 = a1 + 6;
  unint64_t v4 = a1[7];
  if (v4 >= a1[8])
  {
    uint64_t result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[7] = result;
  return result;
}

uint64_t SerializedLibraryInfo::addImportedSymbol(uint64_t *a1, long long *a2)
{
  uint64_t v3 = a1 + 9;
  unint64_t v4 = a1[10];
  if (v4 >= a1[11])
  {
    uint64_t result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[10] = result;
  return result;
}

uint64_t SerializedLibraryInfo::addImportedLibrary(uint64_t *a1, long long *a2)
{
  uint64_t v3 = a1 + 12;
  unint64_t v4 = a1[13];
  if (v4 >= a1[14])
  {
    uint64_t result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[13] = result;
  return result;
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v3 + 24;
}

void sub_255791644(_Unwind_Exception *a1)
{
  *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
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
    unint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<PackedInput>>(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_25579175C(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - _Block_object_dispose(&STACK[0x250], 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - _Block_object_dispose(&STACK[0x250], 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
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

void *std::vector<llvm::Module *>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<llvm::Type *>::__vallocate[abi:ne180100](a1, a2);
    unint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_255791A98(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<ImageFilterFunctionInfoSPI>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<ImageFilterFunctionInfoSPI>::__vallocate[abi:ne180100](a1, a2);
    unint64_t v4 = (char *)a1[1];
    bzero(v4, 32 * a2);
    a1[1] = &v4[32 * a2];
  }
  return a1;
}

void sub_255791B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *std::vector<ImageFilterFunctionInfoSPI>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VaryingInfo>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void std::vector<ImageFilterFunctionInfoSPI>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<ImageFilterFunctionInfoSPI>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<ImageFilterFunctionInfoSPI>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    uint64_t v4 = *(void **)(i - 24);
    if (v4)
    {
      *(void *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void *std::vector<llvm::Function *>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<llvm::Type *>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_255791C78(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ImageFilterFunctionArgumentInfoSPI>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(12 * a2);
}

char *std::vector<ImageFilterFunctionArgumentInfoSPI>::__assign_with_size[abi:ne180100]<ImageFilterFunctionArgumentInfoSPI*,ImageFilterFunctionArgumentInfoSPI*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(void *)result) >> 2) < a4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0x1555555555555555) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 2);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v12 = 0x1555555555555555;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t result = std::vector<ImageFilterFunctionArgumentInfoSPI>::__vallocate[abi:ne180100](v7, v12);
    long long v14 = (char *)v7[1];
    char v13 = (void **)(v7 + 1);
    uint64_t v9 = v14;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      int64_t v18 = v9;
      int v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  char v13 = (void **)(result + 8);
  long long v15 = (unsigned char *)*((void *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 2) >= a4) {
    goto LABEL_16;
  }
  std::string v16 = &__src[4 * ((v15 - v9) >> 2)];
  if (v15 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v15 - v9);
    uint64_t v9 = (char *)*v13;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    int64_t v18 = v9;
    int v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *char v13 = &v9[v17];
  return result;
}

char *std::vector<ImageFilterFunctionArgumentInfoSPI>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ImageFilterFunctionArgumentInfoSPI>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[12 * v4];
  return result;
}

uint64_t DeserialContext::stringFromSerializedData(DeserialContext *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v1 = *((void *)this + 2);
  size_t v3 = v2 - v1;
  if (v2 <= v1 || (v5 = (const char *)(*(void *)this + v1), size_t v6 = strnlen(v5, v3), v6 == v3)) {
    abort();
  }
  size_t v7 = v6;
  uint64_t result = [NSString stringWithCString:v5 encoding:4];
  *((void *)this + 2) += v7 + 1;
  return result;
}

void *std::__hash_table<std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == *a2 && i[3] == a2[1] && i[4] == a2[2] && i[5] == a2[3]) {
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
  uint64_t i = operator new(0x38uLL);
  *uint64_t i = 0;
  i[1] = v7;
  long long v16 = (*a4)[1];
  *((_OWORD *)i + 1) = **a4;
  *((_OWORD *)i + 2) = v16;
  i[6] = 0;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v8 || (float)(v18 * (float)v8) < v17)
  {
    BOOL v19 = 1;
    if (v8 >= 3) {
      BOOL v19 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v8);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::__rehash<true>(a1, v22);
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
  uint64_t v23 = *(void *)a1;
  uint64_t v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *uint64_t i = *v24;
LABEL_48:
    void *v24 = i;
    goto LABEL_49;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v23 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v25 >= v8) {
        v25 %= v8;
      }
    }
    else
    {
      v25 &= v8 - 1;
    }
    uint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_48;
  }
LABEL_49:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_255792110(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,MTLOpaqueGPUArchiverUnitRef *>>>::find<MTLUINT256_t>(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  size_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == *a2 && result[3] == a2[1] && result[4] == a2[2] && result[5] == a2[3]) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t std::vector<FunctionConstantDesc>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<FunctionConstantDesc>,std::reverse_iterator<FunctionConstantDesc*>,std::reverse_iterator<FunctionConstantDesc*>,std::reverse_iterator<FunctionConstantDesc*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<FunctionConstantDesc>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<FunctionConstantDesc>,std::reverse_iterator<FunctionConstantDesc*>,std::reverse_iterator<FunctionConstantDesc*>,std::reverse_iterator<FunctionConstantDesc*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    do
    {
      long long v8 = *(_OWORD *)(a3 - 40);
      *(void *)(v7 - 24) = *(void *)(a3 - 24);
      *(_OWORD *)(v7 - 40) = v8;
      *(void *)(a3 - 32) = 0;
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 40) = 0;
      uint64_t v9 = *(void *)(a3 - 16);
      *(_DWORD *)(v7 - _Block_object_dispose(&STACK[0x250], 8) = *(_DWORD *)(a3 - 8);
      *(void *)(v7 - 16) = v9;
      uint64_t v7 = *((void *)&v15 + 1) - 40;
      *((void *)&v15 + 1) -= 40;
      a3 -= 40;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<FunctionConstantDesc>,std::reverse_iterator<FunctionConstantDesc*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<FunctionConstantDesc>,std::reverse_iterator<FunctionConstantDesc*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<FunctionConstantDesc>,std::reverse_iterator<FunctionConstantDesc*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<FunctionConstantDesc>,std::reverse_iterator<FunctionConstantDesc*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 40;
  }
}

uint64_t std::__split_buffer<FunctionConstantDesc>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<FunctionConstantDesc>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 5;
      *(void *)(a1 + 16) = v2 - 5;
      if (*((char *)v2 - 17) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::_AllocatorDestroyRangeReverse<std::allocator<FunctionDesc>,std::reverse_iterator<FunctionDesc*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<FunctionDesc>::destroy[abi:ne180100](v3, v1);
      v1 += 120;
    }
    while (v1 != v2);
  }
}

uint64_t std::vector<FunctionDesc>::__push_back_slow_path<FunctionDesc const&>(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x222222222222222) {
    std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
  }
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v4) {
    unint64_t v4 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  }
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111) {
    unint64_t v6 = 0x222222222222222;
  }
  else {
    unint64_t v6 = v4;
  }
  long long v14 = a1 + 2;
  if (v6) {
    uint64_t v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<FunctionDesc>>((uint64_t)(a1 + 2), v6);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v10 = v7;
  uint64_t v11 = &v7[120 * v3];
  char v13 = &v7[120 * v6];
  std::allocator<FunctionDesc>::construct[abi:ne180100]<FunctionDesc,FunctionDesc const&>((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  unint64_t v12 = v11 + 120;
  std::vector<FunctionDesc>::__swap_out_circular_buffer(a1, &v10);
  uint64_t v8 = a1[1];
  std::__split_buffer<FunctionDesc>::~__split_buffer(&v10);
  return v8;
}

void sub_2557925C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<FunctionDesc>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

char *std::vector<FunctionConstantDesc>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<FunctionConstantDesc>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<FunctionConstantDesc>,FunctionConstantDesc*,FunctionConstantDesc*,FunctionConstantDesc*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  char v13 = this;
  long long v14 = this;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  char v12 = 0;
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v8 = v14;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
        uint64_t v8 = v4;
      }
      std::string::size_type v9 = *((void *)v6 + 3);
      LODWORD(v4[1].__r_.__value_.__r.__words[1]) = *((_DWORD *)v6 + 8);
      v4[1].__r_.__value_.__r.__words[0] = v9;
      unint64_t v6 = (long long *)((char *)v6 + 40);
      uint64_t v4 = (std::string *)((char *)v8 + 40);
      long long v14 = (std::string *)((char *)v8 + 40);
    }
    while (v6 != a3);
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<FunctionConstantDesc>,FunctionConstantDesc*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v4;
}

void sub_2557926EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<FunctionConstantDesc>,FunctionConstantDesc*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<FunctionConstantDesc>,FunctionConstantDesc*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<FunctionConstantDesc>,FunctionConstantDesc*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 17) < 0) {
      operator delete(*(void **)(v1 - 40));
    }
    v1 -= 40;
  }
}

char *std::vector<CompileTimeData>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SmallVertexPartialLoad>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<MTLArgumentData>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  long long v7 = *(MTLArgumentData **)(v4 - 8);
  if (0x8E38E38E38E38E39 * ((v6 - (uint64_t)v7) >> 5) >= a2)
  {
    if (a2)
    {
      char v13 = (MTLArgumentData *)((char *)v7 + 288 * a2);
      uint64_t v14 = 288 * a2;
      do
      {
        MTLArgumentData::MTLArgumentData(v7);
        long long v7 = (MTLArgumentData *)((char *)v7 + 288);
        v14 -= 288;
      }
      while (v14);
      long long v7 = v13;
    }
    a1[1] = (uint64_t)v7;
  }
  else
  {
    unint64_t v8 = 0x8E38E38E38E38E39 * (((uint64_t)v7 - *a1) >> 5);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xE38E38E38E38E3) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0x8E38E38E38E38E39 * ((v5 - *a1) >> 5);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x71C71C71C71C71) {
      unint64_t v11 = 0xE38E38E38E38E3;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v22 = v4;
    if (v11) {
      char v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLArgumentData>>(v4, v11);
    }
    else {
      char v12 = 0;
    }
    long long v15 = &v12[288 * v8];
    v19[0] = v12;
    v19[1] = v15;
    unint64_t v20 = v15;
    unint64_t v21 = &v12[288 * v11];
    uint64_t v16 = 9 * a2;
    float v17 = &v15[288 * a2];
    uint64_t v18 = 32 * v16;
    do
    {
      MTLArgumentData::MTLArgumentData((MTLArgumentData *)v15);
      v15 += 288;
      v18 -= 288;
    }
    while (v18);
    unint64_t v20 = v17;
    std::vector<MTLArgumentData>::__swap_out_circular_buffer(a1, v19);
    std::__split_buffer<MTLArgumentData>::~__split_buffer(v19);
  }
}

void sub_25579292C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<MTLArgumentData>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void *std::vector<std::unique_ptr<llvm::MemoryBuffer>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<llvm::Type *>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_2557929C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void std::vector<std::unique_ptr<llvm::MemoryBuffer>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::unique_ptr<llvm::MemoryBuffer>>::__clear[abi:ne180100](v2);
    unint64_t v3 = **a1;
    operator delete(v3);
  }
}

void *std::vector<std::unique_ptr<llvm::MemoryBuffer>>::__clear[abi:ne180100](void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = (void *)*result;
  unint64_t v3 = (void *)result[1];
  while (v3 != v2)
  {
    uint64_t v4 = (void *)*--v3;
    uint64_t result = v4;
    void *v3 = 0;
    if (v4) {
      uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
  }
  v1[1] = v2;
  return result;
}

void *std::__hash_table<std::__hash_value_type<std::string,LLVMOpaqueMemoryBuffer *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,LLVMOpaqueMemoryBuffer *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,LLVMOpaqueMemoryBuffer *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,LLVMOpaqueMemoryBuffer *>>>::__emplace_unique_key_args<std::string,std::string,LLVMOpaqueMemoryBuffer *&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v9 = (void *)(a1 + 24);
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
    long long v15 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(void **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, (unsigned __int8 *)i + 16, a2)) {
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
  uint64_t v18 = (void *)(a1 + 16);
  uint64_t i = operator new(0x30uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v11;
  *((_OWORD *)i + 1) = *(_OWORD *)a3;
  uint64_t v19 = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + _Block_object_dispose(&STACK[0x250], 8) = 0;
  *(void *)(a3 + 16) = 0;
  uint64_t v20 = *a4;
  *((void *)i + 4) = v19;
  *((void *)i + 5) = v20;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::__rehash<true>(a1, v26);
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
  uint64_t v27 = *(void *)a1;
  BOOL v28 = *(void **)(*(void *)a1 + 8 * v4);
  if (v28)
  {
    *(void *)uint64_t i = *v28;
LABEL_38:
    *BOOL v28 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v18;
  void *v18 = i;
  *(void *)(v27 + 8 * v4) = v18;
  if (*(void *)i)
  {
    unint64_t v29 = *(void *)(*(void *)i + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v29 >= v12) {
        v29 %= v12;
      }
    }
    else
    {
      v29 &= v12 - 1;
    }
    BOOL v28 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_38;
  }
LABEL_39:
  ++*v9;
  return i;
}

void sub_255792D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,MTLCompilerDataType>,void *>>>::operator()[abi:ne180100](v13, v12);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,llvm::StringRef>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,llvm::StringRef>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,llvm::StringRef>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,llvm::StringRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    unint64_t v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,llvm::StringRef>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,llvm::StringRef>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,llvm::StringRef>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,llvm::StringRef>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  BOOL v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *BOOL v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_255792F98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,MTLCompilerDataType>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,llvm::StringRef>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,llvm::StringRef>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,llvm::StringRef>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,llvm::StringRef>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x38uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + _Block_object_dispose(&STACK[0x250], 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *unint64_t v8 = 0;
  v8[1] = a2;
  unint64_t v9 = (std::string *)(v8 + 2);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    v8[4] = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  v8[6] = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_25579304C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,MTLCompilerDataType>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__function::__func<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_0,std::allocator<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_0>,void ()(llvm::Module *,unsigned int,unsigned int,unsigned int,std::vector<PackedInput> const&,std::vector<VaryingInfo> const&)>::~__func()
{
}

void *std::__function::__func<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_0,std::allocator<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_0>,void ()(llvm::Module *,unsigned int,unsigned int,unsigned int,std::vector<PackedInput> const&,std::vector<VaryingInfo> const&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_270454550;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_0,std::allocator<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_0>,void ()(llvm::Module *,unsigned int,unsigned int,unsigned int,std::vector<PackedInput> const&,std::vector<VaryingInfo> const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_270454550;
  a2[1] = v2;
  return result;
}

void std::__function::__func<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_0,std::allocator<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_0>,void ()(llvm::Module *,unsigned int,unsigned int,unsigned int,std::vector<PackedInput> const&,std::vector<VaryingInfo> const&)>::operator()(uint64_t a1, void *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = MTLCompilerObject::serializeFragmentPackingInfo(*a2, *a3, *a4, *a5, a6, a7, v7 + 40);
  unint64_t v9 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v8;
  if (v9)
  {
    free(v9);
  }
}

void *std::__function::__value_func<void ()(llvm::Module *,unsigned int,unsigned int,unsigned int,std::vector<PackedInput> const&,std::vector<VaryingInfo> const&)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_1,std::allocator<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_1>,void ()(llvm::Module *,unsigned int,unsigned int,unsigned int,unsigned int,std::vector<VaryingInfo> const&)>::~__func()
{
}

void *std::__function::__func<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_1,std::allocator<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_1>,void ()(llvm::Module *,unsigned int,unsigned int,unsigned int,unsigned int,std::vector<VaryingInfo> const&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_270454598;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_1,std::allocator<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_1>,void ()(llvm::Module *,unsigned int,unsigned int,unsigned int,unsigned int,std::vector<VaryingInfo> const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_270454598;
  a2[1] = v2;
  return result;
}

void std::__function::__func<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_1,std::allocator<MTLCompilerObject::runFragmentLinkingPass(BinaryRequestData &,FrameworkPassesOutput &)::$_1>,void ()(llvm::Module *,unsigned int,unsigned int,unsigned int,unsigned int,std::vector<VaryingInfo> const&)>::operator()(uint64_t a1, void *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5, unsigned int *a6, uint64_t a7)
{
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = MTLCompilerObject::serializeFragmentLinkingInfo(*a2, *a3, *a4, *a5, *a6, a7, v7 + 40);
  unint64_t v9 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v8;
  if (v9)
  {
    free(v9);
  }
}

void *std::__function::__value_func<void ()(llvm::Module *,unsigned int,unsigned int,unsigned int,unsigned int,std::vector<VaryingInfo> const&)>::~__value_func[abi:ne180100](void *a1)
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

id MTLDeserializePluginDataDictionary(const unsigned __int8 *a1)
{
  if (!*a1) {
    return 0;
  }
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:*a1];
  if (*a1)
  {
    unsigned int v3 = 0;
    uint64_t v4 = 1;
    do
    {
      uint64_t v5 = (unsigned __int16 *)&a1[v4];
      uint64_t v6 = (void *)[[NSString alloc] initWithBytesNoCopy:v5 + 2 length:*v5 encoding:4 freeWhenDone:0];
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:(char *)v5 + *v5 + 4 length:v5[1] freeWhenDone:0];
      [v2 setObject:v7 forKey:v6];

      v4 += *v5 + (unint64_t)v5[1] + 4;
      ++v3;
    }
    while (v3 < *a1);
  }
  return v2;
}

uint64_t Air::CloneLinkedFunctions<Air::LinkedFunctions>(uint64_t a1, int *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = -v4;
  uint64_t v6 = (unsigned __int16 *)((char *)a2 - v4);
  if (*v6 >= 9u && (uint64_t v7 = v6[4]) != 0)
  {
    float v17 = (unsigned int *)((char *)a2 + v7 + *(unsigned int *)((char *)a2 + v7));
    int v8 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air13FunctionGroupEEEZNS3_20CloneLinkedFunctionsINS3_15LinkedFunctionsEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_30LinkedFunctionsCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v17, &v17, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v8 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 7u && *(_WORD *)((char *)a2 + v5 + 6))
  {
    float v17 = (unsigned int *)((char *)a2
                         + *(unsigned __int16 *)((char *)a2 + v5 + 6)
                         + *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 6)));
    int v9 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetINS_6StringEEEZN3Air20CloneLinkedFunctionsINS5_15LinkedFunctionsEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS5_30LinkedFunctionsCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE0_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v17, &v17, (flatbuffers::FlatBufferBuilder *)a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v9 = 0;
  }
  unint64_t v10 = (unsigned __int16 *)((char *)a2 + v5);
  if (*v10 >= 5u && (uint64_t v11 = v10[2]) != 0)
  {
    float v17 = (unsigned int *)((char *)a2 + v11 + *(unsigned int *)((char *)a2 + v11));
    int v12 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetINS_6StringEEEZN3Air20CloneLinkedFunctionsINS5_15LinkedFunctionsEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS5_30LinkedFunctionsCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE1_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v17, &v17, (flatbuffers::FlatBufferBuilder *)a1);
  }
  else
  {
    int v12 = 0;
  }
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 32);
  if (v8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 8, v8);
  }
  if (v9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 6, v9);
  }
  if (v12) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 4, v12);
  }
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v15 - (unsigned __int16)v14 + (unsigned __int16)v13);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_29CloneVertexFunctionDescriptorINS3_24VertexFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_39VertexFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::ClonePipelineBufferDescriptor<Air::PipelineBufferDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      unint64_t v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    unint64_t v10 = __p;
  }
  if (v15 == v10) {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<Air::PipelineBufferDescriptor>,std::allocator<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>> const&)::t;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_255793700(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Air::CloneVertexDescriptor<Air::VertexDescriptor>(uint64_t a1, int *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = -v4;
  unint64_t v6 = (unsigned __int16 *)((char *)a2 - v4);
  if (*v6 >= 7u && (uint64_t v7 = v6[3]) != 0)
  {
    unint64_t v16 = (unsigned int *)((char *)a2 + v7 + *(unsigned int *)((char *)a2 + v7));
    int v8 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air22BufferLayoutDescriptorEEEZNS3_21CloneVertexDescriptorINS3_16VertexDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_31VertexDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v16, &v16, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v8 = 0;
  }
  int v9 = (unsigned __int16 *)((char *)a2 + v5);
  if (*v9 >= 5u && (uint64_t v10 = v9[2]) != 0)
  {
    unint64_t v16 = (unsigned int *)((char *)a2 + v10 + *(unsigned int *)((char *)a2 + v10));
    int v11 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air19AttributeDescriptorEEEZNS3_21CloneVertexDescriptorINS3_16VertexDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_31VertexDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE0_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v16, &v16, a1);
  }
  else
  {
    int v11 = 0;
  }
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 32);
  if (v8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 6, v8);
  }
  if (v11) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 4, v11);
  }
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v14 - (unsigned __int16)v13 + (unsigned __int16)v12);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air13FunctionGroupEEEZNS3_20CloneLinkedFunctionsINS3_15LinkedFunctionsEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_30LinkedFunctionsCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::FunctionGroup>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::CloneFunctionGroup<Air::FunctionGroup>(a4, (const char *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      uint64_t v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v10 = __p;
  }
  if (v15 == v10) {
    int v11 = &flatbuffers::data<flatbuffers::Offset<Air::FunctionGroup>,std::allocator<flatbuffers::Offset<Air::FunctionGroup>>>(std::vector<flatbuffers::Offset<Air::FunctionGroup>> const&)::t;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_255793910(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetINS_6StringEEEZN3Air20CloneLinkedFunctionsINS5_15LinkedFunctionsEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS5_30LinkedFunctionsCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE0_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, flatbuffers::FlatBufferBuilder *a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<flatbuffers::String>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = (const char *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4));
      int String = flatbuffers::FlatBufferBuilder::CreateString(a4, v9 + 4, *(unsigned int *)v9);
      int v11 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = String;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    int v11 = __p;
  }
  if (v16 == v11) {
    uint64_t v12 = &flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v12, (v16 - v11) >> 2);
  if (__p)
  {
    unint64_t v16 = __p;
    operator delete(__p);
  }
  return v13;
}

void sub_2557939F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetINS_6StringEEEZN3Air20CloneLinkedFunctionsINS5_15LinkedFunctionsEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS5_30LinkedFunctionsCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE1_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, flatbuffers::FlatBufferBuilder *a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<flatbuffers::String>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = (const char *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4));
      int String = flatbuffers::FlatBufferBuilder::CreateString(a4, v9 + 4, *(unsigned int *)v9);
      int v11 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = String;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    int v11 = __p;
  }
  if (v16 == v11) {
    uint64_t v12 = &flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v12, (v16 - v11) >> 2);
  if (__p)
  {
    unint64_t v16 = __p;
    operator delete(__p);
  }
  return v13;
}

void sub_255793AE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<flatbuffers::Offset<Air::FunctionGroup>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_255793B5C(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Air::CloneFunctionGroup<Air::FunctionGroup>(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(int *)a2;
  uint64_t v5 = -v4;
  unint64_t v6 = &a2[-v4];
  if (*(unsigned __int16 *)v6 >= 7u && (uint64_t v7 = *((unsigned __int16 *)v6 + 3)) != 0)
  {
    unint64_t v16 = &a2[v7 + *(unsigned int *)&a2[v7]];
    int v8 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetINS_6StringEEEZN3Air18CloneFunctionGroupINS5_13FunctionGroupEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS5_28FunctionGroupCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *(unsigned int *)v16, &v16, (flatbuffers::FlatBufferBuilder *)a1);
    uint64_t v5 = -(uint64_t)*(int *)a2;
  }
  else
  {
    int v8 = 0;
  }
  int v9 = &a2[v5];
  if (*(unsigned __int16 *)v9 >= 5u && (uint64_t v10 = *((unsigned __int16 *)v9 + 2)) != 0) {
    int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a1, &a2[v10 + 4 + *(unsigned int *)&a2[v10]], *(unsigned int *)&a2[v10 + *(unsigned int *)&a2[v10]]);
  }
  else {
    int String = 0;
  }
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 32);
  if (v8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 6, v8);
  }
  if (String) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 4, String);
  }
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v14 - (unsigned __int16)v13 + (unsigned __int16)v12);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetINS_6StringEEEZN3Air18CloneFunctionGroupINS5_13FunctionGroupEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS5_28FunctionGroupCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, flatbuffers::FlatBufferBuilder *a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<flatbuffers::String>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = (const char *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4));
      int String = flatbuffers::FlatBufferBuilder::CreateString(a4, v9 + 4, *(unsigned int *)v9);
      int v11 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = String;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    int v11 = __p;
  }
  if (v16 == v11) {
    uint64_t v12 = &flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v12, (v16 - v11) >> 2);
  if (__p)
  {
    unint64_t v16 = __p;
    operator delete(__p);
  }
  return v13;
}

void sub_255793D5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<flatbuffers::Offset<flatbuffers::String>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_255793DD8(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(flatbuffers::FlatBufferBuilder *a1, uint64_t a2, uint64_t a3)
{
  *((unsigned char *)a1 + 70) = 1;
  uint64_t v6 = 4 * a3;
  flatbuffers::FlatBufferBuilder::PreAlign(a1, 4 * a3, 4uLL);
  flatbuffers::FlatBufferBuilder::PreAlign(a1, v6, 4uLL);
  if (a3)
  {
    uint64_t v7 = a2 - 4;
    uint64_t v8 = a3;
    do
    {
      uint64_t v9 = v8 - 1;
      flatbuffers::FlatBufferBuilder::PushElement<flatbuffers::String>(a1, *(_DWORD *)(v7 + 4 * v8));
      uint64_t v8 = v9;
    }
    while (v9);
  }
  *((unsigned char *)a1 + 70) = 0;
  return flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a1, a3);
}

uint64_t flatbuffers::FlatBufferBuilder::PushElement<flatbuffers::String>(flatbuffers::FlatBufferBuilder *a1, int a2)
{
  flatbuffers::FlatBufferBuilder::Align(a1, 4uLL);
  int v4 = *((_DWORD *)a1 + 8) - *((_DWORD *)a1 + 12) + *((_DWORD *)a1 + 10) - a2 + 4;
  return flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a1, v4);
}

uint64_t flatbuffers::FlatBufferBuilder::CreateString(flatbuffers::FlatBufferBuilder *this, const char *a2, unint64_t a3)
{
  return (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10));
}

void *std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](a1, a2);
    int v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_255793FBC(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Air::ClonePipelineBufferDescriptor<Air::PipelineBufferDescriptor>(uint64_t a1, int *a2)
{
  *(unsigned char *)(a1 + 70) = 1;
  unsigned int v3 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v3 >= 5u && (uint64_t v4 = v3[2]) != 0)
  {
    unsigned int v5 = *((unsigned __int8 *)a2 + v4);
    if (v5 >= 3) {
      abort();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  __int16 v6 = *(void *)(a1 + 32) - *(void *)(a1 + 48) + *(void *)(a1 + 40);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 4, v5, 0);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, v6);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air22BufferLayoutDescriptorEEEZNS3_21CloneVertexDescriptorINS3_16VertexDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_31VertexDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::BufferLayoutDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::CloneBufferLayoutDescriptor<Air::BufferLayoutDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      uint64_t v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v10 = __p;
  }
  if (v15 == v10) {
    int v11 = &flatbuffers::data<flatbuffers::Offset<Air::BufferLayoutDescriptor>,std::allocator<flatbuffers::Offset<Air::BufferLayoutDescriptor>>>(std::vector<flatbuffers::Offset<Air::BufferLayoutDescriptor>> const&)::t;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_25579412C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air19AttributeDescriptorEEEZNS3_21CloneVertexDescriptorINS3_16VertexDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_31VertexDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE0_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::AttributeDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::CloneAttributeDescriptor<Air::AttributeDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      uint64_t v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v10 = __p;
  }
  if (v15 == v10) {
    int v11 = &flatbuffers::data<flatbuffers::Offset<Air::AttributeDescriptor>,std::allocator<flatbuffers::Offset<Air::AttributeDescriptor>>>(std::vector<flatbuffers::Offset<Air::AttributeDescriptor>> const&)::t;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_255794210(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<flatbuffers::Offset<Air::BufferLayoutDescriptor>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_25579428C(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Air::CloneBufferLayoutDescriptor<Air::BufferLayoutDescriptor>(uint64_t a1, int *a2)
{
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v4 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v4 >= 9u && (uint64_t v5 = v4[4]) != 0) {
    uint64_t v6 = *(void *)((char *)a2 + v5);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 8, v6, 0);
  uint64_t v10 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v10 >= 7u && (uint64_t v11 = v10[3]) != 0) {
    uint64_t v12 = *(void *)((char *)a2 + v11);
  }
  else {
    uint64_t v12 = 1;
  }
  unsigned int v13 = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 6, v12, 1);
  uint64_t v14 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v14 >= 5u)
  {
    uint64_t v15 = v14[2];
    if (v15)
    {
      unsigned int v13 = *((unsigned __int8 *)a2 + v15);
      if (v13 >= 9) {
        abort();
      }
    }
    else
    {
      unsigned int v13 = 1;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 4, v13, 1);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v9 - (unsigned __int16)v8 + (unsigned __int16)v7);
}

void *flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 != a4 || *((unsigned char *)result + 80))
  {
    unsigned int v6 = flatbuffers::FlatBufferBuilder::PushElement<unsigned long long>((uint64_t)result, a3);
    return flatbuffers::FlatBufferBuilder::TrackField(v5, a2, v6);
  }
  return result;
}

uint64_t flatbuffers::FlatBufferBuilder::PushElement<unsigned long long>(uint64_t a1, uint64_t a2)
{
  flatbuffers::FlatBufferBuilder::Align((flatbuffers::FlatBufferBuilder *)a1, 8uLL);
  uint64_t v4 = *(void *)(a1 + 48);
  if ((unint64_t)(v4 - *(void *)(a1 + 56)) <= 7)
  {
    flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)a1, 8uLL);
    uint64_t v4 = *(void *)(a1 + 48);
  }
  *(void *)(v4 - _Block_object_dispose(&STACK[0x250], 8) = a2;
  uint64_t v5 = v4 - 8;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x250], 8) = v5;
  return (*(_DWORD *)(a1 + 32) - v5 + *(_DWORD *)(a1 + 40));
}

void *std::vector<flatbuffers::Offset<Air::AttributeDescriptor>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_2557944EC(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Air::CloneAttributeDescriptor<Air::AttributeDescriptor>(uint64_t a1, int *a2)
{
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v4 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v4 >= 7u && (uint64_t v5 = v4[3]) != 0) {
    uint64_t v6 = *(void *)((char *)a2 + v5);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((void *)a1, 6, v6, 0);
  uint64_t v10 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v10 >= 9u && (uint64_t v11 = v10[4]) != 0) {
    int v12 = *(int *)((char *)a2 + v11);
  }
  else {
    int v12 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((void *)a1, 8, v12, 0);
  int v13 = 0;
  uint64_t v14 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v14 >= 5u)
  {
    uint64_t v15 = v14[2];
    if (v15)
    {
      unint64_t v16 = *((unsigned __int8 *)a2 + v15);
      if (v16 >= 0x38 || ((0xFFE7FFFFFFFFFFuLL >> v16) & 1) == 0) {
        abort();
      }
      int v13 = byte_2557AA4E1[(char)v16];
    }
    else
    {
      int v13 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 4, v13, 0);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v9 - (unsigned __int16)v8 + (unsigned __int16)v7);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_31CloneFragmentFunctionDescriptorINS3_26FragmentFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_41FragmentFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::ClonePipelineBufferDescriptor<Air::PipelineBufferDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      uint64_t v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v10 = __p;
  }
  if (v15 == v10) {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<Air::PipelineBufferDescriptor>,std::allocator<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>> const&)::t;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_255794708(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air33FragmentColorAttachmentDescriptorEEEZNS3_31CloneFragmentFunctionDescriptorINS3_26FragmentFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_41FragmentFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE0_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::FragmentColorAttachmentDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::CloneFragmentColorAttachmentDescriptor<Air::FragmentColorAttachmentDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      uint64_t v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v10 = __p;
  }
  if (v15 == v10) {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<Air::FragmentColorAttachmentDescriptor>,std::allocator<flatbuffers::Offset<Air::FragmentColorAttachmentDescriptor>>>(std::vector<flatbuffers::Offset<Air::FragmentColorAttachmentDescriptor>> const&)::t;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_2557947EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Air::ClonePixelFormat<Air::PixelFormat>(uint64_t result)
{
  switch((int)result)
  {
    case 0:
    case 1:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 20:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 53:
    case 54:
    case 55:
    case 60:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 80:
    case 81:
    case 84:
    case 85:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 103:
    case 104:
    case 105:
    case 110:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 123:
    case 124:
    case 125:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 140:
    case 141:
    case 142:
    case 143:
    case 150:
    case 151:
    case 152:
    case 153:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 170:
    case 172:
    case 174:
    case 176:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 210:
    case 211:
    case 212:
    case 213:
    case 214:
    case 215:
    case 216:
    case 217:
    case 218:
    case 221:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 227:
    case 228:
    case 229:
    case 230:
    case 231:
    case 232:
    case 233:
    case 234:
    case 235:
    case 236:
    case 240:
    case 241:
    case 250:
    case 252:
    case 253:
    case 255:
    case 260:
    case 261:
    case 262:
    case 300:
    case 301:
    case 302:
    case 303:
    case 304:
    case 313:
    case 314:
    case 315:
    case 323:
    case 324:
    case 325:
    case 500:
    case 501:
    case 502:
    case 503:
    case 504:
    case 505:
    case 506:
    case 507:
    case 508:
    case 509:
    case 510:
    case 520:
    case 521:
    case 522:
    case 523:
    case 524:
    case 525:
    case 526:
    case 527:
    case 528:
    case 529:
    case 530:
    case 540:
    case 541:
    case 542:
    case 543:
    case 544:
    case 545:
    case 546:
    case 547:
    case 548:
    case 550:
    case 551:
    case 552:
    case 553:
    case 554:
    case 555:
    case 556:
    case 560:
    case 562:
    case 563:
    case 564:
    case 565:
    case 566:
    case 567:
    case 568:
    case 569:
    case 570:
    case 571:
    case 572:
    case 573:
    case 574:
    case 575:
    case 576:
    case 577:
    case 578:
    case 579:
    case 580:
    case 581:
    case 582:
    case 583:
    case 584:
    case 585:
    case 586:
    case 587:
    case 588:
    case 589:
    case 590:
    case 591:
    case 592:
    case 593:
    case 594:
    case 595:
    case 596:
    case 597:
    case 598:
    case 599:
    case 600:
    case 601:
    case 602:
    case 603:
    case 604:
    case 605:
    case 606:
    case 607:
    case 608:
    case 609:
    case 610:
    case 611:
    case 612:
    case 613:
    case 615:
    case 616:
    case 617:
    case 618:
    case 619:
    case 620:
    case 621:
    case 622:
    case 623:
    case 624:
    case 625:
    case 626:
    case 627:
    case 628:
    case 629:
    case 630:
    case 631:
    case 632:
    case 633:
    case 634:
    case 635:
    case 636:
    case 637:
    case 638:
    case 639:
    case 640:
    case 641:
    case 642:
    case 643:
    case 644:
    case 645:
      return result;
    default:
      abort();
  }
}

void *std::vector<flatbuffers::Offset<Air::FragmentColorAttachmentDescriptor>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_2557952C0(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Air::CloneFragmentColorAttachmentDescriptor<Air::FragmentColorAttachmentDescriptor>(uint64_t a1, int *a2)
{
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v4 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v4 >= 5u && (uint64_t v5 = v4[2]) != 0) {
    uint64_t v6 = *(unsigned __int16 *)((char *)a2 + v5);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  unsigned __int16 v10 = Air::ClonePixelFormat<Air::PixelFormat>(v6);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned short>((void *)a1, 4, v10, 0);
  uint64_t v11 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v11 >= 0x15u && (uint64_t v12 = v11[10]) != 0)
  {
    unsigned int v13 = *((unsigned __int8 *)a2 + v12);
    if (v13 >= 0x13) {
      goto LABEL_31;
    }
  }
  else
  {
    unsigned int v13 = 1;
  }
  unsigned int v14 = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 20, v13, 1);
  uint64_t v15 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v15 >= 0x13u)
  {
    uint64_t v16 = v15[9];
    if (v16)
    {
      unsigned int v14 = *((unsigned __int8 *)a2 + v16);
      if (v14 >= 0x13) {
LABEL_31:
      }
        abort();
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 18, v14, 1);
  float v17 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v17 >= 0x11u && (uint64_t v18 = v17[8]) != 0)
  {
    unsigned int v19 = *((unsigned __int8 *)a2 + v18);
    if (v19 >= 0x13) {
      goto LABEL_31;
    }
  }
  else
  {
    unsigned int v19 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 16, v19, 0);
  unsigned int v20 = 0;
  unint64_t v21 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v21 >= 0xFu)
  {
    uint64_t v22 = v21[7];
    if (v22)
    {
      unsigned int v20 = *((unsigned __int8 *)a2 + v22);
      if (v20 >= 0x13) {
        goto LABEL_31;
      }
    }
    else
    {
      unsigned int v20 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 14, v20, 0);
  unsigned int v23 = 0;
  unint64_t v24 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v24 >= 0xDu)
  {
    uint64_t v25 = v24[6];
    if (v25)
    {
      unsigned int v23 = *((unsigned __int8 *)a2 + v25);
      if (v23 >= 5) {
        goto LABEL_31;
      }
    }
    else
    {
      unsigned int v23 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 12, v23, 0);
  unsigned int v26 = 0;
  uint64_t v27 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v27 >= 0xBu)
  {
    uint64_t v28 = v27[5];
    if (v28)
    {
      unsigned int v26 = *((unsigned __int8 *)a2 + v28);
      if (v26 >= 5) {
        goto LABEL_31;
      }
    }
    else
    {
      unsigned int v26 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 10, v26, 0);
  BOOL v29 = 0;
  uint64_t v30 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v30 >= 9u)
  {
    uint64_t v31 = v30[4];
    if (v31) {
      BOOL v29 = *((unsigned __int8 *)a2 + v31) != 0;
    }
    else {
      BOOL v29 = 0;
    }
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 8, v29, 0);
  long long v32 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v32 >= 7u && (uint64_t v33 = v32[3]) != 0) {
    int v34 = *((unsigned __int8 *)a2 + v33);
  }
  else {
    int v34 = 15;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 6, v34, 15);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v9 - (unsigned __int16)v8 + (unsigned __int16)v7);
}

void *flatbuffers::FlatBufferBuilder::AddElement<unsigned short>(void *result, uint64_t a2, int a3, int a4)
{
  uint64_t v5 = result;
  if (a3 != a4 || *((unsigned char *)result + 80))
  {
    unsigned int v6 = flatbuffers::FlatBufferBuilder::PushElement<unsigned short>((uint64_t)result, a3);
    return flatbuffers::FlatBufferBuilder::TrackField(v5, a2, v6);
  }
  return result;
}

uint64_t flatbuffers::FlatBufferBuilder::PushElement<unsigned short>(uint64_t a1, __int16 a2)
{
  flatbuffers::FlatBufferBuilder::Align((flatbuffers::FlatBufferBuilder *)a1, 2uLL);
  uint64_t v4 = *(void *)(a1 + 48);
  if ((unint64_t)(v4 - *(void *)(a1 + 56)) <= 1)
  {
    flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)a1, 2uLL);
    uint64_t v4 = *(void *)(a1 + 48);
  }
  *(_WORD *)(v4 - 2) = a2;
  uint64_t v5 = v4 - 2;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x250], 8) = v5;
  return (*(_DWORD *)(a1 + 32) - v5 + *(_DWORD *)(a1 + 40));
}

void *flatbuffers::FlatBufferBuilder::AddElement<float>(void *result, uint64_t a2, float a3, float a4)
{
  uint64_t v5 = result;
  if (a3 != a4 || *((unsigned char *)result + 80))
  {
    unsigned int v6 = flatbuffers::FlatBufferBuilder::PushElement<float>((uint64_t)result, a3);
    return flatbuffers::FlatBufferBuilder::TrackField(v5, a2, v6);
  }
  return result;
}

uint64_t flatbuffers::FlatBufferBuilder::PushElement<float>(uint64_t a1, float a2)
{
  flatbuffers::FlatBufferBuilder::Align((flatbuffers::FlatBufferBuilder *)a1, 4uLL);
  uint64_t v4 = *(void *)(a1 + 48);
  if ((unint64_t)(v4 - *(void *)(a1 + 56)) <= 3)
  {
    flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)a1, 4uLL);
    uint64_t v4 = *(void *)(a1 + 48);
  }
  *(float *)(v4 - 4) = a2;
  uint64_t v5 = v4 - 4;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x250], 8) = v5;
  return (*(_DWORD *)(a1 + 32) - v5 + *(_DWORD *)(a1 + 40));
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_30CloneComputeFunctionDescriptorINS3_25ComputeFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_40ComputeFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::ClonePipelineBufferDescriptor<Air::PipelineBufferDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      unsigned __int16 v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    unsigned __int16 v10 = __p;
  }
  if (v15 == v10) {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<Air::PipelineBufferDescriptor>,std::allocator<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>> const&)::t;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_2557957E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Air::CloneStageInputOutputDescriptor<Air::StageInputOutputDescriptor>(uint64_t a1, int *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = -v4;
  unint64_t v6 = (unsigned __int16 *)((char *)a2 - v4);
  if (*v6 >= 7u && (uint64_t v7 = v6[3]) != 0)
  {
    unsigned int v20 = (unsigned int *)((char *)a2 + v7 + *(unsigned int *)((char *)a2 + v7));
    int v8 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air22BufferLayoutDescriptorEEEZNS3_31CloneStageInputOutputDescriptorINS3_26StageInputOutputDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_41StageInputOutputDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v20, &v20, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v8 = 0;
  }
  if (*(unsigned __int16 *)((char *)a2 + v5) >= 5u && *(_WORD *)((char *)a2 + v5 + 4))
  {
    unsigned int v20 = (unsigned int *)((char *)a2
                         + *(unsigned __int16 *)((char *)a2 + v5 + 4)
                         + *(unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v5 + 4)));
    int v9 = _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air19AttributeDescriptorEEEZNS3_31CloneStageInputOutputDescriptorINS3_26StageInputOutputDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_41StageInputOutputDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE0_vEENS2_INS_6VectorISB_EEEEmT0_PT1_((flatbuffers::FlatBufferBuilder *)a1, *v20, &v20, a1);
    uint64_t v5 = -(uint64_t)*a2;
  }
  else
  {
    int v9 = 0;
  }
  *(unsigned char *)(a1 + 70) = 1;
  unsigned __int16 v10 = (unsigned __int16 *)((char *)a2 + v5);
  if (*v10 >= 9u && (uint64_t v11 = v10[4]) != 0) {
    int v12 = *(int *)((char *)a2 + v11);
  }
  else {
    int v12 = 0;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 32);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((void *)a1, 8, v12, 0);
  if (v8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 6, v8);
  }
  if (v9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a1, 4, v9);
  }
  uint64_t v16 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v16 >= 0xBu && (uint64_t v17 = v16[5]) != 0)
  {
    unsigned int v18 = *((unsigned __int8 *)a2 + v17);
    if (v18 >= 2) {
      abort();
    }
  }
  else
  {
    unsigned int v18 = 0;
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((void *)a1, 10, v18, 0);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, (unsigned __int16)v15 - (unsigned __int16)v14 + (unsigned __int16)v13);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air22BufferLayoutDescriptorEEEZNS3_31CloneStageInputOutputDescriptorINS3_26StageInputOutputDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_41StageInputOutputDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::BufferLayoutDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::CloneBufferLayoutDescriptor<Air::BufferLayoutDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      unsigned __int16 v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    unsigned __int16 v10 = __p;
  }
  if (v15 == v10) {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<Air::BufferLayoutDescriptor>,std::allocator<flatbuffers::Offset<Air::BufferLayoutDescriptor>>>(std::vector<flatbuffers::Offset<Air::BufferLayoutDescriptor>> const&)::t;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_255795A80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air19AttributeDescriptorEEEZNS3_31CloneStageInputOutputDescriptorINS3_26StageInputOutputDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_41StageInputOutputDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE0_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::AttributeDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::CloneAttributeDescriptor<Air::AttributeDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      unsigned __int16 v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    unsigned __int16 v10 = __p;
  }
  if (v15 == v10) {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<Air::AttributeDescriptor>,std::allocator<flatbuffers::Offset<Air::AttributeDescriptor>>>(std::vector<flatbuffers::Offset<Air::AttributeDescriptor>> const&)::t;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_255795B64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_27CloneTileFunctionDescriptorINS3_22TileFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_37TileFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::ClonePipelineBufferDescriptor<Air::PipelineBufferDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      unsigned __int16 v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    unsigned __int16 v10 = __p;
  }
  if (v15 == v10) {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<Air::PipelineBufferDescriptor>,std::allocator<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>> const&)::t;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_255795C48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air29TileColorAttachmentDescriptorEEEZNS3_27CloneTileFunctionDescriptorINS3_22TileFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_37TileFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE0_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::TileColorAttachmentDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::CloneTileColorAttachmentDescriptor<Air::TileColorAttachmentDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      unsigned __int16 v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    unsigned __int16 v10 = __p;
  }
  if (v15 == v10) {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<Air::TileColorAttachmentDescriptor>,std::allocator<flatbuffers::Offset<Air::TileColorAttachmentDescriptor>>>(std::vector<flatbuffers::Offset<Air::TileColorAttachmentDescriptor>> const&)::t;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_255795D2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<flatbuffers::Offset<Air::TileColorAttachmentDescriptor>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_255795DA8(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Air::CloneTileColorAttachmentDescriptor<Air::TileColorAttachmentDescriptor>(uint64_t a1, int *a2)
{
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v6 >= 5u && (uint64_t v7 = v6[2]) != 0) {
    uint64_t v8 = *(unsigned __int16 *)((char *)a2 + v7);
  }
  else {
    uint64_t v8 = 0;
  }
  __int16 v9 = v5 - v3 + v4;
  unsigned __int16 v10 = Air::ClonePixelFormat<Air::PixelFormat>(v8);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned short>((void *)a1, 4, v10, 0);
  return flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a1, v9);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_29CloneObjectFunctionDescriptorINS3_24ObjectFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_39ObjectFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::ClonePipelineBufferDescriptor<Air::PipelineBufferDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      unsigned __int16 v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    unsigned __int16 v10 = __p;
  }
  if (v15 == v10) {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<Air::PipelineBufferDescriptor>,std::allocator<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>> const&)::t;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_255795F18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZN11flatbuffers17FlatBufferBuilder12CreateVectorINS_6OffsetIN3Air24PipelineBufferDescriptorEEEZNS3_27CloneMeshFunctionDescriptorINS3_22MeshFunctionDescriptorEEENSt3__19enable_ifIXsr11flatbuffers11is_detectedINS3_37MeshFunctionDescriptorCloneCompatibleET_EE5valueENS2_IS7_EEE4typeERS0_PKSB_EUlmPvE_vEENS2_INS_6VectorISB_EEEEmT0_PT1_(flatbuffers::FlatBufferBuilder *a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6 = a2;
  std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>::vector(&__p, a2);
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = Air::ClonePipelineBufferDescriptor<Air::PipelineBufferDescriptor>(a4, (int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4 + *(unsigned int *)(*a3 + (v8 & 0x3FFFFFFFCLL) + 4)));
      unsigned __int16 v10 = __p;
      *(_DWORD *)((char *)__p + v_Block_object_dispose(&STACK[0x250], 8) = v9;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  else
  {
    unsigned __int16 v10 = __p;
  }
  if (v15 == v10) {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<Air::PipelineBufferDescriptor>,std::allocator<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(std::vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>> const&)::t;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = flatbuffers::FlatBufferBuilder::CreateVector<flatbuffers::String>(a1, (uint64_t)v11, (v15 - v10) >> 2);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_255795FFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__value_func<void ()(llvm::Module &,llvm::StringSet<llvm::MallocAllocator> const&)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t OUTLINED_FUNCTION_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - _Block_object_dispose(&STACK[0x250], 8) = a2;
  return a1 + 136;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void __cxx_global_array_dtor()
{
  for (uint64_t i = 0; i != -6; i -= 3)
  {
    if (SHIBYTE(MTLCompilerPluginInterface::init(char const*,void const*,unsigned long)::validPathPrefixes[i + 5]) < 0) {
      operator delete((void *)MTLCompilerPluginInterface::init(char const*,void const*,unsigned long)::validPathPrefixes[i + 3]);
    }
  }
}

void __cxx_global_array_dtor_156()
{
  for (uint64_t i = 0; i != -6; i -= 3)
  {
    if (SHIBYTE(MTLCompilerPluginInterface::init(char const*,void const*,unsigned long)::validPluginSuffixes[i + 5]) < 0) {
      operator delete((void *)MTLCompilerPluginInterface::init(char const*,void const*,unsigned long)::validPluginSuffixes[i + 3]);
    }
  }
}

unint64_t split_stack_pcs(unint64_t *a1, uint64_t a2, unsigned int *a3, int a4, unint64_t a5)
{
  uintptr_t return_addr;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t vars0;

  uint64_t v9 = pthread_self();
  stackaddr_np = (char *)pthread_get_stackaddr_np(v9);
  if (&stackaddr_np[-pthread_get_stacksize_np(v9)] > (char *)&vars0 || &vars0 > (uint64_t *)stackaddr_np) {
    uint64_t v12 = *(void **)split_stack_list();
  }
  else {
    uint64_t v12 = 0;
  }
  BOOL v37 = 0;
  uint64_t v38 = 0;
  decode_stack_bounds(v12, &v38, &v37);
  if (v12) {
    uint64_t v13 = (void *)v12[2];
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v35 = 0;
  unsigned __int8 v36 = 0;
  uint64_t v33 = v13;
  decode_stack_bounds(v13, &v36, &v35);
  *a3 = 0;
  unint64_t result = pthread_stack_frame_decode_np((uintptr_t)&vars0, 0);
  unint64_t v15 = v38;
  if (v38 > (unint64_t)&vars0) {
    return result;
  }
  if (&vars0) {
    return result;
  }
  unint64_t v16 = v37;
  if (v37 < (unint64_t)&vars0) {
    return result;
  }
  uintptr_t v17 = result;
  if (result < v38 || result > v37 || (result & 1) != 0 || result <= (unint64_t)&vars0) {
    return result;
  }
  uintptr_t v18 = (uintptr_t)&vars0;
  int v19 = a4 + 1;
  while (1)
  {
    unint64_t v20 = v17;
    if (a5) {
      break;
    }
    if (!v19) {
      goto LABEL_41;
    }
    --v19;
LABEL_25:
    unint64_t result = pthread_stack_frame_decode_np(v17, 0);
    uintptr_t v17 = result;
    if ((result < v15 || result > v16) && (result & 1) == 0)
    {
      unint64_t v21 = v36;
      if (result >= v36)
      {
        uint64_t v22 = a2;
        unsigned int v23 = a3;
        unint64_t v24 = v35;
        if (result <= v35)
        {
          uint64_t v25 = v33;
          if (v33) {
            uint64_t v25 = (void *)v33[2];
          }
          uint64_t v33 = v25;
          unint64_t result = (unint64_t)decode_stack_bounds(v25, &v36, &v35);
          unint64_t v16 = v24;
          unint64_t v15 = v21;
        }
        a3 = v23;
        a2 = v22;
      }
    }
    if (v17 >= v15 && (v17 & 1) == 0 && v17 <= v16)
    {
      uintptr_t v18 = v20;
      if (v17 > v20) {
        continue;
      }
      uintptr_t v18 = v20;
      if (v20 > v16) {
        continue;
      }
      uintptr_t v18 = v20;
      if (v20 < v15) {
        continue;
      }
    }
    return result;
  }
  if (v15 > a5 || v16 < a5 || v17 <= a5) {
    goto LABEL_25;
  }
LABEL_41:
  while (a2)
  {
    unint64_t v26 = v18;
    return_addr = 0;
    unint64_t result = pthread_stack_frame_decode_np(v18, &return_addr);
    uintptr_t v18 = result;
    if ((result < v15 || result > v16) && (result & 1) == 0)
    {
      unint64_t v27 = v36;
      if (result >= v36)
      {
        unint64_t v28 = v35;
        if (result <= v35)
        {
          BOOL v29 = v33;
          if (v33) {
            BOOL v29 = (void *)v33[2];
          }
          uint64_t v33 = v29;
          unint64_t result = (unint64_t)decode_stack_bounds(v29, &v36, &v35);
          unint64_t v16 = v28;
          unint64_t v15 = v27;
        }
      }
    }
    uintptr_t v30 = return_addr;
    uint64_t v31 = *a3;
    *a3 = v31 + 1;
    a1[v31] = v30;
    if (v18 < v15 || (v18 & 1) != 0 || v18 > v16 || v18 <= v26 && v26 <= v16 && v26 >= v15) {
      break;
    }
    LODWORD(a2) = a2 - 1;
  }
  return result;
}

void *decode_stack_bounds(void *result, void *a2, void *a3)
{
  if (result)
  {
    uint64_t v5 = *result;
    *a2 = *result;
    *a3 = result[1] + v5;
  }
  else
  {
    unint64_t v6 = pthread_self();
    stackaddr_np = pthread_get_stackaddr_np(v6);
    *a3 = stackaddr_np;
    unint64_t result = (void *)pthread_get_stacksize_np(v6);
    *a2 = stackaddr_np - (unsigned char *)result;
  }
  return result;
}

void createMTLArgumentRewritePass(MTLBoundsCheck::SharedPassData *a1)
{
}

void sub_2557965B0(_Unwind_Exception *a1)
{
  MEMORY[0x25A28E250](v1, 0x10E1C40908DD517);
  _Unwind_Resume(a1);
}

void createMTLGlobalTLSArgumentPass(MTLBoundsCheck::SharedPassData *a1)
{
}

void sub_255796640(_Unwind_Exception *a1)
{
  MEMORY[0x25A28E250](v1, 0x10E1C40C8265ECALL);
  _Unwind_Resume(a1);
}

void MTLArgumentRewritePass::~MTLArgumentRewritePass(MTLArgumentRewritePass *this)
{
  *(void *)this = &unk_2704532C8;
  uint64_t v2 = (char *)this + 136;
  llvm::DenseMap<llvm::Function *,llvm::MDTuple *,llvm::DenseMapInfo<llvm::Function *,void>,llvm::detail::DenseMapPair<llvm::Function *,llvm::MDTuple *>>::~DenseMap((uint64_t)this + 160);
  llvm::DenseMap<llvm::Function *,llvm::MDTuple *,llvm::DenseMapInfo<llvm::Function *,void>,llvm::detail::DenseMapPair<llvm::Function *,llvm::MDTuple *>>::~DenseMap((uint64_t)v2);
  llvm::Pass::~Pass(this);
}

{
  char *v2;
  uint64_t vars8;

  *(void *)this = &unk_2704532C8;
  uint64_t v2 = (char *)this + 136;
  llvm::DenseMap<llvm::Function *,llvm::MDTuple *,llvm::DenseMapInfo<llvm::Function *,void>,llvm::detail::DenseMapPair<llvm::Function *,llvm::MDTuple *>>::~DenseMap((uint64_t)this + 160);
  llvm::DenseMap<llvm::Function *,llvm::MDTuple *,llvm::DenseMapInfo<llvm::Function *,void>,llvm::detail::DenseMapPair<llvm::Function *,llvm::MDTuple *>>::~DenseMap((uint64_t)v2);
  llvm::Pass::~Pass(this);
  JUMPOUT(0x25A28E250);
}

BOOL MTLArgumentRewritePass::runOnModule(MTLArgumentRewritePass *this, llvm::Module *a2)
{
  MetalModulePass::runOnModule(this, a2);
  BOOL isLibraryModule = MTLBoundsCheck::isLibraryModule(a2, v4);
  if (!isLibraryModule)
  {
    unint64_t v6 = (char *)a2 + 24;
    for (uint64_t i = *((void *)a2 + 4); (char *)i != v6; uint64_t i = *(void *)(i + 8))
    {
      if (i) {
        uint64_t v8 = (llvm::GlobalValue *)(i - 56);
      }
      else {
        uint64_t v8 = 0;
      }
      if ((llvm::GlobalValue::isDeclaration(v8) & 1) == 0)
      {
        uint64_t v9 = *((void *)v8 + 3);
        if (8 * *(unsigned int *)(v9 + 12) != 8)
        {
          uint64_t v10 = *(void *)(v9 + 16) + 8;
          uint64_t v11 = 8 * ((8 * *(unsigned int *)(v9 + 12) - 8) >> 3);
          while (1)
          {
            uint64_t v12 = *(void *)v10;
            unsigned int v13 = *(_DWORD *)(*(void *)v10 + 8);
            if (v13 == 15)
            {
              int v14 = v13 & 0xFE;
              if (*(unsigned char *)(*((void *)this + 4) + 23))
              {
                int v16 = *(_DWORD *)(*(void *)v10 + 8);
                if (v14 == 18) {
                  int v16 = *(_DWORD *)(**(void **)(v12 + 16) + 8);
                }
                BOOL v15 = (v16 & 0xFFFFFF00) == 768;
              }
              else
              {
                BOOL v15 = 0;
              }
              if (v14 == 18) {
                unsigned int v13 = *(_DWORD *)(**(void **)(v12 + 16) + 8);
              }
              if ((v15 | MTLBoundsCheck::checkAddressSpace((MTLBoundsCheck *)(v13 >> 8)))) {
                break;
              }
            }
            v10 += 8;
            v11 -= 8;
            if (!v11) {
              goto LABEL_26;
            }
          }
          if ((*(unsigned char *)(*((void *)this + 4) + 20) & 2) != 0)
          {
            if (llvm::Function::hasFnAttribute()) {
              llvm::Function::removeFnAttr();
            }
            if (llvm::Function::hasFnAttribute()) {
              llvm::Function::removeFnAttr();
            }
          }
        }
      }
LABEL_26:
      ;
    }
    MTLArgumentRewritePass::stripDeadArguments(this);
    uint64_t EntryFunction = MetalModulePass::getEntryFunction(this);
    MTLArgumentRewritePass::instrumentMainFunction((uint64_t)this, EntryFunction, *((void *)this + 16));
  }
  return !isLibraryModule;
}

void MTLArgumentRewritePass::stripDeadArguments(MTLArgumentRewritePass *this)
{
  v41[4] = *MEMORY[0x263EF8340];
  v24[2] = *((void *)this + 5);
  uint64_t v25 = v27;
  uint64_t v26 = 0;
  uint64_t EntryFunction = MetalModulePass::getEntryFunction(this);
  uint64_t v3 = *(void *)(EntryFunction + 24);
  v24[1] = *(void *)(EntryFunction + 112);
  v40[0] = v41;
  v40[1] = (void *)0x400000000;
  BOOL v37 = v39;
  uint64_t v38 = 0x400000000;
  v35[0] = v36;
  v35[1] = (void *)0x400000000;
  long long v32 = v34;
  uint64_t v33 = 0x400000000;
  LODWORD(v24[0]) = 0;
  if (*(_DWORD *)(v3 + 12) != 1)
  {
    unsigned int v4 = 0;
    do
    {
      Impl = 0;
      uint64_t v5 = *(void *)(*((void *)this + 16) - 8 * *(unsigned int *)(*((void *)this + 16) + 8) + 16);
      unint64_t v6 = *(unsigned int **)(v5 - 8 * *(unsigned int *)(v5 + 8) + 8 * v4);
      Impl = v6;
      v27[0] = 0;
      v27[0] = *(void *)(*(void *)(v3 + 16) + 8 * (v4 + 1));
      if (*(unsigned char *)(EntryFunction + 18))
      {
        llvm::Function::BuildLazyArguments((llvm::Function *)EntryFunction);
        unsigned int v4 = v24[0];
        unint64_t v6 = (unsigned int *)Impl;
      }
      uint64_t v7 = *(void *)(EntryFunction + 88);
      int String = (void *)llvm::MDString::getString(*(llvm::MDString **)&v6[-2 * v6[2] + 2]);
      uint64_t v10 = v9;
      int hasNUsesOrMore = llvm::Value::hasNUsesOrMore((llvm::Value *)(v7 + 40 * v4));
      BOOL v13 = v10 != 14 || *String != 0x67616D692E726961 || *(void *)((char *)String + 6) != 0x6B636F6C62656761;
      if ((v13 & (hasNUsesOrMore ^ 1) & 1) == 0)
      {
        MTLMDBuilder::getMetadata<unsigned int>();
        llvm::MDNode::replaceOperandWith();
        int v14 = (llvm::MDString *)*((void *)Impl + *((_DWORD *)Impl + 2) - 1 - *((unsigned int *)Impl + 2));
        if (!*(unsigned char *)v14)
        {
          BOOL v15 = (void *)llvm::MDString::getString(v14);
          if (v16 == 14 && *v15 == 0x5F6772612E726961 && *(void *)((char *)v15 + 6) == 0x646573756E755F67)
          {
            llvm::SmallVector<llvm::Metadata *,8u>::SmallVector<llvm::MDOperand const*,void>(&v29, (char *)Impl - 8 * *((unsigned int *)Impl + 2), (char *)Impl - 8);
            Impl = (void *)llvm::MDTuple::getImpl();
            if (v29 != &v30) {
              free(v29);
            }
          }
        }
        llvm::SmallVectorImpl<unsigned int>::emplace_back<unsigned int &>((uint64_t)v35, (int *)v24);
        llvm::SmallVectorImpl<llvm::Type *>::emplace_back<llvm::Type *&>((uint64_t)v40, (uint64_t *)&Impl);
        llvm::SmallVectorImpl<llvm::Type *>::emplace_back<llvm::Type *&>((uint64_t)&v37, v27);
      }
      unsigned int v4 = LODWORD(v24[0]) + 1;
      LODWORD(v24[0]) = v4;
      unsigned int v18 = *(_DWORD *)(v3 + 12) - 1;
    }
    while (v4 < v18);
    if (v38 != v18)
    {
      uint64_t v19 = llvm::FunctionType::get();
      uint64_t v20 = *(_DWORD *)(EntryFunction + 32) & 0xF;
      __int16 v31 = 257;
      unint64_t v21 = (const llvm::Twine *)llvm::Function::Create(v19, v20, (uint64_t)&v29, *((void *)this + 6));
      v24[0] = 0;
      uint64_t v22 = (llvm::BasicBlock *)*((void *)this + 5);
      __int16 v31 = 257;
      llvm::BasicBlock::Create(v22, (llvm::LLVMContext *)&v29, v21, 0, v23);
    }
  }
  if (v32 != v34) {
    free(v32);
  }
  if (v35[0] != v36) {
    free(v35[0]);
  }
  if (v37 != v39) {
    free(v37);
  }
  if (v40[0] != v41) {
    free(v40[0]);
  }
  if (v25 != v27) {
    free(v25);
  }
}

void sub_255796F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void *a59)
{
  if (a26 != v59) {
    free(a26);
  }
  llvm::IRBuilder<llvm::ConstantFolder,llvm::IRBuilderDefaultInserter>::~IRBuilder(&a36);
  if (a59 != a15) {
    free(a59);
  }
  uint64_t v66 = *(void **)(v64 - 224);
  if (v66 != v63) {
    free(v66);
  }
  BOOL v67 = *(void **)(v64 - 192);
  if (v67 != v62) {
    free(v67);
  }
  uint64_t v68 = *(void **)(v64 - 144);
  if (v68 != v61) {
    free(v68);
  }
  if (a19 != v60) {
    free(a19);
  }
  _Unwind_Resume(a1);
}

void MTLArgumentRewritePass::instrumentMainFunction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v44[8] = *MEMORY[0x263EF8340];
  uint64_t v5 = *(unsigned int **)(a3 - 8 * *(unsigned int *)(a3 + 8) + 16);
  v37[0] = &v5[-2 * v5[2]];
  v37[1] = v5;
  llvm::SmallVector<llvm::Metadata *,8u>::SmallVector<llvm::MDOperand const*>(&v42, (char **)v37);
  unsigned __int8 v36 = 0;
  uint64_t v6 = *(void *)(a2 + 80);
  if (v6) {
    uint64_t v7 = (llvm::BasicBlock *)(v6 - 24);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t FirstNonPHIOrDbg = llvm::BasicBlock::getFirstNonPHIOrDbg(v7);
  for (int i = *(unsigned __int8 *)(FirstNonPHIOrDbg + 16); i == 59; int i = *(unsigned __int8 *)(v13 + 16))
  {
    uint64_t v10 = *(void *)(FirstNonPHIOrDbg + 32);
    uint64_t v11 = *(void *)(FirstNonPHIOrDbg + 40) + 40;
    uint64_t FirstNonPHIOrDbg = v10 - 24;
    if (v10) {
      BOOL v12 = v10 == v11;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v10 - 24;
    }
  }
  __int16 v39 = 257;
  llvm::SplitBlock();
  unsigned __int8 v36 = v7;
  v37[0] = "instrumentBlock";
  __int16 v39 = 259;
  llvm::Value::setName();
  MTLIRBuilder::MTLIRBuilder<llvm::BasicBlock *&>((uint64_t)v37, &v36);
  FirstNonPHI = (llvm::Instruction *)llvm::BasicBlock::getFirstNonPHI(v36);
  llvm::IRBuilderBase::SetInsertPoint((llvm::IRBuilderBase *)v37, FirstNonPHI);
  uint64_t v33 = a1;
  if (*(_DWORD *)(*(void *)(a1 + 32) + 4) == 1 && v43)
  {
    BOOL v15 = v42;
    uint64_t v16 = 8 * v43;
    do
    {
      uint64_t v17 = *v15;
      unsigned int v18 = (void *)(*v15 - 8 * *(unsigned int *)(*v15 + 8));
      uint64_t v19 = *(void *)(*v18 + 128);
      uint64_t v20 = (void *)(v19 + 24);
      if (*(_DWORD *)(v19 + 32) >= 0x41u) {
        uint64_t v20 = (void *)*v20;
      }
      unint64_t v21 = (llvm::MDString *)v18[1];
      uint64_t v22 = (void *)*v20;
      if (*(_WORD *)(a2 + 18)) {
        llvm::Function::BuildLazyArguments((llvm::Function *)a2);
      }
      uint64_t v23 = *(void *)(a2 + 88);
      int String = (const void *)llvm::MDString::getString(v21);
      uint64_t v26 = v25;
      unint64_t v27 = (llvm::Value *)(v23 + 40 * (void)v22);
      if ((llvm::Value::hasNUsesOrMore(v27) & 1) != 0
        && v26 == 10
        && !memcmp(String, "air.buffer", 0xAuLL)
        && MTLBoundsCheck::checkAddressSpace(v23 + 40 * (void)v22)
        && (*(unsigned char *)(*(void *)(v33 + 32) + 20) & 4) != 0)
      {
        MTLBoundsCheck::getLocationIndex(v17);
        unint64_t v28 = (llvm::Value *)llvm::ConstantInt::get();
        uint64_t v29 = *(void *)(v33 + 72);
        __int16 v35 = 257;
        Cast = (llvm::Value *)llvm::IRBuilderBase::CreateCast((uint64_t)v37, 47, (uint64_t)v27, v29, (uint64_t)v34);
        __int16 v35 = 257;
        uint64_t v31 = llvm::IRBuilderBase::CreateOr((llvm::IRBuilderBase *)v37, Cast, v28, (const llvm::Twine *)v34);
        uint64_t v32 = *(void *)v27;
        __int16 v35 = 257;
        llvm::IRBuilderBase::CreateCast((uint64_t)v37, 48, v31, v32, (uint64_t)v34);
        llvm::Value::replaceUsesOutsideBlock();
      }
      ++v15;
      v16 -= 8;
    }
    while (v16);
  }
  if (!*(_DWORD *)(v33 + 120) && *(unsigned char *)(**(void **)(*(void *)(a2 + 24) + 16) + 8) != 7) {
    *(void *)(*(void *)(*(void *)(v33 + 64) + 64) + 640) &= 0x5555555555555555uLL;
  }
  llvm::MDTuple::getImpl();
  llvm::MDNode::replaceOperandWith();
  llvm::IRBuilderDefaultInserter::~IRBuilderDefaultInserter((llvm::IRBuilderDefaultInserter *)&v41);
  llvm::IRBuilderFolder::~IRBuilderFolder((llvm::IRBuilderFolder *)&v40);
  if (v37[0] != &v38) {
    free(v37[0]);
  }
  if (v42 != v44) {
    free(v42);
  }
}

void sub_2557973F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  llvm::IRBuilder<llvm::ConstantFolder,llvm::IRBuilderDefaultInserter>::~IRBuilder((void **)va);
  BOOL v12 = *(void **)(v10 - 176);
  if (v12 != (void *)(v10 - 160)) {
    free(v12);
  }
  _Unwind_Resume(a1);
}

void *llvm::SmallVector<llvm::Metadata *,8u>::SmallVector<llvm::MDOperand const*,void>(void *a1, char *a2, char *a3)
{
  *a1 = a1 + 2;
  a1[1] = 0x800000000;
  llvm::SmallVectorImpl<llvm::Value *>::append<std::move_iterator<llvm::Value **>,void>((uint64_t)a1, a2, a3);
  return a1;
}

void sub_25579749C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = v2;
  if (*v1 != v3) {
    free(*v1);
  }
  _Unwind_Resume(exception_object);
}

void *llvm::SmallVector<llvm::Metadata *,8u>::SmallVector<llvm::MDOperand const*>(void *a1, char **a2)
{
  *a1 = a1 + 2;
  a1[1] = 0x800000000;
  llvm::SmallVectorImpl<llvm::Value *>::append<std::move_iterator<llvm::Value **>,void>((uint64_t)a1, *a2, a2[1]);
  return a1;
}

void sub_255797500(_Unwind_Exception *exception_object)
{
  uint64_t v3 = v2;
  if (*v1 != v3) {
    free(*v1);
  }
  _Unwind_Resume(exception_object);
}

void MTLGlobalTLSArgumentPass::~MTLGlobalTLSArgumentPass(MTLGlobalTLSArgumentPass *this)
{
  *(void *)this = &unk_2704532C8;
  uint64_t v2 = (char *)this + 136;
  llvm::DenseMap<llvm::Function *,llvm::MDTuple *,llvm::DenseMapInfo<llvm::Function *,void>,llvm::detail::DenseMapPair<llvm::Function *,llvm::MDTuple *>>::~DenseMap((uint64_t)this + 160);
  llvm::DenseMap<llvm::Function *,llvm::MDTuple *,llvm::DenseMapInfo<llvm::Function *,void>,llvm::detail::DenseMapPair<llvm::Function *,llvm::MDTuple *>>::~DenseMap((uint64_t)v2);
  llvm::Pass::~Pass(this);
}

{
  char *v2;
  uint64_t vars8;

  *(void *)this = &unk_2704532C8;
  uint64_t v2 = (char *)this + 136;
  llvm::DenseMap<llvm::Function *,llvm::MDTuple *,llvm::DenseMapInfo<llvm::Function *,void>,llvm::detail::DenseMapPair<llvm::Function *,llvm::MDTuple *>>::~DenseMap((uint64_t)this + 160);
  llvm::DenseMap<llvm::Function *,llvm::MDTuple *,llvm::DenseMapInfo<llvm::Function *,void>,llvm::detail::DenseMapPair<llvm::Function *,llvm::MDTuple *>>::~DenseMap((uint64_t)v2);
  llvm::Pass::~Pass(this);
  JUMPOUT(0x25A28E250);
}

uint64_t MTLGlobalTLSArgumentPass::runOnModule(MTLGlobalTLSArgumentPass *this, llvm::Module *a2)
{
  v29[20] = *MEMORY[0x263EF8340];
  MetalModulePass::runOnModule(this, a2);
  if (!MTLBoundsCheck::isLibraryModule(a2, v4))
  {
    unint64_t v27 = v29;
    uint64_t v28 = 0x400000000;
    uint64_t v5 = (void *)*((void *)a2 + 2);
    if (v5 != (void *)((char *)a2 + 8))
    {
      unint64_t v21 = this;
      do
      {
        if (v5) {
          uint64_t v6 = v5 - 7;
        }
        else {
          uint64_t v6 = 0;
        }
        if ((v6[33] & 0x1C) != 0 && *(unsigned char *)(*(void *)v6 + 8) == 15)
        {
          uint64_t Metadata = llvm::Value::getMetadata();
          if (Metadata)
          {
            llvm::Value::setMetadata();
            LOBYTE(String) = 0;
            LOBYTE(v25) = 0;
            v22[0] = v6;
            uint64_t v8 = Metadata - 8 * *(unsigned int *)(Metadata + 8);
            v22[1] = *(void **)v8;
            uint64_t v9 = *(llvm::MDString **)(v8 + 8);
            if (v9)
            {
              uint64_t String = llvm::MDString::getString(v9);
              uint64_t v24 = v10;
              if (!(_BYTE)v25) {
                LOBYTE(v25) = 1;
              }
            }
            llvm::SmallVectorImpl<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo>::emplace_back<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo&>((uint64_t)&v27, (uint64_t)v22);
          }
        }
        uint64_t v5 = (void *)v5[1];
      }
      while (v5 != (void *)((char *)a2 + 8));
      if (v28)
      {
        uint64_t EntryFunction = MetalModulePass::getEntryFunction(this);
        uint64_t v12 = EntryFunction;
        if (EntryFunction)
        {
          llvm::SmallVector<llvm::Type *,8u>::SmallVector<llvm::Type * const*,void>((uint64_t)&v26, (unsigned char *)(*(void *)(*(void *)(EntryFunction + 24) + 16) + 8), (unsigned char *)(*(void *)(*(void *)(EntryFunction + 24) + 16)+ 8 * *(unsigned int *)(*(void *)(EntryFunction + 24) + 12)));
          if (v28)
          {
            uint64_t v13 = (char *)v27;
            uint64_t v14 = 40 * v28;
            do
            {
              v22[0] = *(void **)(*(void *)v13 + 24);
              if (*((unsigned char *)v22[0] + 8) != 15) {
                v22[0] = (void *)llvm::PointerType::get();
              }
              llvm::SmallVectorImpl<llvm::Type *>::emplace_back<llvm::Type *&>((uint64_t)&v26, (uint64_t *)v22);
              v13 += 40;
              v14 -= 40;
            }
            while (v14);
          }
          uint64_t v15 = llvm::FunctionType::get();
          uint64_t v16 = *(_DWORD *)(v12 + 32) & 0xF;
          __int16 v25 = 257;
          uint64_t v17 = (const llvm::Twine *)llvm::Function::Create(v15, v16, (uint64_t)v22, *(void *)(v12 + 40));
          *((void *)v17 + 14) = *(void *)(v12 + 112);
          llvm::Value::takeName();
          llvm::Function::addFnAttr();
          *(_DWORD *)(v12 + 32) = *(_DWORD *)(v12 + 32) & 0xFFFFBFC0 | 0x4007;
          unsigned int v18 = (llvm::BasicBlock *)*((void *)v21 + 5);
          __int16 v25 = 257;
          llvm::BasicBlock::Create(v18, (llvm::LLVMContext *)v22, v17, 0, v19);
        }
      }
    }
    if (v27 != v29) {
      free(v27);
    }
  }
  return 0;
}

void sub_255797EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (STACK[0x278] != a9) {
    free((void *)STACK[0x278]);
  }
  llvm::IRBuilder<llvm::ConstantFolder,llvm::IRBuilderDefaultInserter>::~IRBuilder((void **)&STACK[0x2C8]);
  if ((unint64_t *)STACK[0x350] != &STACK[0x360]) {
    free((void *)STACK[0x350]);
  }
  if (STACK[0x3A0] != a10) {
    free((void *)STACK[0x3A0]);
  }
  _Unwind_Resume(a1);
}

uint64_t llvm::SmallVectorImpl<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo>::emplace_back<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo&>(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 >= *(_DWORD *)(a1 + 12)) {
    return llvm::SmallVectorTemplateBase<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo,true>::growAndEmplaceBack<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo&>(a1, a2);
  }
  uint64_t v3 = *(void *)a1 + 40 * v2;
  long long v4 = *(_OWORD *)a2;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(void *)(v3 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)uint64_t v3 = v4;
  *(_OWORD *)(v3 + 16) = v5;
  LODWORD(v3) = *(_DWORD *)(a1 + 8) + 1;
  *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v3;
  return *(void *)a1 + 40 * v3 - 40;
}

uint64_t llvm::SmallVectorTemplateBase<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo,true>::growAndEmplaceBack<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo&>(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v3;
  uint64_t v10 = *(void *)(a2 + 32);
  unint64_t v4 = llvm::SmallVectorTemplateCommon<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo,void>::reserveForParamAndGetAddressImpl<llvm::SmallVectorTemplateBase<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo,true>>(a1, (unint64_t)v9, 1);
  uint64_t v5 = *(void *)a1 + 40 * *(unsigned int *)(a1 + 8);
  uint64_t v6 = *(void *)(v4 + 32);
  long long v7 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)v4;
  *(_OWORD *)(v5 + 16) = v7;
  *(void *)(v5 + 32) = v6;
  LODWORD(v5) = *(_DWORD *)(a1 + 8) + 1;
  *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v5;
  return *(void *)a1 + 40 * v5 - 40;
}

unint64_t llvm::SmallVectorTemplateCommon<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo,void>::reserveForParamAndGetAddressImpl<llvm::SmallVectorTemplateBase<MTLGlobalTLSArgumentPass::runOnModule(llvm::Module &)::GVInfo,true>>(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned int *)(a1 + 8);
  if (v3 + a3 > (unint64_t)*(unsigned int *)(a1 + 12))
  {
    unint64_t v5 = *(void *)a1 + 40 * v3;
    if (*(void *)a1 > a2 || v5 <= a2) {
      llvm::SmallVectorBase<unsigned int>::grow_pod();
    }
    llvm::SmallVectorBase<unsigned int>::grow_pod();
  }
  return a2;
}

void StitchingReflection::initializeMetadataTypeMapMap(StitchingReflection *this)
{
  uint64_t v1 = MEMORY[0x270FA5388](this);
  v378.__r_.__value_.__l.__size_ = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&__s, "air.void_type");
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__str, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  }
  else {
    std::string __str = __s;
  }
  long long v80 = xmmword_2557AA520;
  char v81 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v77, "air.BOOL_type");
  if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v82, v77.__r_.__value_.__l.__data_, v77.__r_.__value_.__l.__size_);
  }
  else {
    std::string v82 = v77;
  }
  long long v83 = xmmword_2557AA530;
  char v84 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v76, "air.char_type");
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v85, v76.__r_.__value_.__l.__data_, v76.__r_.__value_.__l.__size_);
  }
  else {
    std::string v85 = v76;
  }
  long long v86 = xmmword_2557AA540;
  char v87 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v75, "air.uchar_type");
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v88, v75.__r_.__value_.__l.__data_, v75.__r_.__value_.__l.__size_);
  }
  else {
    std::string v88 = v75;
  }
  long long v89 = xmmword_2557AA550;
  char v90 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v74, "air.short_type");
  if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v91, v74.__r_.__value_.__l.__data_, v74.__r_.__value_.__l.__size_);
  }
  else {
    std::string v91 = v74;
  }
  long long v92 = xmmword_2557AA560;
  char v93 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v73, "air.ushort_type");
  if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v94, v73.__r_.__value_.__l.__data_, v73.__r_.__value_.__l.__size_);
  }
  else {
    std::string v94 = v73;
  }
  uint64_t v95 = 41;
  uint64_t v96 = 0;
  char v97 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v72, "air.int_type");
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v98, v72.__r_.__value_.__l.__data_, v72.__r_.__value_.__l.__size_);
  }
  else {
    std::string v98 = v72;
  }
  uint64_t v99 = 29;
  uint64_t v100 = 0;
  char v101 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v71, "air.uint_type");
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v102, v71.__r_.__value_.__l.__data_, v71.__r_.__value_.__l.__size_);
  }
  else {
    std::string v102 = v71;
  }
  uint64_t v103 = 33;
  uint64_t v104 = 0;
  char v105 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v70, "air.long_type");
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v106, v70.__r_.__value_.__l.__data_, v70.__r_.__value_.__l.__size_);
  }
  else {
    std::string v106 = v70;
  }
  uint64_t v107 = 81;
  uint64_t v108 = 0;
  char v109 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v69, "air.ulong_type");
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v110, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
  }
  else {
    std::string v110 = v69;
  }
  uint64_t v111 = 85;
  uint64_t v112 = 0;
  char v113 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v68, "air.half_type");
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v114, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
  }
  else {
    std::string v114 = v68;
  }
  uint64_t v115 = 16;
  uint64_t v116 = 0;
  char v117 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v67, "air.float_type");
  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v118, v67.__r_.__value_.__l.__data_, v67.__r_.__value_.__l.__size_);
  }
  else {
    std::string v118 = v67;
  }
  uint64_t v119 = 3;
  uint64_t v120 = 0;
  char v121 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v66, "air.double_type");
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v122, v66.__r_.__value_.__l.__data_, v66.__r_.__value_.__l.__size_);
  }
  else {
    std::string v122 = v66;
  }
  uint64_t v123 = 89;
  uint64_t v124 = 0;
  char v125 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v65, "air.bfloat_type");
  if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v126, v65.__r_.__value_.__l.__data_, v65.__r_.__value_.__l.__size_);
  }
  else {
    std::string v126 = v65;
  }
  uint64_t v127 = 121;
  uint64_t v128 = 0;
  char v129 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v64, "air.matrix_type");
  if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v130, v64.__r_.__value_.__l.__data_, v64.__r_.__value_.__l.__size_);
  }
  else {
    std::string v130 = v64;
  }
  uint64_t v131 = 136;
  uint64_t v132 = 0;
  char v133 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v63, "air.pointer_type");
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v134, v63.__r_.__value_.__l.__data_, v63.__r_.__value_.__l.__size_);
  }
  else {
    std::string v134 = v63;
  }
  uint64_t v135 = 60;
  uint64_t v136 = 0;
  char v137 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v62, "air.lvalue_reference_type");
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v138, v62.__r_.__value_.__l.__data_, v62.__r_.__value_.__l.__size_);
  }
  else {
    std::string v138 = v62;
  }
  uint64_t v139 = 60;
  uint64_t v140 = 0;
  char v141 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v61, "air.rvalue_reference_type");
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v142, v61.__r_.__value_.__l.__data_, v61.__r_.__value_.__l.__size_);
  }
  else {
    std::string v142 = v61;
  }
  uint64_t v143 = 60;
  uint64_t v144 = 0;
  char v145 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v60, "air.array_type");
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v146, v60.__r_.__value_.__l.__data_, v60.__r_.__value_.__l.__size_);
  }
  else {
    std::string v146 = v60;
  }
  uint64_t v147 = 2;
  uint64_t v148 = 0;
  char v149 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v59, "air.struct_type");
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v150, v59.__r_.__value_.__l.__data_, v59.__r_.__value_.__l.__size_);
  }
  else {
    std::string v150 = v59;
  }
  uint64_t v151 = 1;
  uint64_t v152 = 0;
  char v153 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v58, "air.sampler_type");
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v154, v58.__r_.__value_.__l.__data_, v58.__r_.__value_.__l.__size_);
  }
  else {
    std::string v154 = v58;
  }
  uint64_t v155 = 59;
  uint64_t v156 = 0;
  char v157 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v57, "air.instance_acceleration_structure_type");
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v158, v57.__r_.__value_.__l.__data_, v57.__r_.__value_.__l.__size_);
  }
  else {
    std::string v158 = v57;
  }
  uint64_t v159 = 118;
  uint64_t v160 = 0;
  char v161 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v56, "air.primitive_acceleration_structure_type");
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v162, v56.__r_.__value_.__l.__data_, v56.__r_.__value_.__l.__size_);
  }
  else {
    std::string v162 = v56;
  }
  uint64_t v163 = 117;
  uint64_t v164 = 0;
  char v165 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v55, "air.texture_1d_type");
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v166, v55.__r_.__value_.__l.__data_, v55.__r_.__value_.__l.__size_);
  }
  else {
    std::string v166 = v55;
  }
  uint64_t v167 = 58;
  uint64_t v168 = 0;
  char v169 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v54, "air.texture_1d_array_type");
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v170, v54.__r_.__value_.__l.__data_, v54.__r_.__value_.__l.__size_);
  }
  else {
    std::string v170 = v54;
  }
  uint64_t v171 = 58;
  uint64_t v172 = 1;
  char v173 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v53, "air.texture_2d_type");
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v174, v53.__r_.__value_.__l.__data_, v53.__r_.__value_.__l.__size_);
  }
  else {
    std::string v174 = v53;
  }
  uint64_t v175 = 58;
  uint64_t v176 = 2;
  char v177 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v52, "air.texture_2d_array_type");
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v178, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
  }
  else {
    std::string v178 = v52;
  }
  uint64_t v179 = 58;
  uint64_t v180 = 3;
  char v181 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v51, "air.texture_3d_type");
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v182, v51.__r_.__value_.__l.__data_, v51.__r_.__value_.__l.__size_);
  }
  else {
    std::string v182 = v51;
  }
  uint64_t v183 = 58;
  uint64_t v184 = 7;
  char v185 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v50, "air.texture_cube_type");
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v186, v50.__r_.__value_.__l.__data_, v50.__r_.__value_.__l.__size_);
  }
  else {
    std::string v186 = v50;
  }
  uint64_t v187 = 58;
  uint64_t v188 = 5;
  char v189 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v49, "air.texture_cube_array_type");
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v190, v49.__r_.__value_.__l.__data_, v49.__r_.__value_.__l.__size_);
  }
  else {
    std::string v190 = v49;
  }
  uint64_t v191 = 58;
  uint64_t v192 = 6;
  char v193 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v48, "air.texture_2d_ms_type");
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v194, v48.__r_.__value_.__l.__data_, v48.__r_.__value_.__l.__size_);
  }
  else {
    std::string v194 = v48;
  }
  uint64_t v195 = 58;
  uint64_t v196 = 4;
  char v197 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v47, "air.texture_2d_ms_array_type");
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v198, v47.__r_.__value_.__l.__data_, v47.__r_.__value_.__l.__size_);
  }
  else {
    std::string v198 = v47;
  }
  uint64_t v199 = 58;
  uint64_t v200 = 8;
  char v201 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v46, "air.texture_buffer_1d_type");
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v202, v46.__r_.__value_.__l.__data_, v46.__r_.__value_.__l.__size_);
  }
  else {
    std::string v202 = v46;
  }
  uint64_t v203 = 58;
  uint64_t v204 = 9;
  char v205 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v45, "air.depth_2d_type");
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v206, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
  }
  else {
    std::string v206 = v45;
  }
  uint64_t v207 = 58;
  uint64_t v208 = 2;
  char v209 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v44, "air.depth_2d_array_type");
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v210, v44.__r_.__value_.__l.__data_, v44.__r_.__value_.__l.__size_);
  }
  else {
    std::string v210 = v44;
  }
  uint64_t v211 = 58;
  uint64_t v212 = 3;
  char v213 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v43, "air.depth_cube_type");
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v214, v43.__r_.__value_.__l.__data_, v43.__r_.__value_.__l.__size_);
  }
  else {
    std::string v214 = v43;
  }
  uint64_t v215 = 58;
  uint64_t v216 = 5;
  char v217 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v42, "air.depth_cube_array_type");
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v218, v42.__r_.__value_.__l.__data_, v42.__r_.__value_.__l.__size_);
  }
  else {
    std::string v218 = v42;
  }
  uint64_t v219 = 58;
  uint64_t v220 = 6;
  char v221 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v41, "air.depth_2d_ms_type");
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v222, v41.__r_.__value_.__l.__data_, v41.__r_.__value_.__l.__size_);
  }
  else {
    std::string v222 = v41;
  }
  uint64_t v223 = 58;
  uint64_t v224 = 4;
  char v225 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v40, "air.depth_2d_ms_array_type");
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v226, v40.__r_.__value_.__l.__data_, v40.__r_.__value_.__l.__size_);
  }
  else {
    std::string v226 = v40;
  }
  uint64_t v227 = 58;
  uint64_t v228 = 8;
  char v229 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v39, "air.r8unorm_type");
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v230, v39.__r_.__value_.__l.__data_, v39.__r_.__value_.__l.__size_);
  }
  else {
    std::string v230 = v39;
  }
  uint64_t v231 = 62;
  uint64_t v232 = 0;
  char v233 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v38, "air.r8snorm_type");
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v234, v38.__r_.__value_.__l.__data_, v38.__r_.__value_.__l.__size_);
  }
  else {
    std::string v234 = v38;
  }
  uint64_t v235 = 63;
  uint64_t v236 = 0;
  char v237 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v37, "air.r16unorm_type");
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v238, v37.__r_.__value_.__l.__data_, v37.__r_.__value_.__l.__size_);
  }
  else {
    std::string v238 = v37;
  }
  uint64_t v239 = 64;
  uint64_t v240 = 0;
  char v241 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v36, "air.r16snorm_type");
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v242, v36.__r_.__value_.__l.__data_, v36.__r_.__value_.__l.__size_);
  }
  else {
    std::string v242 = v36;
  }
  uint64_t v243 = 65;
  uint64_t v244 = 0;
  char v245 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v35, "air.rg8unorm_type");
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v246, v35.__r_.__value_.__l.__data_, v35.__r_.__value_.__l.__size_);
  }
  else {
    std::string v246 = v35;
  }
  uint64_t v247 = 66;
  uint64_t v248 = 0;
  char v249 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v34, "air.rg8snorm_type");
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v250, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
  }
  else {
    std::string v250 = v34;
  }
  uint64_t v251 = 67;
  uint64_t v252 = 0;
  char v253 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v33, "air.rg16unorm_type");
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v254, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
  }
  else {
    std::string v254 = v33;
  }
  uint64_t v255 = 68;
  uint64_t v256 = 0;
  char v257 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v32, "air.rg16snorm_type");
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v258, v32.__r_.__value_.__l.__data_, v32.__r_.__value_.__l.__size_);
  }
  else {
    std::string v258 = v32;
  }
  uint64_t v259 = 69;
  uint64_t v260 = 0;
  char v261 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v31, "air.rgba8unorm_type");
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v262, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
  }
  else {
    std::string v262 = v31;
  }
  uint64_t v263 = 70;
  uint64_t v264 = 0;
  char v265 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v30, "air.rgba8snorm_type");
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v266, v30.__r_.__value_.__l.__data_, v30.__r_.__value_.__l.__size_);
  }
  else {
    std::string v266 = v30;
  }
  uint64_t v267 = 72;
  uint64_t v268 = 0;
  char v269 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v29, "air.rgba16unorm_type");
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v270, v29.__r_.__value_.__l.__data_, v29.__r_.__value_.__l.__size_);
  }
  else {
    std::string v270 = v29;
  }
  uint64_t v271 = 73;
  uint64_t v272 = 0;
  char v273 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v28, "air.rgba16snorm_type");
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v274, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
  }
  else {
    std::string v274 = v28;
  }
  uint64_t v275 = 74;
  uint64_t v276 = 0;
  char v277 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v27, "air.srgba8unorm_type");
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v278, v27.__r_.__value_.__l.__data_, v27.__r_.__value_.__l.__size_);
  }
  else {
    std::string v278 = v27;
  }
  uint64_t v279 = 71;
  uint64_t v280 = 0;
  char v281 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v26, "air.rgb10a2_type");
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v282, v26.__r_.__value_.__l.__data_, v26.__r_.__value_.__l.__size_);
  }
  else {
    std::string v282 = v26;
  }
  uint64_t v283 = 75;
  uint64_t v284 = 0;
  char v285 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v25, "air.rg11b10f_type");
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v286, v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_);
  }
  else {
    std::string v286 = v25;
  }
  uint64_t v287 = 92;
  uint64_t v288 = 0;
  char v289 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v24, "air.rgb9e5_type");
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v290, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  }
  else {
    std::string v290 = v24;
  }
  uint64_t v291 = 77;
  uint64_t v292 = 0;
  char v293 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v23, "air.visible_function_table_type");
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v294, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
  }
  else {
    std::string v294 = v23;
  }
  uint64_t v295 = 115;
  uint64_t v296 = 0;
  char v297 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v22, "air.intersection_function_table_type");
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v298, v22.__r_.__value_.__l.__data_, v22.__r_.__value_.__l.__size_);
  }
  else {
    std::string v298 = v22;
  }
  uint64_t v299 = 116;
  uint64_t v300 = 0;
  char v301 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v21, "air.vector_type");
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v302, v21.__r_.__value_.__l.__data_, v21.__r_.__value_.__l.__size_);
  }
  else {
    std::string v302 = v21;
  }
  uint64_t v303 = 137;
  uint64_t v304 = 0;
  char v305 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v20, "air.packed_vector_type");
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v306, v20.__r_.__value_.__l.__data_, v20.__r_.__value_.__l.__size_);
  }
  else {
    std::string v306 = v20;
  }
  uint64_t v307 = 137;
  uint64_t v308 = 0;
  char v309 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v19, "air.imageblock_type");
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v310, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
  }
  else {
    std::string v310 = v19;
  }
  uint64_t v311 = 138;
  uint64_t v312 = 0;
  char v313 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v18, "air.opaque_type");
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v314, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
  }
  else {
    std::string v314 = v18;
  }
  uint64_t v316 = 0;
  uint64_t v315 = 0;
  char v317 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v17, "air.llong_type");
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v318, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
  }
  else {
    std::string v318 = v17;
  }
  uint64_t v320 = 0;
  uint64_t v319 = 0;
  char v321 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v16, "air.ullong_type");
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v322, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  }
  else {
    std::string v322 = v16;
  }
  uint64_t v324 = 0;
  uint64_t v323 = 0;
  char v325 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v15, "air.function_type");
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v326, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
  }
  else {
    std::string v326 = v15;
  }
  uint64_t v328 = 0;
  uint64_t v327 = 0;
  char v329 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v14, "air.enum_type");
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v330, v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__l.__size_);
  }
  else {
    std::string v330 = v14;
  }
  uint64_t v332 = 0;
  uint64_t v331 = 0;
  char v333 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v13, "air.union_type");
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v334, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  }
  else {
    std::string v334 = v13;
  }
  uint64_t v336 = 0;
  uint64_t v335 = 0;
  char v337 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v12, "air.command_buffer_type");
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v338, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
  }
  else {
    std::string v338 = v12;
  }
  uint64_t v340 = 0;
  uint64_t v339 = 0;
  char v341 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v11, "air.compute_pipeline_state_type");
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v342, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  }
  else {
    std::string v342 = v11;
  }
  uint64_t v344 = 0;
  uint64_t v343 = 0;
  char v345 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v10, "air.render_pipeline_state_type");
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v346, v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
  }
  else {
    std::string v346 = v10;
  }
  uint64_t v348 = 0;
  uint64_t v347 = 0;
  char v349 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v9, "air.mesh_grid_properties_type");
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v350, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
  }
  else {
    std::string v350 = v9;
  }
  uint64_t v352 = 0;
  uint64_t v351 = 0;
  char v353 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v8, "air.patch_control_point_type");
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v354, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
  }
  else {
    std::string v354 = v8;
  }
  uint64_t v356 = 0;
  uint64_t v355 = 0;
  char v357 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v7, "air.interpolant_type");
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v358, v7.__r_.__value_.__l.__data_, v7.__r_.__value_.__l.__size_);
  }
  else {
    std::string v358 = v7;
  }
  uint64_t v360 = 0;
  uint64_t v359 = 0;
  char v361 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v6, "air.bounds_checked_buffer_type");
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v362, v6.__r_.__value_.__l.__data_, v6.__r_.__value_.__l.__size_);
  }
  else {
    std::string v362 = v6;
  }
  uint64_t v364 = 0;
  uint64_t v363 = 0;
  char v365 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v5, "air.mesh_type");
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v366, v5.__r_.__value_.__l.__data_, v5.__r_.__value_.__l.__size_);
  }
  else {
    std::string v366 = v5;
  }
  uint64_t v368 = 0;
  uint64_t v367 = 0;
  char v369 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v4, "air.array_of_type");
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v370, v4.__r_.__value_.__l.__data_, v4.__r_.__value_.__l.__size_);
  }
  else {
    std::string v370 = v4;
  }
  uint64_t v372 = 0;
  uint64_t v371 = 0;
  char v373 = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, "air.array_ref_of_type");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v374, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v374 = __p;
  }
  uint64_t v376 = 0;
  uint64_t v375 = 0;
  char v377 = 0;
  std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__assign_unique<std::pair<std::string const,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>> const*>((void *)(v1 + 312), &__str, &v378);
  uint64_t v2 = 456;
  do
  {
    if (SHIBYTE(v77.__r_.__value_.__r.__words[v2 + 2]) < 0) {
      operator delete(*(void **)((char *)&v77.__r_.__value_.__l.__data_ + v2 * 8));
    }
    v2 -= 6;
  }
  while (v2 * 8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v6.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v33.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v39.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v40.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v42.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v43.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v46.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v47.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v49.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v50.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v51.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v53.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v54.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v55.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v56.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v57.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v58.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v59.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v60.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v61.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v62.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v63.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v64.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v65.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v66.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v67.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v68.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v69.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v70.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v71.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v72.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v73.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v74.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v75.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v76.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v77.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_255799F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56,void *a57,uint64_t a58,int a59,__int16 a60,char a61,char a62,void *a63)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  if (a38 < 0) {
    operator delete(a33);
  }
  if (a44 < 0) {
    operator delete(a39);
  }
  if (a50 < 0) {
    operator delete(a45);
  }
  if (a56 < 0) {
    operator delete(a51);
  }
  if (a62 < 0) {
    operator delete(a57);
  }
  if (a68 < 0) {
    operator delete(a63);
  }
  if (a72 < 0) {
    operator delete(a69);
  }
  if (a74 < 0) {
    operator delete(a73);
  }
  if (a76 < 0) {
    operator delete(a75);
  }
  if (a78 < 0) {
    operator delete(a77);
  }
  if (a80 < 0) {
    operator delete(a79);
  }
  if (a82 < 0) {
    operator delete(a81);
  }
  if (a84 < 0) {
    operator delete(a83);
  }
  if (a86 < 0) {
    operator delete(a85);
  }
  if (a88 < 0) {
    operator delete(a87);
  }
  if (a90 < 0) {
    operator delete(a89);
  }
  if (a92 < 0) {
    operator delete(a91);
  }
  if (SLOBYTE(STACK[0x20F]) < 0) {
    operator delete(a93);
  }
  if (SLOBYTE(STACK[0x227]) < 0) {
    operator delete((void *)STACK[0x210]);
  }
  if (SLOBYTE(STACK[0x23F]) < 0) {
    operator delete((void *)STACK[0x228]);
  }
  if (SLOBYTE(STACK[0x257]) < 0) {
    operator delete((void *)STACK[0x240]);
  }
  if (SLOBYTE(STACK[0x26F]) < 0) {
    operator delete((void *)STACK[0x258]);
  }
  if (SLOBYTE(STACK[0x287]) < 0) {
    operator delete((void *)STACK[0x270]);
  }
  if (SLOBYTE(STACK[0x29F]) < 0) {
    operator delete((void *)STACK[0x288]);
  }
  if (SLOBYTE(STACK[0x2B7]) < 0) {
    operator delete((void *)STACK[0x2A0]);
  }
  if (SLOBYTE(STACK[0x2CF]) < 0) {
    operator delete((void *)STACK[0x2B8]);
  }
  if (SLOBYTE(STACK[0x2E7]) < 0) {
    operator delete((void *)STACK[0x2D0]);
  }
  if (SLOBYTE(STACK[0x2FF]) < 0) {
    operator delete((void *)STACK[0x2E8]);
  }
  if (SLOBYTE(STACK[0x317]) < 0) {
    operator delete((void *)STACK[0x300]);
  }
  if (SLOBYTE(STACK[0x32F]) < 0) {
    operator delete((void *)STACK[0x318]);
  }
  if (SLOBYTE(STACK[0x347]) < 0) {
    operator delete((void *)STACK[0x330]);
  }
  if (SLOBYTE(STACK[0x35F]) < 0) {
    operator delete((void *)STACK[0x348]);
  }
  if (SLOBYTE(STACK[0x377]) < 0) {
    operator delete((void *)STACK[0x360]);
  }
  if (SLOBYTE(STACK[0x38F]) < 0) {
    operator delete((void *)STACK[0x378]);
  }
  if (SLOBYTE(STACK[0x3A7]) < 0) {
    operator delete((void *)STACK[0x390]);
  }
  if (SLOBYTE(STACK[0x3BF]) < 0) {
    operator delete((void *)STACK[0x3A8]);
  }
  if (SLOBYTE(STACK[0x3D7]) < 0) {
    operator delete((void *)STACK[0x3C0]);
  }
  if (SLOBYTE(STACK[0x3EF]) < 0) {
    operator delete((void *)STACK[0x3D8]);
  }
  if (SLOBYTE(STACK[0x407]) < 0) {
    operator delete((void *)STACK[0x3F0]);
  }
  if (SLOBYTE(STACK[0x41F]) < 0) {
    operator delete((void *)STACK[0x408]);
  }
  if (SLOBYTE(STACK[0x437]) < 0) {
    operator delete((void *)STACK[0x420]);
  }
  if (SLOBYTE(STACK[0x44F]) < 0) {
    operator delete((void *)STACK[0x438]);
  }
  if (SLOBYTE(STACK[0x467]) < 0) {
    operator delete((void *)STACK[0x450]);
  }
  if (SLOBYTE(STACK[0x47F]) < 0) {
    operator delete((void *)STACK[0x468]);
  }
  if (SLOBYTE(STACK[0x497]) < 0) {
    operator delete((void *)STACK[0x480]);
  }
  if (SLOBYTE(STACK[0x4AF]) < 0) {
    operator delete((void *)STACK[0x498]);
  }
  if (SLOBYTE(STACK[0x4C7]) < 0) {
    operator delete((void *)STACK[0x4B0]);
  }
  if (SLOBYTE(STACK[0x4DF]) < 0) {
    operator delete((void *)STACK[0x4C8]);
  }
  if (SLOBYTE(STACK[0x4F7]) < 0) {
    operator delete((void *)STACK[0x4E0]);
  }
  if (SLOBYTE(STACK[0x50F]) < 0) {
    operator delete((void *)STACK[0x4F8]);
  }
  if (SLOBYTE(STACK[0x527]) < 0) {
    operator delete((void *)STACK[0x510]);
  }
  if (SLOBYTE(STACK[0x53F]) < 0) {
    operator delete((void *)STACK[0x528]);
  }
  if (SLOBYTE(STACK[0x557]) < 0) {
    operator delete((void *)STACK[0x540]);
  }
  if (SLOBYTE(STACK[0x56F]) < 0) {
    operator delete((void *)STACK[0x558]);
  }
  if (SLOBYTE(STACK[0x587]) < 0) {
    operator delete((void *)STACK[0x570]);
  }
  if (SLOBYTE(STACK[0x59F]) < 0) {
    operator delete((void *)STACK[0x588]);
  }
  if (SLOBYTE(STACK[0x5B7]) < 0) {
    operator delete((void *)STACK[0x5A0]);
  }
  if (SLOBYTE(STACK[0x5CF]) < 0) {
    operator delete((void *)STACK[0x5B8]);
  }
  if (SLOBYTE(STACK[0x5E7]) < 0) {
    operator delete((void *)STACK[0x5D0]);
  }
  if (SLOBYTE(STACK[0x5FF]) < 0) {
    operator delete((void *)STACK[0x5E8]);
  }
  if (SLOBYTE(STACK[0x617]) < 0) {
    operator delete((void *)STACK[0x600]);
  }
  if (SLOBYTE(STACK[0x62F]) < 0) {
    operator delete((void *)STACK[0x618]);
  }
  if (SLOBYTE(STACK[0x647]) < 0) {
    operator delete((void *)STACK[0x630]);
  }
  if (SLOBYTE(STACK[0x65F]) < 0) {
    operator delete((void *)STACK[0x648]);
  }
  if (SLOBYTE(STACK[0x677]) < 0) {
    operator delete((void *)STACK[0x660]);
  }
  if (SLOBYTE(STACK[0x68F]) < 0) {
    operator delete((void *)STACK[0x678]);
  }
  if (SLOBYTE(STACK[0x6A7]) < 0) {
    operator delete((void *)STACK[0x690]);
  }
  if (SLOBYTE(STACK[0x6BF]) < 0) {
    operator delete((void *)STACK[0x6A8]);
  }
  if (SLOBYTE(STACK[0x6D7]) < 0) {
    operator delete((void *)STACK[0x6C0]);
  }
  if (SLOBYTE(STACK[0x6EF]) < 0) {
    operator delete((void *)STACK[0x6D8]);
  }
  if (SLOBYTE(STACK[0x707]) < 0) {
    operator delete((void *)STACK[0x6F0]);
  }
  if (SLOBYTE(STACK[0x71F]) < 0) {
    operator delete((void *)STACK[0x708]);
  }
  for (; v93 != &STACK[0x720]; v93 -= 6)
  {
    if (*((char *)v93 - 25) < 0) {
      operator delete((void *)*(v93 - 6));
    }
  }
  _Unwind_Resume(a1);
}

void sub_25579A924()
{
}

void sub_25579A930()
{
}

uint64_t StitchingReflection::StitchingReflection(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = 0;
  *(void *)(a1 + 16) = 0;
  MTLArgumentData::MTLArgumentData((MTLArgumentData *)(a1 + 24));
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 32_Block_object_dispose(&STACK[0x250], 8) = 0u;
  *(_DWORD *)(a1 + 344) = 1065353216;
  StitchingReflection::initializeMetadataTypeMapMap((StitchingReflection *)a1);
  *(void *)(a1 + 40) = &unk_2557AB8A6;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x250], 8) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a1 + 24) & 0xFFFFFE0F | 0x140;
  uint64_t v4 = a2 - 8 * *(unsigned int *)(a2 + 8);
  std::string v5 = *(unsigned char **)(v4 + 8);
  if (v5 && ((int v6 = llvm::MDNode::classof(v5), (v7 = *(void *)(v4 + 8)) != 0) ? (v8 = v6) : (v8 = 0), v8 == 1))
  {
    StitchingReflection::getReflectionFromStitchingMetadata(a1, *(void *)(v7 - 8 * *(unsigned int *)(v7 + 8) + 8), 0, (uint64_t)&v24);
    long long v9 = v25;
    *(_OWORD *)(a1 + 264) = v24;
    *(_OWORD *)(a1 + 280) = v9;
    *(_OWORD *)(a1 + 296) = v26;
    std::string v10 = *(long long **)(a1 + 184);
    if (v10 != &v27) {
      std::vector<MTLStructMemberInfo>::__assign_with_size[abi:ne180100]<MTLStructMemberInfo*,MTLStructMemberInfo*>((uint64_t)v10, (long long *)v27, *((long long **)&v27 + 1), 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)&v27 + 1) - v27) >> 4));
    }
    *(void *)&v21[0] = &v27;
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    LODWORD(v24) = 61;
    long long v11 = v24;
    *(_OWORD *)(a1 + 280) = 0u;
    *(_OWORD *)(a1 + 296) = 0u;
    *(_OWORD *)(a1 + 264) = v11;
    *(void *)&v21[0] = &v27;
  }
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)v21);
  unint64_t v12 = *(unsigned int *)(a2 + 8);
  if (v12 >= 3)
  {
    for (unint64_t i = 2; i < v12; ++i)
    {
      uint64_t v14 = *(void *)(a2 - 8 * v12 + 8 * i);
      MTLArgumentData::MTLArgumentData((MTLArgumentData *)&v24);
      uint64_t v15 = *(unsigned int *)(v14 + 8);
      if (v15 >= 3)
      {
        *(void *)&long long v25 = llvm::MDString::getString(*(llvm::MDString **)(v14 - 8 * v15 + 16));
        *((void *)&v25 + 1) = v16;
        uint64_t v15 = *(unsigned int *)(v14 + 8);
      }
      LODWORD(v24) = v24 & 0xFFFFFE0F | 0x140;
      uint64_t v17 = *(void *)(v14 - 8 * v15 + 8);
      llvm::MDString::getString(*(llvm::MDString **)(v17 - 8 * *(unsigned int *)(v17 + 8)));
      StitchingReflection::getReflectionFromStitchingMetadata(a1, *(void *)(v17 - 8 * *(unsigned int *)(v17 + 8) + 8), 0, (uint64_t)v21);
      *(_OWORD *)&v33[40] = v21[0];
      long long v34 = v21[1];
      long long v35 = v21[2];
      if (v32 != &v22) {
        std::vector<MTLStructMemberInfo>::__assign_with_size[abi:ne180100]<MTLStructMemberInfo*,MTLStructMemberInfo*>((uint64_t)v32, v22, v23, 0x2E8BA2E8BA2E8BA3 * (v23 - v22));
      }
      unint64_t v18 = *(void *)(a1 + 8);
      if (v18 >= *(void *)(a1 + 16))
      {
        uint64_t v19 = std::vector<MTLArgumentData>::__push_back_slow_path<MTLArgumentData const&>((uint64_t *)a1, &v24);
      }
      else
      {
        std::allocator<MTLArgumentData>::construct[abi:ne180100]<MTLArgumentData,MTLArgumentData const&>(a1 + 16, *(void *)(a1 + 8), &v24);
        uint64_t v19 = v18 + 288;
        *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v18 + 288;
      }
      *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v19;
      std::string v36 = &v22;
      std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v36);
      *(void *)&v21[0] = v33;
      std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)v21);
      if (v31) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v31);
      }
      if (v30) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v30);
      }
      if (v29) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v29);
      }
      unint64_t v12 = *(unsigned int *)(a2 + 8);
    }
  }
  return a1;
}

void sub_25579AC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, MTLArgumentData *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
}

void StitchingReflection::getReflectionFromStitchingMetadata(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  StitchingReflection::stitchingArgumentTypeFromNode(a1, a2, &v11);
  unsigned __int32 v8 = v11.n128_u32[0];
  if (v11.n128_i64[0] <= 44)
  {
    if (v11.n128_i64[0] > 28)
    {
      if (v11.n128_i64[0] > 36)
      {
        if (v11.n128_u64[0] != 37 && v11.n128_u64[0] != 41) {
          goto LABEL_38;
        }
      }
      else if (v11.n128_u64[0] != 29 && v11.n128_u64[0] != 33)
      {
        goto LABEL_38;
      }
    }
    else
    {
      if (v11.n128_i64[0] <= 2)
      {
        if (v11.n128_u64[0] == 1)
        {
          StitchingReflection::initStructType(a1, a2, a3, a4);
          goto LABEL_5;
        }
        if (v11.n128_u64[0] == 2)
        {
          StitchingReflection::initArrayType(a1, a2, a4);
          goto LABEL_5;
        }
LABEL_38:
        long long v9 = v14;
        *(_OWORD *)a4 = v13;
        *(_OWORD *)(a4 + 16) = v9;
        long long v10 = v16;
        *(_OWORD *)(a4 + 32) = v15;
        *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x250], 8) = v10;
        *(void *)(a4 + 64) = v17;
        long long v16 = 0uLL;
        uint64_t v17 = 0;
        goto LABEL_5;
      }
      if (v11.n128_u64[0] != 3 && v11.n128_u64[0] != 16) {
        goto LABEL_38;
      }
    }
LABEL_4:
    *(void *)(a4 + 64) = 0;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x250], 8) = 0u;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = v8;
    goto LABEL_5;
  }
  if (v11.n128_i64[0] > 80)
  {
    if (v11.n128_i64[0] <= 120)
    {
      if (v11.n128_u64[0] != 81 && v11.n128_u64[0] != 85 && v11.n128_u64[0] != 89) {
        goto LABEL_38;
      }
    }
    else
    {
      if (v11.n128_i64[0] > 136)
      {
        if (v11.n128_u64[0] == 137)
        {
          StitchingReflection::initVectorType(a1, a2, a4);
          goto LABEL_5;
        }
        if (v11.n128_u64[0] == 138)
        {
          StitchingReflection::initImageBlockType(a1, a2, (void *)a4);
          goto LABEL_5;
        }
        goto LABEL_38;
      }
      if (v11.n128_u64[0] != 121)
      {
        if (v11.n128_u64[0] == 136)
        {
          StitchingReflection::initMatrixType(a1, a2, a4);
          goto LABEL_5;
        }
        goto LABEL_38;
      }
    }
    goto LABEL_4;
  }
  switch(v11.n128_u64[0])
  {
    case '-':
    case '1':
    case '5':
    case '=':
      goto LABEL_4;
    case ':':
      StitchingReflection::initTextureType(a1, a2, v11.n128_i32[2], v12, a4);
      break;
    case ';':
      *(void *)(a4 + 64) = 0;
      *(_OWORD *)(a4 + 32) = 0u;
      *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x250], 8) = 0u;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      *(_DWORD *)a4 = 59;
      break;
    case '<':
      StitchingReflection::initPointerType(a1, a2, a4);
      break;
    default:
      goto LABEL_38;
  }
LABEL_5:
  v11.n128_u64[0] = (unint64_t)&v16;
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
}

void sub_25579AEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  a10 = (void **)&a19;
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

double StitchingReflection::initScalarType@<D0>(MTLDataType a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 64) = 0;
  double result = 0.0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 4_Block_object_dispose(&STACK[0x250], 8) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)a2 = a1;
  return result;
}

uint64_t StitchingReflection::getMatrixType(uint64_t a1, uint64_t a2)
{
  StitchingReflection::stitchingArgumentTypeFromNode(a1, *(void *)(a2 - 8 * *(unsigned int *)(a2 + 8) + 32), &v17);
  uint64_t v3 = a2 - 8 * *(unsigned int *)(a2 + 8);
  uint64_t v4 = *(void *)(*(void *)(v3 + 40) + 128);
  if (*(unsigned char *)(v4 + 16) == 16)
  {
    std::string v5 = (void *)(v4 + 24);
    if (*(_DWORD *)(v4 + 32) >= 0x41u) {
      std::string v5 = (void *)*v5;
    }
    int v6 = *(_DWORD *)v5;
  }
  else
  {
    int v6 = -1;
  }
  uint64_t v7 = *(void *)(*(void *)(v3 + 48) + 128);
  if (*(unsigned char *)(v7 + 16) == 16)
  {
    unsigned __int32 v8 = (void *)(v7 + 24);
    if (*(_DWORD *)(v7 + 32) >= 0x41u) {
      unsigned __int32 v8 = (void *)*v8;
    }
    unsigned int v9 = *(_DWORD *)v8 - 2;
  }
  else
  {
    unsigned int v9 = -3;
  }
  if (v17.n128_u64[0] == 121)
  {
    uint64_t v11 = v9 + 133;
    if (v9 >= 3) {
      uint64_t v11 = 0;
    }
    uint64_t v12 = v9 + 130;
    if (v9 >= 3) {
      uint64_t v12 = 0;
    }
    BOOL v13 = v9 >= 3;
    uint64_t v14 = v9 + 127;
    goto LABEL_30;
  }
  if (v17.n128_u64[0] == 16)
  {
    uint64_t v11 = v9 + 26;
    if (v9 >= 3) {
      uint64_t v11 = 0;
    }
    uint64_t v12 = v9 + 23;
    if (v9 >= 3) {
      uint64_t v12 = 0;
    }
    BOOL v13 = v9 >= 3;
    uint64_t v14 = v9 + 20;
LABEL_30:
    if (v13) {
      uint64_t v14 = 0;
    }
    if (v6 != 2) {
      uint64_t v14 = 0;
    }
    if (v6 == 3) {
      uint64_t v14 = v12;
    }
    if (v6 == 4) {
      return v11;
    }
    else {
      return v14;
    }
  }
  if (v17.n128_u64[0] != 3) {
    return 0;
  }
  if (v6 == 4)
  {
    BOOL v15 = v9 >= 3;
    uint64_t v16 = v9 + 13;
  }
  else
  {
    if (v6 != 3)
    {
      if (v6 == 2 && v9 < 3) {
        return v9 + 7;
      }
      return 0;
    }
    BOOL v15 = v9 >= 3;
    uint64_t v16 = v9 + 10;
  }
  if (v15) {
    return 0;
  }
  else {
    return v16;
  }
}

__n128 StitchingReflection::stitchingArgumentTypeFromNode@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  uint64_t String = (void *)llvm::MDString::getString(*(llvm::MDString **)(a2 - 8 * *(unsigned int *)(a2 + 8)));
  uint64_t v7 = (void *)(a1 + 312);
  if (String)
  {
    std::string::basic_string[abi:ne180100](__p, String, v6);
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v11 = 0;
  }
  unsigned __int32 v8 = std::__hash_table<std::__hash_value_type<std::string,MTLCompilerDataType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLCompilerDataType>>>::find<std::string>(v7, (unsigned __int8 *)__p);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  __n128 result = *(__n128 *)(v8 + 40);
  *a3 = result;
  a3[1].n128_u64[0] = *((void *)v8 + 7);
  return result;
}

uint64_t StitchingReflection::getVectorType(uint64_t a1, uint64_t a2)
{
  StitchingReflection::stitchingArgumentTypeFromNode(a1, *(void *)(a2 - 8 * *(unsigned int *)(a2 + 8) + 32), &v19);
  uint64_t v3 = *(void *)(*(void *)(a2 - 8 * *(unsigned int *)(a2 + 8) + 40) + 128);
  if (*(unsigned char *)(v3 + 16) == 16)
  {
    uint64_t v4 = (void *)(v3 + 24);
    if (*(_DWORD *)(v3 + 32) >= 0x41u) {
      uint64_t v4 = (void *)*v4;
    }
    unsigned int v5 = *(_DWORD *)v4 - 2;
  }
  else
  {
    unsigned int v5 = -3;
  }
  if (v19.n128_i64[0] > 44)
  {
    uint64_t v6 = v5 + 82;
    if (v5 >= 3) {
      uint64_t v6 = 0;
    }
    uint64_t v14 = v5 + 86;
    if (v5 >= 3) {
      uint64_t v14 = 0;
    }
    uint64_t v15 = v5 + 122;
    if (v5 >= 3) {
      uint64_t v15 = 0;
    }
    if (v19.n128_u64[0] != 121) {
      uint64_t v15 = 0;
    }
    if (v19.n128_u64[0] != 85) {
      uint64_t v14 = v15;
    }
    if (v19.n128_u64[0] != 81) {
      uint64_t v6 = v14;
    }
    uint64_t v16 = v5 + 46;
    if (v5 >= 3) {
      uint64_t v16 = 0;
    }
    uint64_t v17 = v5 + 50;
    if (v5 >= 3) {
      uint64_t v17 = 0;
    }
    BOOL v11 = v5 >= 3;
    uint64_t v12 = v5 + 54;
    if (v11) {
      uint64_t v12 = 0;
    }
    if (v19.n128_u64[0] != 53) {
      uint64_t v12 = 0;
    }
    if (v19.n128_u64[0] == 49) {
      uint64_t v12 = v17;
    }
    if (v19.n128_u64[0] == 45) {
      uint64_t v12 = v16;
    }
    BOOL v13 = (int64_t)v19.n128_u64[0] <= 80;
  }
  else
  {
    uint64_t v6 = v5 + 34;
    if (v5 >= 3) {
      uint64_t v6 = 0;
    }
    uint64_t v7 = v5 + 38;
    if (v5 >= 3) {
      uint64_t v7 = 0;
    }
    uint64_t v8 = v5 + 42;
    if (v5 >= 3) {
      uint64_t v8 = 0;
    }
    if (v19.n128_u64[0] != 41) {
      uint64_t v8 = 0;
    }
    if (v19.n128_u64[0] != 37) {
      uint64_t v7 = v8;
    }
    if (v19.n128_u64[0] != 33) {
      uint64_t v6 = v7;
    }
    uint64_t v9 = v5 + 4;
    if (v5 >= 3) {
      uint64_t v9 = 0;
    }
    uint64_t v10 = v5 + 17;
    if (v5 >= 3) {
      uint64_t v10 = 0;
    }
    BOOL v11 = v5 >= 3;
    uint64_t v12 = v5 + 30;
    if (v11) {
      uint64_t v12 = 0;
    }
    if (v19.n128_u64[0] != 29) {
      uint64_t v12 = 0;
    }
    if (v19.n128_u64[0] == 16) {
      uint64_t v12 = v10;
    }
    if (v19.n128_u64[0] == 3) {
      uint64_t v12 = v9;
    }
    BOOL v13 = (int64_t)v19.n128_u64[0] <= 32;
  }
  if (v13) {
    return v12;
  }
  else {
    return v6;
  }
}

unint64_t StitchingReflection::getDataType(uint64_t a1, uint64_t a2)
{
  StitchingReflection::stitchingArgumentTypeFromNode(a1, *(void *)(a2 - 8 * *(unsigned int *)(a2 + 8) + 32), &v3);
  return v3.n128_u64[0];
}

uint64_t StitchingReflection::getAccessType(uint64_t a1, uint64_t a2)
{
  uint64_t String = (const void *)llvm::MDString::getString(*(llvm::MDString **)(a2 - 8 * *(unsigned int *)(a2 + 8) + 40));
  if (v3 == 5) {
    return 2 * (memcmp(String, "write", 5uLL) == 0);
  }
  if (v3 == 10) {
    return memcmp(String, "read_write", 0xAuLL) == 0;
  }
  return 0;
}

unint64_t StitchingReflection::getTypeInfoDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(a2 - 8 * *(unsigned int *)(a2 + 8));
  uint64_t v3 = *(void *)(v2[1] + 128);
  if (*(unsigned char *)(v3 + 16) == 16)
  {
    uint64_t v4 = (unsigned int *)(v3 + 24);
    if (*(_DWORD *)(v3 + 32) >= 0x41u) {
      uint64_t v4 = *(unsigned int **)v4;
    }
    uint64_t v5 = *v4;
  }
  else
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  uint64_t v6 = *(void *)(v2[2] + 128);
  if (*(unsigned char *)(v6 + 16) == 16)
  {
    uint64_t v7 = (void *)(v6 + 24);
    if (*(_DWORD *)(v6 + 32) >= 0x41u) {
      uint64_t v7 = (void *)*v7;
    }
    unint64_t v8 = *v7 << 32;
  }
  else
  {
    unint64_t v8 = 0xFFFFFFFF00000000;
  }
  uint64_t v9 = (unsigned char *)v2[3];
  if (v9) {
    llvm::MDNode::classof(v9);
  }
  return v8 | v5;
}

void StitchingReflection::traverseStruct(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned int a4)
{
  uint64_t v4 = a2 - 8 * *(unsigned int *)(a2 + 8);
  uint64_t v5 = *(unsigned char **)(v4 + 40);
  if (v5)
  {
    int v8 = llvm::MDNode::classof(v5);
    uint64_t v57 = *(void *)(v4 + 40);
    if (v8 && *(void *)(v4 + 40) != 0)
    {
      uint64_t v56 = *(unsigned int *)(v57 + 8);
      if (v56)
      {
        uint64_t v10 = 0;
        unsigned int v55 = a4;
        do
        {
          int v72 = 0;
          long long v71 = 0u;
          memset(v70, 0, sizeof(v70));
          uint64_t v73 = 0;
          std::string v74 = 0;
          int v75 = 0;
          long long v76 = xmmword_2557AA110;
          memset(v77, 0, sizeof(v77));
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          uint64_t v11 = *(void *)(v57 - 8 * *(unsigned int *)(v57 + 8) + 8 * v10);
          std::string v69 = 0;
          long long v67 = 0u;
          long long __p = 0u;
          uint64_t v12 = *(unsigned int *)(v11 + 8);
          BOOL v13 = (void *)(v11 - 8 * v12);
          uint64_t v14 = *(void *)(v13[1] + 128);
          if (*(unsigned char *)(v14 + 16) == 16)
          {
            uint64_t v15 = (void *)(v14 + 24);
            if (*(_DWORD *)(v14 + 32) >= 0x41u) {
              uint64_t v15 = (void *)*v15;
            }
            int v16 = *(_DWORD *)v15;
          }
          else
          {
            int v16 = -1;
          }
          int v64 = v16;
          uint64_t v17 = *(void *)(v13[2] + 128);
          if (*(unsigned char *)(v17 + 16) == 16)
          {
            unint64_t v18 = (void *)(v17 + 24);
            if (*(_DWORD *)(v17 + 32) >= 0x41u) {
              unint64_t v18 = (void *)*v18;
            }
            int v19 = *(_DWORD *)v18;
          }
          else
          {
            int v19 = -1;
          }
          int v65 = v19;
          uint64_t v66 = v13[3];
          std::string v20 = (llvm::MDString *)v13[4];
          if (v20)
          {
            uint64_t String = (void *)llvm::MDString::getString(v20);
            uint64_t v23 = -(uint64_t)*(unsigned int *)(v11 + 8);
          }
          else
          {
            uint64_t v22 = 0;
            uint64_t v23 = -v12;
            uint64_t String = &unk_2557AB8A6;
          }
          *(void *)&long long v67 = String;
          *((void *)&v67 + 1) = v22;
          uint64_t v24 = v11 + 8 * v23;
          long long v25 = *(unsigned char **)(v24 + 40);
          if (v25)
          {
            int v26 = llvm::MDNode::classof(v25);
            uint64_t v27 = *(void *)(v24 + 40);
            int v28 = v27 ? v26 : 0;
            if (v28 == 1)
            {
              unint64_t v29 = *(unsigned int *)(v27 + 8);
              std::vector<AttributeDescriptor>::reserve((void **)&__p, v29);
              if (v29)
              {
                for (uint64_t i = 0; i != v29; ++i)
                {
                  uint64_t v31 = *(void *)(v27 - 8 * *(unsigned int *)(v27 + 8) + 8 * i);
                  std::string v32 = (void *)llvm::MDString::getString(*(llvm::MDString **)(v31 - 8 * *(unsigned int *)(v31 + 8)));
                  if (v33 == 22
                    && (*v32 == 0x646E65722E726961 ? (BOOL v34 = v32[1] == 0x65677261745F7265) : (BOOL v34 = 0),
                        v34 ? (BOOL v35 = *(void *)((char *)v32 + 14) == 0x727474615F746567) : (BOOL v35 = 0),
                        v35))
                  {
                    uint64_t v45 = *(void *)(*(void *)(v31 - 8 * *(unsigned int *)(v31 + 8) + 8) + 128);
                    if (*(unsigned char *)(v45 + 16) == 16)
                    {
                      std::string v46 = (void *)(v45 + 24);
                      if (*(_DWORD *)(v45 + 32) >= 0x41u) {
                        std::string v46 = (void *)*v46;
                      }
                      int v37 = *(_DWORD *)v46;
                    }
                    else
                    {
                      int v37 = -1;
                    }
                    __int16 v36 = 10;
                  }
                  else
                  {
                    __int16 v36 = 0;
                    int v37 = 0;
                  }
                  uint64_t v38 = *((void *)&__p + 1);
                  if (*((void *)&__p + 1) >= (unint64_t)v69)
                  {
                    uint64_t v40 = (uint64_t)(*((void *)&__p + 1) - __p) >> 5;
                    unint64_t v41 = v40 + 1;
                    if ((unint64_t)(v40 + 1) >> 59) {
                      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
                    }
                    uint64_t v42 = (uint64_t)&v69[-__p];
                    if ((uint64_t)&v69[-__p] >> 4 > v41) {
                      unint64_t v41 = v42 >> 4;
                    }
                    if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFE0) {
                      unint64_t v43 = 0x7FFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v43 = v41;
                    }
                    if (v43) {
                      std::string v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VaryingInfo>>((uint64_t)&v69, v43);
                    }
                    else {
                      std::string v44 = 0;
                    }
                    std::string v47 = &v44[32 * v40];
                    *(_WORD *)std::string v47 = v36;
                    *((_WORD *)v47 + 1) = 0;
                    *((_DWORD *)v47 + 1) = v37;
                    *((void *)v47 + 2) = 0;
                    *((void *)v47 + 3) = 0;
                    *((void *)v47 + 1) = 0;
                    std::string v48 = (char *)*((void *)&__p + 1);
                    std::string v49 = (char *)__p;
                    std::string v50 = v47;
                    if (*((void *)&__p + 1) != (void)__p)
                    {
                      do
                      {
                        long long v51 = *((_OWORD *)v48 - 1);
                        *((_OWORD *)v50 - 2) = *((_OWORD *)v48 - 2);
                        *((_OWORD *)v50 - 1) = v51;
                        v50 -= 32;
                        v48 -= 32;
                      }
                      while (v48 != v49);
                      std::string v48 = (char *)__p;
                    }
                    std::string v39 = v47 + 32;
                    *(void *)&long long __p = v50;
                    *((void *)&__p + 1) = v47 + 32;
                    std::string v69 = &v44[32 * v43];
                    if (v48) {
                      operator delete(v48);
                    }
                  }
                  else
                  {
                    **((_WORD **)&__p + 1) = v36;
                    *(_WORD *)(v38 + 2) = 0;
                    *(_DWORD *)(v38 + 4) = v37;
                    *(void *)(v38 + 16) = 0;
                    *(void *)(v38 + 24) = 0;
                    std::string v39 = (char *)(v38 + 32);
                    *(void *)(v38 + _Block_object_dispose(&STACK[0x250], 8) = 0;
                  }
                  *((void *)&__p + 1) = v39;
                }
              }
            }
          }
          v70[0] = v67;
          LODWORD(v71) = v64;
          for (uint64_t j = __p; j != *((void *)&__p + 1); j += 32)
          {
            if (*(_WORD *)j == 10) {
              LODWORD(v76) = *(_DWORD *)(j + 4);
            }
          }
          StitchingReflection::getReflectionFromStitchingMetadata(&v59, a1, v66, v55);
          if (v55)
          {
            DWORD1(v60) = HIDWORD(v59);
            HIDWORD(v59) = v59;
            LODWORD(v59) = 60;
          }
          long long v78 = v59;
          long long v79 = v60;
          long long v80 = v61;
          std::vector<MTLStructMemberInfo>::__assign_with_size[abi:ne180100]<MTLStructMemberInfo*,MTLStructMemberInfo*>((uint64_t)&v77[8], v62, v63, 0x2E8BA2E8BA2E8BA3 * (v63 - v62));
          unint64_t v53 = a3[1];
          if (v53 >= a3[2])
          {
            uint64_t v54 = std::vector<MTLStructMemberInfo>::__push_back_slow_path<MTLStructMemberInfo const&>(a3, v70);
          }
          else
          {
            std::allocator<MTLStructMemberInfo>::construct[abi:ne180100]<MTLStructMemberInfo,MTLStructMemberInfo const&>((uint64_t)(a3 + 2), a3[1], v70);
            uint64_t v54 = v53 + 176;
            a3[1] = v53 + 176;
          }
          a3[1] = v54;
          char v81 = &v62;
          std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v81);
          if ((void)__p)
          {
            *((void *)&__p + 1) = __p;
            operator delete((void *)__p);
          }
          *(void *)&long long v59 = &v77[8];
          std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
          if (v74) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v74);
          }
          ++v10;
        }
        while (v10 != v56);
      }
    }
  }
}

void sub_25579B9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *__p,uint64_t a37,uint64_t a38,char a39)
{
  if (__p) {
    operator delete(__p);
  }
  MTLStructMemberInfo::~MTLStructMemberInfo((MTLStructMemberInfo *)&a39);
  _Unwind_Resume(a1);
}

unint64_t StitchingReflection::initMatrixType@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 64) = 0;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 4_Block_object_dispose(&STACK[0x250], 8) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  uint64_t MatrixType = StitchingReflection::getMatrixType(a1, a2);
  *(_DWORD *)a3 = MatrixType;
  unint64_t result = StitchingReflection::getTypeInfoDescriptor(MatrixType, a2);
  *(void *)(a3 + 4) = result;
  return result;
}

void sub_25579BA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  a10 = (void **)(v10 + 48);
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

unint64_t StitchingReflection::initVectorType@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 64) = 0;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 4_Block_object_dispose(&STACK[0x250], 8) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  uint64_t VectorType = StitchingReflection::getVectorType(a1, a2);
  *(_DWORD *)a3 = VectorType;
  unint64_t result = StitchingReflection::getTypeInfoDescriptor(VectorType, a2);
  *(void *)(a3 + 4) = result;
  return result;
}

void sub_25579BAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  a10 = (void **)(v10 + 48);
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

double StitchingReflection::initSamplerType@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x250], 8) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)a1 = 59;
  return result;
}

uint64_t StitchingReflection::initTextureType@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, unsigned __int8 a4@<W3>, uint64_t a5@<X8>)
{
  *(_OWORD *)a5 = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  *(void *)(a5 + 64) = 0;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 4_Block_object_dispose(&STACK[0x250], 8) = 0u;
  *(_DWORD *)a5 = 58;
  *(_DWORD *)(a5 + 16) = (a4 << 16) | a3;
  StitchingReflection::stitchingArgumentTypeFromNode(a1, *(void *)(a2 - 8 * *(unsigned int *)(a2 + 8) + 32), v9);
  *(_DWORD *)(a5 + 12) = v9[0].n128_u32[0];
  uint64_t result = StitchingReflection::getAccessType(v7, a2);
  *(_DWORD *)(a5 + 24) = result;
  return result;
}

void sub_25579BB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)(v12 + 48);
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void StitchingReflection::initPointerType(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 64) = 0;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 4_Block_object_dispose(&STACK[0x250], 8) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = 60;
  uint64_t v5 = *(void *)(a2 - 8 * *(unsigned int *)(a2 + 8) + 32);
  StitchingReflection::getTypeInfoDescriptor(a1, v5);
  *(_DWORD *)(a3 + 24) = v6;
  StitchingReflection::getReflectionFromStitchingMetadata(&v8, a1, v5, 0);
  *(void *)(a3 + 4) = v9;
  int v7 = v8;
  *(_DWORD *)(a3 + 12) = v8;
  *(_DWORD *)(a3 + 20) = v10;
  if (v7 == 1)
  {
    *(_OWORD *)(a3 + 32) = v11;
    if (&v8 != (int *)a3) {
      std::vector<MTLStructMemberInfo>::__assign_with_size[abi:ne180100]<MTLStructMemberInfo*,MTLStructMemberInfo*>(a3 + 48, v12, v13, 0x2E8BA2E8BA2E8BA3 * (v13 - v12));
    }
  }
  uint64_t v14 = &v12;
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
}

void sub_25579BC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v11 - 40) = v10;
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)(v11 - 40));
  a9 = (void **)(v9 + 48);
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void StitchingReflection::initStructType(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x250], 8) = 0u;
  int v8 = (uint64_t *)(a4 + 48);
  *(void *)(a4 + 64) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_DWORD *)a4 = 1;
  *(void *)(a4 + 4) = StitchingReflection::getTypeInfoDescriptor(a1, a2);
  uint64_t v9 = *(llvm::MDString **)(a2 - 8 * *(unsigned int *)(a2 + 8) + 32);
  if (v9)
  {
    uint64_t String = (void *)llvm::MDString::getString(v9);
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t String = &unk_2557AB8A6;
  }
  *(void *)(a4 + 32) = String;
  *(void *)(a4 + 40) = v11;
  std::vector<MTLStructMemberInfo>::__assign_with_size[abi:ne180100]<MTLStructMemberInfo const*,MTLStructMemberInfo const*>((uint64_t)v8, 0, 0, 0);
  StitchingReflection::traverseStruct(a1, a2, v8, a3);
}

void sub_25579BD6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void StitchingReflection::initArrayType(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 64) = 0;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 4_Block_object_dispose(&STACK[0x250], 8) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = 2;
  *(void *)(a3 + 4) = StitchingReflection::getTypeInfoDescriptor(a1, a2);
  StitchingReflection::stitchingArgumentTypeFromNode(a1, *(void *)(a2 - 8 * *(unsigned int *)(a2 + 8) + 32), v9);
  *(_DWORD *)(a3 + 12) = v9[0].n128_u32[0];
  uint64_t v6 = *(void *)(*(void *)(a2 - 8 * *(unsigned int *)(a2 + 8) + 40) + 128);
  if (*(unsigned char *)(v6 + 16) == 16)
  {
    int v7 = (void *)(v6 + 24);
    if (*(_DWORD *)(v6 + 32) >= 0x41u) {
      int v7 = (void *)*v7;
    }
    int v8 = *(_DWORD *)v7;
  }
  else
  {
    int v8 = -1;
  }
  *(_DWORD *)(a3 + 2_Block_object_dispose(&STACK[0x250], 8) = v8;
}

void sub_25579BE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)(v12 + 48);
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void *StitchingReflection::initImageBlockType@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t result = StitchingReflection::getReflectionFromStitchingMetadata(a3, a1, *(void *)(a2 - 8 * *(unsigned int *)(a2 + 8) + 40), 1);
  *(_DWORD *)a3 = 138;
  return result;
}

void StitchingReflection::~StitchingReflection(StitchingReflection *this)
{
  std::__hash_table<std::__hash_value_type<std::string,MTLCompilerDataType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLCompilerDataType>>>::~__hash_table((uint64_t)this + 312);
  uint64_t v5 = (void **)((char *)this + 224);
  std::vector<MTLStructMemberInfo>::__destroy_vector::operator()[abi:ne180100](&v5);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 22);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 20);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 18);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = (void **)this;
  std::vector<MTLArgumentData>::__destroy_vector::operator()[abi:ne180100](&v5);
}

uint64_t ___ZN29MTLGenerateReflectionDataPass22generateReflectionDataEPN4llvm6ModuleEjPmjRKNSt3__16vectorI20PostVertexDumpOutputNS4_9allocatorIS6_EEEEPvmS3__block_invoke_3(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t ___ZN29MTLGenerateReflectionDataPass22generateReflectionDataEPN4llvm6ModuleEjPmjRKNSt3__16vectorI20PostVertexDumpOutputNS4_9allocatorIS6_EEEEPvmS3__block_invoke_4(uint64_t result, void *a2)
{
  uint64_t v2 = a2[1];
  if (!v2 || *(unsigned char *)(v2 + *a2 - 1)) {
    LODWORD(v2) = v2 + 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

void serializePostVertexDumpOutputs(void *a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, void))(a2 + 16))(a2, -1431655765 * ((a1[1] - *a1) >> 5));
  uint64_t v16 = a1[1];
  if (*a1 != v16)
  {
    uint64_t v6 = *a1 + 64;
    do
    {
      long long v19 = *(_OWORD *)(v6 - 64);
      if (*(char *)(v6 - 25) < 0)
      {
        std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)(v6 - 48), *(void *)(v6 - 40));
      }
      else
      {
        long long v7 = *(_OWORD *)(v6 - 48);
        v20.__r_.__value_.__r.__words[2] = *(void *)(v6 - 32);
        *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v7;
      }
      uint64_t v8 = v6 - 64;
      long long v9 = *(_OWORD *)(v6 - 24);
      uint64_t v22 = *(void *)(v6 - 8);
      long long v21 = v9;
      if (*(char *)(v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v6, *(void *)(v6 + 8));
      }
      else
      {
        long long v10 = *(_OWORD *)v6;
        __p.__r_.__value_.__r.__words[2] = *(void *)(v6 + 16);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v10;
      }
      unsigned int v24 = *(_DWORD *)(v6 + 24);
      std::string::size_type size = HIBYTE(v20.__r_.__value_.__r.__words[2]);
      uint64_t v12 = (std::string *)v20.__r_.__value_.__r.__words[0];
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = v20.__r_.__value_.__l.__size_;
      }
      else {
        uint64_t v12 = &v20;
      }
      uint64_t v17 = v12;
      std::string::size_type v18 = size;
      (*(void (**)(uint64_t, std::string **))(a3 + 16))(a3, &v17);
      (*(void (**)(uint64_t, void))(a2 + 16))(a2, v21);
      uint64_t v13 = v22;
      (*(void (**)(uint64_t, void))(a2 + 16))(a2, DWORD2(v21));
      (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v13);
      std::string::size_type v14 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v14 = __p.__r_.__value_.__l.__size_;
      }
      else {
        p_p = &__p;
      }
      uint64_t v17 = p_p;
      std::string::size_type v18 = v14;
      (*(void (**)(uint64_t, std::string **))(a3 + 16))(a3, &v17);
      (*(void (**)(uint64_t, void))(a2 + 16))(a2, v24);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v20.__r_.__value_.__l.__data_);
      }
      v6 += 96;
    }
    while (v8 + 96 != v16);
  }
}

void sub_25579C1A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN29MTLGenerateReflectionDataPass22generateReflectionDataEPN4llvm6ModuleEjPmjRKNSt3__16vectorI20PostVertexDumpOutputNS4_9allocatorIS6_EEEEPvmS3__block_invoke_5(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t ___ZN29MTLGenerateReflectionDataPass22generateReflectionDataEPN4llvm6ModuleEjPmjRKNSt3__16vectorI20PostVertexDumpOutputNS4_9allocatorIS6_EEEEPvmS3__block_invoke_6(uint64_t result, void *a2)
{
  uint64_t v2 = a2[1];
  if (!v2 || *(unsigned char *)(v2 + *a2 - 1)) {
    LODWORD(v2) = v2 + 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t ___ZN29MTLGenerateReflectionDataPass22generateReflectionDataEPN4llvm6ModuleEjPmjRKNSt3__16vectorI20PostVertexDumpOutputNS4_9allocatorIS6_EEEEPvmS3__block_invoke_8(uint64_t result, void *a2)
{
  uint64_t v2 = a2[1];
  if (!v2 || *(unsigned char *)(v2 + *a2 - 1)) {
    LODWORD(v2) = v2 + 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t ___ZN29MTLGenerateReflectionDataPass22generateReflectionDataEPN4llvm6ModuleEjPmjRKNSt3__16vectorI20PostVertexDumpOutputNS4_9allocatorIS6_EEEEPvmS3__block_invoke_11(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  **(_DWORD **)(v2 + 24) = a2;
  *(void *)(v2 + 24) += 4;
  return result;
}

void *___ZN29MTLGenerateReflectionDataPass22generateReflectionDataEPN4llvm6ModuleEjPmjRKNSt3__16vectorI20PostVertexDumpOutputNS4_9allocatorIS6_EEEEPvmS3__block_invoke_12(uint64_t a1, const void **a2)
{
  uint64_t v2 = (char *)*a2;
  size_t v3 = (size_t)a2[1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t result = memcpy(*(void **)(v4 + 24), *a2, v3);
  uint64_t v6 = (unsigned char *)(*(void *)(v4 + 24) + v3);
  *(void *)(v4 + 24) = v6;
  if (!v3 || v2[v3 - 1])
  {
    *uint64_t v6 = 0;
    ++*(void *)(v4 + 24);
  }
  return result;
}

uint64_t ___ZN29MTLGenerateReflectionDataPass22generateReflectionDataEPN4llvm6ModuleEjPmjRKNSt3__16vectorI20PostVertexDumpOutputNS4_9allocatorIS6_EEEEPvmS3__block_invoke_13(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  **(_DWORD **)(v2 + 24) = a2;
  *(void *)(v2 + 24) += 4;
  return result;
}

void *___ZN29MTLGenerateReflectionDataPass22generateReflectionDataEPN4llvm6ModuleEjPmjRKNSt3__16vectorI20PostVertexDumpOutputNS4_9allocatorIS6_EEEEPvmS3__block_invoke_14(uint64_t a1, const void **a2)
{
  uint64_t v2 = (char *)*a2;
  size_t v3 = (size_t)a2[1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t result = memcpy(*(void **)(v4 + 24), *a2, v3);
  uint64_t v6 = (unsigned char *)(*(void *)(v4 + 24) + v3);
  *(void *)(v4 + 24) = v6;
  if (!v3 || v2[v3 - 1])
  {
    *uint64_t v6 = 0;
    ++*(void *)(v4 + 24);
  }
  return result;
}

void *___ZN29MTLGenerateReflectionDataPass22generateReflectionDataEPN4llvm6ModuleEjPmjRKNSt3__16vectorI20PostVertexDumpOutputNS4_9allocatorIS6_EEEEPvmS3__block_invoke_16(uint64_t a1, const void **a2)
{
  uint64_t v2 = (char *)*a2;
  size_t v3 = (size_t)a2[1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t result = memcpy(*(void **)(v4 + 24), *a2, v3);
  uint64_t v6 = (unsigned char *)(*(void *)(v4 + 24) + v3);
  *(void *)(v4 + 24) = v6;
  if (!v3 || v2[v3 - 1])
  {
    *uint64_t v6 = 0;
    ++*(void *)(v4 + 24);
  }
  return result;
}

void std::vector<AttributeDescriptor>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 5)
  {
    if (a2 >> 59) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VaryingInfo>>(v3, a2);
    long long v7 = &v6[v5 & 0xFFFFFFFFFFFFFFE0];
    long long v9 = &v6[32 * v8];
    uint64_t v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v10 -= 32;
      }
      while (v10 != v11);
      long long v10 = (char *)*a1;
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

uint64_t serializeStitchingTypeInfo(unsigned int *a1, uint64_t a2)
{
  long long v7 = (uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
  (*(void (**)(uint64_t, void))(a2 + 16))(a2, *a1);
  (*v7)(a2, a1[1]);
  (*v7)(a2, a1[2]);
  (*v7)(a2, a1[3]);
  (*v7)(a2, a1[4]);
  (*v7)(a2, a1[5]);
  (*v7)(a2, a1[6]);
  uint64_t v4 = a1[7];
  int64_t v5 = *v7;
  return v5(a2, v4);
}

uint64_t serializeStitchingStructInfo(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v15[0] = a2;
  v15[1] = a3;
  (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v15);
  uint64_t v8 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a1[1] - *a1) >> 4);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, v8);
  if (v8)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 176 * v8;
    do
    {
      uint64_t v12 = *a1 + v10;
      (*(void (**)(uint64_t, uint64_t))(a5 + 16))(a5, v12);
      (*(void (**)(uint64_t, void))(a4 + 16))(a4, *(unsigned int *)(v12 + 32));
      (*(void (**)(uint64_t, void))(a4 + 16))(a4, *(unsigned int *)(v12 + 76));
      long long v13 = *(_OWORD *)(v12 + 144);
      v14[0] = *(_OWORD *)(v12 + 128);
      v14[1] = v13;
      v14[2] = *(_OWORD *)(v12 + 160);
      uint64_t result = serializeStitchingTypeInfo((unsigned int *)v14, a4);
      if (LODWORD(v14[0]) == 1 || LODWORD(v14[0]) == 138 || LODWORD(v14[0]) == 60 && HIDWORD(v14[0]) == 1) {
        uint64_t result = serializeStitchingStructInfo(v12 + 104, *(void *)(v12 + 16), *(void *)(v12 + 24), a4, a5);
      }
      v10 += 176;
    }
    while (v11 != v10);
  }
  return result;
}

uint64_t getStructIndirectArgumentIndexStride(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1] - *a1;
  if (!v2) {
    return 0;
  }
  uint64_t v3 = 0x2E8BA2E8BA2E8BA3 * (v2 >> 4) - 1;
  uint64_t v4 = v1 + 176 * v3;
  int v5 = *(_DWORD *)(v4 + 72);
  if (*(void *)(v4 + 96))
  {
    int StructIndirectArgumentIndexStride = getStructIndirectArgumentIndexStride(v1 + 176 * v3 + 104);
  }
  else
  {
    uint64_t v8 = *(void *)(v1 + 176 * v3 + 56);
    if (v8)
    {
      unsigned int v9 = *(_DWORD *)(v8 + 8);
      if (v9 <= 1) {
        int StructIndirectArgumentIndexStride = 1;
      }
      else {
        int StructIndirectArgumentIndexStride = v9;
      }
    }
    else
    {
      int StructIndirectArgumentIndexStride = 1;
    }
  }
  unsigned int v10 = *(_DWORD *)(v1 + 176 * v3 + 40);
  if (v10 <= 1) {
    unsigned int v10 = 1;
  }
  return v5 + v10 * StructIndirectArgumentIndexStride;
}

void **std::vector<MTLArgumentData>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  if (0x8E38E38E38E38E39 * ((v4 - *a1) >> 5) < a2)
  {
    if (a2 >= 0xE38E38E38E38E4) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<MTLArgumentData>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    void v7[3] = (char *)v7[0] + 288 * v6;
    std::vector<MTLArgumentData>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<MTLArgumentData>::~__split_buffer(v7);
  }
  return result;
}

void sub_25579C82C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<MTLArgumentData>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<MTLArgumentData>::__emplace_back_slow_path<>(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v3 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 5);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xE38E38E38E38E3) {
    std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v5 = (uint64_t)(a1 + 2);
  unint64_t v6 = 0x8E38E38E38E38E39 * ((a1[2] - v2) >> 5);
  if (2 * v6 > v4) {
    unint64_t v4 = 2 * v6;
  }
  if (v6 >= 0x71C71C71C71C71) {
    unint64_t v7 = 0xE38E38E38E38E3;
  }
  else {
    unint64_t v7 = v4;
  }
  uint64_t v15 = a1 + 2;
  if (v7) {
    uint64_t v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLArgumentData>>(v5, v7);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v11 = v8;
  uint64_t v12 = (MTLArgumentData *)&v8[288 * v3];
  std::string::size_type v14 = &v8[288 * v7];
  MTLArgumentData::MTLArgumentData(v12);
  long long v13 = (char *)v12 + 288;
  std::vector<MTLArgumentData>::__swap_out_circular_buffer(a1, &v11);
  uint64_t v9 = a1[1];
  std::__split_buffer<MTLArgumentData>::~__split_buffer(&v11);
  return v9;
}

void sub_25579C93C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<MTLArgumentData>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__assign_unique<std::pair<std::string const,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>> const*>(void *a1, std::string *__str, std::string *a3)
{
  unint64_t v4 = __str;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    uint64_t v8 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8) {
      BOOL v9 = __str == a3;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      unsigned int v10 = (void **)v8;
    }
    else
    {
      do
      {
        std::string::operator=((std::string *)(v8 + 16), v4);
        *(_OWORD *)(v8 + 40) = *(_OWORD *)&v4[1].__r_.__value_.__l.__data_;
        *(unsigned char *)(v8 + 56) = v4[1].__r_.__value_.__s.__data_[16];
        unsigned int v10 = *(void ***)v8;
        std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__node_insert_unique(a1, v8);
        v4 += 2;
        if (v10) {
          BOOL v11 = v4 == a3;
        }
        else {
          BOOL v11 = 1;
        }
        uint64_t v8 = (uint64_t)v10;
      }
      while (!v11);
    }
    std::__hash_table<std::__hash_value_type<std::string,MTLCompilerDataType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLCompilerDataType>>>::__deallocate_node((int)a1, v10);
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>> const&>((uint64_t)a1, (unsigned __int8 *)v4, (uint64_t)v4);
    v4 += 2;
  }
}

void sub_25579CA30(void *a1)
{
  __cxa_begin_catch(a1);
  std::__hash_table<std::__hash_value_type<std::string,MTLCompilerDataType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLCompilerDataType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLCompilerDataType>>>::__deallocate_node(v1, v2);
  __cxa_rethrow();
}

void sub_25579CA4C(_Unwind_Exception *a1)
{
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__node_insert_unique(void *a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  unint64_t v4 = (unsigned __int8 *)(a2 + 16);
  unint64_t v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), a2 + 16);
  v2[1] = v5;
  uint64_t v6 = std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v5, v4);
  if (v6) {
    return v6;
  }
  std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return (unsigned __int8 *)v2;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
    v7.i16[0] = vaddlv_u8(v7);
    unint64_t v8 = v7.u32[0];
    if (v7.u32[0] > 1uLL) {
      uint64_t v9 = v4 <= a2 ? a2 % v4 : a2;
    }
    else {
      uint64_t v9 = (v4 - 1) & a2;
    }
    unsigned int v10 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v9);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v12 = *((void *)i + 1);
        if (v12 == a2)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a3)) {
            return i;
          }
        }
        else
        {
          if (v8 > 1)
          {
            if (v12 >= v4) {
              v12 %= v4;
            }
          }
          else
          {
            v12 &= v4 - 1;
          }
          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v4 || (float)(v14 * (float)v4) < v13)
  {
    BOOL v15 = 1;
    if (v4 >= 3) {
      BOOL v15 = (v4 & (v4 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v4);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::__rehash<true>(a1, v18);
  }
  return 0;
}

void *std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__node_insert_unique_perform[abi:ne180100](void *result, void *a2)
{
  int8x8_t v2 = (int8x8_t)result[1];
  unint64_t v3 = a2[1];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  unint64_t v5 = *(void **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    void *v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(void *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v2) {
        v6 %= *(void *)&v2;
      }
    }
    else
    {
      v6 &= *(void *)&v2 - 1;
    }
    unint64_t v5 = (void *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint8x8_t v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
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
    float v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
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
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__construct_node_hash<std::pair<std::string const,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>> const&>(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::__unordered_map_hasher<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::hash<llvm::DISubprogram *>,std::equal_to<llvm::DISubprogram *>,true>,std::__unordered_map_equal<llvm::DISubprogram *,std::__hash_value_type<llvm::DISubprogram *,unsigned int>,std::equal_to<llvm::DISubprogram *>,std::hash<llvm::DISubprogram *>,true>,std::allocator<std::__hash_value_type<llvm::DISubprogram *,unsigned int>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
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
  uint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    *uint64_t v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_25579CF40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,MTLCompilerDataType>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::__hash_table<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>>>>::__construct_node_hash<std::pair<std::string const,std::pair<MTLDataType,std::pair<MTLTextureType,BOOL>>> const&>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x40uLL);
  *(void *)(a4 + _Block_object_dispose(&STACK[0x250], 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v8 + 4) = *(void *)(a3 + 16);
  }
  __n128 result = *(__n128 *)(a3 + 24);
  *(__n128 *)(v8 + 40) = result;
  *((void *)v8 + 7) = *(void *)(a3 + 40);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_25579CFFC(_Unwind_Exception *a1)
{
  *int v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,MTLCompilerDataType>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::vector<MTLStructMemberInfo>::__assign_with_size[abi:ne180100]<MTLStructMemberInfo*,MTLStructMemberInfo*>(uint64_t a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  unint64_t v9 = *(void **)a1;
  if (0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4) < a4)
  {
    std::vector<MTLStructMemberInfo>::__vdeallocate((void **)a1);
    if (a4 > 0x1745D1745D1745DLL) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0x5D1745D1745D1746 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4)) >= 0xBA2E8BA2E8BA2ELL) {
      unint64_t v11 = 0x1745D1745D1745DLL;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<MTLStructMemberInfo>::__vallocate[abi:ne180100]((void *)a1, v11);
    uint64_t v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MTLStructMemberInfo>,MTLStructMemberInfo*,MTLStructMemberInfo*,MTLStructMemberInfo*>(v8, a2, a3, *(void *)(a1 + 8));
    goto LABEL_11;
  }
  if (0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4) < a4)
  {
    float v13 = &a2[(uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4];
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MTLStructMemberInfo *,MTLStructMemberInfo *,MTLStructMemberInfo *>((uint64_t)&v17, a2, v13, (uint64_t)v9);
    uint64_t v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MTLStructMemberInfo>,MTLStructMemberInfo*,MTLStructMemberInfo*,MTLStructMemberInfo*>(v8, v13, a3, *(void *)(a1 + 8));
LABEL_11:
    *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v12;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MTLStructMemberInfo *,MTLStructMemberInfo *,MTLStructMemberInfo *>((uint64_t)&v18, a2, a3, (uint64_t)v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      v16 -= 176;
      std::allocator_traits<std::allocator<MTLStructMemberInfo>>::destroy[abi:ne180100]<MTLStructMemberInfo,void>(v8, v16);
    }
    while (v16 != v15);
  }
  *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v15;
}

void sub_25579D1AC(_Unwind_Exception *a1)
{
  *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v2;
  _Unwind_Resume(a1);
}

void sub_25579D1B4(_Unwind_Exception *a1)
{
  *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<MTLStructMemberInfo>::__vdeallocate(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    uint8x8_t v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 176;
        std::allocator_traits<std::allocator<MTLStructMemberInfo>>::destroy[abi:ne180100]<MTLStructMemberInfo,void>((uint64_t)(a1 + 2), v3);
      }
      while ((void *)v3 != v1);
      uint8x8_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

_OWORD *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MTLStructMemberInfo *,MTLStructMemberInfo *,MTLStructMemberInfo *>(uint64_t a1, _OWORD *a2, _OWORD *a3, uint64_t a4)
{
  if (a2 == a3) {
    return a2;
  }
  unint64_t v5 = a3;
  unint64_t v6 = a2 + 7;
  do
  {
    long long v7 = *(v6 - 7);
    long long v8 = *(v6 - 6);
    long long v9 = *(v6 - 5);
    *(_DWORD *)(a4 + 4_Block_object_dispose(&STACK[0x250], 8) = *((_DWORD *)v6 - 16);
    *(_OWORD *)(a4 + 16) = v8;
    *(_OWORD *)(a4 + 32) = v9;
    *(_OWORD *)a4 = v7;
    uint64_t v11 = *((void *)v6 - 7);
    uint64_t v10 = *((void *)v6 - 6);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v12 = *(std::__shared_weak_count **)(a4 + 64);
    *(void *)(a4 + 56) = v11;
    *(void *)(a4 + 64) = v10;
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    float v13 = v6 - 7;
    long long v14 = *(_OWORD *)((char *)v6 - 40);
    *(_OWORD *)(a4 + 8_Block_object_dispose(&STACK[0x250], 8) = *(_OWORD *)((char *)v6 - 24);
    *(_OWORD *)(a4 + 72) = v14;
    if ((_OWORD *)a4 != v6 - 7) {
      std::vector<MTLStructMemberInfo>::__assign_with_size[abi:ne180100]<MTLStructMemberInfo*,MTLStructMemberInfo*>(a4 + 104);
    }
    long long v15 = v6[1];
    long long v16 = v6[3];
    *(_OWORD *)(a4 + 144) = v6[2];
    *(_OWORD *)(a4 + 160) = v16;
    *(_OWORD *)(a4 + 12_Block_object_dispose(&STACK[0x250], 8) = v15;
    a4 += 176;
    v6 += 11;
  }
  while (v13 + 11 != v5);
  return v5;
}

void std::__split_buffer<MTLStructMemberInfo>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 176;
    std::allocator_traits<std::allocator<MTLStructMemberInfo>>::destroy[abi:ne180100]<MTLStructMemberInfo,void>(v4, i - 176);
  }
}

void std::vector<MTLStructMemberInfo>::__assign_with_size[abi:ne180100]<MTLStructMemberInfo const*,MTLStructMemberInfo const*>(uint64_t a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  long long v9 = *(void **)a1;
  if (0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4) < a4)
  {
    std::vector<MTLStructMemberInfo>::__vdeallocate((void **)a1);
    if (a4 > 0x1745D1745D1745DLL) {
      std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0x5D1745D1745D1746 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4)) >= 0xBA2E8BA2E8BA2ELL) {
      unint64_t v11 = 0x1745D1745D1745DLL;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<MTLStructMemberInfo>::__vallocate[abi:ne180100]((void *)a1, v11);
    uint64_t v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MTLStructMemberInfo>,MTLStructMemberInfo const*,MTLStructMemberInfo const*,MTLStructMemberInfo*>(v8, a2, a3, *(void *)(a1 + 8));
    goto LABEL_11;
  }
  if (0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4) < a4)
  {
    float v13 = &a2[(uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4];
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MTLStructMemberInfo *,MTLStructMemberInfo *,MTLStructMemberInfo *>((uint64_t)&v17, a2, v13, (uint64_t)v9);
    uint64_t v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MTLStructMemberInfo>,MTLStructMemberInfo const*,MTLStructMemberInfo const*,MTLStructMemberInfo*>(v8, v13, a3, *(void *)(a1 + 8));
LABEL_11:
    *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v12;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MTLStructMemberInfo *,MTLStructMemberInfo *,MTLStructMemberInfo *>((uint64_t)&v18, a2, a3, (uint64_t)v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      v16 -= 176;
      std::allocator_traits<std::allocator<MTLStructMemberInfo>>::destroy[abi:ne180100]<MTLStructMemberInfo,void>(v8, v16);
    }
    while (v16 != v15);
  }
  *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v15;
}

void sub_25579D4FC(_Unwind_Exception *a1)
{
  *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v2;
  _Unwind_Resume(a1);
}

void sub_25579D504(_Unwind_Exception *a1)
{
  *(void *)(v1 + _Block_object_dispose(&STACK[0x250], 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MTLStructMemberInfo>,MTLStructMemberInfo const*,MTLStructMemberInfo const*,MTLStructMemberInfo*>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v11 = a4;
  uint64_t v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  __n128 v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      std::allocator<MTLStructMemberInfo>::construct[abi:ne180100]<MTLStructMemberInfo,MTLStructMemberInfo const&>(a1, v4, v6);
      v6 += 11;
      uint64_t v4 = v12 + 176;
      v12 += 176;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MTLStructMemberInfo>,MTLStructMemberInfo*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_25579D5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MTLArgumentData>,MTLArgumentData const*,MTLArgumentData const*,MTLArgumentData*>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v11 = a4;
  uint64_t v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  __n128 v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      std::allocator<MTLArgumentData>::construct[abi:ne180100]<MTLArgumentData,MTLArgumentData const&>(a1, v4, v6);
      v6 += 18;
      uint64_t v4 = v12 + 288;
      v12 += 288;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MTLArgumentData>,MTLArgumentData*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_25579D650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MTLArgumentData>,MTLArgumentData*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<MTLArgumentData>,MTLArgumentData*>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<MTLArgumentData>,MTLArgumentData*>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = (uint64_t *)a1[1];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v4 = *v2;
  if (*v1 != *v2)
  {
    uint64_t v5 = *a1;
    do
    {
      v3 -= 288;
      std::allocator<MTLArgumentData>::destroy[abi:ne180100](v5, v3);
    }
    while (v3 != v4);
  }
}

long long *std::vector<MTLArgumentData>::__insert_with_size[abi:ne180100]<std::__wrap_iter<MTLArgumentData const*>,std::__wrap_iter<MTLArgumentData const*>>(uint64_t *a1, long long *a2, long long *a3, long long *a4, uint64_t a5)
{
  uint64_t v5 = a2;
  if (a5 >= 1)
  {
    long long v7 = a3;
    uint64_t v11 = a1[2];
    uint64_t v9 = (uint64_t)(a1 + 2);
    uint64_t v10 = v11;
    unint64_t v12 = *(void *)(v9 - 8);
    if ((uint64_t)(0x8E38E38E38E38E39 * ((uint64_t)(v11 - v12) >> 5)) >= a5)
    {
      uint64_t v20 = v12 - (void)a2;
      if ((uint64_t)(0x8E38E38E38E38E39 * ((uint64_t)(v12 - (void)a2) >> 5)) >= a5)
      {
        size_t v21 = &a3[18 * a5];
      }
      else
      {
        size_t v21 = &a3[2 * ((uint64_t)(v12 - (void)a2) >> 5)];
        a1[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MTLArgumentData>,MTLArgumentData const*,MTLArgumentData const*,MTLArgumentData*>(v9, v21, a4, *(void *)(v9 - 8));
        if (v20 < 1) {
          return v5;
        }
      }
      std::vector<MTLArgumentData>::__move_range((uint64_t)a1, (uint64_t)v5, v12, (uint64_t)&v5[18 * a5]);
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MTLArgumentData const*,MTLArgumentData const*,MTLArgumentData*>((uint64_t)v27, (uint64_t)v7, (uint64_t)v21, (uint64_t)v5);
    }
    else
    {
      uint64_t v13 = *a1;
      unint64_t v14 = a5 - 0x71C71C71C71C71C7 * ((uint64_t)(v12 - *a1) >> 5);
      if (v14 > 0xE38E38E38E38E3) {
        std::vector<llvm::Type *>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v15 = 0x8E38E38E38E38E39 * (((uint64_t)a2 - v13) >> 5);
      unint64_t v16 = 0x8E38E38E38E38E39 * ((v10 - v13) >> 5);
      uint64_t v17 = 2 * v16;
      if (2 * v16 <= v14) {
        uint64_t v17 = v14;
      }
      if (v16 >= 0x71C71C71C71C71) {
        unint64_t v18 = 0xE38E38E38E38E3;
      }
      else {
        unint64_t v18 = v17;
      }
      uint64_t v30 = v9;
      if (v18) {
        unint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLArgumentData>>(v9, v18);
      }
      else {
        unint64_t v19 = 0;
      }
      uint64_t v22 = &v19[288 * v15];
      v27[0] = v19;
      v27[1] = v22;
      int v28 = v22;
      unint64_t v29 = &v19[288 * v18];
      uint64_t v23 = 9 * a5;
      unsigned int v24 = &v22[288 * a5];
      uint64_t v25 = 32 * v23;
      do
      {
        std::allocator<MTLArgumentData>::construct[abi:ne180100]<MTLArgumentData,MTLArgumentData const&>(v30, (uint64_t)v22, v7);
        v22 += 288;
        v7 += 18;
        v25 -= 288;
      }
      while (v25);
      int v28 = v24;
      uint64_t v5 = (long long *)std::vector<MTLArgumentData>::__swap_out_circular_buffer((uint64_t)a1, v27, v5);
      std::__split_buffer<MTLArgumentData>::~__split_buffer(v27);
    }
  }
  return v5;
}

void sub_25579D8D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  *(void *)(v12 + _Block_object_dispose(&STACK[0x250], 8) = v13;
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<MTLArgumentData>::__move_range(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = a2 + v6 - a4;
  uint64_t v8 = v6;
  if (v7 < a3)
  {
    uint64_t v10 = (long long *)(a2 + v6 - a4);
    uint64_t v8 = *(void *)(a1 + 8);
    do
    {
      std::allocator<MTLArgumentData>::construct[abi:ne180100]<MTLArgumentData,MTLArgumentData>(a1 + 16, v8, v10);
      v10 += 18;
      v8 += 288;
    }
    while ((unint64_t)v10 < a3);
  }
  *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = v8;
  return std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MTLArgumentData *,MTLArgumentData *,MTLArgumentData *>((uint64_t)&v12, a2, v7, v6);
}

uint64_t std::vector<MTLArgumentData>::__swap_out_circular_buffer(uint64_t a1, void *a2, long long *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1 + 16;
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MTLArgumentData>,std::reverse_iterator<MTLArgumentData*>,std::reverse_iterator<MTLArgumentData*>,std::reverse_iterator<MTLArgumentData*>>(a1 + 16, (uint64_t)a3, a3, *(void *)a1, *(long long **)a1, v6, v6);
  a2[1] = v8;
  a2[2] = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MTLArgumentData>,MTLArgumentData*,MTLArgumentData*,MTLArgumentData*>(v7, a3, *(long long **)(a1 + 8), a2[2]);
  uint64_t v9 = *(void *)a1;
  *(void *)a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x250], 8) = a2[2];
  a2[2] = v10;
  uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MTLArgumentData *,MTLArgumentData *,MTLArgumentData *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a3 + v7;
      uint64_t v9 = a4 + v7;
      uint64_t v10 = (_OWORD *)(a4 + v7 - 288);
      long long v11 = *(_OWORD *)(a3 + v7 - 240);
      long long v12 = *(_OWORD *)(a3 + v7 - 224);
      long long v13 = *(_OWORD *)(a3 + v7 - 192);
      *(_OWORD *)(v9 - 20_Block_object_dispose(&STACK[0x250], 8) = *(_OWORD *)(a3 + v7 - 208);
      *(_OWORD *)(v9 - 192) = v13;
      *(_OWORD *)(v9 - 240) = v11;
      *(_OWORD *)(v9 - 224) = v12;
      long long v14 = *(_OWORD *)(a3 + v7 - 288);
      long long v15 = *(_OWORD *)(a3 + v7 - 272);
      *(_OWORD *)(v9 - 256) = *(_OWORD *)(a3 + v7 - 256);
      _OWORD *v10 = v14;
      v10[1] = v15;
      long long v16 = *(_OWORD *)(a3 + v7 - 176);
      *(void *)(v8 - 176) = 0;
      *(void *)(v8 - 16_Block_object_dispose(&STACK[0x250], 8) = 0;
      uint64_t v17 = *(std::__shared_weak_count **)(a4 + v7 - 168);
      *(_OWORD *)(v9 - 176) = v16;
      if (v17) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      }
      long long v18 = *(_OWORD *)(v8 - 160);
      *(void *)(v8 - 160) = 0;
      *(void *)(v8 - 152) = 0;
      unint64_t v19 = *(std::__shared_weak_count **)(v9 - 152);
      *(_OWORD *)(v9 - 160) = v18;
      if (v19) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
      uint64_t v20 = a4 + v7;
      uint64_t v21 = a3 + v7;
      long long v22 = *(_OWORD *)(a3 + v7 - 144);
      *(void *)(v21 - 144) = 0;
      *(void *)(v21 - 136) = 0;
      uint64_t v23 = *(std::__shared_weak_count **)(a4 + v7 - 136);
      *(_OWORD *)(a4 + v7 - 144) = v22;
      if (v23) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v23);
      }
      long long v24 = *(_OWORD *)(v21 - 128);
      long long v25 = *(_OWORD *)(v21 - 112);
      *(void *)(v20 - 96) = *(void *)(v21 - 96);
      *(_OWORD *)(v20 - 12_Block_object_dispose(&STACK[0x250], 8) = v24;
      *(_OWORD *)(v20 - 112) = v25;
      std::vector<MTLStructMemberInfo>::__vdeallocate((void **)(v20 - 88));
      *(_OWORD *)(v20 - 8_Block_object_dispose(&STACK[0x250], 8) = *(_OWORD *)(v21 - 88);
      *(void *)(v20 - 72) = *(void *)(v21 - 72);
      *(void *)(v21 - 8_Block_object_dispose(&STACK[0x250], 8) = 0;
      *(void *)(v21 - 80) = 0;
      *(void *)(v21 - 72) = 0;
      long long v26 = *(_OWORD *)(v21 - 64);
      long long v27 = *(_OWORD *)(v21 - 48);
      long long v28 = *(_OWORD *)(v21 - 16);
      *(_OWORD *)(v20 - 32) = *(_OWORD *)(v21 - 32);
      *(_OWORD *)(v20 - 16) = v28;
      *(_OWORD *)(v20 - 64) = v26;
      *(_OWORD *)(v20 - 4_Block_object_dispose(&STACK[0x250], 8) = v27;
      v7 -= 288;
    }
    while (a3 + v7 != a2);
  }
  return a3;
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MTLArgumentData const*,MTLArgumentData const*,MTLArgumentData*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 == a3) {
    return a2;
  }
  uint64_t v5 = a3;
  uint64_t v6 = a2 + 208;
  do
  {
    long long v7 = *(_OWORD *)(v6 - 208);
    long long v8 = *(_OWORD *)(v6 - 176);
    *(_OWORD *)(a4 + 16) = *(_OWORD *)(v6 - 192);
    *(_OWORD *)(a4 + 32) = v8;
    *(_OWORD *)a4 = v7;
    long long v9 = *(_OWORD *)(v6 - 160);
    long long v10 = *(_OWORD *)(v6 - 144);
    long long v11 = *(_OWORD *)(v6 - 112);
    *(_OWORD *)(a4 + 80) = *(_OWORD *)(v6 - 128);
    *(_OWORD *)(a4 + 96) = v11;
    *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x250], 8) = v9;
    *(_OWORD *)(a4 + 64) = v10;
    uint64_t v13 = *(void *)(v6 - 96);
    uint64_t v12 = *(void *)(v6 - 88);
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    long long v14 = *(std::__shared_weak_count **)(a4 + 120);
    *(void *)(a4 + 112) = v13;
    *(void *)(a4 + 120) = v12;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    uint64_t v15 = v6 - 208;
    uint64_t v17 = *(void *)(v6 - 80);
    uint64_t v16 = *(void *)(v6 - 72);
    if (v16) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
    }
    long long v18 = *(std::__shared_weak_count **)(a4 + 136);
    *(void *)(a4 + 12_Block_object_dispose(&STACK[0x250], 8) = v17;
    *(void *)(a4 + 136) = v16;
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    uint64_t v20 = *(void *)(v6 - 64);
    uint64_t v19 = *(void *)(v6 - 56);
    if (v19) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v21 = *(std::__shared_weak_count **)(a4 + 152);
    *(void *)(a4 + 144) = v20;
    *(void *)(a4 + 152) = v19;
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
    long long v22 = *(_OWORD *)(v6 - 48);
    long long v23 = *(_OWORD *)(v6 - 32);
    *(void *)(a4 + 192) = *(void *)(v6 - 16);
    *(_OWORD *)(a4 + 160) = v22;
    *(_OWORD *)(a4 + 176) = v23;
    if (a4 != v15) {
      std::vector<MTLStructMemberInfo>::__assign_with_size[abi:ne180100]<MTLStructMemberInfo*,MTLStructMemberInfo*>(a4 + 200, *(long long **)(v6 - 8), *(long long **)v6, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)v6 - *(void *)(v6 - 8)) >> 4));
    }
    long long v24 = *(_OWORD *)(v6 + 16);
    long long v25 = *(_OWORD *)(v6 + 32);
    long long v26 = *(_OWORD *)(v6 + 64);
    *(_OWORD *)(a4 + 256) = *(_OWORD *)(v6 + 48);
    *(_OWORD *)(a4 + 272) = v26;
    *(_OWORD *)(a4 + 224) = v24;
    *(_OWORD *)(a4 + 240) = v25;
    a4 += 288;
    v6 += 288;
  }
  while (v15 + 288 != v5);
  return v5;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MTLArgumentData>,MTLArgumentData*,MTLArgumentData*,MTLArgumentData*>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v11 = a4;
  uint64_t v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  __n128 v9[2] = &v12;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      std::allocator<MTLArgumentData>::construct[abi:ne180100]<MTLArgumentData,MTLArgumentData>(a1, v4, v6);
      v6 += 18;
      uint64_t v4 = v12 + 288;
      v12 += 288;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MTLArgumentData>,MTLArgumentData*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<pixelFormatTypeMap(void)::$_0 &&>>(uint64_t a1, uint64_t a2)
{
  do
  {
    if (*(char *)(a1 - 9) < 0) {
      operator delete(*(void **)(a1 - 32));
    }
    if (*(char *)(a1 - 41) < 0) {
      operator delete(*(void **)(a1 - 64));
    }
    a1 -= 64;
  }
  while (a1 != a2);
}

void llvm::scc_iterator<llvm::CallGraph *,llvm::GraphTraits<llvm::CallGraph *>>::scc_iterator(void **a1, void **a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  if (v5)
  {
    *(void *)(a3 + 64) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *a2;
  if (*a2)
  {
    *(void *)(a3 + 40) = v6;
    operator delete(v6);
  }
}

uint64_t ConstantGlobalToArgPass::serializeConstantValue(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    return MEMORY[0x25A28E230](result, 0x1000C8000313F17);
  }
  return result;
}

uint64_t MTLCompilerObject::readModuleFromBinaryRequest()
{
  OUTLINED_FUNCTION_4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void getSerializedModule()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2556FA000, &_os_log_internal, v0, "Compilation FAILED (ParentProcessName=%{public}s): %{public}s - %s", v1, v2, v3, v4, v5);
}

void MTLCompilerObject::loadRuntimeModules()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_2556FA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[NSBundle bundleWithIdentifier:@\"com.apple.Metal\"] failed", v0, 2u);
}

void MTLCompilerObject::loadRuntimeModules(uint8_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v3 = *a2;
  *(_DWORD *)a1 = 138412290;
  *a3 = v3;
  OUTLINED_FUNCTION_7(&dword_2556FA000, &_os_log_internal, (uint64_t)a3, "Failed to find filepath for: %@", a1);
}

{
  uint64_t v3;

  uint64_t v3 = *a2;
  *(_DWORD *)a1 = 138412290;
  *a3 = v3;
  OUTLINED_FUNCTION_7(&dword_2556FA000, &_os_log_internal, (uint64_t)a3, "Failed to create object for %@", a1);
}

void MTLCompilerObject::loadRuntimeModules(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a3 = a2;
  OUTLINED_FUNCTION_7(&dword_2556FA000, &_os_log_internal, (uint64_t)a3, "Failed to create a memory buffer for %s", a1);
}

void fatalDiagnosticHandler(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = (uint64_t *)*a1;
  }
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_fault_impl(&dword_2556FA000, &_os_log_internal, OS_LOG_TYPE_FAULT, "LLVM ERROR: %s", (uint8_t *)&v2, 0xCu);
}

void MTLCompilerPluginInterface::init(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_2556FA000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Compiler plugin %s is not registered with the MTLCompilerObject", (uint8_t *)&v1, 0xCu);
}

void MTLCompilerPluginInterface::init(uint64_t a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_2556FA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to dlopen compiler plugin at %s, dlerror %s", buf, 0x16u);
}

void MTLCompilerPluginInterface::init()
{
}

{
  operator delete((void *)MTLCompilerPluginInterface::init(char const*,void const*,unsigned long)::validPathPrefixes[0]);
}

void MTLCompilerPluginInterface::init(uint64_t *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = 136315394;
  uint64_t v3 = v1;
  __int16 v4 = 2080;
  uint8_t v5 = dlerror();
  _os_log_error_impl(&dword_2556FA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to dlopen compiler plugin at %s, dlerror %s", (uint8_t *)&v2, 0x16u);
}

void std::allocator<MTLArgumentData>::construct[abi:ne180100]<MTLArgumentData,MTLArgumentData const&>(std::__shared_weak_count **a1, std::__shared_weak_count **a2)
{
  uint64_t v3 = *a1;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  __int16 v4 = *a2;
  if (*a2)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

uint64_t llvm::ErrorList::join()
{
  OUTLINED_FUNCTION_4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t llvm::ErrorList::join(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  *a1 = 0;
  if (v4)
  {
    OUTLINED_FUNCTION_4();
    (*(void (**)(void))(v5 + 8))();
  }
  return MEMORY[0x25A28E250](a2, 0xA1C4030951706);
}

void MTLCompilerObject::buildRequest()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_2556FA000, &_os_log_internal, v0, "Compilation FAILED (ParentProcessName=%{public}s): %{public}s - %s", v1, v2, v3, v4, v5);
}

void MTLCompilerObject::buildRequest(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

void MTLCompilerObject::logCompilerFailure(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = [a1 UTF8String];
  OUTLINED_FUNCTION_7(&dword_2556FA000, &_os_log_internal, v1, "Failure to create log file: %s", (uint8_t *)&v2);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  [a1 UTF8String];
  OUTLINED_FUNCTION_2(&dword_2556FA000, &_os_log_internal, v1, "Failed to write log file (wrote %llu bytes, expected %llu bytes): %s", v2, v3, v4, v5, 2u);
}

void MTLCompilerObject::logCompilerFailure(id *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = objc_msgSend((id)objc_msgSend(*a1, "localizedDescription"), "UTF8String");
  int v3 = 136315138;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_7(&dword_2556FA000, &_os_log_internal, v2, "Failure to create log directory: %s", (uint8_t *)&v3);
}

void MTLCompilerObject::generateMachO(uint64_t a1)
{
  OUTLINED_FUNCTION_0(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2556FA000, &_os_log_internal, v1, "MachO serialization failed (ParentProcessName=%{public}s): %{public}s - %s", v2, v3, v4, v5, v6);
}

void MTLCompilerObject::generateBinaryArchiveID()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_2556FA000, &_os_log_internal, v0, "MachO serialization failed (ParentProcessName=%{public}s): %{public}s - %s", v1, v2, v3, v4, v5);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

uint64_t LLVMCreateMemoryBufferWithContentsOfFile()
{
  return MEMORY[0x270F92D58]();
}

uint64_t LLVMCreateMemoryBufferWithMemoryRange()
{
  return MEMORY[0x270F92D60]();
}

uint64_t LLVMCreateMemoryBufferWithMemoryRangeCopy()
{
  return MEMORY[0x270F92D68]();
}

uint64_t LLVMDisposeMemoryBuffer()
{
  return MEMORY[0x270F92D78]();
}

uint64_t LLVMExtraDisposeSharedModule()
{
  return MEMORY[0x270F2D250]();
}

uint64_t LLVMExtraMakeSharedModule()
{
  return MEMORY[0x270F2D258]();
}

uint64_t LLVMGetBufferSize()
{
  return MEMORY[0x270F92DA0]();
}

uint64_t LLVMGetBufferStart()
{
  return MEMORY[0x270F92DA8]();
}

uint64_t LLVMGetTarget()
{
  return MEMORY[0x270F92DF0]();
}

uint64_t MTLCreateScript()
{
  return MEMORY[0x270F2D260]();
}

uint64_t MTLDataTypeGetComponentCount()
{
  return MEMORY[0x270EF5E30]();
}

uint64_t MTLDataTypeGetComponentType()
{
  return MEMORY[0x270EF5E38]();
}

uint64_t MTLDowngradeAIRModule()
{
  return MEMORY[0x270F2D268]();
}

uint64_t MTLFunctionGroupCreate()
{
  return MEMORY[0x270F2D270]();
}

uint64_t MTLGPUArchiverAddDescriptor()
{
  return MEMORY[0x270F2D278]();
}

uint64_t MTLGPUArchiverAddLinkedModules()
{
  return MEMORY[0x270F2D280]();
}

uint64_t MTLGPUArchiverAddLinkedModulesWithReferences()
{
  return MEMORY[0x270F2D288]();
}

uint64_t MTLGPUArchiverAddPipeline()
{
  return MEMORY[0x270F2D290]();
}

uint64_t MTLGPUArchiverAddTool()
{
  return MEMORY[0x270F2D298]();
}

uint64_t MTLGPUArchiverAddUnit()
{
  return MEMORY[0x270F2D2A0]();
}

uint64_t MTLGPUArchiverBuildToFD()
{
  return MEMORY[0x270F2D2A8]();
}

uint64_t MTLGPUArchiverCreateDynamicLibraryWriter()
{
  return MEMORY[0x270F2D2B0]();
}

uint64_t MTLGPUArchiverCreateExecutableWriter()
{
  return MEMORY[0x270F2D2B8]();
}

uint64_t MTLGPUArchiverDeleteWithId()
{
  return MEMORY[0x270F2D2C0]();
}

uint64_t MTLGPUArchiverDestroy()
{
  return MEMORY[0x270F2D2C8]();
}

uint64_t MTLGPUArchiverFlush()
{
  return MEMORY[0x270F2D2D0]();
}

uint64_t MTLGPUArchiverFromId()
{
  return MEMORY[0x270F2D2D8]();
}

uint64_t MTLGPUArchiverPackUnits()
{
  return MEMORY[0x270F2D2E0]();
}

uint64_t MTLGPUArchiverSetInstallName()
{
  return MEMORY[0x270F2D2E8]();
}

uint64_t MTLGPUArchiverSetUnitHash()
{
  return MEMORY[0x270F2D2F0]();
}

uint64_t MTLGPUArchiverSetUnitReflection()
{
  return MEMORY[0x270F2D2F8]();
}

uint64_t MTLGPUArchiverToId()
{
  return MEMORY[0x270F2D300]();
}

uint64_t MTLGPUArchiverUnitRefCreateWithUnitId()
{
  return MEMORY[0x270F2D308]();
}

uint64_t MTLGPUArchiverUnitRefDestroy()
{
  return MEMORY[0x270F2D310]();
}

uint64_t MTLGPUCompilerBuildFromSource()
{
  return MEMORY[0x270F2D318]();
}

uint64_t MTLGPUCompilerBuildFromSourceToBuffer()
{
  return MEMORY[0x270F2D320]();
}

uint64_t MTLGPUCompilerCompileFromSource()
{
  return MEMORY[0x270F2D328]();
}

uint64_t MTLGPUCompilerCreate()
{
  return MEMORY[0x270F2D330]();
}

uint64_t MTLGPUCompilerDestroy()
{
  return MEMORY[0x270F2D338]();
}

uint64_t MTLGPUCompilerEnable16BitTextureCoordinateEmulation()
{
  return MEMORY[0x270F2D340]();
}

uint64_t MTLGPUCompilerEnableBFloatEmulation()
{
  return MEMORY[0x270F2D348]();
}

uint64_t MTLGPUCompilerEnableDegenerateVertexAmplificationEmulation()
{
  return MEMORY[0x270F2D350]();
}

uint64_t MTLGPUCompilerEnableDoubleEmulation()
{
  return MEMORY[0x270F2D358]();
}

uint64_t MTLGPUCompilerEnableExternallyInitializedVariableSupport()
{
  return MEMORY[0x270F2D360]();
}

uint64_t MTLGPUCompilerEnableGlobalBindingInDylibSupport()
{
  return MEMORY[0x270F2D368]();
}

uint64_t MTLGPUCompilerEnableGlobalBuiltinInDylibSupport()
{
  return MEMORY[0x270F2D370]();
}

uint64_t MTLGPUCompilerEnableRaytracingEmulation()
{
  return MEMORY[0x270F2D378]();
}

uint64_t MTLGPUCompilerEnableResourcePatchingInstrumentation()
{
  return MEMORY[0x270F2D380]();
}

uint64_t MTLGPUCompilerEnableResourceUsageInstrumentation()
{
  return MEMORY[0x270F2D388]();
}

uint64_t MTLGPUCompilerEnableTLSEmulation()
{
  return MEMORY[0x270F2D390]();
}

uint64_t MTLGPUCompilerHandleSPIs()
{
  return MEMORY[0x270F2D398]();
}

uint64_t MTLGPUCompilerLinkToBuffer()
{
  return MEMORY[0x270F2D3A0]();
}

uint64_t MTLGPUCompilerLoadModules()
{
  return MEMORY[0x270F2D3A8]();
}

uint64_t MTLGPUCompilerLowerModule()
{
  return MEMORY[0x270F2D3B0]();
}

uint64_t MTLGPUCompilerSetFunctionGroups()
{
  return MEMORY[0x270F2D3B8]();
}

uint64_t MTLGPUCompilerSetLoaderScript()
{
  return MEMORY[0x270F2D3C0]();
}

uint64_t MTLGPUCompilerSetLoadingMode()
{
  return MEMORY[0x270F2D3C8]();
}

uint64_t MTLGPUCompilerSetLoweringRuntimes()
{
  return MEMORY[0x270F2D3D0]();
}

uint64_t MTLGPUCompilerSetRaytracingEmulationIndirectAccelerationStructures()
{
  return MEMORY[0x270F2D3D8]();
}

uint64_t MTLGPUCompilerSetRaytracingEmulationMaxAccelerationStructureTraversalDepth()
{
  return MEMORY[0x270F2D3E0]();
}

uint64_t MTLGPUCompilerSetStitcherScript()
{
  return MEMORY[0x270F2D3E8]();
}

uint64_t MTLGPUCompilerSpecializeFunction()
{
  return MEMORY[0x270F2D3F0]();
}

uint64_t MTLGPUCompilerSpecializeFunctionToBuffer()
{
  return MEMORY[0x270F2D3F8]();
}

uint64_t MTLGPUCompilerStitchFunctionsToBuffer()
{
  return MEMORY[0x270F2D400]();
}

uint64_t MTLGetEnvDefault()
{
  return MEMORY[0x270EF5E80]();
}

uint64_t MTLGetShaderCachePath()
{
  return MEMORY[0x270EF5E90]();
}

uint64_t MTLMetalDynamicLibraryGetInstallName()
{
  return MEMORY[0x270F2D408]();
}

uint64_t MTLMetalFunctionCreate()
{
  return MEMORY[0x270F2D410]();
}

uint64_t MTLMetalFunctionGetModule()
{
  return MEMORY[0x270F2D418]();
}

uint64_t MTLMetalFunctionGetName()
{
  return MEMORY[0x270F2D420]();
}

uint64_t MTLMetalImportedSymbolGetName()
{
  return MEMORY[0x270F2D428]();
}

uint64_t MTLMetalLibCreateExecutableWithTriple()
{
  return MEMORY[0x270F2D430]();
}

uint64_t MTLMetalLibDestroy()
{
  return MEMORY[0x270F2D438]();
}

uint64_t MTLMetalLibGetDynamicLibrariesCount()
{
  return MEMORY[0x270F2D440]();
}

uint64_t MTLMetalLibGetDynamicLibraryNo()
{
  return MEMORY[0x270F2D448]();
}

uint64_t MTLMetalLibGetFunctionNo()
{
  return MEMORY[0x270F2D450]();
}

uint64_t MTLMetalLibGetFunctionsCount()
{
  return MEMORY[0x270F2D458]();
}

uint64_t MTLMetalLibGetImportedSymbolNo()
{
  return MEMORY[0x270F2D460]();
}

uint64_t MTLMetalLibGetImportedSymbolsCount()
{
  return MEMORY[0x270F2D468]();
}

uint64_t MTLMetalLibGetInstallName()
{
  return MEMORY[0x270F2D470]();
}

uint64_t MTLMetalLibGetVariableNo()
{
  return MEMORY[0x270F2D478]();
}

uint64_t MTLMetalLibGetVariablesCount()
{
  return MEMORY[0x270F2D480]();
}

uint64_t MTLMetalLibInsertFunction()
{
  return MEMORY[0x270F2D488]();
}

uint64_t MTLMetalVariableGetName()
{
  return MEMORY[0x270F2D490]();
}

uint64_t MTLModuleGetAsObject()
{
  return MEMORY[0x270F2D498]();
}

uint64_t MTLObjectCreate()
{
  return MEMORY[0x270F2D4A0]();
}

uint64_t MTLObjectDestroy()
{
  return MEMORY[0x270F2D4A8]();
}

uint64_t MTLObjectGetAsMetalLib()
{
  return MEMORY[0x270F2D4B0]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

uint64_t MTLUpgradeAIRModule()
{
  return MEMORY[0x270F2D4B8]();
}

uint64_t MTLWriteAIRBitcodeToMemoryBuffer()
{
  return MEMORY[0x270F2D4C0]();
}

uint64_t MTLWriteAIRReflectionToMemoryBuffer()
{
  return MEMORY[0x270F2D4C8]();
}

uint64_t MTLWriteMetalLibToMemoryBuffer()
{
  return MEMORY[0x270F2D4D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MTLConstantDataSize()
{
  return MEMORY[0x270EF6010]();
}

uint64_t _MTLEncodeLinkingInfo()
{
  return MEMORY[0x270EF6018]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t llvm::AllocaInst::AllocaInst()
{
  return MEMORY[0x270F92EF8]();
}

{
  return MEMORY[0x270F92F08]();
}

uint64_t llvm::BasicBlock::moveBefore()
{
  return MEMORY[0x270F92F10]();
}

uint64_t llvm::BasicBlock::splitBasicBlock()
{
  return MEMORY[0x270F92F20]();
}

uint64_t llvm::BasicBlock::BasicBlock()
{
  return MEMORY[0x270F92F38]();
}

uint64_t llvm::BranchInst::BranchInst()
{
  return MEMORY[0x270F92F48]();
}

{
  return MEMORY[0x270F92F50]();
}

{
  return MEMORY[0x270F92F58]();
}

uint64_t llvm::ConstantFP::get()
{
  return MEMORY[0x270F92F80]();
}

uint64_t llvm::DataLayout::clear(llvm::DataLayout *this)
{
  return MEMORY[0x270F92FA0](this);
}

void llvm::DataLayout::~DataLayout(llvm::DataLayout *this)
{
}

void llvm::ModulePass::~ModulePass(llvm::ModulePass *this)
{
}

uint64_t llvm::ReturnInst::ReturnInst()
{
  return MEMORY[0x270F92FF8]();
}

uint64_t llvm::SplitBlock()
{
  return MEMORY[0x270F93000]();
}

uint64_t llvm::StructType::getTypeByName()
{
  return MEMORY[0x270F93008]();
}

uint64_t llvm::StructType::get()
{
  return MEMORY[0x270F93010]();
}

uint64_t llvm::StructType::create()
{
  return MEMORY[0x270F93020]();
}

{
  return MEMORY[0x270F93030]();
}

{
  return MEMORY[0x270F93038]();
}

uint64_t llvm::StructType::setBody()
{
  return MEMORY[0x270F93040]();
}

uint64_t llvm::UndefValue::get()
{
  return MEMORY[0x270F93088]();
}

uint64_t llvm::VectorType::get()
{
  return MEMORY[0x270F93090]();
}

uint64_t llvm::APFloatBase::PPCDoubleDouble(llvm::APFloatBase *this)
{
  return MEMORY[0x270F930C0](this);
}

uint64_t llvm::AttrBuilder::addAttribute()
{
  return MEMORY[0x270F93108]();
}

{
  return MEMORY[0x270F93110]();
}

uint64_t llvm::AttrBuilder::AttrBuilder()
{
  return MEMORY[0x270F93180]();
}

uint64_t llvm::CloneModule()
{
  return MEMORY[0x270F931A0]();
}

uint64_t llvm::ConstantInt::get()
{
  return MEMORY[0x270F931A8]();
}

{
  return MEMORY[0x270F931B8]();
}

uint64_t llvm::Instruction::setIsExact(llvm::Instruction *this)
{
  return MEMORY[0x270F93248](this);
}

uint64_t llvm::Instruction::insertAfter(llvm::Instruction *this, llvm::Instruction *a2)
{
  return MEMORY[0x270F93250](this, a2);
}

uint64_t llvm::Instruction::setMetadata()
{
  return MEMORY[0x270F93258]();
}

{
  return MEMORY[0x270F93260]();
}

uint64_t llvm::Instruction::copyMetadata()
{
  return MEMORY[0x270F93268]();
}

uint64_t llvm::Instruction::insertBefore(llvm::Instruction *this, llvm::Instruction *a2)
{
  return MEMORY[0x270F93270](this, a2);
}

uint64_t llvm::Instruction::eraseFromParent(llvm::Instruction *this)
{
  return MEMORY[0x270F93278](this);
}

uint64_t llvm::Instruction::removeFromParent(llvm::Instruction *this)
{
  return MEMORY[0x270F93280](this);
}

uint64_t llvm::Instruction::setFastMathFlags()
{
  return MEMORY[0x270F93288]();
}

uint64_t llvm::Instruction::setHasNoSignedWrap(llvm::Instruction *this)
{
  return MEMORY[0x270F932A0](this);
}

uint64_t llvm::Instruction::setHasNoUnsignedWrap(llvm::Instruction *this)
{
  return MEMORY[0x270F932B0](this);
}

uint64_t llvm::Instruction::Instruction()
{
  return MEMORY[0x270F932D0]();
}

void llvm::Instruction::~Instruction(llvm::Instruction *this)
{
}

uint64_t llvm::IntegerType::get()
{
  return MEMORY[0x270F932E0]();
}

uint64_t llvm::LLVMContext::setDiagnosticHandlerCallBack()
{
  return MEMORY[0x270F93310]();
}

uint64_t llvm::LLVMContext::LLVMContext(llvm::LLVMContext *this)
{
  return MEMORY[0x270F93330](this);
}

void llvm::LLVMContext::~LLVMContext(llvm::LLVMContext *this)
{
}

uint64_t llvm::NamedMDNode::addOperand()
{
  return MEMORY[0x270F93358]();
}

uint64_t llvm::NamedMDNode::setOperand()
{
  return MEMORY[0x270F93360]();
}

uint64_t llvm::NamedMDNode::clearOperands(llvm::NamedMDNode *this)
{
  return MEMORY[0x270F93368](this);
}

uint64_t llvm::NamedMDNode::eraseFromParent(llvm::NamedMDNode *this)
{
  return MEMORY[0x270F93370](this);
}

uint64_t llvm::PointerType::get()
{
  return MEMORY[0x270F933C8]();
}

uint64_t llvm::PointerType::get(llvm::PointerType *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F933D0](this, a2);
}

uint64_t llvm::StringSaver::save()
{
  return MEMORY[0x270F933F0]();
}

uint64_t llvm::ValueMapper::remapFunction(llvm::ValueMapper *this, Function *a2)
{
  return MEMORY[0x270F93400](this, a2);
}

uint64_t llvm::ValueMapper::ValueMapper()
{
  return MEMORY[0x270F93418]();
}

void llvm::ValueMapper::~ValueMapper(llvm::ValueMapper *this)
{
}

uint64_t llvm::raw_ostream::flush_nonempty(llvm::raw_ostream *this)
{
  return MEMORY[0x270F93430](this);
}

uint64_t llvm::raw_ostream::write(llvm::raw_ostream *this, const char *a2)
{
  return MEMORY[0x270F93440](this, a2);
}

void llvm::raw_ostream::~raw_ostream(llvm::raw_ostream *this)
{
}

uint64_t llvm::raw_ostream::operator<<()
{
  return MEMORY[0x270F934A0]();
}

uint64_t llvm::AttributeSet::get()
{
  return MEMORY[0x270F934D0]();
}

uint64_t llvm::ConstantExpr::getBitCast()
{
  return MEMORY[0x270F934E0]();
}

uint64_t llvm::ConstantExpr::getPointerCast()
{
  return MEMORY[0x270F93508]();
}

uint64_t llvm::DenseMapInfo<llvm::StringRef,void>::getHashValue()
{
  return MEMORY[0x270F93580]();
}

uint64_t llvm::FunctionType::get()
{
  return MEMORY[0x270F93588]();
}

{
  return MEMORY[0x270F93590]();
}

uint64_t llvm::GlobalObject::setSection()
{
  return MEMORY[0x270F93598]();
}

uint64_t llvm::GlobalObject::copyMetadata()
{
  return MEMORY[0x270F935A0]();
}

uint64_t llvm::GlobalObject::setAlignment()
{
  return MEMORY[0x270F935A8]();
}

uint64_t llvm::appendToUsed()
{
  return MEMORY[0x270F93648]();
}

uint64_t llvm::AttributeList::get()
{
  return MEMORY[0x270F93670]();
}

uint64_t llvm::ConstantArray::get()
{
  return MEMORY[0x270F93698]();
}

uint64_t llvm::IRBuilderBase::CreateSelect()
{
  return MEMORY[0x270F936C8]();
}

uint64_t llvm::IRBuilderBase::CreateVectorSplat()
{
  return MEMORY[0x270F93710]();
}

uint64_t llvm::IRBuilderBase::CreateMemTransferInst()
{
  return MEMORY[0x270F93730]();
}

uint64_t llvm::IRBuilderBase::CreateConstrainedFPCast()
{
  return MEMORY[0x270F93740]();
}

uint64_t llvm::IRBuilderBase::CreateConstrainedFPBinOp()
{
  return MEMORY[0x270F93748]();
}

uint64_t llvm::StringMapImpl::RehashTable(llvm::StringMapImpl *this)
{
  return MEMORY[0x270F93788](this);
}

uint64_t llvm::StringMapImpl::LookupBucketFor()
{
  return MEMORY[0x270F93790]();
}

uint64_t llvm::StringMapImpl::StringMapImpl(llvm::StringMapImpl *this)
{
  return MEMORY[0x270F937A8](this);
}

uint64_t llvm::BinaryOperator::Create()
{
  return MEMORY[0x270F937D8]();
}

uint64_t llvm::BinaryOperator::CreateNot()
{
  return MEMORY[0x270F937E8]();
}

uint64_t llvm::ConstantVector::get()
{
  return MEMORY[0x270F93808]();
}

uint64_t llvm::GlobalVariable::setInitializer()
{
  return MEMORY[0x270F93858]();
}

uint64_t llvm::GlobalVariable::eraseFromParent(llvm::GlobalVariable *this)
{
  return MEMORY[0x270F93860](this);
}

uint64_t llvm::GlobalVariable::removeFromParent(llvm::GlobalVariable *this)
{
  return MEMORY[0x270F93868](this);
}

uint64_t llvm::GlobalVariable::dropAllReferences(llvm::GlobalVariable *this)
{
  return MEMORY[0x270F93870](this);
}

uint64_t llvm::GlobalVariable::GlobalVariable()
{
  return MEMORY[0x270F93888]();
}

uint64_t llvm::InlineFunction()
{
  return MEMORY[0x270F938A0]();
}

uint64_t llvm::createLICMPass(llvm *this)
{
  return MEMORY[0x270F938E8](this);
}

uint64_t llvm::createSROAPass(llvm *this)
{
  return MEMORY[0x270F938F0](this);
}

uint64_t llvm::raw_fd_ostream::raw_fd_ostream()
{
  return MEMORY[0x270F93930]();
}

void llvm::raw_fd_ostream::~raw_fd_ostream(llvm::raw_fd_ostream *this)
{
}

uint64_t llvm::FixedVectorType::get()
{
  return MEMORY[0x270F93990]();
}

void llvm::IRBuilderFolder::~IRBuilderFolder(llvm::IRBuilderFolder *this)
{
}

uint64_t llvm::InsertValueInst::init()
{
  return MEMORY[0x270F939A0]();
}

uint64_t llvm::MemoryBufferRef::MemoryBufferRef()
{
  return MEMORY[0x270F93A00]();
}

void llvm::SmallVectorBase<unsigned int>::mallocForGrow()
{
  while (1)
    ;
}

void llvm::SmallVectorBase<unsigned int>::grow_pod()
{
  while (1)
    ;
}

void llvm::SmallVectorBase<unsigned long long>::grow_pod()
{
  while (1)
    ;
}

uint64_t llvm::ValueAsMetadata::handleRAUW()
{
  return MEMORY[0x270F93BC0]();
}

uint64_t llvm::ValueAsMetadata::get()
{
  return MEMORY[0x270F93BC8]();
}

uint64_t llvm::ValueHandleBase::AddToUseList(llvm::ValueHandleBase *this)
{
  return MEMORY[0x270F93BD0](this);
}

uint64_t llvm::ValueHandleBase::RemoveFromUseList(llvm::ValueHandleBase *this)
{
  return MEMORY[0x270F93BD8](this);
}

uint64_t llvm::ValueHandleBase::AddToExistingUseList(llvm::ValueHandleBase *this, llvm::ValueHandleBase **a2)
{
  return MEMORY[0x270F93BE0](this, a2);
}

uint64_t llvm::allocate_buffer(llvm *this)
{
  return MEMORY[0x270F93BE8](this);
}

uint64_t llvm::ExtractValueInst::getIndexedType()
{
  return MEMORY[0x270F93C00]();
}

uint64_t llvm::ExtractValueInst::init()
{
  return MEMORY[0x270F93C08]();
}

uint64_t llvm::MetadataTracking::track()
{
  return MEMORY[0x270F93C30]();
}

uint64_t llvm::MetadataTracking::untrack()
{
  return MEMORY[0x270F93C40]();
}

uint64_t llvm::createNewGVNPass(llvm *this)
{
  return MEMORY[0x270F93C68](this);
}

uint64_t llvm::GetElementPtrInst::setIsInBounds(llvm::GetElementPtrInst *this)
{
  return MEMORY[0x270F93CE8](this);
}

uint64_t llvm::GetElementPtrInst::getIndexedType()
{
  return MEMORY[0x270F93CF0]();
}

uint64_t llvm::GetElementPtrInst::init()
{
  return MEMORY[0x270F93D00]();
}

uint64_t llvm::InsertElementInst::InsertElementInst()
{
  return MEMORY[0x270F93D10]();
}

uint64_t llvm::ShuffleVectorInst::getShuffleMask()
{
  return MEMORY[0x270F93D28]();
}

uint64_t llvm::ShuffleVectorInst::ShuffleVectorInst()
{
  return MEMORY[0x270F93D30]();
}

uint64_t llvm::deallocate_buffer(llvm *this, void *a2)
{
  return MEMORY[0x270F93D60](this, a2);
}

uint64_t llvm::ConstantDataVector::get()
{
  return MEMORY[0x270F93D70]();
}

{
  return MEMORY[0x270F93D78]();
}

{
  return MEMORY[0x270F93D80]();
}

{
  return MEMORY[0x270F93D88]();
}

uint64_t llvm::ConstantDataVector::getFP()
{
  return MEMORY[0x270F93D90]();
}

{
  return MEMORY[0x270F93D98]();
}

uint64_t llvm::ExtractElementInst::ExtractElementInst()
{
  return MEMORY[0x270F93DC0]();
}

uint64_t llvm::createEarlyCSEPass(llvm *this)
{
  return MEMORY[0x270F93E08](this);
}

uint64_t llvm::createVerifierPass(llvm *this)
{
  return MEMORY[0x270F93E20](this);
}

uint64_t llvm::ConstantPointerNull::get(llvm::ConstantPointerNull *this, llvm::PointerType *a2)
{
  return MEMORY[0x270F93E58](this, a2);
}

uint64_t llvm::ReplaceInstWithInst(llvm *this, llvm::Instruction *a2, llvm::Instruction *a3)
{
  return MEMORY[0x270F93E70](this, a2, a3);
}

uint64_t llvm::SmallPtrSetImplBase::insert_imp_big(llvm::SmallPtrSetImplBase *this, const void *a2)
{
  return MEMORY[0x270F93E90](this, a2);
}

uint64_t llvm::createGlobalDCEPass(llvm *this)
{
  return MEMORY[0x270F93ED0](this);
}

uint64_t llvm::getLazyIRFileModule()
{
  return MEMORY[0x270F93EE0]();
}

uint64_t llvm::createLoopUnrollPass(llvm *this, int a2, BOOL a3, BOOL a4, int a5, int a6, int a7, int a8, int a9, int a10)
{
  return MEMORY[0x270F93F60](this);
}

uint64_t llvm::getLazyBitcodeModule()
{
  return MEMORY[0x270F93F88]();
}

void llvm::SymbolTableListTraits<llvm::BasicBlock>::transferNodesFromList()
{
  while (1)
    ;
}

void llvm::SymbolTableListTraits<llvm::Function>::addNodeToList()
{
  while (1)
    ;
}

uint64_t llvm::createBarrierNoopPass(llvm *this)
{
  return MEMORY[0x270F93FF8](this);
}

uint64_t llvm::createLoopUnswitchPass(llvm *this)
{
  return MEMORY[0x270F94060](this);
}

uint64_t llvm::ConstantFoldInstruction()
{
  return MEMORY[0x270F94088]();
}

uint64_t llvm::createAggressiveDCEPass(llvm *this)
{
  return MEMORY[0x270F940C0](this);
}

uint64_t llvm::createJumpThreadingPass(llvm *this)
{
  return MEMORY[0x270F940D0](this);
}

uint64_t llvm::isSafeToDestroyConstant()
{
  return MEMORY[0x270F940E8]();
}

void llvm::IRBuilderDefaultInserter::~IRBuilderDefaultInserter(llvm::IRBuilderDefaultInserter *this)
{
}

uint64_t llvm::createLoopSimplifyCFGPass(llvm *this)
{
  return MEMORY[0x270F94150](this);
}

uint64_t llvm::createFunctionInliningPass(llvm *this)
{
  return MEMORY[0x270F94170](this);
}

uint64_t llvm::remove_fatal_error_handler(llvm *this)
{
  return MEMORY[0x270F94188](this);
}

uint64_t llvm::createCFGSimplificationPass()
{
  return MEMORY[0x270F941A8]();
}

uint64_t llvm::install_fatal_error_handler(llvm *this, void (*a2)(void *, const char *, BOOL), void *a3)
{
  return MEMORY[0x270F941B0](this, a2, a3);
}

uint64_t llvm::createInstSimplifyLegacyPass(llvm *this)
{
  return MEMORY[0x270F941C8](this);
}

uint64_t llvm::createAlwaysInlinerLegacyPass(llvm *this)
{
  return MEMORY[0x270F941E8](this);
}

uint64_t llvm::errorToErrorCodeAndEmitErrors()
{
  return MEMORY[0x270F94200]();
}

uint64_t llvm::createInstructionCombiningPass(llvm *this)
{
  return MEMORY[0x270F94238](this);
}

uint64_t llvm::createPromoteMemoryToRegisterPass(llvm *this)
{
  return MEMORY[0x270F94240](this);
}

uint64_t llvm::createStraightLineStrengthReducePass(llvm *this)
{
  return MEMORY[0x270F94248](this);
}

uint64_t llvm::sys::fs::create_directory()
{
  return MEMORY[0x270F94560]();
}

uint64_t llvm::sys::path::is_absolute()
{
  return MEMORY[0x270F945B8]();
}

uint64_t llvm::sys::path::append()
{
  return MEMORY[0x270F94650]();
}

void llvm::Pass::~Pass(llvm::Pass *this)
{
}

uint64_t llvm::Type::getFloatTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94780](this, a2);
}

uint64_t llvm::Type::getInt16Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94788](this, a2);
}

uint64_t llvm::Type::getInt32Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94790](this, a2);
}

uint64_t llvm::Type::getInt64Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94798](this, a2);
}

uint64_t llvm::Type::getInt8PtrTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F947B0](this, a2);
}

uint64_t llvm::Type::getInt16PtrTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F947C8](this, a2);
}

uint64_t llvm::Type::getInt32PtrTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F947D0](this, a2);
}

uint64_t llvm::Type::getHalfTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F947F0](this, a2);
}

uint64_t llvm::Type::getInt1Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F947F8](this, a2);
}

uint64_t llvm::Type::getInt8Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94800](this, a2);
}

uint64_t llvm::Type::getVoidTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94810](this, a2);
}

uint64_t llvm::User::getDescriptor(llvm::User *this)
{
  return MEMORY[0x270F94818](this);
}

uint64_t llvm::User::allocHungoffUses(llvm::User *this)
{
  return MEMORY[0x270F94820](this);
}

uint64_t llvm::User::replaceUsesOfWith()
{
  return MEMORY[0x270F94828]();
}

void llvm::User::operator delete(void *a1)
{
}

uint64_t llvm::User::operator new(llvm::User *this)
{
  return MEMORY[0x270F94838](this);
}

{
  return MEMORY[0x270F94840](this);
}

{
  return MEMORY[0x270F94848](this);
}

uint64_t llvm::dbgs(llvm *this)
{
  return MEMORY[0x270F94850](this);
}

uint64_t llvm::Value::setMetadata()
{
  return MEMORY[0x270F94AE8]();
}

{
  return MEMORY[0x270F94AF0]();
}

uint64_t llvm::Value::replaceAllUsesWith()
{
  return MEMORY[0x270F94AF8]();
}

uint64_t llvm::Value::replaceUsesOutsideBlock()
{
  return MEMORY[0x270F94B00]();
}

uint64_t llvm::Value::replaceNonMetadataUsesWith()
{
  return MEMORY[0x270F94B08]();
}

uint64_t llvm::Value::setName()
{
  return MEMORY[0x270F94B10]();
}

uint64_t llvm::Value::takeName()
{
  return MEMORY[0x270F94B18]();
}

uint64_t llvm::Linker::linkModules()
{
  return MEMORY[0x270F94B70]();
}

uint64_t llvm::MDNode::replaceOperandWith()
{
  return MEMORY[0x270F94B90]();
}

uint64_t llvm::Module::materializeAll(llvm::Module *this)
{
  return MEMORY[0x270F94C10](this);
}

uint64_t llvm::Module::getOrInsertGlobal()
{
  return MEMORY[0x270F94C30]();
}

uint64_t llvm::Module::eraseNamedMetadata(llvm::Module *this, llvm::NamedMDNode *a2)
{
  return MEMORY[0x270F94C40](this, a2);
}

uint64_t llvm::Module::getOrInsertFunction()
{
  return MEMORY[0x270F94C48]();
}

{
  return MEMORY[0x270F94C50]();
}

uint64_t llvm::Module::getOrInsertNamedMetadata()
{
  return MEMORY[0x270F94C70]();
}

void llvm::Module::~Module(llvm::Module *this)
{
}

uint64_t llvm::Triple::Triple()
{
  return MEMORY[0x270F94CF8]();
}

uint64_t llvm::legacy::PassManager::run(llvm::legacy::PassManager *this, llvm::Module *a2)
{
  return MEMORY[0x270F94E80](this, a2);
}

uint64_t llvm::legacy::PassManager::PassManager(llvm::legacy::PassManager *this)
{
  return MEMORY[0x270F94E88](this);
}

uint64_t llvm::object::MetalLibObjectFile::MetalLibObjectFile()
{
  return MEMORY[0x270F94EE8]();
}

uint64_t llvm::CmpInst::CmpInst()
{
  return MEMORY[0x270F94F28]();
}

uint64_t llvm::MDTuple::getImpl()
{
  return MEMORY[0x270F94F30]();
}

uint64_t llvm::PHINode::growOperands(llvm::PHINode *this)
{
  return MEMORY[0x270F94F40](this);
}

uint64_t llvm::CallInst::init()
{
  return MEMORY[0x270F94F90]();
}

uint64_t llvm::CastInst::CreatePointerCast()
{
  return MEMORY[0x270F94FB8]();
}

uint64_t llvm::CastInst::CreateSExtOrBitCast()
{
  return MEMORY[0x270F94FC0]();
}

uint64_t llvm::CastInst::CreateZExtOrBitCast()
{
  return MEMORY[0x270F94FC8]();
}

uint64_t llvm::CastInst::CreatePointerBitCastOrAddrSpaceCast()
{
  return MEMORY[0x270F94FD8]();
}

uint64_t llvm::CastInst::Create()
{
  return MEMORY[0x270F94FE0]();
}

uint64_t llvm::Constant::getNullValue(llvm::Constant *this, llvm::Type *a2)
{
  return MEMORY[0x270F94FE8](this, a2);
}

uint64_t llvm::Constant::destroyConstant(llvm::Constant *this)
{
  return MEMORY[0x270F94FF0](this);
}

uint64_t llvm::Constant::handleOperandChange()
{
  return MEMORY[0x270F95008]();
}

uint64_t llvm::DebugLoc::get()
{
  return MEMORY[0x270F95010]();
}

uint64_t llvm::Function::addParamAttr()
{
  return MEMORY[0x270F95030]();
}

{
  return MEMORY[0x270F95038]();
}

uint64_t llvm::Function::removeFnAttr()
{
  return MEMORY[0x270F95040]();
}

uint64_t llvm::Function::addParamAttrs()
{
  return MEMORY[0x270F95050]();
}

uint64_t llvm::Function::setSubprogram()
{
  return MEMORY[0x270F95068]();
}

uint64_t llvm::Function::eraseFromParent(llvm::Function *this)
{
  return MEMORY[0x270F95070](this);
}

uint64_t llvm::Function::dropAllReferences(llvm::Function *this)
{
  return MEMORY[0x270F95090](this);
}

uint64_t llvm::Function::copyAttributesFrom(llvm::Function *this, const llvm::Function *a2)
{
  return MEMORY[0x270F95098](this, a2);
}

uint64_t llvm::Function::addFnAttr()
{
  return MEMORY[0x270F950A8]();
}

{
  return MEMORY[0x270F950B0]();
}

{
  return MEMORY[0x270F950B8]();
}

uint64_t llvm::Function::Function()
{
  return MEMORY[0x270F950C0]();
}

uint64_t llvm::LoadInst::LoadInst()
{
  return MEMORY[0x270F950C8]();
}

uint64_t llvm::MDString::get()
{
  return MEMORY[0x270F950D0]();
}

uint64_t llvm::ArrayType::get(llvm::ArrayType *this, llvm::Type *a2)
{
  return MEMORY[0x270F95118](this, a2);
}

uint64_t llvm::Attribute::getWithDereferenceableBytes(llvm::Attribute *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F95138](this, a2);
}

uint64_t llvm::CallGraph::CallGraph(llvm::CallGraph *this, llvm::Module *a2)
{
  return MEMORY[0x270F95158](this, a2);
}

void llvm::CallGraph::~CallGraph(llvm::CallGraph *this)
{
}

uint64_t llvm::StoreInst::StoreInst()
{
  return MEMORY[0x270F95438]();
}

uint64_t llvm::AllocaInst::isStaticAlloca(llvm::AllocaInst *this)
{
  return MEMORY[0x270F95450](this);
}

uint64_t llvm::BasicBlock::getContext(llvm::BasicBlock *this)
{
  return MEMORY[0x270F95460](this);
}

uint64_t llvm::BasicBlock::getFirstNonPHI(llvm::BasicBlock *this)
{
  return MEMORY[0x270F95470](this);
}

uint64_t llvm::BasicBlock::getFirstInsertionPt(llvm::BasicBlock *this)
{
  return MEMORY[0x270F95490](this);
}

uint64_t llvm::BasicBlock::getFirstNonPHIOrDbg(llvm::BasicBlock *this)
{
  return MEMORY[0x270F95498](this);
}

uint64_t llvm::BasicBlock::getFirstNonPHIOrDbgOrLifetime(llvm::BasicBlock *this)
{
  return MEMORY[0x270F954A8](this);
}

uint64_t llvm::BasicBlock::getModule(llvm::BasicBlock *this)
{
  return MEMORY[0x270F954B0](this);
}

uint64_t llvm::DataLayout::getABITypeAlign(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x270F954F0](this, a2);
}

uint64_t llvm::DataLayout::getStructLayout()
{
  return MEMORY[0x270F954F8]();
}

uint64_t llvm::DataLayout::getPrefTypeAlign(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x270F95500](this, a2);
}

uint64_t llvm::DataLayout::getABITypeAlignment(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x270F95508](this, a2);
}

uint64_t llvm::DataLayout::getPointerAlignElem(llvm::DataLayout *this)
{
  return MEMORY[0x270F95510](this);
}

uint64_t llvm::DataLayout::getPrefTypeAlignment(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x270F95518](this, a2);
}

uint64_t llvm::StructType::getName(llvm::StructType *this)
{
  return MEMORY[0x270F95548](this);
}

uint64_t llvm::GlobalValue::isDeclaration(llvm::GlobalValue *this)
{
  return MEMORY[0x270F95570](this);
}

uint64_t llvm::GlobalValue::hasExternalWeakLinkage(llvm::GlobalValue *this)
{
  return MEMORY[0x270F95598](this);
}

uint64_t llvm::Instruction::getFunction(llvm::Instruction *this)
{
  return MEMORY[0x270F955A8](this);
}

uint64_t llvm::Instruction::getMetadataImpl()
{
  return MEMORY[0x270F955B8]();
}

uint64_t llvm::Instruction::getMetadataImpl(llvm::Instruction *this)
{
  return MEMORY[0x270F955C0](this);
}

uint64_t llvm::Instruction::clone(llvm::Instruction *this)
{
  return MEMORY[0x270F955E8](this);
}

uint64_t llvm::Instruction::getModule(llvm::Instruction *this)
{
  return MEMORY[0x270F95600](this);
}

uint64_t llvm::LLVMContext::getDiagnosticContext(llvm::LLVMContext *this)
{
  return MEMORY[0x270F95618](this);
}

uint64_t llvm::LLVMContext::getDiagnosticHandlerCallBack(llvm::LLVMContext *this)
{
  return MEMORY[0x270F95620](this);
}

uint64_t llvm::NamedMDNode::getOperand(llvm::NamedMDNode *this)
{
  return MEMORY[0x270F95628](this);
}

uint64_t llvm::NamedMDNode::getNumOperands(llvm::NamedMDNode *this)
{
  return MEMORY[0x270F95640](this);
}

uint64_t llvm::AttributeSet::addAttribute()
{
  return MEMORY[0x270F956A0]();
}

uint64_t llvm::AttributeSet::end(llvm::AttributeSet *this)
{
  return MEMORY[0x270F956C0](this);
}

uint64_t llvm::AttributeSet::begin(llvm::AttributeSet *this)
{
  return MEMORY[0x270F956C8](this);
}

uint64_t llvm::ConstantExpr::getAsInstruction(llvm::ConstantExpr *this, llvm::Instruction *a2)
{
  return MEMORY[0x270F956D0](this, a2);
}

uint64_t llvm::ConstantExpr::isCast(llvm::ConstantExpr *this)
{
  return MEMORY[0x270F956D8](this);
}

uint64_t llvm::DILocalScope::getSubprogram(llvm::DILocalScope *this)
{
  return MEMORY[0x270F956E0](this);
}

uint64_t llvm::AttributeList::getFnAttrs(llvm::AttributeList *this)
{
  return MEMORY[0x270F95740](this);
}

uint64_t llvm::AttributeList::getRetAttrs(llvm::AttributeList *this)
{
  return MEMORY[0x270F95748](this);
}

uint64_t llvm::AttributeList::getAttributes(llvm::AttributeList *this)
{
  return MEMORY[0x270F95750](this);
}

uint64_t llvm::AttributeList::getParamAttrs(llvm::AttributeList *this)
{
  return MEMORY[0x270F95758](this);
}

uint64_t llvm::AttributeList::addAttributeAtIndex()
{
  return MEMORY[0x270F95778]();
}

uint64_t llvm::IRBuilderBase::getCurrentDebugLocation(llvm::IRBuilderBase *this)
{
  return MEMORY[0x270F957C8](this);
}

uint64_t llvm::StringMapImpl::FindKey()
{
  return MEMORY[0x270F957D0]();
}

uint64_t llvm::TargetExtType::getLayoutType(llvm::TargetExtType *this)
{
  return MEMORY[0x270F957D8](this);
}

uint64_t llvm::ConstantDataSequential::getRawDataValues(llvm::ConstantDataSequential *this)
{
  return MEMORY[0x270F95878](this);
}

uint64_t llvm::Type::getPointerTo(llvm::Type *this)
{
  return MEMORY[0x270F95988](this);
}

uint64_t llvm::Type::getScalarSizeInBits(llvm::Type *this)
{
  return MEMORY[0x270F959A8](this);
}

uint64_t llvm::Type::getPrimitiveSizeInBits(llvm::Type *this)
{
  return MEMORY[0x270F959B0](this);
}

uint64_t llvm::APInt::countLeadingZerosSlowCase(llvm::APInt *this)
{
  return MEMORY[0x270F95A38](this);
}

uint64_t llvm::Twine::str(llvm::Twine *this)
{
  return MEMORY[0x270F95B40](this);
}

uint64_t llvm::Value::getContext(llvm::Value *this)
{
  return MEMORY[0x270F95B58](this);
}

uint64_t llvm::Value::getMetadata()
{
  return MEMORY[0x270F95B68]();
}

uint64_t llvm::Value::hasNUsesOrMore(llvm::Value *this)
{
  return MEMORY[0x270F95B70](this);
}

uint64_t llvm::Value::dump(llvm::Value *this)
{
  return MEMORY[0x270F95B98](this);
}

uint64_t llvm::Value::getName(llvm::Value *this)
{
  return MEMORY[0x270F95BA8](this);
}

uint64_t llvm::Module::getFunction()
{
  return MEMORY[0x270F95BC8]();
}

uint64_t llvm::Module::getMDKindID()
{
  return MEMORY[0x270F95BD0]();
}

uint64_t llvm::Module::getDataLayout(llvm::Module *this)
{
  return MEMORY[0x270F95BD8](this);
}

uint64_t llvm::Module::getNamedMetadata(llvm::Module *this, const llvm::Twine *a2)
{
  return MEMORY[0x270F95BF8](this, a2);
}

uint64_t llvm::Module::getGlobalVariable()
{
  return MEMORY[0x270F95C10]();
}

uint64_t llvm::Module::print()
{
  return MEMORY[0x270F95C18]();
}

uint64_t llvm::object::MetalLibObjectFile::materializeModuleForFunctionNo(llvm::object::MetalLibObjectFile *this)
{
  return MEMORY[0x270F95D20](this);
}

uint64_t llvm::object::MetalLibObjectFile::functions(llvm::object::MetalLibObjectFile *this)
{
  return MEMORY[0x270F95D28](this);
}

uint64_t llvm::CallBase::getNumSubclassExtraOperandsDynamic(llvm::CallBase *this)
{
  return MEMORY[0x270F95DF8](this);
}

uint64_t llvm::Constant::isZeroValue(llvm::Constant *this)
{
  return MEMORY[0x270F95E10](this);
}

uint64_t llvm::Constant::getAggregateElement(llvm::Constant *this)
{
  return MEMORY[0x270F95E30](this);
}

uint64_t llvm::Constant::removeDeadConstantUsers(llvm::Constant *this)
{
  return MEMORY[0x270F95E38](this);
}

uint64_t llvm::Function::getContext(llvm::Function *this)
{
  return MEMORY[0x270F95E50](this);
}

uint64_t llvm::Function::getSubprogram(llvm::Function *this)
{
  return MEMORY[0x270F95E58](this);
}

uint64_t llvm::Function::hasFnAttribute()
{
  return MEMORY[0x270F95E68]();
}

uint64_t llvm::Function::BuildLazyArguments(llvm::Function *this)
{
  return MEMORY[0x270F95E80](this);
}

uint64_t llvm::MDString::getString(llvm::MDString *this)
{
  return MEMORY[0x270F95E90](this);
}

uint64_t llvm::TypeSize::operator unsigned long long()
{
  return MEMORY[0x270F95EA0]();
}

uint64_t llvm::StringRef::find()
{
  return MEMORY[0x270F95F48]();
}

uint64_t llvm::StringRef::split()
{
  return MEMORY[0x270F95F60]();
}

std::string::size_type std::string::find(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return MEMORY[0x270F98230](this, __s, __pos, __n);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
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

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98500](this, __pos, __n1, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
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

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98910]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E30](retstr, __val);
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void abort(void)
{
}

uint64_t abort_with_reason()
{
  return MEMORY[0x270ED8468]();
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x270ED86F0](a1);
}

uint64_t backtrace_set_pcs_func()
{
  return MEMORY[0x270ED8728]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t deleteCompilerHelper()
{
  return MEMORY[0x270F49520]();
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int getpagesize(void)
{
  return MEMORY[0x270ED9CC8]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5C0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  return (void *)MEMORY[0x270EDAED0](a1);
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  return MEMORY[0x270EDAED8](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

uintptr_t pthread_stack_frame_decode_np(uintptr_t frame_addr, uintptr_t *return_addr)
{
  return MEMORY[0x270EDB060](frame_addr, return_addr);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x270EDBBE8](__s, *(void *)&__c, __n);
}