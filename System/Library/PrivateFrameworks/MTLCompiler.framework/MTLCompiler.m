void MTLCompilerHelper::~MTLCompilerHelper(MTLCompilerHelper *this)
{
  JUMPOUT(0x21D47D520);
}

void createCompilerHelper()
{
}

void MTLCompilerBuiltInFileReaderImpl::~MTLCompilerBuiltInFileReaderImpl(MTLCompilerBuiltInFileReaderImpl *this)
{
  MTLCompilerBuiltInFileReaderImpl::~MTLCompilerBuiltInFileReaderImpl(this);
  JUMPOUT(0x21D47D520);
}

{
  uint64_t v2;

  *(void *)this = &unk_26CA797E0;
  v2 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  free(*((void **)this + 2));
  free(*((void **)this + 4));
}

void MTLCompilerHelper::openBuiltInFileReader(MTLCompilerHelper *this, const char *a2)
{
}

BOOL MTLCompilerBuiltInFileReaderImpl::open(MTLCompilerBuiltInFileReaderImpl *this, char *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  __int16 v21 = 260;
  v20 = __p;
  llvm::MemoryBuffer::getFile();
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (v23)
  {
    uint64_t v3 = v22;
    if (v22)
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    std::system_category();
    uint64_t v3 = v22;
  }
  uint64_t v22 = 0;
  uint64_t v4 = *((void *)this + 5);
  *((void *)this + 5) = v3;
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    uint64_t v3 = *((void *)this + 5);
  }
  v5 = *(unsigned int **)(v3 + 8);
  *((void *)this + 6) = v5;
  unint64_t v6 = *(void *)(v3 + 16) - (void)v5;
  *((void *)this + 7) = 4;
  *((void *)this + 8) = v6;
  if (v6 < 4) {
    goto LABEL_19;
  }
  unsigned int v7 = *v5;
  if (!*v5) {
    goto LABEL_19;
  }
  StaticHashTable::init((MTLCompilerBuiltInFileReaderImpl *)((char *)this + 8), *v5);
  BOOL v8 = 0;
  int v9 = 0;
  do
  {
    unint64_t v10 = *((void *)this + 7);
    unint64_t v11 = *((void *)this + 8);
    if (v10 >= v11) {
      break;
    }
    uint64_t v12 = *((void *)this + 6);
    uint64_t v13 = *((void *)this + 7);
    while (1)
    {
      uint64_t v14 = v13 + 1;
      if (!*(unsigned char *)(v12 + v13)) {
        break;
      }
      ++v13;
      if (v11 == v14) {
        goto LABEL_20;
      }
    }
    *((void *)this + 7) = v14;
    if (v13 + 5 > v11) {
      break;
    }
    int v15 = *(_DWORD *)(v12 + v13 + 1);
    *((void *)this + 7) = v13 + 5;
    StaticHashTable::addFunction((uint64_t)this + 8, (const char *)(v12 + v10), v15);
    BOOL v8 = ++v9 >= v7;
  }
  while (v9 != v7);
LABEL_20:
  if ((v23 & 1) == 0)
  {
    uint64_t v16 = v22;
    uint64_t v22 = 0;
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
    }
  }
  return v8;
}

void sub_218FBD7A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, _Unwind_Exception *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  uint64_t v22 = exception_object;
  if ((a22 & 1) == 0)
  {
    MTLCompilerBuiltInFileReaderImpl::open(&a20, (uint64_t)exception_object, a2, (uint64_t)&a15);
    uint64_t v22 = a15;
  }
  _Unwind_Resume(v22);
}

uint64_t StaticHashTable::addFunction(uint64_t this, const char *a2, int a3)
{
  uint64_t v3 = *(unsigned int *)(this + 16);
  uint64_t v4 = *(void *)(this + 24) + 16 * v3;
  *(_DWORD *)uint64_t v4 = -1;
  *(_DWORD *)(v4 + 4) = a3;
  *(void *)(v4 + 8) = a2;
  LOBYTE(v5) = *a2;
  if (*a2)
  {
    unsigned int v6 = 0;
    int v7 = 1;
    int v8 = 1;
    do
    {
      v6 += v8 * (char)v5;
      v8 *= 2;
      int v5 = a2[v7++];
    }
    while (v5);
  }
  else
  {
    unsigned int v6 = 0;
  }
  unsigned int v9 = v6 % *(_DWORD *)this;
  uint64_t v10 = *(void *)(this + 8);
  int v11 = *(_DWORD *)(v10 + 4 * v9);
  *(_DWORD *)(v10 + 4 * v9) = v3;
  if (v11 != -1) {
    *(_DWORD *)uint64_t v4 = v11;
  }
  ++*(_DWORD *)(this + 16);
  return this;
}

uint64_t MTLCompilerBuiltInFileReaderImpl::getBuiltinsModule(void *a1, int a2, char **a3)
{
  v44[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = *a3;
  uint64_t v4 = a3[1];
  if (*a3 == v4) {
    return 0;
  }
  uint64_t v7 = 0;
  do
  {
    int v8 = v3;
    if (v3[23] < 0) {
      int v8 = *(char **)v3;
    }
    uint64_t BuiltinModuleByName = MTLCompilerBuiltInFileReaderImpl::getBuiltinModuleByName(a1, a2, v8);
    if (BuiltinModuleByName)
    {
      if (v7)
      {
        v44[3] = 0;
        int v10 = llvm::Linker::linkModules();
        std::__function::__value_func<void ()(llvm::Module &,llvm::StringSet<llvm::MallocAllocator> const&)>::~__value_func[abi:ne180100](v44);
        v42[1] = 0;
        uint64_t v11 = MEMORY[0x21D47D480]();
        MEMORY[0x21D47D520](v11, 0x10B2C407FF26C1CLL);
        if (v10) {
          abort();
        }
      }
      else
      {
        uint64_t v7 = BuiltinModuleByName;
      }
    }
    v3 += 24;
  }
  while (v3 != v4);
  if (v7)
  {
    v41 = 0;
    v42[0] = 0;
    v40 = 0;
    uint64_t v12 = v7 + 8;
    uint64_t v13 = *(void *)(v7 + 16);
    if (v13 != v7 + 8)
    {
      do
      {
        if (v13) {
          uint64_t v14 = (llvm::Value *)(v13 - 56);
        }
        else {
          uint64_t v14 = 0;
        }
        if ((*((unsigned char *)v14 + 32) & 0xF) == 0)
        {
          Name = (void *)llvm::Value::getName(v14);
          if (Name)
          {
            std::string::basic_string[abi:ne180100](__p, Name, v15);
            if (v39 >= 0) {
              v17 = (char *)__p;
            }
            else {
              v17 = (char *)__p[0];
            }
          }
          else
          {
            __p[0] = 0;
            __p[1] = 0;
            v17 = (char *)__p;
            uint64_t v39 = 0;
          }
          uint64_t v18 = MTLCompilerBuiltInFileReaderImpl::getBuiltinModuleByName(a1, a2, v17);
          uint64_t v19 = v18;
          if (v18)
          {
            v20 = v41;
            if ((unint64_t)v41 >= v42[0])
            {
              uint64_t v22 = ((char *)v41 - (unsigned char *)v40) >> 3;
              if ((unint64_t)(v22 + 1) >> 61) {
                std::vector<llvm::Module *>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v23 = (uint64_t)(v42[0] - (void)v40) >> 2;
              if (v23 <= v22 + 1) {
                unint64_t v23 = v22 + 1;
              }
              if (v42[0] - (void)v40 >= 0x7FFFFFFFFFFFFFF8uLL) {
                unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v24 = v23;
              }
              if (v24) {
                v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Module *>>((uint64_t)v42, v24);
              }
              else {
                v25 = 0;
              }
              v26 = (uint64_t *)&v25[8 * v22];
              uint64_t *v26 = v19;
              __int16 v21 = v26 + 1;
              v28 = (char *)v40;
              v27 = (char *)v41;
              if (v41 != v40)
              {
                do
                {
                  uint64_t v29 = *((void *)v27 - 1);
                  v27 -= 8;
                  *--v26 = v29;
                }
                while (v27 != v28);
                v27 = (char *)v40;
              }
              v40 = v26;
              v41 = v21;
              v42[0] = &v25[8 * v24];
              if (v27) {
                operator delete(v27);
              }
            }
            else
            {
              uint64_t *v41 = v18;
              __int16 v21 = v20 + 1;
            }
            v41 = v21;
          }
          if (SHIBYTE(v39) < 0) {
            operator delete(__p[0]);
          }
        }
        uint64_t v13 = *(void *)(v13 + 8);
      }
      while (v13 != v12);
      v30 = (uint64_t *)v40;
      v31 = v41;
      while (v30 != v31)
      {
        uint64_t v37 = *v30;
        v43[3] = 0;
        int v32 = llvm::Linker::linkModules();
        std::__function::__value_func<void ()(llvm::Module &,llvm::StringSet<llvm::MallocAllocator> const&)>::~__value_func[abi:ne180100](v43);
        if (v37)
        {
          uint64_t v33 = MEMORY[0x21D47D480]();
          MEMORY[0x21D47D520](v33, 0x10B2C407FF26C1CLL);
        }
        if (v32) {
          abort();
        }
        ++v30;
      }
    }
    for (uint64_t i = *(void *)(v7 + 16); i != v12; uint64_t i = *(void *)(i + 8))
    {
      if (i) {
        v35 = (llvm::GlobalValue *)(i - 56);
      }
      else {
        v35 = 0;
      }
      if (llvm::GlobalValue::isDeclaration(v35)) {
        llvm::GlobalValue::setLinkage((uint64_t)v35, 0);
      }
      else {
        *((_DWORD *)v35 + 8) = *((_DWORD *)v35 + 8) & 0xFFFFBFC0 | 0x4007;
      }
    }
    if (v40)
    {
      v41 = (uint64_t *)v40;
      operator delete(v40);
    }
  }
  return v7;
}

void sub_218FBDBCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, uint64_t a19, char a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t MTLCompilerBuiltInFileReaderImpl::getBuiltinModuleByName(void *a1, int a2, char *__s2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int FunctionOffset = StaticHashTable::findFunctionOffset((StaticHashTable *)(a1 + 1), __s2);
  if (FunctionOffset == -1) {
    return 0;
  }
  unint64_t v5 = FunctionOffset + 4;
  unint64_t v6 = a1[8];
  if (v5 > v6 || v6 < (*(_DWORD *)(a1[6] + FunctionOffset) + v5)) {
    return 0;
  }
  llvm::MemoryBuffer::getMemBuffer();
  llvm::MemoryBuffer::getMemBufferRef(v10, v11);
  llvm::parseBitcodeFile();
  llvm::expectedToErrorOrAndEmitErrors<std::unique_ptr<llvm::Module>>(v12, (uint64_t)&v13);
  llvm::Expected<std::unique_ptr<llvm::Module>>::~Expected((uint64_t)v12);
  if (v14) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v13;
  }
  unsigned int v9 = v11;
  uint64_t v11 = 0;
  if (v9) {
    (*(void (**)(llvm::MemoryBuffer *))(*(void *)v9 + 8))(v9);
  }
  return v7;
}

void sub_218FBDD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  llvm::Expected<std::unique_ptr<llvm::Module>>::~Expected((uint64_t)va);
  if (a7) {
    (*(void (**)(uint64_t))(*(void *)a7 + 8))(a7);
  }
  _Unwind_Resume(a1);
}

uint64_t MTLCompilerBuiltInFileReaderImpl::getBuiltinsModuleForSourceModule(MTLCompilerBuiltInFileReaderImpl *this, llvm::Module *a2)
{
  uint64_t v3 = *(void *)a2;
  memset(&v22, 0, sizeof(v22));
  uint64_t v4 = (char *)a2 + 24;
  unint64_t v5 = (char *)*((void *)a2 + 4);
  if (v5 != (char *)a2 + 24)
  {
    do
    {
      if (v5) {
        unint64_t v6 = (llvm::Value *)(v5 - 56);
      }
      else {
        unint64_t v6 = 0;
      }
      if (llvm::GlobalValue::isDeclaration(v6))
      {
        Name = (void *)llvm::Value::getName(v6);
        if (Name)
        {
          std::string::basic_string[abi:ne180100](__p, Name, v7);
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          std::string::size_type v21 = 0;
        }
        std::vector<std::string>::pointer end = v22.__end_;
        if (v22.__end_ >= v22.__end_cap_.__value_)
        {
          unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v22.__end_ - (char *)v22.__begin_) >> 3);
          unint64_t v12 = v11 + 1;
          if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<llvm::Module *>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v22.__end_cap_.__value_ - (char *)v22.__begin_) >> 3) > v12) {
            unint64_t v12 = 0x5555555555555556 * (((char *)v22.__end_cap_.__value_ - (char *)v22.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v22.__end_cap_.__value_ - (char *)v22.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v13 = v12;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v22.__end_cap_;
          if (v13) {
            char v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v22.__end_cap_, v13);
          }
          else {
            char v14 = 0;
          }
          uint64_t v15 = v14 + v11;
          __v.__first_ = v14;
          __v.__begin_ = v15;
          __v.__end_cap_.__value_ = &v14[v13];
          long long v16 = *(_OWORD *)__p;
          v15->__r_.__value_.__r.__words[2] = v21;
          *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
          __p[1] = 0;
          std::string::size_type v21 = 0;
          __p[0] = 0;
          __v.__end_ = v15 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v22, &__v);
          v17 = v22.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v22.__end_ = v17;
          if (SHIBYTE(v21) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v10 = *(_OWORD *)__p;
          v22.__end_->__r_.__value_.__r.__words[2] = v21;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
          v22.__end_ = end + 1;
        }
      }
      unint64_t v5 = (char *)*((void *)v5 + 1);
    }
    while (v5 != v4);
  }
  uint64_t v18 = (*(uint64_t (**)(MTLCompilerBuiltInFileReaderImpl *, uint64_t, std::vector<std::string> *))(*(void *)this + 16))(this, v3, &v22);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  return v18;
}

void sub_218FBDFEC(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, char a8, uint64_t a9, char *__pa, std::__split_buffer<std::string> *a11, uint64_t a12, char a13)
{
  __pa = &a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

uint64_t StaticHashTable::findFunctionOffset(StaticHashTable *this, const char *__s2)
{
  LOBYTE(v3) = *__s2;
  if (*__s2)
  {
    unsigned int v4 = 0;
    int v5 = 1;
    int v6 = 1;
    do
    {
      v4 += v6 * (char)v3;
      v6 *= 2;
      int v3 = __s2[v5++];
    }
    while (v3);
  }
  else
  {
    unsigned int v4 = 0;
  }
  uint64_t v7 = *(unsigned int *)(*((void *)this + 1) + 4 * (v4 % *(_DWORD *)this));
  if (v7 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = *((void *)this + 3);
  while (1)
  {
    uint64_t v9 = v8 + 16 * v7;
    if (!strcmp(*(const char **)(v9 + 8), __s2)) {
      break;
    }
    uint64_t v7 = *(unsigned int *)(v8 + 16 * v7);
    if (v7 == -1) {
      return 0xFFFFFFFFLL;
    }
  }
  return *(unsigned int *)(v9 + 4);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::vector<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void *StaticHashTable::init(StaticHashTable *this, unsigned int a2)
{
  *(_DWORD *)this = a2;
  size_t v4 = 4 * a2;
  int v5 = malloc_type_malloc(v4, 0xD18EAAFEuLL);
  *((void *)this + 1) = v5;
  memset(v5, 255, v4);
  *((_DWORD *)this + 5) = a2;
  size_t v6 = 16 * a2;
  uint64_t v7 = malloc_type_malloc(v6, 0x4699452uLL);
  *((void *)this + 3) = v7;
  result = memset(v7, 255, v6);
  *((_DWORD *)this + 4) = 0;
  return result;
}

uint64_t deleteCompilerHelper(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

void StaticHashTable::~StaticHashTable(void **this)
{
}

void __clang_call_terminate(void *a1)
{
}

BOOL MTLCompilerBuiltInFileReaderImpl::readBytes(MTLCompilerBuiltInFileReaderImpl *this, void *__dst, size_t a3)
{
  uint64_t v3 = *((void *)this + 7);
  size_t v4 = *((void *)this + 8);
  size_t v5 = v3 + a3;
  if (v3 + a3 <= v4)
  {
    memcpy(__dst, (const void *)(*((void *)this + 6) + v3), a3);
    *((void *)this + 7) += a3;
  }
  return v5 <= v4;
}

uint64_t MTLCompilerBuiltInFileReaderImpl::readString(MTLCompilerBuiltInFileReaderImpl *this)
{
  unint64_t v1 = *((void *)this + 7);
  unint64_t v2 = *((void *)this + 8);
  if (v1 >= v2) {
    return 0;
  }
  uint64_t v3 = *((void *)this + 6);
  uint64_t v4 = *((void *)this + 7);
  while (*(unsigned __int8 *)(v3 + v4++))
  {
    if (v2 == v4) {
      return 0;
    }
  }
  *((void *)this + 7) = v4;
  return v3 + v1;
}

void llvm::expectedToErrorOrAndEmitErrors<std::unique_ptr<llvm::Module>>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  if (a1[1])
  {
    uint64_t v4 = *a1;
    *a1 = 0;
    uint64_t v7 = v4;
    uint64_t v5 = llvm::errorToErrorCodeAndEmitErrors();
    *(unsigned char *)(a2 + 16) |= 1u;
    *(void *)a2 = v5;
    *(void *)(a2 + 8) = v6;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
  }
  else
  {
    *(unsigned char *)(a2 + 16) &= ~1u;
    uint64_t v3 = *a1;
    *a1 = 0;
    *(void *)a2 = v3;
  }
}

void sub_218FBE3C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    llvm::expectedToErrorOrAndEmitErrors<std::unique_ptr<llvm::Module>>(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t llvm::GlobalValue::setLinkage(uint64_t this, int a2)
{
  uint64_t v2 = this;
  int v3 = *(_DWORD *)(this + 32);
  if ((a2 - 7) < 2) {
    v3 &= 0xFFFFFFCF;
  }
  unsigned int v4 = v3 & 0xFFFFFFF0 | a2 & 0xF;
  *(_DWORD *)(this + 32) = v4;
  if ((a2 & 0xFu) - 7 < 2) {
    goto LABEL_7;
  }
  if ((v3 & 0x30) != 0)
  {
    this = llvm::GlobalValue::hasExternalWeakLinkage((llvm::GlobalValue *)this);
    if ((this & 1) == 0)
    {
      unsigned int v4 = *(_DWORD *)(v2 + 32);
LABEL_7:
      *(_DWORD *)(v2 + 32) = v4 | 0x4000;
    }
  }
  return this;
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
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264390178, MEMORY[0x263F8C060]);
}

void sub_218FBE564(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  unint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
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

void llvm::function_ref<llvm::Optional<std::string> ()(llvm::StringRef)>::callback_fn<llvm::$_0>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

uint64_t llvm::Expected<std::unique_ptr<llvm::Module>>::~Expected(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v2 = *(void *)a1;
    *(void *)a1 = 0;
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
  }
  else
  {
    std::unique_ptr<llvm::Module>::reset[abi:ne180100]((uint64_t *)a1, 0);
  }
  return a1;
}

uint64_t std::unique_ptr<llvm::Module>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    MEMORY[0x21D47D480]();
    JUMPOUT(0x21D47D520);
  }
  return result;
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

void std::vector<llvm::Module *>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Module *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    int v3 = **a1;
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  uint64_t v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
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

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      size_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        size_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t llvm::expectedToErrorOrAndEmitErrors<std::unique_ptr<llvm::Module>>(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t MTLCompilerBuiltInFileReaderImpl::open(uint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t llvm::MemoryBuffer::getMemBuffer()
{
  return MEMORY[0x270F935F0]();
}

uint64_t llvm::MemoryBuffer::getFile()
{
  return MEMORY[0x270F93610]();
}

uint64_t llvm::parseBitcodeFile()
{
  return MEMORY[0x270F93C98]();
}

uint64_t llvm::errorToErrorCodeAndEmitErrors()
{
  return MEMORY[0x270F94200]();
}

uint64_t llvm::Linker::linkModules()
{
  return MEMORY[0x270F94B70]();
}

void llvm::Module::~Module(llvm::Module *this)
{
}

uint64_t llvm::GlobalValue::isDeclaration(llvm::GlobalValue *this)
{
  return MEMORY[0x270F95570](this);
}

uint64_t llvm::GlobalValue::hasExternalWeakLinkage(llvm::GlobalValue *this)
{
  return MEMORY[0x270F95598](this);
}

uint64_t llvm::MemoryBuffer::getMemBufferRef(llvm::MemoryBuffer *this)
{
  return MEMORY[0x270F95708](this);
}

uint64_t llvm::Value::getName(llvm::Value *this)
{
  return MEMORY[0x270F95BA8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98910]();
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void abort(void)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}