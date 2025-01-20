void sub_2489060F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](&a19);
  if (a18 < 0) {
    operator delete(__p);
  }
  std::vector<std::pair<std::string,AudioComponentDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  std::__hash_table<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<AudioComponentDescription>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,true>,std::__unordered_map_equal<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,std::hash<AudioComponentDescription>,true>,std::allocator<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table(v21);
  std::__hash_table<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table(v20);
  v23 = *(void *)(v19 + 16);
  *(void *)(v19 + 16) = 0;
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  }
  _Unwind_Resume(a1);
}

uint64_t CADSPGraphInterpreterCreate(uint64_t a1)
{
  v1 = +[CADSPGraphInterpreter allocWithZone:a1];

  return (uint64_t)[(CADSPGraphInterpreter *)v1 init];
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
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
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
}

void sub_2489063B0(_Unwind_Exception *a1)
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

__n128 std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(std::string *a1, std::string *a2, char *__s)
{
  size_t v6 = strlen(__s);
  uint64_t v7 = (__n128 *)std::string::append(a2, __s, v6);
  __n128 result = *v7;
  *a1 = *(std::string *)v7->n128_u8;
  v7->n128_u64[0] = 0;
  v7->n128_u64[1] = 0;
  v7[1].n128_u64[0] = 0;
  return result;
}

uint64_t AudioDSPGraph::getLog(AudioDSPGraph *this)
{
  unint64_t v1 = 0x269332000uLL;
  {
    unint64_t v1 = 0x269332000;
    if (v3)
    {
      AudioDSPGraph::getLog(void)::gLog = (uint64_t)os_log_create("com.apple.coreaudio", "AudioDSPGraph");
      unint64_t v1 = 0x269332000;
    }
  }
  return *(void *)(v1 + 1576);
}

void __clang_call_terminate(void *a1)
{
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  unint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    if (__n >> 62) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    size_t v4 = (unsigned int *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(__n);
    this->__begin_ = v4;
    this->__end_cap_.__value_ = &v4[v5];
    bzero(v4, 4 * __n);
    this->__end_ = &v4[__n];
  }
  return this;
}

void sub_248906584(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned int>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t AudioDSPGraph::AnalyzerBuilder::print(uint64_t result, void *a2, uint64_t a3, int a4)
{
  uint64_t v4 = *(void *)(result + 24);
  if (v4)
  {
    unsigned int v17 = a4 + 4;
    uint64_t v6 = MEMORY[0x263F8C328] + 64;
    uint64_t v23 = *(void *)(MEMORY[0x263F8C2B8] + 24);
    uint64_t v21 = *(void *)(MEMORY[0x263F8C2B8] + 32);
    uint64_t v22 = *(void *)(MEMORY[0x263F8C2B8] + 16);
    uint64_t v19 = *(void *)(MEMORY[0x263F8C2B8] + 8);
    uint64_t v20 = *(void *)(MEMORY[0x263F8C2B8] + 40);
    uint64_t v18 = *(void *)(MEMORY[0x263F8C2B8] + 48);
    uint64_t v16 = MEMORY[0x263F8C328] + 104;
    uint64_t v33 = MEMORY[0x263F8C328] + 104;
    uint64_t v27 = MEMORY[0x263F8C328] + 64;
    v26[0] = v22;
    *(void *)((char *)v26 + *(void *)(v22 - 24)) = v23;
    v26[1] = 0;
    uint64_t v7 = (std::ios_base *)((char *)v26 + *(void *)(v26[0] - 24));
    std::ios_base::init(v7, v28);
    uint64_t v8 = MEMORY[0x263F8C328] + 24;
    v7[1].__vftable = 0;
    v7[1].__fmtflags_ = -1;
    uint64_t v27 = v21;
    *(void *)((char *)&v28[-1] + *(void *)(v21 - 24)) = v20;
    v26[0] = v19;
    *(void *)((char *)v26 + *(void *)(v19 - 24)) = v18;
    uint64_t v33 = v16;
    v26[0] = v8;
    uint64_t v27 = v6;
    std::streambuf::basic_streambuf();
    v28[0] = MEMORY[0x263F8C318] + 16;
    long long __p = 0u;
    long long v31 = 0u;
    int v32 = 24;
    AudioDSPGraph::print4cc(&v27, *(_DWORD *)(v4 + 52));
    if ((v32 & 0x10) != 0)
    {
      unint64_t v11 = *((void *)&v31 + 1);
      if (*((void *)&v31 + 1) < v29)
      {
        *((void *)&v31 + 1) = v29;
        unint64_t v11 = v29;
      }
      v12 = (const void *)v28[5];
    }
    else
    {
      if ((v32 & 8) == 0)
      {
        size_t v9 = 0;
        HIBYTE(v25) = 0;
        v10 = __dst;
        goto LABEL_17;
      }
      v12 = (const void *)v28[2];
      unint64_t v11 = v28[4];
    }
    size_t v9 = v11 - (void)v12;
    if (v11 - (unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v9 >= 0x17)
    {
      v13 = a2;
      uint64_t v14 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v9 | 7) != 0x17) {
        uint64_t v14 = v9 | 7;
      }
      uint64_t v15 = v14 + 1;
      v10 = operator new(v14 + 1);
      __dst[1] = v9;
      unint64_t v25 = v15 | 0x8000000000000000;
      __dst[0] = v10;
      a2 = v13;
    }
    else
    {
      HIBYTE(v25) = v11 - (_BYTE)v12;
      v10 = __dst;
      if (!v9)
      {
LABEL_17:
        *((unsigned char *)v10 + v9) = 0;
        AudioDSPGraph::printi(a2, v17, "%s\n");
      }
    }
    memmove(v10, v12, v9);
    goto LABEL_17;
  }
  return result;
}

void sub_248906B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,char a32)
{
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
  MEMORY[0x24C585710](a1 + 128);
  return a1;
}

const char *AudioDSPGraph::AnalyzerBuilder::ClassName(AudioDSPGraph::AnalyzerBuilder *this)
{
  return "AnalyzerBuilder";
}

void AudioDSPGraph::AnalyzerBuilder::~AnalyzerBuilder(AudioDSPGraph::AnalyzerBuilder *this)
{
  *(void *)this = &unk_26FC9C720;
  std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>>>::~__hash_table((uint64_t)this + 8);

  JUMPOUT(0x24C585790);
}

{
  *(void *)this = &unk_26FC9C720;
  std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>>>::~__hash_table((uint64_t)this + 8);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(char **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = *(char **)v2;
      uint64_t v4 = (char *)*((void *)v2 + 12);
      if (v4 == v2 + 72)
      {
        (*(void (**)(char *))(*((void *)v2 + 9) + 32))(v2 + 72);
      }
      else if (v4)
      {
        (*(void (**)(char *))(*(void *)v4 + 40))(v4);
      }
      if (v2[47] < 0) {
        operator delete(*((void **)v2 + 3));
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
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
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24C5855E0](v20, a1);
  if (v20[0])
  {
    std::string::size_type v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      v10 = std::locale::use_facet(&__b, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_23;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    int64_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_23;
    }
    if (v16 >= 1)
    {
      std::string::basic_string[abi:ne180100](&__b, v16, (char)v9);
      unsigned int v17 = v22 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v18 = (*(uint64_t (**)(uint64_t, std::locale *, int64_t))(*(void *)v7 + 96))(v7, v17, v16);
      if (v22 < 0) {
        operator delete(__b.__locale_);
      }
      if (v18 != v16) {
        goto LABEL_23;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_23:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x24C5855F0](v20);
  return a1;
}

void sub_248907150(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x24C5855F0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x24890712CLL);
}

void sub_2489071BC(_Unwind_Exception *a1)
{
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
    std::string::size_type v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *std::locale __b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    std::string::size_type v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t AudioDSPGraph::Wire::print(uint64_t result, void *a2, int a3, uint64_t a4)
{
  if (a3 >= 4)
  {
    int v4 = a4;
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)result + 32))(result, a2, a4, 1);
    AudioDSPGraph::printi(a2, v4 + 4, "block size %u\n");
  }
  return result;
}

void sub_24890742C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const char *AudioDSPGraph::Wire::ClassName(AudioDSPGraph::Wire *this)
{
  return "Wire";
}

void AudioDSPGraph::Wire::~Wire(AudioDSPGraph::Wire *this)
{
  *(void *)this = &unk_26FC9CA28;
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table((uint64_t)this + 16);

  JUMPOUT(0x24C585790);
}

{
  *(void *)this = &unk_26FC9CA28;
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table((uint64_t)this + 16);
}

uint64_t std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  int v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void AudioDSPGraph::Wire::add(uint64_t a1, unint64_t a2)
{
  unint64_t v5 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  unint64_t v6 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v5 >> 47) ^ v5);
  unint64_t v7 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
  unint64_t v8 = *(void *)(a1 + 24);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v2 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
      if (v7 >= v8) {
        unint64_t v2 = v7 % v8;
      }
    }
    else
    {
      unint64_t v2 = v7 & (v8 - 1);
    }
    v10 = *(void **)(*(void *)(a1 + 16) + 8 * v2);
    if (v10)
    {
      for (i = (void *)*v10; i; i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == a2) {
            goto LABEL_74;
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
          if (v12 != v2) {
            break;
          }
        }
      }
    }
  }
  uint64_t v13 = operator new(0x18uLL);
  void *v13 = 0;
  v13[1] = v7;
  v13[2] = a2;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 40) + 1);
  float v15 = *(float *)(a1 + 48);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
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
      unint64_t v8 = *(void *)(a1 + 24);
    }
    if (*(void *)&prime > v8) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v8)
    {
      unint64_t v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 40) / *(float *)(a1 + 48));
      if (v8 < 3 || (uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
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
      if (*(void *)&prime >= v8)
      {
        unint64_t v8 = *(void *)(a1 + 24);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v20 = operator new(8 * *(void *)&prime);
          uint64_t v21 = *(void **)(a1 + 16);
          *(void *)(a1 + 16) = v20;
          if (v21) {
            operator delete(v21);
          }
          uint64_t v22 = 0;
          *(int8x8_t *)(a1 + 24) = prime;
          do
            *(void *)(*(void *)(a1 + 16) + 8 * v22++) = 0;
          while (*(void *)&prime != v22);
          uint64_t v23 = *(void **)(a1 + 32);
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
            *(void *)(*(void *)(a1 + 16) + 8 * v24) = a1 + 32;
            unint64_t v29 = (void *)*v23;
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
                  uint64_t v31 = *(void *)(a1 + 16);
                  if (!*(void *)(v31 + 8 * v30))
                  {
                    *(void *)(v31 + 8 * v30) = v23;
                    goto LABEL_55;
                  }
                  *uint64_t v23 = *v29;
                  *unint64_t v29 = **(void **)(*(void *)(a1 + 16) + 8 * v30);
                  **(void **)(*(void *)(a1 + 16) + 8 * v30) = v29;
                  unint64_t v29 = v23;
                }
                unint64_t v30 = v24;
LABEL_55:
                uint64_t v23 = v29;
                unint64_t v29 = (void *)*v29;
                unint64_t v24 = v30;
              }
              while (v29);
            }
          }
          unint64_t v8 = (unint64_t)prime;
          goto LABEL_59;
        }
        v35 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = 0;
        if (v35) {
          operator delete(v35);
        }
        unint64_t v8 = 0;
        *(void *)(a1 + 24) = 0;
      }
    }
LABEL_59:
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
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
  uint64_t v32 = *(void *)(a1 + 16);
  uint64_t v33 = *(void **)(v32 + 8 * v2);
  if (v33)
  {
    void *v13 = *v33;
LABEL_72:
    *uint64_t v33 = v13;
    goto LABEL_73;
  }
  void *v13 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v13;
  *(void *)(v32 + 8 * v2) = a1 + 32;
  if (*v13)
  {
    unint64_t v34 = *(void *)(*v13 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v34 >= v8) {
        v34 %= v8;
      }
    }
    else
    {
      v34 &= v8 - 1;
    }
    uint64_t v33 = (void *)(*(void *)(a1 + 16) + 8 * v34);
    goto LABEL_72;
  }
LABEL_73:
  ++*(void *)(a1 + 40);
LABEL_74:
  *(void *)(a2 + 16) = a1;
}

void sub_248907950(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t AudioDSPGraph::Box::isFrequencySafe(AudioDSPGraph::Box *this)
{
  return 1;
}

uint64_t AudioDSPGraph::Box::isLatencyDelay(AudioDSPGraph::Box *this)
{
  return 0;
}

void AudioDSPGraph::Box::getComponentName(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::hasPresetData(AudioDSPGraph::Boxes::CalculationBox *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::setProperty(uint64_t this, unsigned int a2, unsigned int a3, unsigned int a4, int a5, double *a6)
{
  if (a2 > 9)
  {
    return AudioDSPGraph::Box::setProperty((AudioDSPGraph::Box *)this, a2, a3, a4, a5, a6);
  }
  else
  {
    if (a3 != 1 || *(_DWORD *)(this + 776) != 1)
    {
      std::string::basic_string[abi:ne180100]<0>(&v25, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/CalculationBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v24, "setProperty");
      std::to_string(&v20, a3);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v21, "CalculationBox can't set property in scope ", &v20);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v22, &v21, " with property ID ");
      std::to_string(&v19, a2);
      if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v11 = &v19;
      }
      else {
        uint64_t v11 = (std::string *)v19.__r_.__value_.__r.__words[0];
      }
      if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v19.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v19.__r_.__value_.__l.__size_;
      }
      uint64_t v13 = std::string::append(&v22, (const std::string::value_type *)v11, size);
      std::string v23 = *v13;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      AudioDSPGraph::ThrowException(-10866, &v25, 280, &v24, (long long *)&v23);
    }
    if (*(void *)(this + 824) <= (unint64_t)a4)
    {
      std::string::basic_string[abi:ne180100]<0>(&v25, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/CalculationBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v24, "setProperty");
      std::to_string(&v20, a4);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v21, "CalculationBox can't set input scope element ", &v20);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v22, &v21, " with property ID ");
      std::to_string(&v19, a2);
      if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        float v14 = &v19;
      }
      else {
        float v14 = (std::string *)v19.__r_.__value_.__r.__words[0];
      }
      if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v15 = HIBYTE(v19.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v15 = v19.__r_.__value_.__l.__size_;
      }
      BOOL v16 = std::string::append(&v22, (const std::string::value_type *)v14, v15);
      std::string v23 = *v16;
      v16->__r_.__value_.__l.__size_ = 0;
      v16->__r_.__value_.__r.__words[2] = 0;
      v16->__r_.__value_.__r.__words[0] = 0;
      AudioDSPGraph::ThrowException(-10877, &v25, 275, &v24, (long long *)&v23);
    }
    uint64_t v7 = this + 16 * a4 + 792;
    switch(a2)
    {
      case 0u:
        if (a5 != 1) {
          goto LABEL_30;
        }
        int v8 = 0;
        *(void *)&double v9 = *(char *)a6;
        goto LABEL_25;
      case 1u:
        if (a5 != 2) {
          goto LABEL_30;
        }
        int v8 = 0;
        *(void *)&double v9 = *(__int16 *)a6;
        goto LABEL_25;
      case 2u:
        if (a5 != 4) {
          goto LABEL_30;
        }
        int v8 = 0;
        *(void *)&double v9 = *(int *)a6;
        goto LABEL_25;
      case 3u:
      case 7u:
        if (a5 != 8) {
          goto LABEL_30;
        }
        int v8 = 0;
        double v9 = *a6;
        goto LABEL_25;
      case 4u:
        if (a5 != 1) {
          goto LABEL_30;
        }
        int v8 = 0;
        *(void *)&double v9 = *(unsigned __int8 *)a6;
        goto LABEL_25;
      case 5u:
        if (a5 != 2) {
          goto LABEL_30;
        }
        int v8 = 0;
        *(void *)&double v9 = *(unsigned __int16 *)a6;
        goto LABEL_25;
      case 6u:
        if (a5 != 4) {
          goto LABEL_30;
        }
        int v8 = 0;
        *(void *)&double v9 = *(unsigned int *)a6;
LABEL_25:
        *(double *)uint64_t v7 = v9;
        goto LABEL_26;
      case 8u:
        if (a5 != 4) {
          goto LABEL_30;
        }
        double v10 = *(float *)a6;
        goto LABEL_29;
      case 9u:
        if (a5 == 8)
        {
          double v10 = *a6;
LABEL_29:
          *(double *)uint64_t v7 = v10;
          int v8 = 1;
LABEL_26:
          this = 0;
          *(_DWORD *)(v7 + 8) = v8;
        }
        else
        {
LABEL_30:
          this = 561211770;
        }
        break;
      default:
        return this;
    }
  }
  return this;
}

void sub_248907C88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (*(char *)(v34 - 73) < 0) {
    operator delete(*(void **)(v34 - 96));
  }
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a34 < 0) {
    operator delete(a29);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  if (*(char *)(v34 - 41) < 0) {
    operator delete(*(void **)(v34 - 64));
  }
  if (*(char *)(v34 - 17) < 0) {
    operator delete(*(void **)(v34 - 40));
  }
  _Unwind_Resume(exception_object);
}

__n128 std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(std::string *a1, char *__s, std::string *a3)
{
  size_t v6 = strlen(__s);
  uint64_t v7 = (__n128 *)std::string::insert(a3, 0, __s, v6);
  __n128 result = *v7;
  *a1 = *(std::string *)v7->n128_u8;
  v7->n128_u64[0] = 0;
  v7->n128_u64[1] = 0;
  v7[1].n128_u64[0] = 0;
  return result;
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::getProperty(AudioDSPGraph::Boxes::CalculationBox *this, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int *a5, CFStringRef *a6)
{
  unsigned int v8 = a4;
  unsigned int v9 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a2 > 9)
  {
    return AudioDSPGraph::Box::getProperty(this, a2, a3, a4, a5, a6);
  }
  else
  {
    if (a3 != 2)
    {
      if (a3 == 1 && *((_DWORD *)this + 194) == 1)
      {
        if (*((void *)this + 103) <= (unint64_t)a4)
        {
          std::string::basic_string[abi:ne180100]<0>(&v30, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/CalculationBox.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v29, "getProperty");
          std::to_string(&v25, v8);
          std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v26, "CalculationBox can't get input scope element ", &v25);
          std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v27, &v26, " with property ID ");
          std::to_string(&v24, a2);
          if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            BOOL v16 = &v24;
          }
          else {
            BOOL v16 = (std::string *)v24.__r_.__value_.__r.__words[0];
          }
          if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type size = HIBYTE(v24.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type size = v24.__r_.__value_.__l.__size_;
          }
          unint64_t v18 = std::string::append(&v27, (const std::string::value_type *)v16, size);
          std::string v28 = *v18;
          v18->__r_.__value_.__l.__size_ = 0;
          v18->__r_.__value_.__r.__words[2] = 0;
          v18->__r_.__value_.__r.__words[0] = 0;
          AudioDSPGraph::ThrowException(-10877, &v30, 234, &v29, (long long *)&v28);
        }
        uint64_t v11 = (char *)this + 16 * a4 + 792;
        return AudioDSPGraph::Boxes::CalculationBox::getValueAsProperty((uint64_t)v11, a2, (int *)a5, a6);
      }
LABEL_15:
      std::string::basic_string[abi:ne180100]<0>(&v30, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/CalculationBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v29, "getProperty");
      std::to_string(&v25, v9);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v26, "CalculationBox can't get property in scope ", &v25);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v27, &v26, " with property ID ");
      std::to_string(&v24, a2);
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v13 = &v24;
      }
      else {
        uint64_t v13 = (std::string *)v24.__r_.__value_.__r.__words[0];
      }
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v14 = HIBYTE(v24.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v14 = v24.__r_.__value_.__l.__size_;
      }
      std::string::size_type v15 = std::string::append(&v27, (const std::string::value_type *)v13, v14);
      std::string v28 = *v15;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      AudioDSPGraph::ThrowException(-10866, &v30, 247, &v29, (long long *)&v28);
    }
    if (*((_DWORD *)this + 195) != 1) {
      goto LABEL_15;
    }
    AudioDSPGraph::Boxes::CalculationBox::calculate((uint64_t)&v30, (uint64_t)this, a4);
    if (!v31)
    {
      int v19 = v30;
      std::string::basic_string[abi:ne180100]<0>(&v29, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/CalculationBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v28, "getProperty");
      std::to_string(&v24, v8);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v25, "CalculationBox can't get output scope element ", &v24);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v26, &v25, " with property ID ");
      std::to_string(&v23, a2);
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string v20 = &v23;
      }
      else {
        std::string v20 = (std::string *)v23.__r_.__value_.__r.__words[0];
      }
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v21 = HIBYTE(v23.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v21 = v23.__r_.__value_.__l.__size_;
      }
      std::string v22 = std::string::append(&v26, (const std::string::value_type *)v20, v21);
      std::string v27 = *v22;
      v22->__r_.__value_.__l.__size_ = 0;
      v22->__r_.__value_.__r.__words[2] = 0;
      v22->__r_.__value_.__r.__words[0] = 0;
      AudioDSPGraph::ThrowException(v19, &v29, 241, (long long *)&v28, (long long *)&v27);
    }
    return AudioDSPGraph::Boxes::CalculationBox::getValueAsProperty((uint64_t)&v30, a2, (int *)a5, a6);
  }
}

void sub_248908194(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45)
{
  if (a38 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a45 < 0) {
    operator delete(a40);
  }
  if (*(char *)(v45 - 81) < 0) {
    operator delete(*(void **)(v45 - 104));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::getValueAsProperty(uint64_t result, int a2, int *a3, unsigned char *a4)
{
  switch(a2)
  {
    case 0:
      if (!*a3) {
        return 561211770;
      }
      uint64_t v6 = *(unsigned int *)(result + 8);
      if (v6 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      std::string v22 = &v21;
      char v7 = ((uint64_t (*)(char **, uint64_t))off_26FC985A8[v6])(&v22, result);
      goto LABEL_8;
    case 1:
      if (*a3 < 2) {
        return 561211770;
      }
      uint64_t v16 = *(unsigned int *)(result + 8);
      if (v16 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      std::string v22 = &v21;
      __int16 v17 = ((uint64_t (*)(char **, uint64_t))off_26FC985B8[v16])(&v22, result);
      goto LABEL_29;
    case 2:
      if (*a3 < 4) {
        return 561211770;
      }
      uint64_t v11 = *(unsigned int *)(result + 8);
      if (v11 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      std::string v22 = &v21;
      int v12 = ((uint64_t (*)(char **, uint64_t))off_26FC985C8[v11])(&v22, result);
      goto LABEL_33;
    case 3:
      if (*a3 < 8) {
        return 561211770;
      }
      uint64_t v13 = *(unsigned int *)(result + 8);
      if (v13 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      std::string v22 = &v21;
      uint64_t v14 = ((uint64_t (*)(char **, uint64_t))off_26FC985D8[v13])(&v22, result);
      goto LABEL_21;
    case 4:
      if (!*a3) {
        return 561211770;
      }
      uint64_t v8 = *(unsigned int *)(result + 8);
      if (v8 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      std::string v22 = &v21;
      char v7 = ((uint64_t (*)(char **, uint64_t))off_26FC985E8[v8])(&v22, result);
LABEL_8:
      *a4 = v7;
      int v9 = 1;
      goto LABEL_37;
    case 5:
      if (*a3 < 2) {
        return 561211770;
      }
      uint64_t v18 = *(unsigned int *)(result + 8);
      if (v18 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      std::string v22 = &v21;
      __int16 v17 = ((uint64_t (*)(char **, uint64_t))off_26FC985F8[v18])(&v22, result);
LABEL_29:
      *(_WORD *)a4 = v17;
      int v9 = 2;
      goto LABEL_37;
    case 6:
      if (*a3 < 4) {
        return 561211770;
      }
      uint64_t v19 = *(unsigned int *)(result + 8);
      if (v19 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      std::string v22 = &v21;
      int v12 = ((uint64_t (*)(char **, uint64_t))off_26FC98608[v19])(&v22, result);
LABEL_33:
      *(_DWORD *)a4 = v12;
      goto LABEL_36;
    case 7:
      if (*a3 < 8) {
        return 561211770;
      }
      uint64_t v15 = *(unsigned int *)(result + 8);
      if (v15 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      std::string v22 = &v21;
      uint64_t v14 = ((uint64_t (*)(char **, uint64_t))off_26FC98618[v15])(&v22, result);
LABEL_21:
      *(void *)a4 = v14;
      goto LABEL_22;
    case 8:
      if (*a3 < 4) {
        return 561211770;
      }
      AudioDSPGraph::Boxes::CalculationBox::Value::operator float<float>(result);
      *(_DWORD *)a4 = v20;
LABEL_36:
      int v9 = 4;
      goto LABEL_37;
    case 9:
      if (*a3 < 8) {
        return 561211770;
      }
      uint64_t v10 = *(unsigned int *)(result + 8);
      if (v10 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      std::string v22 = &v21;
      *(double *)a4 = ((double (*)(char **, uint64_t))off_26FC98628[v10])(&v22, result);
LABEL_22:
      int v9 = 8;
LABEL_37:
      __n128 result = 0;
      *a3 = v9;
      return result;
    default:
      return result;
  }
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::calculate(uint64_t this, uint64_t a2, int a3)
{
  uint64_t v3 = this;
  if (a3)
  {
    int v4 = -10877;
LABEL_3:
    *(_DWORD *)this = v4;
    *(unsigned char *)(this + 16) = 0;
  }
  else
  {
    switch(*(_DWORD *)(a2 + 784))
    {
      case 0:
        uint64_t v5 = *(void *)(a2 + 824);
        if (!v5) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v5 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        uint64_t v6 = *(unsigned int *)(a2 + 800);
        if (v6 == -1 || (uint64_t v7 = *(unsigned int *)(a2 + 816), v7 == -1)) {
          std::__throw_bad_variant_access[abi:ne180100]();
        }
        uint64_t v37 = (uint64_t)&v39;
        this = ((uint64_t (*)(uint64_t *, uint64_t, uint64_t))*(&off_26FC98450[2 * v6] + v7))(&v37, a2 + 792, a2 + 808);
        goto LABEL_49;
      case 1:
        uint64_t v26 = *(void *)(a2 + 824);
        if (!v26) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v26 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        uint64_t v27 = *(unsigned int *)(a2 + 800);
        if (v27 == -1 || (uint64_t v28 = *(unsigned int *)(a2 + 816), v28 == -1)) {
          std::__throw_bad_variant_access[abi:ne180100]();
        }
        uint64_t v37 = (uint64_t)&v39;
        this = ((uint64_t (*)(uint64_t *, uint64_t, uint64_t))*(&off_26FC98470[2 * v27] + v28))(&v37, a2 + 792, a2 + 808);
        goto LABEL_49;
      case 2:
        uint64_t v20 = *(void *)(a2 + 824);
        if (!v20) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v20 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        uint64_t v16 = a2 + 792;
        __int16 v17 = (uint64_t *)(a2 + 808);
        goto LABEL_30;
      case 3:
        uint64_t v23 = *(void *)(a2 + 824);
        if (!v23) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v23 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        uint64_t v24 = *(unsigned int *)(a2 + 800);
        if (v24 == -1 || (uint64_t v25 = *(unsigned int *)(a2 + 816), v25 == -1)) {
          std::__throw_bad_variant_access[abi:ne180100]();
        }
        uint64_t v37 = (uint64_t)&v39;
        this = ((uint64_t (*)(uint64_t *, uint64_t, uint64_t))*(&off_26FC984B0[2 * v24] + v25))(&v37, a2 + 792, a2 + 808);
        goto LABEL_49;
      case 4:
        if (!*(void *)(a2 + 824)) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        uint64_t v16 = a2 + 792;
        uint64_t v37 = -1;
        int v38 = 0;
        __int16 v17 = &v37;
LABEL_30:
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator*(v16, (uint64_t)v17);
LABEL_49:
        *(void *)uint64_t v3 = this;
        *(void *)(v3 + 8) = v8;
        break;
      case 5:
        if (!*(void *)(a2 + 824)) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        uint64_t v29 = a2 + 792;
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator BOOL<BOOL>(a2 + 792);
        if (this)
        {
          uint64_t v30 = boost::container::vector<AudioDSPGraph::Boxes::CalculationBox::Value,boost::container::dtl::static_storage_allocator<AudioDSPGraph::Boxes::CalculationBox::Value,2ul,0ul,true>,void>::operator[](v29);
          this = AudioDSPGraph::Boxes::CalculationBox::Value::operator BOOL<BOOL>(v30);
LABEL_54:
          uint64_t v31 = this;
        }
        else
        {
          uint64_t v31 = 0;
        }
LABEL_65:
        *(void *)uint64_t v3 = v31;
        *(_DWORD *)(v3 + 8) = 0;
        break;
      case 6:
        if (!*(void *)(a2 + 824)) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        uint64_t v33 = a2 + 792;
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator BOOL<BOOL>(a2 + 792);
        if (this)
        {
          uint64_t v34 = 1;
        }
        else
        {
          uint64_t v36 = boost::container::vector<AudioDSPGraph::Boxes::CalculationBox::Value,boost::container::dtl::static_storage_allocator<AudioDSPGraph::Boxes::CalculationBox::Value,2ul,0ul,true>,void>::operator[](v33);
          this = AudioDSPGraph::Boxes::CalculationBox::Value::operator BOOL<BOOL>(v36);
          uint64_t v34 = this;
        }
        *(void *)uint64_t v3 = v34;
        *(_DWORD *)(v3 + 8) = 0;
        *(unsigned char *)(v3 + 16) = 1;
        return this;
      case 7:
        if (!*(void *)(a2 + 824)) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator BOOL<BOOL>(a2 + 792);
        goto LABEL_64;
      case 8:
        if (!*(void *)(a2 + 824)) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        std::string v22 = (_OWORD *)(a2 + 792);
        goto LABEL_68;
      case 9:
        uint64_t v19 = *(void *)(a2 + 824);
        if (!v19) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v19 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator==(a2 + 792, a2 + 808);
        goto LABEL_54;
      case 0xA:
        uint64_t v35 = *(void *)(a2 + 824);
        if (!v35) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v35 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator==(a2 + 792, a2 + 808);
        goto LABEL_64;
      case 0xB:
        uint64_t v15 = *(void *)(a2 + 824);
        if (!v15) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v15 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator<(a2 + 792, a2 + 808);
        goto LABEL_64;
      case 0xC:
        uint64_t v18 = *(void *)(a2 + 824);
        if (!v18) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v18 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator>(a2 + 792, a2 + 808);
        goto LABEL_54;
      case 0xD:
        uint64_t v32 = *(void *)(a2 + 824);
        if (!v32) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v32 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator>(a2 + 792, a2 + 808);
LABEL_64:
        uint64_t v31 = this ^ 1;
        goto LABEL_65;
      case 0xE:
        uint64_t v14 = *(void *)(a2 + 824);
        if (!v14) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v14 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator<(a2 + 792, a2 + 808);
        goto LABEL_54;
      case 0xF:
        uint64_t v21 = *(void *)(a2 + 824);
        if (!v21) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v21 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        uint64_t v10 = (_OWORD *)(a2 + 792);
        uint64_t v11 = (_OWORD *)(a2 + 808);
        uint64_t v12 = a2 + 808;
        uint64_t v13 = a2 + 792;
        goto LABEL_34;
      case 0x10:
        uint64_t v9 = *(void *)(a2 + 824);
        if (!v9) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        if (v9 == 1) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        uint64_t v10 = (_OWORD *)(a2 + 792);
        uint64_t v11 = (_OWORD *)(a2 + 808);
        uint64_t v12 = a2 + 792;
        uint64_t v13 = a2 + 808;
LABEL_34:
        this = AudioDSPGraph::Boxes::CalculationBox::Value::operator<(v12, v13);
        if (this) {
          std::string v22 = v11;
        }
        else {
          std::string v22 = v10;
        }
LABEL_68:
        *(_OWORD *)uint64_t v3 = *v22;
        break;
      default:
        int v4 = -10863;
        goto LABEL_3;
    }
    *(unsigned char *)(v3 + 16) = 1;
  }
  return this;
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::Value::operator*(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  uint64_t v3 = *(unsigned int *)(a2 + 8);
  if (v2 == -1 || v3 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v7 = &v6;
  return ((uint64_t (*)(char **, uint64_t, uint64_t))*(&off_26FC98490[2 * v2] + v3))(&v7, a1, a2);
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::Value::operator BOOL<BOOL>(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 8);
  if (v1 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  int v4 = &v3;
  return ((uint64_t (*)(char **, uint64_t))off_26FC98598[v1])(&v4, a1);
}

uint64_t boost::container::vector<AudioDSPGraph::Boxes::CalculationBox::Value,boost::container::dtl::static_storage_allocator<AudioDSPGraph::Boxes::CalculationBox::Value,2ul,0ul,true>,void>::operator[](uint64_t a1)
{
  if (*(void *)(a1 + 32) <= 1uLL) {
    __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
  }
  return a1 + 16;
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::Value::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  uint64_t v3 = *(unsigned int *)(a2 + 8);
  if (v2 == -1 || v3 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v7 = &v6;
  return ((uint64_t (*)(char **, uint64_t, uint64_t))*(&off_26FC984F0[2 * v2] + v3))(&v7, a1, a2);
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::Value::operator<(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  uint64_t v3 = *(unsigned int *)(a2 + 8);
  if (v2 == -1 || v3 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v7 = &v6;
  return ((uint64_t (*)(char **, uint64_t, uint64_t))*(&off_26FC984D0[2 * v2] + v3))(&v7, a1, a2);
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::Value::operator>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  uint64_t v3 = *(unsigned int *)(a2 + 8);
  if (v2 == -1 || v3 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v7 = &v6;
  return ((uint64_t (*)(char **, uint64_t, uint64_t))*(&off_26FC98510[2 * v2] + v3))(&v7, a1, a2);
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator>(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, double *a3)
{
  return *a2 > *a3;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator>(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, uint64_t *a3)
{
  return *a2 > (double)*a3;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator>(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, uint64_t *a2, double *a3)
{
  return *a3 < (double)*a2;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator>(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, void *a2, void *a3)
{
  return *a2 > *a3;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator<(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, double *a3)
{
  return *a2 < *a3;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator<(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, uint64_t *a3)
{
  return *a2 < (double)*a3;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator<(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, uint64_t *a2, double *a3)
{
  return *a3 > (double)*a2;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator<(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, void *a2, void *a3)
{
  return *a2 < *a3;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator==(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, double *a3)
{
  return *a2 == *a3;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator==(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, uint64_t *a3)
{
  return *a2 == (double)*a3;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator==(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, uint64_t *a2, double *a3)
{
  return *a3 == (double)*a2;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator==(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, void *a2, void *a3)
{
  return *a2 == *a3;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator BOOL<BOOL>(void)::{lambda(BOOL)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, double *a2)
{
  return *a2 != 0.0;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator BOOL<BOOL>(void)::{lambda(BOOL)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, void *a2)
{
  return *a2 != 0;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator/(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, double *a3)
{
  double v3 = *a2;
  if (*a3 == 0.0)
  {
    if (v3 <= 0.0)
    {
      if (v3 >= 0.0) {
        *(double *)&uint64_t result = NAN;
      }
      else {
        *(double *)&uint64_t result = -INFINITY;
      }
    }
    else
    {
      *(double *)&uint64_t result = INFINITY;
    }
  }
  else
  {
    *(double *)&uint64_t result = v3 / *a3;
  }
  return result;
}

double std::__variant_detail::__visitation::__base::__dispatcher<1ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator/(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, uint64_t *a3)
{
  return *a2 / (double)*a3;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator/(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, uint64_t *a2, double *a3)
{
  double v3 = *a3;
  uint64_t v4 = 0x7FF0000000000000;
  unint64_t v5 = 0xFFF0000000000000;
  if (!*a2) {
    unint64_t v5 = 0x7FF8000000000000;
  }
  if (*a2 <= 0) {
    uint64_t v4 = v5;
  }
  if (v3 == 0.0) {
    return v4;
  }
  else {
    *(double *)&uint64_t result = (double)*a2 / v3;
  }
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator/(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, void *a2, uint64_t *a3)
{
  return *a2 / *a3;
}

double std::__variant_detail::__visitation::__base::__dispatcher<1ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator*(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, double *a3)
{
  return *a2 * *a3;
}

double std::__variant_detail::__visitation::__base::__dispatcher<1ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator*(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, uint64_t *a3)
{
  return *a2 * (double)*a3;
}

double std::__variant_detail::__visitation::__base::__dispatcher<0ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator*(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, uint64_t *a2, double *a3)
{
  return *a3 * (double)*a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator*(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, void *a2, void *a3)
{
  return *a3 * *a2;
}

double std::__variant_detail::__visitation::__base::__dispatcher<1ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator-(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, double *a3)
{
  return *a2 - *a3;
}

double std::__variant_detail::__visitation::__base::__dispatcher<1ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator-(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, uint64_t *a3)
{
  return *a2 - (double)*a3;
}

double std::__variant_detail::__visitation::__base::__dispatcher<0ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator-(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, uint64_t *a2, double *a3)
{
  return (double)*a2 - *a3;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator-(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, void *a2, void *a3)
{
  return *a2 - *a3;
}

double std::__variant_detail::__visitation::__base::__dispatcher<1ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator+(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, double *a3)
{
  return *a2 + *a3;
}

double std::__variant_detail::__visitation::__base::__dispatcher<1ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator+(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, double *a2, uint64_t *a3)
{
  return *a2 + (double)*a3;
}

double std::__variant_detail::__visitation::__base::__dispatcher<0ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator+(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, uint64_t *a2, double *a3)
{
  return *a3 + (double)*a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator+(AudioDSPGraph::Boxes::CalculationBox::Value const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const>(uint64_t a1, void *a2, void *a3)
{
  return *a3 + *a2;
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::Value::operator float<float>(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 8);
  if (v1 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v4 = &v3;
  return ((uint64_t (*)(char **, uint64_t))off_26FC98588[v1])(&v4, a1);
}

double std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator double<double>(void)::{lambda(double)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, uint64_t a2)
{
  return *(double *)a2;
}

double std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator double<double>(void)::{lambda(double)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, uint64_t *a2)
{
  return (double)*a2;
}

float std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator float<float>(void)::{lambda(float)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, uint64_t a2)
{
  return *(double *)a2;
}

float std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator float<float>(void)::{lambda(float)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, uint64_t *a2)
{
  return (float)*a2;
}

unint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator unsigned long long<unsigned long long>(void)::{lambda(unsigned long long)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, double *a2)
{
  return (unint64_t)*a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator unsigned long long<unsigned long long>(void)::{lambda(unsigned long long)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, uint64_t a2)
{
  return *(void *)a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator unsigned int<unsigned int>(void)::{lambda(unsigned int)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, double *a2)
{
  return *a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator unsigned int<unsigned int>(void)::{lambda(unsigned int)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, unsigned int *a2)
{
  return *a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator unsigned short<unsigned short>(void)::{lambda(unsigned short)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, double *a2)
{
  return (int)*a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator unsigned short<unsigned short>(void)::{lambda(unsigned short)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, unsigned __int16 *a2)
{
  return *a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator unsigned char<unsigned char>(void)::{lambda(unsigned char)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, double *a2)
{
  return (int)*a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator unsigned char<unsigned char>(void)::{lambda(unsigned char)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, unsigned __int8 *a2)
{
  return *a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator long long<long long>(void)::{lambda(long long)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, double *a2)
{
  return (uint64_t)*a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator long long<long long>(void)::{lambda(long long)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, uint64_t a2)
{
  return *(void *)a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator int<int>(void)::{lambda(int)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, double *a2)
{
  return (int)*a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator int<int>(void)::{lambda(int)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, unsigned int *a2)
{
  return *a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator short<short>(void)::{lambda(short)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, double *a2)
{
  return (int)*a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator short<short>(void)::{lambda(short)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, __int16 *a2)
{
  return *a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator signed char<signed char>(void)::{lambda(signed char)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, double *a2)
{
  return (int)*a2;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AudioDSPGraph::Boxes::CalculationBox::Value::operator signed char<signed char>(void)::{lambda(signed char)#1}> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,long long,double> const&>(uint64_t a1, char *a2)
{
  return *a2;
}

unint64_t AudioDSPGraph::Boxes::CalculationBox::getPropertyInfo(AudioDSPGraph::Boxes::CalculationBox *this, unsigned int a2, int a3)
{
  if (a2 >= 0xA)
  {
    uint64_t PropertyInfo = AudioDSPGraph::Box::getPropertyInfo(this, a2, a3);
    unint64_t v5 = PropertyInfo & 0xFFFFFFFF00000000;
  }
  else
  {
    LODWORD(PropertyInfo) = -10866;
    if (a3 == 2)
    {
      unint64_t v5 = 0;
      if (*((_DWORD *)this + 195) == 1) {
        LODWORD(PropertyInfo) = dword_24893C138[a2];
      }
      else {
        LODWORD(PropertyInfo) = -10866;
      }
    }
    else if (a3 == 1)
    {
      if (*((_DWORD *)this + 194) == 1) {
        LODWORD(PropertyInfo) = dword_24893C138[a2];
      }
      else {
        LODWORD(PropertyInfo) = -10866;
      }
      if (*((_DWORD *)this + 194) == 1) {
        unint64_t v5 = 0x100000000;
      }
      else {
        unint64_t v5 = 0;
      }
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  return v5 | PropertyInfo;
}

uint64_t AudioDSPGraph::Box::asOperativeFreqSRCBox(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Box::asOperativeSRCBox(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Box::asOperativeFCBox(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Box::asFreqSRCBox(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Box::asSRCBox(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Box::asFCBox(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Box::asGraphOutput(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Box::asGraphInput(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Box::asBoxProxy(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Box::asAUBox(AudioDSPGraph::Box *this)
{
  return 0;
}

double AudioDSPGraph::Boxes::CalculationBox::desc@<D0>(AudioDSPGraph::Boxes::CalculationBox *this@<X0>, uint64_t a2@<X8>)
{
  int v2 = *((_DWORD *)this + 193);
  *(_DWORD *)a2 = 1668183148;
  *(_DWORD *)(a2 + 4) = v2;
  *(void *)&double result = 1633841016;
  *(void *)(a2 + 8) = 1633841016;
  *(_DWORD *)(a2 + 16) = 0;
  return result;
}

uint64_t AudioDSPGraph::Box::usesFixedBlockSize(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::getParameterInfo@<X0>(uint64_t this@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  if (!a3)
  {
    if (a2 == 2)
    {
      if (!*(_DWORD *)(this + 780))
      {
        *(_DWORD *)(a4 + 48) = 0;
        strcpy((char *)a4, "output parameter");
        *(unsigned char *)(a4 + 17) = unk_24893C099;
        *(_WORD *)(a4 + 18) = unk_24893C09A;
        *(_DWORD *)(a4 + 20) = unk_24893C09C;
        *(void *)(a4 + 24) = unk_24893C0A0;
        *(_OWORD *)(a4 + 32) = xmmword_24893C0A8;
        *(void *)(a4 + 56) = 0;
        *(_DWORD *)(a4 + 64) = 0;
        *(void *)(a4 + 72) = 0;
        *(_DWORD *)(a4 + 80) = 26;
        *(void *)(a4 + 84) = 0x7F7FFFFFFF7FFFFFLL;
        unint64_t v6 = 0x4000000000000000;
        goto LABEL_12;
      }
    }
    else if (a2 == 1 && !*(_DWORD *)(this + 776))
    {
      *(_DWORD *)(a4 + 48) = 0;
      strcpy((char *)a4, "input parameter");
      *(_OWORD *)(a4 + 16) = unk_24893C060;
      *(_OWORD *)(a4 + 32) = xmmword_24893C070;
      *(void *)(a4 + 56) = 0;
      *(_DWORD *)(a4 + 64) = 0;
      *(void *)(a4 + 72) = 0;
      *(_DWORD *)(a4 + 80) = 26;
      *(void *)(a4 + 84) = 0x7F7FFFFFFF7FFFFFLL;
      unint64_t v6 = 0xC000000000000000;
LABEL_12:
      *(void *)(a4 + 92) = v6;
      char v4 = 1;
      goto LABEL_10;
    }
    char v4 = 0;
    int v5 = -10866;
    goto LABEL_9;
  }
  char v4 = 0;
  int v5 = 1869640255;
LABEL_9:
  *(_DWORD *)a4 = v5;
LABEL_10:
  *(unsigned char *)(a4 + 104) = v4;
  return this;
}

_DWORD *AudioDSPGraph::Boxes::CalculationBox::getParameterList@<X0>(_DWORD *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  if (a2 == 2)
  {
    if (!this[195])
    {
LABEL_4:
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      char v4 = operator new(4uLL);
      *a3 = v4;
      *char v4 = 0;
      this = v4 + 1;
      a3[1] = this;
      a3[2] = this;
      return this;
    }
  }
  else if (a2 == 1 && !this[194])
  {
    goto LABEL_4;
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return this;
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::getParameter(AudioDSPGraph::Boxes::CalculationBox *this, int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a2) {
    AudioDSPGraph::Box::getParameter(this);
  }
  if (a3 != 2)
  {
    if (a3 == 1 && !*((_DWORD *)this + 194))
    {
      if (*((void *)this + 103) <= (unint64_t)a4)
      {
        std::string::basic_string[abi:ne180100]<0>(&v25, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/CalculationBox.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v24, "getParameter");
        std::to_string(&v20, a4);
        std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v21, "CalculationBox can't get input scope element ", &v20);
        std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v22, &v21, " with parameter ID ");
        std::to_string(&v19, 0);
        if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v11 = &v19;
        }
        else {
          uint64_t v11 = (std::string *)v19.__r_.__value_.__r.__words[0];
        }
        if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v19.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v19.__r_.__value_.__l.__size_;
        }
        uint64_t v13 = std::string::append(&v22, (const std::string::value_type *)v11, size);
        std::string v23 = *v13;
        v13->__r_.__value_.__l.__size_ = 0;
        v13->__r_.__value_.__r.__words[2] = 0;
        v13->__r_.__value_.__r.__words[0] = 0;
        AudioDSPGraph::ThrowException(-10877, &v25, 120, &v24, (long long *)&v23);
      }
      unint64_t v6 = (char *)this + 16 * a4 + 792;
      return AudioDSPGraph::Boxes::CalculationBox::Value::operator float<float>((uint64_t)v6);
    }
LABEL_12:
    std::string::basic_string[abi:ne180100]<0>(&v25, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/CalculationBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v24, "getParameter");
    std::to_string(&v20, a3);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v21, "CalculationBox can't get parameter in scope ", &v20);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v22, &v21, " with parameter ID ");
    std::to_string(&v19, 0);
    if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v8 = &v19;
    }
    else {
      uint64_t v8 = (std::string *)v19.__r_.__value_.__r.__words[0];
    }
    if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v9 = HIBYTE(v19.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v9 = v19.__r_.__value_.__l.__size_;
    }
    uint64_t v10 = std::string::append(&v22, (const std::string::value_type *)v8, v9);
    std::string v23 = *v10;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    AudioDSPGraph::ThrowException(-10866, &v25, 133, &v24, (long long *)&v23);
  }
  if (*((_DWORD *)this + 195)) {
    goto LABEL_12;
  }
  AudioDSPGraph::Boxes::CalculationBox::calculate((uint64_t)&v25, (uint64_t)this, a4);
  if (!v26)
  {
    int v14 = v25;
    std::string::basic_string[abi:ne180100]<0>(&v24, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/CalculationBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v23, "getParameter");
    std::to_string(&v19, a4);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v20, "CalculationBox can't get output scope element ", &v19);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v21, &v20, " with parameter ID ");
    std::to_string(&v18, 0);
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v15 = &v18;
    }
    else {
      uint64_t v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
    }
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v16 = HIBYTE(v18.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v16 = v18.__r_.__value_.__l.__size_;
    }
    __int16 v17 = std::string::append(&v21, (const std::string::value_type *)v15, v16);
    std::string v22 = *v17;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    AudioDSPGraph::ThrowException(v14, &v24, 127, (long long *)&v23, (long long *)&v22);
  }
  return AudioDSPGraph::Boxes::CalculationBox::Value::operator float<float>((uint64_t)&v25);
}

void sub_248909B64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a38 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (*(char *)(v38 - 73) < 0) {
    operator delete(*(void **)(v38 - 96));
  }
  if (*(char *)(v38 - 49) < 0) {
    operator delete(*(void **)(v38 - 72));
  }
  _Unwind_Resume(exception_object);
}

double AudioDSPGraph::Boxes::CalculationBox::setParameter(AudioDSPGraph::Boxes::CalculationBox *this, int a2, unsigned int a3, unsigned int a4, float a5)
{
  if (a2) {
    AudioDSPGraph::Box::setParameter(this, a5);
  }
  if (a3 != 1 || *((_DWORD *)this + 194))
  {
    std::string::basic_string[abi:ne180100]<0>(&v21, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/CalculationBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v20, "setParameter");
    std::to_string(&v16, a3);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v17, "CalculationBox can't get parameter in scope ", &v16);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v18, &v17, " with parameter ID ");
    std::to_string(&v15, 0);
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v9 = &v15;
    }
    else {
      std::string::size_type v9 = (std::string *)v15.__r_.__value_.__r.__words[0];
    }
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v15.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v15.__r_.__value_.__l.__size_;
    }
    uint64_t v11 = std::string::append(&v18, (const std::string::value_type *)v9, size);
    std::string v19 = *v11;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    AudioDSPGraph::ThrowException(-10866, &v21, 157, &v20, (long long *)&v19);
  }
  if (*((void *)this + 103) <= (unint64_t)a4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v21, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/CalculationBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v20, "setParameter");
    std::to_string(&v16, a4);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v17, "CalculationBox can't set input scope element ", &v16);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v18, &v17, " with parameter ID ");
    std::to_string(&v15, 0);
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v12 = &v15;
    }
    else {
      uint64_t v12 = (std::string *)v15.__r_.__value_.__r.__words[0];
    }
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v13 = HIBYTE(v15.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v13 = v15.__r_.__value_.__l.__size_;
    }
    int v14 = std::string::append(&v18, (const std::string::value_type *)v12, v13);
    std::string v19 = *v14;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    AudioDSPGraph::ThrowException(-10877, &v21, 152, &v20, (long long *)&v19);
  }
  unint64_t v6 = (double *)((char *)this + 16 * a4);
  double result = a5;
  v6[99] = result;
  *((_DWORD *)v6 + 200) = 1;
  return result;
}

void sub_248909EB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a38 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (*(char *)(v38 - 41) < 0) {
    operator delete(*(void **)(v38 - 64));
  }
  if (*(char *)(v38 - 17) < 0) {
    operator delete(*(void **)(v38 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Box::selfLatencyInTicks(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Boxes::CalculationBox::canProcessInPlace(AudioDSPGraph::Boxes::CalculationBox *this)
{
  return 1;
}

uint64_t AudioDSPGraph::Box::isBypassed(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Box::canBypass(AudioDSPGraph::Box *this)
{
  return 0;
}

const char *AudioDSPGraph::Box::ClassName(AudioDSPGraph::Box *this)
{
  return "Box";
}

void AudioDSPGraph::Boxes::CalculationBox::~CalculationBox(AudioDSPGraph::Boxes::CalculationBox *this)
{
  *(void *)this = &unk_26FC981B8;
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  *(void *)this = &unk_26FC981B8;
  AudioDSPGraph::Box::~Box(this);
}

void boost::container::dtl::static_storage_allocator<AudioDSPGraph::Boxes::CalculationBox::Value,2ul,0ul,true>::on_capacity_overflow(boost::container *a1)
{
}

void boost::container::throw_bad_alloc(boost::container *this)
{
  exception = __cxa_allocate_exception(0x10uLL);
  void *exception = &unk_26FC98570;
  exception[1] = "boost::container::bad_alloc thrown";
}

const char *boost::container::exception::what(boost::container::exception *this)
{
  if (*((void *)this + 1)) {
    return (const char *)*((void *)this + 1);
  }
  else {
    return "unknown boost::container exception";
  }
}

void boost::container::bad_alloc::~bad_alloc(std::exception *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x24C585790);
}

void AudioDSPGraph::Boxes::NonFiniteProtectionBox::uninitialize(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 200))
  {
    {
      AudioDSPGraph::getLog(void)::gLog = (uint64_t)os_log_create("com.apple.coreaudio", "AudioDSPGraph");
    }
    int v2 = AudioDSPGraph::getLog(void)::gLog;
    if (os_log_type_enabled((os_log_t)AudioDSPGraph::getLog(void)::gLog, OS_LOG_TYPE_ERROR))
    {
      std::string v17 = (char *)this + 32;
      if (*((char *)this + 55) < 0) {
        std::string v17 = *(char **)v17;
      }
      int v18 = *((_DWORD *)this + 200);
      *(_DWORD *)buf = 136315394;
      long long v24 = v17;
      __int16 v25 = 1024;
      *(_DWORD *)char v26 = v18;
      _os_log_error_impl(&dword_248903000, v2, OS_LOG_TYPE_ERROR, "%s: Detected total %u audio buffers with non-finite (<NaN> or <inf>) sample during audio start/stop cycle", buf, 0x12u);
    }
    *((_DWORD *)this + 200) = 0;
  }
  if (*((_DWORD *)this + 201))
  {
    {
      AudioDSPGraph::getLog(void)::gLog = (uint64_t)os_log_create("com.apple.coreaudio", "AudioDSPGraph");
    }
    char v3 = AudioDSPGraph::getLog(void)::gLog;
    if (os_log_type_enabled((os_log_t)AudioDSPGraph::getLog(void)::gLog, OS_LOG_TYPE_ERROR))
    {
      std::string v19 = (char *)this + 32;
      if (*((char *)this + 55) < 0) {
        std::string v19 = *(char **)v19;
      }
      int v20 = *((_DWORD *)this + 201);
      float v21 = COERCE_FLOAT(atomic_load((unsigned int *)this + 193));
      *(_DWORD *)buf = 136315650;
      long long v24 = v19;
      __int16 v25 = 1024;
      *(_DWORD *)char v26 = v20;
      *(_WORD *)&v26[4] = 2048;
      *(double *)&v26[6] = v21;
      _os_log_error_impl(&dword_248903000, v3, OS_LOG_TYPE_ERROR, "%s: Detected total %u audio buffers with peak over limit (%.0f dB) during audio start/stop cycle", buf, 0x1Cu);
    }
    *((_DWORD *)this + 201) = 0;
  }
  char v4 = (void *)*((void *)this + 97);
  int v5 = (void *)*((void *)this + 98);
  if (v4 != v5)
  {
    unint64_t v6 = v4 + 1;
    do
    {
      int v7 = *((_DWORD *)v6 - 2);
      *(_OWORD *)__str = 0u;
      long long v32 = 0u;
      uint64_t v8 = localtime(v6);
      if (!strftime(__str, 0x20uLL, "%Y-%m-%d %H:%M:%S", v8)) {
        snprintf(__str, 0x20uLL, "%ld", *v6);
      }
      {
        AudioDSPGraph::getLog(void)::gLog = (uint64_t)os_log_create("com.apple.coreaudio", "AudioDSPGraph");
      }
      std::string::size_type v9 = AudioDSPGraph::getLog(void)::gLog;
      if (os_log_type_enabled((os_log_t)AudioDSPGraph::getLog(void)::gLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = (char *)this + 32;
        if (*((char *)this + 55) < 0) {
          uint64_t v11 = (char *)*((void *)this + 4);
        }
        uint64_t v12 = v6[1];
        std::string::size_type v13 = "peak over limit";
        if (!v7) {
          std::string::size_type v13 = "non-finite sample";
        }
        unsigned int v14 = atomic_load((unsigned int *)this + 203);
        *(_DWORD *)buf = 136316162;
        long long v24 = __str;
        __int16 v25 = 2048;
        *(void *)char v26 = v12;
        *(_WORD *)&v26[8] = 2080;
        *(void *)&v26[10] = v11;
        __int16 v27 = 2080;
        uint64_t v28 = v13;
        __int16 v29 = 1024;
        unsigned int v30 = v14;
        _os_log_error_impl(&dword_248903000, v9, OS_LOG_TYPE_ERROR, "%s.%09ld :: %s: Detected %s in %u audio buffers", buf, 0x30u);
      }
      uint64_t v10 = v6 + 2;
      v6 += 3;
    }
    while (v10 != v5);
    char v4 = (void *)*((void *)this + 97);
  }
  *((void *)this + 98) = v4;
  int v15 = *((unsigned __int8 *)this + 808);
  *((unsigned char *)this + 808) = 0;
  if (v15)
  {
    {
      AudioDSPGraph::getLog(void)::gLog = (uint64_t)os_log_create("com.apple.coreaudio", "AudioDSPGraph");
    }
    std::string v16 = AudioDSPGraph::getLog(void)::gLog;
    if (os_log_type_enabled((os_log_t)AudioDSPGraph::getLog(void)::gLog, OS_LOG_TYPE_ERROR))
    {
      std::string v22 = (char *)this + 32;
      if (*((char *)this + 55) < 0) {
        std::string v22 = *(char **)v22;
      }
      *(_DWORD *)buf = 136315138;
      long long v24 = v22;
      _os_log_error_impl(&dword_248903000, v16, OS_LOG_TYPE_ERROR, "%s: NonFiniteProtectionBox event logging capacity exceeded (some descriptions dropped)", buf, 0xCu);
    }
  }
}

uint64_t AudioDSPGraph::Boxes::NonFiniteProtectionBox::process(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this, unsigned int a2)
{
  char v3 = (unsigned int *)this;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)this + 809);
  uint64_t v5 = AudioDSPGraph::Box::in(this, 0);
  unint64_t v6 = (unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 56) + 80);
  if (v4)
  {
    uint64_t v29 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)v3, 0);
    uint64_t v30 = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 40))(v29);
    AudioDSPGraph::SimpleABL::copy(v6, *(AudioDSPGraph::SimpleABL **)(*(void *)(v30 + 56) + 80));
  }
  else
  {
    int v7 = *v6;
    uint64_t v8 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)v3, 0);
    uint64_t v9 = *(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 56) + 80);
    uint64_t v10 = *v7;
    float v11 = COERCE_FLOAT(atomic_load(v3 + 193));
    float v12 = __exp10f(v11 * 0.05);
    if (v10)
    {
      float v13 = v12;
      v41 = (int64x2_t *)v3;
      unsigned int v42 = a2;
      uint64_t v14 = 0;
      char v43 = 0;
      char v15 = 0;
      float v16 = -v12;
      size_t v17 = 4 * a2;
      vDSP_Length v18 = a2;
      do
      {
        std::string v19 = *(const float **)&v7[4 * v14 + 4];
        int v20 = *(float **)(v9 + 16 * v14 + 16);
        float __C = 0.0;
        vDSP_sve(v19, 1, &__C, v18);
        if ((LODWORD(__C) & 0x7FFFFFFFu) >= 0x7F800000)
        {
          if (v42)
          {
            size_t v21 = v17;
            std::string v22 = v19;
            do
            {
              if ((*(_DWORD *)v22 & 0x7FFFFFFFu) >= 0x7F800000) {
                *std::string v22 = 0.0;
              }
              ++v22;
              v21 -= 4;
            }
            while (v21);
          }
          char v15 = 1;
        }
        float __B = v16;
        float __C = v13;
        float v44 = 0.0;
        vDSP_maxmgv(v19, 1, &v44, v18);
        if (v44 <= __C)
        {
          if (v19 != v20) {
            memcpy(v20, v19, v17);
          }
        }
        else
        {
          char v43 = 1;
          vDSP_vclip(v19, 1, &__B, &__C, v20, 1, v18);
        }
        ++v14;
      }
      while (v14 != v10);
      char v3 = (unsigned int *)v41;
      if (v15)
      {
        ++v41[50].i32[0];
        unsigned __int8 v23 = atomic_load(&v41[50].u8[10]);
        if (v23)
        {
          unsigned __int32 v24 = v41[50].u32[0];
          unsigned int v25 = atomic_load(&v41[50].u32[3]);
          if (!(v24 % v25)) {
            AudioDSPGraph::Boxes::NonFiniteProtectionBox::addEvent(v41, 0);
          }
        }
      }
      if (v43)
      {
        ++v41[50].i32[1];
        unsigned __int8 v26 = atomic_load(&v41[50].u8[10]);
        if (v26)
        {
          unsigned __int32 v27 = v41[50].u32[1];
          unsigned int v28 = atomic_load(&v41[50].u32[3]);
          if (!(v27 % v28)) {
            AudioDSPGraph::Boxes::NonFiniteProtectionBox::addEvent(v41, 1);
          }
        }
      }
    }
  }
  uint64_t v31 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)v3, 0);
  uint64_t v32 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31) + 56);
  uint64_t v33 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)v3, 0);
  uint64_t v34 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v33 + 40))(v33) + 56);
  long long v35 = *(_OWORD *)(v32 + 56);
  long long v36 = *(_OWORD *)(v32 + 40);
  long long v37 = *(_OWORD *)(v32 + 24);
  *(_OWORD *)(v34 + 8) = *(_OWORD *)(v32 + 8);
  *(_OWORD *)(v34 + 24) = v37;
  *(_OWORD *)(v34 + 40) = v36;
  *(_OWORD *)(v34 + 56) = v35;
  uint64_t v38 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)v3, 0);
  LODWORD(v32) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v38 + 40))(v38) + 56) + 72);
  uint64_t v39 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)v3, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v39 + 40))(v39);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v32;
  return result;
}

uint64_t AudioDSPGraph::Box::in(AudioDSPGraph::Box *this, uint64_t a2)
{
  uint64_t v2 = *((void *)this + 8);
  if (a2 >= (unint64_t)((*((void *)this + 9) - v2) >> 5))
  {
    std::string::basic_string[abi:ne180100]<0>(v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v8, "in");
    unint64_t v6 = (void *)((char *)this + 32);
    if (*((char *)this + 55) < 0) {
      unint64_t v6 = (void *)*v6;
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v5, v6, (uint64_t)(*((void *)this + 9) - *((void *)this + 8)) >> 5, a2);
  }
  return v2 + 32 * a2;
}

void sub_24890A984(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (*(char *)(v25 - 17) < 0) {
    operator delete(*(void **)(v25 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Box::out(AudioDSPGraph::Box *this, uint64_t a2)
{
  uint64_t v2 = *((void *)this + 11);
  if (a2 >= (unint64_t)((*((void *)this + 12) - v2) >> 5))
  {
    std::string::basic_string[abi:ne180100]<0>(v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v8, "out");
    unint64_t v6 = (void *)((char *)this + 32);
    if (*((char *)this + 55) < 0) {
      unint64_t v6 = (void *)*v6;
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v5, v6, (uint64_t)(*((void *)this + 12) - *((void *)this + 11)) >> 5, a2);
  }
  return v2 + 32 * a2;
}

{
  uint64_t v2;
  const char *v5;
  void *v6;
  void v8[3];
  void v9[3];

  uint64_t v2 = *((void *)this + 11);
  if (a2 >= (unint64_t)((*((void *)this + 12) - v2) >> 5))
  {
    std::string::basic_string[abi:ne180100]<0>(v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v8, "out");
    unint64_t v6 = (void *)((char *)this + 32);
    if (*((char *)this + 55) < 0) {
      unint64_t v6 = (void *)*v6;
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v5, v6, (uint64_t)(*((void *)this + 12) - *((void *)this + 11)) >> 5, a2);
  }
  return v2 + 32 * a2;
}

void sub_24890AA8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (*(char *)(v25 - 17) < 0) {
    operator delete(*(void **)(v25 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::Boxes::NonFiniteProtectionBox::addEvent(int64x2_t *a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v3 = (const double *)&a1[48].i64[1];
  int64x2_t v4 = (int64x2_t)vld1q_dup_f64(v3);
  uint64x2_t v5 = (uint64x2_t)vshrq_n_s64(vsubq_s64(a1[49], v4), 3uLL);
  v5.i64[0] *= 0xAAAAAAAAAAAAAAABLL;
  v5.i64[1] *= 0xAAAAAAAAAAAAAAABLL;
  if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(v5.u64[1]), v5)).u32[0])
  {
    unsigned long long v17 = 0uLL;
    clock_gettime(_CLOCK_REALTIME, (timespec *)&v17);
    *(_OWORD *)&v18[4] = v17;
    int v7 = (char *)a1[49].i64[0];
    unint64_t v8 = a1[49].u64[1];
    if ((unint64_t)v7 >= v8)
    {
      uint64_t v10 = (char *)a1[48].i64[1];
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v7 - v10) >> 3) + 1;
      if (v11 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - (void)v10) >> 3);
      if (2 * v12 > v11) {
        unint64_t v11 = 2 * v12;
      }
      if (v12 >= 0x555555555555555) {
        unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        if (v13 > 0xAAAAAAAAAAAAAAALL) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v14 = (char *)operator new(24 * v13);
      }
      else
      {
        uint64_t v14 = 0;
      }
      char v15 = &v14[8 * ((v7 - v10) >> 3)];
      *(_DWORD *)char v15 = a2;
      *(_OWORD *)(v15 + 4) = *(_OWORD *)v18;
      *((_DWORD *)v15 + 5) = *(_DWORD *)&v18[16];
      uint64_t v9 = v15 + 24;
      if (v7 != v10)
      {
        do
        {
          long long v16 = *(_OWORD *)(v7 - 24);
          *((void *)v15 - 1) = *((void *)v7 - 1);
          *(_OWORD *)(v15 - 24) = v16;
          v15 -= 24;
          v7 -= 24;
        }
        while (v7 != v10);
        int v7 = (char *)a1[48].i64[1];
      }
      a1[48].i64[1] = (uint64_t)v15;
      a1[49].i64[0] = (uint64_t)v9;
      a1[49].i64[1] = (uint64_t)&v14[24 * v13];
      if (v7) {
        operator delete(v7);
      }
    }
    else
    {
      *(_DWORD *)int v7 = a2;
      *(_OWORD *)(v7 + 4) = *(_OWORD *)v18;
      *((_DWORD *)v7 + 5) = *(_DWORD *)&v18[16];
      uint64_t v9 = v7 + 24;
    }
    a1[49].i64[0] = (uint64_t)v9;
  }
  else
  {
    a1[50].i8[8] = 1;
  }
}

uint64_t AudioDSPGraph::Boxes::NonFiniteProtectionBox::hasPresetData(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this)
{
  return 0;
}

uint64_t AudioDSPGraph::Boxes::NonFiniteProtectionBox::setProperty(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this, int a2, int a3, unsigned int a4, int a5, unsigned int *a6)
{
  if (a2 != 64331)
  {
    if (a2 != 64330) {
      return AudioDSPGraph::Box::setProperty(this, a2, a3, a4, a5, a6);
    }
    if (a5 == 4)
    {
      if (!a3)
      {
        uint64_t result = 0;
        atomic_store(*a6 != 0, (unsigned __int8 *)this + 810);
        return result;
      }
      return 4294956430;
    }
    return 561211770;
  }
  if (a5 != 4) {
    return 561211770;
  }
  if (a3) {
    return 4294956430;
  }
  if (!*a6) {
    return 4294956445;
  }
  uint64_t result = 0;
  atomic_store(*a6, (unsigned int *)this + 203);
  return result;
}

uint64_t AudioDSPGraph::Boxes::NonFiniteProtectionBox::getProperty(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this, int a2, uint64_t a3, uint64_t a4, unsigned int *a5, CFStringRef *a6)
{
  if (a2 == 64331)
  {
    if (*a5 == 4)
    {
      if (a6)
      {
        if (!a3)
        {
          uint64_t result = 0;
          int v9 = atomic_load((unsigned int *)this + 203);
          goto LABEL_15;
        }
        return 4294956430;
      }
      return 4294967246;
    }
    return 561211770;
  }
  if (a2 != 64330) {
    return AudioDSPGraph::Box::getProperty(this, a2, a3, a4, a5, a6);
  }
  if (*a5 != 4) {
    return 561211770;
  }
  if (!a6) {
    return 4294967246;
  }
  if (a3) {
    return 4294956430;
  }
  uint64_t result = 0;
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)this + 810);
  int v9 = v8 & 1;
LABEL_15:
  *(_DWORD *)a6 = v9;
  return result;
}

unint64_t AudioDSPGraph::Boxes::NonFiniteProtectionBox::getPropertyInfo(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this, int a2, int a3)
{
  if (a2 == 64331 || a2 == 64330)
  {
    uint64_t v3 = 4;
    if (a3)
    {
      uint64_t v3 = 4294956430;
      unint64_t v4 = 0;
    }
    else
    {
      unint64_t v4 = 0x100000000;
    }
  }
  else
  {
    uint64_t PropertyInfo = AudioDSPGraph::Box::getPropertyInfo(this, a2, a3);
    unint64_t v4 = PropertyInfo & 0xFFFFFFFF00000000;
    uint64_t v3 = PropertyInfo;
  }
  return v4 | v3;
}

double AudioDSPGraph::Boxes::NonFiniteProtectionBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 6.48669114e223;
  *(_OWORD *)a1 = xmmword_24893BEF0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

__n128 AudioDSPGraph::Boxes::NonFiniteProtectionBox::getParameterInfo@<Q0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v5 = -10866;
  }
  else
  {
    if (!a2)
    {
      uint64_t v15 = 3221225472;
      long long v13 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      v14.n128_u64[1] = 0x4220000042A00000;
      v14.n128_u64[0] = 13;
      strlcpy((char *)&v9, "hard clip threshold", 0x34uLL);
      *((void *)&v13 + 1) = @"hard clip threshold";
      LODWORD(v15) = v15 | 0x8000000;
      long long v6 = v10;
      *(_OWORD *)a3 = v9;
      *(_OWORD *)(a3 + 16) = v6;
      long long v7 = v12;
      *(_OWORD *)(a3 + 32) = v11;
      *(_OWORD *)(a3 + 48) = v7;
      __n128 result = v14;
      *(_OWORD *)(a3 + 64) = v13;
      *(__n128 *)(a3 + 80) = result;
      *(void *)(a3 + 96) = v15;
      *(unsigned char *)(a3 + 104) = 1;
      return result;
    }
    int v5 = -10878;
  }
  *(_DWORD *)a3 = v5;
  *(unsigned char *)(a3 + 104) = 0;
  return result;
}

void sub_24890AF74(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void AudioDSPGraph::Boxes::NonFiniteProtectionBox::getParameterList(int a1@<W1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (!a1)
  {
    unint64_t v4 = operator new(4uLL);
    *a2 = v4;
    *v4++ = 0;
    a2[1] = v4;
    a2[2] = v4;
  }
}

float AudioDSPGraph::Boxes::NonFiniteProtectionBox::getParameter(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this, int a2, int a3, int a4)
{
  if (a3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/NonFiniteProtectionBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10866, &v8, 171, &v7, &v6);
  }
  if (a4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/NonFiniteProtectionBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10877, &v8, 174, &v7, &v6);
  }
  if (a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/NonFiniteProtectionBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10878, &v8, 179, &v7, &v6);
  }
  return COERCE_FLOAT(atomic_load((unsigned int *)this + 193));
}

void sub_24890B0E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Boxes::NonFiniteProtectionBox::setParameter(uint64_t this, int a2, int a3, int a4, float a5)
{
  if (a3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v7, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/NonFiniteProtectionBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v6, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v5, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10866, &v7, 155, &v6, &v5);
  }
  if (a4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v7, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/NonFiniteProtectionBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v6, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v5, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10877, &v7, 158, &v6, &v5);
  }
  if (a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v7, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/NonFiniteProtectionBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v6, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v5, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10878, &v7, 163, &v6, &v5);
  }
  if (a5 < 0.0) {
    a5 = 0.0;
  }
  atomic_store(LODWORD(a5), (unsigned int *)(this + 772));
  return this;
}

void sub_24890B270(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Boxes::NonFiniteProtectionBox::canProcessInPlace(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this)
{
  return 1;
}

uint64_t AudioDSPGraph::Boxes::NonFiniteProtectionBox::bypass(uint64_t this, unsigned __int8 a2)
{
  return this;
}

uint64_t AudioDSPGraph::Boxes::NonFiniteProtectionBox::isBypassed(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)this + 809);
  return v1 & 1;
}

uint64_t AudioDSPGraph::Boxes::NonFiniteProtectionBox::canBypass(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this)
{
  return 1;
}

const char *AudioDSPGraph::Boxes::NonFiniteProtectionBox::ClassName(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this)
{
  return "NonFiniteProtectionBox";
}

void AudioDSPGraph::Boxes::NonFiniteProtectionBox::~NonFiniteProtectionBox(AudioDSPGraph::Boxes::NonFiniteProtectionBox *this)
{
  *(void *)this = &unk_26FC98648;
  uint64_t v2 = (void *)*((void *)this + 97);
  if (v2)
  {
    *((void *)this + 98) = v2;
    operator delete(v2);
  }
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26FC98648;
  uint64_t v2 = (void *)*((void *)this + 97);
  if (v2)
  {
    *((void *)this + 98) = v2;
    operator delete(v2);
  }

  AudioDSPGraph::Box::~Box(this);
}

uint64_t AudioDSPGraph::RingBufferBox::shouldAddRingBufferZeros(AudioDSPGraph::RingBufferBox *this)
{
  return 1;
}

void sub_24890B4A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (*(char *)(v25 - 17) < 0) {
    operator delete(*(void **)(v25 - 40));
  }
  _Unwind_Resume(exception_object);
}

BOOL AudioDSPGraph::RingBufferBox::isFrequencySafe(AudioDSPGraph::RingBufferBox *this)
{
  return *((_DWORD *)this + 194) == 0;
}

uint64_t AudioDSPGraph::Box::in(AudioDSPGraph::Box *this)
{
  uint64_t v3 = (char *)this + 64;
  uint64_t result = *((void *)this + 8);
  if (*((void *)v3 + 1) == result)
  {
    std::string::basic_string[abi:ne180100]<0>(v7, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v6, "in");
    long long v5 = (void *)((char *)this + 32);
    if (*((char *)this + 55) < 0) {
      long long v5 = (void *)*v5;
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v4, v5, (uint64_t)(*((void *)this + 9) - *((void *)this + 8)) >> 5, 0);
  }
  return result;
}

void sub_24890B5A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Boxes::MantissaRandomizerBox::initialize(AudioDSPGraph::Boxes::MantissaRandomizerBox *this)
{
  AudioDSPGraph::Box::initialize(this);
  uint64_t v2 = AudioDSPGraph::Box::in(this, 0);
  int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  if (v3 != *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 28))
  {
    std::string::basic_string[abi:ne180100]<0>(&v15, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/MantissaRandomizerBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v14, "initialize");
    uint64_t v8 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v9 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 28);
    uint64_t v10 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"input and output must have the same channel count, but have %u and %u", v12, v9, *(unsigned int *)(*(void *)(v11 + 120) + 28));
  }
  uint64_t v5 = AudioDSPGraph::Box::in(this, 0);
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 8) != 1819304813
    || (uint64_t v6 = AudioDSPGraph::Box::out(this, 0),
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6),
        *(_DWORD *)(*(void *)(result + 120) + 8) != 1819304813))
  {
    std::string::basic_string[abi:ne180100]<0>(&v15, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/MantissaRandomizerBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v14, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v13, "input and output must both be time-domain");
    AudioDSPGraph::ThrowException(1718449215, &v15, 107, &v14, &v13);
  }
  return result;
}

void sub_24890B834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::Boxes::MantissaRandomizerBox::process(AudioDSPGraph::Boxes::MantissaRandomizerBox *this, unsigned int a2, int32x2_t a3)
{
  unsigned int v4 = atomic_load((unsigned int *)this + 194);
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)this + 772);
  if ((v5 & 1) != 0 || !v4)
  {
    uint64_t v26 = AudioDSPGraph::Box::in(this, 0);
    unsigned __int32 v27 = (void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v26 + 40))(v26) + 56) + 80);
    uint64_t v28 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v28 + 40))(v28);
    AudioDSPGraph::SimpleABL::copy(v27, *(AudioDSPGraph::SimpleABL **)(*(void *)(v29 + 56) + 80));
  }
  else
  {
    unsigned int v6 = (v4 + 3) & 0xFFFFFFFC;
    a3.i32[0] = v4 - 1;
    int32x2_t v44 = a3;
    int32x4_t v7 = (int32x4_t)xmmword_24893BF10;
    int8x16_t v8 = 0uLL;
    v9.i64[0] = 0x100000001;
    v9.i64[1] = 0x100000001;
    v10.i64[0] = 0x400000004;
    v10.i64[1] = 0x400000004;
    do
    {
      int32x4_t v11 = v7;
      int8x16_t v12 = v8;
      int8x16_t v8 = vorrq_s8(v8, (int8x16_t)vshlq_u32(v9, (uint32x4_t)v7));
      int32x4_t v7 = vaddq_s32(v7, v10);
      v6 -= 4;
    }
    while (v6);
    uint32x4_t v41 = (uint32x4_t)v11;
    int8x16_t v42 = v12;
    int8x16_t v43 = v8;
    uint64_t v13 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v14 = **(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v13 + 40))(v13) + 56) + 80);
    if (v14)
    {
      uint64_t v15 = 0;
      int8x16_t v16 = vbslq_s8((int8x16_t)vcgtq_u32(v41, (uint32x4_t)vdupq_lane_s32(v44, 0)), v42, v43);
      *(int8x8_t *)v16.i8 = vorr_s8(*(int8x8_t *)v16.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL));
      __int32 v17 = v16.i32[0] | v16.i32[1];
      __int32 v18 = ~(v16.i32[0] | v16.i32[1]);
      do
      {
        uint64_t v19 = AudioDSPGraph::Box::in(this, 0);
        int v20 = *(int **)(*(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v19 + 40))(v19) + 56)
                                  + 80)
                      + 16 * v15
                      + 16);
        uint64_t v21 = AudioDSPGraph::Box::out(this, 0);
        uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v21 + 40))(v21);
        if (a2)
        {
          uint64_t v23 = *(_DWORD **)(*(void *)(*(void *)(v22 + 56) + 80) + 16 * v15 + 16);
          uint64_t v24 = 4 * a2;
          do
          {
            int v25 = *v20++;
            v46[0] = 0;
            v46[1] = v17;
            *v23++ = std::uniform_int_distribution<unsigned int>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)((char *)this + 784), v46) | v25 & v18;
            v24 -= 4;
          }
          while (v24);
        }
        ++v15;
      }
      while (v15 != v14);
    }
  }
  uint64_t v30 = AudioDSPGraph::Box::in(this, 0);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v30 + 40))(v30);
  uint64_t v33 = *((void *)this + 11);
  uint64_t v32 = (void *)*((void *)this + 12);
  if ((void *)v33 != v32)
  {
    uint64_t v34 = (_OWORD *)(result[7] + 8);
    uint64_t result = (void *)v33;
    long long v35 = (void *)v33;
    do
    {
      uint64_t v36 = *v35;
      v35 += 4;
      uint64_t v37 = *(void *)((*(uint64_t (**)(void *))(v36 + 40))(result) + 56);
      long long v39 = v34[2];
      long long v38 = v34[3];
      long long v40 = v34[1];
      *(_OWORD *)(v37 + 8) = *v34;
      *(_OWORD *)(v37 + 24) = v40;
      *(_OWORD *)(v37 + 40) = v39;
      *(_OWORD *)(v37 + 56) = v38;
      *(_DWORD *)(v37 + 72) = 0;
      v33 += 32;
      uint64_t result = v35;
    }
    while (v35 != v32);
  }
  return result;
}

uint64_t std::uniform_int_distribution<unsigned int>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, _DWORD *a2)
{
  uint64_t result = a2[1];
  int v4 = result - *a2;
  if (result != *a2)
  {
    unsigned int v5 = v4 + 1;
    if (v4 == -1)
    {
      return std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
    }
    else
    {
      uint64_t v7 = __clz(v5);
      uint64_t v8 = 31;
      if (((v5 << v7) & 0x7FFFFFFF) != 0) {
        uint64_t v8 = 32;
      }
      unint64_t v9 = v8 - v7;
      unint64_t v10 = v9 >> 5;
      if ((v9 & 0x1F) != 0) {
        ++v10;
      }
      if (v10 <= v9) {
        unsigned int v11 = 0xFFFFFFFF >> -(v9 / v10);
      }
      else {
        unsigned int v11 = 0;
      }
      do
        std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v12 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this) & v11;
      while (v12 >= v5);
      return *a2 + v12;
    }
  }
  return result;
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i = this->__i_;
  size_t v2 = (i + 1) % 0x270;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return (i << 15) & 0xEFC60000 ^ i ^ (((i << 15) & 0xEFC60000 ^ i) >> 18);
}

uint64_t AudioDSPGraph::Box::hasPresetData(AudioDSPGraph::Box *this)
{
  return 1;
}

double AudioDSPGraph::Boxes::MantissaRandomizerBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.62656313e219;
  *(_OWORD *)a1 = xmmword_24893BED0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

__n128 AudioDSPGraph::Boxes::MantissaRandomizerBox::getParameterInfo@<Q0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v5 = -10866;
  }
  else
  {
    if (!a2)
    {
      long long v13 = 0u;
      __n128 v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      v14.n128_u32[2] = 1102577664;
      v14.n128_u32[0] = 1;
      uint64_t v15 = 3221225472;
      strlcpy((char *)&v9, "bits to randomize", 0x34uLL);
      *((void *)&v13 + 1) = @"bits to randomize";
      LODWORD(v15) = v15 | 0x8000000;
      long long v6 = v10;
      *(_OWORD *)a3 = v9;
      *(_OWORD *)(a3 + 16) = v6;
      long long v7 = v12;
      *(_OWORD *)(a3 + 32) = v11;
      *(_OWORD *)(a3 + 48) = v7;
      __n128 result = v14;
      *(_OWORD *)(a3 + 64) = v13;
      *(__n128 *)(a3 + 80) = result;
      *(void *)(a3 + 96) = v15;
      *(unsigned char *)(a3 + 104) = 1;
      return result;
    }
    int v5 = -10878;
  }
  *(_DWORD *)a3 = v5;
  *(unsigned char *)(a3 + 104) = 0;
  return result;
}

void sub_24890BE0C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void AudioDSPGraph::Boxes::MantissaRandomizerBox::getParameterList(int a1@<W1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (!a1)
  {
    int v4 = operator new(4uLL);
    *a2 = v4;
    *v4++ = 0;
    a2[1] = v4;
    a2[2] = v4;
  }
}

float AudioDSPGraph::Boxes::MantissaRandomizerBox::getParameter(AudioDSPGraph::Boxes::MantissaRandomizerBox *this, int a2, int a3, int a4)
{
  if (a3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/MantissaRandomizerBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10866, &v8, 66, &v7, &v6);
  }
  if (a4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/MantissaRandomizerBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10877, &v8, 69, &v7, &v6);
  }
  if (a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/MantissaRandomizerBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10878, &v8, 74, &v7, &v6);
  }
  return (float)atomic_load((unsigned int *)this + 194);
}

void sub_24890BF78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Boxes::MantissaRandomizerBox::setParameter(uint64_t this, int a2, int a3, int a4, float a5)
{
  if (a3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/MantissaRandomizerBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10866, &v8, 82, &v7, &v6);
  }
  if (a4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/MantissaRandomizerBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10877, &v8, 85, &v7, &v6);
  }
  if (a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/MantissaRandomizerBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10878, &v8, 91, &v7, &v6);
  }
  uint64_t v5 = llroundf(a5);
  if (v5 >= 23) {
    uint64_t v5 = 23;
  }
  atomic_store(v5 & ~(v5 >> 63), (unsigned int *)(this + 776));
  return this;
}

void sub_24890C110(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Boxes::MantissaRandomizerBox::canProcessInPlace(AudioDSPGraph::Boxes::MantissaRandomizerBox *this)
{
  return 1;
}

uint64_t AudioDSPGraph::Boxes::MantissaRandomizerBox::bypass(uint64_t this, unsigned __int8 a2)
{
  return this;
}

uint64_t AudioDSPGraph::Boxes::MantissaRandomizerBox::isBypassed(AudioDSPGraph::Boxes::MantissaRandomizerBox *this)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)this + 772);
  return v1 & 1;
}

uint64_t AudioDSPGraph::Boxes::MantissaRandomizerBox::canBypass(AudioDSPGraph::Boxes::MantissaRandomizerBox *this)
{
  return 1;
}

const char *AudioDSPGraph::Boxes::MantissaRandomizerBox::ClassName(AudioDSPGraph::Boxes::MantissaRandomizerBox *this)
{
  return "MantissaRandomizerBox";
}

void AudioDSPGraph::Boxes::MantissaRandomizerBox::~MantissaRandomizerBox(AudioDSPGraph::Boxes::MantissaRandomizerBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

std::runtime_error *std::overflow_error::overflow_error[abi:ne180100](std::runtime_error *a1, const char *a2)
{
  __n128 result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x263F8C398] + 16);
  return result;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x24C585790);
}

void AudioDSPGraph::printi(void *a1, unsigned int a2, char *__s)
{
  unsigned int v4 = a2;
  if (a2 >= 0x40)
  {
    do
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"                                                                ", 64);
      v4 -= 64;
    }
    while (v4 > 0x3F);
  }
  if (v4)
  {
    long long v6 = &asc_248940A99[-v4 + 64];
    size_t v7 = strlen(v6);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v6, v7);
  }
  strlen(__s);
  operator new[]();
}

void sub_24890C408(_Unwind_Exception *a1)
{
  MEMORY[0x24C585770](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void *AudioDSPGraph::print4cc(void *a1, unsigned int a2)
{
  unint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(void *)__s = 0;
  uint64_t v15 = 0;
  unsigned int v13 = bswap32(a2);
  uint64_t v5 = MEMORY[0x263EF8318];
  do
  {
    unsigned int v6 = __s[v3 - 4];
    if ((v6 & 0x80000000) != 0) {
      int v7 = __maskrune(__s[v3 - 4], 0x40000uLL);
    }
    else {
      int v7 = *(_DWORD *)(v5 + 4 * v6 + 60) & 0x40000;
    }
    if (v6 == 92 || v7 == 0)
    {
      int v9 = snprintf(&__s[v4], 16 - v4, "\\x%02x", v6);
      v4 += v9 & ~(v9 >> 31);
    }
    else
    {
      __s[v4++] = v6;
    }
    if (v3 > 2) {
      break;
    }
    ++v3;
  }
  while (v4 < 16);
  uint64_t v10 = 15;
  if (v4 < 16) {
    uint64_t v10 = v4;
  }
  __s[v10] = 0;
  size_t v11 = strlen(__s);
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v11);
}

void *AudioDSPGraph::printACD(void *a1, unsigned int *a2, int a3)
{
  unsigned int v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)" (", 2);
  AudioDSPGraph::print4cc(v6, *a2);
  int v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)" ", 1);
  AudioDSPGraph::print4cc(v7, a2[1]);
  long long v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)" ", 1);
  AudioDSPGraph::print4cc(v8, a2[2]);
  __n128 result = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)") ", 3);
  if (a3)
  {
    char v10 = 10;
    return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)&v10, 1);
  }
  return result;
}

void CA::StreamDescription::AsString(CA::StreamDescription *this, void *a2, double a3, int16x8_t a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  unsigned int v6 = *((_DWORD *)a2 + 2);
  if (v6 == 1718773105)
  {
    caulk::make_string((caulk *)"%2u ch, %6.0f Hz, 'freq'", (uint64_t)this, *((unsigned int *)a2 + 7), *a2);
    return;
  }
  if (v6 != 1819304813) {
    goto LABEL_19;
  }
  if (*((_DWORD *)a2 + 5) != 1) {
    goto LABEL_19;
  }
  unsigned int v7 = *((_DWORD *)a2 + 6);
  if (v7 != *((_DWORD *)a2 + 4)) {
    goto LABEL_19;
  }
  unsigned int v8 = *((_DWORD *)a2 + 8);
  if (v7 < v8 >> 3) {
    goto LABEL_19;
  }
  uint64_t v9 = *((unsigned int *)a2 + 7);
  if (!v9) {
    goto LABEL_19;
  }
  unsigned int v10 = *((_DWORD *)a2 + 3);
  if ((v10 & 0x20) == 0)
  {
    BOOL v15 = v7 == v7 / v9 * v9;
    v7 /= v9;
    if (!v15) {
      goto LABEL_19;
    }
  }
  if ((v10 & 2) != 0 || 8 * v7 != v8) {
    goto LABEL_19;
  }
  if (v10)
  {
    if ((v10 & 0x1F84) == 0)
    {
      if (v7 == 4)
      {
        uint64_t v12 = 1;
        goto LABEL_163;
      }
      BOOL v15 = v7 == 8;
      BOOL v52 = v7 == 8;
      if (v15)
      {
        uint64_t v12 = 4 * v52;
        goto LABEL_163;
      }
    }
LABEL_19:
    uint64_t v13 = *((unsigned int *)a2 + 7);
    double v14 = *(double *)a2;
    if (v13) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = v6 == 0;
    }
    if (v15 && v14 == 0.0)
    {
      caulk::make_string((caulk *)"%2u ch, %6.0f Hz", (uint64_t)this, 0, *a2);
      return;
    }
    a4.i32[0] = bswap32(v6);
    *(int8x8_t *)a4.i8 = vzip1_s8(*(int8x8_t *)a4.i8, *(int8x8_t *)&v14);
    v16.i64[0] = 0x1F0000001FLL;
    v16.i64[1] = 0x1F0000001FLL;
    v17.i64[0] = 0x5F0000005FLL;
    v17.i64[1] = 0x5F0000005FLL;
    *(int8x8_t *)a4.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v17, (uint32x4_t)vsraq_n_s32(v16, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)a4.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)a4.i8, (int8x8_t)0x2E002E002E002ELL);
    *((unsigned char *)&v57.__r_.__value_.__s + 23) = 4;
    LODWORD(v57.__r_.__value_.__l.__data_) = vmovn_s16(a4).u32[0];
    v57.__r_.__value_.__s.__data_[4] = 0;
    caulk::make_string((caulk *)"%2u ch, %6.0f Hz, %s (0x%08X) ", (uint64_t)&v55, v13, *(void *)&v14, &v57, *((unsigned int *)a2 + 3));
    if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v57.__r_.__value_.__l.__data_);
    }
    int v18 = *((_DWORD *)a2 + 2);
    if (v18 <= 1819304812)
    {
      if (v18 != 1634492771 && v18 != 1634497332 && v18 != 1718378851)
      {
LABEL_70:
        caulk::make_string((caulk *)"%u bits/channel, %u bytes/packet, %u frames/packet, %u bytes/frame", (uint64_t)&v57, *((unsigned int *)a2 + 8), *((unsigned int *)a2 + 4), *((unsigned int *)a2 + 5), *((unsigned int *)a2 + 6));
        if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v30 = &v55;
        }
        else {
          uint64_t v30 = (std::string *)v55.__r_.__value_.__r.__words[0];
        }
        if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v55.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v55.__r_.__value_.__l.__size_;
        }
LABEL_62:
        uint64_t v32 = std::string::insert(&v57, 0, (const std::string::value_type *)v30, size);
        long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
        *((void *)this + 2) = *((void *)&v32->__r_.__value_.__l + 2);
        *(_OWORD *)this = v33;
        v32->__r_.__value_.__l.__size_ = 0;
        v32->__r_.__value_.__r.__words[2] = 0;
        v32->__r_.__value_.__r.__words[0] = 0;
        if ((SHIBYTE(v57.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_65;
        }
        uint64_t v34 = (void *)v57.__r_.__value_.__r.__words[0];
LABEL_64:
        operator delete(v34);
LABEL_65:
        if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v55.__r_.__value_.__l.__data_);
        }
        return;
      }
LABEL_45:
      uint64_t v27 = *((unsigned int *)a2 + 3);
      if ((v27 - 1) < 4 || !v27 && (v18 == 1634497332 || v18 == 1936487278 || v18 == 1936487267))
      {
        caulk::make_string((caulk *)"from %u-bit source, ", (uint64_t)&v57, CA::StreamDescription::AsString(void)const::kSourceBits[v27]);
        if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v28 = &v57;
        }
        else {
          uint64_t v28 = (std::string *)v57.__r_.__value_.__r.__words[0];
        }
        if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v29 = HIBYTE(v57.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v29 = v57.__r_.__value_.__l.__size_;
        }
        std::string::append(&v55, (const std::string::value_type *)v28, v29);
        if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v57.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        std::string::append(&v55, "from UNKNOWN source bit depth, ", 0x1FuLL);
      }
      caulk::make_string((caulk *)"%u frames/packet", (uint64_t)&v57, *((unsigned int *)a2 + 5));
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v30 = &v55;
      }
      else {
        uint64_t v30 = (std::string *)v55.__r_.__value_.__r.__words[0];
      }
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v55.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v55.__r_.__value_.__l.__size_;
      }
      goto LABEL_62;
    }
    if (v18 == 1936487278 || v18 == 1936487267) {
      goto LABEL_45;
    }
    if (v18 != 1819304813) {
      goto LABEL_70;
    }
    unsigned int v19 = *((_DWORD *)a2 + 3);
    unsigned int v20 = *((_DWORD *)a2 + 6);
    int v21 = v19 & 0x20;
    uint64_t v22 = &byte_248942E06;
    if (!v20) {
      goto LABEL_37;
    }
    if ((v19 & 0x20) != 0)
    {
      unsigned int v23 = 1;
    }
    else
    {
      unsigned int v23 = *((_DWORD *)a2 + 7);
      if (!v23)
      {
        int v21 = 0;
LABEL_37:
        uint64_t v24 = " signed";
        if ((v19 & 4) == 0) {
          uint64_t v24 = " unsigned";
        }
        if (v19) {
          int v25 = "float";
        }
        else {
          int v25 = "integer";
        }
        if (v19) {
          uint64_t v26 = &byte_248942E06;
        }
        else {
          uint64_t v26 = (char *)v24;
        }
LABEL_102:
        v57.__r_.__value_.__s.__data_[0] = 0;
        if (v21) {
          long long v39 = ", deinterleaved";
        }
        else {
          long long v39 = &byte_248942E06;
        }
        uint64_t v36 = &byte_248942E06;
        long long v40 = &byte_248942E06;
        goto LABEL_106;
      }
    }
    int v35 = v20 / v23;
    if (v20 / v23 < 2)
    {
      long long v38 = " signed";
      if ((v19 & 4) == 0) {
        long long v38 = " unsigned";
      }
      if (v19) {
        int v25 = "float";
      }
      else {
        int v25 = "integer";
      }
      if (v19) {
        uint64_t v26 = &byte_248942E06;
      }
      else {
        uint64_t v26 = (char *)v38;
      }
      if (v23 > v20) {
        goto LABEL_102;
      }
      int v35 = 1;
      uint64_t v36 = &byte_248942E06;
    }
    else
    {
      if ((v19 & 2) != 0) {
        uint64_t v36 = " big-endian";
      }
      else {
        uint64_t v36 = " little-endian";
      }
      uint64_t v37 = " unsigned";
      if ((v19 & 4) != 0) {
        uint64_t v37 = " signed";
      }
      if (v19) {
        int v25 = "float";
      }
      else {
        int v25 = "integer";
      }
      if (v19) {
        uint64_t v26 = &byte_248942E06;
      }
      else {
        uint64_t v26 = (char *)v37;
      }
    }
    unsigned int v41 = *((_DWORD *)a2 + 7);
    if ((v19 & 0x20) != 0) {
      unsigned int v42 = 1;
    }
    else {
      unsigned int v42 = *((_DWORD *)a2 + 7);
    }
    if (v42) {
      unsigned int v42 = 8 * (v20 / v42);
    }
    if (v42 == *((_DWORD *)a2 + 8))
    {
      v57.__r_.__value_.__s.__data_[0] = 0;
    }
    else
    {
      if ((v19 & 8) != 0) {
        int8x16_t v43 = &byte_248942E06;
      }
      else {
        int8x16_t v43 = "un";
      }
      snprintf((char *)&v57, 0x20uLL, "%spacked in %u bytes", v43, v35);
      unsigned int v20 = *((_DWORD *)a2 + 6);
      unsigned int v19 = *((_DWORD *)a2 + 3);
      if (!v20)
      {
        unsigned int v44 = 0;
        int v21 = *((_DWORD *)a2 + 3) & 0x20;
        goto LABEL_128;
      }
      unsigned int v41 = *((_DWORD *)a2 + 7);
      int v21 = *((_DWORD *)a2 + 3) & 0x20;
    }
    if (v21) {
      unsigned int v44 = 1;
    }
    else {
      unsigned int v44 = v41;
    }
    if (v44) {
      unsigned int v44 = 8 * (v20 / v44);
    }
LABEL_128:
    int v45 = *((_DWORD *)a2 + 8);
    v46 = " high-aligned";
    if ((v19 & 0x10) == 0) {
      v46 = " low-aligned";
    }
    if ((v45 & 7) == 0 && v44 == v45) {
      long long v40 = &byte_248942E06;
    }
    else {
      long long v40 = (char *)v46;
    }
    if (v21) {
      long long v39 = ", deinterleaved";
    }
    else {
      long long v39 = &byte_248942E06;
    }
    if (v57.__r_.__value_.__s.__data_[0])
    {
      uint64_t v22 = ", ";
LABEL_141:
      if (((v19 >> 7) & 0x3F) != 0) {
        snprintf(__str, 0x14uLL, "%u.%u");
      }
      else {
        snprintf(__str, 0x14uLL, "%u");
      }
      caulk::make_string((caulk *)"%s-bit%s%s %s%s%s%s%s", (uint64_t)&v54, __str, v36, v26, v25, v22, &v57, v40, v39);
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v48 = &v55;
      }
      else {
        v48 = (std::string *)v55.__r_.__value_.__r.__words[0];
      }
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v49 = HIBYTE(v55.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v49 = v55.__r_.__value_.__l.__size_;
      }
      v50 = std::string::insert(&v54, 0, (const std::string::value_type *)v48, v49);
      long long v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
      *((void *)this + 2) = *((void *)&v50->__r_.__value_.__l + 2);
      *(_OWORD *)this = v51;
      v50->__r_.__value_.__l.__size_ = 0;
      v50->__r_.__value_.__r.__words[2] = 0;
      v50->__r_.__value_.__r.__words[0] = 0;
      if ((SHIBYTE(v54.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_65;
      }
      uint64_t v34 = (void *)v54.__r_.__value_.__r.__words[0];
      goto LABEL_64;
    }
LABEL_106:
    if (*v40) {
      uint64_t v22 = ", ";
    }
    goto LABEL_141;
  }
  if ((v10 & 4) == 0) {
    goto LABEL_19;
  }
  int v11 = (v10 >> 7) & 0x3F;
  if (v11 != 24 || v7 != 4)
  {
    if (!v11 && v7 == 4)
    {
      uint64_t v12 = 5;
      goto LABEL_163;
    }
    if (!v11 && v7 == 2)
    {
      uint64_t v12 = 2;
      goto LABEL_163;
    }
    goto LABEL_19;
  }
  uint64_t v12 = 3;
LABEL_163:
  if ((v10 & 0x20) != 0) {
    v53 = ", deinterleaved";
  }
  else {
    v53 = ", interleaved";
  }
  if (v9 <= 1) {
    v53 = &byte_248942E06;
  }
  caulk::make_string((caulk *)"%2u ch, %6.0f Hz, %s%s", (uint64_t)this, v9, *a2, *((void *)&off_265242C78 + v12), v53);
}

void sub_24890CD58(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void caulk::make_string(caulk *this@<X0>, uint64_t a2@<X8>, ...)
{
  va_start(va, a2);
  int v5 = vsnprintf(0, 0, (const char *)this, va);
  if (v5 <= 0)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    std::string::resize((std::string *)a2, (v5 + 1), 0);
    int v6 = *(char *)(a2 + 23);
    if (v6 >= 0) {
      unsigned int v7 = (char *)a2;
    }
    else {
      unsigned int v7 = *(char **)a2;
    }
    if (v6 >= 0) {
      size_t v8 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      size_t v8 = *(void *)(a2 + 8);
    }
    int v9 = vsnprintf(v7, v8, (const char *)this, va);
    std::string::resize((std::string *)a2, v9, 0);
  }
}

void AudioDSPGraph::strprintf(AudioDSPGraph *this, const char *a2, ...)
{
}

void sub_24890CF14(_Unwind_Exception *a1)
{
  MEMORY[0x24C585770](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void AudioDSPGraph::asDecompileString(std::string *this, char *a2)
{
  LODWORD(v4) = a2[23];
  if (a2[23] < 0)
  {
    if (!*((void *)a2 + 1))
    {
      uint64_t v4 = 0;
      *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
      this->__r_.__value_.__r.__words[2] = 0;
      goto LABEL_31;
    }
    int v5 = *(char **)a2;
  }
  else
  {
    int v5 = a2;
    if (!a2[23])
    {
      *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
      this->__r_.__value_.__r.__words[2] = 0;
LABEL_12:
      uint64_t v4 = v4;
LABEL_31:
      std::string::reserve(this, v4 + 2);
      std::string::push_back(this, 34);
      int v17 = a2[23];
      if (v17 >= 0) {
        int v18 = a2;
      }
      else {
        int v18 = *(const std::string::value_type **)a2;
      }
      if (v17 >= 0) {
        std::string::size_type v19 = a2[23];
      }
      else {
        std::string::size_type v19 = *((void *)a2 + 1);
      }
      std::string::append(this, v18, v19);
      std::string::push_back(this, 34);
      return;
    }
  }
  unsigned int v6 = *v5;
  if ((v6 & 0x80000000) != 0)
  {
    int v7 = __maskrune(*v5, 0x500uLL);
    LODWORD(v4) = a2[23];
  }
  else
  {
    int v7 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v6 + 60) & 0x500;
  }
  if (v6 != 95 && !v7)
  {
LABEL_11:
    this->__r_.__value_.__r.__words[0] = 0;
    this->__r_.__value_.__l.__size_ = 0;
    this->__r_.__value_.__r.__words[2] = 0;
    if ((v4 & 0x80) != 0)
    {
      uint64_t v4 = *((void *)a2 + 1);
      goto LABEL_31;
    }
    goto LABEL_12;
  }
  BOOL v8 = (v4 & 0x80u) != 0;
  std::string::size_type v9 = *((void *)a2 + 1);
  unint64_t v10 = v4;
  if ((v4 & 0x80u) != 0) {
    unint64_t v10 = *((void *)a2 + 1);
  }
  if (v10 >= 2)
  {
    unint64_t v11 = 1;
    uint64_t v12 = MEMORY[0x263EF8318];
    do
    {
      uint64_t v13 = *(char **)a2;
      if (!v8) {
        uint64_t v13 = a2;
      }
      unsigned int v14 = v13[v11];
      if ((v14 & 0x80000000) != 0)
      {
        if (!__maskrune(v13[v11], 0x500uLL))
        {
LABEL_23:
          BOOL v15 = memchr("_-+=|./:!@#$%^&*<>?~", v14, 0x15uLL);
          LODWORD(v4) = a2[23];
          if (!v15) {
            goto LABEL_11;
          }
          goto LABEL_24;
        }
      }
      else if ((*(_DWORD *)(v12 + 4 * v14 + 60) & 0x500) == 0)
      {
        goto LABEL_23;
      }
      LODWORD(v4) = a2[23];
LABEL_24:
      ++v11;
      BOOL v8 = (v4 & 0x80u) != 0;
      std::string::size_type v9 = *((void *)a2 + 1);
      unint64_t v16 = v4;
      if ((v4 & 0x80u) != 0) {
        unint64_t v16 = *((void *)a2 + 1);
      }
    }
    while (v11 < v16);
  }
  if ((v4 & 0x80) != 0)
  {
    unsigned int v20 = *(const std::string::value_type **)a2;
    std::string::__init_copy_ctor_external(this, v20, v9);
  }
  else
  {
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
  }
}

void sub_24890D148(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::SimpleABL::free(AudioDSPGraph::SimpleABL *this)
{
  if (*((unsigned char *)this + 8))
  {
    size_t v2 = *(_DWORD **)this;
    if (!*(void *)this) {
      return;
    }
    if (*v2)
    {
      unint64_t v3 = 0;
      uint64_t v4 = 4;
      do
      {
        free(*(void **)&v2[v4]);
        ++v3;
        size_t v2 = *(_DWORD **)this;
        v4 += 4;
      }
      while (v3 < **(unsigned int **)this);
    }
    free(v2);
    *((unsigned char *)this + 8) = 0;
  }
  *(void *)this = 0;
}

void AudioDSPGraph::SimpleABL::alloc(AudioDSPGraph::SimpleABL *this, unsigned int a2, unsigned int a3)
{
  AudioDSPGraph::SimpleABL::free(this);
  if (a2 && a3)
  {
    *((unsigned char *)this + 8) = 1;
    unsigned int v6 = malloc_type_calloc(1uLL, 16 * (a2 - 1) + 24, 0xE539D3FFuLL);
    *(void *)this = v6;
    if (!v6)
    {
      std::string::basic_string[abi:ne180100]<0>(&v12, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v11, "alloc");
      std::string::basic_string[abi:ne180100]<0>(&v10, "AudioBufferList allocation failed");
      AudioDSPGraph::ThrowException(-108, &v12, 565, &v11, &v10);
    }
    uint64_t v7 = 0;
    _DWORD *v6 = a2;
    do
    {
      BOOL v8 = &v6[v7];
      v8[2] = 1;
      void v8[3] = a3;
      std::string::size_type v9 = malloc_type_calloc(1uLL, a3, 0x143630A7uLL);
      unsigned int v6 = *(_DWORD **)this;
      *(void *)(*(void *)this + v7 * 4 + 16) = v9;
      if (!v9)
      {
        std::string::basic_string[abi:ne180100]<0>(&v12, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v11, "alloc");
        std::string::basic_string[abi:ne180100]<0>(&v10, "AudioBufferList data allocation failed");
        AudioDSPGraph::ThrowException(-108, &v12, 574, &v11, &v10);
      }
      v7 += 4;
    }
    while (4 * a2 != v7);
  }
}

void sub_24890D334(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

unsigned int *AudioDSPGraph::SimpleABL::setByteSize(unsigned int *this, int a2)
{
  if (!this)
  {
    std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v5, "setByteSize");
    std::string::basic_string[abi:ne180100]<0>(&v4, "null internal ABL");
    AudioDSPGraph::ThrowException(1768843553, &v6, 595, &v5, &v4);
  }
  uint64_t v2 = *this;
  if (v2)
  {
    unint64_t v3 = this + 3;
    do
    {
      *unint64_t v3 = a2;
      v3 += 4;
      --v2;
    }
    while (v2);
  }
  return this;
}

void sub_24890D41C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::SimpleABL::copy(void *this, AudioDSPGraph::SimpleABL *a2)
{
  uint64_t v2 = (_DWORD *)*this;
  if (!*this)
  {
    std::string::basic_string[abi:ne180100]<0>(&v14, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v13, "copy");
    std::string::basic_string[abi:ne180100]<0>(&v12, "null internal ABL");
    AudioDSPGraph::ThrowException(1768843553, &v14, 642, &v13, &v12);
  }
  if (!a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v14, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v13, "copy");
    std::string::basic_string[abi:ne180100]<0>(&v12, "null destination ABL");
    AudioDSPGraph::ThrowException(1768843553, &v14, 646, &v13, &v12);
  }
  unint64_t v4 = *v2;
  if (v4 != *(_DWORD *)a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v14, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v13, "copy");
    std::string::basic_string[abi:ne180100]<0>(&v12, "mABL->mNumberBuffers != toABL->mNumberBuffers");
    AudioDSPGraph::ThrowException(1718444833, &v14, 649, &v13, &v12);
  }
  if (*v2)
  {
    long long v5 = this;
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      size_t v8 = v2[v6 + 3];
      std::string::size_type v9 = (char *)a2 + v6 * 4;
      if (v8 > *(_DWORD *)((char *)a2 + v6 * 4 + 12))
      {
        std::string::basic_string[abi:ne180100]<0>(&v14, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v13, "copy");
        AudioDSPGraph::strprintf((AudioDSPGraph *)"mABL->mBuffers[%u].mDataByteSize (%u) > toABL->mBuffers[%u].mDataByteSize (%u)", v11, v7, *(unsigned int *)(*v5 + 16 * v7 + 12), v7, *((unsigned int *)v9 + 3));
      }
      long long v10 = *(void **)&v2[v6 + 4];
      this = (void *)*((void *)v9 + 2);
      if (v10 != this)
      {
        this = memcpy(this, v10, v8);
        uint64_t v2 = (_DWORD *)*v5;
        LODWORD(v8) = *(_DWORD *)(*v5 + v6 * 4 + 12);
        unint64_t v4 = *(unsigned int *)*v5;
      }
      *((_DWORD *)v9 + 3) = v8;
      ++v7;
      v6 += 4;
    }
    while (v7 < v4);
  }
  return this;
}

void sub_24890D674(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (*(char *)(v25 - 49) < 0) {
    operator delete(*(void **)(v25 - 72));
  }
  _Unwind_Resume(exception_object);
}

unsigned int *AudioDSPGraph::SimpleABL::copy(unsigned int *this, unsigned int **a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6 = *(unsigned int **)this;
  if (!*(void *)this)
  {
    std::string::basic_string[abi:ne180100]<0>(&v25, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v24, "copy");
    std::string::basic_string[abi:ne180100]<0>(&v23, "null internal ABL");
    AudioDSPGraph::ThrowException(1768843553, &v25, 676, &v24, &v23);
  }
  unint64_t v7 = *a2;
  if (!*a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v25, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v24, "copy");
    std::string::basic_string[abi:ne180100]<0>(&v23, "null destination ABL");
    AudioDSPGraph::ThrowException(1768843553, &v25, 680, &v24, &v23);
  }
  size_t v8 = (unsigned int **)this;
  if (*v6 != *v7)
  {
    std::string::basic_string[abi:ne180100]<0>(&v25, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v24, "copy");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"mABL->mNumberBuffers (%u) != toABL->mNumberBuffers (%u)", v17, **v8, *v7);
  }
  if (*v6)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    unsigned int v11 = a5 + a3;
    unsigned int v12 = a5 + a4;
    do
    {
      if (v11 > v6[v9 + 3])
      {
        std::string::basic_string[abi:ne180100]<0>(&v25, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v24, "copy");
        AudioDSPGraph::strprintf((AudioDSPGraph *)"fromBytePos (%u) + numBytesToCopy (%u) > mABL->mBuffers[%u].mDataByteSize (%u)", v15, a3, a5, v10, (*v8)[4 * v10 + 3]);
      }
      long long v13 = &v7[v9];
      if (v12 > v7[v9 + 3])
      {
        std::string::basic_string[abi:ne180100]<0>(&v25, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v24, "copy");
        AudioDSPGraph::strprintf((AudioDSPGraph *)"toBytePos (%u) + numBytesToCopy (%u) > toABL->mBuffers[%u].mDataByteSize (%u)", v16, a4, a5, v10, v13[3]);
      }
      this = (unsigned int *)memmove((void *)(*((void *)v13 + 2) + a4), (const void *)(*(void *)&v6[v9 + 4] + a3), a5);
      ++v10;
      uint64_t v6 = *v8;
      v9 += 4;
    }
    while (v10 < **v8);
  }
  if (a6)
  {
    long long v14 = *a2;
    return AudioDSPGraph::SimpleABL::setByteSize(v14, (int)a5 + (int)a4);
  }
  return this;
}

void sub_24890D9F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (*(char *)(v29 - 81) < 0) {
    operator delete(*(void **)(v29 - 104));
  }
  _Unwind_Resume(exception_object);
}

unsigned int *AudioDSPGraph::SimpleABL::srcWrapCopy(AudioDSPGraph::SimpleABL *this, unsigned int **a2, uint64_t a3, uint64_t a4, char a5)
{
  long long v5 = *(_DWORD **)this;
  if (!*(void *)this || !*v5)
  {
    std::string::basic_string[abi:ne180100]<0>(&v21, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v20, "srcWrapCopy");
    std::string::basic_string[abi:ne180100]<0>(&v19, "empty internal ABL");
    AudioDSPGraph::ThrowException(1768843553, &v21, 713, &v20, &v19);
  }
  uint64_t v6 = a3;
  uint64_t v7 = v5[3];
  uint64_t v8 = (v7 - a3);
  if (v7 <= a3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v21, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v20, "srcWrapCopy");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"copy source position exceeds bounds %u >= %u", v16, v6, v7);
  }
  uint64_t v10 = a4;
  if (v7 < a4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v21, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v20, "srcWrapCopy");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"copy size exceeds source size %u > %u", v18, a4, v7);
  }
  unsigned int v11 = (AudioDSPGraph::SimpleABL *)a2;
  unsigned int v12 = this;
  if ((int)a4 + (int)a3 <= v7)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v13 = (a4 - v8);
    AudioDSPGraph::SimpleABL::copy((unsigned int *)this, a2, a3, 0, v8, 0);
    this = v12;
    a2 = (unsigned int **)v11;
    a3 = 0;
    uint64_t v14 = v8;
    uint64_t v10 = v13;
  }

  return AudioDSPGraph::SimpleABL::copy((unsigned int *)this, a2, a3, v14, v10, a5);
}

void sub_24890DC40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

unsigned int *AudioDSPGraph::SimpleABL::dstWrapCopy(AudioDSPGraph::SimpleABL *this, unsigned int **a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = *a2;
  if (!*a2 || !*v4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v20, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v19, "dstWrapCopy");
    std::string::basic_string[abi:ne180100]<0>(&v18, "empty destination ABL");
    AudioDSPGraph::ThrowException(1768843553, &v20, 740, &v19, &v18);
  }
  uint64_t v6 = v4[3];
  uint64_t v7 = (v6 - a3);
  if (v6 <= a3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v20, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v19, "dstWrapCopy");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"copy destination position exceeds bounds %u >= %u", v15, a3, v6);
  }
  uint64_t v8 = a4;
  if (v6 < a4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v20, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v19, "dstWrapCopy");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"copy size exceeds destination size %u > %u", v17, a4, v6);
  }
  uint64_t v9 = (AudioDSPGraph::SimpleABL *)a2;
  uint64_t v10 = this;
  if ((int)a4 + (int)a3 <= v6)
  {
    uint64_t v12 = 0;
    uint64_t v13 = a3;
  }
  else
  {
    uint64_t v11 = (a4 - v7);
    AudioDSPGraph::SimpleABL::copy((unsigned int *)this, a2, 0, a3, v7, 0);
    this = v10;
    a2 = (unsigned int **)v9;
    uint64_t v12 = v7;
    uint64_t v13 = 0;
    uint64_t v8 = v11;
  }

  return AudioDSPGraph::SimpleABL::copy((unsigned int *)this, a2, v12, v13, v8, 0);
}

void sub_24890DE70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::RingBuffer::alloc(AudioDSPGraph::RingBuffer *this, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  if (a4 > a3)
  {
    std::string::basic_string[abi:ne180100]<0>(v17, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Utils.cpp");
    std::string::basic_string[abi:ne180100]<0>(v16, "alloc");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"numZeroes is greater than buffer capacity %u > %u", v14, a4, a3);
  }
  *((_DWORD *)this + 4) = a3;
  unsigned int v8 = a3 + 1;
  if (a3 == -1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::overflow_error::overflow_error[abi:ne180100](exception, "arithmetic addition overflow");
  }
  *((_DWORD *)this + 5) = v8;
  *((_DWORD *)this + 6) = a5;
  *((void *)this + 4) = 0;
  *((_DWORD *)this + 7) = 0;
  unsigned int v11 = caulk::numeric::exceptional_mul<unsigned int>(v8, a5);
  if (a6) {
    unsigned int v12 = 1;
  }
  else {
    unsigned int v12 = a2;
  }
  AudioDSPGraph::SimpleABL::alloc(this, v12, v11);
  if (a4)
  {
    AudioDSPGraph::RingBuffer::initialize(this, a4);
  }
}

void sub_24890E00C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

unint64_t caulk::numeric::exceptional_mul<unsigned int>(unsigned int a1, unsigned int a2)
{
  unint64_t result = a1 * (unint64_t)a2;
  if ((result & 0xFFFFFFFF00000000) != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::overflow_error::overflow_error[abi:ne180100](exception, "arithmetic multiplication overflow");
  }
  return result;
}

void sub_24890E0C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void AudioDSPGraph::RingBuffer::initialize(AudioDSPGraph::RingBuffer *this, int a2)
{
  *((_DWORD *)this + 8) = 0;
  *((_DWORD *)this + 9) = a2;
  *((_DWORD *)this + 7) = a2;
  uint64_t v2 = *(_DWORD **)this;
  if (*(void *)this && *v2)
  {
    unint64_t v4 = 0;
    size_t v5 = (*((_DWORD *)this + 6) * a2);
    uint64_t v6 = 4;
    do
    {
      bzero(*(void **)&v2[v6], v5);
      ++v4;
      uint64_t v2 = *(_DWORD **)this;
      v6 += 4;
    }
    while (v4 < **(unsigned int **)this);
  }
}

unsigned int *AudioDSPGraph::RingBuffer::write(AudioDSPGraph::RingBuffer *this, unsigned int a2, AudioDSPGraph::SimpleABL *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 4) - *((_DWORD *)this + 7) < a2)
  {
    {
      AudioDSPGraph::getLog(void)::gLog = (uint64_t)os_log_create("com.apple.coreaudio", "AudioDSPGraph");
    }
    uint64_t v10 = AudioDSPGraph::getLog(void)::gLog;
    if (os_log_type_enabled((os_log_t)AudioDSPGraph::getLog(void)::gLog, OS_LOG_TYPE_FAULT))
    {
      int v11 = *((_DWORD *)this + 4);
      int v12 = *((_DWORD *)this + 7);
      int v13 = *((_DWORD *)this + 8);
      int v14 = *((_DWORD *)this + 9);
      *(_DWORD *)buf = 67110400;
      unsigned int v16 = a2;
      __int16 v17 = 1024;
      int v18 = v11 - v12;
      __int16 v19 = 1024;
      int v20 = v11;
      __int16 v21 = 1024;
      int v22 = v12;
      __int16 v23 = 1024;
      int v24 = v13;
      __int16 v25 = 1024;
      int v26 = v14;
      _os_log_fault_impl(&dword_248903000, v10, OS_LOG_TYPE_FAULT, "DSPGraph assertion failure: RingBuffer::write overflow %u > %u (capacity = %u, readAvail = %u, readPos = %u, writePos = %u)", buf, 0x26u);
    }
    snprintf((char *)buf, 0x400uLL, "DSPGraph assertion failure: RingBuffer::write overflow %u > %u (capacity = %u, readAvail = %u, readPos = %u, writePos = %u)", a2, *((_DWORD *)this + 4) - *((_DWORD *)this + 7), *((_DWORD *)this + 4), *((_DWORD *)this + 7), *((_DWORD *)this + 8), *((_DWORD *)this + 9));
    __break(1u);
  }
  unint64_t result = AudioDSPGraph::SimpleABL::dstWrapCopy(a3, (unsigned int **)this, (*((_DWORD *)this + 9) * *((_DWORD *)this + 6)), *((_DWORD *)this + 6) * a2);
  unsigned int v6 = *((_DWORD *)this + 9) + a2;
  *((_DWORD *)this + 9) = v6;
  unsigned int v7 = *((_DWORD *)this + 5);
  BOOL v8 = v6 >= v7;
  unsigned int v9 = v6 - v7;
  if (v8) {
    *((_DWORD *)this + 9) = v9;
  }
  *((_DWORD *)this + 7) += a2;
  return result;
}

void *AudioDSPGraph::Buffer::copyFrom(void *result, void *a2)
{
  if (a2 != result)
  {
    uint64_t v2 = result;
    unint64_t v3 = (_DWORD *)a2[10];
    unint64_t v4 = (_DWORD *)result[10];
    if (*v3 != *v4)
    {
      std::string::basic_string[abi:ne180100]<0>(&v13, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Buffer.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v12, "copyFrom");
      std::string::basic_string[abi:ne180100]<0>(&v11, "Buffer::copyFrom, fromABL->mNumberBuffers != toABL->mNumberBuffers");
      AudioDSPGraph::ThrowException(1718444833, &v13, 52, &v12, &v11);
    }
    unint64_t v5 = *((unsigned int *)result + 24);
    if (v5)
    {
      unint64_t v6 = 0;
      unsigned int v7 = (void **)(v4 + 4);
      BOOL v8 = v3 + 3;
      do
      {
        size_t v9 = *v8;
        if (v9 > *((_DWORD *)v2 + 25))
        {
          std::string::basic_string[abi:ne180100]<0>(&v13, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Buffer.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v12, "copyFrom");
          std::string::basic_string[abi:ne180100]<0>(&v11, "Buffer::copyFrom, fromABL->mBuffers[i].mDataByteSize > mByteCapacity");
          AudioDSPGraph::ThrowException(1718444833, &v13, 58, &v12, &v11);
        }
        uint64_t v10 = *(void **)(v8 + 1);
        unint64_t result = *v7;
        if (v10 != *v7)
        {
          unint64_t result = memcpy(result, v10, v9);
          LODWORD(v9) = *v8;
          unint64_t v5 = *((unsigned int *)v2 + 24);
        }
        *((_DWORD *)v7 - 1) = v9;
        ++v6;
        v7 += 2;
        v8 += 4;
      }
      while (v6 < v5);
    }
  }
  return result;
}

void sub_24890E458(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

unsigned int *AudioDSPGraph::Buffer::setByteSize(unsigned int **this, unsigned int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 25) < a2)
  {
    Log = AudioDSPGraph::getLog((AudioDSPGraph *)this);
    if (os_log_type_enabled(Log, OS_LOG_TYPE_FAULT))
    {
      int v7 = *((_DWORD *)this + 25);
      *(_DWORD *)buf = 67109376;
      unsigned int v9 = a2;
      __int16 v10 = 1024;
      int v11 = v7;
      _os_log_fault_impl(&dword_248903000, Log, OS_LOG_TYPE_FAULT, "DSPGraph assertion failure: DSPGraph buffer byte size %u is larger than byte capacity %u", buf, 0xEu);
    }
    snprintf((char *)buf, 0x400uLL, "DSPGraph assertion failure: DSPGraph buffer byte size %u is larger than byte capacity %u", a2, *((_DWORD *)this + 25));
    __break(1u);
  }
  unint64_t v4 = this[10];

  return AudioDSPGraph::SimpleABL::setByteSize(v4, a2);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void DFTSetups::~DFTSetups(DFTSetups *this)
{
  uint64_t v2 = (vDSP_DFT_SetupStruct *)*((void *)this + 2);
  if (v2) {
    vDSP_DFT_DestroySetup(v2);
  }
  unint64_t v3 = (vDSP_DFT_SetupStruct *)*((void *)this + 1);
  if (v3) {
    vDSP_DFT_DestroySetup(v3);
  }
}

DFTSetups *std::unique_ptr<DFTSetups>::reset[abi:ne180100](DFTSetups **a1)
{
  unint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    DFTSetups::~DFTSetups(result);
    JUMPOUT(0x24C585790);
  }
  return result;
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (os_unfair_lock_trylock((os_unfair_lock_t)v2))
  {
    unint64_t v3 = std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *>,caulk::shared_instance_manager<DFTSetups>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *> const&)#1}>(*(uint64_t **)(v2 + 8), *(uint64_t **)(v2 + 16));
    std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::erase(v2 + 8, (uint64_t)v3, *(void *)(v2 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)v2);
  }
  std::unique_ptr<DFTSetups>::reset[abi:ne180100]((DFTSetups **)(a1 + 40));
  unint64_t v4 = *(std::__shared_weak_count **)(a1 + 32);
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

uint64_t *std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *>,caulk::shared_instance_manager<DFTSetups>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *> const&)#1}>(uint64_t *a1, uint64_t *a2)
{
  if (a1 == a2) {
    return a2;
  }
  unint64_t v3 = a1;
  while (1)
  {
    uint64_t v4 = v3[1];
    if (!v4 || *(void *)(v4 + 8) == -1) {
      break;
    }
    v3 += 2;
    if (v3 == a2) {
      return a2;
    }
  }
  if (v3 != a2)
  {
    for (size_t i = v3 + 2; i != a2; i += 2)
    {
      uint64_t v7 = i[1];
      if (v7 && *(void *)(v7 + 8) != -1)
      {
        uint64_t v8 = *i;
        uint64_t *i = 0;
        i[1] = 0;
        unsigned int v9 = (std::__shared_weak_count *)v3[1];
        *unint64_t v3 = v8;
        v3[1] = v7;
        if (v9) {
          std::__shared_weak_count::__release_weak(v9);
        }
        v3 += 2;
      }
    }
  }
  return v3;
}

void std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = a3;
    uint64_t v4 = a2;
    uint64_t v6 = *(void *)(a1 + 8);
    if (a3 != v6)
    {
      uint64_t v7 = 16 * ((a3 - a2) >> 4);
      do
      {
        uint64_t v8 = (void *)(v4 + v7);
        long long v9 = *(_OWORD *)(v4 + v7);
        *uint64_t v8 = 0;
        v8[1] = 0;
        __int16 v10 = *(std::__shared_weak_count **)(v4 + 8);
        *(_OWORD *)uint64_t v4 = v9;
        if (v10) {
          std::__shared_weak_count::__release_weak(v10);
        }
        v4 += 16;
      }
      while (v4 + v7 != v6);
      uint64_t v3 = *(void *)(a1 + 8);
    }
    while (v3 != v4)
    {
      int v11 = *(std::__shared_weak_count **)(v3 - 8);
      if (v11) {
        std::__shared_weak_count::__release_weak(v11);
      }
      v3 -= 16;
    }
    *(void *)(a1 + 8) = v4;
  }
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FC98B68;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24C585790);
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FC98B68;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void MultiRadixRealFFT::RealOutOfPlaceInverseTransform(MultiRadixRealFFT *this, const DSPSplitComplex *a2, DSPComplex *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!*(void *)this) {
    abort();
  }
  MEMORY[0x270FA5388]();
  uint64_t v6 = (float *)((char *)&v11 - ((v5 + 15) & 0x7FFFFFFF0));
  __Z.realp = v6;
  __Z.imagp = (float *)((char *)v6 + ((2 * v7) & 0x1FFFFFFFCLL));
  vDSP_DFT_Execute(*(const vDSP_DFT_SetupStruct **)(v8 + 16), *v9, v9[1], v6, __Z.imagp);
  if (*(void *)this) {
    vDSP_Length v10 = (unint64_t)**(unsigned int **)this >> 1;
  }
  else {
    vDSP_Length v10 = 0;
  }
  vDSP_ztoc(&__Z, 1, a3, 2, v10);
}

uint64x2_t CreateMagicalWindow(float *a1, int a2, uint64x2_t result)
{
  if (a2 >= 1)
  {
    *(float *)result.i32 = (float)a2;
    uint64_t v3 = (a2 + 3) & 0x1FFFFFFFCLL;
    float32x4_t v43 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)result.i8, 0);
    uint64x2_t v44 = (uint64x2_t)vdupq_n_s64((unint64_t)a2 - 1);
    uint64x2_t v4 = (uint64x2_t)xmmword_24893BF20;
    unint64_t result = (uint64x2_t)xmmword_24893BF30;
    int32x4_t v5 = (int32x4_t)xmmword_24893BF10;
    uint64_t v6 = a1 + 2;
    __asm { FMOV            V1.4S, #4.0 }
    float32x4_t v42 = _Q1;
    __asm { FMOV            V1.4S, #1.0 }
    float32x4_t v56 = _Q1;
    __asm { FMOV            V4.4S, #3.0 }
    float64x2_t v40 = (float64x2_t)vdupq_n_s64(0x3FF459A5D6E6692DuLL);
    float32x4_t v41 = _Q4;
    __asm { FMOV            V1.2D, #-0.5 }
    float64x2_t v38 = _Q1;
    float64x2_t v39 = (float64x2_t)vdupq_n_s64(0x3FF921FB54442D18uLL);
    __asm { FMOV            V4.2D, #0.5 }
    int64x2_t v36 = vdupq_n_s64(4uLL);
    float64x2_t v37 = _Q4;
    do
    {
      int64x2_t v54 = (int64x2_t)result;
      int64x2_t v55 = (int64x2_t)v4;
      int8x16_t v16 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgeq_u64(v44, result), (int32x4_t)vcgeq_u64(v44, v4));
      int32x4_t v53 = v5;
      float32x4_t v17 = vdivq_f32(vmulq_f32(vcvtq_f32_s32(v5), v42), v43);
      int8x16_t v18 = (int8x16_t)vcgtq_f32(v56, v17);
      v19.i64[0] = 0x4000000040000000;
      v19.i64[1] = 0x4000000040000000;
      int8x16_t v20 = (int8x16_t)vcgtq_f32(v19, v17);
      int8x16_t v21 = (int8x16_t)vcgtq_f32(v41, v17);
      float32x4_t v22 = vsubq_f32(v19, v17);
      v23.i64[0] = 0xC0000000C0000000;
      v23.i64[1] = 0xC0000000C0000000;
      int8x16_t v24 = vandq_s8(v16, v18);
      int8x16_t v25 = vbicq_s8(v16, v18);
      int32x4_t v26 = (int32x4_t)vandq_s8(v25, v20);
      int8x16_t v27 = vbicq_s8(v25, v20);
      int32x4_t v51 = (int32x4_t)vandq_s8(v27, v21);
      int8x16_t v52 = v24;
      int32x4_t v49 = (int32x4_t)vbicq_s8(v27, v21);
      int8x16_t v50 = (int8x16_t)v26;
      float32x4_t v28 = (float32x4_t)vbslq_s8((int8x16_t)v49, (int8x16_t)vaddq_f32(v22, v19), vbslq_s8((int8x16_t)v51, (int8x16_t)vaddq_f32(v17, v23), vbslq_s8((int8x16_t)v26, (int8x16_t)v22, (int8x16_t)v17)));
      int8x16_t v48 = (int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vorn_s8((int8x8_t)vmovn_s32(v49), vorr_s8((int8x8_t)vmovn_s32(v51), (int8x8_t)vmovn_s32(v26)))), 0x1FuLL));
      float64x2_t v57 = vmulq_f64(vcvtq_f64_f32(vcvt_f32_f64(vmulq_f64(vcvt_hight_f64_f32(v28), v40))), v39);
      float64x2_t __x = vmulq_f64(vcvtq_f64_f32(vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v28.f32), v40))), v39);
      long double v46 = cos(__x.f64[1]);
      v29.f64[0] = cos(__x.f64[0]);
      v29.f64[1] = v46;
      float64x2_t v47 = v29;
      __x.f64[0] = cos(v57.f64[1]);
      v30.f64[0] = cos(v57.f64[0]);
      v30.f64[1] = __x.f64[0];
      float32x4_t v31 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v37, v38, v47)), vmlaq_f64(v37, v38, v30));
      float32x4_t v32 = vmulq_f32(v31, v31);
      float32x4_t v33 = vsqrtq_f32((float32x4_t)vbslq_s8(v48, (int8x16_t)v32, (int8x16_t)vsubq_f32(v56, v32)));
      int16x4_t v34 = vmovn_s32((int32x4_t)vorrq_s8(vorrq_s8((int8x16_t)v49, vorrq_s8(v52, v50)), (int8x16_t)v51));
      if (v34.i8[0]) {
        *(v6 - 2) = v33.f32[0];
      }
      if (v34.i8[2]) {
        *(v6 - 1) = v33.f32[1];
      }
      if (v34.i8[4]) {
        float *v6 = v33.f32[2];
      }
      if (v34.i8[6]) {
        v6[1] = v33.f32[3];
      }
      uint64x2_t v4 = (uint64x2_t)vaddq_s64(v55, v36);
      unint64_t result = (uint64x2_t)vaddq_s64(v54, v36);
      v35.i64[0] = 0x400000004;
      v35.i64[1] = 0x400000004;
      int32x4_t v5 = vaddq_s32(v53, v35);
      v6 += 4;
      v3 -= 4;
    }
    while (v3);
  }
  return result;
}

void std::vector<float>::resize(char **a1, unint64_t a2)
{
  uint64_t v3 = *a1;
  uint64x2_t v4 = a1[1];
  unint64_t v5 = (v4 - *a1) >> 2;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    float32x4_t v19 = &v3[4 * a2];
    goto LABEL_15;
  }
  unint64_t v6 = a2 - v5;
  uint64_t v7 = a1[2];
  if (a2 - v5 <= (v7 - v4) >> 2)
  {
    bzero(a1[1], 4 * v6);
    float32x4_t v19 = &v4[4 * v6];
LABEL_15:
    a1[1] = v19;
    return;
  }
  if (a2 >> 62) {
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v8 = v7 - v3;
  uint64_t v9 = v8 >> 1;
  if (v8 >> 1 <= a2) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v10 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v10);
  uint64_t v12 = *a1;
  uint64_t v13 = a1[1];
  int v14 = &v11[4 * v5];
  int8x16_t v16 = &v11[4 * v15];
  bzero(v14, 4 * v6);
  float32x4_t v17 = &v14[4 * v6];
  while (v13 != v12)
  {
    int v18 = *((_DWORD *)v13 - 1);
    v13 -= 4;
    *((_DWORD *)v14 - 1) = v18;
    v14 -= 4;
  }
  *a1 = v14;
  a1[1] = v17;
  a1[2] = v16;
  if (v12)
  {
    operator delete(v12);
  }
}

void TimeFreqConverter::TimeFreqConverter(TimeFreqConverter *this, int a2, int a3)
{
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 7) = 0u;
  unint64_t v5 = (char *)this + 112;
  *((_OWORD *)this + 10) = 0u;
  *((void *)this + 22) = 0;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  unint64_t v6 = (char *)this + 136;
  uint64_t v7 = (char *)this + 88;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  unsigned int v3 = 2 * a3;
  if (2 * a3)
  {
    if (a3)
    {
      *(_DWORD *)this = 0;
      *((_DWORD *)this + 1) = a2;
      *((_DWORD *)this + 2) = a3;
      *((_DWORD *)this + 3) = a3;
      *((_DWORD *)this + 4) = v3;
      *((_DWORD *)this + 5) = v3;
      *((float *)this + 6) = 1.0 / (float)v3;
      *((_DWORD *)this + 7) = a3 & 0x7FFFFFFF;
      operator new[]();
    }
  }
  exception = __cxa_allocate_exception(0x10uLL);
  v8[23] = 4;
  strcpy(v8, "....");
  caulk::make_string((caulk *)"failed to setup time-frequency converter with error %s", (uint64_t)v9, v8, v5, v6, v7);
  MEMORY[0x24C585530](exception, v9);
}

void sub_24890F2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, void **a11, void **a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  float32x4_t v28 = *v26;
  if (*v26)
  {
    v24[21] = v28;
    operator delete(v28);
  }
  float64x2_t v29 = *a11;
  if (*a11)
  {
    v24[18] = v29;
    operator delete(v29);
  }
  float64x2_t v30 = *a10;
  if (*a10)
  {
    v24[15] = v30;
    operator delete(v30);
  }
  float32x4_t v31 = *a12;
  if (*a12)
  {
    v24[12] = v31;
    operator delete(v31);
  }
  float32x4_t v32 = *v25;
  if (*v25)
  {
    v24[9] = v32;
    operator delete(v32);
  }
  float32x4_t v33 = (std::__shared_weak_count *)v24[5];
  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  }
  _Unwind_Resume(a1);
}

void TimeFreqConverter::~TimeFreqConverter(TimeFreqConverter *this)
{
  uint64_t v2 = *((void *)this + 6);
  if (v2) {
    MEMORY[0x24C585770](v2, 0x1000C8052888210);
  }
  uint64_t v3 = *((void *)this + 7);
  if (v3) {
    MEMORY[0x24C585770](v3, 0x1000C8052888210);
  }
  uint64x2_t v4 = (void *)*((void *)this + 20);
  if (v4)
  {
    *((void *)this + 21) = v4;
    operator delete(v4);
  }
  unint64_t v5 = (void *)*((void *)this + 17);
  if (v5)
  {
    *((void *)this + 18) = v5;
    operator delete(v5);
  }
  unint64_t v6 = (void *)*((void *)this + 14);
  if (v6)
  {
    *((void *)this + 15) = v6;
    operator delete(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 11);
  if (v7)
  {
    *((void *)this + 12) = v7;
    operator delete(v7);
  }
  uint64_t v8 = (void *)*((void *)this + 8);
  if (v8)
  {
    *((void *)this + 9) = v8;
    operator delete(v8);
  }
  uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

uint64_t TimeFreqConverter::Analyze(TimeFreqConverter *this, const float *a2, DSPSplitComplex *a3)
{
  if ((*((_DWORD *)this + 1) | 2) != 2) {
    return 1937006964;
  }
  if (*(_DWORD *)this) {
    return 4294967292;
  }
  memcpy(*((void **)this + 8), (const void *)(*((void *)this + 8) + 4 * *((unsigned int *)this + 3)), 4 * (*((_DWORD *)this + 4) - *((_DWORD *)this + 3)));
  memcpy((void *)(*((void *)this + 8) + 4 * (*((_DWORD *)this + 4) - *((_DWORD *)this + 3))), a2, 4 * *((unsigned int *)this + 3));
  vDSP_vmul(*((const float **)this + 17), 1, *((const float **)this + 8), 1, *((float **)this + 11), 1, *((unsigned int *)this + 4));
  vDSP_vsmul(*((const float **)this + 11), 1, (const float *)this + 6, *((float **)this + 11), 1, *((unsigned int *)this + 4));
  vDSP_ctoz(*((const DSPComplex **)this + 11), 2, a3, 1, (unint64_t)**((unsigned int **)this + 4) >> 1);
  uint64_t v7 = *((void *)this + 4);
  if (!v7) {
    abort();
  }
  vDSP_DFT_Execute(*(const vDSP_DFT_SetupStruct **)(v7 + 8), a3->realp, a3->imagp, a3->realp, a3->imagp);
  float __B = 0.5;
  vDSP_vsmul(a3->realp, 1, &__B, a3->realp, 1, (unint64_t)**((unsigned int **)this + 4) >> 1);
  vDSP_vsmul(a3->imagp, 1, &__B, a3->imagp, 1, (unint64_t)**((unsigned int **)this + 4) >> 1);
  return 0;
}

uint64_t TimeFreqConverter::Synthesize(TimeFreqConverter *this, const DSPSplitComplex *a2, float *a3)
{
  if ((*((_DWORD *)this + 1) - 1) > 1) {
    return 1937006964;
  }
  if (*(_DWORD *)this) {
    return 4294967292;
  }
  MultiRadixRealFFT::RealOutOfPlaceInverseTransform((TimeFreqConverter *)((char *)this + 32), a2, *((DSPComplex **)this + 11));
  vDSP_vmul(*((const float **)this + 11), 1, *((const float **)this + 20), 1, *((float **)this + 11), 1, *((unsigned int *)this + 4));
  vDSP_vadd(*((const float **)this + 11), 1, *((const float **)this + 14), 1, *((float **)this + 14), 1, *((unsigned int *)this + 4));
  memcpy(a3, *((const void **)this + 14), 4 * *((unsigned int *)this + 3));
  memmove(*((void **)this + 14), (const void *)(*((void *)this + 14) + 4 * *((unsigned int *)this + 3)), 4 * (*((_DWORD *)this + 4) - *((_DWORD *)this + 3)));
  bzero((void *)(*((void *)this + 14) + 4 * (*((_DWORD *)this + 4) - *((_DWORD *)this + 3))), 4 * *((unsigned int *)this + 3));
  return 0;
}

void *AudioDSPGraph::Boxes::DenormalEliminatorBox::process(AudioDSPGraph::Boxes::DenormalEliminatorBox *this, unsigned int a2)
{
  if ((*(unsigned int (**)(AudioDSPGraph::Boxes::DenormalEliminatorBox *))(*(void *)this + 48))(this))
  {
    uint64_t v4 = AudioDSPGraph::Box::in(this, 0);
    unint64_t v5 = (void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
    uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6);
    AudioDSPGraph::SimpleABL::copy(v5, *(AudioDSPGraph::SimpleABL **)(*(void *)(v7 + 56) + 80));
  }
  else
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0));
    _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0), StatusReg | 0x1000000);
    uint64_t v9 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v10 = **(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9) + 56) + 80);
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 16 * v10;
      do
      {
        float __B = 0.0;
        uint64_t v13 = AudioDSPGraph::Box::in(this, 0);
        int v14 = *(const float **)(*(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v13 + 40))(v13)
                                                      + 56)
                                          + 80)
                              + v11
                              + 16);
        uint64_t v15 = AudioDSPGraph::Box::out(this, 0);
        uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 40))(v15);
        vDSP_vsadd(v14, 1, &__B, *(float **)(*(void *)(*(void *)(v16 + 56) + 80) + v11 + 16), 1, a2);
        v11 += 16;
      }
      while (v12 != v11);
    }
    _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0), StatusReg);
  }
  uint64_t v17 = AudioDSPGraph::Box::in(this, 0);
  int v18 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v17 + 40))(v17) + 56) + 72);
  uint64_t v19 = AudioDSPGraph::Box::in(this, 0);
  unint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v19 + 40))(v19);
  uint64_t v22 = *((void *)this + 11);
  int8x16_t v21 = (void *)*((void *)this + 12);
  if ((void *)v22 != v21)
  {
    float32x4_t v23 = (_OWORD *)(result[7] + 8);
    unint64_t result = (void *)v22;
    int8x16_t v24 = (void *)v22;
    do
    {
      uint64_t v25 = *v24;
      v24 += 4;
      uint64_t v26 = *(void *)((*(uint64_t (**)(void *))(v25 + 40))(result) + 56);
      long long v28 = v23[2];
      long long v27 = v23[3];
      long long v29 = v23[1];
      *(_OWORD *)(v26 + 8) = *v23;
      *(_OWORD *)(v26 + 24) = v29;
      *(_OWORD *)(v26 + 40) = v28;
      *(_OWORD *)(v26 + 56) = v27;
      *(_DWORD *)(v26 + 72) = v18;
      v22 += 32;
      unint64_t result = v24;
    }
    while (v24 != v21);
  }
  return result;
}

void sub_24890F950(_Unwind_Exception *a1)
{
  _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0), v1);
  _Unwind_Resume(a1);
}

double AudioDSPGraph::Boxes::DenormalEliminatorBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 6.02437133e175;
  *(_OWORD *)a1 = xmmword_24893BEC0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t AudioDSPGraph::Boxes::DenormalEliminatorBox::canProcessInPlace(AudioDSPGraph::Boxes::DenormalEliminatorBox *this)
{
  return 1;
}

uint64_t AudioDSPGraph::Boxes::DenormalEliminatorBox::bypass(uint64_t this, unsigned __int8 a2)
{
  return this;
}

uint64_t AudioDSPGraph::Boxes::DenormalEliminatorBox::isBypassed(AudioDSPGraph::Boxes::DenormalEliminatorBox *this)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)this + 772);
  return v1 & 1;
}

uint64_t AudioDSPGraph::Boxes::DenormalEliminatorBox::canBypass(AudioDSPGraph::Boxes::DenormalEliminatorBox *this)
{
  return 1;
}

const char *AudioDSPGraph::Boxes::DenormalEliminatorBox::ClassName(AudioDSPGraph::Boxes::DenormalEliminatorBox *this)
{
  return "DenormalEliminatorBox";
}

void AudioDSPGraph::Boxes::DenormalEliminatorBox::~DenormalEliminatorBox(AudioDSPGraph::Boxes::DenormalEliminatorBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

uint64_t AudioDSPGraph::RingBufferBox::unconfigureRingBuffer(uint64_t this)
{
  *(void *)(this + 772) = 0;
  return this;
}

uint64_t AudioDSPGraph::RingBufferBox::configureRingBuffer(uint64_t this, int a2, int a3)
{
  *(_DWORD *)(this + 772) = a2;
  *(_DWORD *)(this + 776) = a3;
  return this;
}

uint64_t AudioDSPGraph::RingBufferBox::interleaved(AudioDSPGraph::RingBufferBox *this)
{
  return 0;
}

void AudioDSPGraph::RingBufferBox::reset(AudioDSPGraph::RingBufferBox *this)
{
  if ((*(unsigned int (**)(AudioDSPGraph::RingBufferBox *))(*(void *)this + 696))(this)) {
    int v2 = *((_DWORD *)this + 194);
  }
  else {
    int v2 = 0;
  }

  AudioDSPGraph::RingBuffer::initialize((AudioDSPGraph::RingBufferBox *)((char *)this + 808), v2);
}

void AudioDSPGraph::RingBufferBox::uninitialize(AudioDSPGraph::RingBufferBox *this)
{
  AudioDSPGraph::Box::uninitialize(this);

  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::RingBufferBox *)((char *)this + 808));
}

void AudioDSPGraph::RingBufferBox::initialize(AudioDSPGraph::RingBufferBox *this)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  AudioDSPGraph::Box::initialize(this);
  {
    AudioDSPGraph::getLog(void)::gLog = (uint64_t)os_log_create("com.apple.coreaudio", "AudioDSPGraph");
  }
  int v2 = AudioDSPGraph::getLog(void)::gLog;
  if (os_log_type_enabled((os_log_t)AudioDSPGraph::getLog(void)::gLog, OS_LOG_TYPE_DEBUG))
  {
    int v15 = (*(uint64_t (**)(AudioDSPGraph::RingBufferBox *))(*(void *)this + 648))(this);
    int v16 = *((_DWORD *)this + 194);
    int v17 = *((_DWORD *)this + 193);
    int v18 = (void *)((char *)this + 32);
    if (*((char *)this + 55) < 0) {
      int v18 = (void *)*v18;
    }
    int v19 = 134219010;
    int8x16_t v20 = (char *)this + 808;
    __int16 v21 = 1024;
    int v22 = v15;
    __int16 v23 = 1024;
    int v24 = v16;
    __int16 v25 = 1024;
    int v26 = v17;
    __int16 v27 = 2080;
    long long v28 = v18;
    _os_log_debug_impl(&dword_248903000, v2, OS_LOG_TYPE_DEBUG, "RingBufferBox::initialize %p   ch %u   nz %4u   cap %4u  %s", (uint8_t *)&v19, 0x28u);
  }
  int v3 = (*(uint64_t (**)(AudioDSPGraph::RingBufferBox *))(*(void *)this + 696))(this);
  unsigned int v4 = (*(uint64_t (**)(AudioDSPGraph::RingBufferBox *))(*(void *)this + 648))(this);
  uint64_t v5 = *((unsigned int *)this + 193);
  if (v3)
  {
    uint64_t v6 = *((unsigned int *)this + 194);
    unsigned int v7 = (*(uint64_t (**)(AudioDSPGraph::RingBufferBox *))(*(void *)this + 656))(this);
    int v8 = (*(uint64_t (**)(AudioDSPGraph::RingBufferBox *))(*(void *)this + 640))(this);
    uint64_t v9 = (AudioDSPGraph::RingBufferBox *)((char *)this + 808);
    unsigned int v10 = v4;
    uint64_t v11 = v5;
    uint64_t v12 = v6;
    unsigned int v13 = v7;
  }
  else
  {
    unsigned int v14 = (*(uint64_t (**)(AudioDSPGraph::RingBufferBox *))(*(void *)this + 656))(this);
    int v8 = (*(uint64_t (**)(AudioDSPGraph::RingBufferBox *))(*(void *)this + 640))(this);
    uint64_t v9 = (AudioDSPGraph::RingBufferBox *)((char *)this + 808);
    unsigned int v10 = v4;
    uint64_t v11 = v5;
    uint64_t v12 = 0;
    unsigned int v13 = v14;
  }
  AudioDSPGraph::RingBuffer::alloc(v9, v10, v11, v12, v13, v8);
}

uint64_t AudioDSPGraph::RingBufferBox::hasPresetData(AudioDSPGraph::RingBufferBox *this)
{
  return 0;
}

unint64_t AudioDSPGraph::RingBufferBox::selfLatencyInTicks(AudioDSPGraph::RingBufferBox *this)
{
  uint64_t v1 = *((unsigned int *)this + 194);
  unint64_t v2 = *(void *)(*((void *)this + 1) + 664);
  return v2 / (*(unsigned int (**)(AudioDSPGraph::RingBufferBox *))(*(void *)this + 664))(this) * v1;
}

uint64_t AudioDSPGraph::Box::canProcessInPlace(AudioDSPGraph::Box *this)
{
  return 0;
}

uint64_t AudioDSPGraph::FCBox::isNoOp(AudioDSPGraph::FCBox *this)
{
  uint64_t v2 = AudioDSPGraph::Box::in(this);
  unsigned int v3 = **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
  uint64_t result = 0;
  if (v3 == **(double **)(v5 + 120))
  {
    uint64_t v7 = AudioDSPGraph::Box::in(this);
    int v8 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 40);
    uint64_t v9 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9);
    uint64_t result = 0;
    if (v8 == *(_DWORD *)(*(void *)(v10 + 120) + 40))
    {
      uint64_t v11 = AudioDSPGraph::Box::in(this);
      uint64_t v12 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v11 + 40))(v11) + 120);
      int v13 = *(_DWORD *)(v12 + 8);
      BOOL v15 = v13 != 1718773105 && v13 != 1819304813 && *(_DWORD *)(v12 + 16) != 0;
      uint64_t v16 = AudioDSPGraph::Box::out(this, 0);
      uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16);
      BOOL v18 = 0;
      uint64_t v19 = *(void *)(v17 + 120);
      int v20 = *(_DWORD *)(v19 + 8);
      if (v20 != 1718773105 && v20 != 1819304813) {
        BOOL v18 = *(_DWORD *)(v19 + 16) != 0;
      }
      return v15 ^ v18 ^ 1u;
    }
  }
  return result;
}

uint64_t AudioDSPGraph::FCBox::copyOutput(AudioDSPGraph::FCBox *this, unsigned int a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  unsigned int v5 = a2 / *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 20);
  uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
  *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 72) = 0;
  uint64_t v7 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7);
  AudioDSPGraph::Buffer::setByteSize(*(unsigned int ***)(v8 + 56), *(_DWORD *)(*(void *)(v8 + 56) + 100));
  uint64_t v9 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9);
  if (*((_DWORD *)this + 209) < v5)
  {
    {
      AudioDSPGraph::getLog(void)::gLog = (uint64_t)os_log_create("com.apple.coreaudio", "AudioDSPGraph");
    }
    __int16 v27 = AudioDSPGraph::getLog(void)::gLog;
    if (os_log_type_enabled((os_log_t)AudioDSPGraph::getLog(void)::gLog, OS_LOG_TYPE_FAULT))
    {
      int v28 = *((_DWORD *)this + 209);
      int v29 = *((_DWORD *)this + 206);
      int v30 = *((_DWORD *)this + 210);
      int v31 = *((_DWORD *)this + 211);
      *(_DWORD *)buf = 67110144;
      unsigned int v33 = v5;
      __int16 v34 = 1024;
      int v35 = v28;
      __int16 v36 = 1024;
      int v37 = v29;
      __int16 v38 = 1024;
      int v39 = v30;
      __int16 v40 = 1024;
      int v41 = v31;
      _os_log_fault_impl(&dword_248903000, v27, OS_LOG_TYPE_FAULT, "DSPGraph assertion failure: RingBuffer::read underflow %u > %u (capacity = %u, readPos = %u, writePos = %u)", buf, 0x20u);
    }
    snprintf((char *)buf, 0x400uLL, "DSPGraph assertion failure: RingBuffer::read underflow %u > %u (capacity = %u, readPos = %u, writePos = %u)", v5, *((_DWORD *)this + 209), *((_DWORD *)this + 206), *((_DWORD *)this + 210), *((_DWORD *)this + 211));
    __break(1u);
  }
  AudioDSPGraph::SimpleABL::srcWrapCopy((AudioDSPGraph::FCBox *)((char *)this + 808), (unsigned int **)(*(void *)(v10 + 56) + 80), (*((_DWORD *)this + 210) * *((_DWORD *)this + 208)), *((_DWORD *)this + 208) * v5, 1);
  unsigned int v11 = *((_DWORD *)this + 210) + v5;
  *((_DWORD *)this + 210) = v11;
  unsigned int v12 = *((_DWORD *)this + 207);
  BOOL v13 = v11 >= v12;
  unsigned int v14 = v11 - v12;
  if (v13) {
    *((_DWORD *)this + 210) = v14;
  }
  unsigned int v15 = *((_DWORD *)this + 209) - v5;
  *((_DWORD *)this + 209) = v15;
  if (!v15) {
    *((void *)this + 105) = 0;
  }
  uint64_t v16 = AudioDSPGraph::Box::out(this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16);
  uint64_t v18 = *(void *)(result + 56);
  *(_DWORD *)(v18 + 64) = 1;
  double v19 = *(double *)(*((void *)this + 107) + 256);
  *(double *)(v18 + 8) = v19;
  if (*((unsigned char *)this + 864))
  {
    *(_DWORD *)(v18 + 64) = 3;
    uint64_t v20 = AudioDSPGraph::Box::out(this, 0);
    double v21 = v19
        / (double)**(double **)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 120);
    double v22 = *((double *)this + 110);
    uint64_t v23 = AudioDSPGraph::Box::in(this);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v23 + 40))(v23);
    *(void *)(v18 + 16) = *((void *)this + 109)
                          + llround((v21 - v22 / (double)**(double **)(result + 120)) * 24000000.0);
  }
  __int16 v25 = (uint64_t *)*((void *)this + 25);
  int v24 = (uint64_t *)*((void *)this + 26);
  while (v25 != v24)
  {
    uint64_t v26 = *v25++;
    uint64_t result = AudioDSPGraph::FileRecorder::record(v26);
  }
  return result;
}

uint64_t AudioDSPGraph::FCBox::ringBufferFramesPerPacket(AudioDSPGraph::FCBox *this)
{
  uint64_t v1 = AudioDSPGraph::Box::out(this, 0);
  return *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1) + 120) + 20);
}

uint64_t AudioDSPGraph::FCBox::ringBufferSampleRate(AudioDSPGraph::FCBox *this)
{
  uint64_t v1 = AudioDSPGraph::Box::out(this, 0);
  return **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1) + 120);
}

uint64_t AudioDSPGraph::FCBox::bytesPerPacket(AudioDSPGraph::FCBox *this)
{
  uint64_t v1 = AudioDSPGraph::Box::out(this, 0);
  return *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1) + 120) + 16);
}

uint64_t AudioDSPGraph::FCBox::numChannels(AudioDSPGraph::FCBox *this)
{
  uint64_t v1 = AudioDSPGraph::Box::out(this, 0);
  return *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1) + 120) + 28);
}

uint64_t AudioDSPGraph::FCBox::doProcess(uint64_t this, uint64_t a2)
{
  if (*(unsigned char *)(this + 744))
  {
    uint64_t v3 = this;
    if (atomic_fetch_or((atomic_uint *volatile)(this + 768), 0x80000000))
    {
      uint64_t v4 = *(AudioDSPGraph::ParameterTap **)(this + 152);
      unsigned int v5 = *(AudioDSPGraph::ParameterTap **)(this + 160);
      while (v4 != v5)
      {
        AudioDSPGraph::ParameterTap::process(v4, (AudioDSPGraph::Box *)v3);
        uint64_t v4 = (AudioDSPGraph::ParameterTap *)((char *)v4 + 40);
      }
      uint64_t v6 = *(AudioDSPGraph::PropertyTap **)(v3 + 176);
      uint64_t v7 = *(AudioDSPGraph::PropertyTap **)(v3 + 184);
      while (v6 != v7)
      {
        AudioDSPGraph::PropertyTap::process(v6, (AudioDSPGraph::Box *)v3);
        uint64_t v6 = (AudioDSPGraph::PropertyTap *)((char *)v6 + 64);
      }
      uint64_t v8 = *(caulk::concurrent::details::lf_read_sync_write_impl **)(v3 + 736);
      uint64_t v14 = v3;
      int v15 = a2;
      _ZNK5caulk10concurrent26lf_read_synchronized_writeINSt3__16vectorIN13AudioDSPGraph18RenderObserverListINS4_3BoxEE14RenderObserverENS2_9allocatorIS8_EEEEE6accessIZNS7_7callAllEPS6_jNS4_18RenderCallbackTypeEEUlRKT_E_EEvOSG_(v8, &v14);
      (*(void (**)(uint64_t, uint64_t))(*(void *)v3 + 472))(v3, a2);
      if ((*(unsigned int (**)(uint64_t))(*(void *)v3 + 712))(v3))
      {
        uint64_t v9 = *(uint64_t **)(v3 + 200);
        uint64_t v10 = *(uint64_t **)(v3 + 208);
        while (v9 != v10)
          AudioDSPGraph::FileRecorder::record(*v9++);
      }
      unsigned int v11 = *(AudioDSPGraph::FileInjector ***)(v3 + 224);
      unsigned int v12 = *(AudioDSPGraph::FileInjector ***)(v3 + 232);
      while (v11 != v12)
        AudioDSPGraph::FileInjector::inject(*v11++, a2);
      BOOL v13 = (caulk::concurrent::details::lf_read_sync_write_impl *)(*(void *)(v3 + 736) + 64);
      uint64_t v14 = v3;
      int v15 = a2;
      this = _ZNK5caulk10concurrent26lf_read_synchronized_writeINSt3__16vectorIN13AudioDSPGraph18RenderObserverListINS4_3BoxEE14RenderObserverENS2_9allocatorIS8_EEEEE6accessIZNS7_7callAllEPS6_jNS4_18RenderCallbackTypeEEUlRKT_E_EEvOSG_(v13, &v14);
    }
    else
    {
      this = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)this + 472))(this, a2);
    }
    atomic_fetch_and((atomic_uint *volatile)(v3 + 768), 0x7FFFFFFFu);
  }
  return this;
}

void sub_248910670(_Unwind_Exception *a1)
{
  atomic_fetch_and((atomic_uint *volatile)(v1 + 768), 0x7FFFFFFFu);
  _Unwind_Resume(a1);
}

uint64_t _ZNK5caulk10concurrent26lf_read_synchronized_writeINSt3__16vectorIN13AudioDSPGraph18RenderObserverListINS4_3BoxEE14RenderObserverENS2_9allocatorIS8_EEEEE6accessIZNS7_7callAllEPS6_jNS4_18RenderCallbackTypeEEUlRKT_E_EEvOSG_(caulk::concurrent::details::lf_read_sync_write_impl *a1, uint64_t *a2)
{
  uint64_t v4 = caulk::concurrent::details::lf_read_sync_write_impl::begin_access(a1);
  if (!*((unsigned char *)a1 + v4 + 8))
  {
    __break(1u);
    return MEMORY[0x270F87C18](v4);
  }
  unsigned int v5 = (char *)a1 + 24 * v4;
  uint64_t v6 = *((void *)v5 + 2);
  uint64_t v7 = *((void *)v5 + 3);
  if (v6 == v7) {
    goto LABEL_6;
  }
  do
  {
    int v8 = *((_DWORD *)a2 + 2);
    uint64_t v12 = *a2;
    int v11 = v8;
    uint64_t v9 = *(void *)(v6 + 32);
    if (!v9) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(void *)v9 + 48))(v9, &v12, &v11);
    v6 += 48;
  }
  while (v6 != v7);
  if (a1)
  {
LABEL_6:
    uint64_t v4 = (uint64_t)a1;
    return MEMORY[0x270F87C18](v4);
  }
  return result;
}

void *AudioDSPGraph::FCBox::isogroup(AudioDSPGraph::Box *a1, uint64_t a2, float *a3)
{
  if ((*(unsigned int (**)(AudioDSPGraph::Box *))(*(void *)a1 + 712))(a1))
  {
    return AudioDSPGraph::Box::isogroup(a1, a2, (AudioDSPGraph::IsoGroup *)a3);
  }
  else
  {
    uint64_t result = std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::find<AudioDSPGraph::Box *>(*(void *)a2, *(void *)(a2 + 8), (unint64_t)a1);
    if (!result)
    {
      std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__emplace_unique_key_args<AudioDSPGraph::Box *,AudioDSPGraph::Box *>(a2, (unint64_t)a1, (uint64_t)a1);
      AudioDSPGraph::IsoGroup::add((AudioDSPGraph::IsoGroup *)a3, a1);
      std::__hash_table<AudioDSPGraph::FCBox *,std::hash<AudioDSPGraph::FCBox *>,std::equal_to<AudioDSPGraph::FCBox *>,std::allocator<AudioDSPGraph::FCBox *>>::__emplace_unique_key_args<AudioDSPGraph::FCBox *,AudioDSPGraph::FCBox * const&>(a3 + 34, (unint64_t)a1, (uint64_t)a1);
      *((void *)a1 + 106) = a3;
      uint64_t v7 = *(uint64_t (**)(AudioDSPGraph::Box *, uint64_t, float *))(*(void *)a1 + 424);
      return (void *)v7(a1, a2, a3);
    }
  }
  return result;
}

void *std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::find<AudioDSPGraph::Box *>(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!a2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * (((8 * a3) + 8) ^ HIDWORD(a3));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(a3) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= a2) {
      unint64_t v7 = v5 % a2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (a2 - 1);
  }
  int v8 = *(void **)(a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  uint64_t result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v5 == v10)
      {
        if (result[2] == a3) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= a2) {
            v10 %= a2;
          }
        }
        else
        {
          v10 &= a2 - 1;
        }
        if (v10 != v7) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__emplace_unique_key_args<AudioDSPGraph::Box *,AudioDSPGraph::Box *>(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 8);
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
    int v11 = *(void **)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (size_t i = (void *)*v11; i; size_t i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == a2) {
            return;
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
      }
    }
  }
  uint64_t v14 = operator new(0x18uLL);
  *uint64_t v14 = 0;
  v14[1] = v8;
  v14[2] = a3;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__rehash<true>(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
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
  uint64_t v21 = *(void *)a1;
  double v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *uint64_t v14 = *v22;
LABEL_38:
    *double v22 = v14;
    goto LABEL_39;
  }
  *uint64_t v14 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  *(void *)(v21 + 8 * v3) = a1 + 16;
  if (*v14)
  {
    unint64_t v23 = *(void *)(*v14 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    double v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
}

void sub_248910BAC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__rehash<true>(uint64_t a1, size_t __n)
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
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      float v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unint64_t v5 = operator new(8 * prime);
  unint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  unint64_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    uint64_t v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *unint64_t v8 = *v14;
          *uint64_t v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          uint64_t v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        unint64_t v8 = v14;
        uint64_t v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

uint64_t AudioDSPGraph::FCBox::hasPresetData(AudioDSPGraph::FCBox *this)
{
  return 0;
}

AudioDSPGraph::FCBox *AudioDSPGraph::FCBox::asOperativeFCBox(AudioDSPGraph::FCBox *this)
{
  if ((*(unsigned int (**)(AudioDSPGraph::FCBox *))(*(void *)this + 712))(this)) {
    return 0;
  }
  else {
    return this;
  }
}

uint64_t AudioDSPGraph::FCBox::canProcessInPlace(AudioDSPGraph::FCBox *this)
{
  return (*(uint64_t (**)(void))(*(void *)this + 712))();
}

BOOL AudioDSPGraph::SRCBox::shouldAddRingBufferZeros(AudioDSPGraph::SRCBox *this)
{
  return *((unsigned char *)this + 912) == 0;
}

void AudioDSPGraph::SRCBox::reset(AudioDSPGraph::SRCBox *this)
{
  if (*((unsigned char *)this + 896)) {
    AudioSampleRateConverterReset();
  }
}

void AudioDSPGraph::SRCBox::uninitialize(AudioDSPGraph::SRCBox *this)
{
  if (*((unsigned char *)this + 896))
  {
    AudioSampleRateConverterDispose();
    *((unsigned char *)this + 896) = 0;
  }
}

void AudioDSPGraph::SRCBox::initialize(AudioDSPGraph::SRCBox *this)
{
  AudioDSPGraph::RingBufferBox::initialize(this);
  uint64_t v2 = AudioDSPGraph::Box::out(this, 0);
  unsigned int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
  uint64_t v4 = AudioDSPGraph::Box::in(this);
  double v5 = **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120);
  uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
  double v7 = **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120);
  uint64_t v8 = AudioDSPGraph::Box::in(this, 0);
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 28) != v3)
  {
    std::string::basic_string[abi:ne180100]<0>(&valuePtr, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v28, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v27, "input and output channel counts don't match");
    AudioDSPGraph::ThrowException(1667788321, &valuePtr, 252, &v28, &v27);
  }
  double v9 = (double)v5;
  double v10 = (double)v7;
  if (*((unsigned char *)this + 912))
  {
    CA::AudioSampleRateConverterBuilder::AudioSampleRateConverterBuilder((uint64_t)&v25, 1);
    CA::AudioSampleRateConverterBuilder::SetAttribute<unsigned int>(v26, (const void *)*MEMORY[0x263F28E08], v3);
    CA::AudioSampleRateConverterBuilder::SetAttribute<double>(v26, (const void *)*MEMORY[0x263F28DF8], v9);
    CA::AudioSampleRateConverterBuilder::SetAttribute<double>(v26, (const void *)*MEMORY[0x263F28E10], v10);
    CA::AudioSampleRateConverterBuilder::SetAttribute<unsigned int>(v26, (const void *)*MEMORY[0x263F28E18], *((_DWORD *)this + 227));
    CA::AudioSampleRateConverterBuilder::SetAttribute<double>(v26, (const void *)*MEMORY[0x263F28E00], 0.0);
    CA::AudioSampleRateConverterBuilder::Build((CA::AudioSampleRateConverterBuilder *)&v23);
    if (!v24)
    {
      int v11 = v23;
      std::string::basic_string[abi:ne180100]<0>(&valuePtr, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v28, "initialize");
      uint8x8_t v12 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        uint8x8_t v12 = (void *)*v12;
      }
      caulk::make_string((caulk *)"failed to build \"%s\" sample rate converter", (uint64_t)&v27, v12);
      AudioDSPGraph::ThrowException(v11, &valuePtr, 264, &v28, &v27);
    }
  }
  else
  {
    CA::AudioSampleRateConverterBuilder::AudioSampleRateConverterBuilder((uint64_t)&v25, 0);
    CA::AudioSampleRateConverterBuilder::SetAttribute<unsigned int>(v26, (const void *)*MEMORY[0x263F28E40], v3);
    CA::AudioSampleRateConverterBuilder::SetAttribute<double>(v26, (const void *)*MEMORY[0x263F28E38], v9);
    CA::AudioSampleRateConverterBuilder::SetAttribute<double>(v26, (const void *)*MEMORY[0x263F28E48], v10);
    CA::AudioSampleRateConverterBuilder::SetAttribute<unsigned int>(v26, (const void *)*MEMORY[0x263F28E20], *((_DWORD *)this + 226));
    CA::AudioSampleRateConverterBuilder::SetAttribute<unsigned int>(v26, (const void *)*MEMORY[0x263F28E58], *((_DWORD *)this + 227));
    CA::AudioSampleRateConverterBuilder::SetAttribute<double>(v26, (const void *)*MEMORY[0x263F28E30], 0.0);
    CA::AudioSampleRateConverterBuilder::SetAttribute<unsigned int>(v26, (const void *)*MEMORY[0x263F28E50], 2);
    uint64_t v13 = v26;
    LOBYTE(valuePtr) = 0;
    CFNumberRef v14 = CFNumberCreate(0, kCFNumberCharType, &valuePtr);
    if (!v14)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x263F28E28], v14);
    CFRelease(v14);
    CA::AudioSampleRateConverterBuilder::Build((CA::AudioSampleRateConverterBuilder *)&v23);
    if (!v24)
    {
      int v21 = v23;
      std::string::basic_string[abi:ne180100]<0>(&valuePtr, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v28, "initialize");
      double v22 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        double v22 = (void *)*v22;
      }
      caulk::make_string((caulk *)"failed to build \"%s\" sample rate converter", (uint64_t)&v27, v22);
      AudioDSPGraph::ThrowException(v21, &valuePtr, 280, &v28, &v27);
    }
  }
  if (*((unsigned char *)this + 896))
  {
    uint64_t v15 = *((void *)this + 111);
    uint64_t v16 = v23;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = v23;
    *((unsigned char *)this + 896) = 1;
  }
  uint64_t v23 = v15;
  *((void *)this + 111) = v16;
  caulk::__expected_detail::base<CA::AudioSampleRateConverter,int>::~base((uint64_t)&v23);
  CA::AudioSampleRateConverterBuilder::~AudioSampleRateConverterBuilder((CA::AudioSampleRateConverterBuilder *)&v25);
  uint64_t v17 = *((void *)this + 2);
  unsigned int v18 = *(_DWORD *)(v17 + 268);
  if (v18 == 1) {
    unsigned int v18 = *(_DWORD *)(v17 + 272);
  }
  unsigned int v19 = vcvtpd_u64_f64(v10 * (double)v18 / v9);
  *((_DWORD *)this + 234) = v19;
  AudioDSPGraph::SimpleABL::alloc((AudioDSPGraph::SRCBox *)((char *)this + 920), v3, 4 * v19);
}

void sub_24891137C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (*(char *)(v25 - 49) < 0) {
    operator delete(*(void **)(v25 - 72));
  }
  caulk::__expected_detail::base<CA::AudioSampleRateConverter,int>::~base((uint64_t)&a10);
  CA::AudioSampleRateConverterBuilder::~AudioSampleRateConverterBuilder((CA::AudioSampleRateConverterBuilder *)&a12);
  _Unwind_Resume(a1);
}

uint64_t CA::AudioSampleRateConverterBuilder::AudioSampleRateConverterBuilder(uint64_t a1, int a2)
{
  *(_DWORD *)a1 = a2;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    *(void *)(a1 + 8) = Mutable;
    return a1;
  }
  else
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  return result;
}

void CA::AudioSampleRateConverterBuilder::SetAttribute<unsigned int>(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void sub_248911558(void *a1)
{
}

void CA::AudioSampleRateConverterBuilder::SetAttribute<double>(__CFDictionary *a1, const void *a2, double a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void sub_248911620(void *a1)
{
}

uint64_t CA::AudioSampleRateConverterBuilder::Build(CA::AudioSampleRateConverterBuilder *this)
{
  uint64_t result = AudioSampleRateConverterCreate();
  if (result)
  {
    *(_DWORD *)this = result;
    *((unsigned char *)this + 8) = 0;
  }
  else
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  return result;
}

uint64_t caulk::__expected_detail::base<CA::AudioSampleRateConverter,int>::~base(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    AudioSampleRateConverterDispose();
  }
  return a1;
}

void CA::AudioSampleRateConverterBuilder::~AudioSampleRateConverterBuilder(CA::AudioSampleRateConverterBuilder *this)
{
  uint64_t v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

double AudioDSPGraph::SRCBox::open(AudioDSPGraph::SRCBox *this)
{
  uint64_t v1 = *((void *)this + 1);
  double result = *(double *)(v1 + 888);
  *((double *)this + 113) = result;
  *((unsigned char *)this + 912) = *(unsigned char *)(v1 + 896);
  return result;
}

void *AudioDSPGraph::SRCBox::process(AudioDSPGraph::SRCBox *this, int a2)
{
  if ((*(unsigned int (**)(AudioDSPGraph::SRCBox *))(*(void *)this + 712))(this))
  {
    uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
    CFNumberRef v5 = *(void **)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56);
    uint64_t v6 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6);
    AudioDSPGraph::Buffer::copyFrom(v5, *(void **)(v7 + 56));
  }
  else
  {
    uint64_t v8 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v9 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 56);
    int v10 = *(_DWORD *)(v9 + 64);
    *((unsigned char *)this + 864) = (v10 & 2) != 0;
    if ((v10 & 2) != 0)
    {
      *((void *)this + 109) = *(void *)(v9 + 16);
      *((void *)this + 110) = *(void *)(v9 + 8);
    }
    int v35 = a2;
    int v36 = a2;
    uint64_t v11 = AudioDSPGraph::Box::in(this, 0);
    (*(void (**)(uint64_t))(*(void *)v11 + 40))(v11);
    uint64_t ExpectedNumberOfOutputFrames = AudioSampleRateConverterGetExpectedNumberOfOutputFrames();
    unsigned int v34 = ExpectedNumberOfOutputFrames;
    if (ExpectedNumberOfOutputFrames > *((_DWORD *)this + 234))
    {
      std::string::basic_string[abi:ne180100]<0>(&v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v32, "process");
      long long v27 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        long long v27 = (void *)*v27;
      }
      caulk::make_string((caulk *)"\"%s\" SRC output frame count %u is greater than output buffer frame capacity %u", (uint64_t)&v31, v27, ExpectedNumberOfOutputFrames, *((unsigned int *)this + 234));
      AudioDSPGraph::ThrowException(1718775073, &v33, 438, &v32, &v31);
    }
    unsigned int v13 = AudioSampleRateConverterProcessAudioBufferLists();
    if (v13)
    {
      std::string::basic_string[abi:ne180100]<0>(&v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v32, "process");
      long long v28 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        long long v28 = (void *)*v28;
      }
      caulk::string_from_4cc(&v30, v13);
      if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v29 = &v30;
      }
      else {
        int v29 = (std::string *)v30.__r_.__value_.__r.__words[0];
      }
      caulk::make_string((caulk *)"\"%s\" SRC failed to process with status %s", (uint64_t)&v31, v28, v29);
      AudioDSPGraph::ThrowException(v13, &v33, 445, &v32, &v31);
    }
    AudioDSPGraph::RingBuffer::write((AudioDSPGraph::SRCBox *)((char *)this + 808), v34, (AudioDSPGraph::SRCBox *)((char *)this + 920));
  }
  uint64_t v14 = AudioDSPGraph::Box::in(this, 0);
  int v15 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v14 + 40))(v14) + 56) + 72);
  uint64_t v16 = AudioDSPGraph::Box::in(this, 0);
  double result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16);
  uint64_t v19 = *((void *)this + 11);
  unsigned int v18 = (void *)*((void *)this + 12);
  if ((void *)v19 != v18)
  {
    size_t v20 = (_OWORD *)(result[7] + 8);
    double result = (void *)v19;
    int v21 = (void *)v19;
    do
    {
      uint64_t v22 = *v21;
      v21 += 4;
      uint64_t v23 = *(void *)((*(uint64_t (**)(void *))(v22 + 40))(result) + 56);
      long long v25 = v20[2];
      long long v24 = v20[3];
      long long v26 = v20[1];
      *(_OWORD *)(v23 + 8) = *v20;
      *(_OWORD *)(v23 + 24) = v26;
      *(_OWORD *)(v23 + 40) = v25;
      *(_OWORD *)(v23 + 56) = v24;
      *(_DWORD *)(v23 + 72) = v15;
      v19 += 32;
      double result = v21;
    }
    while (v21 != v18);
  }
  return result;
}

void sub_248911AD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  if (a18 < 0) {
    operator delete(a13);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  if (*(char *)(v30 - 65) < 0) {
    operator delete(*(void **)(v30 - 88));
  }
  _Unwind_Resume(exception_object);
}

std::string *caulk::string_from_4cc(std::string *retstr, unsigned int __val)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = bswap32(__val);
  int v5 = v2;
  if (((char)v2 - 32) > 0x5E
    || (((__int16)v2 >> 8) - 32) > 0x5E
    || ((v2 << 8 >> 24) - 32) > 0x5E
    || ((v2 >> 24) - 32) > 0x5E)
  {
    return std::to_string(retstr, __val);
  }
  __int16 v6 = 39;
  char v4 = 39;
  return (std::string *)std::string::basic_string[abi:ne180100]<0>(retstr, &v4);
}

void sub_248911BF8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t AudioDSPGraph::SRCBox::setProperty(AudioDSPGraph::SRCBox *this, int a2, int a3, unsigned int a4, int a5, _DWORD *a6)
{
  if (a2 > 1835626095)
  {
    if (a2 == 1835626096)
    {
      if (a5 == 4)
      {
        uint64_t v6 = 0;
        *((unsigned char *)this + 912) = *a6 != 0;
        return v6;
      }
      return 561211770;
    }
    if (a2 != 1936876401)
    {
      if (a2 == 1936876385) {
        goto LABEL_5;
      }
      return AudioDSPGraph::Box::setProperty(this, a2, a3, a4, a5, a6);
    }
LABEL_10:
    if (a5 == 4)
    {
      uint64_t v6 = 0;
      *((_DWORD *)this + 227) = *a6;
      return v6;
    }
    return 561211770;
  }
  if (a2 == 26) {
    goto LABEL_10;
  }
  if (a2 != 3014) {
    return AudioDSPGraph::Box::setProperty(this, a2, a3, a4, a5, a6);
  }
LABEL_5:
  if (a5 != 4) {
    return 561211770;
  }
  uint64_t v6 = 0;
  *((_DWORD *)this + 226) = *a6;
  return v6;
}

uint64_t AudioDSPGraph::SRCBox::getProperty(AudioDSPGraph::SRCBox *this, int a2, uint64_t a3, uint64_t a4, unsigned int *a5, CFStringRef *a6)
{
  if (a2 > 1835626095)
  {
    if (a2 == 1835626096)
    {
      if (*a5 == 4)
      {
        uint64_t v6 = 0;
        int v7 = *((unsigned __int8 *)this + 912);
        goto LABEL_14;
      }
      return 561211770;
    }
    if (a2 != 1936876401)
    {
      if (a2 == 1936876385) {
        goto LABEL_5;
      }
      return AudioDSPGraph::Box::getProperty(this, a2, a3, a4, a5, a6);
    }
LABEL_10:
    if (*a5 == 4)
    {
      uint64_t v6 = 0;
      int v7 = *((_DWORD *)this + 227);
      goto LABEL_14;
    }
    return 561211770;
  }
  if (a2 == 26) {
    goto LABEL_10;
  }
  if (a2 != 3014) {
    return AudioDSPGraph::Box::getProperty(this, a2, a3, a4, a5, a6);
  }
LABEL_5:
  if (*a5 != 4) {
    return 561211770;
  }
  uint64_t v6 = 0;
  int v7 = *((_DWORD *)this + 226);
LABEL_14:
  *(_DWORD *)a6 = v7;
  return v6;
}

uint64_t AudioDSPGraph::SRCBox::getPropertyInfo(AudioDSPGraph::SRCBox *this, int a2, int a3)
{
  uint64_t result = 0x100000004;
  if (a2 <= 1835626095)
  {
    if (a2 != 26 && a2 != 3014) {
      return AudioDSPGraph::Box::getPropertyInfo(this, a2, a3);
    }
  }
  else if (a2 != 1835626096 && a2 != 1936876385 && a2 != 1936876401)
  {
    return AudioDSPGraph::Box::getPropertyInfo(this, a2, a3);
  }
  return result;
}

AudioDSPGraph::SRCBox *AudioDSPGraph::SRCBox::asOperativeSRCBox(AudioDSPGraph::SRCBox *this)
{
  if ((*(unsigned int (**)(AudioDSPGraph::SRCBox *))(*(void *)this + 712))(this)) {
    return 0;
  }
  else {
    return this;
  }
}

double AudioDSPGraph::SRCBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.28569068e248;
  *(_OWORD *)a1 = xmmword_24893BE10;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

unint64_t AudioDSPGraph::SRCBox::selfLatencyInTicks(AudioDSPGraph::SRCBox *this)
{
  if ((*(uint64_t (**)(AudioDSPGraph::SRCBox *))(*(void *)this + 712))(this)) {
    return 0;
  }
  if (*((unsigned char *)this + 896)) {
    AudioSampleRateConverterGetLatency();
  }
  else {
    double v3 = 0.0;
  }
  unint64_t v4 = *(void *)(*((void *)this + 1) + 664);
  uint64_t v5 = llround(ceil(v3 * (double)v4));
  if (v5 <= 0) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = -1;
  }
  if (v5 >= 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = *((unsigned int *)this + 194);
  return v7 + v4 / (*(unsigned int (**)(AudioDSPGraph::SRCBox *))(*(void *)this + 664))(this) * v8;
}

const char *AudioDSPGraph::SRCBox::ClassName(AudioDSPGraph::SRCBox *this)
{
  return "src";
}

void AudioDSPGraph::SRCBox::~SRCBox(AudioDSPGraph::SRCBox *this)
{
  *(void *)this = &unk_26FC9B6A0;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SRCBox *)((char *)this + 920));
  std::__optional_destruct_base<CA::AudioSampleRateConverter,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)this + 888);
  *(void *)this = &unk_26FC9C758;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SRCBox *)((char *)this + 808));
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SRCBox *)((char *)this + 808));
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26FC9B6A0;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SRCBox *)((char *)this + 920));
  std::__optional_destruct_base<CA::AudioSampleRateConverter,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)this + 888);
  *(void *)this = &unk_26FC9C758;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SRCBox *)((char *)this + 808));
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SRCBox *)((char *)this + 808));

  AudioDSPGraph::Box::~Box(this);
}

uint64_t std::__optional_destruct_base<CA::AudioSampleRateConverter,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    AudioSampleRateConverterDispose();
  }
  return a1;
}

uint64_t AudioDSPGraph::ReblockerBox::initialize(AudioDSPGraph::ReblockerBox *this)
{
  if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v6, "ReblockerBox has no inputs");
    AudioDSPGraph::ThrowException(1970168609, &v8, 464, &v7, &v6);
  }
  AudioDSPGraph::RingBufferBox::initialize(this);
  uint64_t v2 = AudioDSPGraph::Box::out(this, 0);
  int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
  uint64_t v4 = AudioDSPGraph::Box::in(this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
  if (*(_DWORD *)(*(void *)(result + 120) + 28) != v3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v6, "input and output channel counts don't match");
    AudioDSPGraph::ThrowException(1667788321, &v8, 473, &v7, &v6);
  }
  return result;
}

void sub_248912210(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::ReblockerBox::process(AudioDSPGraph::ReblockerBox *this, unsigned int a2)
{
  if ((*(unsigned int (**)(AudioDSPGraph::ReblockerBox *))(*(void *)this + 712))(this))
  {
    uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v5 = *(void **)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56);
    uint64_t v6 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6);
    AudioDSPGraph::Buffer::copyFrom(v5, *(void **)(v7 + 56));
  }
  else
  {
    uint64_t v8 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8);
    AudioDSPGraph::RingBuffer::write((AudioDSPGraph::ReblockerBox *)((char *)this + 808), a2, (AudioDSPGraph::SimpleABL *)(*(void *)(v9 + 56) + 80));
  }
  uint64_t v10 = AudioDSPGraph::Box::in(this, 0);
  int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 56) + 72);
  uint64_t v12 = AudioDSPGraph::Box::in(this, 0);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12);
  uint64_t v15 = *((void *)this + 11);
  uint64_t v14 = (void *)*((void *)this + 12);
  if ((void *)v15 != v14)
  {
    uint64_t v16 = (_OWORD *)(result[7] + 8);
    uint64_t result = (void *)v15;
    uint64_t v17 = (void *)v15;
    do
    {
      uint64_t v18 = *v17;
      v17 += 4;
      uint64_t v19 = *(void *)((*(uint64_t (**)(void *))(v18 + 40))(result) + 56);
      long long v21 = v16[2];
      long long v20 = v16[3];
      long long v22 = v16[1];
      *(_OWORD *)(v19 + 8) = *v16;
      *(_OWORD *)(v19 + 24) = v22;
      *(_OWORD *)(v19 + 40) = v21;
      *(_OWORD *)(v19 + 56) = v20;
      *(_DWORD *)(v19 + 72) = v11;
      v15 += 32;
      uint64_t result = v17;
    }
    while (v17 != v14);
  }
  return result;
}

double AudioDSPGraph::ReblockerBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.14073544e243;
  *(_OWORD *)a1 = xmmword_24893BE20;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ReblockerBox::ClassName(AudioDSPGraph::ReblockerBox *this)
{
  return "reblocker";
}

void AudioDSPGraph::ReblockerBox::~ReblockerBox(AudioDSPGraph::ReblockerBox *this)
{
  *(void *)this = &unk_26FC9C758;
  uint64_t v2 = (AudioDSPGraph::ReblockerBox *)((char *)this + 808);
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::ReblockerBox *)((char *)this + 808));
  AudioDSPGraph::SimpleABL::free(v2);
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  AudioDSPGraph::SimpleABL *v2;
  uint64_t vars8;

  *(void *)this = &unk_26FC9C758;
  uint64_t v2 = (AudioDSPGraph::ReblockerBox *)((char *)this + 808);
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::ReblockerBox *)((char *)this + 808));
  AudioDSPGraph::SimpleABL::free(v2);

  AudioDSPGraph::Box::~Box(this);
}

void AudioDSPGraph::FreqSRCBox::uninitialize(AudioDSPGraph::FreqSRCBox *this)
{
  AudioDSPGraph::Box::uninitialize(this);
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::FreqSRCBox *)((char *)this + 808));

  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::FreqSRCBox *)((char *)this + 888));
}

void AudioDSPGraph::FreqSRCBox::initialize(AudioDSPGraph::FreqSRCBox *this)
{
  uint64_t v2 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2);
  if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v19, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v18, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v17, "FreqSRCBox has no inputs");
    AudioDSPGraph::ThrowException(1970168609, &v19, 502, &v18, &v17);
  }
  unsigned int v4 = *(_DWORD *)(*(void *)(v3 + 120) + 28);
  uint64_t v5 = AudioDSPGraph::Box::in(this, 0);
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 28) != v4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v19, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v18, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v17, "FreqSRCBox input and output channel counts don't match");
    AudioDSPGraph::ThrowException(1667788321, &v19, 507, &v18, &v17);
  }
  if (!AudioDSPGraph::FreqSRCBox::isValidFreqSRCBoxConnection(this))
  {
    std::string::basic_string[abi:ne180100]<0>(&v19, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v18, "initialize");
    uint64_t v12 = AudioDSPGraph::FCBox::upstreamBlockSize(this);
    uint64_t v13 = AudioDSPGraph::FCBox::upstreamSampleRate(this);
    uint64_t v14 = AudioDSPGraph::FCBox::downstreamBlockSize(this);
    uint64_t v15 = AudioDSPGraph::FCBox::downstreamSampleRate(this);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"FreqSRCBox I/O sample rates and block sizes invalid  %u / %u <> %u / %u", v16, v12, v13, v14, v15);
  }
  if (((*(uint64_t (**)(AudioDSPGraph::FreqSRCBox *))(*(void *)this + 440))(this) & 1) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v19, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v18, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v17, "FreqSRCBox box can not have ring buffer padding zeros");
    AudioDSPGraph::ThrowException(1634628385, &v19, 519, &v18, &v17);
  }
  uint64_t v6 = AudioDSPGraph::Box::in(this);
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120) + 16) != 8
    || (uint64_t v7 = AudioDSPGraph::Box::in(this, 0),
        *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 8) != 1718773105))
  {
    std::string::basic_string[abi:ne180100]<0>(&v19, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v18, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v17, "FreqSRCBox box needs 8 byte packets at input");
    AudioDSPGraph::ThrowException(1718449215, &v19, 525, &v18, &v17);
  }
  uint64_t v8 = AudioDSPGraph::Box::out(this, 0);
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 16) != 8
    || (uint64_t v9 = AudioDSPGraph::Box::out(this, 0),
        *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9) + 120) + 8) != 1718773105))
  {
    std::string::basic_string[abi:ne180100]<0>(&v19, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/SRCBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v18, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v17, "FreqSRCBox box needs 8 byte packets at output");
    AudioDSPGraph::ThrowException(1718449215, &v19, 531, &v18, &v17);
  }
  AudioDSPGraph::RingBufferBox::initialize(this);
  uint64_t v10 = AudioDSPGraph::Box::out(this, 0);
  unsigned int v11 = 8 * *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120) + 40);

  AudioDSPGraph::SimpleABL::alloc((AudioDSPGraph::FreqSRCBox *)((char *)this + 888), v4, v11);
}

void sub_248912A04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (*(char *)(v25 - 33) < 0) {
    operator delete(*(void **)(v25 - 56));
  }
  _Unwind_Resume(exception_object);
}

BOOL AudioDSPGraph::FreqSRCBox::isValidFreqSRCBoxConnection(AudioDSPGraph::FreqSRCBox *this)
{
  uint64_t v2 = AudioDSPGraph::Box::in(this);
  unsigned int v3 = **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  int v5 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 40) * v3;
  uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
  unsigned int v7 = **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120);
  uint64_t v8 = AudioDSPGraph::Box::in(this);
  return v5 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 40)
             * v7;
}

uint64_t AudioDSPGraph::FCBox::upstreamBlockSize(AudioDSPGraph::FCBox *this)
{
  uint64_t v1 = AudioDSPGraph::Box::in(this);
  return *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1) + 120) + 40);
}

uint64_t AudioDSPGraph::FCBox::upstreamSampleRate(AudioDSPGraph::FCBox *this)
{
  uint64_t v1 = AudioDSPGraph::Box::in(this);
  return **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1) + 120);
}

uint64_t AudioDSPGraph::FCBox::downstreamBlockSize(AudioDSPGraph::FCBox *this)
{
  uint64_t v1 = AudioDSPGraph::Box::out(this, 0);
  return *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1) + 120) + 40);
}

uint64_t AudioDSPGraph::FCBox::downstreamSampleRate(AudioDSPGraph::FCBox *this)
{
  uint64_t v1 = AudioDSPGraph::Box::out(this, 0);
  return **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1) + 120);
}

unsigned int *AudioDSPGraph::FreqSRCBox::process(AudioDSPGraph::FreqSRCBox *this)
{
  if (!AudioDSPGraph::FreqSRCBox::isValidFreqSRCBoxConnection(this)) {
    __assert_rtn("process", "SRCBox.cpp", 568, "isValidFreqSRCBoxConnection()");
  }
  uint64_t v2 = AudioDSPGraph::Box::in(this, 0);
  unsigned int v3 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 56) + 80);
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
  uint64_t v6 = *v3;
  if (v6 != **(_DWORD **)(*(void *)(v5 + 56) + 80)) {
    __assert_rtn("process", "SRCBox.cpp", 572, "inBuf->mNumberBuffers == outBuf->mNumberBuffers");
  }
  uint64_t v7 = AudioDSPGraph::Box::out(this, 0);
  unsigned int v8 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 40);
  uint64_t v9 = AudioDSPGraph::Box::in(this);
  unsigned int v54 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9) + 120) + 40);
  unsigned int v55 = v8;
  if (v8 <= v54)
  {
    uint64_t v16 = AudioDSPGraph::Box::out(this, 0);
    size_t v15 = 0;
    int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16) + 120) + 40);
  }
  else
  {
    uint64_t v10 = AudioDSPGraph::Box::in(this);
    int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120) + 40);
    uint64_t v12 = AudioDSPGraph::Box::out(this, 0);
    int v13 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12) + 120) + 40);
    uint64_t v14 = AudioDSPGraph::Box::in(this);
    size_t v15 = (4
                       * (v13
                        - *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v14 + 40))(v14) + 120)
                                    + 40)));
  }
  if (v6)
  {
    size_t v17 = (4 * v11);
    long long v18 = (const void **)(v3 + 4);
    long long v19 = (void **)(*((void *)this + 111) + 16);
    while (1)
    {
      long long v20 = (char *)*v19;
      long long v21 = (char *)*v18;
      uint64_t v22 = AudioDSPGraph::Box::out(this, 0);
      uint64_t v23 = &v20[4
               * *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22) + 120)
                                 + 40)];
      uint64_t v24 = AudioDSPGraph::Box::in(this);
      uint64_t v25 = &v21[4
               * *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v24 + 40))(v24) + 120)
                                 + 40)];
      memcpy(v20, v21, v17);
      uint64_t v26 = AudioDSPGraph::Box::in(this);
      uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)v26 + 40))(v26);
      bzero(&v20[4 * *(unsigned int *)(*(void *)(v27 + 120) + 40)], v15);
      memcpy(v23, v25, v17);
      uint64_t v28 = AudioDSPGraph::Box::in(this);
      uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v28 + 40))(v28);
      bzero(&v23[4 * *(unsigned int *)(*(void *)(v29 + 120) + 40)], v15);
      if (v55 > v54) {
        break;
      }
      uint64_t v33 = AudioDSPGraph::Box::out(this, 0);
      unsigned int v34 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v33 + 40))(v33) + 120) + 40);
      uint64_t v35 = AudioDSPGraph::Box::in(this);
      if (v34 < *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v35 + 40))(v35) + 120) + 40))
      {
        uint64_t v36 = AudioDSPGraph::Box::out(this, 0);
        int v32 = *(_DWORD *)&v21[4
                            * *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v36 + 40))(v36)
                                                          + 120)
                                              + 40)];
        goto LABEL_12;
      }
LABEL_13:
      v18 += 2;
      v19 += 2;
      if (!--v6) {
        goto LABEL_14;
      }
    }
    int v30 = *(_DWORD *)v25;
    uint64_t v31 = AudioDSPGraph::Box::out(this, 0);
    *(_DWORD *)&v20[4
                  * *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31) + 120)
                                    + 40)] = v30;
    int v32 = 0;
LABEL_12:
    *(_DWORD *)uint64_t v23 = v32;
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v37 = AudioDSPGraph::Box::in(this, 0);
  int v38 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v37 + 40))(v37) + 56) + 72);
  uint64_t v39 = AudioDSPGraph::Box::in(this, 0);
  uint64_t v40 = (*(uint64_t (**)(uint64_t))(*(void *)v39 + 40))(v39);
  int v41 = (void *)*((void *)this + 11);
  uint64_t v42 = (void *)*((void *)this + 12);
  if (v41 != v42)
  {
    float32x4_t v43 = (_OWORD *)(*(void *)(v40 + 56) + 8);
    uint64x2_t v44 = (void *)*((void *)this + 11);
    int v45 = v44;
    do
    {
      uint64_t v46 = *v45;
      v45 += 4;
      uint64_t v47 = *(void *)((*(uint64_t (**)(void *))(v46 + 40))(v44) + 56);
      long long v49 = v43[2];
      long long v48 = v43[3];
      long long v50 = v43[1];
      *(_OWORD *)(v47 + 8) = *v43;
      *(_OWORD *)(v47 + 24) = v50;
      *(_OWORD *)(v47 + 40) = v49;
      *(_OWORD *)(v47 + 56) = v48;
      *(_DWORD *)(v47 + 72) = v38;
      v41 += 4;
      uint64x2_t v44 = v45;
    }
    while (v45 != v42);
  }
  uint64_t v51 = AudioDSPGraph::Box::out(this, 0);
  unsigned int v52 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v51 + 40))(v51) + 120) + 40);

  return AudioDSPGraph::RingBuffer::write((AudioDSPGraph::FreqSRCBox *)((char *)this + 808), v52, (AudioDSPGraph::FreqSRCBox *)((char *)this + 888));
}

AudioDSPGraph::FreqSRCBox *AudioDSPGraph::FreqSRCBox::asOperativeFreqSRCBox(AudioDSPGraph::FreqSRCBox *this)
{
  if ((*(unsigned int (**)(AudioDSPGraph::FreqSRCBox *))(*(void *)this + 712))(this)) {
    return 0;
  }
  else {
    return this;
  }
}

double AudioDSPGraph::FreqSRCBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 3.3052639e185;
  *(_OWORD *)a1 = xmmword_24893BE30;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::FreqSRCBox::ClassName(AudioDSPGraph::FreqSRCBox *this)
{
  return "freqsrc";
}

void AudioDSPGraph::FreqSRCBox::~FreqSRCBox(AudioDSPGraph::FreqSRCBox *this)
{
  *(void *)this = &unk_26FC9BCF0;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::FreqSRCBox *)((char *)this + 888));
  *(void *)this = &unk_26FC9C758;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::FreqSRCBox *)((char *)this + 808));
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::FreqSRCBox *)((char *)this + 808));
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26FC9BCF0;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::FreqSRCBox *)((char *)this + 888));
  *(void *)this = &unk_26FC9C758;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::FreqSRCBox *)((char *)this + 808));
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::FreqSRCBox *)((char *)this + 808));

  AudioDSPGraph::Box::~Box(this);
}

void AudioDSPGraph::Interpreter::NewGraph(AudioDSPGraph::Interpreter *this)
{
}

void sub_2489136C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12, std::mutex *a13, uint64_t a14, uint64_t a15, uint64_t a16, _Unwind_Exception *exception_object, uint64_t a18)
{
  std::__hash_table<std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>>>::~__hash_table(v18 + 1016);
  std::__function::__value_func<void ()(double)>::~__value_func[abi:ne180100]((void *)(v18 + 984));
  std::unique_ptr<AudioDSPGraph::Graph::profiler_t>::reset[abi:ne180100]((uint64_t *)(v18 + 976));
  std::vector<AudioDSPGraph::Graph::GraphBridge>::__destroy_vector::operator()[abi:ne180100]((void ***)&a18);
  *(void *)(v18 + 904) = v19;
  std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>>>::~__hash_table(v20);
  a18 = a10;
  std::vector<std::unique_ptr<AudioDSPGraph::Subset>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a18);
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table(v25);
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table(a11);
  std::__hash_table<std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioDSPGraph::Box *>>>::~__hash_table(v24);
  std::unique_ptr<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>>::reset[abi:ne180100](v22, 0);
  std::__hash_table<std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioDSPGraph::Box *>>>::~__hash_table(v18 + 608);
  std::__hash_table<std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioDSPGraph::Box *>>>::~__hash_table(v23);
  std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>>>::~__hash_table(v18 + 528);
  std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>>>::~__hash_table(v18 + 488);
  uint64_t v26 = *(void **)(v18 + 464);
  if (v26)
  {
    *(void *)(v18 + 472) = v26;
    operator delete(v26);
  }
  uint64_t v27 = *v21;
  if (*v21)
  {
    *(void *)(v18 + 448) = v27;
    operator delete(v27);
  }
  if (*(char *)(v18 + 431) < 0) {
    operator delete(*a12);
  }
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table(v18 + 368);
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table(v18 + 328);
  uint64_t v28 = *(void **)(v18 + 304);
  if (v28)
  {
    *(void *)(v18 + 312) = v28;
    operator delete(v28);
  }
  uint64_t v29 = (void **)(v18 + 256);
  int v30 = *(void **)(v18 + 280);
  if (v30)
  {
    *(void *)(v18 + 288) = v30;
    operator delete(v30);
  }
  uint64_t v31 = *v29;
  if (*v29)
  {
    *(void *)(v18 + 264) = v31;
    operator delete(v31);
  }
  std::__hash_table<std::unique_ptr<AudioDSPGraph::IsoGroup>,std::hash<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::equal_to<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::allocator<std::unique_ptr<AudioDSPGraph::IsoGroup>>>::~__hash_table(v18 + 216);
  a18 = v18 + 192;
  std::vector<std::unique_ptr<AudioDSPGraph::InternalBuffer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a18);
  std::mutex::~mutex(a13);
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table(a14);
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table(a15);
  std::__hash_table<std::unique_ptr<AudioDSPGraph::Box>,std::hash<std::unique_ptr<AudioDSPGraph::Box>>,std::equal_to<std::unique_ptr<AudioDSPGraph::Box>>,std::allocator<std::unique_ptr<AudioDSPGraph::Box>>>::~__hash_table(a16);
  MEMORY[0x24C585790](v18, 0x10B3C40EA1821C8);
  _Unwind_Resume(a1);
}

void AudioDSPGraph::Interpreter::parseBoxCommand(AudioDSPGraph::Interpreter *this, const char **a2, unint64_t *a3)
{
  unsigned int v52 = 0;
  AudioDSPGraph::Interpreter::parseUInt64((AudioDSPGraph::Interpreter *)a2, (const char **)&v52, a3);
  v50[0] = 0;
  v50[1] = 0;
  uint64_t v51 = 0;
  if ((AudioDSPGraph::Interpreter::parseString((unsigned char **)a2, (uint64_t)v50) & 1) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v55, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v54, "parseBoxCommand");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"expected name in 'box' command: %s", v40, *a2);
  }
  v48[0] = 0;
  v48[1] = 0;
  int v49 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v47 = 0;
  int v45 = *a2;
  if (AudioDSPGraph::Interpreter::parseString((unsigned char **)&v45, (uint64_t)__p)
    && AudioDSPGraph::NewBoxRegistry::has((uint64_t)this + 16, (uint64_t)__p))
  {
    *a2 = v45;
    int v6 = 1;
  }
  else
  {
    AudioDSPGraph::skipspace((unsigned char **)a2);
    v43.__r_.__value_.__r.__words[0] = (std::string::size_type)*a2;
    AudioDSPGraph::skipspace(&v43.__r_.__value_.__l.__data_);
    if (*v43.__r_.__value_.__l.__data_ != 40)
    {
      std::string::basic_string[abi:ne180100]<0>(&v55, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v54, "parseBoxCommand");
      AudioDSPGraph::strprintf((AudioDSPGraph *)"expected class name or component description in 'box' command: %s", v41, *a2);
    }
    ++v43.__r_.__value_.__r.__words[0];
    if ((AudioDSPGraph::Interpreter::parse4cc((AudioDSPGraph::Interpreter *)&v43, (const char **)v48, v7) & 1) == 0)
    {
      std::string::basic_string[abi:ne180100]<0>(&v55, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v54, "parseCompDesc");
      std::string::basic_string[abi:ne180100]<0>(&v53, "expected component type or subtype");
      AudioDSPGraph::ThrowException(1886548769, (long long *)&v55, 487, &v54, (long long *)&v53);
    }
    if ((AudioDSPGraph::Interpreter::parse4cc((AudioDSPGraph::Interpreter *)&v43, (const char **)((char *)v48 + 4), v8) & 1) == 0)
    {
      int v10 = (int)v48[0];
      LODWORD(v48[0]) = 1635083896;
      HIDWORD(v48[0]) = v10;
    }
    if ((AudioDSPGraph::Interpreter::parse4cc((AudioDSPGraph::Interpreter *)&v43, (const char **)&v48[1], v9) & 1) == 0) {
      LODWORD(v48[1]) = 1634758764;
    }
    AudioDSPGraph::skipspace(&v43.__r_.__value_.__l.__data_);
    int v11 = (char *)v43.__r_.__value_.__r.__words[0];
    if (*v43.__r_.__value_.__l.__data_ != 41)
    {
      std::string::basic_string[abi:ne180100]<0>(&v55, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v54, "parseCompDesc");
      AudioDSPGraph::strprintf((AudioDSPGraph *)"expected ')' at end of component description, got '%c'", v42, *v11);
    }
    int v6 = 0;
    *a2 = (const char *)(v43.__r_.__value_.__r.__words[0] + 1);
  }
  uint64x2_t v44 = 0;
  if ((AudioDSPGraph::Interpreter::parseUInt32((AudioDSPGraph::Interpreter *)a2, (const char **)((char *)&v44 + 4), v5) & 1) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v55, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v54, "parseBoxCommand");
    std::string::basic_string[abi:ne180100]<0>(&v53, "expected number of inputs in 'box' command");
    AudioDSPGraph::ThrowException(1886548769, (long long *)&v55, 1056, &v54, (long long *)&v53);
  }
  if ((AudioDSPGraph::Interpreter::parseUInt32((AudioDSPGraph::Interpreter *)a2, (const char **)&v44, v12) & 1) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v55, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v54, "parseBoxCommand");
    std::string::basic_string[abi:ne180100]<0>(&v53, "expected number of outputs in 'box' command");
    AudioDSPGraph::ThrowException(1886548769, (long long *)&v55, 1060, &v54, (long long *)&v53);
  }
  if (v6)
  {
    if (!AudioDSPGraph::NewBoxRegistry::has((uint64_t)this + 16, (uint64_t)__p))
    {
      std::string::basic_string[abi:ne180100]<0>(&v55, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v54, "parseBoxCommand");
      std::operator+<char>();
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v53, &v43, "' not found");
      AudioDSPGraph::ThrowException(1852204065, (long long *)&v55, 1067, &v54, (long long *)&v53);
    }
    int v13 = std::__hash_table<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::find<std::string>((void *)this + 3, (unsigned __int8 *)__p);
    if (v13) {
      unint64_t v14 = std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(*((void *)v13 + 8), SHIDWORD(v44), (int)v44);
    }
    else {
      unint64_t v14 = 0;
    }
    uint64_t v18 = *((void *)this + 1);
    if (v51 >= 0) {
      uint64_t v19 = (char *)v50;
    }
    else {
      uint64_t v19 = (char *)v50[0];
    }
  }
  else
  {
    *(_OWORD *)&v55.__r_.__value_.__l.__data_ = *(_OWORD *)v48;
    LODWORD(v55.__r_.__value_.__r.__words[2]) = v49;
    if (!std::__hash_table<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<AudioComponentDescription>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,true>,std::__unordered_map_equal<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,std::hash<AudioComponentDescription>,true>,std::allocator<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::find<AudioComponentDescription>((void *)this + 8, (unsigned int *)&v55))
    {
      uint64_t v16 = *((void *)this + 1);
      if (v51 >= 0) {
        size_t v17 = (char *)v50;
      }
      else {
        size_t v17 = (char *)v50[0];
      }
      std::string::basic_string[abi:ne180100]<0>(&v43, v17);
      if (!*(unsigned char *)(v16 + 729)) {
        operator new();
      }
      std::string::basic_string[abi:ne180100]<0>(&v55, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Graph.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v54, "add");
      std::string::basic_string[abi:ne180100]<0>(&v53, "graph is configured");
      AudioDSPGraph::ThrowException(1667655457, (long long *)&v55, 992, &v54, (long long *)&v53);
    }
    size_t v15 = std::__hash_table<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<AudioComponentDescription>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,true>,std::__unordered_map_equal<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,std::hash<AudioComponentDescription>,true>,std::allocator<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::find<AudioComponentDescription>((void *)this + 8, (unsigned int *)v48);
    if (v15) {
      unint64_t v14 = std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(v15[8], SHIDWORD(v44), (int)v44);
    }
    else {
      unint64_t v14 = 0;
    }
    uint64_t v18 = *((void *)this + 1);
    if (v51 >= 0) {
      uint64_t v19 = (char *)v50;
    }
    else {
      uint64_t v19 = (char *)v50[0];
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&v55, v19);
  AudioDSPGraph::Graph::add(v18, v14, &v55);
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v55.__r_.__value_.__l.__data_);
  }
  uint64_t v20 = *((void *)this + 25);
  if (v20 != *((void *)this + 24))
  {
    long long v21 = *(void **)(v20 - 8);
    uint64_t v22 = *(void **)(v14 + 24);
    if (v22 != v21)
    {
      if (v22)
      {
        int8x8_t v23 = (int8x8_t)v22[4];
        if (v23)
        {
          unint64_t v24 = 0x9DDFEA08EB382D69 * (((8 * v14) + 8) ^ HIDWORD(v14));
          unint64_t v25 = 0x9DDFEA08EB382D69 * (HIDWORD(v14) ^ (v24 >> 47) ^ v24);
          unint64_t v26 = 0x9DDFEA08EB382D69 * (v25 ^ (v25 >> 47));
          uint8x8_t v27 = (uint8x8_t)vcnt_s8(v23);
          v27.i16[0] = vaddlv_u8(v27);
          if (v27.u32[0] > 1uLL)
          {
            unint64_t v28 = v26;
            if (v26 >= *(void *)&v23) {
              unint64_t v28 = v26 % *(void *)&v23;
            }
          }
          else
          {
            unint64_t v28 = v26 & (*(void *)&v23 - 1);
          }
          uint64_t v29 = v22[3];
          int v30 = *(void ***)(v29 + 8 * v28);
          if (v30)
          {
            uint64_t v31 = *v30;
            if (*v30)
            {
              uint64_t v32 = *(void *)&v23 - 1;
              do
              {
                unint64_t v33 = v31[1];
                if (v33 == v26)
                {
                  if (v31[2] == v14)
                  {
                    if (v27.u32[0] > 1uLL)
                    {
                      if (v26 >= *(void *)&v23) {
                        v26 %= *(void *)&v23;
                      }
                    }
                    else
                    {
                      v26 &= v32;
                    }
                    unsigned int v34 = *(void **)(v29 + 8 * v26);
                    do
                    {
                      uint64_t v35 = v34;
                      unsigned int v34 = (void *)*v34;
                    }
                    while (v34 != v31);
                    if (v35 == v22 + 5) {
                      goto LABEL_75;
                    }
                    unint64_t v36 = v35[1];
                    if (v27.u32[0] > 1uLL)
                    {
                      if (v36 >= *(void *)&v23) {
                        v36 %= *(void *)&v23;
                      }
                    }
                    else
                    {
                      v36 &= v32;
                    }
                    if (v36 != v26)
                    {
LABEL_75:
                      if (!*v31) {
                        goto LABEL_76;
                      }
                      unint64_t v37 = *(void *)(*v31 + 8);
                      if (v27.u32[0] > 1uLL)
                      {
                        if (v37 >= *(void *)&v23) {
                          v37 %= *(void *)&v23;
                        }
                      }
                      else
                      {
                        v37 &= v32;
                      }
                      if (v37 != v26) {
LABEL_76:
                      }
                        *(void *)(v29 + 8 * v26) = 0;
                    }
                    uint64_t v38 = *v31;
                    if (*v31)
                    {
                      unint64_t v39 = *(void *)(v38 + 8);
                      if (v27.u32[0] > 1uLL)
                      {
                        if (v39 >= *(void *)&v23) {
                          v39 %= *(void *)&v23;
                        }
                      }
                      else
                      {
                        v39 &= v32;
                      }
                      if (v39 != v26)
                      {
                        *(void *)(v22[3] + 8 * v39) = v35;
                        uint64_t v38 = *v31;
                      }
                    }
                    void *v35 = v38;
                    *uint64_t v31 = 0;
                    --v22[6];
                    operator delete(v31);
                    break;
                  }
                }
                else
                {
                  if (v27.u32[0] > 1uLL)
                  {
                    if (v33 >= *(void *)&v23) {
                      v33 %= *(void *)&v23;
                    }
                  }
                  else
                  {
                    v33 &= v32;
                  }
                  if (v33 != v28) {
                    break;
                  }
                }
                uint64_t v31 = (void *)*v31;
              }
              while (v31);
            }
          }
        }
      }
      *(void *)(v14 + 24) = v21;
      if (v21) {
        std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__emplace_unique_key_args<AudioDSPGraph::Box *,AudioDSPGraph::Box * const&>((uint64_t)(v21 + 3), v14, v14);
      }
    }
  }
  if (SHIBYTE(v47) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v51) < 0) {
    operator delete(v50[0]);
  }
}

void sub_248914050(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a39 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v39 - 81) < 0) {
    operator delete(*(void **)(v39 - 104));
  }
  if (*(char *)(v39 - 57) < 0) {
    operator delete(*(void **)(v39 - 80));
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Interpreter::parseUInt64(AudioDSPGraph::Interpreter *this, const char **a2, unint64_t *a3)
{
  AudioDSPGraph::skipspace((unsigned char **)this);
  __endptr = 0;
  unint64_t v5 = strtoul(*(const char **)this, &__endptr, 10);
  int v6 = __endptr;
  if (__endptr == *(char **)this) {
    return 0;
  }
  uint64_t v7 = (const char *)v5;
  if (v5 == -1)
  {
    if (*__error()) {
      return 0;
    }
  }
  *a2 = v7;
  *(void *)this = v6;
  return 1;
}

uint64_t AudioDSPGraph::Interpreter::parseString(unsigned char **a1, uint64_t a2)
{
  AudioDSPGraph::skipspace(a1);
  AudioDSPGraph::skipspace(a1);
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v4 = *a1;
  unsigned int v5 = (char)**a1;
  if ((v5 & 0x80000000) != 0)
  {
    int v6 = __maskrune(v5, 0x100uLL);
    uint64_t v4 = *a1;
    LOBYTE(v5) = **a1;
    if (v6) {
      goto LABEL_11;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v5 + 60) & 0x100) != 0)
  {
LABEL_11:
    std::string::push_back((std::string *)a2, v5);
    int v9 = v4[1];
    unsigned int v8 = v4 + 1;
    char v7 = v9;
    if (v9)
    {
      uint64_t v10 = MEMORY[0x263EF8318];
      while (1)
      {
        int v11 = v7;
        if (v7 < 0)
        {
          if (!__maskrune(v7, 0x500uLL))
          {
LABEL_17:
            if (!memchr("_-+=|./:!@#$%^&*<>?~", v11, 0x15uLL)) {
              goto LABEL_31;
            }
          }
        }
        else if ((*(_DWORD *)(v10 + 4 * v7 + 60) & 0x500) == 0)
        {
          goto LABEL_17;
        }
        std::string::push_back((std::string *)a2, v11);
        int v12 = *++v8;
        char v7 = v12;
        if (!v12) {
          goto LABEL_31;
        }
      }
    }
    goto LABEL_31;
  }
  if (v5 == 95) {
    goto LABEL_11;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  int v13 = *a1;
  if (**a1 != 34) {
    return 0;
  }
  for (i = *a1; ; int v13 = i)
  {
    int v16 = *++i;
    int v15 = v16;
    if (v16 == 34) {
      break;
    }
    if (v15 == 10 || v15 == 0)
    {
      std::string::basic_string[abi:ne180100]<0>(&v21, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v20, "parseString");
      std::string::basic_string[abi:ne180100]<0>(&v19, "unterminated string");
      AudioDSPGraph::ThrowException(1886548769, &v21, 402, &v20, &v19);
    }
    std::string::push_back((std::string *)a2, v15);
  }
  unsigned int v8 = v13 + 2;
LABEL_31:
  *a1 = v8;
  return 1;
}

void sub_2489144A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

BOOL AudioDSPGraph::NewBoxRegistry::has(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(a1 + 8);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  unsigned int v3 = std::__hash_table<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::find<std::string>(v2, (unsigned __int8 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3 != 0;
}

uint64_t AudioDSPGraph::Interpreter::parseUInt32(AudioDSPGraph::Interpreter *this, const char **a2, unsigned int *a3)
{
  uint64_t v5 = *(void *)this;
  unint64_t v7 = 0;
  uint64_t v8 = v5;
  uint64_t result = AudioDSPGraph::Interpreter::parseUInt64((AudioDSPGraph::Interpreter *)&v8, (const char **)&v7, (unint64_t *)a3);
  if (result)
  {
    if (HIDWORD(v7))
    {
      return 0;
    }
    else
    {
      *(_DWORD *)a2 = v7;
      *(void *)this = v8;
      return 1;
    }
  }
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)a2);
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
  uint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  for (size_t i = *v10; i; size_t i = *(unsigned __int8 **)i)
  {
    unint64_t v12 = *((void *)i + 1);
    if (v6 == v12)
    {
      if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, a2)) {
        return i;
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
        return 0;
      }
    }
  }
  return i;
}

uint64_t std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, int a2, int a3)
{
  int v5 = a2;
  int v4 = a3;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *, int *))(*(void *)a1 + 48))(a1, &v5, &v4);
}

uint64_t *std::__hash_table<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<AudioComponentDescription>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,true>,std::__unordered_map_equal<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,std::hash<AudioComponentDescription>,true>,std::allocator<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::find<AudioComponentDescription>(void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = a2[1] + (unint64_t)*a2 + a2[2];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = a2[1] + (unint64_t)*a2 + a2[2];
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v3 == v8)
    {
      if (result[2] == *(void *)a2 && *((_DWORD *)result + 6) == (unint64_t)a2[2]) {
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
  }
  return result;
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v1 < 0;
  if (v1 >= 0) {
    uint8x8_t v4 = (uint64_t *)a1;
  }
  else {
    uint8x8_t v4 = *(uint64_t **)a1;
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
      int v16 = v4 + 2;
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

uint64_t AudioDSPGraph::skipspace(unsigned char **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = MEMORY[0x263EF8318];
  do
  {
    unsigned int v4 = (char)*v2;
    if ((v4 & 0x80000000) != 0) {
      uint64_t result = __maskrune((char)*v2, 0x4000uLL);
    }
    else {
      uint64_t result = *(_DWORD *)(v3 + 4 * v4 + 60) & 0x4000;
    }
    BOOL v6 = v4 == 10 || result == 0;
    char v7 = !v6;
    if (v6)
    {
      if (v4 != 59) {
        return result;
      }
      uint64_t v2 = *a1;
      do
      {
        int v8 = *v2;
        if (!*v2) {
          break;
        }
        *a1 = ++v2;
      }
      while (v8 != 10);
    }
    else
    {
      uint64_t v2 = *a1 + 1;
      *a1 = v2;
    }
  }
  while ((v7 & 1) != 0);
  return result;
}

uint64_t AudioDSPGraph::Interpreter::parse4cc(AudioDSPGraph::Interpreter *this, const char **a2, unsigned int *a3)
{
  AudioDSPGraph::skipspace((unsigned char **)this);
  uint64_t v5 = 0;
  uint64_t v6 = MEMORY[0x263EF8318];
  while (1)
  {
    int v7 = AudioDSPGraph::is4ccChar(*(char *)(*(void *)this + v5));
    int v9 = *(unsigned char **)this;
    if (!v7) {
      break;
    }
    unsigned int v10 = (char)v9[v5];
    if ((v10 & 0x80000000) != 0) {
      int v11 = __maskrune(v10, 0x100uLL);
    }
    else {
      int v11 = *(_DWORD *)(v6 + 4 * v10 + 60) & 0x100;
    }
    ++v5;
    if (v11) {
      goto LABEL_11;
    }
  }
  unint64_t v18 = 0;
  uint64_t v19 = v9;
  if (AudioDSPGraph::Interpreter::parseUInt64((AudioDSPGraph::Interpreter *)&v19, (const char **)&v18, v8))
  {
    int v12 = v18;
    if (!HIDWORD(v18))
    {
      BOOL v13 = v19;
LABEL_16:
      *(_DWORD *)a2 = v12;
      *(void *)this = v13;
      return 1;
    }
  }
LABEL_11:
  uint64_t v14 = 0;
  int v12 = 0;
  uint64_t v15 = *(unsigned char **)this;
  while (1)
  {
    unsigned __int8 v16 = v15[v14];
    uint64_t result = AudioDSPGraph::is4ccChar((char)v16);
    if (!result) {
      return result;
    }
    int v12 = v16 | (v12 << 8);
    if (++v14 == 4)
    {
      BOOL v13 = v15 + 4;
      if ((AudioDSPGraph::is4ccChar((char)v15[4]) & 1) == 0) {
        goto LABEL_16;
      }
      return 0;
    }
  }
}

uint64_t AudioDSPGraph::is4ccChar(unsigned int this)
{
  if (this >= 0x80)
  {
    uint64_t result = __maskrune(this, 0x40000uLL);
    if (!result) {
      return result;
    }
    if (!__maskrune(this, 0x4000uLL)) {
      return memchr("()[]{}\";", this, 9uLL) == 0;
    }
    return 0;
  }
  int v3 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * this + 60);
  if ((v3 & 0x40000) == 0 || (v3 & 0x4000) != 0) {
    return 0;
  }
  return memchr("()[]{}\";", this, 9uLL) == 0;
}

void AudioDSPGraph::Interpreter::~Interpreter(AudioDSPGraph::Interpreter *this)
{
  AudioDSPGraph::Interpreter::~Interpreter(this);

  JUMPOUT(0x24C585790);
}

{
  void *v2;
  uint64_t v3;
  void **v4;

  *(void *)this = &unk_26FC98E30;
  uint64_t v2 = (void *)*((void *)this + 24);
  if (v2)
  {
    *((void *)this + 25) = v2;
    operator delete(v2);
  }
  *((void *)this + 2) = &unk_26FC98E60;
  unsigned int v4 = (void **)((char *)this + 104);
  std::vector<std::pair<std::string,AudioComponentDescription>>::__destroy_vector::operator()[abi:ne180100](&v4);
  std::__hash_table<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<AudioComponentDescription>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,true>,std::__unordered_map_equal<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,std::hash<AudioComponentDescription>,true>,std::allocator<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table((uint64_t)this + 64);
  std::__hash_table<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table((uint64_t)this + 24);
  int v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
}

void std::vector<std::pair<std::string,AudioComponentDescription>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  int v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    unsigned int v4 = (void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 25) < 0) {
          operator delete(*(v4 - 6));
        }
        v4 -= 6;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<AudioComponentDescription>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,true>,std::__unordered_map_equal<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,std::hash<AudioComponentDescription>,true>,std::allocator<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      int v3 = (void *)*v2;
      std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v2 + 5);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  unsigned int v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      int v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  unsigned int v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,0>(uint64_t a1)
{
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100]((void *)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void *std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](void *a1)
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

void AudioDSPGraph::NewBoxRegistry::print(int a1, void *a2, int a3, unsigned int a4)
{
}

const char *AudioDSPGraph::NewBoxRegistry::ClassName(AudioDSPGraph::NewBoxRegistry *this)
{
  return "NewBoxRegistry";
}

void AudioDSPGraph::NewBoxRegistry::~NewBoxRegistry(AudioDSPGraph::NewBoxRegistry *this)
{
  *(void *)this = &unk_26FC98E60;
  uint64_t v2 = (char *)this + 8;
  int v3 = (void **)((char *)this + 88);
  std::vector<std::pair<std::string,AudioComponentDescription>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::__hash_table<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<AudioComponentDescription>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,true>,std::__unordered_map_equal<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,std::hash<AudioComponentDescription>,true>,std::allocator<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table((uint64_t)this + 48);
  std::__hash_table<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table((uint64_t)v2);

  JUMPOUT(0x24C585790);
}

{
  char *v2;
  void **v3;

  *(void *)this = &unk_26FC98E60;
  uint64_t v2 = (char *)this + 8;
  int v3 = (void **)((char *)this + 88);
  std::vector<std::pair<std::string,AudioComponentDescription>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::__hash_table<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<AudioComponentDescription>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,true>,std::__unordered_map_equal<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,AudioDSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,std::hash<AudioComponentDescription>,true>,std::allocator<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table((uint64_t)this + 48);
  std::__hash_table<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table((uint64_t)v2);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  int v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v1 + 5);
    }
    operator delete(v1);
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  int v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

void AudioDSPGraph::NewBoxRegistry::add(uint64_t a1, uint64_t a2, unsigned int *a3, void *a4)
{
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 16);
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
    uint64_t v14 = *(unsigned __int8 ***)(*(void *)(a1 + 8) + 8 * v4);
    if (v14)
    {
      for (size_t i = *v14; i; size_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, (unsigned __int8 *)a2)) {
            goto LABEL_77;
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
  uint64_t v17 = (void *)(a1 + 24);
  unint64_t v18 = operator new(0x48uLL);
  v89 = (unsigned __int8 *)v18;
  v90.i64[0] = a1 + 24;
  v90.i8[8] = 0;
  *unint64_t v18 = 0;
  v18[1] = v10;
  uint64_t v19 = (std::string *)(v18 + 2);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v19, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v19->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v18[4] = *(void *)(a2 + 16);
  }
  v18[8] = 0;
  v90.i8[8] = 1;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 32) + 1);
  float v21 = *(float *)(a1 + 40);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      int8x8_t prime = (int8x8_t)v24;
    }
    else {
      int8x8_t prime = (int8x8_t)v23;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v11 = *(void *)(a1 + 16);
    if (*(void *)&prime > v11) {
      goto LABEL_33;
    }
    if (*(void *)&prime < v11)
    {
      unint64_t v32 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 32) / *(float *)(a1 + 40));
      if (v11 < 3 || (uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v11), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        unint64_t v32 = std::__next_prime(v32);
      }
      else
      {
        uint64_t v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2) {
          unint64_t v32 = v34;
        }
      }
      if (*(void *)&prime <= v32) {
        int8x8_t prime = (int8x8_t)v32;
      }
      if (*(void *)&prime >= v11)
      {
        unint64_t v11 = *(void *)(a1 + 16);
      }
      else
      {
        if (prime)
        {
LABEL_33:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v26 = operator new(8 * *(void *)&prime);
          uint64_t v27 = *(void **)(a1 + 8);
          *(void *)(a1 + 8) = v26;
          if (v27) {
            operator delete(v27);
          }
          uint64_t v28 = 0;
          *(int8x8_t *)(a1 + 16) = prime;
          do
            *(void *)(*(void *)(a1 + 8) + 8 * v28++) = 0;
          while (*(void *)&prime != v28);
          uint64_t v29 = (void *)*v17;
          if (*v17)
          {
            unint64_t v30 = v29[1];
            uint8x8_t v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(void *)&prime) {
                v30 %= *(void *)&prime;
              }
            }
            else
            {
              v30 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(a1 + 8) + 8 * v30) = v17;
            unint64_t v35 = (void *)*v29;
            if (*v29)
            {
              do
              {
                unint64_t v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(void *)&prime) {
                    v36 %= *(void *)&prime;
                  }
                }
                else
                {
                  v36 &= *(void *)&prime - 1;
                }
                if (v36 != v30)
                {
                  uint64_t v37 = *(void *)(a1 + 8);
                  if (!*(void *)(v37 + 8 * v36))
                  {
                    *(void *)(v37 + 8 * v36) = v29;
                    goto LABEL_58;
                  }
                  *uint64_t v29 = *v35;
                  void *v35 = **(void **)(*(void *)(a1 + 8) + 8 * v36);
                  **(void **)(*(void *)(a1 + 8) + 8 * v36) = v35;
                  unint64_t v35 = v29;
                }
                unint64_t v36 = v30;
LABEL_58:
                uint64_t v29 = v35;
                unint64_t v35 = (void *)*v35;
                unint64_t v30 = v36;
              }
              while (v35);
            }
          }
          unint64_t v11 = (unint64_t)prime;
          goto LABEL_62;
        }
        v87 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = 0;
        if (v87) {
          operator delete(v87);
        }
        unint64_t v11 = 0;
        *(void *)(a1 + 16) = 0;
      }
    }
LABEL_62:
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
  unint64_t v38 = *(unsigned __int8 ***)(*(void *)(a1 + 8) + 8 * v4);
  size_t i = v89;
  if (v38)
  {
    *(void *)v89 = *v38;
LABEL_75:
    *unint64_t v38 = i;
    goto LABEL_76;
  }
  *(void *)v89 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = i;
  *(void *)(*(void *)(a1 + 8) + 8 * v4) = v17;
  if (*(void *)i)
  {
    unint64_t v39 = *(void *)(*(void *)i + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v39 >= v11) {
        v39 %= v11;
      }
    }
    else
    {
      v39 &= v11 - 1;
    }
    unint64_t v38 = (unsigned __int8 **)(*(void *)(a1 + 8) + 8 * v39);
    goto LABEL_75;
  }
LABEL_76:
  v89 = 0;
  ++*(void *)(a1 + 32);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v89);
LABEL_77:
  std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator=((void *)i + 5, a4);
  unint64_t v40 = a3[1] + (unint64_t)*a3 + a3[2];
  unint64_t v41 = *(void *)(a1 + 56);
  if (v41)
  {
    uint8x8_t v42 = (uint8x8_t)vcnt_s8((int8x8_t)v41);
    v42.i16[0] = vaddlv_u8(v42);
    if (v42.u32[0] > 1uLL)
    {
      unint64_t v10 = a3[1] + (unint64_t)*a3 + a3[2];
      if (v40 >= v41) {
        unint64_t v10 = v40 % v41;
      }
    }
    else
    {
      unint64_t v10 = (v41 - 1) & v40;
    }
    uint64_t v43 = *(unsigned __int8 ***)(*(void *)(a1 + 48) + 8 * v10);
    if (v43)
    {
      for (j = *v43; j; j = *(unsigned __int8 **)j)
      {
        unint64_t v45 = *((void *)j + 1);
        if (v45 == v40)
        {
          if (*((void *)j + 2) == *(void *)a3 && *((_DWORD *)j + 6) == (unint64_t)a3[2]) {
            goto LABEL_154;
          }
        }
        else
        {
          if (v42.u32[0] > 1uLL)
          {
            if (v45 >= v41) {
              v45 %= v41;
            }
          }
          else
          {
            v45 &= v41 - 1;
          }
          if (v45 != v10) {
            break;
          }
        }
      }
    }
  }
  uint64_t v47 = (void *)(a1 + 64);
  uint64_t v48 = (unsigned __int8 *)operator new(0x48uLL);
  v89 = v48;
  v90.i64[0] = a1 + 64;
  *(void *)uint64_t v48 = 0;
  *((void *)v48 + 1) = v40;
  *((_OWORD *)v48 + 1) = *(_OWORD *)a3;
  *((_DWORD *)v48 + 8) = a3[4];
  *((void *)v48 + 8) = 0;
  v90.i8[8] = 1;
  float v49 = (float)(unint64_t)(*(void *)(a1 + 72) + 1);
  float v50 = *(float *)(a1 + 80);
  if (!v41 || (float)(v50 * (float)v41) < v49)
  {
    BOOL v51 = 1;
    if (v41 >= 3) {
      BOOL v51 = (v41 & (v41 - 1)) != 0;
    }
    unint64_t v52 = v51 | (2 * v41);
    unint64_t v53 = vcvtps_u32_f32(v49 / v50);
    if (v52 <= v53) {
      int8x8_t v54 = (int8x8_t)v53;
    }
    else {
      int8x8_t v54 = (int8x8_t)v52;
    }
    if (*(void *)&v54 == 1)
    {
      int8x8_t v54 = (int8x8_t)2;
    }
    else if ((*(void *)&v54 & (*(void *)&v54 - 1)) != 0)
    {
      int8x8_t v54 = (int8x8_t)std::__next_prime(*(void *)&v54);
      unint64_t v41 = *(void *)(a1 + 56);
    }
    if (*(void *)&v54 > v41) {
      goto LABEL_110;
    }
    if (*(void *)&v54 < v41)
    {
      unint64_t v61 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 72) / *(float *)(a1 + 80));
      if (v41 < 3 || (uint8x8_t v62 = (uint8x8_t)vcnt_s8((int8x8_t)v41), v62.i16[0] = vaddlv_u8(v62), v62.u32[0] > 1uLL))
      {
        unint64_t v61 = std::__next_prime(v61);
      }
      else
      {
        uint64_t v63 = 1 << -(char)__clz(v61 - 1);
        if (v61 >= 2) {
          unint64_t v61 = v63;
        }
      }
      if (*(void *)&v54 <= v61) {
        int8x8_t v54 = (int8x8_t)v61;
      }
      if (*(void *)&v54 >= v41)
      {
        unint64_t v41 = *(void *)(a1 + 56);
      }
      else
      {
        if (v54)
        {
LABEL_110:
          if (*(void *)&v54 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v55 = operator new(8 * *(void *)&v54);
          uint64_t v56 = *(void **)(a1 + 48);
          *(void *)(a1 + 48) = v55;
          if (v56) {
            operator delete(v56);
          }
          uint64_t v57 = 0;
          *(int8x8_t *)(a1 + 56) = v54;
          do
            *(void *)(*(void *)(a1 + 48) + 8 * v57++) = 0;
          while (*(void *)&v54 != v57);
          uint64_t v58 = (void *)*v47;
          if (*v47)
          {
            unint64_t v59 = v58[1];
            uint8x8_t v60 = (uint8x8_t)vcnt_s8(v54);
            v60.i16[0] = vaddlv_u8(v60);
            if (v60.u32[0] > 1uLL)
            {
              if (v59 >= *(void *)&v54) {
                v59 %= *(void *)&v54;
              }
            }
            else
            {
              v59 &= *(void *)&v54 - 1;
            }
            *(void *)(*(void *)(a1 + 48) + 8 * v59) = v47;
            uint64_t v64 = (void *)*v58;
            if (*v58)
            {
              do
              {
                unint64_t v65 = v64[1];
                if (v60.u32[0] > 1uLL)
                {
                  if (v65 >= *(void *)&v54) {
                    v65 %= *(void *)&v54;
                  }
                }
                else
                {
                  v65 &= *(void *)&v54 - 1;
                }
                if (v65 != v59)
                {
                  uint64_t v66 = *(void *)(a1 + 48);
                  if (!*(void *)(v66 + 8 * v65))
                  {
                    *(void *)(v66 + 8 * v65) = v58;
                    goto LABEL_135;
                  }
                  *uint64_t v58 = *v64;
                  *uint64_t v64 = **(void **)(*(void *)(a1 + 48) + 8 * v65);
                  **(void **)(*(void *)(a1 + 48) + 8 * v65) = v64;
                  uint64_t v64 = v58;
                }
                unint64_t v65 = v59;
LABEL_135:
                uint64_t v58 = v64;
                uint64_t v64 = (void *)*v64;
                unint64_t v59 = v65;
              }
              while (v64);
            }
          }
          unint64_t v41 = (unint64_t)v54;
          goto LABEL_139;
        }
        v88 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = 0;
        if (v88) {
          operator delete(v88);
        }
        unint64_t v41 = 0;
        *(void *)(a1 + 56) = 0;
      }
    }
LABEL_139:
    if ((v41 & (v41 - 1)) != 0)
    {
      if (v40 >= v41) {
        unint64_t v10 = v40 % v41;
      }
      else {
        unint64_t v10 = v40;
      }
    }
    else
    {
      unint64_t v10 = (v41 - 1) & v40;
    }
  }
  uint64_t v67 = *(unsigned __int8 ***)(*(void *)(a1 + 48) + 8 * v10);
  j = v89;
  if (v67)
  {
    *(void *)v89 = *v67;
LABEL_152:
    *uint64_t v67 = j;
    goto LABEL_153;
  }
  *(void *)v89 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = j;
  *(void *)(*(void *)(a1 + 48) + 8 * v10) = v47;
  if (*(void *)j)
  {
    unint64_t v68 = *(void *)(*(void *)j + 8);
    if ((v41 & (v41 - 1)) != 0)
    {
      if (v68 >= v41) {
        v68 %= v41;
      }
    }
    else
    {
      v68 &= v41 - 1;
    }
    uint64_t v67 = (unsigned __int8 **)(*(void *)(a1 + 48) + 8 * v68);
    goto LABEL_152;
  }
LABEL_153:
  v89 = 0;
  ++*(void *)(a1 + 72);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<AudioComponentDescription,std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v89);
LABEL_154:
  std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator=((void *)j + 5, a4);
  unint64_t v69 = *(void *)(a1 + 104);
  unint64_t v70 = *(void *)(a1 + 96);
  if (v70 >= v69)
  {
    unint64_t v72 = *(void *)(a1 + 88);
    unint64_t v73 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v70 - v72) >> 4);
    unint64_t v74 = v73 + 1;
    if (v73 + 1 > 0x555555555555555) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v75 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v69 - v72) >> 4);
    if (2 * v75 > v74) {
      unint64_t v74 = 2 * v75;
    }
    if (v75 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v76 = 0x555555555555555;
    }
    else {
      unint64_t v76 = v74;
    }
    uint64_t v92 = a1 + 104;
    if (v76)
    {
      if (v76 > 0x555555555555555) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v77 = (unsigned __int8 *)operator new(48 * v76);
    }
    else
    {
      unint64_t v77 = 0;
    }
    unint64_t v80 = (std::string *)&v77[16 * ((uint64_t)(v70 - v72) >> 4)];
    v89 = v77;
    v90.i64[0] = (uint64_t)v80;
    v90.i64[1] = (uint64_t)v80;
    v91 = (char *)&v77[48 * v76];
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v80, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
      unint64_t v72 = *(void *)(a1 + 88);
      unint64_t v70 = *(void *)(a1 + 96);
      unint64_t v81 = (char *)v90.i64[1];
      unint64_t v80 = (std::string *)v90.i64[0];
    }
    else
    {
      *(_OWORD *)&v80->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      v80->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
      unint64_t v81 = (char *)&v77[16 * ((uint64_t)(v70 - v72) >> 4)];
    }
    int v82 = (char *)&v77[48 * v73];
    *(_OWORD *)(v82 + 24) = *(_OWORD *)a3;
    *((_DWORD *)v82 + 10) = a3[4];
    unint64_t v79 = v81 + 48;
    if (v70 == v72)
    {
      int64x2_t v85 = vdupq_n_s64(v72);
    }
    else
    {
      do
      {
        long long v83 = *(_OWORD *)(v70 - 48);
        v80[-2].__r_.__value_.__r.__words[2] = *(void *)(v70 - 32);
        *(_OWORD *)&v80[-2].__r_.__value_.__l.__data_ = v83;
        *(void *)(v70 - 40) = 0;
        *(void *)(v70 - 32) = 0;
        *(void *)(v70 - 48) = 0;
        long long v84 = *(_OWORD *)(v70 - 24);
        LODWORD(v80[-1].__r_.__value_.__r.__words[2]) = *(_DWORD *)(v70 - 8);
        *(_OWORD *)&v80[-1].__r_.__value_.__l.__data_ = v84;
        v80 -= 2;
        v70 -= 48;
      }
      while (v70 != v72);
      int64x2_t v85 = *(int64x2_t *)(a1 + 88);
    }
    *(void *)(a1 + 88) = v80;
    *(void *)(a1 + 96) = v79;
    int64x2_t v90 = v85;
    v86 = *(char **)(a1 + 104);
    *(void *)(a1 + 104) = v91;
    v91 = v86;
    v89 = (unsigned __int8 *)v85.i64[0];
    std::__split_buffer<std::pair<std::string,AudioComponentDescription>>::~__split_buffer((uint64_t)&v89);
  }
  else
  {
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(a1 + 96), *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    }
    else
    {
      long long v71 = *(_OWORD *)a2;
      *(void *)(v70 + 16) = *(void *)(a2 + 16);
      *(_OWORD *)unint64_t v70 = v71;
    }
    long long v78 = *(_OWORD *)a3;
    *(_DWORD *)(v70 + 40) = a3[4];
    *(_OWORD *)(v70 + 24) = v78;
    unint64_t v79 = (char *)(v70 + 48);
    *(void *)(a1 + 96) = v70 + 48;
  }
  *(void *)(a1 + 96) = v79;
}

void sub_248915E74(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::pair<std::string,AudioComponentDescription>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>(uint64_t a1, char *a2, unsigned int a3, int a4, int a5, int a6)
{
  v18[4] = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  v13[0] = 1668183148;
  v13[1] = a3;
  uint64_t v14 = 1633841016;
  int v15 = 0;
  uint8x8_t v12 = operator new(0x20uLL);
  void *v12 = &unk_26FC98E98;
  v12[1] = a2;
  *((_DWORD *)v12 + 4) = a3;
  *((_DWORD *)v12 + 5) = a4;
  *((_DWORD *)v12 + 6) = a5;
  *((_DWORD *)v12 + 7) = a6;
  v18[3] = v12;
  AudioDSPGraph::NewBoxRegistry::add(a1, (uint64_t)__p, v13, v18);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v18);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
}

void sub_248915FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void _ZNSt3__110__function6__funcIZZN13AudioDSPGraph14NewBoxRegistryC1EvENK3__0clIPKciNS2_5Boxes14CalculationBox14OperatorDomainENS9_16OperatorCodomainENS9_8OperatorEEEDaT_T0_T1_T2_T3_EUljjE_NS_9allocatorISJ_EEFPNS2_3BoxEjjEEclEOjSQ_(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (!*a2)
  {
    if (!*a3) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v5, "operator()");
    caulk::make_string((caulk *)"wrong number of output for '%s' box (must be 0)", (uint64_t)&v4, *(void *)(a1 + 8));
    AudioDSPGraph::ThrowException(1701602593, &v6, 1902, &v5, &v4);
  }
  std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v5, "operator()");
  caulk::make_string((caulk *)"wrong number of inputs for '%s' box (must be 0)", (uint64_t)&v4, *(void *)(a1 + 8));
  AudioDSPGraph::ThrowException(1701602593, &v6, 1898, &v5, &v4);
}

void sub_248916198(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

__n128 _ZNKSt3__110__function6__funcIZZN13AudioDSPGraph14NewBoxRegistryC1EvENK3__0clIPKciNS2_5Boxes14CalculationBox14OperatorDomainENS9_16OperatorCodomainENS9_8OperatorEEEDaT_T0_T1_T2_T3_EUljjE_NS_9allocatorISJ_EEFPNS2_3BoxEjjEE7__cloneEPNS0_6__baseISO_EE(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26FC98E98;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 _ZNKSt3__110__function6__funcIZZN13AudioDSPGraph14NewBoxRegistryC1EvENK3__0clIPKciNS2_5Boxes14CalculationBox14OperatorDomainENS9_16OperatorCodomainENS9_8OperatorEEEDaT_T0_T1_T2_T3_EUljjE_NS_9allocatorISJ_EEFPNS2_3BoxEjjEE7__cloneEv(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26FC98E98;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

void _ZNSt3__110__function6__funcIZZN13AudioDSPGraph14NewBoxRegistryC1EvENK3__0clIPKciNS2_5Boxes14CalculationBox14OperatorDomainENS9_16OperatorCodomainENS9_8OperatorEEEDaT_T0_T1_T2_T3_EUljjE_NS_9allocatorISJ_EEFPNS2_3BoxEjjEED0Ev()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_31,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_31>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 1)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for SingleRateLPCMConverterBox. must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1886, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for SingleRateLPCMConverterBox. must be 1.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1883, &v4, &v3);
}

void sub_2489163E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_31,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_31>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C330;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_31,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_31>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C330;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_31,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_31>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_30,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_30>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 1)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for NonFiniteProtectionBox. must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1874, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for NonFiniteProtectionBox. must be 1.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1870, &v4, &v3);
}

void sub_248916630(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_30,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_30>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C2E8;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_30,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_30>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C2E8;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_30,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_30>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_29,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_29>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()()
{
}

void sub_2489167B8(_Unwind_Exception *a1)
{
  MEMORY[0x24C585790](v1, 0x10F3C40C7A618E7);
  _Unwind_Resume(a1);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_29,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_29>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C2A0;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_29,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_29>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C2A0;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_29,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_29>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_28,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_28>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 1)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for MantissaRandomizerBox (must be 1)");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1857, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for MantissaRandomizerBox (must be 1)");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1853, &v4, &v3);
}

void sub_2489169C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_28,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_28>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C258;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_28,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_28>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C258;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_28,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_28>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_27,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_27>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 1)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for DenormalEliminatorBox (must be 1)");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1845, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for DenormalEliminatorBox (must be 1)");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1841, &v4, &v3);
}

void sub_248916BE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_27,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_27>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C210;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_27,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_27>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C210;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_27,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_27>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_26,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_26>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()()
{
}

void sub_248916D44(_Unwind_Exception *a1)
{
  MEMORY[0x24C585790](v1, 0x10F3C40C16BE0E1);
  _Unwind_Resume(a1);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_26,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_26>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C1C8;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_26,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_26>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C1C8;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_26,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_26>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_25,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_25>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()()
{
}

void sub_248916E5C(_Unwind_Exception *a1)
{
  MEMORY[0x24C585790](v1, 0x10F3C408EDD2FDCLL);
  _Unwind_Resume(a1);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_25,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_25>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C180;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_25,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_25>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C180;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_25,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_25>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_24,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_24>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()()
{
}

void sub_248916F60(_Unwind_Exception *a1)
{
  MEMORY[0x24C585790](v1, 0x10F3C40614663B3);
  _Unwind_Resume(a1);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_24,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_24>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C138;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_24,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_24>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C138;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_24,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_24>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_23,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_23>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()()
{
}

void sub_248917074(_Unwind_Exception *a1)
{
  MEMORY[0x24C585790](v1, 0x10F3C40AB73B33ELL);
  _Unwind_Resume(a1);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_23,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_23>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C0F0;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_23,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_23>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C0F0;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_23,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_23>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_22,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_22>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()()
{
}

void sub_248917174(_Unwind_Exception *a1)
{
  MEMORY[0x24C585790](v1, 0x10F3C40614663B3);
  _Unwind_Resume(a1);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_22,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_22>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C0A8;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_22,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_22>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C0A8;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_22,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_22>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_21,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_21>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()()
{
}

void sub_248917278(_Unwind_Exception *a1)
{
  MEMORY[0x24C585790](v1, 0x10F3C40614663B3);
  _Unwind_Resume(a1);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_21,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_21>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C060;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_21,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_21>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C060;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_21,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_21>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_20,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_20>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()()
{
}

void sub_24891737C(_Unwind_Exception *a1)
{
  MEMORY[0x24C585790](v1, 0x10F3C40614663B3);
  _Unwind_Resume(a1);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_20,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_20>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9C018;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_20,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_20>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9C018;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_20,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_20>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_19,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_19>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 != 1 || *a3 != 1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v5, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v4, "TimeFreqBox number of inputs and outputs must be one.");
    AudioDSPGraph::ThrowException(1701602593, &v6, 1798, &v5, &v4);
  }
  operator new();
}

void sub_2489174F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_19,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_19>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9BFD0;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_19,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_19>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9BFD0;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_19,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_19>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_18,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_18>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 != 1 || *a3 != 1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v5, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v4, "FreqSRCBox number of inputs and outputs must be one.");
    AudioDSPGraph::ThrowException(1701602593, &v6, 1790, &v5, &v4);
  }
  operator new();
}

void sub_2489176EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_18,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_18>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9BCA8;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_18,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_18>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9BCA8;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_18,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_18>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_17,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_17>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 != 1 || *a3 != 1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v5, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v4, "ReblockerBox number of inputs and outputs must be one.");
    AudioDSPGraph::ThrowException(1701602593, &v6, 1782, &v5, &v4);
  }
  operator new();
}

void sub_2489178D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_17,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_17>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9B980;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_17,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_17>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9B980;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_17,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_17>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_16,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_16>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 != 1 || *a3 != 1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v5, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v4, "SRCBox number of inputs and outputs must be one.");
    AudioDSPGraph::ThrowException(1701602593, &v6, 1774, &v5, &v4);
  }
  operator new();
}

void sub_248917AE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_16,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_16>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9B658;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_16,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_16>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9B658;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_16,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_16>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_15,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_15>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()()
{
}

void sub_248917C4C(_Unwind_Exception *a1)
{
  MEMORY[0x24C585790](v1, 0x10F3C4012623749);
  _Unwind_Resume(a1);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_15,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_15>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9B610;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_15,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_15>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9B610;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_15,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_15>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_14,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_14>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a3 == 1)
  {
    if (*a2) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "AverageBox number of inputs cannot be 0.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1764, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "AverageBox number of outputs must be 1");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1760, &v4, &v3);
}

void sub_248917E08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_14,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_14>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9B5C8;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_14,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_14>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9B5C8;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_14,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_14>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_13,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_13>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a3 == 1)
  {
    if (*a2) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "MixBox number of inputs cannot be zero.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1752, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for MixBox. must be 1.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1747, &v4, &v3);
}

void sub_248918050(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<float>::vector(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    long long v6 = (_DWORD *)a1[1];
    int v7 = &v6[a2];
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

void sub_248918158(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
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
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_13,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_13>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9B580;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_13,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_13>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9B580;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_13,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_13>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_12,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_12>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a3 == 1)
  {
    if (*a2) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "SumBox number of inputs cannot be zero.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1740, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for SumBox. must be 1.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1735, &v4, &v3);
}

void sub_24891834C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_12,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_12>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9B538;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_12,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_12>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9B538;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_12,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_12>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_11,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_11>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 1)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for CopyBox. must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1728, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for CopyBox. must be 1.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1725, &v4, &v3);
}

void sub_248918560(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_11,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_11>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9B4F0;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_11,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_11>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9B4F0;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_11,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_11>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_10,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_10>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 1)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for DBGainBox. must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1718, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for DBGainBox. must be 1.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1715, &v4, &v3);
}

void sub_2489187A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_10,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_10>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9B4A8;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_10,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_10>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9B4A8;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_10,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_10>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_9,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_9>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 1)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for VectorGainBox. must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1708, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for VectorGainBox. must be 1.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1705, &v4, &v3);
}

void sub_2489189D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_9,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_9>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9B460;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_9,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_9>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9B460;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_9,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_9>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_8,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_8>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 1)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for arithmetic abs box. must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1698, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for arithmetic abs box. must be 1.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1695, &v4, &v3);
}

void sub_248918BF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_8,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_8>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9B418;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_8,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_8>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26FC9B418;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_8,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_8>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_7,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_7>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 2)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for arithmetic sum box. must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1688, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for arithmetic sum box. must be 2.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1685, &v4, &v3);
}

void sub_248918E18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticSumBox>::initialize(AudioDSPGraph::Box *a1)
{
  AudioDSPGraph::Box::initialize(a1);
  if (((*((void *)a1 + 9) - *((void *)a1 + 8)) & 0x1FFFFFFFE0) == 0x40
    && ((*((void *)a1 + 12) - *((void *)a1 + 11)) & 0x1FFFFFFFE0) == 0x20)
  {
    uint64_t v2 = AudioDSPGraph::Box::in(a1, 0);
    int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
    uint64_t v4 = AudioDSPGraph::Box::in(a1, 1);
    if (v3 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 28))
    {
      uint64_t v5 = AudioDSPGraph::Box::in(a1, 0);
      int v6 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 28);
      uint64_t v7 = AudioDSPGraph::Box::out(a1, 0);
      if (v6 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 28))
      {
        uint64_t v8 = AudioDSPGraph::Box::in(a1, 0);
        int v9 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 8);
        uint64_t v10 = AudioDSPGraph::Box::in(a1, 1);
        int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120) + 8);
        if (v9 != 1819304813 || v11 != 1819304813)
        {
          if (v9 == 1819304813 && v11 != 1819304813) {
            operator new();
          }
          operator new();
        }
        operator new();
      }
      std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
      std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
      uint64_t v20 = AudioDSPGraph::Box::in(a1, 0);
      uint64_t v21 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 120) + 28);
      uint64_t v22 = AudioDSPGraph::Box::out(a1, 0);
      uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22);
      AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v24, v21, *(unsigned int *)(*(void *)(v23 + 120) + 28));
    }
    std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
    uint64_t v15 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v16 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v15 + 40))(v15) + 120) + 28);
    uint64_t v17 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 40))(v17);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v19, v16, *(unsigned int *)(*(void *)(v18 + 120) + 28));
  }
  std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
  std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
  AudioDSPGraph::strprintf((AudioDSPGraph *)"There must be two inputs and one output, instead of %u and %u.", v14, (*((void *)a1 + 9) - *((void *)a1 + 8)) >> 5, (*((void *)a1 + 12) - *((void *)a1 + 11)) >> 5);
}

void sub_248919374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In1ExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In0ExpectedSampleSize()
{
  return 8;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::process(int a1, vDSP_Length __N, float *a3, float *a4, float *a5)
{
  __A.realp = a3;
  __A.imagp = &a3[__N];
  __B.realp = a4;
  __B.imagp = &a4[__N];
  v5.realp = a5;
  v5.imagp = &a5[__N];
  vDSP_zvadd(&__A, 1, &__B, 1, &v5, 1, __N);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::In1ExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::In0ExpectedSampleSize()
{
  return 8;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::process(int a1, vDSP_Length __N, float *a3, const float *__B, float *a5)
{
  __A.realp = a3;
  __A.imagp = &a3[__N];
  v5.realp = a5;
  v5.imagp = &a5[__N];
  vDSP_zrvadd(&__A, 1, __B, 1, &v5, 1, __N);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In1ExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In0ExpectedSampleSize()
{
  return 4;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::process(int a1, vDSP_Length __N, const float *a3, float *a4, float *a5)
{
  __A.realp = a4;
  __A.imagp = &a4[__N];
  v5.realp = a5;
  v5.imagp = &a5[__N];
  vDSP_zrvadd(&__A, 1, a3, 1, &v5, 1, __N);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::OutExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In1ExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In0ExpectedSampleSize()
{
  return 4;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::process(int a1, vDSP_Length __N, const float *__A, const float *__B, float *a5)
{
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticSumBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticSumBox>::process(AudioDSPGraph::Box *a1, uint64_t a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in(a1, 0);
  DSPSplitComplex v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::in(a1, 1);
  uint64_t v7 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8);
  if (*v5 != *v7)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v31 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v32 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31) + 120) + 28);
    uint64_t v33 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v34 = (*(uint64_t (**)(uint64_t))(*(void *)v33 + 40))(v33);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v35, v32, *(unsigned int *)(*(void *)(v34 + 120) + 28));
  }
  uint64_t v10 = *(_DWORD **)(*(void *)(v9 + 56) + 80);
  if (*v5 != *v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v36 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v37 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v36 + 40))(v36) + 120) + 28);
    uint64_t v38 = AudioDSPGraph::Box::out(a1, 0);
    uint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 40))(v38);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v40, v37, *(unsigned int *)(*(void *)(v39 + 120) + 28));
  }
  unsigned int v11 = v5[3];
  if (v11 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v41 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 0 should be at least %u bytes, but is %u.", v42, (v41 * a2), v5[3]);
  }
  unsigned int v12 = v7[3];
  if (v12 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v43 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 1 should be at least %u bytes, but is %u.", v44, (v43 * a2), v7[3]);
  }
  uint64_t v13 = *v5;
  if (v13)
  {
    uint64_t v14 = v10 + 4;
    uint64_t v15 = (uint64_t *)(v7 + 4);
    uint64_t v16 = (uint64_t *)(v5 + 4);
    do
    {
      uint64_t v18 = *v16;
      v16 += 2;
      uint64_t v17 = v18;
      uint64_t v19 = *v15;
      v15 += 2;
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t, void))(**((void **)a1 + 97) + 16))(*((void **)a1 + 97), a2, v17, v19, *v14);
      *((_DWORD *)v14 - 1) = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 40))(*((void **)a1 + 97))
                           * a2;
      v14 += 2;
      --v13;
    }
    while (v13);
  }
  uint64_t v20 = AudioDSPGraph::Box::in(a1, 0);
  uint64_t v21 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 56);
  uint64_t v22 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v23 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22) + 56);
  long long v24 = *(_OWORD *)(v21 + 56);
  long long v25 = *(_OWORD *)(v21 + 40);
  long long v26 = *(_OWORD *)(v21 + 24);
  *(_OWORD *)(v23 + 8) = *(_OWORD *)(v21 + 8);
  *(_OWORD *)(v23 + 24) = v26;
  *(_OWORD *)(v23 + 40) = v25;
  *(_OWORD *)(v23 + 56) = v24;
  uint64_t v27 = AudioDSPGraph::Box::in(a1, 0);
  LODWORD(v21) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v27 + 40))(v27) + 56) + 72);
  uint64_t v28 = AudioDSPGraph::Box::in(a1, 1);
  LODWORD(v21) = (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v28 + 40))(v28) + 56) + 72) | 0xFFFFFFEF) & v21;
  uint64_t v29 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 40))(v29);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v21;
  return result;
}

void sub_248919B58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

double AudioDSPGraph::ArithmeticSumBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 2.73571922e161;
  *(_OWORD *)a1 = xmmword_24893BD80;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ArithmeticSumBox::ClassName(AudioDSPGraph::ArithmeticSumBox *this)
{
  return "asum";
}

void AudioDSPGraph::ArithmeticSumBox::~ArithmeticSumBox(AudioDSPGraph::ArithmeticSumBox *this)
{
  *(void *)this = &unk_26FC9B088;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26FC9B088;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  AudioDSPGraph::Box::~Box(this);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_7,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_7>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9ADB0;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_7,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_7>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  double result = operator new(0x10uLL);
  void *result = &unk_26FC9ADB0;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_7,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_7>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_6,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_6>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 2)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for arithmetic difference box. Must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1678, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for arithmetic difference box. Must be 2.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1675, &v4, &v3);
}

void sub_248919EB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticDiffBox>::initialize(AudioDSPGraph::Box *a1)
{
  AudioDSPGraph::Box::initialize(a1);
  if (((*((void *)a1 + 9) - *((void *)a1 + 8)) & 0x1FFFFFFFE0) == 0x40
    && ((*((void *)a1 + 12) - *((void *)a1 + 11)) & 0x1FFFFFFFE0) == 0x20)
  {
    uint64_t v2 = AudioDSPGraph::Box::in(a1, 0);
    int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
    uint64_t v4 = AudioDSPGraph::Box::in(a1, 1);
    if (v3 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 28))
    {
      uint64_t v5 = AudioDSPGraph::Box::in(a1, 0);
      int v6 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 28);
      uint64_t v7 = AudioDSPGraph::Box::out(a1, 0);
      if (v6 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 28))
      {
        uint64_t v8 = AudioDSPGraph::Box::in(a1, 0);
        int v9 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 8);
        uint64_t v10 = AudioDSPGraph::Box::in(a1, 1);
        int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120) + 8);
        if (v9 != 1819304813 || v11 != 1819304813)
        {
          if (v9 == 1819304813 && v11 != 1819304813) {
            operator new();
          }
          operator new();
        }
        operator new();
      }
      std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
      std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
      uint64_t v20 = AudioDSPGraph::Box::in(a1, 0);
      uint64_t v21 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 120) + 28);
      uint64_t v22 = AudioDSPGraph::Box::out(a1, 0);
      uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22);
      AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v24, v21, *(unsigned int *)(*(void *)(v23 + 120) + 28));
    }
    std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
    uint64_t v15 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v16 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v15 + 40))(v15) + 120) + 28);
    uint64_t v17 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 40))(v17);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v19, v16, *(unsigned int *)(*(void *)(v18 + 120) + 28));
  }
  std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
  std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
  AudioDSPGraph::strprintf((AudioDSPGraph *)"There must be two inputs and one output, instead of %u and %u.", v14, (*((void *)a1 + 9) - *((void *)a1 + 8)) >> 5, (*((void *)a1 + 12) - *((void *)a1 + 11)) >> 5);
}

void sub_24891A40C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In1ExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In0ExpectedSampleSize()
{
  return 8;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::process(int a1, vDSP_Length __N, float *a3, float *a4, float *a5)
{
  __A.realp = a3;
  __A.imagp = &a3[__N];
  __B.realp = a4;
  __B.imagp = &a4[__N];
  v5.realp = a5;
  v5.imagp = &a5[__N];
  vDSP_zvsub(&__A, 1, &__B, 1, &v5, 1, __N);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::In1ExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::In0ExpectedSampleSize()
{
  return 8;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::process(int a1, vDSP_Length __N, float *a3, const float *__B, float *a5)
{
  __A.realp = a3;
  __A.imagp = &a3[__N];
  v5.realp = a5;
  v5.imagp = &a5[__N];
  vDSP_zrvsub(&__A, 1, __B, 1, &v5, 1, __N);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In1ExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In0ExpectedSampleSize()
{
  return 4;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::process(int a1, vDSP_Length __N, const float *a3, float *a4, float *a5)
{
  vDSP_Length v5 = __N;
  __A.realp = a4;
  __A.imagp = &a4[__N];
  v6.realp = a5;
  v6.imagp = &a5[__N];
  vDSP_zrvsub(&__A, 1, a3, 1, &v6, 1, __N);
  vDSP_zvneg(&v6, 1, &v6, 1, v5);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::OutExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In1ExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In0ExpectedSampleSize()
{
  return 4;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::process(int a1, vDSP_Length __N, const float *a3, const float *__B, float *a5)
{
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDiffBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticDiffBox>::process(AudioDSPGraph::Box *a1, uint64_t a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in(a1, 0);
  vDSP_Length v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::in(a1, 1);
  uint64_t v7 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8);
  if (*v5 != *v7)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v31 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v32 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31) + 120) + 28);
    uint64_t v33 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v34 = (*(uint64_t (**)(uint64_t))(*(void *)v33 + 40))(v33);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v35, v32, *(unsigned int *)(*(void *)(v34 + 120) + 28));
  }
  uint64_t v10 = *(_DWORD **)(*(void *)(v9 + 56) + 80);
  if (*v5 != *v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v36 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v37 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v36 + 40))(v36) + 120) + 28);
    uint64_t v38 = AudioDSPGraph::Box::out(a1, 0);
    uint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 40))(v38);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v40, v37, *(unsigned int *)(*(void *)(v39 + 120) + 28));
  }
  unsigned int v11 = v5[3];
  if (v11 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v41 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 0 should be at least %u bytes, but is %u.", v42, (v41 * a2), v5[3]);
  }
  unsigned int v12 = v7[3];
  if (v12 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v43 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 1 should be at least %u bytes, but is %u.", v44, (v43 * a2), v7[3]);
  }
  uint64_t v13 = *v5;
  if (v13)
  {
    uint64_t v14 = v10 + 4;
    uint64_t v15 = (uint64_t *)(v7 + 4);
    uint64_t v16 = (uint64_t *)(v5 + 4);
    do
    {
      uint64_t v18 = *v16;
      v16 += 2;
      uint64_t v17 = v18;
      uint64_t v19 = *v15;
      v15 += 2;
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t, void))(**((void **)a1 + 97) + 16))(*((void **)a1 + 97), a2, v17, v19, *v14);
      *((_DWORD *)v14 - 1) = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 40))(*((void **)a1 + 97))
                           * a2;
      v14 += 2;
      --v13;
    }
    while (v13);
  }
  uint64_t v20 = AudioDSPGraph::Box::in(a1, 0);
  uint64_t v21 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 56);
  uint64_t v22 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v23 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22) + 56);
  long long v24 = *(_OWORD *)(v21 + 56);
  long long v25 = *(_OWORD *)(v21 + 40);
  long long v26 = *(_OWORD *)(v21 + 24);
  *(_OWORD *)(v23 + 8) = *(_OWORD *)(v21 + 8);
  *(_OWORD *)(v23 + 24) = v26;
  *(_OWORD *)(v23 + 40) = v25;
  *(_OWORD *)(v23 + 56) = v24;
  uint64_t v27 = AudioDSPGraph::Box::in(a1, 0);
  LODWORD(v21) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v27 + 40))(v27) + 56) + 72);
  uint64_t v28 = AudioDSPGraph::Box::in(a1, 1);
  LODWORD(v21) = (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v28 + 40))(v28) + 56) + 72) | 0xFFFFFFEF) & v21;
  uint64_t v29 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 40))(v29);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v21;
  return result;
}

void sub_24891AC10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

double AudioDSPGraph::ArithmeticDiffBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.43485253e161;
  *(_OWORD *)a1 = xmmword_24893BD70;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ArithmeticDiffBox::ClassName(AudioDSPGraph::ArithmeticDiffBox *this)
{
  return "adif";
}

void AudioDSPGraph::ArithmeticDiffBox::~ArithmeticDiffBox(AudioDSPGraph::ArithmeticDiffBox *this)
{
  *(void *)this = &unk_26FC9AA20;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26FC9AA20;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  AudioDSPGraph::Box::~Box(this);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_6,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_6>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9A748;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_6,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_6>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  double result = operator new(0x10uLL);
  void *result = &unk_26FC9A748;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_6,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_6>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_5,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_5>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 2)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for arithmetic max box. Must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1667, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for arithmetic max box. Must be 2.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1664, &v4, &v3);
}

void sub_24891AF68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticMaxBox>::initialize(AudioDSPGraph::Box *a1)
{
  AudioDSPGraph::Box::initialize(a1);
  if (((*((void *)a1 + 9) - *((void *)a1 + 8)) & 0x1FFFFFFFE0) == 0x40
    && ((*((void *)a1 + 12) - *((void *)a1 + 11)) & 0x1FFFFFFFE0) == 0x20)
  {
    uint64_t v2 = AudioDSPGraph::Box::in(a1, 0);
    int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
    uint64_t v4 = AudioDSPGraph::Box::in(a1, 1);
    if (v3 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 28))
    {
      uint64_t v5 = AudioDSPGraph::Box::in(a1, 0);
      int v6 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 28);
      uint64_t v7 = AudioDSPGraph::Box::out(a1, 0);
      if (v6 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 28))
      {
        uint64_t v8 = AudioDSPGraph::Box::in(a1, 0);
        int v9 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 8);
        uint64_t v10 = AudioDSPGraph::Box::in(a1, 1);
        int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120) + 8);
        if (v9 != 1819304813 || v11 != 1819304813)
        {
          if (v9 == 1819304813 && v11 != 1819304813)
          {
            std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
            std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
            uint64_t v28 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)a1 + 16))(a1);
            AudioDSPGraph::strprintf((AudioDSPGraph *)"Can't use real input for one bus and complex input for another with '%s' box", v29, v28);
          }
          if (v9 == 1819304813 || v11 != 1819304813)
          {
            std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
            std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
            uint64_t v26 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)a1 + 16))(a1);
            AudioDSPGraph::strprintf((AudioDSPGraph *)"Can't use complex inputs with '%s' box", v27, v26);
          }
          std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
          std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
          uint64_t v30 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)a1 + 16))(a1);
          AudioDSPGraph::strprintf((AudioDSPGraph *)"Can't use complex input for one bus and real input for another with '%s' box", v31, v30);
        }
        operator new();
      }
      std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
      std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
      uint64_t v19 = AudioDSPGraph::Box::in(a1, 0);
      uint64_t v20 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v19 + 40))(v19) + 120) + 28);
      uint64_t v21 = AudioDSPGraph::Box::out(a1, 0);
      uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v21 + 40))(v21);
      AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v23, v20, *(unsigned int *)(*(void *)(v22 + 120) + 28));
    }
    std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
    uint64_t v14 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v15 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v14 + 40))(v14) + 120) + 28);
    uint64_t v16 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v18, v15, *(unsigned int *)(*(void *)(v17 + 120) + 28));
  }
  std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
  std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
  AudioDSPGraph::strprintf((AudioDSPGraph *)"There must be two inputs and one output, instead of %u and %u.", v13, (*((void *)a1 + 9) - *((void *)a1 + 8)) >> 5, (*((void *)a1 + 12) - *((void *)a1 + 11)) >> 5);
}

void sub_24891B5B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMaxBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::OutExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMaxBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In1ExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMaxBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In0ExpectedSampleSize()
{
  return 4;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMaxBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::process(int a1, vDSP_Length __N, const float *__A, const float *__B, float *a5)
{
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMaxBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticMaxBox>::process(AudioDSPGraph::Box *a1, uint64_t a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in(a1, 0);
  uint64_t v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::in(a1, 1);
  uint64_t v7 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8);
  if (*v5 != *v7)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v31 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v32 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31) + 120) + 28);
    uint64_t v33 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v34 = (*(uint64_t (**)(uint64_t))(*(void *)v33 + 40))(v33);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v35, v32, *(unsigned int *)(*(void *)(v34 + 120) + 28));
  }
  uint64_t v10 = *(_DWORD **)(*(void *)(v9 + 56) + 80);
  if (*v5 != *v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v36 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v37 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v36 + 40))(v36) + 120) + 28);
    uint64_t v38 = AudioDSPGraph::Box::out(a1, 0);
    uint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 40))(v38);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v40, v37, *(unsigned int *)(*(void *)(v39 + 120) + 28));
  }
  unsigned int v11 = v5[3];
  if (v11 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v41 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 0 should be at least %u bytes, but is %u.", v42, (v41 * a2), v5[3]);
  }
  unsigned int v12 = v7[3];
  if (v12 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v43 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 1 should be at least %u bytes, but is %u.", v44, (v43 * a2), v7[3]);
  }
  uint64_t v13 = *v5;
  if (v13)
  {
    uint64_t v14 = v10 + 4;
    uint64_t v15 = (uint64_t *)(v7 + 4);
    uint64_t v16 = (uint64_t *)(v5 + 4);
    do
    {
      uint64_t v18 = *v16;
      v16 += 2;
      uint64_t v17 = v18;
      uint64_t v19 = *v15;
      v15 += 2;
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t, void))(**((void **)a1 + 97) + 16))(*((void **)a1 + 97), a2, v17, v19, *v14);
      *((_DWORD *)v14 - 1) = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 40))(*((void **)a1 + 97))
                           * a2;
      v14 += 2;
      --v13;
    }
    while (v13);
  }
  uint64_t v20 = AudioDSPGraph::Box::in(a1, 0);
  uint64_t v21 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 56);
  uint64_t v22 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v23 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22) + 56);
  long long v24 = *(_OWORD *)(v21 + 56);
  long long v25 = *(_OWORD *)(v21 + 40);
  long long v26 = *(_OWORD *)(v21 + 24);
  *(_OWORD *)(v23 + 8) = *(_OWORD *)(v21 + 8);
  *(_OWORD *)(v23 + 24) = v26;
  *(_OWORD *)(v23 + 40) = v25;
  *(_OWORD *)(v23 + 56) = v24;
  uint64_t v27 = AudioDSPGraph::Box::in(a1, 0);
  LODWORD(v21) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v27 + 40))(v27) + 56) + 72);
  uint64_t v28 = AudioDSPGraph::Box::in(a1, 1);
  LODWORD(v21) = (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v28 + 40))(v28) + 56) + 72) | 0xFFFFFFEF) & v21;
  uint64_t v29 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 40))(v29);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v21;
  return result;
}

void sub_24891BC40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

double AudioDSPGraph::ArithmeticMaxBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 2.06533485e161;
  *(_OWORD *)a1 = xmmword_24893BD60;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ArithmeticMaxBox::ClassName(AudioDSPGraph::ArithmeticMaxBox *this)
{
  return "amax";
}

void AudioDSPGraph::ArithmeticMaxBox::~ArithmeticMaxBox(AudioDSPGraph::ArithmeticMaxBox *this)
{
  *(void *)this = &unk_26FC9A478;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26FC9A478;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  AudioDSPGraph::Box::~Box(this);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_5,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_5>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC9A1A0;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_5,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_5>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  double result = operator new(0x10uLL);
  void *result = &unk_26FC9A1A0;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_5,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_5>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_4,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_4>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 2)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for arithmetic min box. Must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1657, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for arithmetic min box. Must be 2.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1654, &v4, &v3);
}

void sub_24891BF98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticMinBox>::initialize(AudioDSPGraph::Box *a1)
{
  AudioDSPGraph::Box::initialize(a1);
  if (((*((void *)a1 + 9) - *((void *)a1 + 8)) & 0x1FFFFFFFE0) == 0x40
    && ((*((void *)a1 + 12) - *((void *)a1 + 11)) & 0x1FFFFFFFE0) == 0x20)
  {
    uint64_t v2 = AudioDSPGraph::Box::in(a1, 0);
    int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
    uint64_t v4 = AudioDSPGraph::Box::in(a1, 1);
    if (v3 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 28))
    {
      uint64_t v5 = AudioDSPGraph::Box::in(a1, 0);
      int v6 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 28);
      uint64_t v7 = AudioDSPGraph::Box::out(a1, 0);
      if (v6 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 28))
      {
        uint64_t v8 = AudioDSPGraph::Box::in(a1, 0);
        int v9 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 8);
        uint64_t v10 = AudioDSPGraph::Box::in(a1, 1);
        int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120) + 8);
        if (v9 != 1819304813 || v11 != 1819304813)
        {
          if (v9 == 1819304813 && v11 != 1819304813)
          {
            std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
            std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
            uint64_t v28 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)a1 + 16))(a1);
            AudioDSPGraph::strprintf((AudioDSPGraph *)"Can't use real input for one bus and complex input for another with '%s' box", v29, v28);
          }
          if (v9 == 1819304813 || v11 != 1819304813)
          {
            std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
            std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
            uint64_t v26 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)a1 + 16))(a1);
            AudioDSPGraph::strprintf((AudioDSPGraph *)"Can't use complex inputs with '%s' box", v27, v26);
          }
          std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
          std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
          uint64_t v30 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)a1 + 16))(a1);
          AudioDSPGraph::strprintf((AudioDSPGraph *)"Can't use complex input for one bus and real input for another with '%s' box", v31, v30);
        }
        operator new();
      }
      std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
      std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
      uint64_t v19 = AudioDSPGraph::Box::in(a1, 0);
      uint64_t v20 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v19 + 40))(v19) + 120) + 28);
      uint64_t v21 = AudioDSPGraph::Box::out(a1, 0);
      uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v21 + 40))(v21);
      AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v23, v20, *(unsigned int *)(*(void *)(v22 + 120) + 28));
    }
    std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
    uint64_t v14 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v15 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v14 + 40))(v14) + 120) + 28);
    uint64_t v16 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v18, v15, *(unsigned int *)(*(void *)(v17 + 120) + 28));
  }
  std::string::basic_string[abi:ne180100]<0>(v33, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
  std::string::basic_string[abi:ne180100]<0>(v32, "initialize");
  AudioDSPGraph::strprintf((AudioDSPGraph *)"There must be two inputs and one output, instead of %u and %u.", v13, (*((void *)a1 + 9) - *((void *)a1 + 8)) >> 5, (*((void *)a1 + 12) - *((void *)a1 + 11)) >> 5);
}

void sub_24891C5E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMinBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::OutExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMinBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In1ExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMinBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In0ExpectedSampleSize()
{
  return 4;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMinBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::process(int a1, vDSP_Length __N, const float *__A, const float *__B, float *a5)
{
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMinBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticMinBox>::process(AudioDSPGraph::Box *a1, uint64_t a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in(a1, 0);
  uint64_t v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::in(a1, 1);
  uint64_t v7 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8);
  if (*v5 != *v7)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v31 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v32 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31) + 120) + 28);
    uint64_t v33 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v34 = (*(uint64_t (**)(uint64_t))(*(void *)v33 + 40))(v33);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v35, v32, *(unsigned int *)(*(void *)(v34 + 120) + 28));
  }
  uint64_t v10 = *(_DWORD **)(*(void *)(v9 + 56) + 80);
  if (*v5 != *v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v36 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v37 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v36 + 40))(v36) + 120) + 28);
    uint64_t v38 = AudioDSPGraph::Box::out(a1, 0);
    uint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 40))(v38);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v40, v37, *(unsigned int *)(*(void *)(v39 + 120) + 28));
  }
  unsigned int v11 = v5[3];
  if (v11 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v41 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 0 should be at least %u bytes, but is %u.", v42, (v41 * a2), v5[3]);
  }
  unsigned int v12 = v7[3];
  if (v12 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v43 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 1 should be at least %u bytes, but is %u.", v44, (v43 * a2), v7[3]);
  }
  uint64_t v13 = *v5;
  if (v13)
  {
    uint64_t v14 = v10 + 4;
    uint64_t v15 = (uint64_t *)(v7 + 4);
    uint64_t v16 = (uint64_t *)(v5 + 4);
    do
    {
      uint64_t v18 = *v16;
      v16 += 2;
      uint64_t v17 = v18;
      uint64_t v19 = *v15;
      v15 += 2;
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t, void))(**((void **)a1 + 97) + 16))(*((void **)a1 + 97), a2, v17, v19, *v14);
      *((_DWORD *)v14 - 1) = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 40))(*((void **)a1 + 97))
                           * a2;
      v14 += 2;
      --v13;
    }
    while (v13);
  }
  uint64_t v20 = AudioDSPGraph::Box::in(a1, 0);
  uint64_t v21 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 56);
  uint64_t v22 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v23 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22) + 56);
  long long v24 = *(_OWORD *)(v21 + 56);
  long long v25 = *(_OWORD *)(v21 + 40);
  long long v26 = *(_OWORD *)(v21 + 24);
  *(_OWORD *)(v23 + 8) = *(_OWORD *)(v21 + 8);
  *(_OWORD *)(v23 + 24) = v26;
  *(_OWORD *)(v23 + 40) = v25;
  *(_OWORD *)(v23 + 56) = v24;
  uint64_t v27 = AudioDSPGraph::Box::in(a1, 0);
  LODWORD(v21) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v27 + 40))(v27) + 56) + 72);
  uint64_t v28 = AudioDSPGraph::Box::in(a1, 1);
  LODWORD(v21) = (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v28 + 40))(v28) + 56) + 72) | 0xFFFFFFEF) & v21;
  uint64_t v29 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 40))(v29);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v21;
  return result;
}

void sub_24891CC70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

double AudioDSPGraph::ArithmeticMinBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 2.06752086e161;
  *(_OWORD *)a1 = xmmword_24893BD50;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ArithmeticMinBox::ClassName(AudioDSPGraph::ArithmeticMinBox *this)
{
  return "amin";
}

void AudioDSPGraph::ArithmeticMinBox::~ArithmeticMinBox(AudioDSPGraph::ArithmeticMinBox *this)
{
  *(void *)this = &unk_26FC99ED0;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26FC99ED0;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  AudioDSPGraph::Box::~Box(this);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_4,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_4>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC99BF8;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_4,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_4>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  double result = operator new(0x10uLL);
  void *result = &unk_26FC99BF8;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_4,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_4>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_3,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_3>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 2)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for arithmetic divide box. must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1647, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for arithmetic divide box. must be 2.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1644, &v4, &v3);
}

void sub_24891CFC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticDivBox>::initialize(AudioDSPGraph::Box *a1)
{
  AudioDSPGraph::Box::initialize(a1);
  if (((*((void *)a1 + 9) - *((void *)a1 + 8)) & 0x1FFFFFFFE0) == 0x40
    && ((*((void *)a1 + 12) - *((void *)a1 + 11)) & 0x1FFFFFFFE0) == 0x20)
  {
    uint64_t v2 = AudioDSPGraph::Box::in(a1, 0);
    int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
    uint64_t v4 = AudioDSPGraph::Box::in(a1, 1);
    if (v3 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 28))
    {
      uint64_t v5 = AudioDSPGraph::Box::in(a1, 0);
      int v6 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 28);
      uint64_t v7 = AudioDSPGraph::Box::out(a1, 0);
      if (v6 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 28))
      {
        uint64_t v8 = AudioDSPGraph::Box::in(a1, 0);
        int v9 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 8);
        uint64_t v10 = AudioDSPGraph::Box::in(a1, 1);
        int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120) + 8);
        if (v9 != 1819304813 || v11 != 1819304813)
        {
          if (v9 == 1819304813 && v11 != 1819304813) {
            operator new();
          }
          operator new();
        }
        operator new();
      }
      std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
      std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
      uint64_t v20 = AudioDSPGraph::Box::in(a1, 0);
      uint64_t v21 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 120) + 28);
      uint64_t v22 = AudioDSPGraph::Box::out(a1, 0);
      uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22);
      AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v24, v21, *(unsigned int *)(*(void *)(v23 + 120) + 28));
    }
    std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
    uint64_t v15 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v16 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v15 + 40))(v15) + 120) + 28);
    uint64_t v17 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 40))(v17);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v19, v16, *(unsigned int *)(*(void *)(v18 + 120) + 28));
  }
  std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
  std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
  AudioDSPGraph::strprintf((AudioDSPGraph *)"There must be two inputs and one output, instead of %u and %u.", v14, (*((void *)a1 + 9) - *((void *)a1 + 8)) >> 5, (*((void *)a1 + 12) - *((void *)a1 + 11)) >> 5);
}

void sub_24891D524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In1ExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In0ExpectedSampleSize()
{
  return 8;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::process(int a1, vDSP_Length __N, float *a3, float *a4, float *a5)
{
  __A.realp = a3;
  __A.imagp = &a3[__N];
  __B.realp = a4;
  __B.imagp = &a4[__N];
  v5.realp = a5;
  v5.imagp = &a5[__N];
  vDSP_zvdiv(&__B, 1, &__A, 1, &v5, 1, __N);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::In1ExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::In0ExpectedSampleSize()
{
  return 8;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::process(int a1, vDSP_Length __N, float *a3, const float *__B, float *a5)
{
  __A.realp = a3;
  __A.imagp = &a3[__N];
  v5.realp = a5;
  v5.imagp = &a5[__N];
  vDSP_zrvdiv(&__A, 1, __B, 1, &v5, 1, __N);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In1ExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In0ExpectedSampleSize()
{
  return 4;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::process(int a1, vDSP_Length __N, float *a3, float *a4, float *a5)
{
  __B.realp = a4;
  __B.imagp = &a4[__N];
  __C.realp = a5;
  __C.imagp = &a5[__N];
  float __A = 0.0;
  vDSP_Length v5 = __N;
  v8.realp = a3;
  v8.imagp = __C.imagp;
  vDSP_vfill(&__A, __C.imagp, 1, __N);
  vDSP_zvdiv(&__B, 1, &v8, 1, &__C, 1, v5);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::OutExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In1ExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In0ExpectedSampleSize()
{
  return 4;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::process(int a1, vDSP_Length __N, const float *a3, const float *__B, float *a5)
{
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticDivBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticDivBox>::process(AudioDSPGraph::Box *a1, uint64_t a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in(a1, 0);
  vDSP_Length v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::in(a1, 1);
  uint64_t v7 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8);
  if (*v5 != *v7)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v31 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v32 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31) + 120) + 28);
    uint64_t v33 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v34 = (*(uint64_t (**)(uint64_t))(*(void *)v33 + 40))(v33);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v35, v32, *(unsigned int *)(*(void *)(v34 + 120) + 28));
  }
  uint64_t v10 = *(_DWORD **)(*(void *)(v9 + 56) + 80);
  if (*v5 != *v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v36 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v37 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v36 + 40))(v36) + 120) + 28);
    uint64_t v38 = AudioDSPGraph::Box::out(a1, 0);
    uint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 40))(v38);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v40, v37, *(unsigned int *)(*(void *)(v39 + 120) + 28));
  }
  unsigned int v11 = v5[3];
  if (v11 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v41 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 0 should be at least %u bytes, but is %u.", v42, (v41 * a2), v5[3]);
  }
  unsigned int v12 = v7[3];
  if (v12 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v43 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 1 should be at least %u bytes, but is %u.", v44, (v43 * a2), v7[3]);
  }
  uint64_t v13 = *v5;
  if (v13)
  {
    uint64_t v14 = v10 + 4;
    uint64_t v15 = (uint64_t *)(v7 + 4);
    uint64_t v16 = (uint64_t *)(v5 + 4);
    do
    {
      uint64_t v18 = *v16;
      v16 += 2;
      uint64_t v17 = v18;
      uint64_t v19 = *v15;
      v15 += 2;
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t, void))(**((void **)a1 + 97) + 16))(*((void **)a1 + 97), a2, v17, v19, *v14);
      *((_DWORD *)v14 - 1) = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 40))(*((void **)a1 + 97))
                           * a2;
      v14 += 2;
      --v13;
    }
    while (v13);
  }
  uint64_t v20 = AudioDSPGraph::Box::in(a1, 0);
  uint64_t v21 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 56);
  uint64_t v22 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v23 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22) + 56);
  long long v24 = *(_OWORD *)(v21 + 56);
  long long v25 = *(_OWORD *)(v21 + 40);
  long long v26 = *(_OWORD *)(v21 + 24);
  *(_OWORD *)(v23 + 8) = *(_OWORD *)(v21 + 8);
  *(_OWORD *)(v23 + 24) = v26;
  *(_OWORD *)(v23 + 40) = v25;
  *(_OWORD *)(v23 + 56) = v24;
  uint64_t v27 = AudioDSPGraph::Box::in(a1, 0);
  LODWORD(v21) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v27 + 40))(v27) + 56) + 72);
  uint64_t v28 = AudioDSPGraph::Box::in(a1, 1);
  (*(void (**)(uint64_t))(*(void *)v28 + 40))(v28);
  uint64_t v29 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 40))(v29);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v21;
  return result;
}

void sub_24891DD20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

double AudioDSPGraph::ArithmeticDivBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.43486969e161;
  *(_OWORD *)a1 = xmmword_24893BD40;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ArithmeticDivBox::ClassName(AudioDSPGraph::ArithmeticDivBox *this)
{
  return "advi";
}

void AudioDSPGraph::ArithmeticDivBox::~ArithmeticDivBox(AudioDSPGraph::ArithmeticDivBox *this)
{
  *(void *)this = &unk_26FC99868;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26FC99868;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  AudioDSPGraph::Box::~Box(this);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_3,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_3>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC99590;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_3,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_3>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  double result = operator new(0x10uLL);
  void *result = &unk_26FC99590;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_3,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_3>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_2,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_2>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 2)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for arithmetic multiply box. must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1637, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for arithmetic multiply box. must be 2.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1634, &v4, &v3);
}

void sub_24891E078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticMultBox>::initialize(AudioDSPGraph::Box *a1)
{
  AudioDSPGraph::Box::initialize(a1);
  if (((*((void *)a1 + 9) - *((void *)a1 + 8)) & 0x1FFFFFFFE0) == 0x40
    && ((*((void *)a1 + 12) - *((void *)a1 + 11)) & 0x1FFFFFFFE0) == 0x20)
  {
    uint64_t v2 = AudioDSPGraph::Box::in(a1, 0);
    int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
    uint64_t v4 = AudioDSPGraph::Box::in(a1, 1);
    if (v3 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 28))
    {
      uint64_t v5 = AudioDSPGraph::Box::in(a1, 0);
      int v6 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 28);
      uint64_t v7 = AudioDSPGraph::Box::out(a1, 0);
      if (v6 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 28))
      {
        uint64_t v8 = AudioDSPGraph::Box::in(a1, 0);
        int v9 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 8);
        uint64_t v10 = AudioDSPGraph::Box::in(a1, 1);
        int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120) + 8);
        if (v9 != 1819304813 || v11 != 1819304813)
        {
          if (v9 == 1819304813 && v11 != 1819304813) {
            operator new();
          }
          operator new();
        }
        operator new();
      }
      std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
      std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
      uint64_t v20 = AudioDSPGraph::Box::in(a1, 0);
      uint64_t v21 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 120) + 28);
      uint64_t v22 = AudioDSPGraph::Box::out(a1, 0);
      uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22);
      AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v24, v21, *(unsigned int *)(*(void *)(v23 + 120) + 28));
    }
    std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
    uint64_t v15 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v16 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v15 + 40))(v15) + 120) + 28);
    uint64_t v17 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 40))(v17);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v19, v16, *(unsigned int *)(*(void *)(v18 + 120) + 28));
  }
  std::string::basic_string[abi:ne180100]<0>(v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
  std::string::basic_string[abi:ne180100]<0>(v25, "initialize");
  AudioDSPGraph::strprintf((AudioDSPGraph *)"There must be two inputs and one output, instead of %u and %u.", v14, (*((void *)a1 + 9) - *((void *)a1 + 8)) >> 5, (*((void *)a1 + 12) - *((void *)a1 + 11)) >> 5);
}

void sub_24891E5D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In1ExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In0ExpectedSampleSize()
{
  return 8;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::process(int a1, vDSP_Length __N, float *a3, float *a4, float *a5)
{
  __A.realp = a3;
  __A.imagp = &a3[__N];
  __B.realp = a4;
  __B.imagp = &a4[__N];
  v5.realp = a5;
  v5.imagp = &a5[__N];
  vDSP_zvmul(&__A, 1, &__B, 1, &v5, 1, __N, 1);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::In1ExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::In0ExpectedSampleSize()
{
  return 8;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::process(int a1, vDSP_Length __N, float *a3, const float *__B, float *a5)
{
  __A.realp = a3;
  __A.imagp = &a3[__N];
  v5.realp = a5;
  v5.imagp = &a5[__N];
  vDSP_zrvmul(&__A, 1, __B, 1, &v5, 1, __N);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::cplx_type,AudioDSPGraph::arithmetic_boxes::real_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::OutExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In1ExpectedSampleSize()
{
  return 8;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::In0ExpectedSampleSize()
{
  return 4;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::process(int a1, vDSP_Length __N, const float *a3, float *a4, float *a5)
{
  __A.realp = a4;
  __A.imagp = &a4[__N];
  v5.realp = a5;
  v5.imagp = &a5[__N];
  vDSP_zrvmul(&__A, 1, a3, 1, &v5, 1, __N);
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::cplx_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::OutExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In1ExpectedSampleSize()
{
  return 4;
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::In0ExpectedSampleSize()
{
  return 4;
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::process(int a1, vDSP_Length __N, const float *__A, const float *__B, float *a5)
{
}

void AudioDSPGraph::arithmetic_boxes::ArithmeticCore<AudioDSPGraph::ArithmeticMultBox,AudioDSPGraph::arithmetic_boxes::real_type,AudioDSPGraph::arithmetic_boxes::real_type>::~ArithmeticCore()
{
}

uint64_t AudioDSPGraph::arithmetic_boxes::ArithmeticBox<AudioDSPGraph::ArithmeticMultBox>::process(AudioDSPGraph::Box *a1, uint64_t a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in(a1, 0);
  DSPSplitComplex v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::in(a1, 1);
  uint64_t v7 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8);
  if (*v5 != *v7)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v31 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v32 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31) + 120) + 28);
    uint64_t v33 = AudioDSPGraph::Box::in(a1, 1);
    uint64_t v34 = (*(uint64_t (**)(uint64_t))(*(void *)v33 + 40))(v33);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs must have the same channel count, but have %u and %u.", v35, v32, *(unsigned int *)(*(void *)(v34 + 120) + 28));
  }
  uint64_t v10 = *(_DWORD **)(*(void *)(v9 + 56) + 80);
  if (*v5 != *v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    uint64_t v36 = AudioDSPGraph::Box::in(a1, 0);
    uint64_t v37 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v36 + 40))(v36) + 120) + 28);
    uint64_t v38 = AudioDSPGraph::Box::out(a1, 0);
    uint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 40))(v38);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The inputs and output must have the same channel count, but have %u and %u.", v40, v37, *(unsigned int *)(*(void *)(v39 + 120) + 28));
  }
  unsigned int v11 = v5[3];
  if (v11 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v41 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 24))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 0 should be at least %u bytes, but is %u.", v42, (v41 * a2), v5[3]);
  }
  unsigned int v12 = v7[3];
  if (v12 < (*(unsigned int (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97))
           * a2)
  {
    std::string::basic_string[abi:ne180100]<0>(v46, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.hpp");
    std::string::basic_string[abi:ne180100]<0>(v45, "process");
    int v43 = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 32))(*((void **)a1 + 97));
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 1 should be at least %u bytes, but is %u.", v44, (v43 * a2), v7[3]);
  }
  uint64_t v13 = *v5;
  if (v13)
  {
    uint64_t v14 = v10 + 4;
    uint64_t v15 = (uint64_t *)(v7 + 4);
    uint64_t v16 = (uint64_t *)(v5 + 4);
    do
    {
      uint64_t v18 = *v16;
      v16 += 2;
      uint64_t v17 = v18;
      uint64_t v19 = *v15;
      v15 += 2;
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t, void))(**((void **)a1 + 97) + 16))(*((void **)a1 + 97), a2, v17, v19, *v14);
      *((_DWORD *)v14 - 1) = (*(uint64_t (**)(void *))(**((void **)a1 + 97) + 40))(*((void **)a1 + 97))
                           * a2;
      v14 += 2;
      --v13;
    }
    while (v13);
  }
  uint64_t v20 = AudioDSPGraph::Box::in(a1, 0);
  uint64_t v21 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 56);
  uint64_t v22 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v23 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22) + 56);
  long long v24 = *(_OWORD *)(v21 + 56);
  long long v25 = *(_OWORD *)(v21 + 40);
  long long v26 = *(_OWORD *)(v21 + 24);
  *(_OWORD *)(v23 + 8) = *(_OWORD *)(v21 + 8);
  *(_OWORD *)(v23 + 24) = v26;
  *(_OWORD *)(v23 + 40) = v25;
  *(_OWORD *)(v23 + 56) = v24;
  uint64_t v27 = AudioDSPGraph::Box::in(a1, 0);
  LODWORD(v21) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v27 + 40))(v27) + 56) + 72);
  uint64_t v28 = AudioDSPGraph::Box::in(a1, 1);
  LODWORD(v21) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v28 + 40))(v28) + 56) + 72) & 0x10 | v21;
  uint64_t v29 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 40))(v29);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v21;
  return result;
}

void sub_24891EDBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

double AudioDSPGraph::ArithmeticMultBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 2.07081382e161;
  *(_OWORD *)a1 = xmmword_24893BD30;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ArithmeticMultBox::ClassName(AudioDSPGraph::ArithmeticMultBox *this)
{
  return "amul";
}

void AudioDSPGraph::ArithmeticMultBox::~ArithmeticMultBox(AudioDSPGraph::ArithmeticMultBox *this)
{
  *(void *)this = &unk_26FC99200;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26FC99200;
  uint64_t v2 = *((void *)this + 97);
  *((void *)this + 97) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  AudioDSPGraph::Box::~Box(this);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_2,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_2>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC98F28;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_2,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_2>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  double result = operator new(0x10uLL);
  void *result = &unk_26FC98F28;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_2,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_2>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void *std::function<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator=(void *a1, void *a2)
{
  void v9[3] = *MEMORY[0x263EF8340];
  int v3 = (void *)a2[3];
  if (v3)
  {
    if (v3 == a2)
    {
      uint64_t v8 = v7;
      (*(void (**)(void *, void *))(*a2 + 24))(a2, v7);
    }
    else
    {
      uint64_t v8 = (void *)(*(uint64_t (**)(void *))(*v3 + 16))(v3);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v7 != a1)
  {
    uint64_t v4 = v8;
    DSPSplitComplex v5 = (void *)a1[3];
    if (v8 == v7)
    {
      if (v5 == a1)
      {
        (*(void (**)(void *, void *))(v7[0] + 24))(v7, v9);
        (*(void (**)(void *))(*v8 + 32))(v8);
        uint64_t v8 = 0;
        (*(void (**)(void, void *))(*(void *)a1[3] + 24))(a1[3], v7);
        (*(void (**)(void))(*(void *)a1[3] + 32))(a1[3]);
        a1[3] = 0;
        uint64_t v8 = v7;
        (*(void (**)(void *, void *))(v9[0] + 24))(v9, a1);
        (*(void (**)(void *))(v9[0] + 32))(v9);
      }
      else
      {
        (*(void (**)(void *, void *))(v7[0] + 24))(v7, a1);
        (*(void (**)(void *))(*v8 + 32))(v8);
        uint64_t v8 = (void *)a1[3];
      }
      a1[3] = a1;
    }
    else if (v5 == a1)
    {
      (*(void (**)(void *, void *))(*a1 + 24))(a1, v7);
      (*(void (**)(void))(*(void *)a1[3] + 32))(a1[3]);
      a1[3] = v8;
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v8 = (void *)a1[3];
      a1[3] = v4;
    }
  }
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v7);
  return a1;
}

void sub_24891F2DC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t std::__split_buffer<std::pair<std::string,AudioComponentDescription>>::~__split_buffer(uint64_t a1)
{
  int v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      uint64_t v4 = v2 - 6;
      *(void *)(a1 + 16) = v2 - 6;
      if (*((char *)v2 - 25) < 0)
      {
        operator delete(*v4);
        uint64_t v4 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_1,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_1>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::operator()(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 == 1)
  {
    if (*a3 == 1) {
      operator new();
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
    std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of outputs for GainBox. must be 1.");
    AudioDSPGraph::ThrowException(1701602593, &v5, 1627, &v4, &v3);
  }
  std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Interpreter.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v4, "operator()");
  std::string::basic_string[abi:ne180100]<0>(&v3, "wrong number of inputs for GainBox. must be 1.");
  AudioDSPGraph::ThrowException(1701602593, &v5, 1624, &v4, &v3);
}

void sub_24891F4A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_1,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_1>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC98EE0;
}

void *std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_1,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_1>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::__clone()
{
  double result = operator new(0x10uLL);
  void *result = &unk_26FC98EE0;
  return result;
}

void std::__function::__func<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_1,std::allocator<AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_1>,AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__func()
{
}

void AudioDSPGraph::IsoGroup::add(AudioDSPGraph::IsoGroup *this, AudioDSPGraph::Box *a2)
{
  std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__emplace_unique_key_args<AudioDSPGraph::Box *,AudioDSPGraph::Box * const&>((uint64_t)this + 16, (unint64_t)a2, (uint64_t)a2);
  *((void *)a2 + 2) = this;
  if (((*((void *)a2 + 12) - *((void *)a2 + 11)) & 0x1FFFFFFFE0) == 0
    || (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)a2 + 272))(a2))
  {
    std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__emplace_unique_key_args<AudioDSPGraph::Box *,AudioDSPGraph::Box * const&>((uint64_t)this + 56, (unint64_t)a2, (uint64_t)a2);
  }
  uint64_t v4 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)a2 + 232))(a2);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v7 = (uint64_t *)*((void *)this + 23);
    unint64_t v6 = *((void *)this + 24);
    if ((unint64_t)v7 < v6)
    {
      *uint64_t v7 = v4;
      uint64_t v8 = v7 + 1;
LABEL_34:
      *((void *)this + 23) = v8;
      return;
    }
    uint64_t v14 = (void *)*((void *)this + 22);
    uint64_t v15 = v7 - v14;
    unint64_t v16 = v15 + 1;
    if ((unint64_t)(v15 + 1) >> 61) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v17 = v6 - (void)v14;
    if (v17 >> 2 > v16) {
      unint64_t v16 = v17 >> 2;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v16;
    }
    if (!v18)
    {
      uint64_t v19 = 0;
      goto LABEL_29;
    }
    if (!(v18 >> 61))
    {
      uint64_t v19 = (char *)operator new(8 * v18);
LABEL_29:
      long long v26 = (uint64_t *)&v19[8 * v15];
      *long long v26 = v5;
      uint64_t v8 = v26 + 1;
      if (v7 != v14)
      {
        do
        {
          uint64_t v27 = *--v7;
          *--long long v26 = v27;
        }
        while (v7 != v14);
        uint64_t v7 = (uint64_t *)*((void *)this + 22);
      }
      *((void *)this + 22) = v26;
      *((void *)this + 23) = v8;
      *((void *)this + 24) = &v19[8 * v18];
      if (v7) {
        operator delete(v7);
      }
      goto LABEL_34;
    }
LABEL_44:
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v9 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)a2 + 240))(a2);
  if (v9)
  {
    uint64_t v10 = v9;
    unsigned int v12 = (uint64_t *)*((void *)this + 26);
    unint64_t v11 = *((void *)this + 27);
    if ((unint64_t)v12 >= v11)
    {
      uint64_t v20 = (void *)*((void *)this + 25);
      uint64_t v21 = v12 - v20;
      unint64_t v22 = v21 + 1;
      if ((unint64_t)(v21 + 1) >> 61) {
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v23 = v11 - (void)v20;
      if (v23 >> 2 > v22) {
        unint64_t v22 = v23 >> 2;
      }
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v24 = v22;
      }
      if (v24)
      {
        if (v24 >> 61) {
          goto LABEL_44;
        }
        long long v25 = (char *)operator new(8 * v24);
      }
      else
      {
        long long v25 = 0;
      }
      uint64_t v28 = (uint64_t *)&v25[8 * v21];
      *uint64_t v28 = v10;
      uint64_t v13 = v28 + 1;
      if (v12 != v20)
      {
        do
        {
          uint64_t v29 = *--v12;
          *--uint64_t v28 = v29;
        }
        while (v12 != v20);
        unsigned int v12 = (uint64_t *)*((void *)this + 25);
      }
      *((void *)this + 25) = v28;
      *((void *)this + 26) = v13;
      *((void *)this + 27) = &v25[8 * v24];
      if (v12) {
        operator delete(v12);
      }
    }
    else
    {
      uint64_t *v12 = v9;
      uint64_t v13 = v12 + 1;
    }
    *((void *)this + 26) = v13;
  }
}

void std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__emplace_unique_key_args<AudioDSPGraph::Box *,AudioDSPGraph::Box * const&>(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 8);
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
    unint64_t v11 = *(void **)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (size_t i = (void *)*v11; i; size_t i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == a2) {
            return;
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
      }
    }
  }
  uint64_t v14 = operator new(0x18uLL);
  *uint64_t v14 = 0;
  v14[1] = v8;
  v14[2] = a3;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__rehash<true>(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
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
  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *uint64_t v14 = *v22;
LABEL_38:
    *unint64_t v22 = v14;
    goto LABEL_39;
  }
  *uint64_t v14 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  *(void *)(v21 + 8 * v3) = a1 + 16;
  if (*v14)
  {
    unint64_t v23 = *(void *)(*v14 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
}

void sub_24891FA1C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::Box *>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

void AudioDSPGraph::IsoGroup::topologicalSort(uint64_t a1, char **a2)
{
  if (*(unsigned char *)(a1 + 249))
  {
    std::string::basic_string[abi:ne180100]<0>(&v20, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/IsoGroup.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v19, "topologicalSort");
    std::string::basic_string[abi:ne180100]<0>(&v18, "IsoGroup::topologicalSort, There is a cycle in the graph. The graph must be acyclic.");
    AudioDSPGraph::ThrowException(1953460257, &v20, 247, &v19, &v18);
  }
  if (!*(unsigned char *)(a1 + 248))
  {
    *(unsigned char *)(a1 + 249) = 1;
    for (size_t i = *(void **)(a1 + 112); i; size_t i = (void *)*i)
      AudioDSPGraph::IsoGroup::topologicalSort(*(void *)(i[2] + 848), a2);
    uint64_t v5 = *(void *)(a1 + 224);
    *(unsigned char *)(a1 + 249) = 0;
    *(void *)(a1 + 232) = v5;
    for (j = *(uint64_t ***)(a1 + 72); j; j = (uint64_t **)*j)
      (*(void (**)(uint64_t *, uint64_t, uint64_t, char **))(*j[2] + 400))(j[2], a1, a1 + 224, a2);
    unint64_t v8 = a2[1];
    unint64_t v7 = (unint64_t)a2[2];
    if ((unint64_t)v8 >= v7)
    {
      uint8x8_t v10 = *a2;
      uint64_t v11 = (v8 - *a2) >> 3;
      unint64_t v12 = v11 + 1;
      if ((unint64_t)(v11 + 1) >> 61) {
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v13 = v7 - (void)v10;
      if (v13 >> 2 > v12) {
        unint64_t v12 = v13 >> 2;
      }
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v12;
      }
      if (v14)
      {
        if (v14 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        float v15 = (char *)operator new(8 * v14);
      }
      else
      {
        float v15 = 0;
      }
      float v16 = &v15[8 * v11];
      *(void *)float v16 = a1;
      unint64_t v9 = v16 + 8;
      if (v8 != v10)
      {
        do
        {
          uint64_t v17 = *((void *)v8 - 1);
          v8 -= 8;
          *((void *)v16 - 1) = v17;
          v16 -= 8;
        }
        while (v8 != v10);
        unint64_t v8 = *a2;
      }
      *a2 = v16;
      a2[1] = v9;
      a2[2] = &v15[8 * v14];
      if (v8) {
        operator delete(v8);
      }
    }
    else
    {
      *(void *)unint64_t v8 = a1;
      unint64_t v9 = v8 + 8;
    }
    a2[1] = v9;
    *(unsigned char *)(a1 + 248) = 1;
  }
}

void sub_24891FC48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<AudioDSPGraph::FCBox *,std::hash<AudioDSPGraph::FCBox *>,std::equal_to<AudioDSPGraph::FCBox *>,std::allocator<AudioDSPGraph::FCBox *>>::__emplace_unique_key_args<AudioDSPGraph::FCBox *,AudioDSPGraph::FCBox * const&>(float *a1, unint64_t a2, uint64_t a3)
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
    uint64_t v11 = *(void **)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (size_t i = (void *)*v11; i; size_t i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == a2) {
            return;
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
      }
    }
  }
  unint64_t v14 = operator new(0x18uLL);
  *unint64_t v14 = 0;
  v14[1] = v8;
  v14[2] = a3;
  float v15 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v16 = a1[8];
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
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
      unint64_t v27 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }
      else
      {
        uint64_t v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }
      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
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
          uint64_t v21 = operator new(8 * *(void *)&prime);
          unint64_t v22 = *(void **)a1;
          *(void *)a1 = v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v23++) = 0;
          while (*(void *)&prime != v23);
          unint64_t v24 = (void *)*((void *)a1 + 2);
          if (v24)
          {
            unint64_t v25 = v24[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }
            else
            {
              v25 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v25) = a1 + 4;
            uint64_t v30 = (void *)*v24;
            if (*v24)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }
                else
                {
                  v31 &= *(void *)&prime - 1;
                }
                if (v31 != v25)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v31))
                  {
                    *(void *)(*(void *)a1 + 8 * v31) = v24;
                    goto LABEL_55;
                  }
                  *unint64_t v24 = *v30;
                  *uint64_t v30 = **(void **)(*(void *)a1 + 8 * v31);
                  **(void **)(*(void *)a1 + 8 * v31) = v30;
                  uint64_t v30 = v24;
                }
                unint64_t v31 = v25;
LABEL_55:
                unint64_t v24 = v30;
                uint64_t v30 = (void *)*v30;
                unint64_t v25 = v31;
              }
              while (v30);
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
  uint64_t v32 = *(void **)a1;
  uint64_t v33 = *(void **)(*(void *)a1 + 8 * v3);
  if (v33)
  {
    *unint64_t v14 = *v33;
LABEL_72:
    *uint64_t v33 = v14;
    goto LABEL_73;
  }
  *unint64_t v14 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v14;
  v32[v3] = a1 + 4;
  if (*v14)
  {
    unint64_t v34 = *(void *)(*v14 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v34 >= v9) {
        v34 %= v9;
      }
    }
    else
    {
      v34 &= v9 - 1;
    }
    uint64_t v33 = (void *)(*(void *)a1 + 8 * v34);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
}

void sub_2489200A4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t AudioDSPGraph::Port::wire(AudioDSPGraph::Port *this)
{
  return *((void *)this + 2);
}

uint64_t AudioDSPGraph::Port::print(uint64_t result, void *a2, int a3, uint64_t a4)
{
  if (a3 >= 3)
  {
    int v4 = a4;
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)result + 32))(result, a2, a4, 1);
    AudioDSPGraph::printi(a2, v4 + 4, "box %p\n");
  }
  return result;
}

const char *AudioDSPGraph::Port::ClassName(AudioDSPGraph::Port *this)
{
  return "Port";
}

uint64_t AudioDSPGraph::OutputPort::getFormatFromUnit(AudioDSPGraph::OutputPort *this)
{
  return (*(uint64_t (**)(void, uint64_t, void))(**((void **)this + 1) + 456))(*((void *)this + 1), 2, *((unsigned int *)this + 6));
}

uint64_t AudioDSPGraph::OutputPort::setFormatOnUnit(AudioDSPGraph::OutputPort *this, const AudioStreamBasicDescription *a2)
{
  return (*(uint64_t (**)(void, const AudioStreamBasicDescription *, uint64_t, void))(**((void **)this + 1)
                                                                                                 + 448))(*((void *)this + 1), a2, 2, *((unsigned int *)this + 6));
}

const char *AudioDSPGraph::OutputPort::ClassName(AudioDSPGraph::OutputPort *this)
{
  return "OutputPort";
}

void AudioDSPGraph::OutputPort::~OutputPort(AudioDSPGraph::OutputPort *this)
{
}

uint64_t AudioDSPGraph::InputPort::getFormatFromUnit(AudioDSPGraph::InputPort *this)
{
  return (*(uint64_t (**)(void, uint64_t, void))(**((void **)this + 1) + 456))(*((void *)this + 1), 1, *((unsigned int *)this + 6));
}

uint64_t AudioDSPGraph::InputPort::setFormatOnUnit(AudioDSPGraph::InputPort *this, const AudioStreamBasicDescription *a2)
{
  return (*(uint64_t (**)(void, const AudioStreamBasicDescription *, uint64_t, void))(**((void **)this + 1)
                                                                                                 + 448))(*((void *)this + 1), a2, 1, *((unsigned int *)this + 6));
}

const char *AudioDSPGraph::InputPort::ClassName(AudioDSPGraph::InputPort *this)
{
  return "InputPort";
}

void AudioDSPGraph::InputPort::~InputPort(AudioDSPGraph::InputPort *this)
{
}

uint64_t AudioDSPGraph::FileInjector::print(uint64_t result, void *a2, int a3, uint64_t a4)
{
  if (a3 >= 5)
  {
    int v4 = a4;
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)result + 32))(result, a2, a4, 1);
    AudioDSPGraph::printi(a2, v4 + 4, "wire %p\n");
  }
  return result;
}

const char *AudioDSPGraph::FileInjector::ClassName(AudioDSPGraph::FileInjector *this)
{
  return "FileInjector";
}

void AudioDSPGraph::FileInjector::~FileInjector(void **this)
{
  *this = &unk_26FC9C378;
  uint64_t v2 = this + 10;
  std::vector<std::unique_ptr<TimeFreqConverter>>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SimpleABL *)(this + 2));

  JUMPOUT(0x24C585790);
}

{
  void **v2;

  *this = &unk_26FC9C378;
  uint64_t v2 = this + 10;
  std::vector<std::unique_ptr<TimeFreqConverter>>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SimpleABL *)(this + 2));
}

void std::vector<std::unique_ptr<TimeFreqConverter>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (TimeFreqConverter **)**a1;
  if (v2)
  {
    int v4 = (TimeFreqConverter **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<TimeFreqConverter>::reset[abi:ne180100](--v4);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

TimeFreqConverter *std::unique_ptr<TimeFreqConverter>::reset[abi:ne180100](TimeFreqConverter **a1)
{
  double result = *a1;
  *a1 = 0;
  if (result)
  {
    TimeFreqConverter::~TimeFreqConverter(result);
    JUMPOUT(0x24C585790);
  }
  return result;
}

uint64_t AudioDSPGraph::FileRecorder::print(uint64_t result, void *a2, int a3, uint64_t a4)
{
  if (a3 >= 5)
  {
    int v4 = a4;
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)result + 32))(result, a2, a4, 1);
    AudioDSPGraph::printi(a2, v4 + 4, "wire %p\n");
  }
  return result;
}

const char *AudioDSPGraph::FileRecorder::ClassName(AudioDSPGraph::FileRecorder *this)
{
  return "FileRecorder";
}

void AudioDSPGraph::FileRecorder::~FileRecorder(void **this)
{
  *this = &unk_26FC9C3B0;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SimpleABL *)(this + 9));
  unint64_t v3 = this + 6;
  std::vector<std::unique_ptr<TimeFreqConverter>>::__destroy_vector::operator()[abi:ne180100](&v3);
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  uint64_t v2 = this[2];
  this[2] = 0;
  if (v2) {
    (*(void (**)(void *))(*(void *)v2 + 8))(v2);
  }

  JUMPOUT(0x24C585790);
}

{
  void *v2;
  void **v3;

  *this = &unk_26FC9C3B0;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SimpleABL *)(this + 9));
  unint64_t v3 = this + 6;
  std::vector<std::unique_ptr<TimeFreqConverter>>::__destroy_vector::operator()[abi:ne180100](&v3);
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  uint64_t v2 = this[2];
  this[2] = 0;
  if (v2) {
    (*(void (**)(void *))(*(void *)v2 + 8))(v2);
  }
}

void *std::vector<std::unique_ptr<TimeFreqConverter>>::reserve(void *result, unint64_t a2)
{
  if (a2 > (uint64_t)(result[2] - *result) >> 3)
  {
    uint64_t v2 = (char **)result;
    uint64_t v3 = result[1] - *result;
    float v15 = result + 2;
    int v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::Box *>>(a2);
    unint64_t v7 = *v2;
    unint64_t v6 = v2[1];
    if (v6 == *v2)
    {
      int64x2_t v10 = vdupq_n_s64((unint64_t)v6);
      unint64_t v8 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      unint64_t v8 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        uint64_t v9 = *((void *)v6 - 1);
        v6 -= 8;
        *(void *)unint64_t v6 = 0;
        *((void *)v8 - 1) = v9;
        v8 -= 8;
      }
      while (v6 != v7);
      int64x2_t v10 = *(int64x2_t *)v2;
    }
    *uint64_t v2 = v8;
    v2[1] = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    int64x2_t v13 = v10;
    uint64_t v11 = v2[2];
    v2[2] = &v4[8 * v5];
    unint64_t v14 = v11;
    uint64_t v12 = v10.i64[0];
    return (void *)std::__split_buffer<std::unique_ptr<TimeFreqConverter>>::~__split_buffer((uint64_t)&v12);
  }
  return result;
}

uint64_t std::__split_buffer<std::unique_ptr<TimeFreqConverter>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::unique_ptr<TimeFreqConverter>::reset[abi:ne180100]((TimeFreqConverter **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

unint64_t caulk::numeric::exceptional_cast<unsigned int,unsigned long long>(unint64_t result)
{
  if (HIDWORD(result))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::overflow_error::overflow_error[abi:ne180100](exception, "numerical cast overflow: could not retain value in conversion type");
  }
  return result;
}

void sub_2489208D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void AudioDSPGraph::FileInjector::inject(AudioDSPGraph::FileInjector *this, unsigned int a2)
{
  unsigned int v4 = *((_DWORD *)this + 8);
  if (!v4)
  {
    kdebug_trace();
    unsigned int v4 = *((_DWORD *)this + 8);
  }
  unsigned int v5 = *((_DWORD *)this + 10);
  unint64_t v6 = (void *)*((void *)this + 1);
  if (v5 <= v4)
  {
    uint64_t v11 = v6[7];
    uint64_t v12 = *(_DWORD **)(v11 + 80);
    if (v12 && *v12)
    {
      unint64_t v13 = 0;
      size_t v14 = *((_DWORD *)this + 9) * a2;
      uint64_t v15 = 4;
      do
      {
        bzero(*(void **)&v12[v15], v14);
        ++v13;
        uint64_t v12 = *(_DWORD **)(v11 + 80);
        v15 += 4;
      }
      while (v13 < *v12);
    }
  }
  else
  {
    uint64_t v7 = v6[15];
    if (*(_DWORD *)(v7 + 8) == 1718773105)
    {
      if (*(_DWORD *)(v7 + 40) != a2)
      {
        std::string::basic_string[abi:ne180100]<0>(&v26, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Files.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v25, "inject");
        std::string::basic_string[abi:ne180100]<0>(&v24, "inNumFrames != blockSize.");
        AudioDSPGraph::ThrowException(1718188065, (long long *)&v26, 146, &v25, &v24);
      }
      unint64_t v8 = (_DWORD *)*((void *)this + 2);
      uint64_t v9 = v6[4];
      if (v9) {
        uint64_t v10 = *(void *)(*(void *)(*(void *)(v9 + 16) + 8) + 16);
      }
      else {
        uint64_t v10 = 0;
      }
      unsigned int v17 = *(_DWORD *)(v10 + 268);
      if (v17 == 1) {
        unsigned int v17 = *(_DWORD *)(v10 + 272);
      }
      if (*v8)
      {
        unint64_t v18 = 0;
        uint64_t v19 = *(void *)(v6[7] + 80);
        uint64_t v20 = *((_DWORD *)this + 9) * v4;
        uint64_t v21 = v17;
        uint64_t v22 = 4;
        do
        {
          uint64_t v23 = (float *)(*(void *)(v19 + v22 * 4) + 4 * v21);
          v26.realp = *(float **)(v19 + v22 * 4);
          v26.imagp = v23;
          TimeFreqConverter::Analyze(*(TimeFreqConverter **)(*((void *)this + 10) + 8 * v18++), (const float *)(*(void *)&v8[v22] + v20), &v26);
          v22 += 4;
        }
        while (v18 < *v8);
        unsigned int v4 = *((_DWORD *)this + 8);
        unsigned int v5 = *((_DWORD *)this + 10);
      }
      unsigned int v16 = v4 + a2;
      *((_DWORD *)this + 8) = v16;
    }
    else
    {
      if (v5 - v4 < a2) {
        a2 = v5 - v4;
      }
      AudioDSPGraph::SimpleABL::copy((unsigned int *)this + 4, (unsigned int **)(v6[7] + 80), *((_DWORD *)this + 9) * v4, 0, *((_DWORD *)this + 9) * a2, 1);
      unsigned int v16 = *((_DWORD *)this + 8) + a2;
      *((_DWORD *)this + 8) = v16;
      unsigned int v5 = *((_DWORD *)this + 10);
    }
    if (v16 == v5)
    {
      kdebug_trace();
      unsigned int v16 = *((_DWORD *)this + 8);
      unsigned int v5 = *((_DWORD *)this + 10);
    }
    if (v16 >= v5)
    {
      if (*((unsigned char *)this + 72)) {
        *((_DWORD *)this + 8) = 0;
      }
    }
  }
}

void sub_248920B44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void *___Z16NewAudioCapturer20AudioCapturerOptionsPKcS1_jPK27AudioStreamBasicDescriptionRS3__block_invoke_891()
{
  double result = dlopen("/usr/local/lib/libAudioDiagnostics.dylib", 5);
  if (result)
  {
    double result = dlsym(result, "NewAudioCapturerImpl");
    if (result) {
      NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction = result;
    }
  }
  return result;
}

uint64_t AudioDSPGraph::FileRecorder::record(uint64_t this)
{
  if (*(unsigned char *)(this + 88))
  {
    uint64_t v1 = (void *)this;
    this = *(void *)(this + 16);
    if (this)
    {
      uint64_t v2 = v1[1];
      uint64_t v3 = *(void *)(v2 + 56);
      if (v1[6] == v1[7])
      {
        unint64_t v6 = *(uint64_t (**)(void))(*(void *)this + 96);
      }
      else
      {
        uint64_t v4 = *(void *)(v2 + 32);
        if (v4) {
          uint64_t v5 = *(void *)(*(void *)(*(void *)(v4 + 16) + 8) + 16);
        }
        else {
          uint64_t v5 = 0;
        }
        unsigned int v7 = *(_DWORD *)(v5 + 268);
        if (v7 == 1) {
          unsigned int v7 = *(_DWORD *)(v5 + 272);
        }
        unint64_t v8 = *(_DWORD **)(v3 + 80);
        uint64_t v9 = v1[9];
        if (*v8)
        {
          unint64_t v10 = 0;
          uint64_t v11 = v7;
          uint64_t v12 = 4;
          do
          {
            unint64_t v13 = (float *)(*(void *)&v8[v12] + 4 * v11);
            v14.realp = *(float **)&v8[v12];
            v14.imagp = v13;
            TimeFreqConverter::Synthesize(*(TimeFreqConverter **)(v1[6] + 8 * v10++), &v14, *(float **)(v9 + v12 * 4));
            v12 += 4;
          }
          while (v10 < *v8);
          this = v1[2];
        }
        unint64_t v6 = *(uint64_t (**)(void))(*(void *)this + 96);
      }
      return v6();
    }
  }
  return this;
}

double AudioDSPGraph::Boxes::VolumeCurveBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.29504994e171;
  *(_OWORD *)a1 = xmmword_24893BEE0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

void AudioDSPGraph::Boxes::VolumeCurveBox::getParameterInfo(AudioDSPGraph::Boxes::VolumeCurveBox *this@<X0>, int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  if (a2)
  {
    char v5 = 0;
    int v6 = -10866;
LABEL_6:
    *(_DWORD *)a4 = v6;
    goto LABEL_7;
  }
  AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(this);
  if (0x4EC4EC4EC4EC4EC5
     * ((qword_269332600 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3) <= (unint64_t)a3)
  {
    char v5 = 0;
    int v6 = -10878;
    goto LABEL_6;
  }
  AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(v8);
  uint64_t v9 = AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos + 104 * a3;
  long long v10 = *(_OWORD *)(v9 + 80);
  *(_OWORD *)(a4 + 64) = *(_OWORD *)(v9 + 64);
  *(_OWORD *)(a4 + 80) = v10;
  *(void *)(a4 + 96) = *(void *)(v9 + 96);
  long long v11 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)a4 = *(_OWORD *)v9;
  *(_OWORD *)(a4 + 16) = v11;
  long long v12 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(a4 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(a4 + 48) = v12;
  char v5 = 1;
LABEL_7:
  *(unsigned char *)(a4 + 104) = v5;
}

void sub_248920E10(void *a1)
{
  __cxa_begin_catch(a1);
  *(_DWORD *)uint64_t v1 = -1;
  *(unsigned char *)(v1 + 104) = 0;
  __cxa_end_catch();
  JUMPOUT(0x248920E04);
}

void AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(AudioDSPGraph::Boxes::VolumeCurveBox *this)
{
  {
    if (v1)
    {
      AudioDSPGraph::Boxes::VolumeCurveBox::ParameterInfos::ParameterInfos(v1);
    }
  }
}

void sub_248920E90(_Unwind_Exception *a1)
{
}

void AudioDSPGraph::Boxes::VolumeCurveBox::ParameterInfos::ParameterInfos(AudioDSPGraph::Boxes::VolumeCurveBox::ParameterInfos *this)
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  qword_269332600 = 0;
  qword_269332608 = 0;
  AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos = 0;
  uint64_t v157 = 0;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  LODWORD(v156) = 1;
  DWORD2(v156) = 1097859072;
  strlcpy((char *)&v151, "Transfer function", 0x34uLL);
  *((void *)&v155 + 1) = @"Transfer function";
  LODWORD(v157) = v157 | 0xC8000000;
  uint64_t v1 = qword_269332600;
  if (qword_269332600 >= (unint64_t)qword_269332608)
  {
    unint64_t v8 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
    uint64_t v9 = 0x4EC4EC4EC4EC4EC5
       * ((qword_269332600 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) > 0x276276276276276) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    if (0x9D89D89D89D89D8ALL
       * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3) > v10)
      unint64_t v10 = 0x9D89D89D89D89D8ALL
          * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    if ((unint64_t)(0x4EC4EC4EC4EC4EC5
                          * ((qword_269332608
                            - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3)) >= 0x13B13B13B13B13BLL)
      unint64_t v11 = 0x276276276276276;
    else {
      unint64_t v11 = v10;
    }
    if (v11)
    {
      unint64_t v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioUnitParameterInfo>>(v11);
      unint64_t v8 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
      uint64_t v1 = qword_269332600;
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = v11 + 104 * v9;
    uint64_t v14 = v11 + 104 * v12;
    long long v15 = v151;
    long long v16 = v153;
    *(_OWORD *)(v13 + 16) = v152;
    *(_OWORD *)(v13 + 32) = v16;
    *(_OWORD *)uint64_t v13 = v15;
    long long v17 = v154;
    long long v18 = v155;
    long long v19 = v156;
    *(void *)(v13 + 96) = v157;
    *(_OWORD *)(v13 + 64) = v18;
    *(_OWORD *)(v13 + 80) = v19;
    *(_OWORD *)(v13 + 48) = v17;
    uint64_t v7 = v13 + 104;
    if ((void *)v1 == v8)
    {
      uint64_t v25 = v13;
    }
    else
    {
      do
      {
        long long v20 = *(_OWORD *)(v1 - 104);
        long long v21 = *(_OWORD *)(v1 - 88);
        *(_OWORD *)(v13 - 72) = *(_OWORD *)(v1 - 72);
        *(_OWORD *)(v13 - 88) = v21;
        *(_OWORD *)(v13 - 104) = v20;
        long long v22 = *(_OWORD *)(v1 - 56);
        long long v23 = *(_OWORD *)(v1 - 40);
        long long v24 = *(_OWORD *)(v1 - 24);
        uint64_t v25 = v13 - 104;
        *(void *)(v13 - 8) = *(void *)(v1 - 8);
        *(_OWORD *)(v13 - 24) = v24;
        *(_OWORD *)(v13 - 40) = v23;
        *(_OWORD *)(v13 - 56) = v22;
        v1 -= 104;
        v13 -= 104;
      }
      while ((void *)v1 != v8);
    }
    AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos = v25;
    qword_269332600 = v7;
    qword_269332608 = v14;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    long long v2 = v151;
    long long v3 = v153;
    *(_OWORD *)(qword_269332600 + 16) = v152;
    *(_OWORD *)(v1 + 32) = v3;
    *(_OWORD *)uint64_t v1 = v2;
    long long v4 = v154;
    long long v5 = v155;
    long long v6 = v156;
    *(void *)(v1 + 96) = v157;
    *(_OWORD *)(v1 + 64) = v5;
    *(_OWORD *)(v1 + 80) = v6;
    *(_OWORD *)(v1 + 48) = v4;
    uint64_t v7 = v1 + 104;
  }
  qword_269332600 = v7;
  uint64_t v157 = 0;
  long long v155 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  LODWORD(v156) = 13;
  *(void *)((char *)&v156 + 4) = 0x7F800000FF800000;
  HIDWORD(v156) = -1032847360;
  strlcpy((char *)&v151, "Minimum volume", 0x34uLL);
  *((void *)&v155 + 1) = @"Minimum volume";
  LODWORD(v157) = v157 | 0xC8000000;
  uint64_t v26 = qword_269332600;
  if (qword_269332600 >= (unint64_t)qword_269332608)
  {
    uint64_t v33 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
    uint64_t v34 = 0x4EC4EC4EC4EC4EC5
        * ((qword_269332600 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    unint64_t v35 = v34 + 1;
    if ((unint64_t)(v34 + 1) > 0x276276276276276) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    if (0x9D89D89D89D89D8ALL
       * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3) > v35)
      unint64_t v35 = 0x9D89D89D89D89D8ALL
          * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    if ((unint64_t)(0x4EC4EC4EC4EC4EC5
                          * ((qword_269332608
                            - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3)) >= 0x13B13B13B13B13BLL)
      unint64_t v36 = 0x276276276276276;
    else {
      unint64_t v36 = v35;
    }
    if (v36)
    {
      unint64_t v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioUnitParameterInfo>>(v36);
      uint64_t v33 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
      uint64_t v26 = qword_269332600;
    }
    else
    {
      uint64_t v37 = 0;
    }
    uint64_t v38 = v36 + 104 * v34;
    uint64_t v39 = v36 + 104 * v37;
    long long v40 = v151;
    long long v41 = v153;
    *(_OWORD *)(v38 + 16) = v152;
    *(_OWORD *)(v38 + 32) = v41;
    *(_OWORD *)uint64_t v38 = v40;
    long long v42 = v154;
    long long v43 = v155;
    long long v44 = v156;
    *(void *)(v38 + 96) = v157;
    *(_OWORD *)(v38 + 64) = v43;
    *(_OWORD *)(v38 + 80) = v44;
    *(_OWORD *)(v38 + 48) = v42;
    uint64_t v32 = v38 + 104;
    if ((void *)v26 == v33)
    {
      uint64_t v50 = v38;
    }
    else
    {
      do
      {
        long long v45 = *(_OWORD *)(v26 - 104);
        long long v46 = *(_OWORD *)(v26 - 88);
        *(_OWORD *)(v38 - 72) = *(_OWORD *)(v26 - 72);
        *(_OWORD *)(v38 - 88) = v46;
        *(_OWORD *)(v38 - 104) = v45;
        long long v47 = *(_OWORD *)(v26 - 56);
        long long v48 = *(_OWORD *)(v26 - 40);
        long long v49 = *(_OWORD *)(v26 - 24);
        uint64_t v50 = v38 - 104;
        *(void *)(v38 - 8) = *(void *)(v26 - 8);
        *(_OWORD *)(v38 - 24) = v49;
        *(_OWORD *)(v38 - 40) = v48;
        *(_OWORD *)(v38 - 56) = v47;
        v26 -= 104;
        v38 -= 104;
      }
      while ((void *)v26 != v33);
    }
    AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos = v50;
    qword_269332600 = v32;
    qword_269332608 = v39;
    if (v33) {
      operator delete(v33);
    }
  }
  else
  {
    long long v27 = v151;
    long long v28 = v153;
    *(_OWORD *)(qword_269332600 + 16) = v152;
    *(_OWORD *)(v26 + 32) = v28;
    *(_OWORD *)uint64_t v26 = v27;
    long long v29 = v154;
    long long v30 = v155;
    long long v31 = v156;
    *(void *)(v26 + 96) = v157;
    *(_OWORD *)(v26 + 64) = v30;
    *(_OWORD *)(v26 + 80) = v31;
    *(_OWORD *)(v26 + 48) = v29;
    uint64_t v32 = v26 + 104;
  }
  qword_269332600 = v32;
  uint64_t v157 = 0;
  long long v155 = 0u;
  HIDWORD(v156) = 0;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  LODWORD(v156) = 13;
  *(void *)((char *)&v156 + 4) = 0x7F800000FF800000;
  strlcpy((char *)&v151, "Maximum volume", 0x34uLL);
  *((void *)&v155 + 1) = @"Maximum volume";
  LODWORD(v157) = v157 | 0xC8000000;
  uint64_t v51 = qword_269332600;
  if (qword_269332600 >= (unint64_t)qword_269332608)
  {
    uint64_t v58 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
    uint64_t v59 = 0x4EC4EC4EC4EC4EC5
        * ((qword_269332600 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    unint64_t v60 = v59 + 1;
    if ((unint64_t)(v59 + 1) > 0x276276276276276) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    if (0x9D89D89D89D89D8ALL
       * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3) > v60)
      unint64_t v60 = 0x9D89D89D89D89D8ALL
          * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    if ((unint64_t)(0x4EC4EC4EC4EC4EC5
                          * ((qword_269332608
                            - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3)) >= 0x13B13B13B13B13BLL)
      unint64_t v61 = 0x276276276276276;
    else {
      unint64_t v61 = v60;
    }
    if (v61)
    {
      unint64_t v61 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioUnitParameterInfo>>(v61);
      uint64_t v58 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
      uint64_t v51 = qword_269332600;
    }
    else
    {
      uint64_t v62 = 0;
    }
    uint64_t v63 = v61 + 104 * v59;
    uint64_t v64 = v61 + 104 * v62;
    long long v65 = v151;
    long long v66 = v153;
    *(_OWORD *)(v63 + 16) = v152;
    *(_OWORD *)(v63 + 32) = v66;
    *(_OWORD *)uint64_t v63 = v65;
    long long v67 = v154;
    long long v68 = v155;
    long long v69 = v156;
    *(void *)(v63 + 96) = v157;
    *(_OWORD *)(v63 + 64) = v68;
    *(_OWORD *)(v63 + 80) = v69;
    *(_OWORD *)(v63 + 48) = v67;
    uint64_t v57 = v63 + 104;
    if ((void *)v51 == v58)
    {
      uint64_t v75 = v63;
    }
    else
    {
      do
      {
        long long v70 = *(_OWORD *)(v51 - 104);
        long long v71 = *(_OWORD *)(v51 - 88);
        *(_OWORD *)(v63 - 72) = *(_OWORD *)(v51 - 72);
        *(_OWORD *)(v63 - 88) = v71;
        *(_OWORD *)(v63 - 104) = v70;
        long long v72 = *(_OWORD *)(v51 - 56);
        long long v73 = *(_OWORD *)(v51 - 40);
        long long v74 = *(_OWORD *)(v51 - 24);
        uint64_t v75 = v63 - 104;
        *(void *)(v63 - 8) = *(void *)(v51 - 8);
        *(_OWORD *)(v63 - 24) = v74;
        *(_OWORD *)(v63 - 40) = v73;
        *(_OWORD *)(v63 - 56) = v72;
        v51 -= 104;
        v63 -= 104;
      }
      while ((void *)v51 != v58);
    }
    AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos = v75;
    qword_269332600 = v57;
    qword_269332608 = v64;
    if (v58) {
      operator delete(v58);
    }
  }
  else
  {
    long long v52 = v151;
    long long v53 = v153;
    *(_OWORD *)(qword_269332600 + 16) = v152;
    *(_OWORD *)(v51 + 32) = v53;
    *(_OWORD *)uint64_t v51 = v52;
    long long v54 = v154;
    long long v55 = v155;
    long long v56 = v156;
    *(void *)(v51 + 96) = v157;
    *(_OWORD *)(v51 + 64) = v55;
    *(_OWORD *)(v51 + 80) = v56;
    *(_OWORD *)(v51 + 48) = v54;
    uint64_t v57 = v51 + 104;
  }
  qword_269332600 = v57;
  uint64_t v157 = 0;
  long long v155 = 0u;
  *(void *)&long long v156 = 0;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  *((void *)&v156 + 1) = 0x3E8000003F800000;
  strlcpy((char *)&v151, "Raw slider value", 0x34uLL);
  *((void *)&v155 + 1) = @"Raw slider value";
  LODWORD(v157) = v157 | 0xC8000000;
  uint64_t v76 = qword_269332600;
  if (qword_269332600 >= (unint64_t)qword_269332608)
  {
    long long v83 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
    uint64_t v84 = 0x4EC4EC4EC4EC4EC5
        * ((qword_269332600 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    unint64_t v85 = v84 + 1;
    if ((unint64_t)(v84 + 1) > 0x276276276276276) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    if (0x9D89D89D89D89D8ALL
       * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3) > v85)
      unint64_t v85 = 0x9D89D89D89D89D8ALL
          * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    if ((unint64_t)(0x4EC4EC4EC4EC4EC5
                          * ((qword_269332608
                            - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3)) >= 0x13B13B13B13B13BLL)
      unint64_t v86 = 0x276276276276276;
    else {
      unint64_t v86 = v85;
    }
    if (v86)
    {
      unint64_t v86 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioUnitParameterInfo>>(v86);
      long long v83 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
      uint64_t v76 = qword_269332600;
    }
    else
    {
      uint64_t v87 = 0;
    }
    uint64_t v88 = v86 + 104 * v84;
    uint64_t v89 = v86 + 104 * v87;
    long long v90 = v151;
    long long v91 = v153;
    *(_OWORD *)(v88 + 16) = v152;
    *(_OWORD *)(v88 + 32) = v91;
    *(_OWORD *)uint64_t v88 = v90;
    long long v92 = v154;
    long long v93 = v155;
    long long v94 = v156;
    *(void *)(v88 + 96) = v157;
    *(_OWORD *)(v88 + 64) = v93;
    *(_OWORD *)(v88 + 80) = v94;
    *(_OWORD *)(v88 + 48) = v92;
    uint64_t v82 = v88 + 104;
    if ((void *)v76 == v83)
    {
      uint64_t v100 = v88;
    }
    else
    {
      do
      {
        long long v95 = *(_OWORD *)(v76 - 104);
        long long v96 = *(_OWORD *)(v76 - 88);
        *(_OWORD *)(v88 - 72) = *(_OWORD *)(v76 - 72);
        *(_OWORD *)(v88 - 88) = v96;
        *(_OWORD *)(v88 - 104) = v95;
        long long v97 = *(_OWORD *)(v76 - 56);
        long long v98 = *(_OWORD *)(v76 - 40);
        long long v99 = *(_OWORD *)(v76 - 24);
        uint64_t v100 = v88 - 104;
        *(void *)(v88 - 8) = *(void *)(v76 - 8);
        *(_OWORD *)(v88 - 24) = v99;
        *(_OWORD *)(v88 - 40) = v98;
        *(_OWORD *)(v88 - 56) = v97;
        v76 -= 104;
        v88 -= 104;
      }
      while ((void *)v76 != v83);
    }
    AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos = v100;
    qword_269332600 = v82;
    qword_269332608 = v89;
    if (v83) {
      operator delete(v83);
    }
  }
  else
  {
    long long v77 = v151;
    long long v78 = v153;
    *(_OWORD *)(qword_269332600 + 16) = v152;
    *(_OWORD *)(v76 + 32) = v78;
    *(_OWORD *)uint64_t v76 = v77;
    long long v79 = v154;
    long long v80 = v155;
    long long v81 = v156;
    *(void *)(v76 + 96) = v157;
    *(_OWORD *)(v76 + 64) = v80;
    *(_OWORD *)(v76 + 80) = v81;
    *(_OWORD *)(v76 + 48) = v79;
    uint64_t v82 = v76 + 104;
  }
  qword_269332600 = v82;
  uint64_t v157 = 0;
  long long v155 = 0u;
  *(void *)&long long v156 = 0;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  *((void *)&v156 + 1) = 0x3E8000003F800000;
  strlcpy((char *)&v151, "Mapped slider value", 0x34uLL);
  *((void *)&v155 + 1) = @"Mapped slider value";
  LODWORD(v157) = v157 | 0x48000000;
  uint64_t v101 = qword_269332600;
  if (qword_269332600 >= (unint64_t)qword_269332608)
  {
    v108 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
    uint64_t v109 = 0x4EC4EC4EC4EC4EC5
         * ((qword_269332600 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    unint64_t v110 = v109 + 1;
    if ((unint64_t)(v109 + 1) > 0x276276276276276) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    if (0x9D89D89D89D89D8ALL
       * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3) > v110)
      unint64_t v110 = 0x9D89D89D89D89D8ALL
           * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    if ((unint64_t)(0x4EC4EC4EC4EC4EC5
                          * ((qword_269332608
                            - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3)) >= 0x13B13B13B13B13BLL)
      unint64_t v111 = 0x276276276276276;
    else {
      unint64_t v111 = v110;
    }
    if (v111)
    {
      unint64_t v111 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioUnitParameterInfo>>(v111);
      v108 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
      uint64_t v101 = qword_269332600;
    }
    else
    {
      uint64_t v112 = 0;
    }
    uint64_t v113 = v111 + 104 * v109;
    uint64_t v114 = v111 + 104 * v112;
    long long v115 = v151;
    long long v116 = v153;
    *(_OWORD *)(v113 + 16) = v152;
    *(_OWORD *)(v113 + 32) = v116;
    *(_OWORD *)uint64_t v113 = v115;
    long long v117 = v154;
    long long v118 = v155;
    long long v119 = v156;
    *(void *)(v113 + 96) = v157;
    *(_OWORD *)(v113 + 64) = v118;
    *(_OWORD *)(v113 + 80) = v119;
    *(_OWORD *)(v113 + 48) = v117;
    uint64_t v107 = v113 + 104;
    if ((void *)v101 == v108)
    {
      uint64_t v125 = v113;
    }
    else
    {
      do
      {
        long long v120 = *(_OWORD *)(v101 - 104);
        long long v121 = *(_OWORD *)(v101 - 88);
        *(_OWORD *)(v113 - 72) = *(_OWORD *)(v101 - 72);
        *(_OWORD *)(v113 - 88) = v121;
        *(_OWORD *)(v113 - 104) = v120;
        long long v122 = *(_OWORD *)(v101 - 56);
        long long v123 = *(_OWORD *)(v101 - 40);
        long long v124 = *(_OWORD *)(v101 - 24);
        uint64_t v125 = v113 - 104;
        *(void *)(v113 - 8) = *(void *)(v101 - 8);
        *(_OWORD *)(v113 - 24) = v124;
        *(_OWORD *)(v113 - 40) = v123;
        *(_OWORD *)(v113 - 56) = v122;
        v101 -= 104;
        v113 -= 104;
      }
      while ((void *)v101 != v108);
    }
    AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos = v125;
    qword_269332600 = v107;
    qword_269332608 = v114;
    if (v108) {
      operator delete(v108);
    }
  }
  else
  {
    long long v102 = v151;
    long long v103 = v153;
    *(_OWORD *)(qword_269332600 + 16) = v152;
    *(_OWORD *)(v101 + 32) = v103;
    *(_OWORD *)uint64_t v101 = v102;
    long long v104 = v154;
    long long v105 = v155;
    long long v106 = v156;
    *(void *)(v101 + 96) = v157;
    *(_OWORD *)(v101 + 64) = v105;
    *(_OWORD *)(v101 + 80) = v106;
    *(_OWORD *)(v101 + 48) = v104;
    uint64_t v107 = v101 + 104;
  }
  qword_269332600 = v107;
  uint64_t v157 = 0;
  long long v155 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  LODWORD(v156) = 13;
  *(void *)((char *)&v156 + 4) = 0x7F800000FF800000;
  HIDWORD(v156) = -1036779520;
  strlcpy((char *)&v151, "Decibel gain", 0x34uLL);
  *((void *)&v155 + 1) = @"Decibel gain";
  LODWORD(v157) = v157 | 0x48000000;
  uint64_t v126 = qword_269332600;
  if (qword_269332600 >= (unint64_t)qword_269332608)
  {
    v133 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
    uint64_t v134 = 0x4EC4EC4EC4EC4EC5
         * ((qword_269332600 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    unint64_t v135 = v134 + 1;
    if ((unint64_t)(v134 + 1) > 0x276276276276276) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    if (0x9D89D89D89D89D8ALL
       * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3) > v135)
      unint64_t v135 = 0x9D89D89D89D89D8ALL
           * ((qword_269332608 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3);
    if ((unint64_t)(0x4EC4EC4EC4EC4EC5
                          * ((qword_269332608
                            - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3)) >= 0x13B13B13B13B13BLL)
      unint64_t v136 = 0x276276276276276;
    else {
      unint64_t v136 = v135;
    }
    if (v136)
    {
      unint64_t v136 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioUnitParameterInfo>>(v136);
      v133 = (void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
      uint64_t v126 = qword_269332600;
    }
    else
    {
      uint64_t v137 = 0;
    }
    uint64_t v138 = v136 + 104 * v134;
    uint64_t v139 = v136 + 104 * v137;
    long long v140 = v151;
    long long v141 = v153;
    *(_OWORD *)(v138 + 16) = v152;
    *(_OWORD *)(v138 + 32) = v141;
    *(_OWORD *)uint64_t v138 = v140;
    long long v142 = v154;
    long long v143 = v155;
    long long v144 = v156;
    *(void *)(v138 + 96) = v157;
    *(_OWORD *)(v138 + 64) = v143;
    *(_OWORD *)(v138 + 80) = v144;
    *(_OWORD *)(v138 + 48) = v142;
    uint64_t v132 = v138 + 104;
    if ((void *)v126 == v133)
    {
      uint64_t v150 = v138;
    }
    else
    {
      do
      {
        long long v145 = *(_OWORD *)(v126 - 104);
        long long v146 = *(_OWORD *)(v126 - 88);
        *(_OWORD *)(v138 - 72) = *(_OWORD *)(v126 - 72);
        *(_OWORD *)(v138 - 88) = v146;
        *(_OWORD *)(v138 - 104) = v145;
        long long v147 = *(_OWORD *)(v126 - 56);
        long long v148 = *(_OWORD *)(v126 - 40);
        long long v149 = *(_OWORD *)(v126 - 24);
        uint64_t v150 = v138 - 104;
        *(void *)(v138 - 8) = *(void *)(v126 - 8);
        *(_OWORD *)(v138 - 24) = v149;
        *(_OWORD *)(v138 - 40) = v148;
        *(_OWORD *)(v138 - 56) = v147;
        v126 -= 104;
        v138 -= 104;
      }
      while ((void *)v126 != v133);
    }
    AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos = v150;
    qword_269332600 = v132;
    qword_269332608 = v139;
    if (v133) {
      operator delete(v133);
    }
  }
  else
  {
    long long v127 = v151;
    long long v128 = v153;
    *(_OWORD *)(qword_269332600 + 16) = v152;
    *(_OWORD *)(v126 + 32) = v128;
    *(_OWORD *)uint64_t v126 = v127;
    long long v129 = v154;
    long long v130 = v155;
    long long v131 = v156;
    *(void *)(v126 + 96) = v157;
    *(_OWORD *)(v126 + 64) = v130;
    *(_OWORD *)(v126 + 80) = v131;
    *(_OWORD *)(v126 + 48) = v129;
    uint64_t v132 = v126 + 104;
  }
  qword_269332600 = v132;
}

void sub_248921964(_Unwind_Exception *exception_object)
{
  if (AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos)
  {
    qword_269332600 = AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos;
    operator delete((void *)AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AudioUnitParameterInfo>>(unint64_t a1)
{
  if (a1 >= 0x276276276276277) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(104 * a1);
}

std::vector<unsigned int> *AudioDSPGraph::Boxes::VolumeCurveBox::getParameterList@<X0>(std::vector<unsigned int> *this@<X0>, int a2@<W1>, std::vector<unsigned int> *a3@<X8>)
{
  if (a2)
  {
    a3->__begin_ = 0;
    a3->__end_ = 0;
    a3->__end_cap_.__value_ = 0;
  }
  else
  {
    AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos((AudioDSPGraph::Boxes::VolumeCurveBox *)this);
    this = std::vector<unsigned int>::vector(a3, 0x4EC4EC4EC4EC4EC5* ((qword_269332600 - AudioDSPGraph::Boxes::VolumeCurveBox::parameterInfos(void)::sParameterInfos) >> 3));
    std::vector<unsigned int>::pointer begin = a3->__begin_;
    std::vector<unsigned int>::pointer end = a3->__end_;
    if (a3->__begin_ != end)
    {
      unsigned int v6 = 0;
      do
        *begin++ = v6++;
      while (begin != end);
    }
  }
  return this;
}

float AudioDSPGraph::Boxes::VolumeCurveBox::getParameter(AudioDSPGraph::Boxes::VolumeCurveBox *this, int a2, int a3)
{
  if (a3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/VolumeCurveBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v5, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v4, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10878, &v6, 245, &v5, &v4);
  }
  switch(a2)
  {
    case 0:
      float result = (float)*((unsigned int *)this + 193);
      break;
    case 1:
      float result = *((float *)this + 196);
      break;
    case 2:
      float result = *((float *)this + 197);
      break;
    case 3:
      float result = *((float *)this + 198);
      break;
    case 4:
      float result = *((float *)this + 199);
      break;
    case 5:
      float result = *((float *)this + 200);
      break;
    default:
      std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/VolumeCurveBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v5, "getParameter");
      std::string::basic_string[abi:ne180100]<0>(&v4, &byte_248942E06);
      AudioDSPGraph::ThrowException(-10878, &v6, 270, &v5, &v4);
  }
  return result;
}

void sub_248921B88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::Boxes::VolumeCurveBox::setParameter(AudioDSPGraph::Boxes::VolumeCurveBox *this, int a2, int a3, float a4)
{
  if (a3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v21, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/VolumeCurveBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v20, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v19, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10878, &v21, 200, &v20, &v19);
  }
  switch(a2)
  {
    case 0:
      unsigned int v6 = a4;
      *((_DWORD *)this + 193) = a4;
      float v7 = 1.0;
      float v8 = 2.0;
      float v9 = 1.0;
      if (v6 <= 0xF)
      {
        float v8 = flt_24893C160[v6];
        float v9 = flt_24893C1A0[v6];
      }
      *((float *)this + 194) = v8;
      *((float *)this + 195) = v9;
      float v10 = *((float *)this + 198);
      if (v10 < 0.0) {
        float v10 = 0.0;
      }
      if (v10 <= 1.0) {
        float v7 = v10;
      }
      goto LABEL_21;
    case 1:
      float v16 = *((float *)this + 197);
      if (v16 < a4)
      {
        std::string::basic_string[abi:ne180100]<0>(&v21, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/VolumeCurveBox.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v20, "setParameter");
        std::string::basic_string[abi:ne180100]<0>(&v19, "MinVolume must be less than MaxVolume");
        AudioDSPGraph::ThrowException(-10878, &v21, 211, &v20, &v19);
      }
      *((float *)this + 196) = a4;
      float v17 = *((float *)this + 198);
      if (v17 < 0.0) {
        float v17 = 0.0;
      }
      if (v17 > 1.0) {
        float v17 = 1.0;
      }
      float v18 = powf(v17, *((float *)this + 194) / *((float *)this + 195));
      *((float *)this + 199) = v18;
      float v14 = a4 + (float)(v18 * (float)(v16 - a4));
      goto LABEL_28;
    case 2:
      float v11 = *((float *)this + 196);
      if (v11 > a4)
      {
        std::string::basic_string[abi:ne180100]<0>(&v21, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/VolumeCurveBox.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v20, "setParameter");
        std::string::basic_string[abi:ne180100]<0>(&v19, "MaxVolume must be greater than MinVolume");
        AudioDSPGraph::ThrowException(-10878, &v21, 220, &v20, &v19);
      }
      *((float *)this + 197) = a4;
      float v12 = *((float *)this + 198);
      if (v12 < 0.0) {
        float v12 = 0.0;
      }
      if (v12 > 1.0) {
        float v12 = 1.0;
      }
      float v13 = powf(v12, *((float *)this + 194) / *((float *)this + 195));
      *((float *)this + 199) = v13;
      float v14 = v11 + (float)(v13 * (float)(a4 - v11));
      goto LABEL_28;
    case 3:
      float v7 = 0.0;
      if (a4 >= 0.0) {
        float v7 = a4;
      }
      if (v7 > 1.0) {
        float v7 = 1.0;
      }
      *((float *)this + 198) = v7;
      float v8 = *((float *)this + 194);
      float v9 = *((float *)this + 195);
LABEL_21:
      float v15 = powf(v7, v8 / v9);
      *((float *)this + 199) = v15;
      float v14 = *((float *)this + 196) + (float)(v15 * (float)(*((float *)this + 197) - *((float *)this + 196)));
LABEL_28:
      *((float *)this + 200) = v14;
      return;
    default:
      std::string::basic_string[abi:ne180100]<0>(&v21, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Boxes/VolumeCurveBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v20, "setParameter");
      std::string::basic_string[abi:ne180100]<0>(&v19, &byte_248942E06);
      AudioDSPGraph::ThrowException(-10878, &v21, 235, &v20, &v19);
  }
}

void sub_248921EC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Boxes::VolumeCurveBox::canProcessInPlace(AudioDSPGraph::Boxes::VolumeCurveBox *this)
{
  return 1;
}

const char *AudioDSPGraph::Boxes::VolumeCurveBox::ClassName(AudioDSPGraph::Boxes::VolumeCurveBox *this)
{
  return "VolumeCurveBox";
}

void AudioDSPGraph::Boxes::VolumeCurveBox::~VolumeCurveBox(AudioDSPGraph::Boxes::VolumeCurveBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

void AudioDSPGraph::Base::printShort(uint64_t a1, void *a2, unsigned int a3)
{
}

void AudioDSPGraph::ThrowException(int a1, long long *a2, int a3, long long *a4, long long *a5)
{
  exception = __cxa_allocate_exception(0x60uLL);
  AudioDSPGraph::Exception::Exception((uint64_t)exception, a1, a2, a3, a4, a5);
}

void sub_248922094(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t AudioDSPGraph::Exception::Exception(uint64_t a1, int a2, long long *a3, int a4, long long *a5, long long *a6)
{
  *(void *)a1 = &unk_26FC9C698;
  *(_DWORD *)(a1 + 8) = a2;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 16), *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v10 = *a3;
    *(void *)(a1 + 32) = *((void *)a3 + 2);
    *(_OWORD *)(a1 + 16) = v10;
  }
  *(_DWORD *)(a1 + 40) = a4;
  if (*((char *)a5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 48), *(const std::string::value_type **)a5, *((void *)a5 + 1));
  }
  else
  {
    long long v11 = *a5;
    *(void *)(a1 + 64) = *((void *)a5 + 2);
    *(_OWORD *)(a1 + 48) = v11;
  }
  float v12 = (std::string *)(a1 + 72);
  if (*((char *)a6 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v12, *(const std::string::value_type **)a6, *((void *)a6 + 1));
  }
  else
  {
    long long v13 = *a6;
    *(void *)(a1 + 88) = *((void *)a6 + 2);
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
  }
  return a1;
}

void sub_24892218C(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 71) < 0) {
    operator delete(*v3);
  }
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*v2);
  }
  std::exception::~exception((std::exception *)v1);
  _Unwind_Resume(a1);
}

void AudioDSPGraph::Exception::~Exception(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26FC9C698;
  if (SHIBYTE(this[11].__vftable) < 0) {
    operator delete(this[9].__vftable);
  }
  if (SHIBYTE(this[8].__vftable) < 0) {
    operator delete(this[6].__vftable);
  }
  if (SHIBYTE(this[4].__vftable) < 0) {
    operator delete(this[2].__vftable);
  }

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26FC9C698;
  if (SHIBYTE(this[11].__vftable) < 0) {
    operator delete(this[9].__vftable);
  }
  if (SHIBYTE(this[8].__vftable) < 0) {
    operator delete(this[6].__vftable);
  }
  if (SHIBYTE(this[4].__vftable) < 0) {
    operator delete(this[2].__vftable);
  }
  std::exception::~exception(this);

  JUMPOUT(0x24C585790);
}

uint64_t AudioDSPGraph::Exception::what(AudioDSPGraph::Exception *this)
{
  uint64_t result = (uint64_t)this + 72;
  if (*((char *)this + 95) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t AudioDSPGraph::Graph::getProperty(AudioDSPGraph::Graph *this, unsigned int a2, unsigned int *a3, void *a4)
{
  long long v4 = std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>>>::find<unsigned int>((void *)this + 66, a2);
  if (!v4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v10, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Graph.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v9, "getProperty");
    std::string::basic_string[abi:ne180100]<0>(&v8, "getProperty : inPropertyID not found");
    AudioDSPGraph::ThrowException(1852204065, &v10, 2336, &v9, &v8);
  }
  uint64_t v5 = v4[9];
  if (v4[10] == v5)
  {
    std::string::basic_string[abi:ne180100]<0>(&v10, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Graph.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v9, "getProperty");
    std::string::basic_string[abi:ne180100]<0>(&v8, "getProperty : property is not connected to any box.");
    AudioDSPGraph::ThrowException(1969451041, &v10, 2344, &v9, &v8);
  }
  unsigned int v6 = *(uint64_t (**)(void))(**(void **)v5 + 304);

  return v6();
}

void sub_248922430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>>>::find<unsigned int>(void *a1, unsigned int a2)
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
  uint64_t v5 = *(uint64_t ***)(*a1 + 8 * v4);
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

unint64_t AudioDSPGraph::Graph::getPropertyInfo(AudioDSPGraph::Graph *this, unsigned int a2)
{
  unint64_t v2 = std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>>>::find<unsigned int>((void *)this + 66, a2);
  if (v2)
  {
    uint8x8_t v3 = (unsigned int *)v2[9];
    if ((unsigned int *)v2[10] == v3)
    {
      unint64_t v5 = 0;
      uint64_t v6 = 1969451041;
    }
    else
    {
      uint64_t v4 = (*(uint64_t (**)(void, void, void, void))(**(void **)v3 + 296))(*(void *)v3, v3[2], v3[3], v3[4]);
      unint64_t v5 = v4 & 0xFFFFFFFF00000000;
      uint64_t v6 = v4;
    }
  }
  else
  {
    unint64_t v5 = 0;
    uint64_t v6 = 1852204065;
  }
  return v5 | v6;
}

uint64_t *AudioDSPGraph::Graph::setProperty(AudioDSPGraph::Graph *this, unsigned int a2, uint64_t a3, const void *a4)
{
  uint64_t result = std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>>>::find<unsigned int>((void *)this + 66, a2);
  if (!result)
  {
    std::string::basic_string[abi:ne180100]<0>(&v11, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Graph.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v10, "setProperty");
    std::string::basic_string[abi:ne180100]<0>(&v9, "setProperty : inPropertyID not found");
    AudioDSPGraph::ThrowException(1852204065, &v11, 2308, &v10, &v9);
  }
  unint64_t v7 = (unsigned int *)result[9];
  long long v8 = (unsigned int *)result[10];
  while (v7 != v8)
  {
    uint64_t result = (uint64_t *)(*(uint64_t (**)(void, void, void, void, uint64_t, const void *))(**(void **)v7 + 312))(*(void *)v7, v7[2], v7[3], v7[4], a3, a4);
    v7 += 6;
  }
  return result;
}

void sub_2489226CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

float AudioDSPGraph::Graph::getParameter(AudioDSPGraph::Graph *this, unsigned int a2)
{
  unint64_t v2 = std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>>>::find<unsigned int>((void *)this + 61, a2);
  if (!v2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Graph.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, "getParameter : inParamID not found");
    AudioDSPGraph::ThrowException(1852204065, &v8, 2414, &v7, &v6);
  }
  if (!*((unsigned char *)v2 + 32)) {
    return *((float *)v2 + 7);
  }
  uint64_t v3 = v2[5];
  if (v2[6] == v3) {
    return *((float *)v2 + 7);
  }
  uint64_t v4 = *(void (**)(void))(**(void **)v3 + 88);

  v4();
  return result;
}

void sub_2489227FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t *AudioDSPGraph::Graph::setParameter(AudioDSPGraph::Graph *this, unsigned int a2, float a3)
{
  float result = std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>>>::find<unsigned int>((void *)this + 61, a2);
  if (!result)
  {
    std::string::basic_string[abi:ne180100]<0>(&v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Graph.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v8, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v7, "setParameter : inParamID not found");
    AudioDSPGraph::ThrowException(1852204065, &v9, 2400, &v8, &v7);
  }
  *((float *)result + 7) = a3;
  unint64_t v5 = (unsigned int *)result[5];
  long long v6 = (unsigned int *)result[6];
  while (v5 != v6)
  {
    float result = (uint64_t *)(*(uint64_t (**)(void, void, void, void, void, float))(**(void **)v5 + 80))(*(void *)v5, v5[2], v5[3], v5[4], 0, a3);
    v5 += 6;
  }
  return result;
}

void sub_248922924(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Graph::print(uint64_t result, void *a2, int a3, uint64_t a4)
{
  if (a3 >= 1)
  {
    int v4 = a4;
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)result + 32))(result, a2, a4, 1);
    AudioDSPGraph::printi(a2, v4 + 4, "initialized %d\n");
  }
  return result;
}

const char *AudioDSPGraph::Graph::ClassName(AudioDSPGraph::Graph *this)
{
  return "Graph";
}

void AudioDSPGraph::Graph::~Graph(AudioDSPGraph::Graph *this)
{
  AudioDSPGraph::Graph::~Graph(this);

  JUMPOUT(0x24C585790);
}

{
  uint64_t **i;
  void *j;
  uint64_t **k;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t **m;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t n;
  uint64_t **ii;
  void *jj;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t kk;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void **v27;

  *(void *)this = &unk_26FC9C6C0;
  if (*((unsigned char *)this + 730))
  {
    for (uint64_t i = (uint64_t **)*((void *)this + 3); i; uint64_t i = (uint64_t **)*i)
    {
      (*(void (**)(uint64_t *))(*i[2] + 584))(i[2]);
      (*(void (**)(uint64_t *))(*i[2] + 616))(i[2]);
    }
    for (j = (void *)*((void *)this + 8); j; j = (void *)*j)
      *(void *)(j[2] + 56) = 0;
    std::vector<std::unique_ptr<AudioDSPGraph::InternalBuffer>>::__clear[abi:ne180100]((void *)this + 24);
    *((unsigned char *)this + 730) = 0;
  }
  for (k = (uint64_t **)*((void *)this + 3); k; k = (uint64_t **)*k)
    (*(void (**)(uint64_t *))(*k[2] + 624))(k[2]);
  unint64_t v5 = *((void *)this + 32);
  long long v6 = *((void *)this + 33);
  if (v5 != v6)
  {
    do
    {
      long long v7 = *(void **)v5;
      long long v8 = *(void **)(*(void *)v5 + 176);
      long long v9 = *(void **)(*(void *)v5 + 184);
      while (v8 != v9)
      {
        (*(void (**)(void))(*(void *)*v8 + 688))(*v8);
        ++v8;
      }
      for (m = (uint64_t **)v7[14]; m; m = (uint64_t **)*m)
        (*(void (**)(uint64_t *))(*m[2] + 688))(m[2]);
      float v12 = (void *)v7[25];
      long long v11 = (void *)v7[26];
      while (v12 != v11)
      {
        (*(void (**)(void))(*(void *)*v12 + 688))(*v12);
        ++v12;
      }
      v5 += 8;
    }
    while (v5 != v6);
    unint64_t v5 = *((void *)this + 32);
  }
  *((void *)this + 33) = v5;
  if (*((void *)this + 30))
  {
    std::__hash_table<std::unique_ptr<AudioDSPGraph::IsoGroup>,std::hash<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::equal_to<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::allocator<std::unique_ptr<AudioDSPGraph::IsoGroup>>>::__deallocate_node(*((void **)this + 29));
    *((void *)this + 29) = 0;
    long long v13 = *((void *)this + 28);
    if (v13)
    {
      for (n = 0; n != v13; ++n)
        *(void *)(*((void *)this + 27) + 8 * n) = 0;
    }
    *((void *)this + 30) = 0;
  }
  *((unsigned char *)this + 729) = 0;
  for (iuint64_t i = (uint64_t **)*((void *)this + 3); ii; iuint64_t i = (uint64_t **)*ii)
    (*(void (**)(uint64_t *))(*ii[2] + 568))(ii[2]);
  for (jj = (void *)*((void *)this + 8); jj; jj = (void *)*jj)
  {
    float v17 = jj[2];
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
    }
  }
  if (*((void *)this + 9))
  {
    float v18 = (void *)*((void *)this + 8);
    if (v18)
    {
      do
      {
        long long v19 = (void *)*v18;
        operator delete(v18);
        float v18 = v19;
      }
      while (v19);
    }
    *((void *)this + 8) = 0;
    long long v20 = *((void *)this + 7);
    if (v20)
    {
      for (kk = 0; kk != v20; ++kk)
        *(void *)(*((void *)this + 6) + 8 * kk) = 0;
    }
    *((void *)this + 9) = 0;
  }
  std::__hash_table<std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>>>::~__hash_table((uint64_t)this + 1016);
  std::__function::__value_func<void ()(double)>::~__value_func[abi:ne180100]((void *)this + 123);
  std::unique_ptr<AudioDSPGraph::Graph::profiler_t>::reset[abi:ne180100]((uint64_t *)this + 122);
  long long v27 = (void **)((char *)this + 952);
  std::vector<AudioDSPGraph::Graph::GraphBridge>::__destroy_vector::operator()[abi:ne180100](&v27);
  *((void *)this + 113) = &unk_26FC9C720;
  std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::AnalyzerBuilder::Info>>>::~__hash_table((uint64_t)this + 912);
  long long v27 = (void **)((char *)this + 864);
  std::vector<std::unique_ptr<AudioDSPGraph::Subset>>::__destroy_vector::operator()[abi:ne180100](&v27);
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table((uint64_t)this + 824);
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table((uint64_t)this + 784);
  std::__hash_table<std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioDSPGraph::Box *>>>::~__hash_table((uint64_t)this + 744);
  std::unique_ptr<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>>::reset[abi:ne180100]((uint64_t *)this + 81, 0);
  std::__hash_table<std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioDSPGraph::Box *>>>::~__hash_table((uint64_t)this + 608);
  std::__hash_table<std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioDSPGraph::Box *>>>::~__hash_table((uint64_t)this + 568);
  std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>>>::~__hash_table((uint64_t)this + 528);
  std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>>>::~__hash_table((uint64_t)this + 488);
  long long v22 = (void *)*((void *)this + 58);
  if (v22)
  {
    *((void *)this + 59) = v22;
    operator delete(v22);
  }
  long long v23 = (void *)*((void *)this + 55);
  if (v23)
  {
    *((void *)this + 56) = v23;
    operator delete(v23);
  }
  if (*((char *)this + 431) < 0) {
    operator delete(*((void **)this + 51));
  }
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table((uint64_t)this + 368);
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table((uint64_t)this + 328);
  long long v24 = (void *)*((void *)this + 38);
  if (v24)
  {
    *((void *)this + 39) = v24;
    operator delete(v24);
  }
  uint64_t v25 = (void *)*((void *)this + 35);
  if (v25)
  {
    *((void *)this + 36) = v25;
    operator delete(v25);
  }
  uint64_t v26 = (void *)*((void *)this + 32);
  if (v26)
  {
    *((void *)this + 33) = v26;
    operator delete(v26);
  }
  std::__hash_table<std::unique_ptr<AudioDSPGraph::IsoGroup>,std::hash<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::equal_to<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::allocator<std::unique_ptr<AudioDSPGraph::IsoGroup>>>::~__hash_table((uint64_t)this + 216);
  long long v27 = (void **)((char *)this + 192);
  std::vector<std::unique_ptr<AudioDSPGraph::InternalBuffer>>::__destroy_vector::operator()[abi:ne180100](&v27);
  std::mutex::~mutex((std::mutex *)this + 2);
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table((uint64_t)this + 88);
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table((uint64_t)this + 48);
  std::__hash_table<std::unique_ptr<AudioDSPGraph::Box>,std::hash<std::unique_ptr<AudioDSPGraph::Box>>,std::equal_to<std::unique_ptr<AudioDSPGraph::Box>>,std::allocator<std::unique_ptr<AudioDSPGraph::Box>>>::~__hash_table((uint64_t)this + 8);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioDSPGraph::Graph::profiler_t>>>::~__hash_table(uint64_t a1)
{
  unint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void **)*v2;
      boost::circular_buffer<double,std::allocator<double>>::destroy((uint64_t)(v2 + 5));
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  int v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *std::__function::__value_func<void ()(double)>::~__value_func[abi:ne180100](void *a1)
{
  unint64_t v2 = (void *)a1[3];
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

uint64_t *std::unique_ptr<AudioDSPGraph::Graph::profiler_t>::reset[abi:ne180100](uint64_t *result)
{
  uint64_t v1 = *result;
  uint64_t *result = 0;
  if (v1)
  {
    boost::circular_buffer<double,std::allocator<double>>::destroy(v1);
    JUMPOUT(0x24C585790);
  }
  return result;
}

void std::vector<AudioDSPGraph::Graph::GraphBridge>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (char *)**a1;
  if (v2)
  {
    int v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = *((void *)v4 - 3);
        if (v6)
        {
          uint64_t v7 = *((void *)v4 - 2);
          long long v8 = (void *)*((void *)v4 - 3);
          if (v7 != v6)
          {
            do
            {
              long long v9 = *(void **)(v7 - 24);
              if (v9)
              {
                *(void *)(v7 - 16) = v9;
                operator delete(v9);
              }
              v7 -= 32;
            }
            while (v7 != v6);
            long long v8 = (void *)*((void *)v4 - 3);
          }
          *((void *)v4 - 2) = v6;
          operator delete(v8);
        }
        long long v10 = (void *)*((void *)v4 - 6);
        if (v10)
        {
          *((void *)v4 - 5) = v10;
          operator delete(v10);
        }
        v4 -= 56;
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::unique_ptr<AudioDSPGraph::Subset>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    int v4 = v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v7 = *--v4;
        uint64_t v6 = v7;
        *int v4 = 0;
        if (v7)
        {
          std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table(v6 + 24);
          if (*(char *)(v6 + 23) < 0) {
            operator delete(*(void **)v6);
          }
          MEMORY[0x24C585790](v6, 0x10B2C40A8EE1826);
        }
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioDSPGraph::Box *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioDSPGraph::Box *>>>::~__hash_table(uint64_t a1)
{
  unint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  int v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t *std::unique_ptr<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  uint64_t *result = a2;
  if (v2)
  {
    caulk::concurrent::lf_read_synchronized_write<std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver>>>::~lf_read_synchronized_write(v2 + 64);
    caulk::concurrent::lf_read_synchronized_write<std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver>>>::~lf_read_synchronized_write(v2);
    JUMPOUT(0x24C585790);
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphProperty>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  while (v2)
  {
    uint64_t v3 = v2;
    uint64_t v2 = (void *)*v2;
    int v4 = (void *)v3[9];
    if (v4)
    {
      v3[10] = v4;
      operator delete(v4);
    }
    if (*((unsigned char *)v3 + 56))
    {
      unint64_t v5 = (void *)v3[4];
      if (v5)
      {
        v3[5] = v5;
        operator delete(v5);
      }
    }
    operator delete(v3);
  }
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = 0;
  if (v6) {
    operator delete(v6);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,AudioDSPGraph::Graph::GraphParameter>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      int v4 = (void *)v2[5];
      if (v4)
      {
        v2[6] = v4;
        operator delete(v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

uint64_t std::__hash_table<std::unique_ptr<AudioDSPGraph::IsoGroup>,std::hash<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::equal_to<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::allocator<std::unique_ptr<AudioDSPGraph::IsoGroup>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::unique_ptr<AudioDSPGraph::IsoGroup>,std::hash<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::equal_to<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::allocator<std::unique_ptr<AudioDSPGraph::IsoGroup>>>::__deallocate_node(*(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::vector<std::unique_ptr<AudioDSPGraph::InternalBuffer>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::unique_ptr<AudioDSPGraph::InternalBuffer>>::__clear[abi:ne180100](v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

uint64_t std::__hash_table<std::unique_ptr<AudioDSPGraph::Box>,std::hash<std::unique_ptr<AudioDSPGraph::Box>>,std::equal_to<std::unique_ptr<AudioDSPGraph::Box>>,std::allocator<std::unique_ptr<AudioDSPGraph::Box>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      uint64_t v4 = v2[2];
      v2[2] = 0;
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

void *std::vector<std::unique_ptr<AudioDSPGraph::InternalBuffer>>::__clear[abi:ne180100](void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = (void *)*result;
  uint64_t v3 = (void *)result[1];
  while (v3 != v2)
  {
    uint64_t v4 = (void *)*--v3;
    float result = v4;
    *uint64_t v3 = 0;
    if (v4) {
      float result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
  }
  v1[1] = v2;
  return result;
}

void std::__hash_table<std::unique_ptr<AudioDSPGraph::IsoGroup>,std::hash<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::equal_to<std::unique_ptr<AudioDSPGraph::IsoGroup>>,std::allocator<std::unique_ptr<AudioDSPGraph::IsoGroup>>>::__deallocate_node(void *__p)
{
  if (__p)
  {
    uint64_t v1 = __p;
    do
    {
      uint64_t v2 = (void *)*v1;
      uint64_t v3 = v1[2];
      v1[2] = 0;
      if (v3) {
        (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
      }
      operator delete(v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

uint64_t caulk::concurrent::lf_read_synchronized_write<std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver>>>::~lf_read_synchronized_write(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = (void **)(a1 + 16);
    std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver>>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  if (*(unsigned char *)(a1 + 9))
  {
    uint64_t v3 = (void **)(a1 + 40);
    std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver>>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  return a1;
}

void std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = v4 - 40;
      uint64_t v7 = v4 - 40;
      do
      {
        long long v8 = (char *)*((void *)v7 + 3);
        if (v7 == v8)
        {
          (*(void (**)(char *))(*(void *)v7 + 32))(v7);
        }
        else if (v8)
        {
          (*(void (**)(char *))(*(void *)v8 + 40))(v8);
        }
        long long v9 = v7 - 8;
        v7 -= 48;
        v6 -= 48;
      }
      while (v9 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void boost::circular_buffer<double,std::allocator<double>>::destroy(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void **)a1;
  uint64_t v6 = v3 - v2;
  unint64_t v7 = (unint64_t)(v3 - (void)v5) >> 3;
  if (v4 < v6 >> 3) {
    unint64_t v7 = 0;
  }
  *(void *)(a1 + 16) = v2 + 8 * (v4 - v7);
  if (v5) {
    operator delete(v5);
  }
}

unint64_t AudioDSPGraph::Graph::generateSerialNumber(AudioDSPGraph::Graph *this)
{
  {
    std::random_device::random_device[abi:ne180100](&v5);
    unsigned int v4 = MEMORY[0x24C585620](&v5);
    AudioDSPGraph::Graph::generateSerialNumber(void)::sSerialNo = AudioDSPGraph::intPtrHash((AudioDSPGraph *)v4);
    std::random_device::~random_device(&v5);
  }
  std::mutex::lock(&AudioDSPGraph::Graph::generateSerialNumber(void)::sSerialNoLock);
  unint64_t v1 = atomic_load((unint64_t *)&AudioDSPGraph::Graph::generateSerialNumber(void)::sSerialNo);
  atomic_store(v1 + 1 + (((v1 + 1) / 0x7FFFFFFFFFFFFFFFLL) | (((v1 + 1) / 0x7FFFFFFFFFFFFFFFLL) << 63)), (unint64_t *)&AudioDSPGraph::Graph::generateSerialNumber(void)::sSerialNo);
  unint64_t v2 = atomic_load((unint64_t *)&AudioDSPGraph::Graph::generateSerialNumber(void)::sSerialNo);
  std::mutex::unlock(&AudioDSPGraph::Graph::generateSerialNumber(void)::sSerialNoLock);
  return v2;
}

void sub_248923E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, std::random_device a11, std::random_device a12)
{
}

std::random_device *std::random_device::random_device[abi:ne180100](std::random_device *a1)
{
  std::string::basic_string[abi:ne180100]<0>(&__token, "/dev/urandom");
  std::random_device::random_device(a1, &__token);
  if (SHIBYTE(__token.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__token.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_248923EE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t AudioDSPGraph::intPtrHash(AudioDSPGraph *this)
{
  unint64_t v1 = ((unint64_t)this + ~((void)this << 32)) ^ (((unint64_t)this + ~((void)this << 32)) >> 22);
  unint64_t v2 = 9 * ((v1 + ~(v1 << 13)) ^ ((v1 + ~(v1 << 13)) >> 8));
  unint64_t v3 = (v2 ^ (v2 >> 15)) + ~((v2 ^ (v2 >> 15)) << 27);
  return v3 ^ (v3 >> 31);
}

uint64_t caulk::concurrent::lf_read_synchronized_write<std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Graph>::RenderObserver>>>::lf_read_synchronized_write(caulk::concurrent::details::lf_read_sync_write_impl *a1)
{
  uint64_t result = caulk::concurrent::details::lf_read_sync_write_impl::lf_read_sync_write_impl(a1);
  *(_WORD *)(result + 8) = 1;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t AudioDSPGraph::details::DoTimePoint<std::function<void ()(double)>>::GetCurrentTimeInNanos()
{
  return __udivti3();
}

void *AudioDSPGraph::details::DoTimePoint<std::function<void ()(double)>>::~DoTimePoint(void *a1)
{
  uint64_t v2 = *a1;
  if (*(void *)(*a1 + 24))
  {
    double v5 = (double)(unint64_t)(AudioDSPGraph::details::DoTimePoint<std::function<void ()(double)>>::GetCurrentTimeInNanos()
                                  - a1[1]);
    uint64_t v3 = *(void *)(v2 + 24);
    if (!v3) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, double *))(*(void *)v3 + 48))(v3, &v5);
  }
  return a1;
}

uint64_t AudioDSPGraph::Graph::addBox(uint64_t result, unint64_t a2, const std::string *a3)
{
  uint64_t v6 = result;
  unint64_t v7 = result + 24;
  long long v8 = (void *)(result + 24);
  while (1)
  {
    long long v8 = (void *)*v8;
    if (!v8) {
      break;
    }
    if (v8[2] == a2) {
      return result;
    }
  }
  int8x8_t prime = operator new(0x18uLL);
  long long v10 = prime;
  unint64_t v11 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  unint64_t v12 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v11 >> 47) ^ v11);
  unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
  *int8x8_t prime = 0;
  prime[1] = v13;
  prime[2] = a2;
  unint64_t v14 = *(void *)(v6 + 16);
  if (!v14) {
    goto LABEL_21;
  }
  uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
  v15.i16[0] = vaddlv_u8(v15);
  if (v15.u32[0] > 1uLL)
  {
    unint64_t v16 = v13;
    if (v14 <= v13) {
      unint64_t v16 = v13 % v14;
    }
  }
  else
  {
    unint64_t v16 = (v14 - 1) & v13;
  }
  float v17 = *(void **)(*(void *)(v6 + 8) + 8 * v16);
  if (!v17 || (float v18 = (void *)*v17) == 0)
  {
LABEL_21:
    float v20 = (float)(unint64_t)(*(void *)(v6 + 32) + 1);
    float v21 = *(float *)(v6 + 40);
    if (!v14 || (float)(v21 * (float)v14) < v20)
    {
      BOOL v22 = 1;
      if (v14 >= 3) {
        BOOL v22 = (v14 & (v14 - 1)) != 0;
      }
      unint64_t v23 = v22 | (2 * v14);
      unint64_t v24 = vcvtps_u32_f32(v20 / v21);
      if (v23 <= v24) {
        size_t v25 = v24;
      }
      else {
        size_t v25 = v23;
      }
      if (v25 == 1)
      {
        size_t v25 = 2;
      }
      else if ((v25 & (v25 - 1)) != 0)
      {
        int8x8_t prime = (void *)std::__next_prime(v25);
        size_t v25 = (size_t)prime;
        unint64_t v14 = *(void *)(v6 + 16);
      }
      if (v25 > v14) {
        goto LABEL_264;
      }
      if (v25 >= v14) {
        goto LABEL_62;
      }
      int8x8_t prime = (void *)vcvtps_u32_f32((float)*(unint64_t *)(v6 + 32) / *(float *)(v6 + 40));
      if (v14 < 3 || (uint8x8_t v31 = (uint8x8_t)vcnt_s8((int8x8_t)v14), v31.i16[0] = vaddlv_u8(v31), v31.u32[0] > 1uLL))
      {
        int8x8_t prime = (void *)std::__next_prime((size_t)prime);
      }
      else
      {
        uint64_t v32 = 1 << -(char)__clz((unint64_t)prime - 1);
        if ((unint64_t)prime >= 2) {
          int8x8_t prime = (void *)v32;
        }
      }
      if (v25 <= (unint64_t)prime) {
        size_t v25 = (size_t)prime;
      }
      if (v25 >= v14)
      {
        unint64_t v14 = *(void *)(v6 + 16);
        goto LABEL_62;
      }
      if (v25)
      {
LABEL_264:
        if (v25 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v26 = operator new(8 * v25);
        int8x8_t prime = *(void **)(v6 + 8);
        *(void *)(v6 + 8) = v26;
        if (prime) {
          operator delete(prime);
        }
        uint64_t v27 = 0;
        *(void *)(v6 + 16) = v25;
        do
          *(void *)(*(void *)(v6 + 8) + 8 * v27++) = 0;
        while (v25 != v27);
        long long v28 = *(void **)v7;
        if (*(void *)v7)
        {
          size_t v29 = v28[1];
          uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)v25);
          v30.i16[0] = vaddlv_u8(v30);
          if (v30.u32[0] > 1uLL)
          {
            if (v29 >= v25) {
              v29 %= v25;
            }
          }
          else
          {
            v29 &= v25 - 1;
          }
          *(void *)(*(void *)(v6 + 8) + 8 * v29) = v7;
          uint64_t v33 = (void *)*v28;
          if (*v28)
          {
            do
            {
              size_t v34 = v33[1];
              if (v30.u32[0] > 1uLL)
              {
                if (v34 >= v25) {
                  v34 %= v25;
                }
              }
              else
              {
                v34 &= v25 - 1;
              }
              if (v34 != v29)
              {
                uint64_t v35 = *(void *)(v6 + 8);
                if (!*(void *)(v35 + 8 * v34))
                {
                  *(void *)(v35 + 8 * v34) = v28;
                  goto LABEL_58;
                }
                *long long v28 = *v33;
                *uint64_t v33 = **(void **)(*(void *)(v6 + 8) + 8 * v34);
                **(void **)(*(void *)(v6 + 8) + 8 * v34) = v33;
                uint64_t v33 = v28;
              }
              size_t v34 = v29;
LABEL_58:
              long long v28 = v33;
              uint64_t v33 = (void *)*v33;
              size_t v29 = v34;
            }
            while (v33);
          }
        }
        unint64_t v14 = v25;
      }
      else
      {
        int8x8_t prime = *(void **)(v6 + 8);
        *(void *)(v6 + 8) = 0;
        if (prime) {
          operator delete(prime);
        }
        unint64_t v14 = 0;
        *(void *)(v6 + 16) = 0;
      }
    }
LABEL_62:
    unint64_t v36 = v10[1];
    uint8x8_t v37 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v37.i16[0] = vaddlv_u8(v37);
    if (v37.u32[0] > 1uLL)
    {
      if (v36 >= v14) {
        v36 %= v14;
      }
    }
    else
    {
      v36 &= v14 - 1;
    }
    uint64_t v38 = *(void *)(v6 + 8);
    uint64_t v39 = *(void **)(v38 + 8 * v36);
    if (v39)
    {
      void *v10 = *v39;
    }
    else
    {
      void *v10 = *(void *)v7;
      *(void *)unint64_t v7 = v10;
      *(void *)(v38 + 8 * v36) = v7;
      if (!*v10)
      {
LABEL_75:
        ++*(void *)(v6 + 32);
        goto LABEL_76;
      }
      unint64_t v40 = *(void *)(*v10 + 8);
      if (v37.u32[0] > 1uLL)
      {
        if (v40 >= v14) {
          v40 %= v14;
        }
      }
      else
      {
        v40 &= v14 - 1;
      }
      uint64_t v39 = (void *)(*(void *)(v6 + 8) + 8 * v40);
    }
    *uint64_t v39 = v10;
    goto LABEL_75;
  }
  while (1)
  {
    unint64_t v19 = v18[1];
    if (v19 == v13) {
      break;
    }
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
      goto LABEL_21;
    }
LABEL_20:
    float v18 = (void *)*v18;
    if (!v18) {
      goto LABEL_21;
    }
  }
  if (v18[2] != a2) {
    goto LABEL_20;
  }
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::unique_ptr<AudioDSPGraph::Box>,void *>>>::operator()[abi:ne180100](1, prime);
LABEL_76:
  *(void *)(a2 + 8) = v6;
  unint64_t SerialNumber = AudioDSPGraph::Graph::generateSerialNumber((AudioDSPGraph::Graph *)prime);
  unint64_t v42 = SerialNumber;
  *(void *)(a2 + 56) = SerialNumber;
  unint64_t v43 = *(void *)(v6 + 792);
  if (v43)
  {
    uint8x8_t v44 = (uint8x8_t)vcnt_s8((int8x8_t)v43);
    v44.i16[0] = vaddlv_u8(v44);
    if (v44.u32[0] > 1uLL)
    {
      unint64_t v7 = SerialNumber;
      if (SerialNumber >= v43) {
        unint64_t v7 = SerialNumber % v43;
      }
    }
    else
    {
      unint64_t v7 = (v43 - 1) & SerialNumber;
    }
    long long v45 = *(void ***)(*(void *)(v6 + 784) + 8 * v7);
    if (v45)
    {
      for (uint64_t i = *v45; i; uint64_t i = (void *)*i)
      {
        unint64_t v47 = i[1];
        if (v47 == SerialNumber)
        {
          if (i[2] == SerialNumber) {
            goto LABEL_149;
          }
        }
        else
        {
          if (v44.u32[0] > 1uLL)
          {
            if (v47 >= v43) {
              v47 %= v43;
            }
          }
          else
          {
            v47 &= v43 - 1;
          }
          if (v47 != v7) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  void *i = 0;
  i[1] = v42;
  i[2] = v42;
  i[3] = 0;
  float v48 = (float)(unint64_t)(*(void *)(v6 + 808) + 1);
  float v49 = *(float *)(v6 + 816);
  if (!v43 || (float)(v49 * (float)v43) < v48)
  {
    BOOL v50 = 1;
    if (v43 >= 3) {
      BOOL v50 = (v43 & (v43 - 1)) != 0;
    }
    unint64_t v51 = v50 | (2 * v43);
    unint64_t v52 = vcvtps_u32_f32(v48 / v49);
    if (v51 <= v52) {
      int8x8_t v53 = (int8x8_t)v52;
    }
    else {
      int8x8_t v53 = (int8x8_t)v51;
    }
    if (*(void *)&v53 == 1)
    {
      int8x8_t v53 = (int8x8_t)2;
    }
    else if ((*(void *)&v53 & (*(void *)&v53 - 1)) != 0)
    {
      int8x8_t v53 = (int8x8_t)std::__next_prime(*(void *)&v53);
      unint64_t v43 = *(void *)(v6 + 792);
    }
    if (*(void *)&v53 <= v43)
    {
      if (*(void *)&v53 < v43)
      {
        unint64_t v60 = vcvtps_u32_f32((float)*(unint64_t *)(v6 + 808) / *(float *)(v6 + 816));
        if (v43 < 3 || (uint8x8_t v61 = (uint8x8_t)vcnt_s8((int8x8_t)v43), v61.i16[0] = vaddlv_u8(v61), v61.u32[0] > 1uLL))
        {
          unint64_t v60 = std::__next_prime(v60);
        }
        else
        {
          uint64_t v62 = 1 << -(char)__clz(v60 - 1);
          if (v60 >= 2) {
            unint64_t v60 = v62;
          }
        }
        if (*(void *)&v53 <= v60) {
          int8x8_t v53 = (int8x8_t)v60;
        }
        if (*(void *)&v53 >= v43)
        {
          unint64_t v43 = *(void *)(v6 + 792);
        }
        else
        {
          if (v53) {
            goto LABEL_105;
          }
          long long v102 = *(void **)(v6 + 784);
          *(void *)(v6 + 784) = 0;
          if (v102) {
            operator delete(v102);
          }
          unint64_t v43 = 0;
          *(void *)(v6 + 792) = 0;
        }
      }
    }
    else
    {
LABEL_105:
      if (*(void *)&v53 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      long long v54 = operator new(8 * *(void *)&v53);
      long long v55 = *(void **)(v6 + 784);
      *(void *)(v6 + 784) = v54;
      if (v55) {
        operator delete(v55);
      }
      uint64_t v56 = 0;
      *(int8x8_t *)(v6 + 792) = v53;
      do
        *(void *)(*(void *)(v6 + 784) + 8 * v56++) = 0;
      while (*(void *)&v53 != v56);
      uint64_t v57 = *(void **)(v6 + 800);
      if (v57)
      {
        unint64_t v58 = v57[1];
        uint8x8_t v59 = (uint8x8_t)vcnt_s8(v53);
        v59.i16[0] = vaddlv_u8(v59);
        if (v59.u32[0] > 1uLL)
        {
          if (v58 >= *(void *)&v53) {
            v58 %= *(void *)&v53;
          }
        }
        else
        {
          v58 &= *(void *)&v53 - 1;
        }
        *(void *)(*(void *)(v6 + 784) + 8 * v58) = v6 + 800;
        uint64_t v63 = (void *)*v57;
        if (*v57)
        {
          do
          {
            unint64_t v64 = v63[1];
            if (v59.u32[0] > 1uLL)
            {
              if (v64 >= *(void *)&v53) {
                v64 %= *(void *)&v53;
              }
            }
            else
            {
              v64 &= *(void *)&v53 - 1;
            }
            if (v64 != v58)
            {
              uint64_t v65 = *(void *)(v6 + 784);
              if (!*(void *)(v65 + 8 * v64))
              {
                *(void *)(v65 + 8 * v64) = v57;
                goto LABEL_130;
              }
              *uint64_t v57 = *v63;
              *uint64_t v63 = **(void **)(*(void *)(v6 + 784) + 8 * v64);
              **(void **)(*(void *)(v6 + 784) + 8 * v64) = v63;
              uint64_t v63 = v57;
            }
            unint64_t v64 = v58;
LABEL_130:
            uint64_t v57 = v63;
            uint64_t v63 = (void *)*v63;
            unint64_t v58 = v64;
          }
          while (v63);
        }
      }
      unint64_t v43 = (unint64_t)v53;
    }
    if ((v43 & (v43 - 1)) != 0)
    {
      if (v42 >= v43) {
        unint64_t v7 = v42 % v43;
      }
      else {
        unint64_t v7 = v42;
      }
    }
    else
    {
      unint64_t v7 = (v43 - 1) & v42;
    }
  }
  uint64_t v66 = *(void *)(v6 + 784);
  long long v67 = *(void **)(v66 + 8 * v7);
  if (v67)
  {
    void *i = *v67;
    goto LABEL_147;
  }
  void *i = *(void *)(v6 + 800);
  *(void *)(v6 + 800) = i;
  *(void *)(v66 + 8 * v7) = v6 + 800;
  if (*i)
  {
    unint64_t v68 = *(void *)(*i + 8);
    if ((v43 & (v43 - 1)) != 0)
    {
      if (v68 >= v43) {
        v68 %= v43;
      }
    }
    else
    {
      v68 &= v43 - 1;
    }
    long long v67 = (void *)(*(void *)(v6 + 784) + 8 * v68);
LABEL_147:
    *long long v67 = i;
  }
  ++*(void *)(v6 + 808);
LABEL_149:
  i[3] = a2;
  std::string::operator=((std::string *)(a2 + 32), a3);
  unint64_t v69 = std::__string_hash<char>::operator()[abi:ne180100](a2 + 32);
  unint64_t v70 = v69;
  unint64_t v71 = *(void *)(v6 + 752);
  if (v71)
  {
    uint8x8_t v72 = (uint8x8_t)vcnt_s8((int8x8_t)v71);
    v72.i16[0] = vaddlv_u8(v72);
    unint64_t v73 = v72.u32[0];
    if (v72.u32[0] > 1uLL)
    {
      unint64_t v3 = v69;
      if (v69 >= v71) {
        unint64_t v3 = v69 % v71;
      }
    }
    else
    {
      unint64_t v3 = (v71 - 1) & v69;
    }
    long long v74 = *(void ***)(*(void *)(v6 + 744) + 8 * v3);
    if (v74)
    {
      uint64_t v75 = (char *)*v74;
      if (*v74)
      {
        do
        {
          unint64_t v76 = *((void *)v75 + 1);
          if (v76 == v70)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v75 + 16, (unsigned __int8 *)(a2 + 32)))
            {
              goto LABEL_225;
            }
          }
          else
          {
            if (v73 > 1)
            {
              if (v76 >= v71) {
                v76 %= v71;
              }
            }
            else
            {
              v76 &= v71 - 1;
            }
            if (v76 != v3) {
              break;
            }
          }
          uint64_t v75 = *(char **)v75;
        }
        while (v75);
      }
    }
  }
  uint64_t v75 = (char *)operator new(0x30uLL);
  *(void *)uint64_t v75 = 0;
  *((void *)v75 + 1) = v70;
  long long v77 = (std::string *)(v75 + 16);
  if (*(char *)(a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external(v77, *(const std::string::value_type **)(a2 + 32), *(void *)(a2 + 40));
  }
  else
  {
    *(_OWORD *)&v77->__r_.__value_.__l.__data_ = *(_OWORD *)(a2 + 32);
    *((void *)v75 + 4) = *(void *)(a2 + 48);
  }
  long long v78 = (void *)(v6 + 760);
  *((void *)v75 + 5) = 0;
  float v79 = (float)(unint64_t)(*(void *)(v6 + 768) + 1);
  float v80 = *(float *)(v6 + 776);
  if (!v71 || (float)(v80 * (float)v71) < v79)
  {
    BOOL v81 = 1;
    if (v71 >= 3) {
      BOOL v81 = (v71 & (v71 - 1)) != 0;
    }
    unint64_t v82 = v81 | (2 * v71);
    unint64_t v83 = vcvtps_u32_f32(v79 / v80);
    if (v82 <= v83) {
      int8x8_t v84 = (int8x8_t)v83;
    }
    else {
      int8x8_t v84 = (int8x8_t)v82;
    }
    if (*(void *)&v84 == 1)
    {
      int8x8_t v84 = (int8x8_t)2;
    }
    else if ((*(void *)&v84 & (*(void *)&v84 - 1)) != 0)
    {
      int8x8_t v84 = (int8x8_t)std::__next_prime(*(void *)&v84);
    }
    unint64_t v71 = *(void *)(v6 + 752);
    if (*(void *)&v84 <= v71)
    {
      if (*(void *)&v84 < v71)
      {
        unint64_t v91 = vcvtps_u32_f32((float)*(unint64_t *)(v6 + 768) / *(float *)(v6 + 776));
        if (v71 < 3 || (uint8x8_t v92 = (uint8x8_t)vcnt_s8((int8x8_t)v71), v92.i16[0] = vaddlv_u8(v92), v92.u32[0] > 1uLL))
        {
          unint64_t v91 = std::__next_prime(v91);
        }
        else
        {
          uint64_t v93 = 1 << -(char)__clz(v91 - 1);
          if (v91 >= 2) {
            unint64_t v91 = v93;
          }
        }
        if (*(void *)&v84 <= v91) {
          int8x8_t v84 = (int8x8_t)v91;
        }
        if (*(void *)&v84 >= v71)
        {
          unint64_t v71 = *(void *)(v6 + 752);
        }
        else
        {
          if (v84) {
            goto LABEL_181;
          }
          long long v103 = *(void **)(v6 + 744);
          *(void *)(v6 + 744) = 0;
          if (v103) {
            operator delete(v103);
          }
          unint64_t v71 = 0;
          *(void *)(v6 + 752) = 0;
        }
      }
    }
    else
    {
LABEL_181:
      if (*(void *)&v84 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v85 = operator new(8 * *(void *)&v84);
      unint64_t v86 = *(void **)(v6 + 744);
      *(void *)(v6 + 744) = v85;
      if (v86) {
        operator delete(v86);
      }
      uint64_t v87 = 0;
      *(int8x8_t *)(v6 + 752) = v84;
      do
        *(void *)(*(void *)(v6 + 744) + 8 * v87++) = 0;
      while (*(void *)&v84 != v87);
      uint64_t v88 = (void *)*v78;
      if (*v78)
      {
        unint64_t v89 = v88[1];
        uint8x8_t v90 = (uint8x8_t)vcnt_s8(v84);
        v90.i16[0] = vaddlv_u8(v90);
        if (v90.u32[0] > 1uLL)
        {
          if (v89 >= *(void *)&v84) {
            v89 %= *(void *)&v84;
          }
        }
        else
        {
          v89 &= *(void *)&v84 - 1;
        }
        *(void *)(*(void *)(v6 + 744) + 8 * v89) = v78;
        long long v94 = (void *)*v88;
        if (*v88)
        {
          do
          {
            unint64_t v95 = v94[1];
            if (v90.u32[0] > 1uLL)
            {
              if (v95 >= *(void *)&v84) {
                v95 %= *(void *)&v84;
              }
            }
            else
            {
              v95 &= *(void *)&v84 - 1;
            }
            if (v95 != v89)
            {
              uint64_t v96 = *(void *)(v6 + 744);
              if (!*(void *)(v96 + 8 * v95))
              {
                *(void *)(v96 + 8 * v95) = v88;
                goto LABEL_206;
              }
              void *v88 = *v94;
              *long long v94 = **(void **)(*(void *)(v6 + 744) + 8 * v95);
              **(void **)(*(void *)(v6 + 744) + 8 * v95) = v94;
              long long v94 = v88;
            }
            unint64_t v95 = v89;
LABEL_206:
            uint64_t v88 = v94;
            long long v94 = (void *)*v94;
            unint64_t v89 = v95;
          }
          while (v94);
        }
      }
      unint64_t v71 = (unint64_t)v84;
    }
    if ((v71 & (v71 - 1)) != 0)
    {
      if (v70 >= v71) {
        unint64_t v3 = v70 % v71;
      }
      else {
        unint64_t v3 = v70;
      }
    }
    else
    {
      unint64_t v3 = (v71 - 1) & v70;
    }
  }
  uint64_t v97 = *(void *)(v6 + 744);
  long long v98 = *(void **)(v97 + 8 * v3);
  if (v98)
  {
    *(void *)uint64_t v75 = *v98;
    goto LABEL_223;
  }
  *(void *)uint64_t v75 = *v78;
  *long long v78 = v75;
  *(void *)(v97 + 8 * v3) = v78;
  if (*(void *)v75)
  {
    unint64_t v99 = *(void *)(*(void *)v75 + 8);
    if ((v71 & (v71 - 1)) != 0)
    {
      if (v99 >= v71) {
        v99 %= v71;
      }
    }
    else
    {
      v99 &= v71 - 1;
    }
    long long v98 = (void *)(*(void *)(v6 + 744) + 8 * v99);
LABEL_223:
    *long long v98 = v75;
  }
  ++*(void *)(v6 + 768);
LABEL_225:
  *((void *)v75 + 5) = a2;
  if (((*(void *)(a2 + 96) - *(void *)(a2 + 88)) & 0x1FFFFFFFE0) == 0) {
    std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__emplace_unique_key_args<AudioDSPGraph::Box *,AudioDSPGraph::Box * const&>(v6 + 328, a2, a2);
  }
  uint64_t v100 = (*(uint64_t (**)(unint64_t))(*(void *)a2 + 248))(a2);
  if (v100) {
    std::__hash_table<AudioDSPGraph::FCBox *,std::hash<AudioDSPGraph::FCBox *>,std::equal_to<AudioDSPGraph::FCBox *>,std::allocator<AudioDSPGraph::FCBox *>>::__emplace_unique_key_args<AudioDSPGraph::FCBox *,AudioDSPGraph::FCBox * const&>((float *)(v6 + 368), v100, v100);
  }
  uint64_t v101 = *(uint64_t (**)(unint64_t))(*(void *)a2 + 560);

  return v101(a2);
}

void sub_248924CA0(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,AudioDSPGraph::Box *>,void *>>>::operator()[abi:ne180100](0, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,AudioDSPGraph::Box *>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
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

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::unique_ptr<AudioDSPGraph::Box>,void *>>>::operator()[abi:ne180100](char a1, void *__p)
{
  if (a1)
  {
    uint64_t v3 = __p[2];
    __p[2] = 0;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
  }

  operator delete(__p);
}

unint64_t AudioDSPGraph::Graph::add(uint64_t a1, unint64_t a2, const std::string *a3)
{
  if (*(unsigned char *)(a1 + 729))
  {
    std::string::basic_string[abi:ne180100]<0>(&v7, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Graph.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v6, "add");
    std::string::basic_string[abi:ne180100]<0>(&v5, "graph is configured");
    AudioDSPGraph::ThrowException(1667655457, &v7, 1006, &v6, &v5);
  }
  AudioDSPGraph::Graph::addBox(a1, a2, a3);
  return a2;
}

void sub_248924E3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

applesauce::CF::DictionaryRef *applesauce::CF::DictionaryRef::DictionaryRef(applesauce::CF::DictionaryRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID())
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
  }
  return this;
}

void sub_248924F10(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  unint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

const void *applesauce::CF::details::at_key<__CFString const* const&>(const __CFDictionary *a1, const void *a2)
{
  if (a2) {
    return CFDictionaryGetValue(a1, a2);
  }
  else {
    return 0;
  }
}

std::runtime_error *applesauce::CF::convert_error(std::runtime_error *this)
{
  return std::runtime_error::runtime_error(this, "Could not convert");
}

void *applesauce::CF::convert_to<std::string,0>(uint64_t a1, const __CFString *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(a2))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  CStringPtr = (char *)CFStringGetCStringPtr(a2, 0x8000100u);
  if (CStringPtr)
  {
    return std::string::basic_string[abi:ne180100]<0>((void *)a1, CStringPtr);
  }
  else
  {
    CFIndex Length = CFStringGetLength(a2);
    CFIndex maxBufLen = 0;
    v12.location = 0;
    v12.length = Length;
    CFStringGetBytes(a2, v12, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
    std::string::basic_string[abi:ne180100]((void *)a1, maxBufLen, 0);
    if (*(char *)(a1 + 23) >= 0) {
      long long v8 = (UInt8 *)a1;
    }
    else {
      long long v8 = *(UInt8 **)a1;
    }
    v13.location = 0;
    v13.length = Length;
    return (void *)CFStringGetBytes(a2, v13, 0x8000100u, 0, 0, v8, maxBufLen, &maxBufLen);
  }
}

void sub_2489250E8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

applesauce::CF::StringRef *applesauce::CF::StringRef::StringRef(applesauce::CF::StringRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFStringGetTypeID())
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
  }
  return this;
}

void sub_24892519C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void applesauce::CF::TypeRefPair::~TypeRefPair(applesauce::CF::TypeRefPair *this)
{
  uint64_t v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)this) {
    CFRelease(*(CFTypeRef *)this);
  }
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void std::vector<void const*>::reserve(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unsigned int v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::Box *>>(a2);
    long long v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    long long v7 = &v4[8 * v6];
    long long v9 = (char *)*a1;
    long long v8 = (char *)a1[1];
    long long v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      long long v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
}

uint64_t std::__optional_destruct_base<applesauce::CF::DataRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

TimeFreqConverter *AudioDSPGraph::TimeFreqBox::uninitialize(TimeFreqConverter ***this)
{
  uint64_t result = (TimeFreqConverter *)AudioDSPGraph::Box::uninitialize((AudioDSPGraph::Box *)this);
  int64_t v3 = this[98];
  unsigned int v4 = this[97];
  while (v3 != v4)
    uint64_t result = std::unique_ptr<TimeFreqConverter>::reset[abi:ne180100](--v3);
  this[98] = v4;
  return result;
}

void *AudioDSPGraph::TimeFreqBox::initialize(AudioDSPGraph::TimeFreqBox *this)
{
  AudioDSPGraph::Box::initialize(this);
  uint64_t v2 = AudioDSPGraph::Box::in(this, 0);
  uint64_t v3 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  if (*(_DWORD *)(v3 + 28) != *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4)
                                                     + 120)
                                         + 28))
  {
    std::string::basic_string[abi:ne180100]<0>(&v15, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/TimeFreqBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v14, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v13, "channel mismatch.");
    AudioDSPGraph::ThrowException(1718444833, &v15, 25, &v14, &v13);
  }
  uint64_t v5 = AudioDSPGraph::Box::in(this, 0);
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 8) != 1819304813
    || (uint64_t v6 = AudioDSPGraph::Box::out(this, 0),
        uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6),
        int v8 = 0,
        *(_DWORD *)(*(void *)(v7 + 120) + 8) != 1718773105))
  {
    uint64_t v9 = AudioDSPGraph::Box::in(this, 0);
    if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9) + 120) + 8) != 1718773105
      || (uint64_t v10 = AudioDSPGraph::Box::out(this, 0),
          *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120) + 8) != 1819304813))
    {
      std::string::basic_string[abi:ne180100]<0>(&v15, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/TimeFreqBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v14, "initialize");
      std::string::basic_string[abi:ne180100]<0>(&v13, "formats are not between freq and time domains.");
      AudioDSPGraph::ThrowException(1718444833, &v15, 33, &v14, &v13);
    }
    int v8 = 1;
  }
  *((_DWORD *)this + 200) = v8;
  unint64_t v11 = *(unsigned int *)(v3 + 28);
  uint64_t result = std::vector<std::unique_ptr<TimeFreqConverter>>::reserve((void *)this + 97, v11);
  if (v11) {
    operator new();
  }
  return result;
}

void sub_2489257C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::TimeFreqBox::process(AudioDSPGraph::TimeFreqBox *this, int a2)
{
  if (*(_DWORD *)(*((void *)this + 2) + 268) != a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v36, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/TimeFreqBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v35, "process");
    std::string::basic_string[abi:ne180100]<0>(&v34, "inNumFrames != blockSize.");
    AudioDSPGraph::ThrowException(1718188065, &v36, 71, &v35, &v34);
  }
  uint64_t v4 = AudioDSPGraph::Box::in(this, 0);
  uint64_t v5 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6);
  if (*v5 != (uint64_t)(*((void *)this + 98) - *((void *)this + 97)) >> 3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v36, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/TimeFreqBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v35, "process");
    std::string::basic_string[abi:ne180100]<0>(&v34, "buffer list number of buffers doesn't match format channel count.");
    AudioDSPGraph::ThrowException(1667788321, &v36, 78, &v35, &v34);
  }
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 80);
  uint64_t v9 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9);
  if (*v5)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    int v13 = *(_DWORD *)(*(void *)(v10 + 120) + 24) * a2;
    do
    {
      *(_DWORD *)(v8 + v11 * 4 + 12) = v13;
      long long v14 = *(const float **)&v5[v11 + 4];
      long long v15 = *(float **)(v8 + v11 * 4 + 16);
      if (*((_DWORD *)this + 200))
      {
        v33.realp = *(float **)&v5[v11 + 4];
        v33.imagp = (float *)&v14[a2];
        int v16 = TimeFreqConverter::Synthesize(*(TimeFreqConverter **)(*((void *)this + 97) + 8 * v12), &v33, v15);
        if (v16)
        {
          int v31 = v16;
          std::string::basic_string[abi:ne180100]<0>(&v36, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/TimeFreqBox.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v35, "process");
          std::string::basic_string[abi:ne180100]<0>(&v34, "TimeFreqConverter_Synthesize");
          AudioDSPGraph::ThrowException(v31, &v36, 99, &v35, &v34);
        }
      }
      else
      {
        v33.realp = *(float **)(v8 + v11 * 4 + 16);
        v33.imagp = &v15[a2];
        int v17 = TimeFreqConverter::Analyze(*(TimeFreqConverter **)(*((void *)this + 97) + 8 * v12), v14, &v33);
        if (v17)
        {
          int v32 = v17;
          std::string::basic_string[abi:ne180100]<0>(&v36, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/TimeFreqBox.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v35, "process");
          std::string::basic_string[abi:ne180100]<0>(&v34, "TimeFreqConverter_Analyze");
          AudioDSPGraph::ThrowException(v32, &v36, 93, &v35, &v34);
        }
      }
      ++v12;
      v11 += 4;
    }
    while (v12 < *v5);
  }
  uint64_t v18 = AudioDSPGraph::Box::in(this, 0);
  int v19 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v18 + 40))(v18) + 56) + 72);
  uint64_t v20 = AudioDSPGraph::Box::in(this, 0);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20);
  uint64_t v23 = *((void *)this + 11);
  BOOL v22 = (void *)*((void *)this + 12);
  if ((void *)v23 != v22)
  {
    unint64_t v24 = (_OWORD *)(result[7] + 8);
    uint64_t result = (void *)v23;
    size_t v25 = (void *)v23;
    do
    {
      uint64_t v26 = *v25;
      v25 += 4;
      uint64_t v27 = *(void *)((*(uint64_t (**)(void *))(v26 + 40))(result) + 56);
      long long v29 = v24[2];
      long long v28 = v24[3];
      long long v30 = v24[1];
      *(_OWORD *)(v27 + 8) = *v24;
      *(_OWORD *)(v27 + 24) = v30;
      *(_OWORD *)(v27 + 40) = v29;
      *(_OWORD *)(v27 + 56) = v28;
      *(_DWORD *)(v27 + 72) = v19;
      v23 += 32;
      uint64_t result = v25;
    }
    while (v25 != v22);
  }
  return result;
}

void sub_248925BF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::TimeFreqBox::hasPresetData(AudioDSPGraph::TimeFreqBox *this)
{
  return 0;
}

double AudioDSPGraph::TimeFreqBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 6.73591209e252;
  *(_OWORD *)a1 = xmmword_24893BE40;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t AudioDSPGraph::TimeFreqBox::selfLatencyInTicks(AudioDSPGraph::TimeFreqBox *this)
{
  if (!*(unsigned char *)(*((void *)this + 1) + 729))
  {
    std::string::basic_string[abi:ne180100]<0>(&v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/TimeFreqBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v8, "selfLatencyInTicks");
    std::string::basic_string[abi:ne180100]<0>(&v7, "not configured");
    AudioDSPGraph::ThrowException(1667655457, &v9, 47, &v8, &v7);
  }
  uint64_t v2 = AudioDSPGraph::Box::in(this, 0);
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 8) == 1819304813)
  {
    uint64_t v3 = AudioDSPGraph::Box::out(this, 0);
    if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3) + 120) + 8) == 1718773105) {
      return 0;
    }
  }
  uint64_t v5 = AudioDSPGraph::Box::in(this, 0);
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 8) != 1718773105
    || (uint64_t v6 = AudioDSPGraph::Box::out(this, 0),
        *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120) + 8) != 1819304813))
  {
    std::string::basic_string[abi:ne180100]<0>(&v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/TimeFreqBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v8, "selfLatencyInTicks");
    std::string::basic_string[abi:ne180100]<0>(&v7, "formats are not between freq and time domains.");
    AudioDSPGraph::ThrowException(1718444833, &v9, 55, &v8, &v7);
  }
  return *(void *)(*((void *)this + 2) + 296);
}

void sub_248925E7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

const char *AudioDSPGraph::TimeFreqBox::ClassName(AudioDSPGraph::TimeFreqBox *this)
{
  return "fft";
}

void AudioDSPGraph::TimeFreqBox::~TimeFreqBox(AudioDSPGraph::TimeFreqBox *this)
{
  *(void *)this = &unk_26FC9CA60;
  uint64_t v2 = (void **)((char *)this + 776);
  std::vector<std::unique_ptr<TimeFreqConverter>>::__destroy_vector::operator()[abi:ne180100](&v2);
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  void **v2;
  uint64_t vars8;

  *(void *)this = &unk_26FC9CA60;
  uint64_t v2 = (void **)((char *)this + 776);
  std::vector<std::unique_ptr<TimeFreqConverter>>::__destroy_vector::operator()[abi:ne180100](&v2);

  AudioDSPGraph::Box::~Box(this);
}

uint64_t AudioDSPGraph::Box::unconfigure(uint64_t this)
{
  *(void *)(this + 16) = 0;
  return this;
}

uint64_t AudioDSPGraph::Box::uninitializePropertyTaps(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 176);
  uint64_t v2 = *(void *)(this + 184);
  while (v1 != v2)
  {
    *(void *)(v1 + 48) = *(void *)(v1 + 40);
    v1 += 64;
  }
  return this;
}

void AudioDSPGraph::Box::initializePropertyTaps(AudioDSPGraph::Box *this)
{
  uint64_t v1 = (void *)*((void *)this + 22);
  for (uint64_t i = (void *)*((void *)this + 23); v1 != i; v1 += 8)
  {
    unsigned int v3 = (*(uint64_t (**)(void, void, void, void))(*(void *)*v1 + 296))(*v1, *((unsigned int *)v1 + 2), *((unsigned int *)v1 + 3), *((unsigned int *)v1 + 4));
    int v4 = v3;
    if (!v5)
    {
      std::string::basic_string[abi:ne180100]<0>(&v24, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v23, "initialize");
      std::string::basic_string[abi:ne180100]<0>(&v22, "getPropertyInfo failed");
      AudioDSPGraph::ThrowException(v4, &v24, 787, &v23, &v22);
    }
    uint64_t v6 = (unsigned char *)v1[5];
    if (v1[6] - (void)v6 != v3)
    {
      v1[6] = v6;
      LOBYTE(v24) = 0;
      uint64_t v7 = v3;
      if (v3)
      {
        unint64_t v8 = v1[7] - (void)v6;
        if (v8 >= v3)
        {
          uint64_t v20 = &v6[v3];
          char v21 = v24;
          do
          {
            *v6++ = v21;
            --v7;
          }
          while (v7);
          v1[6] = v20;
        }
        else
        {
          uint64_t v9 = 2 * v8;
          if (2 * v8 <= v3) {
            uint64_t v9 = v3;
          }
          if (v8 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v10 = v9;
          }
          uint64_t v11 = operator new(v10);
          unint64_t v12 = v11;
          uint64_t v13 = 0;
          long long v14 = &v11[v7];
          do
            v11[v13++] = 0;
          while (v7 != v13);
          long long v15 = (unsigned char *)v1[5];
          if (v15 == v6)
          {
            uint64_t v19 = 0;
            int v17 = v11;
          }
          else
          {
            uint64_t v16 = 0;
            do
            {
              v11[v16 - 1] = v6[v16 - 1];
              --v16;
            }
            while (&v6[v16] != v15);
            int v17 = &v11[v16];
            uint64_t v18 = (unsigned char *)v1[6];
            uint64_t v19 = v18 - v6;
            if (v18 != v6) {
              memmove(v14, v6, v18 - v6);
            }
          }
          v1[5] = v17;
          v1[6] = &v14[v19];
          v1[7] = &v12[v10];
          if (v15) {
            operator delete(v15);
          }
        }
      }
    }
  }
}

void sub_2489261E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::Box::uninitializeAnalysis(AudioDSPGraph::Box *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (std::mutex *)((char *)this + 248);
  std::mutex::lock((std::mutex *)((char *)this + 248));
  unsigned int v3 = (uint64_t *)*((void *)this + 39);
  int v4 = (uint64_t *)*((void *)this + 40);
  if (v3 != v4)
  {
    char v5 = (char *)this + 336;
    do
    {
      caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::remove((unint64_t)v5, *(_DWORD *)(*v3 + 24));
      uint64_t v6 = *v3;
      {
        AudioDSPGraph::getLog(void)::gLog = (uint64_t)os_log_create("com.apple.coreaudio", "AudioDSPGraph");
      }
      uint64_t v7 = AudioDSPGraph::getLog(void)::gLog;
      if (os_log_type_enabled((os_log_t)AudioDSPGraph::getLog(void)::gLog, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v8 = (void *)(v6 + 56);
        if (*(char *)(v6 + 79) < 0) {
          unint64_t v8 = (void *)*v8;
        }
        *(_DWORD *)buf = 136315138;
        size_t v10 = v8;
        _os_log_debug_impl(&dword_248903000, v7, OS_LOG_TYPE_DEBUG, "Analyzer::uninitialize %s", buf, 0xCu);
      }
      ++v3;
    }
    while (v3 != v4);
  }

  std::mutex::unlock(v2);
}

unint64_t caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::remove(unint64_t a1, int a2)
{
  unint64_t v4 = a1 + 224;
  caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  int v18 = a2;
  uint64_t v5 = -1;
  uint64_t v6 = 40;
  do
  {
    unint64_t v7 = atomic_load((unint64_t *)(a1 + v6));
    ++v5;
    v6 += 16;
  }
  while (*(unsigned char *)((v7 & 0xFFFFFFFFFFFFFFFCLL) + 14) != 2);
  unint64_t v8 = a1;
  if (v5)
  {
    unint64_t v8 = a1;
    do
      unint64_t v8 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_lt &>(a1, v5--, v8, &v18);
    while (v5);
  }
  unint64_t v9 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_lt &>(a1, 0, v8, &v18);
  unint64_t v11 = *(unsigned int *)(v10 + 8);
  if (v11 == a2)
  {
    uint64_t v12 = v10;
    unint64_t v13 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(a1, 0, v9, v10);
    uint64_t v15 = v14;
    if (!v14) {
      caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::help_flagged(a1, 0, v13, v12);
    }
    if ((v15 & 0xFF00000000) != 0 && v12)
    {
      int v17 = a2;
      caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_le>(a1, &v17, 0);
    }
  }
  return caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v4, v11);
}

void caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal()
{
  _X4 = 0;
  _X5 = 0;
  __asm { CASPAL          X4, X5, X4, X5, [X0] }
  _X6 = _X4;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X6, X7, [X0] }
  if (_X2 != _X4)
  {
    do
    {
      _X4 = _X2;
      _X7 = 0;
      __asm { CASPAL          X6, X7, X4, X5, [X0] }
      uint64_t v13 = _X6 ^ _X2;
      _X2 = _X6;
    }
    while (v13);
  }
}

unint64_t caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_le>(unint64_t a1, _DWORD *a2, unint64_t a3)
{
  unint64_t v6 = -1;
  uint64_t v7 = 40;
  do
  {
    do
    {
      ++v6;
      unint64_t v8 = atomic_load((unint64_t *)(a1 + v7));
      v7 += 16;
    }
    while (v6 < a3);
  }
  while (*(unsigned char *)((v8 & 0xFFFFFFFFFFFFFFFCLL) + 14) != 2);
  unint64_t v9 = a1;
  if (v6 > a3)
  {
    unint64_t v9 = a1;
    do
      unint64_t v9 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_le &>(a1, v6--, v9, a2);
    while (v6 > a3);
  }

  return caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_le &>(a1, a3, v9, a2);
}

unint64_t caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal@<X0>(unint64_t result@<X0>, unint64_t a2@<X8>)
{
  _X2 = 0;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X2, X3, [X0] }
  unint64_t v9 = 0;
  for (unint64_t i = _X2; ; unint64_t i = _X2)
  {
    uint64_t v11 = (_X3 - 1);
    a2 = a2 & 0xFFFFFFFF00000000 | v11;
    _X6 = (int)_X3 <= 1 ? 0 : i;
    _X3 = _X3 | (v9 << 32);
    __asm { CASPAL          X2, X3, X6, X7, [X0] }
    if (_X2 == i) {
      break;
    }
    unint64_t v9 = HIDWORD(_X3);
  }
  if (!v11)
  {
    if (i) {
      return caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::free_node_chain_now(result, i);
    }
  }
  return result;
}

unint64_t caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::free_node_chain_now(unint64_t result, unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    unint64_t v3 = result;
    unint64_t v4 = result + 40;
    do
    {
      unint64_t v5 = atomic_load((unint64_t *)(v2 + 16));
      uint64_t v6 = *(void *)(v3 + 32);
      if (*(unsigned char *)(v6 + 32))
      {
        if (!*(unsigned char *)(v2 + 14)) {
          (*(void (**)(unint64_t, unint64_t))v6)(v4, v2);
        }
      }
      double result = caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::deallocate(*(caulk::alloc::base_allocator **)(v3 + 16), (unint64_t *)v2, *(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * *(unsigned __int8 *)(v2 + 12) - 8]);
      unint64_t v2 = v5;
    }
    while (v5);
  }
  return result;
}

unint64_t caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::deallocate(caulk::alloc::base_allocator *a1, unint64_t *a2, unint64_t a3)
{
  _X4 = a2;
  uint64_t v4 = 0;
  while (*(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * v4] < a3)
  {
    if (++v4 == 10) {
      caulk::alloc::base_allocator::bad_dealloc(a1);
    }
  }
  _X2 = 0;
  _X3 = 0;
  uint64_t v7 = (uint64_t)a1 + 32 * v4 + 64;
  __asm { CASPAL          X2, X3, X2, X3, [X8] }
  atomic_store(_X2, a2);
  _X1 = 0;
  __asm { CASPAL          X0, X1, X4, X5, [X8] }
  if (result != _X2)
  {
    do
    {
      atomic_store(result, _X4);
      _X3 = 0;
      __asm { CASPAL          X2, X3, X4, X5, [X8] }
      unint64_t v17 = _X2 ^ result;
      unint64_t result = _X2;
    }
    while (v17);
  }
  atomic_fetch_add((atomic_ullong *volatile)(v7 + 16), 1uLL);
  return result;
}

void caulk::alloc::base_allocator::bad_dealloc(caulk::alloc::base_allocator *this)
{
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  caulk::alloc::alloc_error::alloc_error(exception, v2);
}

void sub_2489267CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *caulk::alloc::alloc_error::alloc_error(std::runtime_error *this, const char *a2)
{
  unint64_t result = std::runtime_error::runtime_error(this, "deallocate() called for unowned block");
  result->__vftable = (std::runtime_error_vtbl *)&unk_26FC9FCB8;
  return result;
}

void caulk::alloc::alloc_error::~alloc_error(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);

  JUMPOUT(0x24C585790);
}

unint64_t caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_le &>(unint64_t a1, uint64_t a2, unint64_t a3, _DWORD *a4)
{
  unint64_t v4 = a3;
  unint64_t v5 = atomic_load((unint64_t *)(a3 + 16 * a2 + 24));
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFCLL;
  if (*a4 >= *(_DWORD *)((v5 & 0xFFFFFFFFFFFFFFFCLL) + 8))
  {
    do
    {
      char v10 = atomic_load((unint64_t *)(v6 + 24));
      if (v10)
      {
        unint64_t v4 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(a1, a2, v4, v6);
        if (!v11) {
          caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::help_flagged(a1, a2, v4, v6);
        }
      }
      else
      {
        unint64_t v4 = v6;
      }
      unint64_t v12 = atomic_load((unint64_t *)(v4 + 16 * a2 + 24));
      unint64_t v6 = v12 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (*a4 >= *(_DWORD *)((v12 & 0xFFFFFFFFFFFFFFFCLL) + 8));
  }
  return v4;
}

unint64_t caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v8 = a4 | 2;
  do
  {
    unint64_t v9 = (unint64_t *)(a3 + 16 * a2 + 24);
    unint64_t v10 = atomic_load(v9);
    if (v10 == v8) {
      break;
    }
    uint64_t v11 = a4;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v9, (unint64_t *)&v11, v8);
    if (v11 == a4 || v11 == v8) {
      break;
    }
    char v12 = atomic_load(v9);
    if (v12)
    {
      do
      {
        a3 = atomic_load((unint64_t *)(a3 + 16 * a2 + 32));
        char v13 = atomic_load((unint64_t *)(a3 + 16 * a2 + 24));
      }
      while ((v13 & 1) != 0);
    }
    unsigned int v14 = *(_DWORD *)(a4 + 8);
    while (1)
    {
      unint64_t v15 = atomic_load((unint64_t *)(a3 + 16 * a2 + 24));
      unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFFCLL;
      if (v14 <= *(_DWORD *)((v15 & 0xFFFFFFFFFFFFFFFCLL) + 8)) {
        break;
      }
      char v17 = atomic_load((unint64_t *)(v16 + 24));
      if (v17)
      {
        a3 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(a1, a2, a3, v16);
        if (!v18) {
          caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::help_flagged(a1, a2, a3, v16);
        }
      }
      else
      {
        a3 = v16;
      }
    }
  }
  while (v16 == a4);
  return a3;
}

unint64_t caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::help_flagged(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  _X20 = a4;
  unint64_t v7 = result;
  uint64_t v8 = a4 + 16 * a2;
  unint64_t v9 = (unint64_t *)(v8 + 24);
  atomic_store(a3, (unint64_t *)(v8 + 32));
  while (1)
  {
    char v10 = atomic_load(v9);
    if (v10) {
      break;
    }
    unint64_t v11 = atomic_load(v9);
    unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFCLL;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v9, &v12, v12 | 1);
    if ((v12 & 2) != 0) {
      unint64_t result = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::help_flagged(v7, a2, _X20, v12 & 0xFFFFFFFFFFFFFFFCLL);
    }
  }
  unint64_t v13 = atomic_load(v9);
  uint64_t v14 = _X20 | 2;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(a3 + 16 * a2 + 24), (unint64_t *)&v14, v13 & 0xFFFFFFFFFFFFFFFCLL);
  if (v14 == (_X20 | 2) && atomic_fetch_add((atomic_uchar *volatile)(_X20 + 15), 0xFFu) == 1)
  {
    _X2 = 0;
    _X3 = 0;
    __asm { CASPAL          X2, X3, X2, X3, [X8] }
    atomic_store(_X2, (unint64_t *)(_X20 + 16));
    _X1 = 0;
    __asm { CASPAL          X0, X1, X20, X21, [X8] }
    if (result != _X2)
    {
      do
      {
        atomic_store(result, (unint64_t *)(_X20 + 16));
        _X3 = 0;
        __asm { CASPAL          X2, X3, X20, X21, [X8] }
        unint64_t v25 = _X2 ^ result;
        unint64_t result = _X2;
      }
      while (v25);
    }
  }
  return result;
}

unint64_t caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_lt &>(unint64_t a1, uint64_t a2, unint64_t a3, _DWORD *a4)
{
  unint64_t v4 = a3;
  unint64_t v5 = atomic_load((unint64_t *)(a3 + 16 * a2 + 24));
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFCLL;
  if (*a4 > *(_DWORD *)((v5 & 0xFFFFFFFFFFFFFFFCLL) + 8))
  {
    do
    {
      char v10 = atomic_load((unint64_t *)(v6 + 24));
      if (v10)
      {
        unint64_t v4 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(a1, a2, v4, v6);
        if (!v11) {
          caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::help_flagged(a1, a2, v4, v6);
        }
      }
      else
      {
        unint64_t v4 = v6;
      }
      unint64_t v12 = atomic_load((unint64_t *)(v4 + 16 * a2 + 24));
      unint64_t v6 = v12 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (*a4 > *(_DWORD *)((v12 & 0xFFFFFFFFFFFFFFFCLL) + 8));
  }
  return v4;
}

void AudioDSPGraph::Box::initializeAnalysis(AudioDSPGraph::Box *this)
{
  uint64_t v1 = this;
  uint64_t v66 = (std::mutex *)((char *)this + 248);
  std::mutex::lock((std::mutex *)((char *)this + 248));
  unint64_t v2 = (uint64_t *)*((void *)v1 + 39);
  unint64_t v3 = (uint64_t *)*((void *)v1 + 40);
  if (v2 == v3) {
    goto LABEL_82;
  }
  unint64_t v4 = (unint64_t)v1 + 336;
  unint64_t v5 = (unint64_t)v1 + 560;
  unint64_t v72 = (unint64_t)v1 + 560;
  unint64_t v69 = (uint64_t *)*((void *)v1 + 40);
  unint64_t v70 = (caulk::alloc::base_allocator **)v1;
  do
  {
    int v6 = *(_DWORD *)(*v2 + 24);
    caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    LODWORD(v76[0]) = v6;
    int v7 = *(_DWORD *)(caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_le>(v4, v76, 0)+ 8);
    caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v5, v8);
    if (v7 == v6) {
      goto LABEL_81;
    }
    uint64_t v9 = *(unsigned int *)(*v2 + 80);
    uint64_t v10 = AudioDSPGraph::Box::out(v1, v9);
    if (!(*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10)) {
      goto LABEL_86;
    }
    *(void *)(*v2 + 16) = v1;
    uint64_t v11 = *v2;
    uint64_t v12 = AudioDSPGraph::Box::out(v1, v9);
    *(void *)(v11 + 8) = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12);
    uint64_t v13 = *v2;
    unsigned int v14 = *(_DWORD *)(*v2 + 24);
    if (*((_DWORD *)v1 + 86) >= v14 || *((_DWORD *)v1 + 132) <= v14)
    {
      __break(1u);
      return;
    }
    unint64_t v71 = v2;
    caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    LODWORD(v76[0]) = v14;
    unint64_t v15 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_le>(v4, v76, 0);
    unint64_t v17 = *(unsigned int *)(v15 + 8);
    unsigned int v73 = v14;
    if (v17 == v14) {
      goto LABEL_80;
    }
    unint64_t v18 = v15;
    unint64_t v19 = v16;
    uint64_t v68 = v13;
    int v20 = 0;
    int v21 = 0;
    for (uint64_t i = 1; i != 9; ++i)
    {
      if (i == 1)
      {
        caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::random_engine();
        uint64_t v23 = 0;
        while (1)
        {
          long long v24 = (atomic_uchar *)&caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::random_engine(void)::engine[628 * v23 + 626];
          if ((atomic_exchange(v24, 1u) & 1) == 0) {
            break;
          }
          if (v23 == 3) {
            uint64_t v23 = 0;
          }
          else {
            ++v23;
          }
        }
        int v21 = std::uniform_int_distribution<unsigned int>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)&caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::random_engine(void)::engine[628 * v23], &caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::random_engine(void)::engine[2512]);
        atomic_store(0, (unsigned __int8 *)v24);
        int v20 = 3;
      }
      if ((v20 & ~v21) != 0) {
        break;
      }
      v20 *= 4;
    }
    uint64_t v25 = 0;
    uint64_t v26 = v70[72];
    while (1)
    {
      unint64_t v27 = *(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * v25];
      if (v27 >= *(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * i - 8]) {
        break;
      }
      if (++v25 == 10)
      {
        unint64_t v28 = 0;
        goto LABEL_52;
      }
    }
    uint64_t v29 = (uint64_t)v26 + 32 * v25 + 64;
    long long v30 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
    if (!v30)
    {
      atomic_fetch_add((atomic_uint *volatile)v26 + 10, 0x801u);
      int v31 = (unint64_t *)*((void *)v26 + 3);
      if (!v31) {
        int v31 = (unint64_t *)*((void *)v26 + 2);
      }
      uint64_t v32 = 0;
      long long v67 = v26;
      lock = (os_unfair_lock_s *)((char *)v26 + 32);
      unint64_t v33 = (v27 + 7) & 0xFFFFFFFFFFFFFFF8;
      if (v33) {
        BOOL v34 = v27 > 0x3FF0;
      }
      else {
        BOOL v34 = 1;
      }
      while (!v31)
      {
LABEL_42:
        BOOL v64 = v34;
        uint64_t v43 = v32;
        if (os_unfair_lock_trylock(lock))
        {
          uint8x8_t v44 = (unint64_t *)caulk::alloc::details::caching_page_allocator_base::allocate(*((caulk::alloc::details::caching_page_allocator_base **)v67
                                                                                                 + 1));
          int v31 = v44;
          *uint8x8_t v44 = 0;
          v44[1] = v45;
          v44[2] = 0;
          __dmb(0xBu);
          long long v46 = (atomic_ullong *)((char *)v67 + 16);
          unint64_t v47 = *((void *)v67 + 2);
          atomic_store(v47, v44);
          unint64_t v48 = v47;
          atomic_compare_exchange_strong(v46, &v48, (unint64_t)v44);
          if (v48 != v47)
          {
            unint64_t v49 = v48;
            do
            {
              atomic_store(v48, v44);
              atomic_compare_exchange_strong((atomic_ullong *volatile)v67 + 2, &v49, (unint64_t)v44);
              BOOL v42 = v49 == v48;
              unint64_t v48 = v49;
            }
            while (!v42);
          }
          os_unfair_lock_unlock(lock);
          uint64_t v32 = v43;
          BOOL v34 = v64;
        }
        else
        {
          uint64_t v32 = (v43 + 1);
          BOOL v34 = v64;
          if (v32 == 100)
          {
            sched_yield();
            uint64_t v32 = 0;
          }
        }
      }
      unint64_t v35 = (unint64_t)v31;
      while (1)
      {
        if (!v34)
        {
          uint64_t v36 = *(void *)(v35 + 16);
          uint64_t v37 = ~((_BYTE)v35 + 39 + (_BYTE)v36) & 7;
          unint64_t v38 = v36 + v33 + v37;
          if (v38 <= 0x3FE0)
          {
            uint64_t v39 = *(void *)(v35 + 16);
            atomic_compare_exchange_strong((atomic_ullong *volatile)(v35 + 16), (unint64_t *)&v39, v38);
            if (v39 == v36)
            {
LABEL_50:
              unint64_t v28 = v35 + 32 + v36 + v37;
              if ((v28 & 7) == 0)
              {
                *((void *)v67 + 3) = v35;
                atomic_fetch_add((atomic_uint *volatile)v67 + 10, 0xFFFFFFFF);
                goto LABEL_52;
              }
              _os_assert_log();
              _os_crash();
              __break(1u);
LABEL_86:
              std::string::basic_string[abi:ne180100]<0>(v76, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
              std::string::basic_string[abi:ne180100]<0>(&v75, "initializeAnalysis");
              std::string::basic_string[abi:ne180100]<0>(&v74, "Box::initializeAnalysis, Port Not Connected to Box.");
              AudioDSPGraph::ThrowException(1970168609, v76, 140, &v75, &v74);
            }
            while (1)
            {
              uint64_t v37 = ~((_BYTE)v35 + 39 + (_BYTE)v39) & 7;
              unint64_t v40 = v39 + v33 + v37;
              if (v40 > 0x3FE0) {
                break;
              }
              uint64_t v36 = v39;
              uint64_t v41 = v39;
              atomic_compare_exchange_strong((atomic_ullong *volatile)(v35 + 16), (unint64_t *)&v41, v40);
              BOOL v42 = v41 == v39;
              uint64_t v39 = v41;
              if (v42) {
                goto LABEL_50;
              }
            }
          }
        }
        unint64_t v35 = atomic_load((unint64_t *)v35);
        if (!v35) {
          unint64_t v35 = *((void *)v67 + 2);
        }
        if (v31 == (unint64_t *)v35) {
          goto LABEL_42;
        }
      }
    }
    unint64_t v28 = (unint64_t)v30;
    atomic_fetch_add((atomic_ullong *volatile)(v29 + 16), 0xFFFFFFFFFFFFFFFFLL);
LABEL_52:
    *(unsigned char *)(v28 + 12) = i;
    *(_WORD *)(v28 + 13) = 1;
    *(unsigned char *)(v28 + 15) = i;
    *(_DWORD *)(v28 + 8) = v73;
    *(void *)unint64_t v28 = v68;
    *(void *)(v28 + 24) = 0;
    *(void *)(v28 + 32) = 0;
    *(void *)(v28 + 16) = 0;
    if ((_BYTE)i)
    {
      BOOL v50 = (unint64_t *)(v28 + 32);
      uint64_t v51 = i;
      do
      {
        atomic_store(0, v50 - 1);
        atomic_store(0, v50);
        v50 += 2;
        --v51;
      }
      while (v51);
    }
    unint64_t v52 = 0;
    __dmb(0xBu);
    while (2)
    {
      if (*(_DWORD *)(v18 + 8) == *(_DWORD *)(v28 + 8))
      {
        unint64_t v53 = 0;
        goto LABEL_75;
      }
      while (1)
      {
        long long v54 = (unint64_t *)(v18 + 16 * v52 + 24);
        unint64_t v55 = atomic_load(v54);
        if ((v55 & 2) == 0) {
          break;
        }
        caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::help_flagged(v4, v52, v18, v55 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_66:
        unsigned int v59 = *(_DWORD *)(v28 + 8);
        while (1)
        {
          unint64_t v62 = atomic_load((unint64_t *)(v18 + 16 * v52 + 24));
          unint64_t v19 = v62 & 0xFFFFFFFFFFFFFFFCLL;
          if (v59 < *(_DWORD *)((v62 & 0xFFFFFFFFFFFFFFFCLL) + 8)) {
            break;
          }
          char v60 = atomic_load((unint64_t *)(v19 + 24));
          if (v60)
          {
            unint64_t v18 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(v4, v52, v18, v19);
            if (!v61) {
              caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::help_flagged(v4, v52, v18, v19);
            }
          }
          else
          {
            unint64_t v18 = v19;
          }
        }
        if (*(_DWORD *)(v18 + 8) == *(_DWORD *)(v28 + 8))
        {
          unint64_t v53 = 0;
          goto LABEL_75;
        }
      }
      atomic_store(v19, (unint64_t *)(v28 + 16 * v52 + 24));
      unint64_t v56 = v19;
      atomic_compare_exchange_strong((atomic_ullong *volatile)v54, &v56, v28);
      if (v56 != v19)
      {
        if ((v56 & 2) != 0) {
          caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::help_flagged(v4, v52, v18, v56 & 0xFFFFFFFFFFFFFFFCLL);
        }
        char v57 = atomic_load(v54);
        if (v57)
        {
          do
          {
            unint64_t v18 = atomic_load((unint64_t *)(v18 + 16 * v52 + 32));
            char v58 = atomic_load((unint64_t *)(v18 + 16 * v52 + 24));
          }
          while ((v58 & 1) != 0);
        }
        goto LABEL_66;
      }
      unint64_t v53 = v28;
LABEL_75:
      if (v53 | v52)
      {
        unint64_t v17 = atomic_load((unint64_t *)(v28 + 24));
        if ((v17 & 1) == 0 && ++v52 != i)
        {
          LODWORD(v76[0]) = v73;
          unint64_t v18 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::key_le>(v4, v76, v52);
          unint64_t v19 = v63;
          continue;
        }
      }
      else
      {
        caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::deallocate(v70[72], (unint64_t *)v28, *(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * *(unsigned __int8 *)(v28 + 12) - 8]);
      }
      break;
    }
LABEL_80:
    unint64_t v5 = v72;
    caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v72, v17);
    uint64_t v1 = (AudioDSPGraph::Box *)v70;
    unint64_t v2 = v71;
    unint64_t v3 = v69;
LABEL_81:
    ++v2;
  }
  while (v2 != v3);
LABEL_82:

  std::mutex::unlock(v66);
}

void sub_2489272CC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock, std::mutex *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
}

unint64_t *caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop()
{
  _X0 = 0;
  _X1 = 0;
  __asm { CASPAL          X0, X1, X0, X1, [X8] }
  if (result)
  {
    int v7 = result;
    do
    {
      _X6 = atomic_load(result);
      _X5 = 0;
      __asm { CASPAL          X4, X5, X6, X7, [X8] }
      if (_X4 == v7) {
        break;
      }
      unint64_t result = _X4;
      int v7 = _X4;
    }
    while (_X4);
  }
  return result;
}

void caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::random_engine()
{
  {
    caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::multi_simple_random();
  }
}

void sub_248927424(_Unwind_Exception *a1)
{
}

uint64_t caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::multi_simple_random()
{
  uint64_t v0 = 0;
  uint64_t v1 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::random_engine(void)::engine;
  unint64_t v2 = caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::random_engine(void)::engine;
  do
  {
    unint64_t v3 = &caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::random_engine(void)::engine[628 * v0];
    unsigned int v4 = 5489;
    *unint64_t v3 = 5489;
    for (uint64_t i = 1; i != 624; ++i)
    {
      unsigned int v4 = i + 1812433253 * (v4 ^ (v4 >> 30));
      v2[i] = v4;
    }
    *((void *)v3 + 312) = 0;
    LOBYTE(caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::random_engine(void)::engine[628 * v0++ + 626]) = 0;
    v2 += 628;
  }
  while (v0 != 4);
  uint64_t v6 = 0;
  qword_269334D90 = 0xFFFFFFFF00000000;
  do
  {
    LODWORD(result) = mach_absolute_time();
    int *v1 = result;
    for (uint64_t j = 1; j != 624; ++j)
    {
      uint64_t result = j + 1812433253 * (result ^ (result >> 30));
      v1[j] = result;
    }
    *((void *)v1 + 312) = 0;
    ++v6;
    v1 += 628;
  }
  while (v6 != 4);
  return result;
}

uint64_t AudioDSPGraph::Box::uninitialize(AudioDSPGraph::Box *this)
{
  uint64_t v2 = *((void *)this + 25);
  uint64_t v3 = *((void *)this + 26);
  while (v2 != v3)
  {
    unsigned int v4 = *(void **)v2;
    uint64_t v5 = *(void *)(*(void *)v2 + 16);
    *(void *)(*(void *)v2 + 16) = 0;
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
    int v7 = (TimeFreqConverter **)v4[6];
    for (uint64_t i = (TimeFreqConverter **)v4[7]; i != v7; std::unique_ptr<TimeFreqConverter>::reset[abi:ne180100](i))
      --i;
    v4[7] = v7;
    AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SimpleABL *)(v4 + 9));
    v2 += 8;
  }
  unint64_t v8 = (uint64_t *)*((void *)this + 28);
  uint64_t v9 = (uint64_t *)*((void *)this + 29);
  while (v8 != v9)
  {
    uint64_t v10 = *v8;
    AudioDSPGraph::SimpleABL::free((AudioDSPGraph::SimpleABL *)(*v8 + 16));
    uint64_t v12 = *(TimeFreqConverter ***)(v10 + 80);
    for (uint64_t j = *(TimeFreqConverter ***)(v10 + 88); j != v12; std::unique_ptr<TimeFreqConverter>::reset[abi:ne180100](j))
      --j;
    *(void *)(v10 + 88) = v12;
    ++v8;
  }
  uint64_t result = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 600))(this);
  if (*((unsigned char *)this + 760)) {
    *((unsigned char *)this + 760) = 0;
  }
  return result;
}

uint64_t AudioDSPGraph::Box::initialize(AudioDSPGraph::Box *this)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*((void *)this + 25);
  CFAllocatorRef v2 = (CFAllocatorRef)*((void *)this + 26);
  if (v1 != v2)
  {
    unint64_t v3 = 0x269332000;
    unint64_t v4 = 0x269332000;
    CFAllocatorRef allocator = (CFAllocatorRef)*((void *)this + 26);
    do
    {
      uint64_t v5 = *(void *)v1;
      uint64_t v6 = *(void *)(*(void *)v1 + 8);
      int v7 = *(uint64_t **)(v6 + 120);
      if (*((_DWORD *)v7 + 2) == 1718773105)
      {
        unsigned int v8 = *((_DWORD *)v7 + 7);
        std::vector<std::unique_ptr<TimeFreqConverter>>::reserve((void *)(v5 + 48), v8);
        if (v8) {
          operator new();
        }
        uint64_t v9 = *(void *)(*(void *)(v5 + 8) + 32);
        if (v9) {
          uint64_t v9 = *(void *)(*(void *)(*(void *)(v9 + 16) + 8) + 16);
        }
        CFAllocatorRef v2 = allocator;
        unint64_t v3 = 0x269332000uLL;
        unint64_t v4 = 0x269332000uLL;
        int v10 = *(_DWORD *)(v9 + 268);
        if (v10 == 1) {
          int v10 = *(_DWORD *)(v9 + 272);
        }
        AudioDSPGraph::SimpleABL::alloc((AudioDSPGraph::SimpleABL *)(v5 + 72), 0, 4 * v10);
        uint64_t v6 = *(void *)(v5 + 8);
        int v7 = *(uint64_t **)(v6 + 120);
      }
      uint64_t v11 = (void *)(v5 + 24);
      if (*(char *)(v5 + 47) < 0) {
        uint64_t v11 = (void *)*v11;
      }
      uint64_t v80 = 0;
      memset(v79, 0, sizeof(v79));
      uint64_t v12 = *v7;
      int v13 = *((_DWORD *)v7 + 7);
      if (*((_DWORD *)v7 + 2) == 1718773105)
      {
        *((void *)&v79[0] + 1) = 0x296C70636DLL;
        *(void *)&v79[1] = 0x100000004;
        DWORD2(v79[1]) = 4;
        LODWORD(v80) = 32;
        uint64_t v6 = *(void *)(v5 + 8);
      }
      else
      {
        uint64_t v14 = v7[4];
        DWORD2(v79[0]) = *((_DWORD *)v7 + 2);
        *(long long *)((char *)v79 + 12) = *(_OWORD *)((char *)v7 + 12);
        uint64_t v80 = v14;
      }
      *(void *)&v79[0] = v12;
      HIDWORD(v79[1]) = v13;
      uint64_t v15 = *(void *)(v5 + 96);
      uint64_t v16 = *(unsigned int *)(*(void *)(*(void *)(*(void *)(v6 + 8) + 8) + 8) + 900);
      if (*(void *)(v3 + 1520) != -1) {
        dispatch_once(&NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::once, &__block_literal_global_885);
      }
      unint64_t v17 = *(uint64_t (**)(uint64_t, void, void *, uint64_t, void, long long *))(v4 + 1512);
      if (v17) {
        uint64_t v18 = v17(v15, 0, v11, v16, 0, v79);
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = *(void *)(v5 + 16);
      *(void *)(v5 + 16) = v18;
      if (v19)
      {
        (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
        uint64_t v18 = *(void *)(v5 + 16);
      }
      if (!v18)
      {
        std::string::basic_string[abi:ne180100]<0>(v85, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Files.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v84, "initialize");
        std::string::basic_string[abi:ne180100]<0>(outExtAudioFile, "NewAudioCapturer returned null");
        AudioDSPGraph::ThrowException(1852204065, v85, 242, &v84, (long long *)outExtAudioFile);
      }
      CFAllocatorRef v1 = (const __CFAllocator *)((char *)v1 + 8);
    }
    while (v1 != v2);
  }
  int v20 = (uint64_t *)*((void *)this + 28);
  long long v77 = (uint64_t *)*((void *)this + 29);
  if (v20 != v77)
  {
    CFAllocatorRef allocatora = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      uint64_t v21 = *v20;
      uint64_t v22 = *(void *)(*v20 + 8);
      uint64_t v23 = *(void *)(v22 + 120);
      if (*(_DWORD *)(v23 + 8) == 1718773105)
      {
        unsigned int v24 = *(_DWORD *)(v23 + 28);
        std::vector<std::unique_ptr<TimeFreqConverter>>::reserve((void *)(v21 + 80), v24);
        if (v24) {
          operator new();
        }
      }
      if (*(char *)(v21 + 71) < 0)
      {
        uint64_t v25 = *(const UInt8 **)(v21 + 48);
        CFIndex v26 = *(void *)(v21 + 56);
      }
      else
      {
        uint64_t v25 = (const UInt8 *)(v21 + 48);
        CFIndex v26 = *(unsigned __int8 *)(v21 + 71);
      }
      CFURLRef v27 = CFURLCreateFromFileSystemRepresentation(allocatora, v25, v26, 0);
      if (!v27)
      {
        std::string::basic_string[abi:ne180100]<0>(v79, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Files.cpp");
        std::string::basic_string[abi:ne180100]<0>(v85, "readFile");
        std::string::basic_string[abi:ne180100]<0>(&v84, "couldn't convert path to CFURLRef");
        AudioDSPGraph::ThrowException(-4960, v79, 83, v85, &v84);
      }
      CFURLRef v28 = v27;
      CFTypeID v29 = CFGetTypeID(v27);
      if (v29 != CFURLGetTypeID())
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Could not construct");
      }
      outExtAudioFile[0] = 0;
      OSStatus v30 = ExtAudioFileOpenURL(v28, outExtAudioFile);
      if (v30)
      {
        std::string::basic_string[abi:ne180100]<0>(v79, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Files.cpp");
        std::string::basic_string[abi:ne180100]<0>(v85, "readFile");
        std::string::basic_string[abi:ne180100]<0>(&v84, "ExtAudioFileOpenURL failed");
        AudioDSPGraph::ThrowException(v30, v79, 89, v85, &v84);
      }
      int v31 = outExtAudioFile[0];
      unint64_t outPropertyData = 0;
      UInt32 ioPropertyDataSize = 8;
      OSStatus Property = ExtAudioFileGetProperty(outExtAudioFile[0], 0x2366726Du, &ioPropertyDataSize, &outPropertyData);
      if (Property)
      {
        std::string::basic_string[abi:ne180100]<0>(v79, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Files.cpp");
        std::string::basic_string[abi:ne180100]<0>(v85, "readFile");
        std::string::basic_string[abi:ne180100]<0>(&v84, "ExtAudioFileGetProperty(FileLengthFrames) failed");
        AudioDSPGraph::ThrowException(Property, v79, 99, v85, &v84);
      }
      unint64_t v33 = outPropertyData;
      if ((outPropertyData & 0x8000000000000000) != 0)
      {
        long long v67 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v67, "numerical cast overflow: could not retain value in conversion type");
        v67->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x263F8C398] + 16);
      }
      uint64_t v34 = *(void *)(v21 + 8);
      uint64_t v35 = *(void *)(v34 + 120);
      *(_DWORD *)(v21 + 36) = *(_DWORD *)(v35 + 24);
      uint64_t v36 = *(void *)(v34 + 32);
      if (v36) {
        uint64_t v36 = *(void *)(*(void *)(*(void *)(v36 + 16) + 8) + 16);
      }
      unsigned int v37 = *(_DWORD *)(v35 + 28);
      uint64_t v38 = *(unsigned int *)(v36 + 268);
      if (v38 == 1) {
        uint64_t v38 = *(unsigned int *)(v36 + 272);
      }
      int v39 = caulk::numeric::exceptional_cast<unsigned int,unsigned long long>(v33);
      unint64_t v40 = v33 + v38;
      *(_DWORD *)(v21 + 40) = v39;
      unsigned int v41 = *(_DWORD *)(v21 + 36);
      unsigned int v42 = caulk::numeric::exceptional_cast<unsigned int,unsigned long long>(v40);
      unsigned int v43 = caulk::numeric::exceptional_mul<unsigned int>(v41, v42);
      uint8x8_t v44 = (unsigned int **)(v21 + 16);
      AudioDSPGraph::SimpleABL::alloc((AudioDSPGraph::SimpleABL *)(v21 + 16), v37, v43);
      OSStatus v45 = ExtAudioFileSetProperty(outExtAudioFile[0], 0x63666D74u, 0x28u, *(const void **)(*(void *)(v21 + 8) + 120));
      if (v45)
      {
        std::string::basic_string[abi:ne180100]<0>(v79, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Files.cpp");
        std::string::basic_string[abi:ne180100]<0>(v85, "readFile");
        std::string::basic_string[abi:ne180100]<0>(&v84, "ExtAudioFileSetProperty(ClientDataFormat) failed");
        AudioDSPGraph::ThrowException(v45, v79, 108, v85, &v84);
      }
      UInt32 ioNumberFrames = *(_DWORD *)(v21 + 40);
      OSStatus v46 = ExtAudioFileRead(outExtAudioFile[0], &ioNumberFrames, *(AudioBufferList **)(v21 + 16));
      if (v46)
      {
        std::string::basic_string[abi:ne180100]<0>(v79, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Files.cpp");
        std::string::basic_string[abi:ne180100]<0>(v85, "readFile");
        std::string::basic_string[abi:ne180100]<0>(&v84, "ExtAudioFileRead failed");
        AudioDSPGraph::ThrowException(v46, v79, 115, v85, &v84);
      }
      UInt32 v47 = ioNumberFrames;
      *(_DWORD *)(v21 + 40) = ioNumberFrames;
      uint64_t v48 = *(void *)(*(void *)(v21 + 8) + 32);
      if (v48) {
        uint64_t v48 = *(void *)(*(void *)(*(void *)(v48 + 16) + 8) + 16);
      }
      int v49 = *(_DWORD *)(v48 + 268);
      if (v49 == 1) {
        int v49 = *(_DWORD *)(v48 + 272);
      }
      BOOL v50 = *v44;
      if (*v44 && *v50)
      {
        unint64_t v51 = 0;
        int v52 = *(_DWORD *)(v21 + 36);
        uint64_t v53 = v52 * v47;
        size_t v54 = (v49 * v52);
        uint64_t v55 = 4;
        do
        {
          bzero((void *)(*(void *)&v50[v55] + v53), v54);
          ++v51;
          BOOL v50 = *v44;
          v55 += 4;
        }
        while (v51 < **v44);
      }
      if (v31) {
        ExtAudioFileDispose(v31);
      }
      CFRelease(v28);
      *(_DWORD *)(v21 + 32) = 0;
      ++v20;
    }
    while (v20 != v77);
  }
  (*(void (**)(AudioDSPGraph::Box *))(*(void *)this + 592))(this);
  unint64_t v56 = (uint64_t *)*((void *)this + 39);
  char v57 = (uint64_t *)*((void *)this + 40);
  while (v56 != v57)
  {
    uint64_t v58 = *v56++;
    (*(void (**)(uint64_t))(*(void *)v58 + 128))(v58);
  }
  uint64_t result = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 440))(this);
  if ((result & 1) == 0)
  {
    uint64_t v60 = *((void *)this + 8);
    uint64_t v61 = *((void *)this + 9);
    if (v60 != v61)
    {
      uint64_t v62 = *((void *)this + 8);
      do
      {
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v62 + 40))(v62);
        if (*(_DWORD *)(*(void *)(result + 120) + 8) == 1718773105)
        {
          std::string::basic_string[abi:ne180100]<0>(v79, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
          std::string::basic_string[abi:ne180100]<0>(v85, "initialize");
          uint64_t v68 = (void *)((char *)this + 32);
          if (*((char *)this + 55) < 0) {
            uint64_t v68 = (void *)*v68;
          }
          uint64_t v69 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 16))(this);
          AudioDSPGraph::strprintf((AudioDSPGraph *)"frequency data is passed through a No Frequency Safe Box-> %s %s", v70, v68, v69);
        }
        v62 += 32;
        v60 += 32;
      }
      while (v62 != v61);
    }
    uint64_t v63 = *((void *)this + 11);
    uint64_t v64 = *((void *)this + 12);
    if (v63 != v64)
    {
      uint64_t v65 = *((void *)this + 11);
      do
      {
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v65 + 40))(v65);
        if (*(_DWORD *)(*(void *)(result + 120) + 8) == 1718773105)
        {
          std::string::basic_string[abi:ne180100]<0>(v79, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
          std::string::basic_string[abi:ne180100]<0>(v85, "initialize");
          unint64_t v71 = (void *)((char *)this + 32);
          if (*((char *)this + 55) < 0) {
            unint64_t v71 = (void *)*v71;
          }
          uint64_t v72 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 16))(this);
          AudioDSPGraph::strprintf((AudioDSPGraph *)"frequency data is passed through a No Frequency Safe Box-> %s %s", v73, v71, v72);
        }
        v65 += 32;
        v63 += 32;
      }
      while (v65 != v64);
    }
  }
  return result;
}

void sub_24892823C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v35 - 105) < 0) {
    operator delete(*(void **)(v35 - 128));
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Box::decompileAnalyzers(uint64_t result, const char *a2, char a3)
{
  uint64_t v3 = *(void *)(result + 312);
  if (v3 != *(void *)(result + 320))
  {
    if ((a3 & 1) == 0) {
      AudioDSPGraph::strprintf((AudioDSPGraph *)"analysis ", a2);
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"analysis %qu", a2, *(void *)(*(void *)v3 + 88));
  }
  return result;
}

void sub_24892878C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Box::decompileAntecedents(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 128);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = (char **)(result + 32);
    uint64_t v4 = *(void *)(v1 + 16);
    uint64_t v5 = (char *)(v4 + 32);
    if (*(char *)(v4 + 55) < 0) {
      uint64_t v5 = *(char **)v5;
    }
    std::string::basic_string[abi:ne180100]<0>(v12, v5);
    AudioDSPGraph::asDecompileString(&v13, v12);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v6 = &v13;
    }
    else {
      uint64_t v6 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    int v7 = (char *)v3;
    if (*(char *)(v2 + 55) < 0) {
      int v7 = *v3;
    }
    std::string::basic_string[abi:ne180100]<0>(v10, v7);
    AudioDSPGraph::asDecompileString(&__p, v10);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"order %s %s\n", v8, v6, p_p);
  }
  return result;
}

void sub_248928988(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (*(char *)(v35 - 81) < 0) {
    operator delete(*(void **)(v35 - 104));
  }
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Box::decompilePropertyTaps(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 176);
  if (v1 != *(void *)(result + 184))
  {
    uint64_t v2 = result;
    uint64_t v3 = (char **)(result + 32);
    uint64_t v4 = (char *)(*(void *)v1 + 32);
    if (*(char *)(*(void *)v1 + 55) < 0) {
      uint64_t v4 = *(char **)v4;
    }
    std::string::basic_string[abi:ne180100]<0>(v15, v4);
    AudioDSPGraph::asDecompileString(&v16, v15);
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v5 = &v16;
    }
    else {
      uint64_t v5 = (std::string *)v16.__r_.__value_.__r.__words[0];
    }
    uint64_t v6 = (char *)v3;
    if (*(char *)(v2 + 55) < 0) {
      uint64_t v6 = *v3;
    }
    uint64_t v7 = *(unsigned int *)(v1 + 8);
    uint64_t v8 = *(unsigned int *)(v1 + 12);
    uint64_t v9 = *(unsigned int *)(v1 + 16);
    std::string::basic_string[abi:ne180100]<0>(v13, v6);
    AudioDSPGraph::asDecompileString(&__p, v13);
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    uint64_t v12 = "true";
    if (!*(unsigned char *)(v1 + 36)) {
      uint64_t v12 = &byte_248942E06;
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"wireProperty (%s %u %u %u) (%s %u %u %u) %s\n", v10, v5, v7, v8, v9, p_p, *(unsigned int *)(v1 + 24), *(unsigned int *)(v1 + 28), *(unsigned int *)(v1 + 32), v12);
  }
  return result;
}

void sub_248928BA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (*(char *)(v36 - 89) < 0) {
    operator delete(*(void **)(v36 - 112));
  }
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  if (*(char *)(v36 - 113) < 0) {
    operator delete(*(void **)(v36 - 136));
  }
  if (a36 < 0) {
    operator delete(a31);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Box::decompileParameterTaps(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 152);
  if (v1 != *(void *)(result + 160))
  {
    uint64_t v2 = result;
    uint64_t v3 = (char **)(result + 32);
    uint64_t v4 = (char *)(*(void *)v1 + 32);
    if (*(char *)(*(void *)v1 + 55) < 0) {
      uint64_t v4 = *(char **)v4;
    }
    std::string::basic_string[abi:ne180100]<0>(v15, v4);
    AudioDSPGraph::asDecompileString(&v16, v15);
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v5 = &v16;
    }
    else {
      uint64_t v5 = (std::string *)v16.__r_.__value_.__r.__words[0];
    }
    uint64_t v6 = (char *)v3;
    if (*(char *)(v2 + 55) < 0) {
      uint64_t v6 = *v3;
    }
    uint64_t v7 = *(unsigned int *)(v1 + 8);
    uint64_t v8 = *(unsigned int *)(v1 + 12);
    uint64_t v9 = *(unsigned int *)(v1 + 16);
    std::string::basic_string[abi:ne180100]<0>(v13, v6);
    AudioDSPGraph::asDecompileString(&__p, v13);
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    uint64_t v12 = "true";
    if (!*(unsigned char *)(v1 + 36)) {
      uint64_t v12 = &byte_248942E06;
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"wireParam (%s %u %u %u) (%s %u %u %u) %s\n", v10, v5, v7, v8, v9, p_p, *(unsigned int *)(v1 + 24), *(unsigned int *)(v1 + 28), *(unsigned int *)(v1 + 32), v12);
  }
  return result;
}

void sub_248928DC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (*(char *)(v36 - 89) < 0) {
    operator delete(*(void **)(v36 - 112));
  }
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  if (*(char *)(v36 - 113) < 0) {
    operator delete(*(void **)(v36 - 136));
  }
  if (a36 < 0) {
    operator delete(a31);
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::Box::decompileWires(void *result)
{
  uint64_t v1 = result[11];
  for (uint64_t i = result[12]; v1 != i; v1 += 32)
  {
    uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1);
    if (result[4]) {
      AudioDSPGraph::strprintf((AudioDSPGraph *)"wire ", v2);
    }
  }
  return result;
}

void sub_2489299B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (*(char *)(v39 - 121) < 0) {
    operator delete(*(void **)(v39 - 144));
  }
  if (a39 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::Box::decompileBox(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    uint64_t v3 = (char *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v3 = *(char **)v3;
    }
    std::string::basic_string[abi:ne180100]<0>(&v10, v3);
    AudioDSPGraph::asDecompileString(&v11, (char *)&v10);
    if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v5 = &v11;
    }
    else {
      uint64_t v5 = (std::string *)v11.__r_.__value_.__r.__words[0];
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"box %s ", v4, v5);
  }
  uint64_t v6 = (char *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    uint64_t v6 = *(char **)(a1 + 32);
  }
  uint64_t v7 = *(void *)(a1 + 56);
  std::string::basic_string[abi:ne180100]<0>(&v10, v6);
  AudioDSPGraph::asDecompileString(&v11, (char *)&v10);
  if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v9 = &v11;
  }
  else {
    uint64_t v9 = (std::string *)v11.__r_.__value_.__r.__words[0];
  }
  AudioDSPGraph::strprintf((AudioDSPGraph *)"box %qu %s ", v8, v7, v9);
}

void sub_248929F2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (*(char *)(v35 - 49) < 0) {
    operator delete(*(void **)(v35 - 72));
  }
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  if (a29)
  {
    if (a28 < 0) {
      operator delete(a23);
    }
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::Box::writeDotEdges(void *result)
{
  uint64_t v1 = result[11];
  uint64_t v5 = result[12];
  if (v1 != v5)
  {
    uint64_t v2 = result;
    do
    {
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1);
      uint64_t v4 = result[4];
      if (v4) {
        AudioDSPGraph::strprintf((AudioDSPGraph *)"B%qu -> B%qu", v3, v2[7], *(void *)(*(void *)(*(void *)(v4 + 16) + 8) + 56));
      }
      v1 += 32;
    }
    while (v1 != v5);
  }
  return result;
}

void sub_24892A19C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::Box::writeDotAttributes(uint64_t a1, const char *a2)
{
  uint64_t v2 = (void *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    uint64_t v2 = (void *)*v2;
  }
  AudioDSPGraph::strprintf((AudioDSPGraph *)"B%qu [shape=box, label=\"%s\\n", a2, *(void *)(a1 + 56), v2);
}

void sub_24892A3AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t AudioDSPGraph::Box::upstreamLatencyInTicks(AudioDSPGraph::Box *this)
{
  if (*((unsigned char *)this + 760)) {
    return *((void *)this + 94);
  }
  uint64_t v3 = (void *)*((void *)this + 8);
  uint64_t v4 = (void *)*((void *)this + 9);
  if (v3 == v4)
  {
    unint64_t v2 = 0;
  }
  else
  {
    unint64_t v2 = 0;
    uint64_t v5 = (void *)*((void *)this + 8);
    uint64_t v6 = (void *)*((void *)this + 8);
    do
    {
      uint64_t v7 = *v6;
      v6 += 4;
      uint64_t v8 = *(AudioDSPGraph::Box **)(*(void *)((*(uint64_t (**)(void *))(v7 + 40))(v5) + 8) + 8);
      uint64_t v9 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)v8 + 72))(v8);
      uint64_t v10 = AudioDSPGraph::Box::upstreamLatencyInTicks(v8);
      if (v2 <= v10 + v9) {
        unint64_t v2 = v10 + v9;
      }
      v3 += 4;
      uint64_t v5 = v6;
    }
    while (v6 != v4);
  }
  *((void *)this + 94) = v2;
  *((unsigned char *)this + 760) = 1;
  return v2;
}

AudioDSPGraph::PropertyTap **AudioDSPGraph::Box::processPropertyTaps(AudioDSPGraph::PropertyTap **this)
{
  uint64_t v1 = this[22];
  unint64_t v2 = this[23];
  if (v1 != v2)
  {
    uint64_t v3 = (AudioDSPGraph::Box *)this;
    do
    {
      this = (AudioDSPGraph::PropertyTap **)AudioDSPGraph::PropertyTap::process(v1, v3);
      uint64_t v1 = (AudioDSPGraph::PropertyTap *)((char *)v1 + 64);
    }
    while (v1 != v2);
  }
  return this;
}

uint64_t AudioDSPGraph::PropertyTap::process(AudioDSPGraph::PropertyTap *this, AudioDSPGraph::Box *a2)
{
  uint64_t v4 = *((void *)this + 5);
  unsigned int v12 = *((_DWORD *)this + 12) - v4;
  int v5 = (*(uint64_t (**)(void, void, void, void, unsigned int *, uint64_t))(**(void **)this + 304))(*(void *)this, *((unsigned int *)this + 2), *((unsigned int *)this + 3), *((unsigned int *)this + 4), &v12, v4);
  if (v5)
  {
    int v7 = v5;
    std::string::basic_string[abi:ne180100]<0>(&v11, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v10, "process");
    std::string::basic_string[abi:ne180100]<0>(&v9, "getProperty failed");
    AudioDSPGraph::ThrowException(v7, &v11, 806, &v10, &v9);
  }
  uint64_t result = (*(uint64_t (**)(AudioDSPGraph::Box *, void, void, void, void, uint64_t))(*(void *)a2 + 312))(a2, *((unsigned int *)this + 6), *((unsigned int *)this + 7), *((unsigned int *)this + 8), v12, v4);
  if (result)
  {
    int v8 = result;
    std::string::basic_string[abi:ne180100]<0>(&v11, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v10, "process");
    std::string::basic_string[abi:ne180100]<0>(&v9, "setProperty failed");
    AudioDSPGraph::ThrowException(v8, &v11, 812, &v10, &v9);
  }
  return result;
}

void sub_24892A67C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
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
  _Unwind_Resume(exception_object);
}

AudioDSPGraph::ParameterTap **AudioDSPGraph::Box::processParameterTaps(AudioDSPGraph::ParameterTap **this)
{
  uint64_t v1 = this[19];
  unint64_t v2 = this[20];
  if (v1 != v2)
  {
    uint64_t v3 = (AudioDSPGraph::Box *)this;
    do
    {
      this = (AudioDSPGraph::ParameterTap **)AudioDSPGraph::ParameterTap::process(v1, v3);
      uint64_t v1 = (AudioDSPGraph::ParameterTap *)((char *)v1 + 40);
    }
    while (v1 != v2);
  }
  return this;
}

uint64_t AudioDSPGraph::ParameterTap::process(AudioDSPGraph::ParameterTap *this, AudioDSPGraph::Box *a2)
{
  (*(void (**)(void, void, void, void))(**(void **)this + 88))(*(void *)this, *((unsigned int *)this + 2), *((unsigned int *)this + 3), *((unsigned int *)this + 4));
  uint64_t v4 = *((unsigned int *)this + 6);
  uint64_t v5 = *((unsigned int *)this + 7);
  uint64_t v6 = *((unsigned int *)this + 8);
  int v7 = *(uint64_t (**)(AudioDSPGraph::Box *, uint64_t, uint64_t, uint64_t, void))(*(void *)a2 + 80);

  return v7(a2, v4, v5, v6, 0);
}

void *AudioDSPGraph::Box::doProcess(AudioDSPGraph::Box *this, uint64_t a2)
{
  v25[0] = (char *)this + 640;
  if (*((void *)this + 83)) {
    uint64_t CurrentTimeInNanos = AudioDSPGraph::details::DoTimePoint<std::function<void ()(double)>>::GetCurrentTimeInNanos();
  }
  else {
    uint64_t CurrentTimeInNanos = 0;
  }
  v25[1] = CurrentTimeInNanos;
  if (*((unsigned char *)this + 744))
  {
    if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = AudioDSPGraph::Box::out(this, v5);
        uint64_t v7 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56);
        int v8 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120) + 8);
        uint64_t v9 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120);
        if (v8 == 1819304813)
        {
          int v10 = *(_DWORD *)(v9 + 24);
          int v11 = a2;
        }
        else
        {
          if (*(_DWORD *)(v9 + 8) != 1718773105)
          {
            unsigned int v12 = *(_DWORD *)(v7 + 100);
            goto LABEL_13;
          }
          int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120) + 24);
          int v10 = 2 * a2;
        }
        unsigned int v12 = v10 * v11;
LABEL_13:
        AudioDSPGraph::Buffer::setByteSize((unsigned int **)v7, v12);
        uint64_t v5 = (v5 + 1);
      }
      while (v5 < ((*((void *)this + 12) - *((void *)this + 11)) >> 5));
    }
    unsigned int v13 = atomic_fetch_or((atomic_uint *volatile)this + 192, 0x80000000);
    uint64_t v14 = *(void *)this;
    if (v13)
    {
      (*(void (**)(AudioDSPGraph::Box *))(v14 + 480))(this);
      (*(void (**)(AudioDSPGraph::Box *))(*(void *)this + 488))(this);
      uint64_t v15 = (caulk::concurrent::details::lf_read_sync_write_impl *)*((void *)this + 92);
      CFIndex v26 = this;
      int v27 = a2;
      _ZNK5caulk10concurrent26lf_read_synchronized_writeINSt3__16vectorIN13AudioDSPGraph18RenderObserverListINS4_3BoxEE14RenderObserverENS2_9allocatorIS8_EEEEE6accessIZNS7_7callAllEPS6_jNS4_18RenderCallbackTypeEEUlRKT_E_EEvOSG_(v15, (uint64_t *)&v26);
      (*(void (**)(AudioDSPGraph::Box *, uint64_t))(*(void *)this + 472))(this, a2);
      std::string v16 = (uint64_t *)*((void *)this + 25);
      unint64_t v17 = (uint64_t *)*((void *)this + 26);
      while (v16 != v17)
      {
        if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0
          || ((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) != 0)
        {
          AudioDSPGraph::FileRecorder::record(*v16);
        }
        ++v16;
      }
      uint64_t v18 = (AudioDSPGraph::FileInjector **)*((void *)this + 28);
      uint64_t v19 = (AudioDSPGraph::FileInjector **)*((void *)this + 29);
      while (v18 != v19)
        AudioDSPGraph::FileInjector::inject(*v18++, a2);
      caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
      for (unint64_t i = atomic_load((unint64_t *)this + 45); ; unint64_t i = atomic_load(v22))
      {
        uint64_t v21 = (unint64_t *)(i & 0xFFFFFFFFFFFFFFFCLL);
        if ((unint64_t *)((char *)this + 520) == v21) {
          break;
        }
        uint64_t v22 = v21 + 3;
        atomic_load(v21 + 3);
        if (*(unsigned char *)(*v21 + 28)) {
          (*(void (**)(unint64_t, void, uint64_t))(*(void *)*v21 + 64))(*v21, *(void *)(*(void *)(*v21 + 8) + 56), a2);
        }
      }
      caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal((unint64_t)this + 560, (unint64_t)v21);
      uint64_t v23 = (caulk::concurrent::details::lf_read_sync_write_impl *)(*((void *)this + 92) + 64);
      CFIndex v26 = this;
      int v27 = a2;
      _ZNK5caulk10concurrent26lf_read_synchronized_writeINSt3__16vectorIN13AudioDSPGraph18RenderObserverListINS4_3BoxEE14RenderObserverENS2_9allocatorIS8_EEEEE6accessIZNS7_7callAllEPS6_jNS4_18RenderCallbackTypeEEUlRKT_E_EEvOSG_(v23, (uint64_t *)&v26);
    }
    else
    {
      (*(void (**)(AudioDSPGraph::Box *, uint64_t))(v14 + 472))(this, a2);
    }
    atomic_fetch_and((atomic_uint *volatile)this + 192, 0x7FFFFFFFu);
  }
  return AudioDSPGraph::details::DoTimePoint<std::function<void ()(double)>>::~DoTimePoint(v25);
}

void sub_24892AB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  atomic_fetch_and((atomic_uint *volatile)(v9 + 768), 0x7FFFFFFFu);
  AudioDSPGraph::details::DoTimePoint<std::function<void ()(double)>>::~DoTimePoint(&a9);
  _Unwind_Resume(a1);
}

void AudioDSPGraph::Box::getFormatFromUnit(AudioDSPGraph::Box *this)
{
  std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v7, "getFormatFromUnit");
  std::string::basic_string[abi:ne180100]<0>(&v5, "Box::getFormatFromUnit ");
  unint64_t v2 = (const char *)(*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 16))(this);
  size_t v3 = strlen(v2);
  uint64_t v4 = std::string::append(&v5, v2, v3);
  std::string v6 = *v4;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  AudioDSPGraph::ThrowException(1869640255, &v8, 834, &v7, (long long *)&v6);
}

void sub_24892AC60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (*(char *)(v28 - 17) < 0) {
    operator delete(*(void **)(v28 - 40));
  }
  _Unwind_Resume(exception_object);
}

char *AudioDSPGraph::Box::isogroupTraceOutputs(char *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *((void *)result + 11);
  uint64_t v4 = *((void *)result + 12);
  if (v3 != v4)
  {
    long long v7 = result;
    long long v8 = (float *)(a3 + 136);
    do
    {
      if (!(*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3))
      {
        std::string::basic_string[abi:ne180100]<0>(v17, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
        std::string::basic_string[abi:ne180100]<0>(v16, "isogroupTraceOutputs");
        unsigned int v13 = v7 + 32;
        if (v7[55] < 0) {
          unsigned int v13 = (void *)*v13;
        }
        uint64_t v14 = (*(uint64_t (**)(char *))(*(void *)v7 + 16))(v7);
        AudioDSPGraph::strprintf((AudioDSPGraph *)"box %s %s output port is not connected.", v15, v13, v14);
      }
      uint64_t result = (char *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3);
      for (unint64_t i = (void *)*((void *)result + 4); i; unint64_t i = (void *)*i)
      {
        uint64_t v10 = *(void *)(i[2] + 8);
        uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 272))(v10);
        if (v11)
        {
          unint64_t v12 = v11;
          std::__hash_table<AudioDSPGraph::FCBox *,std::hash<AudioDSPGraph::FCBox *>,std::equal_to<AudioDSPGraph::FCBox *>,std::allocator<AudioDSPGraph::FCBox *>>::__emplace_unique_key_args<AudioDSPGraph::FCBox *,AudioDSPGraph::FCBox * const&>(v8, v12, v12);
          *(void *)(v12 + 848) = a3;
        }
        uint64_t result = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v10 + 416))(v10, a2, a3);
      }
      v3 += 32;
    }
    while (v3 != v4);
  }
  return result;
}

void sub_24892AEB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::Box::isogroupTraceInputs(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 64);
  uint64_t v4 = *(void *)(result + 72);
  if (v3 != v4)
  {
    long long v7 = (char *)result;
    long long v8 = (float *)(a3 + 96);
    uint64_t v9 = *(void *)(result + 64);
    do
    {
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9);
      if (!v10)
      {
        std::string::basic_string[abi:ne180100]<0>(v18, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
        std::string::basic_string[abi:ne180100]<0>(v17, "isogroupTraceInputs");
        uint64_t v14 = v7 + 32;
        if (v7[55] < 0) {
          uint64_t v14 = (void *)*v14;
        }
        uint64_t v15 = (*(uint64_t (**)(char *))(*(void *)v7 + 16))(v7);
        AudioDSPGraph::strprintf((AudioDSPGraph *)"box %s %s input port is not connected.", v16, v14, v15);
      }
      uint64_t v11 = *(void *)(*(void *)(v10 + 8) + 8);
      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 272))(v11);
      if (v12)
      {
        unsigned int v13 = (void *)v12;
        std::__hash_table<AudioDSPGraph::FCBox *,std::hash<AudioDSPGraph::FCBox *>,std::equal_to<AudioDSPGraph::FCBox *>,std::allocator<AudioDSPGraph::FCBox *>>::__emplace_unique_key_args<AudioDSPGraph::FCBox *,AudioDSPGraph::FCBox * const&>(v8, (unint64_t)v13, (uint64_t)v13);
        v13[107] = a3;
        uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t))(*v13 + 432))(v13, a2, a3);
      }
      else
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v11 + 416))(v11, a2, a3);
      }
      v9 += 32;
      v3 += 32;
    }
    while (v9 != v4);
  }
  return result;
}

void sub_24892B0FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::Box::isogroup(AudioDSPGraph::Box *a1, uint64_t a2, AudioDSPGraph::IsoGroup *a3)
{
  uint64_t result = std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::find<AudioDSPGraph::Box *>(*(void *)a2, *(void *)(a2 + 8), (unint64_t)a1);
  if (!result)
  {
    std::__hash_table<AudioDSPGraph::Box *,std::hash<AudioDSPGraph::Box *>,std::equal_to<AudioDSPGraph::Box *>,std::allocator<AudioDSPGraph::Box *>>::__emplace_unique_key_args<AudioDSPGraph::Box *,AudioDSPGraph::Box *>(a2, (unint64_t)a1, (uint64_t)a1);
    AudioDSPGraph::IsoGroup::add(a3, a1);
    (*(void (**)(AudioDSPGraph::Box *, uint64_t, AudioDSPGraph::IsoGroup *))(*(void *)a1 + 424))(a1, a2, a3);
    long long v7 = *(uint64_t (**)(AudioDSPGraph::Box *, uint64_t, AudioDSPGraph::IsoGroup *))(*(void *)a1 + 432);
    return (void *)v7(a1, a2, a3);
  }
  return result;
}

uint64_t AudioDSPGraph::Box::sortUpstream(uint64_t result, uint64_t a2, uint64_t a3)
{
  std::string v5 = (void *)result;
  std::string v6 = *(uint64_t **)(result + 64);
  long long v7 = *(uint64_t **)(result + 72);
  if (v6 != v7)
  {
    uint64_t result = *(void *)(result + 64);
    long long v8 = v6;
    do
    {
      uint64_t v9 = *v8;
      v8 += 4;
      uint64_t v10 = **(void **)(*(void *)((*(uint64_t (**)(uint64_t))(v9 + 40))(result) + 8) + 8);
      (*(void (**)(void))(v10 + 400))();
      v6 += 4;
      uint64_t result = (uint64_t)v8;
    }
    while (v8 != v7);
  }
  uint64_t v11 = (unsigned char *)v5[19];
  uint64_t v12 = (unsigned char *)v5[20];
  while (v11 != v12)
  {
    if (v11[36]) {
      uint64_t result = (*(uint64_t (**)(void, void, uint64_t, uint64_t))(**(void **)v11 + 400))(*(void *)v11, v5[2], a2, a3);
    }
    v11 += 40;
  }
  unsigned int v13 = (unsigned char *)v5[22];
  uint64_t v14 = (unsigned char *)v5[23];
  while (v13 != v14)
  {
    if (v13[36]) {
      uint64_t result = (*(uint64_t (**)(void, void, uint64_t, uint64_t))(**(void **)v13 + 400))(*(void *)v13, v5[2], a2, a3);
    }
    v13 += 64;
  }
  for (unint64_t i = (uint64_t **)v5[16]; i; unint64_t i = (uint64_t **)*i)
    uint64_t result = (*(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t))(*i[2] + 400))(i[2], v5[2], a2, a3);
  return result;
}

void AudioDSPGraph::Box::topologicalSort(uint64_t a1, uint64_t a2, void **a3, char **a4)
{
  if (*(unsigned char *)(a1 + 746))
  {
    std::string::basic_string[abi:ne180100]<0>(&v22, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v21, "topologicalSort");
    std::string::basic_string[abi:ne180100]<0>(&v20, "Box::topologicalSort, There is a cycle in the graph. The graph must be acyclic.");
    AudioDSPGraph::ThrowException(1953460257, &v22, 466, &v21, &v20);
  }
  if (!*(unsigned char *)(a1 + 745))
  {
    uint64_t v5 = *(void *)(a1 + 16);
    if (v5 == a2)
    {
      *(unsigned char *)(a1 + 746) = 1;
      (*(void (**)(uint64_t, void **, char **))(*(void *)a1 + 408))(a1, a3, a4);
      *(unsigned char *)(a1 + 746) = 0;
      long long v8 = a3[1];
      unint64_t v7 = (unint64_t)a3[2];
      if ((unint64_t)v8 >= v7)
      {
        uint64_t v10 = ((char *)v8 - (unsigned char *)*a3) >> 3;
        if ((unint64_t)(v10 + 1) >> 61) {
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v11 = v7 - (void)*a3;
        uint64_t v12 = v11 >> 2;
        if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
          uint64_t v12 = v10 + 1;
        }
        if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v12;
        }
        if (v13) {
          unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::Box *>>(v13);
        }
        else {
          uint64_t v14 = 0;
        }
        uint64_t v15 = (void *)(v13 + 8 * v10);
        unint64_t v16 = v13 + 8 * v14;
        *uint64_t v15 = a1;
        uint64_t v9 = v15 + 1;
        uint64_t v18 = (char *)*a3;
        unint64_t v17 = (char *)a3[1];
        if (v17 != *a3)
        {
          do
          {
            uint64_t v19 = *((void *)v17 - 1);
            v17 -= 8;
            *--uint64_t v15 = v19;
          }
          while (v17 != v18);
          unint64_t v17 = (char *)*a3;
        }
        *a3 = v15;
        a3[1] = v9;
        a3[2] = (void *)v16;
        if (v17) {
          operator delete(v17);
        }
      }
      else
      {
        *long long v8 = a1;
        uint64_t v9 = v8 + 1;
      }
      a3[1] = v9;
      *(unsigned char *)(a1 + 745) = 1;
    }
    else
    {
      AudioDSPGraph::IsoGroup::topologicalSort(v5, a4);
    }
  }
}

void sub_24892B5CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  *(unsigned char *)(v27 + 746) = 0;
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::Box::calculateLatencyDelays(AudioDSPGraph::Box *this)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFC0) != 0)
  {
    unint64_t v2 = AudioDSPGraph::Box::upstreamLatencyInTicks(this);
    uint64_t v3 = (_DWORD *)*((void *)this + 8);
    uint64_t v4 = (_DWORD *)*((void *)this + 9);
    if (v3 != v4)
    {
      unint64_t v5 = v2;
      for (unint64_t i = (_DWORD *)*((void *)this + 8); i != v4; i += 8)
      {
        i[7] = 0;
        uint64_t v7 = **(void **)(*(void *)((*(uint64_t (**)(_DWORD *))(*(void *)i + 40))(i) + 8) + 8);
        if (((*(uint64_t (**)(void))(v7 + 392))() & 1) == 0)
        {
          long long v8 = *(AudioDSPGraph::Box **)(*(void *)((*(uint64_t (**)(_DWORD *))(*(void *)i + 40))(i) + 8)
                                      + 8);
          uint64_t v9 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)v8 + 72))(v8);
          unint64_t v10 = AudioDSPGraph::Box::upstreamLatencyInTicks(v8);
          if (v5 <= v10 + v9)
          {
            if (i[7])
            {
LABEL_9:
              if (*(_DWORD *)(*(void *)((*(uint64_t (**)(_DWORD *))(*(void *)i + 40))(i) + 120) + 8) == 1718773105)
              {
                {
                  AudioDSPGraph::getLog(void)::gLog = (uint64_t)os_log_create("com.apple.coreaudio", "AudioDSPGraph");
                }
                uint64_t v12 = AudioDSPGraph::getLog(void)::gLog;
                if (os_log_type_enabled((os_log_t)AudioDSPGraph::getLog(void)::gLog, OS_LOG_TYPE_DEBUG))
                {
                  int v13 = i[7];
                  uint64_t v14 = *(void *)(*(void *)((*(uint64_t (**)(_DWORD *))(*(void *)i + 40))(i) + 8) + 8);
                  uint64_t v15 = (void *)(v14 + 32);
                  if (*(char *)(v14 + 55) < 0) {
                    uint64_t v15 = (void *)*v15;
                  }
                  unint64_t v16 = (char *)this + 32;
                  if (*((char *)this + 55) < 0) {
                    unint64_t v16 = (char *)*((void *)this + 4);
                  }
                  *(_DWORD *)buf = 67109634;
                  int v18 = v13;
                  __int16 v19 = 2080;
                  long long v20 = v15;
                  __int16 v21 = 2080;
                  long long v22 = v16;
                  _os_log_debug_impl(&dword_248903000, v12, OS_LOG_TYPE_DEBUG, "Latency compensation of %u samples required at frequency-domain wire : %s -> %s", buf, 0x1Cu);
                }
              }
            }
          }
          else
          {
            unint64_t v11 = (v5 - (v10 + v9))
                * **(double **)((*(uint64_t (**)(_DWORD *))(*(void *)i + 40))(i) + 120)
                / *(void *)(*((void *)this + 1) + 664);
            i[7] = v11;
            if (v11) {
              goto LABEL_9;
            }
          }
        }
        v3 += 8;
      }
    }
  }
}

uint64_t AudioDSPGraph::Box::insertLatencyDelayBoxes(uint64_t this)
{
  unint64_t v2 = *(char **)(this + 64);
  uint64_t v1 = *(char **)(this + 72);
  std::string v6 = v1;
  if (((v1 - v2) & 0x1FFFFFFFC0) != 0 && v2 != v1)
  {
    do
    {
      uint64_t v4 = *(void *)(*(void *)((*(uint64_t (**)(char *))(*(void *)v2 + 40))(v2) + 8) + 8);
      this = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 392))(v4);
      unsigned int v5 = *((_DWORD *)v2 + 7);
      if (this)
      {
        AudioDSPGraph::DelayBox::setDelayFrames(v4, v5);
        this = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 576))(v4);
      }
      else if (v5)
      {
        if (*(_DWORD *)(*(void *)((*(uint64_t (**)(char *))(*(void *)v2 + 40))(v2) + 120) + 8) != 1718773105) {
          operator new();
        }
        std::string::basic_string[abi:ne180100]<0>(&v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v8, "insertLatencyDelayBoxes");
        std::string::basic_string[abi:ne180100]<0>(&v7, "Latency Boxes cannot be inserted at frequency-domain wires");
        AudioDSPGraph::ThrowException(1869640255, (long long *)&v9, 752, (long long *)&v8, (long long *)&v7);
      }
      v2 += 32;
    }
    while (v2 != v6);
  }
  return this;
}

void sub_24892C6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (*(char *)(v34 - 89) < 0) {
    operator delete(*(void **)(v34 - 112));
  }
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table(v33 + 16);
  MEMORY[0x24C585790](v33, 0x10A1C40B6F5AC58);
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(a1);
}

uint64_t AudioDSPGraph::DelayBox::setDelayFrames(uint64_t this, unsigned int a2)
{
  if (*(unsigned char *)(*(void *)(this + 8) + 730))
  {
    if (*(_DWORD *)(this + 792) < a2)
    {
      std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v4, "setDelayFrames");
      std::string::basic_string[abi:ne180100]<0>(&v3, "delay value exceeds current maximum");
      AudioDSPGraph::ThrowException(1919837985, &v5, 3204, &v4, &v3);
    }
  }
  else
  {
    unsigned int v2 = *(_DWORD *)(this + 792);
    if (v2 <= a2) {
      unsigned int v2 = a2;
    }
    *(_DWORD *)(this + 792) = v2;
  }
  *(_DWORD *)(this + 796) = a2;
  return this;
}

void sub_24892C910(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::Box::Box(AudioDSPGraph::Box *this, unsigned int a2, unsigned int a3)
{
  *((_OWORD *)this + 4) = 0u;
  unsigned int v43 = (uint64_t *)((char *)this + 64);
  *((_OWORD *)this + 7) = 0u;
  *(void *)this = &unk_26FC9CCF0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((_DWORD *)this + 36) = 1065353216;
  *((void *)this + 31) = 850045863;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((_OWORD *)this + 28) = 0u;
  *((_OWORD *)this + 29) = 0u;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 32) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 34) = 0u;
  *((_OWORD *)this + 35) = 0u;
  *((_OWORD *)this + 36) = 0u;
  os_unfair_lock_lock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  if (qword_269332648)
  {
    std::string v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_269332648);
    if (v6)
    {
      std::string v7 = v6;
      uint64_t p_shared_owners = qword_269332640;
      if (qword_269332640) {
        goto LABEL_9;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  std::string v7 = (std::__shared_weak_count *)operator new(0x1A0uLL);
  v7->__shared_owners_ = 0;
  v7->__shared_weak_owners_ = 0;
  *(_OWORD *)&v7[1].__shared_owners_ = 0u;
  uint64_t p_shared_owners = (uint64_t)&v7[1].__shared_owners_;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FC9FD10;
  v7[2].std::__shared_count = 0u;
  *(_OWORD *)&v7[2].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v7[3].__shared_owners_ = 0u;
  v7[4].std::__shared_count = 0u;
  *(_OWORD *)&v7[4].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v7[5].__shared_owners_ = 0u;
  v7[6].std::__shared_count = 0u;
  *(_OWORD *)&v7[6].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v7[7].__shared_owners_ = 0u;
  v7[8].std::__shared_count = 0u;
  *(_OWORD *)&v7[8].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v7[9].__shared_owners_ = 0u;
  v7[10].std::__shared_count = 0u;
  *(_OWORD *)&v7[10].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v7[11].__shared_owners_ = 0u;
  v7[12].std::__shared_count = 0u;
  *(_OWORD *)&v7[12].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v7[13].__shared_owners_ = 0u;
  v7[14].std::__shared_count = 0u;
  *(_OWORD *)&v7[14].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v7[15].__shared_owners_ = 0u;
  v7[16].std::__shared_count = 0u;
  *(_OWORD *)&v7[16].__shared_weak_owners_ = 0u;
  uint64_t v9 = caulk::alloc::global_page_cache::instance((caulk::alloc::global_page_cache *)v7);
  v7[3].__shared_owners_ = 0;
  v7[1].__shared_weak_owners_ = v9 + 16;
  v7[2].__vftable = 0;
  v7[2].__shared_owners_ = 0;
  v7[2].__shared_weak_owners_ = 0;
  uint64_t v10 = 96;
  LODWORD(v7[3].__vftable) = 0;
  do
  {
    unint64_t v11 = (std::__shared_weak_count_vtbl **)((char *)&v7->__vftable + v10);
    *unint64_t v11 = 0;
    v11[1] = 0;
    v11[2] = 0;
    v10 += 32;
  }
  while (v10 != 416);
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  uint64_t v12 = (std::__shared_weak_count *)qword_269332648;
  qword_269332640 = (uint64_t)&v7[1].__shared_owners_;
  qword_269332648 = (uint64_t)v7;
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  *((void *)this + 72) = p_shared_owners;
  int v13 = (std::__shared_weak_count *)*((void *)this + 73);
  *((void *)this + 73) = v7;
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  *((void *)this + 74) = &caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned int,AudioDSPGraph::Analyzer *>::layout_vk const&>::empty;
  caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::random_engine();
  uint64_t v14 = 0;
  uint64_t v15 = (void *)((char *)this + 88);
  *((void *)this + 42) = 0;
  *((_DWORD *)this + 87) = 167837706;
  *((_DWORD *)this + 86) = 0;
  *((void *)this + 45) = 0;
  *((void *)this + 46) = 0;
  *((void *)this + 44) = 0;
  do
  {
    atomic_store(0, (unint64_t *)((char *)this + v14 + 360));
    atomic_store(0, (unint64_t *)((char *)this + v14 + 368));
    v14 += 16;
  }
  while (v14 != 160);
  *((void *)this + 65) = 0;
  *((_DWORD *)this + 133) = 16908289;
  *((_DWORD *)this + 132) = -1;
  *((void *)this + 67) = 0;
  *((void *)this + 69) = 0;
  *((void *)this + 68) = 0;
  atomic_store(0, (unint64_t *)this + 68);
  atomic_store(0, (unint64_t *)this + 69);
  for (uint64_t i = 360; i != 520; i += 16)
    atomic_store((unint64_t)this + 520, (unint64_t *)((char *)this + i));
  __dmb(0xBu);
  int v18 = (unint64_t *)((char *)this + 80);
  uint64_t v17 = *((void *)this + 10);
  *((void *)this + 83) = 0;
  *((void *)this + 84) = 850045863;
  *(_OWORD *)((char *)this + 680) = 0u;
  *(_OWORD *)((char *)this + 696) = 0u;
  *(_OWORD *)((char *)this + 712) = 0u;
  *(_OWORD *)((char *)this + 728) = 0u;
  *((_WORD *)this + 372) = 1;
  *((unsigned char *)this + 746) = 0;
  *((unsigned char *)this + 752) = 0;
  *((unsigned char *)this + 760) = 0;
  *((_DWORD *)this + 192) = 0;
  uint64_t v19 = *((void *)this + 8);
  if (a2 > (unint64_t)((v17 - v19) >> 5))
  {
    uint64_t v20 = *((void *)this + 9);
    uint64_t v48 = (char *)this + 80;
    uint8x8_t v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::OutputPort>>(a2);
    OSStatus v45 = &v44[v20 - v19];
    OSStatus v46 = v45;
    UInt32 v47 = &v44[32 * v21];
    std::vector<AudioDSPGraph::InputPort>::__swap_out_circular_buffer(v43, &v44);
    std::__split_buffer<AudioDSPGraph::OutputPort>::~__split_buffer((uint64_t)&v44);
  }
  long long v22 = (unint64_t *)((char *)this + 104);
  uint64_t v23 = *((void *)this + 11);
  if (a3 > (unint64_t)((*((void *)this + 13) - v23) >> 5))
  {
    uint64_t v24 = *((void *)this + 12);
    uint64_t v48 = (char *)this + 104;
    uint8x8_t v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::OutputPort>>(a3);
    OSStatus v45 = &v44[v24 - v23];
    OSStatus v46 = v45;
    UInt32 v47 = &v44[32 * v25];
    std::vector<AudioDSPGraph::OutputPort>::__swap_out_circular_buffer((uint64_t *)this + 11, &v44);
    std::__split_buffer<AudioDSPGraph::OutputPort>::~__split_buffer((uint64_t)&v44);
  }
  if (a2)
  {
    int v26 = 0;
    unint64_t v27 = *((void *)this + 9);
    do
    {
      if (v27 >= *v18)
      {
        uint64_t v28 = (uint64_t)(v27 - *v43) >> 5;
        if ((unint64_t)(v28 + 1) >> 59) {
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v29 = *v18 - *v43;
        uint64_t v30 = v29 >> 4;
        if (v29 >> 4 <= (unint64_t)(v28 + 1)) {
          uint64_t v30 = v28 + 1;
        }
        if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v31 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v31 = v30;
        }
        uint64_t v48 = (char *)this + 80;
        uint64_t v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::OutputPort>>(v31);
        uint64_t v33 = &v32[32 * v28];
        uint8x8_t v44 = v32;
        OSStatus v45 = v33;
        UInt32 v47 = &v32[32 * v34];
        *((void *)v33 + 1) = this;
        *((void *)v33 + 2) = 0;
        *((_DWORD *)v33 + 6) = v26;
        *((_DWORD *)v33 + 7) = 0;
        *(void *)uint64_t v33 = &unk_26FC9FB58;
        OSStatus v46 = v33 + 32;
        std::vector<AudioDSPGraph::InputPort>::__swap_out_circular_buffer(v43, &v44);
        unint64_t v27 = *((void *)this + 9);
        std::__split_buffer<AudioDSPGraph::OutputPort>::~__split_buffer((uint64_t)&v44);
      }
      else
      {
        *(void *)(v27 + 8) = this;
        *(void *)(v27 + 16) = 0;
        *(_DWORD *)(v27 + 24) = v26;
        *(_DWORD *)(v27 + 28) = 0;
        *(void *)unint64_t v27 = &unk_26FC9FB58;
        v27 += 32;
        *((void *)this + 9) = v27;
      }
      *((void *)this + 9) = v27;
      ++v26;
    }
    while (a2 != v26);
  }
  if (a3)
  {
    int v35 = 0;
    unint64_t v36 = *((void *)this + 12);
    do
    {
      if (v36 >= *v22)
      {
        uint64_t v37 = (uint64_t)(v36 - *v15) >> 5;
        if ((unint64_t)(v37 + 1) >> 59) {
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v38 = *v22 - *v15;
        uint64_t v39 = v38 >> 4;
        if (v38 >> 4 <= (unint64_t)(v37 + 1)) {
          uint64_t v39 = v37 + 1;
        }
        if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v40 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v40 = v39;
        }
        uint64_t v48 = (char *)this + 104;
        if (v40) {
          unint64_t v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::OutputPort>>(v40);
        }
        else {
          uint64_t v41 = 0;
        }
        unint64_t v42 = v40 + 32 * v37;
        uint8x8_t v44 = (char *)v40;
        OSStatus v45 = (char *)v42;
        UInt32 v47 = (char *)(v40 + 32 * v41);
        *(void *)(v42 + 8) = this;
        *(void *)(v42 + 16) = 0;
        *(_DWORD *)(v42 + 24) = v35;
        *(void *)unint64_t v42 = &unk_26FC9FBF8;
        OSStatus v46 = (char *)(v42 + 32);
        std::vector<AudioDSPGraph::OutputPort>::__swap_out_circular_buffer((uint64_t *)this + 11, &v44);
        unint64_t v36 = *((void *)this + 12);
        std::__split_buffer<AudioDSPGraph::OutputPort>::~__split_buffer((uint64_t)&v44);
      }
      else
      {
        *(void *)(v36 + 8) = this;
        *(void *)(v36 + 16) = 0;
        *(_DWORD *)(v36 + 24) = v35;
        *(void *)unint64_t v36 = &unk_26FC9FBF8;
        v36 += 32;
        *((void *)this + 12) = v36;
      }
      *((void *)this + 12) = v36;
      ++v35;
    }
    while (a3 != v35);
  }
  operator new();
}

void sub_24892CF78(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::mutex *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  std::__shared_weak_count::~__shared_weak_count(v20);
  operator delete(v22);
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  uint64_t v23 = *(std::__shared_weak_count **)(v19 + 584);
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  __clang_call_terminate(a1);
}

void sub_24892CFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::mutex *a14, uint64_t a15, uint64_t a16, uint64_t *a17, uint64_t a18, uint64_t a19)
{
  std::unique_ptr<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>>::reset[abi:ne180100](a17, 0);
  std::mutex::~mutex(a9);
  std::__function::__value_func<void ()(double)>::~__value_func[abi:ne180100]((void *)(v20 + 560));
  caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::clear(a10);
  caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::~node_allocator(v19 + 560);
  a19 = a11;
  std::vector<std::unique_ptr<AudioDSPGraph::Analyzer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  std::mutex::~mutex(a14);
  a19 = a12;
  std::vector<std::unique_ptr<AudioDSPGraph::Analyzer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  a19 = a15;
  std::vector<std::unique_ptr<AudioDSPGraph::Analyzer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  a19 = a13;
  std::vector<AudioDSPGraph::PropertyTap>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  long long v22 = *(void **)(v19 + 152);
  if (v22)
  {
    *(void *)(v19 + 160) = v22;
    operator delete(v22);
  }
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table(a16);
  std::vector<AudioDSPGraph::OutputPort>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  a19 = a18;
  std::vector<AudioDSPGraph::OutputPort>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  if (*(char *)(v19 + 55) < 0) {
    operator delete(*(void **)(v19 + 32));
  }
  _Unwind_Resume(a1);
}

void AudioDSPGraph::Box::~Box(AudioDSPGraph::Box *this)
{
  *(void *)this = &unk_26FC9CCF0;
  std::unique_ptr<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>>::reset[abi:ne180100]((uint64_t *)this + 92, 0);
  std::mutex::~mutex((std::mutex *)((char *)this + 672));
  std::__function::__value_func<void ()(double)>::~__value_func[abi:ne180100]((void *)this + 80);
  caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::clear((unint64_t)this + 336);
  caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::~node_allocator((unint64_t)this + 560);
  long long v3 = (void **)((char *)this + 312);
  std::vector<std::unique_ptr<AudioDSPGraph::Analyzer>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::mutex::~mutex((std::mutex *)((char *)this + 248));
  long long v3 = (void **)((char *)this + 224);
  std::vector<std::unique_ptr<AudioDSPGraph::Analyzer>>::__destroy_vector::operator()[abi:ne180100](&v3);
  long long v3 = (void **)((char *)this + 200);
  std::vector<std::unique_ptr<AudioDSPGraph::Analyzer>>::__destroy_vector::operator()[abi:ne180100](&v3);
  long long v3 = (void **)((char *)this + 176);
  std::vector<AudioDSPGraph::PropertyTap>::__destroy_vector::operator()[abi:ne180100](&v3);
  unsigned int v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  std::__hash_table<AudioDSPGraph::InputPort *,std::hash<AudioDSPGraph::InputPort *>,std::equal_to<AudioDSPGraph::InputPort *>,std::allocator<AudioDSPGraph::InputPort *>>::~__hash_table((uint64_t)this + 112);
  long long v3 = (void **)((char *)this + 88);
  std::vector<AudioDSPGraph::OutputPort>::__destroy_vector::operator()[abi:ne180100](&v3);
  long long v3 = (void **)((char *)this + 64);
  std::vector<AudioDSPGraph::OutputPort>::__destroy_vector::operator()[abi:ne180100](&v3);
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
}

uint64_t *std::unique_ptr<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  void *result = a2;
  if (v2)
  {
    caulk::concurrent::lf_read_synchronized_write<std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver>>>::~lf_read_synchronized_write(v2 + 64);
    caulk::concurrent::lf_read_synchronized_write<std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver>>>::~lf_read_synchronized_write(v2);
    JUMPOUT(0x24C585790);
  }
  return result;
}

unint64_t caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::clear(unint64_t a1)
{
  unint64_t v2 = a1 + 224;
  caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  for (unint64_t i = atomic_load((unint64_t *)(a1 + 24)); ; unint64_t i = atomic_load((unint64_t *)(v4 + 24)))
  {
    unint64_t v4 = i & 0xFFFFFFFFFFFFFFFCLL;
    if (a1 + 184 == (i & 0xFFFFFFFFFFFFFFFCLL)) {
      break;
    }
    if (*(unsigned char *)(v4 + 14) != 2)
    {
      char v5 = atomic_load((unint64_t *)(v4 + 24));
      if ((v5 & 1) == 0) {
        caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::remove(a1, *(_DWORD *)(v4 + 8));
      }
    }
  }
  return caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v2, i);
}

unint64_t caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::~node_allocator(unint64_t a1)
{
  _X2 = 0;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X2, X3, [X0] }
  if (_X2) {
    caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::free_node_chain_now(a1, _X2);
  }
  (*(void (**)(unint64_t))(*(void *)(a1 + 32) + 24))(a1 + 40);
  uint64_t v9 = *(std::__shared_weak_count **)(a1 + 24);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return a1;
}

void std::vector<std::unique_ptr<AudioDSPGraph::Analyzer>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    unint64_t v4 = v1[1];
    char v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v7 = *--v4;
        uint64_t v6 = v7;
        *unint64_t v4 = 0;
        if (v7) {
          (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
        }
      }
      while (v4 != v2);
      char v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<AudioDSPGraph::PropertyTap>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    char v5 = **a1;
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
        v4 -= 64;
      }
      while (v4 != v2);
      char v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<AudioDSPGraph::OutputPort>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    char v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = v4 - 32;
      uint64_t v7 = v4 - 32;
      std::string v8 = v4 - 32;
      do
      {
        uint64_t v9 = *(void (***)(char *))v8;
        v8 -= 32;
        (*v9)(v7);
        v6 -= 32;
        BOOL v10 = v7 == v2;
        uint64_t v7 = v8;
      }
      while (!v10);
      char v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t caulk::concurrent::lf_read_synchronized_write<std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver>>>::~lf_read_synchronized_write(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    long long v3 = (void **)(a1 + 16);
    std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver>>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  if (*(unsigned char *)(a1 + 9))
  {
    long long v3 = (void **)(a1 + 40);
    std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver>>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  return a1;
}

void std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    char v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = v4 - 40;
      uint64_t v7 = v4 - 40;
      do
      {
        std::string v8 = (char *)*((void *)v7 + 3);
        if (v7 == v8)
        {
          (*(void (**)(char *))(*(void *)v7 + 32))(v7);
        }
        else if (v8)
        {
          (*(void (**)(char *))(*(void *)v8 + 40))(v8);
        }
        uint64_t v9 = v7 - 8;
        v7 -= 48;
        v6 -= 48;
      }
      while (v9 != v2);
      char v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void AudioDSPGraph::DelayBox::reset(AudioDSPGraph::DelayBox *this)
{
  unint64_t v2 = (_DWORD *)*((void *)this + 97);
  if (v2 && *v2)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      bzero(*(void **)&v2[v3 + 4], v2[v3 + 3]);
      ++v4;
      unint64_t v2 = (_DWORD *)*((void *)this + 97);
      v3 += 4;
    }
    while (v4 < *v2);
  }
  unsigned int v5 = *((_DWORD *)this + 199);
  *((_DWORD *)this + 200) = v5;
  *((void *)this + 101) = v5;
}

void AudioDSPGraph::DelayBox::uninitialize(AudioDSPGraph::DelayBox *this)
{
  AudioDSPGraph::Box::uninitialize(this);

  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::DelayBox *)((char *)this + 776));
}

void AudioDSPGraph::DelayBox::initialize(AudioDSPGraph::DelayBox *this)
{
  AudioDSPGraph::Box::initialize(this);
  if (*((_DWORD *)this + 198))
  {
    uint64_t v2 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v3 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
    int v4 = *((_DWORD *)this + 198) + 2 * *(_DWORD *)(*((void *)this + 2) + 272);
    *((_DWORD *)this + 201) = v4;
    BOOL v5 = (*(_DWORD *)(v3 + 12) & 0x20) == 0;
    uint64_t v8 = v3 + 24;
    int v6 = *(_DWORD *)(v3 + 24);
    unsigned int v7 = *(_DWORD *)(v8 + 4);
    if (v5) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = v7;
    }
    AudioDSPGraph::SimpleABL::alloc((AudioDSPGraph::DelayBox *)((char *)this + 776), v9, v6 * v4);
  }
  else
  {
    *((_DWORD *)this + 201) = 0;
  }
  unsigned int v10 = *((_DWORD *)this + 199);
  *((_DWORD *)this + 200) = v10;
  *((void *)this + 101) = v10;
}

void *AudioDSPGraph::DelayBox::process(AudioDSPGraph::DelayBox *this, int a2)
{
  unsigned int v4 = *((_DWORD *)this + 199);
  uint64_t v5 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5);
  if (v4)
  {
    uint64_t v7 = *(void *)(v6 + 120);
    uint64_t v8 = AudioDSPGraph::Box::in(this, 0);
    unsigned int v9 = (AudioDSPGraph::SimpleABL *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 56)
                                    + 80);
    uint64_t v10 = AudioDSPGraph::Box::out(this, 0);
    unint64_t v11 = (unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 56) + 80);
    int v13 = *(_DWORD *)(v7 + 24);
    uint64_t v12 = *(unsigned int *)(v7 + 28);
    unsigned int v14 = *((_DWORD *)this + 202);
    if (v4 != *((_DWORD *)this + 200))
    {
      if (v14 >= v4) {
        int v15 = 0;
      }
      else {
        int v15 = *((_DWORD *)this + 201);
      }
      *((_DWORD *)this + 203) = v14 - v4 + v15;
    }
    AudioDSPGraph::SimpleABL::dstWrapCopy(v9, (unsigned int **)this + 97, v14 * v13, (v13 * a2));
    AudioDSPGraph::SimpleABL::srcWrapCopy((AudioDSPGraph::DelayBox *)((char *)this + 776), v11, (*((_DWORD *)this + 203) * v13), (v13 * a2), 0);
    if (v12)
    {
      uint64_t v19 = *v11 + 3;
      do
      {
        *uint64_t v19 = v13 * a2;
        v19 += 4;
        --v12;
      }
      while (v12);
    }
    unsigned int v20 = *((_DWORD *)this + 202) + a2;
    *((_DWORD *)this + 202) = v20;
    unsigned int v21 = *((_DWORD *)this + 203) + a2;
    *((_DWORD *)this + 203) = v21;
    unsigned int v22 = *((_DWORD *)this + 201);
    BOOL v23 = v20 >= v22;
    unsigned int v24 = v20 - v22;
    if (v23) {
      *((_DWORD *)this + 202) = v24;
    }
    BOOL v23 = v21 >= v22;
    unsigned int v25 = v21 - v22;
    if (v23) {
      *((_DWORD *)this + 203) = v25;
    }
  }
  else
  {
    unint64_t v16 = *(void **)(v6 + 56);
    uint64_t v17 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 40))(v17);
    AudioDSPGraph::Buffer::copyFrom(v16, *(void **)(v18 + 56));
  }
  uint64_t v26 = AudioDSPGraph::Box::in(this, 0);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v26 + 40))(v26);
  uint64_t v28 = (void *)*((void *)this + 11);
  uint64_t v29 = (void *)*((void *)this + 12);
  if (v28 != v29)
  {
    uint64_t v30 = (_OWORD *)(result[7] + 8);
    uint64_t result = (void *)*((void *)this + 11);
    unint64_t v31 = result;
    do
    {
      uint64_t v32 = *v31;
      v31 += 4;
      uint64_t v33 = *(void *)((*(uint64_t (**)(void *))(v32 + 40))(result) + 56);
      long long v35 = v30[2];
      long long v34 = v30[3];
      long long v36 = v30[1];
      *(_OWORD *)(v33 + 8) = *v30;
      *(_OWORD *)(v33 + 24) = v36;
      *(_OWORD *)(v33 + 40) = v35;
      *(_OWORD *)(v33 + 56) = v34;
      *(_DWORD *)(v33 + 72) = 0;
      v28 += 4;
      uint64_t result = v31;
    }
    while (v31 != v29);
  }
  *((_DWORD *)this + 200) = v4;
  return result;
}

uint64_t AudioDSPGraph::DelayBox::isFrequencySafe(AudioDSPGraph::DelayBox *this)
{
  return 0;
}

uint64_t AudioDSPGraph::DelayBox::isLatencyDelay(AudioDSPGraph::DelayBox *this)
{
  return 1;
}

void AudioDSPGraph::Box::getPreset(AudioDSPGraph::Box *this@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  v74[1] = *MEMORY[0x263EF8340];
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  uint64_t v61 = Mutable;
  unsigned int v4 = (char *)&_ZGRN13AudioDSPGraphL22kPresetParameterScopesE_;
  do
  {
    uint64_t v5 = *(unsigned int *)v4;
    int v6 = (*(uint64_t (**)(AudioDSPGraph::Box *, uint64_t))(*(void *)this + 320))(this, v5);
    if (v6)
    {
      (*(void (**)(const __CFNumber **__return_ptr, AudioDSPGraph::Box *, uint64_t))(*(void *)this + 96))(&v68, this, v5);
      CFNumberRef v7 = v68;
      CFNumberRef v8 = v69;
      if (v68 != v69)
      {
        uint64_t v9 = 0;
        unsigned int v10 = bswap32(v5);
        do
        {
          *(_DWORD *)bytes = v10;
          *(_DWORD *)&bytes[4] = bswap32(v9);
          LODWORD(v66) = bswap32((unint64_t)(v8 - v7) >> 2);
          CFDataAppendBytes(Mutable, bytes, 12);
          CFNumberRef v7 = v69;
          if (v69 == v68)
          {
            CFNumberRef v8 = v69;
          }
          else
          {
            unint64_t v11 = 0;
            CFNumberRef v7 = v68;
            do
            {
              *(float *)&unsigned int v12 = (*(float (**)(AudioDSPGraph::Box *, void, uint64_t, uint64_t))(*(void *)this + 88))(this, *((unsigned int *)v7 + v11), v5, v9);
              *(void *)uint64_t v62 = 0;
              *(_DWORD *)uint64_t v62 = bswap32(*((_DWORD *)v68 + v11));
              *(_DWORD *)&v62[4] = bswap32(v12);
              CFDataAppendBytes(Mutable, v62, 8);
              ++v11;
              CFNumberRef v7 = v68;
              CFNumberRef v8 = v69;
            }
            while (v11 < (v69 - v68) >> 2);
          }
          uint64_t v9 = (v9 + 1);
        }
        while (v9 != v6);
      }
      if (v7)
      {
        CFNumberRef v69 = v7;
        operator delete(v7);
      }
    }
    v4 += 4;
  }
  while (v4 != "St14overflow_error");
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  int v60 = 0;
  (*(void (**)(uint64_t *__return_ptr, AudioDSPGraph::Box *))(*(void *)this + 208))(&v58, this);
  CFRetain(@"version");
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)cf, @"version");
  CFNumberRef v13 = (const __CFNumber *)cf[0];
  if (cf[0]) {
    CFRetain(cf[0]);
  }
  CFNumberRef v68 = v13;
  *(_DWORD *)bytes = 0;
  CFNumberRef v69 = CFNumberCreate(0, kCFNumberIntType, bytes);
  if (!v69)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  CFRetain(@"type");
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v56, @"type");
  applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef,unsigned int const&>(&v70, v56, (int *)&v58);
  CFRetain(@"subtype");
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v55, @"subtype");
  applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef,unsigned int const&>(&v71, v55, (int *)&v58 + 1);
  CFRetain(@"manufacturer");
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v54, @"manufacturer");
  applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef,unsigned int const&>(&v72, v54, (int *)&v59);
  CFRetain(@"classname");
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v53, @"classname");
  unsigned int v14 = (char *)(*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 16))(this);
  CFTypeRef v15 = v53;
  if (v53) {
    CFRetain(v53);
  }
  CFTypeRef v73 = v15;
  std::string::basic_string[abi:ne180100]<0>(bytes, v14);
  if (v67 >= 0) {
    unint64_t v16 = bytes;
  }
  else {
    unint64_t v16 = *(UInt8 **)bytes;
  }
  if (v67 >= 0) {
    CFIndex v17 = HIBYTE(v67);
  }
  else {
    CFIndex v17 = (CFIndex)v66;
  }
  v74[0] = CFStringCreateWithBytes(0, v16, v17, 0x8000100u, 0);
  if (!v74[0])
  {
    int v49 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v49, "Could not construct");
  }
  if (SHIBYTE(v67) < 0) {
    operator delete(*(void **)bytes);
  }
  *(void *)bytes = 0;
  uint64_t v66 = 0;
  int64_t v67 = 0;
  std::vector<void const*>::reserve((void **)bytes, 5uLL);
  *(void *)uint64_t v62 = 0;
  uint64_t v63 = 0;
  unint64_t v64 = 0;
  std::vector<void const*>::reserve((void **)v62, 5uLL);
  for (uint64_t i = 0; i != 5; ++i)
  {
    uint64_t v19 = (uint64_t)*(&v68 + 2 * i);
    unsigned int v20 = v66;
    if ((unint64_t)v66 >= v67)
    {
      unsigned int v22 = *(UInt8 **)bytes;
      uint64_t v23 = (uint64_t)&v66[-*(void *)bytes] >> 3;
      unint64_t v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) >> 61) {
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v25 = v67 - *(void *)bytes;
      if ((v67 - *(void *)bytes) >> 2 > v24) {
        unint64_t v24 = v25 >> 2;
      }
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v26 = v24;
      }
      if (v26) {
        unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::Box *>>(v26);
      }
      else {
        uint64_t v27 = 0;
      }
      uint64_t v28 = (void *)(v26 + 8 * v23);
      *uint64_t v28 = v19;
      unsigned int v21 = (UInt8 *)(v28 + 1);
      if (v20 != v22)
      {
        do
        {
          uint64_t v29 = *((void *)v20 - 1);
          v20 -= 8;
          *--uint64_t v28 = v29;
        }
        while (v20 != v22);
        unsigned int v20 = *(UInt8 **)bytes;
      }
      *(void *)bytes = v28;
      int64_t v67 = v26 + 8 * v27;
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      *(void *)uint64_t v66 = v19;
      unsigned int v21 = v20 + 8;
    }
    uint64_t v66 = v21;
    uint64_t v30 = *(&v68 + 2 * i + 1);
    unint64_t v31 = v63;
    if ((unint64_t)v63 >= v64)
    {
      uint64_t v33 = *(const void ***)v62;
      uint64_t v34 = ((uint64_t)v63 - *(void *)v62) >> 3;
      unint64_t v35 = v34 + 1;
      if ((unint64_t)(v34 + 1) >> 61) {
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v36 = v64 - *(void *)v62;
      if ((uint64_t)(v64 - *(void *)v62) >> 2 > v35) {
        unint64_t v35 = v36 >> 2;
      }
      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v37 = v35;
      }
      if (v37) {
        unint64_t v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::Box *>>(v37);
      }
      else {
        uint64_t v38 = 0;
      }
      uint64_t v39 = (void *)(v37 + 8 * v34);
      *uint64_t v39 = v30;
      uint64_t v32 = (const void **)(v39 + 1);
      if (v31 != v33)
      {
        do
        {
          uint64_t v40 = (uint64_t)*--v31;
          *--uint64_t v39 = v40;
        }
        while (v31 != v33);
        unint64_t v31 = *(const void ***)v62;
      }
      *(void *)uint64_t v62 = v39;
      unint64_t v64 = v37 + 8 * v38;
      if (v31) {
        operator delete(v31);
      }
    }
    else
    {
      *uint64_t v63 = v30;
      uint64_t v32 = v31 + 1;
    }
    uint64_t v63 = v32;
  }
  uint64_t v41 = *(UInt8 **)bytes;
  unint64_t v42 = *(const void ***)v62;
  CFDictionaryRef v43 = CFDictionaryCreate(0, *(const void ***)bytes, *(const void ***)v62, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v43)
  {
    BOOL v50 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v50, "Could not construct");
  }
  if (v42) {
    operator delete(v42);
  }
  if (v41) {
    operator delete(v41);
  }
  uint64_t v44 = 0;
  cf[1] = v43;
  do
  {
    OSStatus v45 = (const void *)v74[v44];
    if (v45) {
      CFRelease(v45);
    }
    OSStatus v46 = (const void *)v74[v44 - 1];
    if (v46) {
      CFRelease(v46);
    }
    v44 -= 2;
  }
  while (v44 != -10);
  if (v53) {
    CFRelease(v53);
  }
  if (v54) {
    CFRelease(v54);
  }
  if (v55) {
    CFRelease(v55);
  }
  if (v56) {
    CFRelease(v56);
  }
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (CFDataGetLength(Mutable) < 1)
  {
    CFRetain(v43);
    *(void *)a2 = v43;
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutableCopy(allocator, 0, v43);
    CFDictionaryAddValue(MutableCopy, @"data", Mutable);
    applesauce::CF::DictionaryRef::DictionaryRef(a2, MutableCopy);
  }
  CFRelease(v43);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_24892E180(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, int a20,__int16 a21,char a22,char a23,int a24,__int16 a25,char a26,char a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,void *__p,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,void *a45,CFTypeRef a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,CFTypeRef cf)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef,unsigned int const&>(void *a1, CFTypeRef cf, int *a3)
{
  if (cf) {
    CFRetain(cf);
  }
  *a1 = cf;
  int valuePtr = *a3;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = v6;
  if (!v6)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  return a1;
}

void sub_24892E45C(_Unwind_Exception *a1)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

const void **applesauce::CF::ObjectRef<__CFData *>::~ObjectRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t AudioDSPGraph::Box::setPreset(AudioDSPGraph::Box *this, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cfa, cf);
  if (!cfa)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    goto LABEL_86;
  }
  CFNumberRef v4 = (const __CFNumber *)applesauce::CF::details::at_key<__CFString const* const&>((const __CFDictionary *)cfa, @"version");
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not find item");
    goto LABEL_86;
  }
  CFNumberRef v5 = v4;
  CFTypeID TypeID = CFNumberGetTypeID();
  if (TypeID == CFGetTypeID(v5))
  {
    switch(CFNumberGetType(v5))
    {
      case kCFNumberSInt8Type:
        LOBYTE(valuePtr[0]) = 0;
        int Value = CFNumberGetValue(v5, kCFNumberSInt8Type, valuePtr);
        goto LABEL_29;
      case kCFNumberSInt16Type:
        LOWORD(valuePtr[0]) = 0;
        int v13 = CFNumberGetValue(v5, kCFNumberSInt16Type, valuePtr);
        goto LABEL_22;
      case kCFNumberSInt32Type:
        LODWORD(valuePtr[0]) = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberSInt32Type, valuePtr);
        goto LABEL_37;
      case kCFNumberSInt64Type:
        valuePtr[0] = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberSInt64Type, valuePtr);
        goto LABEL_37;
      case kCFNumberFloat32Type:
        LODWORD(valuePtr[0]) = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberFloat32Type, valuePtr);
        goto LABEL_14;
      case kCFNumberFloat64Type:
        valuePtr[0] = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberFloat64Type, valuePtr);
        goto LABEL_26;
      case kCFNumberCharType:
        LOBYTE(valuePtr[0]) = 0;
        int Value = CFNumberGetValue(v5, kCFNumberCharType, valuePtr);
LABEL_29:
        uint64_t v14 = Value != 0;
        if (Value) {
          unsigned __int8 v15 = valuePtr[0];
        }
        else {
          unsigned __int8 v15 = 0;
        }
        int v16 = -256;
        if ((v14 & (SLOBYTE(valuePtr[0]) < 0)) == 0) {
          int v16 = 0;
        }
        uint64_t v17 = v14 << 32;
        LODWORD(v9) = v16 & 0xFFFFFF00 | v15;
        int v18 = v9 & 0xFFFFFF00;
        break;
      case kCFNumberShortType:
        LOWORD(valuePtr[0]) = 0;
        int v13 = CFNumberGetValue(v5, kCFNumberShortType, valuePtr);
LABEL_22:
        if (v13) {
          uint64_t v9 = SLOWORD(valuePtr[0]) & 0xFFFFFFFFLL | 0x100000000;
        }
        else {
          uint64_t v9 = 0;
        }
        goto LABEL_40;
      case kCFNumberIntType:
        LODWORD(valuePtr[0]) = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberIntType, valuePtr);
        goto LABEL_37;
      case kCFNumberLongType:
        valuePtr[0] = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberLongType, valuePtr);
        goto LABEL_37;
      case kCFNumberLongLongType:
        valuePtr[0] = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberLongLongType, valuePtr);
        goto LABEL_37;
      case kCFNumberFloatType:
        LODWORD(valuePtr[0]) = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberFloatType, valuePtr);
LABEL_14:
        uint64_t v12 = (int)*(float *)valuePtr;
        goto LABEL_38;
      case kCFNumberDoubleType:
        valuePtr[0] = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberDoubleType, valuePtr);
        goto LABEL_26;
      case kCFNumberCFIndexType:
        valuePtr[0] = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberCFIndexType, valuePtr);
        goto LABEL_37;
      case kCFNumberNSIntegerType:
        valuePtr[0] = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberNSIntegerType, valuePtr);
LABEL_37:
        uint64_t v12 = LODWORD(valuePtr[0]);
        goto LABEL_38;
      case kCFNumberCGFloatType:
        valuePtr[0] = 0;
        int v11 = CFNumberGetValue(v5, kCFNumberCGFloatType, valuePtr);
LABEL_26:
        uint64_t v12 = (int)*(double *)valuePtr;
LABEL_38:
        uint64_t v9 = v12 | 0x100000000;
        if (!v11) {
          uint64_t v9 = 0;
        }
LABEL_40:
        int v18 = v9 & 0xFFFFFF00;
        uint64_t v17 = v9 & 0x100000000;
        break;
      default:
        int v18 = 0;
        uint64_t v17 = 0;
        LOBYTE(v9) = 0;
        break;
    }
    uint64_t v10 = v17 | v18 & 0xFFFFFF00;
    uint64_t v9 = v9;
  }
  else
  {
    CFTypeID v8 = CFBooleanGetTypeID();
    if (v8 == CFGetTypeID(v5))
    {
      uint64_t v9 = CFBooleanGetValue(v5);
      uint64_t v10 = 0x100000000;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  unint64_t v19 = v10 | v9;
  if (!HIDWORD(v19))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not convert");
LABEL_86:
  }
  if (v19)
  {
    uint64_t v20 = 4294956445;
    goto LABEL_57;
  }
  if (!cfa)
  {
    uint64_t v40 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    uint64_t v41 = (void (*)(void *))MEMORY[0x263F8C070];
    std::runtime_error::runtime_error(v40, "Could not construct");
    goto LABEL_89;
  }
  CFStringRef v21 = (const __CFString *)applesauce::CF::details::at_key<__CFString const* const&>((const __CFDictionary *)cfa, @"classname");
  if (!v21)
  {
    uint64_t v40 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    uint64_t v41 = (void (*)(void *))MEMORY[0x263F8C070];
    std::runtime_error::runtime_error(v40, "Could not find item");
LABEL_89:
  }
  applesauce::CF::convert_to<std::string,0>((uint64_t)valuePtr, v21);
  unsigned int v22 = (const char *)(*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 16))(this);
  uint64_t v23 = v22;
  unsigned __int8 v24 = v46;
  if ((v46 & 0x80u) == 0) {
    size_t v25 = v46;
  }
  else {
    size_t v25 = (size_t)valuePtr[1];
  }
  if (v25 != strlen(v22)
    || ((v46 & 0x80u) == 0 ? (unint64_t v26 = valuePtr) : (unint64_t v26 = (void **)valuePtr[0]), memcmp(v26, v23, v25)))
  {
    uint64_t v20 = 4294956445;
    if ((v24 & 0x80) == 0) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
  if (!cfa)
  {
    unint64_t v42 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v42, "Could not construct");
  }
  uint64_t v28 = applesauce::CF::details::at_key<__CFString const* const&>((const __CFDictionary *)cfa, @"data");
  if (!v28) {
    goto LABEL_80;
  }
  uint64_t v29 = v28;
  CFRetain(v28);
  CFTypeID v30 = CFGetTypeID(v29);
  if (v30 != CFDataGetTypeID())
  {
    CFRelease(v29);
LABEL_80:
    LOBYTE(theData) = 0;
    char v44 = 0;
    goto LABEL_81;
  }
  CFDataRef theData = (CFDataRef)v29;
  char v44 = 1;
  BytePtr = (unsigned int *)CFDataGetBytePtr((CFDataRef)v29);
  CFIndex Length = CFDataGetLength(theData);
  if (Length >= 1)
  {
    unint64_t v33 = (unint64_t)BytePtr + Length;
    do
    {
      if ((unint64_t)(BytePtr + 1) > v33) {
        break;
      }
      if ((unint64_t)(BytePtr + 2) > v33) {
        break;
      }
      uint64_t v34 = BytePtr + 3;
      if ((unint64_t)(BytePtr + 3) > v33) {
        break;
      }
      unsigned int v35 = BytePtr[2];
      if (v35)
      {
        uint64_t v36 = bswap32(*BytePtr);
        uint64_t v37 = bswap32(BytePtr[1]);
        unsigned int v38 = bswap32(v35);
        while ((unint64_t)(v34 + 1) <= v33)
        {
          BytePtr = v34 + 2;
          if ((unint64_t)(v34 + 2) > v33)
          {
            BytePtr = v34 + 1;
            goto LABEL_76;
          }
          (*(void (**)(AudioDSPGraph::Box *, void, uint64_t, uint64_t, void, float))(*(void *)this + 80))(this, bswap32(*v34), v36, v37, 0, COERCE_FLOAT(bswap32(v34[1])));
          uint64_t v34 = BytePtr;
          if (!--v38) {
            goto LABEL_76;
          }
        }
      }
      BytePtr = v34;
LABEL_76:
      ;
    }
    while ((unint64_t)BytePtr < v33);
  }
LABEL_81:
  std::__optional_destruct_base<applesauce::CF::DataRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&theData);
  uint64_t v20 = 0;
  if ((v46 & 0x80) != 0) {
LABEL_56:
  }
    operator delete(valuePtr[0]);
LABEL_57:
  if (cfa) {
    CFRelease(cfa);
  }
  return v20;
}

void sub_24892EB50(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, const void *a17)
{
  __cxa_free_exception(v17);
  std::__optional_destruct_base<applesauce::CF::DataRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&a9);
  if (a16 < 0) {
    operator delete(__p);
  }
  applesauce::CF::DictionaryRef::~DictionaryRef(&a17);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x24892E868);
}

uint64_t AudioDSPGraph::Box::getElementCount(AudioDSPGraph::Box *this, int a2)
{
  switch(a2)
  {
    case 0:
      return 1;
    case 2:
      return (*((void *)this + 12) - *((void *)this + 11)) >> 5;
    case 1:
      return (*((void *)this + 9) - *((void *)this + 8)) >> 5;
  }
  return 0;
}

uint64_t AudioDSPGraph::DelayBox::setProperty(AudioDSPGraph::DelayBox *this, int a2, int a3, unsigned int a4, int a5, unsigned int *a6)
{
  if (a2 != 64000 || (a4 | a3) != 0) {
    return AudioDSPGraph::Box::setProperty(this, a2, a3, a4, a5, a6);
  }
  if (*(unsigned char *)(*((void *)this + 1) + 730)) {
    return 4294956447;
  }
  if (a5 != 4) {
    return 4294956445;
  }
  if (!a6) {
    return 4294967246;
  }
  uint64_t result = 0;
  unsigned int v9 = *a6;
  *((_DWORD *)this + 198) = *a6;
  if (v9 >= *((_DWORD *)this + 199)) {
    unsigned int v9 = *((_DWORD *)this + 199);
  }
  *((_DWORD *)this + 199) = v9;
  return result;
}

uint64_t AudioDSPGraph::Box::setProperty(AudioDSPGraph::Box *this, int a2, int a3, unsigned int a4, int a5, _DWORD *a6)
{
  if (a2)
  {
    if (a2 != 21) {
      return 4294956417;
    }
    if (a5 == 4)
    {
      if (!a3)
      {
        (*(void (**)(AudioDSPGraph::Box *, BOOL))(*(void *)this + 56))(this, *a6 != 0);
        return 0;
      }
      return 4294956430;
    }
    return 561211770;
  }
  if (a5 != 8) {
    return 561211770;
  }
  if (a3) {
    return 4294956430;
  }
  CFNumberRef v7 = *(uint64_t (**)(void))(*(void *)this + 352);

  return v7();
}

uint64_t AudioDSPGraph::DelayBox::getProperty(AudioDSPGraph::DelayBox *this, int a2, uint64_t a3, uint64_t a4, unsigned int *a5, CFStringRef *a6)
{
  if (a2 != 64000 || (a4 | a3) != 0) {
    return AudioDSPGraph::Box::getProperty(this, a2, a3, a4, a5, a6);
  }
  if (*a5 != 4) {
    return 561211770;
  }
  if (!a6) {
    return 4294967246;
  }
  uint64_t result = 0;
  *(_DWORD *)a6 = *((_DWORD *)this + 198);
  return result;
}

uint64_t AudioDSPGraph::Box::getProperty(AudioDSPGraph::Box *this, int a2, uint64_t a3, uint64_t a4, unsigned int *a5, CFStringRef *a6)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t result = 4294956417;
  switch(a2)
  {
    case 0:
      if (*a5 != 8) {
        return 561211770;
      }
      if (a3) {
        return 4294956430;
      }
      (*(void (**)(_OWORD *__return_ptr, AudioDSPGraph::Box *))(*(void *)this + 360))(v32, this);
      CFStringRef v10 = *(const __CFString **)&v32[0];
      *(void *)&v32[0] = 0;
      *a6 = v10;
      applesauce::CF::DictionaryRef::~DictionaryRef((const void **)v32);
      return 0;
    case 1:
    case 5:
    case 6:
    case 7:
    case 9:
    case 10:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      return result;
    case 2:
      if (*a5 != 8) {
        return 561211770;
      }
      if (!a6) {
        return 4294967246;
      }
      if (a3 == 2)
      {
        uint64_t v21 = AudioDSPGraph::Box::out(this, a4);
      }
      else
      {
        if (a3 != 1) {
          return 4294956430;
        }
        uint64_t v21 = AudioDSPGraph::Box::in(this, a4);
      }
      uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)v21 + 40))(v21);
      uint64_t result = 0;
      double v23 = (double)**(double **)(v31 + 120);
LABEL_63:
      *(double *)a6 = v23;
      return result;
    case 3:
      (*(void (**)(_OWORD *__return_ptr, AudioDSPGraph::Box *, uint64_t))(*(void *)this + 96))(v32, this, a3);
      uint64_t v14 = *(void **)&v32[0];
      int v15 = DWORD2(v32[0]) - LODWORD(v32[0]);
      unsigned int v16 = (DWORD2(v32[0]) - LODWORD(v32[0])) & 0xFFFFFFFC;
      if (*a5 < v16)
      {
        if (*(void *)&v32[0])
        {
          *((void *)&v32[0] + 1) = *(void *)&v32[0];
          operator delete(*(void **)&v32[0]);
        }
        return 561211770;
      }
      *a5 = v16;
      memcpy(a6, v14, v15 & 0xFFFFFFFC);
      if (v14)
      {
        *((void *)&v32[0] + 1) = v14;
        operator delete(v14);
      }
      return 0;
    case 4:
      if (*a5 != 104) {
        return 561211770;
      }
      if (!a6) {
        return 4294967246;
      }
      (*(void (**)(_OWORD *__return_ptr, AudioDSPGraph::Box *, uint64_t, uint64_t))(*(void *)this + 104))(v32, this, a3, a4);
      if (!v34) {
        return LODWORD(v32[0]);
      }
      uint64_t result = 0;
      a6[12] = v33;
      long long v18 = v32[5];
      *((_OWORD *)a6 + 4) = v32[4];
      *((_OWORD *)a6 + 5) = v18;
      long long v19 = v32[1];
      *(_OWORD *)a6 = v32[0];
      *((_OWORD *)a6 + 1) = v19;
      long long v20 = v32[3];
      *((_OWORD *)a6 + 2) = v32[2];
      *((_OWORD *)a6 + 3) = v20;
      return result;
    case 8:
      if (*a5 != 40) {
        return 561211770;
      }
      if (!a6) {
        return 4294967246;
      }
      if (a3 == 2)
      {
        uint64_t v13 = AudioDSPGraph::Box::out(this, a4);
      }
      else
      {
        if (a3 != 1) {
          return 4294956430;
        }
        uint64_t v13 = AudioDSPGraph::Box::in(this, a4);
      }
      uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 40))(v13);
      uint64_t result = 0;
      uint64_t v28 = *(long long **)(v27 + 120);
      long long v29 = *v28;
      long long v30 = v28[1];
      a6[4] = (CFStringRef)*((void *)v28 + 4);
      *(_OWORD *)a6 = v29;
      *((_OWORD *)a6 + 1) = v30;
      return result;
    case 11:
      if (*a5 != 4) {
        return 561211770;
      }
      switch(a3)
      {
        case 0:
          uint64_t result = 0;
          int v26 = 1;
          goto LABEL_57;
        case 2:
          uint64_t result = 0;
          uint64_t v25 = *((void *)this + 11);
          uint64_t v24 = *((void *)this + 12);
          break;
        case 1:
          uint64_t result = 0;
          uint64_t v25 = *((void *)this + 8);
          uint64_t v24 = *((void *)this + 9);
          break;
        default:
          return 4294956430;
      }
      *(_DWORD *)a6 = (unint64_t)(v24 - v25) >> 5;
      return result;
    case 12:
      if (*a5 != 8) {
        return 561211770;
      }
      if (a3) {
        return 4294956430;
      }
      unint64_t v22 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 72))(this);
      uint64_t result = 0;
      double v23 = (double)v22 / (double)*(unint64_t *)(*((void *)this + 1) + 664);
      goto LABEL_63;
    case 20:
      if (*a5 != 8) {
        return 561211770;
      }
      if (a3) {
        return 4294956430;
      }
      uint64_t result = 0;
      *a6 = 0;
      return result;
    case 21:
      if (*a5 != 4) {
        return 561211770;
      }
      if (a3) {
        return 4294956430;
      }
      int v17 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 48))(this);
      goto LABEL_53;
    default:
      if (a2 != 29)
      {
        if (a2 != 54) {
          return result;
        }
        if (*a5 == 8)
        {
          if (!a3)
          {
            int v11 = (char *)this + 32;
            if (*((char *)this + 55) < 0) {
              int v11 = *(const char **)v11;
            }
            CFStringRef v12 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v11, 0x8000100u);
            uint64_t result = 0;
            *a6 = v12;
            return result;
          }
          return 4294956430;
        }
        return 561211770;
      }
      if (*a5 != 4) {
        return 561211770;
      }
      if (a3) {
        return 4294956430;
      }
      int v17 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 64))(this);
LABEL_53:
      int v26 = v17;
      uint64_t result = 0;
LABEL_57:
      *(_DWORD *)a6 = v26;
      return result;
  }
}

uint64_t AudioDSPGraph::DelayBox::getPropertyInfo(AudioDSPGraph::DelayBox *this, int a2, int a3, int a4)
{
  if (a2 != 64000 || (a4 | a3) != 0) {
    return AudioDSPGraph::Box::getPropertyInfo(this, a2, a3);
  }
  if (*(unsigned char *)(*((void *)this + 1) + 730)) {
    return 4;
  }
  return 0x100000004;
}

uint64_t AudioDSPGraph::Box::getPropertyInfo(AudioDSPGraph::Box *this, int a2, int a3)
{
  uint64_t v3 = 0;
  unsigned int v4 = 8;
  switch(a2)
  {
    case 0:
    case 2:
      return v3 | v4;
    case 1:
    case 5:
    case 6:
    case 7:
    case 9:
    case 10:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      goto LABEL_8;
    case 3:
      (*(void (**)(void **__return_ptr))(*(void *)this + 96))(&v10);
      int v5 = v11 - v10;
      if (v10)
      {
        int v11 = v10;
        operator delete(v10);
      }
      uint64_t v3 = 0;
      unsigned int v4 = v5 & 0xFFFFFFFC;
      return v3 | v4;
    case 4:
      uint64_t v3 = 0;
      unsigned int v4 = 104;
      return v3 | v4;
    case 8:
      uint64_t v3 = 0;
      unsigned int v4 = 40;
      return v3 | v4;
    case 11:
      uint64_t v3 = 0;
      goto LABEL_20;
    case 12:
    case 20:
      goto LABEL_7;
    case 21:
      if (a3)
      {
        uint64_t v3 = 0;
        unsigned int v4 = -10866;
      }
      else
      {
        int v8 = (*(uint64_t (**)(AudioDSPGraph::Box *))(*(void *)this + 40))(this);
        uint64_t v3 = 0x100000000;
        if (!v8) {
          uint64_t v3 = 0;
        }
LABEL_20:
        unsigned int v4 = 4;
      }
      return v3 | v4;
    default:
      if (a2 == 29)
      {
        uint64_t v3 = 0;
        BOOL v6 = a3 == 0;
        int v7 = 4;
      }
      else
      {
        if (a2 != 54)
        {
LABEL_8:
          uint64_t v3 = 0;
          unsigned int v4 = -10879;
          return v3 | v4;
        }
LABEL_7:
        uint64_t v3 = 0;
        BOOL v6 = a3 == 0;
        int v7 = 8;
      }
      if (v6) {
        unsigned int v4 = v7;
      }
      else {
        unsigned int v4 = -10866;
      }
      return v3 | v4;
  }
}

double AudioDSPGraph::DelayBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 4.23899122e175;
  *(_OWORD *)a1 = xmmword_24893BE80;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t AudioDSPGraph::Box::getAnalyzer(AudioDSPGraph::Box *this, uint64_t a2, int a3)
{
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) == 0) {
    return 0;
  }
  uint64_t v5 = AudioDSPGraph::Box::out(this, a2);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5);
  if (!result) {
    return result;
  }
  uint64_t v7 = *((void *)this + 39);
  uint64_t v8 = *((void *)this + 40);
  if (v7 != v8)
  {
    while (*(void *)(*(void *)v7 + 8) != result || *(_DWORD *)(*(void *)v7 + 24) != a3)
    {
      v7 += 8;
      if (v7 == v8) {
        return 0;
      }
    }
  }
  if (v7 == v8) {
    return 0;
  }
  else {
    return *(void *)v7;
  }
}

void AudioDSPGraph::Box::getAnalysisList(AudioDSPGraph::Box *this@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0
    && (uint64_t v5 = AudioDSPGraph::Box::out(this, a2),
        (uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5)) != 0))
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    uint64_t v7 = *((void *)this + 39);
    uint64_t v8 = *((void *)this + 40);
    if (v7 != v8)
    {
      uint64_t v9 = v6;
      CFStringRef v10 = 0;
      unint64_t v11 = 0;
      CFStringRef v12 = 0;
      do
      {
        if (*(void *)(*(void *)v7 + 8) == v9)
        {
          int v13 = *(_DWORD *)(*(void *)v7 + 24);
          if ((unint64_t)v12 >= v11)
          {
            uint64_t v15 = (v12 - v10) >> 2;
            unint64_t v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 62) {
              std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v11 - (void)v10) >> 1 > v16) {
              unint64_t v16 = (uint64_t)(v11 - (void)v10) >> 1;
            }
            if (v11 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v17 = v16;
            }
            if (v17) {
              unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v17);
            }
            else {
              uint64_t v18 = 0;
            }
            long long v19 = (char *)(v17 + 4 * v15);
            *(_DWORD *)long long v19 = v13;
            uint64_t v14 = v19 + 4;
            while (v12 != v10)
            {
              int v20 = *((_DWORD *)v12 - 1);
              v12 -= 4;
              *((_DWORD *)v19 - 1) = v20;
              v19 -= 4;
            }
            unint64_t v11 = v17 + 4 * v18;
            *a3 = v19;
            a3[1] = v14;
            a3[2] = (char *)v11;
            if (v10) {
              operator delete(v10);
            }
            CFStringRef v10 = v19;
          }
          else
          {
            *(_DWORD *)CFStringRef v12 = v13;
            uint64_t v14 = v12 + 4;
          }
          a3[1] = v14;
          CFStringRef v12 = v14;
        }
        v7 += 8;
      }
      while (v7 != v8);
    }
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
}

void sub_24892F7F8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::Box::analyzeEnable(void *this, uint64_t a2, char a3)
{
  if (((this[12] - this[11]) & 0x1FFFFFFFE0) != 0)
  {
    unsigned int v4 = this;
    uint64_t v5 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, a2);
    this = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5);
    if (this)
    {
      uint64_t v6 = v4[39];
      uint64_t v7 = v4[40];
      if (v6 != v7)
      {
        while (*(void **)(*(void *)v6 + 8) != this)
        {
          v6 += 8;
          if (v6 == v7) {
            return this;
          }
        }
      }
      if (v6 != v7) {
        *(unsigned char *)(*(void *)v6 + 28) = a3;
      }
    }
  }
  return this;
}

void AudioDSPGraph::Box::stopAnalyzing(atomic_uint *this, uint64_t a2)
{
  unsigned int v4 = (std::mutex *)(this + 62);
  std::mutex::lock((std::mutex *)(this + 62));
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v5 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, a2);
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5);
    if (v6)
    {
      uint64_t v8 = (uint64_t *)*((void *)this + 39);
      uint64_t v7 = (uint64_t *)*((void *)this + 40);
      if (v8 == v7)
      {
LABEL_7:
        CFStringRef v10 = (uint64_t *)*((void *)this + 40);
      }
      else
      {
        uint64_t v9 = v6;
        while (*(void *)(*v8 + 8) != v6)
        {
          if (++v8 == v7) {
            goto LABEL_7;
          }
        }
        caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::remove((unint64_t)(this + 84), *(_DWORD *)(*v8 + 24));
        atomic_fetch_add(this + 192, 0xFFFFFFFF);
        CFStringRef v10 = v7;
        if (v8 != v7)
        {
          uint64_t v14 = v8 + 1;
          if (v8 + 1 == v7)
          {
            CFStringRef v10 = v8;
          }
          else
          {
            CFStringRef v10 = v8;
            do
            {
              uint64_t v15 = *v14;
              if (*(void *)(*v14 + 8) == v9)
              {
                caulk::concurrent::skiplist<unsigned int,AudioDSPGraph::Analyzer *,10,(caulk::concurrent::skiplist_options)0>::remove((unint64_t)(this + 84), *(_DWORD *)(v15 + 24));
                atomic_fetch_add(this + 192, 0xFFFFFFFF);
              }
              else
              {
                *uint64_t v14 = 0;
                uint64_t v16 = *v10;
                uint64_t *v10 = v15;
                if (v16) {
                  (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
                }
                ++v10;
              }
              ++v14;
            }
            while (v14 != v7);
          }
        }
      }
      unint64_t v11 = (uint64_t *)*((void *)this + 40);
      if (v10 != v11)
      {
        while (v11 != v10)
        {
          uint64_t v13 = *--v11;
          uint64_t v12 = v13;
          *unint64_t v11 = 0;
          if (v13) {
            (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
          }
        }
        *((void *)this + 40) = v10;
      }
    }
  }

  std::mutex::unlock(v4);
}

void sub_24892FAEC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t AudioDSPGraph::Box::recordEnable(AudioDSPGraph::Box *this, uint64_t a2, char a3)
{
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0) {
    uint64_t v5 = AudioDSPGraph::Box::out(this, a2);
  }
  else {
    uint64_t v5 = AudioDSPGraph::Box::in(this, a2);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5);
  uint64_t v7 = *((void *)this + 25);
  uint64_t v8 = *((void *)this + 26);
  if (v7 != v8)
  {
    while (*(void *)(*(void *)v7 + 8) != result)
    {
      v7 += 8;
      if (v7 == v8) {
        return result;
      }
    }
  }
  if (v7 != v8) {
    *(unsigned char *)(*(void *)v7 + 88) = a3;
  }
  return result;
}

uint64_t AudioDSPGraph::Box::stopRecording(atomic_uint *this, uint64_t a2)
{
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0) {
    uint64_t v3 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, a2);
  }
  else {
    uint64_t v3 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)this, a2);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3);
  uint64_t v5 = (uint64_t *)*((void *)this + 25);
  uint64_t v6 = (uint64_t *)*((void *)this + 26);
  if (v5 == v6)
  {
LABEL_8:
    uint64_t v8 = (uint64_t *)*((void *)this + 26);
  }
  else
  {
    uint64_t v7 = result;
    while (*(void *)(*v5 + 8) != result)
    {
      if (++v5 == v6) {
        goto LABEL_8;
      }
    }
    atomic_fetch_add(this + 192, 0xFFFFFFFF);
    uint64_t v8 = v6;
    if (v5 != v6)
    {
      unint64_t v11 = v5 + 1;
      if (v5 + 1 == v6)
      {
        uint64_t v8 = v5;
      }
      else
      {
        uint64_t v8 = v5;
        do
        {
          uint64_t v12 = *v11;
          if (*(void *)(*v11 + 8) == v7)
          {
            atomic_fetch_add(this + 192, 0xFFFFFFFF);
          }
          else
          {
            *unint64_t v11 = 0;
            uint64_t result = *v8;
            *uint64_t v8 = v12;
            if (result) {
              uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
            }
            ++v8;
          }
          ++v11;
        }
        while (v11 != v6);
      }
    }
  }
  uint64_t v9 = (uint64_t *)*((void *)this + 26);
  if (v8 != v9)
  {
    while (v9 != v8)
    {
      uint64_t v10 = *--v9;
      uint64_t result = v10;
      *uint64_t v9 = 0;
      if (v10) {
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
      }
    }
    *((void *)this + 26) = v8;
  }
  return result;
}

uint64_t AudioDSPGraph::Box::record(AudioDSPGraph::Box *this, int a2, uint64_t a3)
{
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v3 = AudioDSPGraph::Box::out(this, a3);
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
    operator new();
  }
  uint64_t v4 = AudioDSPGraph::Box::in(this, a3);
  uint64_t v5 = *(uint64_t (**)(void))(**(void **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4)
                                                     + 8)
                                         + 8)
                           + 152);

  return v5();
}

void sub_24893001C(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)(v1 + 16) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  MEMORY[0x24C585790](v1, 0x10F3C40E812D4C4);
  _Unwind_Resume(a1);
}

uint64_t AudioDSPGraph::Box::stopInjecting(atomic_uint *this, uint64_t a2)
{
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0) {
    uint64_t v3 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, a2);
  }
  else {
    uint64_t v3 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)this, a2);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3);
  uint64_t v5 = (uint64_t *)*((void *)this + 28);
  uint64_t v6 = (uint64_t *)*((void *)this + 29);
  if (v5 == v6)
  {
LABEL_8:
    uint64_t v8 = (uint64_t *)*((void *)this + 29);
  }
  else
  {
    uint64_t v7 = result;
    while (*(void *)(*v5 + 8) != result)
    {
      if (++v5 == v6) {
        goto LABEL_8;
      }
    }
    atomic_fetch_add(this + 192, 0xFFFFFFFF);
    uint64_t v8 = v6;
    if (v5 != v6)
    {
      unint64_t v11 = v5 + 1;
      if (v5 + 1 == v6)
      {
        uint64_t v8 = v5;
      }
      else
      {
        uint64_t v8 = v5;
        do
        {
          uint64_t v12 = *v11;
          if (*(void *)(*v11 + 8) == v7)
          {
            atomic_fetch_add(this + 192, 0xFFFFFFFF);
          }
          else
          {
            *unint64_t v11 = 0;
            uint64_t result = *v8;
            *uint64_t v8 = v12;
            if (result) {
              uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
            }
            ++v8;
          }
          ++v11;
        }
        while (v11 != v6);
      }
    }
  }
  uint64_t v9 = (uint64_t *)*((void *)this + 29);
  if (v8 != v9)
  {
    while (v9 != v8)
    {
      uint64_t v10 = *--v9;
      uint64_t result = v10;
      *uint64_t v9 = 0;
      if (v10) {
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
      }
    }
    *((void *)this + 29) = v8;
  }
  return result;
}

uint64_t AudioDSPGraph::Box::inject(AudioDSPGraph::Box *this, const char *a2, uint64_t a3)
{
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v3 = AudioDSPGraph::Box::out(this, a3);
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
    operator new();
  }
  uint64_t v4 = AudioDSPGraph::Box::in(this, a3);
  uint64_t v5 = *(uint64_t (**)(void))(**(void **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4)
                                                     + 8)
                                         + 8)
                           + 136);

  return v5();
}

void sub_248930504(_Unwind_Exception *a1)
{
  AudioDSPGraph::SimpleABL::free(v2);
  MEMORY[0x24C585790](v1, 0x10F3C403BA5ECB3);
  _Unwind_Resume(a1);
}

__n128 AudioDSPGraph::DelayBox::getParameterInfo@<Q0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v5 = -10866;
  }
  else
  {
    if (!a2)
    {
      uint64_t v15 = 0;
      long long v13 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      v14.n128_u64[0] = 5;
      v14.n128_u64[1] = 0x3F80000049742400;
      strlcpy((char *)&v9, "delay samples", 0x34uLL);
      *((void *)&v13 + 1) = @"delay samples";
      LODWORD(v15) = v15 | 0xC8000000;
      long long v6 = v10;
      *(_OWORD *)a3 = v9;
      *(_OWORD *)(a3 + 16) = v6;
      long long v7 = v12;
      *(_OWORD *)(a3 + 32) = v11;
      *(_OWORD *)(a3 + 48) = v7;
      __n128 result = v14;
      *(_OWORD *)(a3 + 64) = v13;
      *(__n128 *)(a3 + 80) = result;
      *(void *)(a3 + 96) = v15;
      *(unsigned char *)(a3 + 104) = 1;
      return result;
    }
    int v5 = -10878;
  }
  *(_DWORD *)a3 = v5;
  *(unsigned char *)(a3 + 104) = 0;
  return result;
}

void sub_248930654(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void AudioDSPGraph::DelayBox::getParameterList(int a1@<W1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (!a1)
  {
    uint64_t v4 = operator new(4uLL);
    *a2 = v4;
    *v4++ = 0;
    a2[1] = v4;
    a2[2] = v4;
  }
}

float AudioDSPGraph::DelayBox::getParameter(AudioDSPGraph::DelayBox *this, int a2, int a3)
{
  if (a3 | a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v5, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v4, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10878, &v6, 3275, &v5, &v4);
  }
  return (float)*((unsigned int *)this + 199);
}

void sub_248930720(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::DelayBox::setParameter(AudioDSPGraph::DelayBox *this, int a2, int a3, float a4)
{
  if (a3 | a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v8, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v7, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10878, &v9, 3264, &v8, &v7);
  }
  unint64_t v4 = llroundf(a4);
  if (HIDWORD(v4))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::overflow_error::overflow_error[abi:ne180100](exception, "numerical cast overflow: could not retain value in conversion type");
  }

  return AudioDSPGraph::DelayBox::setDelayFrames((uint64_t)this, v4);
}

void sub_248930838(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

unint64_t AudioDSPGraph::DelayBox::selfLatencyInTicks(AudioDSPGraph::DelayBox *this)
{
  uint64_t v1 = *((unsigned int *)this + 199);
  unint64_t v2 = *(void *)(*((void *)this + 1) + 664);
  uint64_t v3 = AudioDSPGraph::Box::out(this, 0);
  return v2 / **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3) + 120) * v1;
}

BOOL AudioDSPGraph::DelayBox::canProcessInPlace(AudioDSPGraph::DelayBox *this)
{
  return *((_DWORD *)this + 198) == 0;
}

void AudioDSPGraph::Box::printShort(uint64_t a1, void *a2, unsigned int a3)
{
}

uint64_t AudioDSPGraph::Box::print(uint64_t result, void *a2, int a3, uint64_t a4)
{
  if (a3 >= 2)
  {
    int v4 = a4;
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)result + 32))(result, a2, a4, 1);
    AudioDSPGraph::printi(a2, v4 + 4, "graph %p\n");
  }
  return result;
}

const char *AudioDSPGraph::DelayBox::ClassName(AudioDSPGraph::DelayBox *this)
{
  return "DelayBox";
}

void AudioDSPGraph::DelayBox::~DelayBox(AudioDSPGraph::DelayBox *this)
{
  *(void *)this = &unk_26FC9D748;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::DelayBox *)((char *)this + 776));
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26FC9D748;
  AudioDSPGraph::SimpleABL::free((AudioDSPGraph::DelayBox *)((char *)this + 776));

  AudioDSPGraph::Box::~Box(this);
}

uint64_t caulk::concurrent::lf_read_synchronized_write<std::vector<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver,std::allocator<AudioDSPGraph::RenderObserverList<AudioDSPGraph::Box>::RenderObserver>>>::lf_read_synchronized_write(caulk::concurrent::details::lf_read_sync_write_impl *a1)
{
  uint64_t result = caulk::concurrent::details::lf_read_sync_write_impl::lf_read_sync_write_impl(a1);
  *(_WORD *)(result + 8) = 1;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(void *)(result + 16) = 0;
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AudioDSPGraph::OutputPort>>(unint64_t a1)
{
  if (a1 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a1);
}

uint64_t *std::vector<AudioDSPGraph::OutputPort>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  uint64_t v4 = a2[1];
  if (v3 != *result)
  {
    uint64_t v5 = v4 - 32;
    do
    {
      *(void *)(v4 - 32) = &unk_26FC9FBA8;
      v4 -= 32;
      long long v6 = *(_OWORD *)(v3 - 24);
      *(_DWORD *)(v4 + 24) = *(_DWORD *)(v3 - 8);
      *(_OWORD *)(v4 + 8) = v6;
      *(void *)uint64_t v4 = &unk_26FC9FBF8;
      v5 -= 32;
      v3 -= 32;
    }
    while (v3 != v2);
  }
  a2[1] = v4;
  uint64_t v7 = *result;
  void *result = v4;
  a2[1] = v7;
  uint64_t v8 = result[1];
  result[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = result[2];
  result[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<AudioDSPGraph::OutputPort>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = *(void (***)(void))(i - 32);
    *(void *)(a1 + 16) = i - 32;
    (*v4)();
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t *std::vector<AudioDSPGraph::InputPort>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4 + v5;
      *(void *)(v6 - 32) = &unk_26FC9FBA8;
      long long v7 = *(_OWORD *)(v2 + v5 - 24);
      *(_DWORD *)(v6 - 8) = *(_DWORD *)(v2 + v5 - 8);
      *(_OWORD *)(v6 - 24) = v7;
      *(void *)(v6 - 32) = &unk_26FC9FB58;
      *(_DWORD *)(v6 - 4) = *(_DWORD *)(v2 + v5 - 4);
      v5 -= 32;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  uint64_t v8 = *result;
  void *result = v4;
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

void caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned int,AudioDSPGraph::Analyzer *>::layout_vk const&>::vtable(void)::{lambda(void *,caulk::concurrent::details::skiplist_node<unsigned int,AudioDSPGraph::Analyzer *>::layout_vk const&)#1}::__invoke()
{
  exception = __cxa_allocate_exception(8uLL);
}

caulk::alloc::base_allocator *std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 96;
  do
  {
    uint64_t v4 = *(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * v2];
    while (1)
    {
      uint64_t result = (caulk::alloc::base_allocator *)caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
      if (!result) {
        break;
      }
      atomic_fetch_add((atomic_ullong *volatile)(v3 + 32 * v2 + 16), 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_add((atomic_uint *volatile)(a1 + 72), 0x801u);
      uint64_t v6 = *(unint64_t **)(a1 + 48);
      if (v6)
      {
        while (v6 + 4 > (unint64_t *)result || (char *)result + v4 > (char *)(v6 + 2048))
        {
          uint64_t v6 = (unint64_t *)atomic_load(v6);
          if (!v6) {
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:
        uint64_t v6 = (unint64_t *)atomic_load((unint64_t *)(a1 + 80));
        if (v6) {
          BOOL v8 = v6 + 4 > (unint64_t *)result;
        }
        else {
          BOOL v8 = 1;
        }
        if (v8 || (char *)result + v4 > (char *)(v6 + 2048)) {
LABEL_26:
        }
          caulk::alloc::base_allocator::bad_dealloc(result);
      }
      if (!v6) {
        goto LABEL_26;
      }
      if (v6 + 4 > (unint64_t *)result || (char *)result + v4 > (char *)(v6 + 2048)) {
        caulk::alloc::base_allocator::bad_dealloc(result);
      }
      atomic_fetch_add((atomic_uint *volatile)(a1 + 72), 0xFFFFFFFF);
    }
    ++v2;
  }
  while (v2 != 10);
  for (uint64_t i = *(unint64_t **)(a1 + 48);
        i;
        uint64_t result = (caulk::alloc::base_allocator *)caulk::alloc::details::caching_page_allocator_base::deallocate())
  {
    uint64_t i = (unint64_t *)atomic_load(i);
  }
  return result;
}

void sub_248931004(void *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 72), 0xFFFFFFFF);
  __clang_call_terminate(a1);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FC9FD10;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24C585790);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned int,AudioDSPGraph::Analyzer *,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FC9FD10;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void AudioDSPGraph::Box::getParameterInfo(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 1869640255;
  *(unsigned char *)(a1 + 104) = 0;
}

void AudioDSPGraph::Box::getParameterList(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

void AudioDSPGraph::Box::getParameter(AudioDSPGraph::Box *this)
{
  std::string::basic_string[abi:ne180100]<0>(&v3, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v2, "getParameter");
  std::string::basic_string[abi:ne180100]<0>(&v1, "Box::getParameter");
  AudioDSPGraph::ThrowException(1869640255, &v3, 763, &v2, &v1);
}

void sub_248931110(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::Box::setParameter(AudioDSPGraph::Box *this, float a2)
{
  std::string::basic_string[abi:ne180100]<0>(&v4, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v3, "setParameter");
  std::string::basic_string[abi:ne180100]<0>(&v2, "Box::setParameter");
  AudioDSPGraph::ThrowException(1869640255, &v4, 770, &v3, &v2);
}

void sub_2489311C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::AUBox::reset(AudioUnit *this)
{
  uint64_t result = AudioUnitReset(this[106], 0, 0);
  if (result)
  {
    int v2 = result;
    std::string::basic_string[abi:ne180100]<0>(&v5, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v4, "reset");
    std::string::basic_string[abi:ne180100]<0>(&v3, "AudioUnitReset");
    AudioDSPGraph::ThrowException(v2, &v5, 1826, &v4, &v3);
  }
  return result;
}

void sub_24893129C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::AUBox::uninitialize(AudioUnit *this)
{
  AudioDSPGraph::Box::uninitialize((AudioDSPGraph::Box *)this);
  this[98] = this[97];
  this[101] = this[100];
  uint64_t result = AudioUnitUninitialize(this[106]);
  if (result)
  {
    int v3 = result;
    std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v5, "uninitialize");
    std::operator+<char>();
    AudioDSPGraph::ThrowException(v3, &v6, 1988, &v5, &v4);
  }
  return result;
}

void sub_248931384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::AUBox::initialize(AudioUnit *this)
{
  AudioDSPGraph::Box::initialize((AudioDSPGraph::Box *)this);
  int v2 = (long long *)this[97];
  AudioUnit v4 = this[8];
  AudioUnit v3 = this[9];
  *(void *)&long long v56 = 0;
  uint64_t v5 = v3 - v4;
  if (v5)
  {
    unint64_t v6 = v5 >> 5;
    AudioUnit v7 = this[99];
    AudioUnit v8 = this[98];
    unint64_t v9 = (v8 - (AudioUnit)v2) >> 3;
    if (v6 > (v7 - v8) >> 3)
    {
      unint64_t v10 = v9 + v6;
      if ((v9 + v6) >> 61) {
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v11 = v7 - (AudioUnit)v2;
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
          goto LABEL_79;
        }
        long long v13 = (OpaqueAudioComponentInstance *)operator new(8 * v12);
      }
      else
      {
        long long v13 = 0;
      }
      uint64_t v23 = 0;
      uint64_t v24 = 8 * v6;
      uint64_t v25 = (char *)v13 + 8 * v6;
      do
      {
        *(void *)((char *)v13 + v23) = 0;
        v23 += 8;
      }
      while (v24 != v23);
      int v26 = (OpaqueAudioComponentInstance *)((char *)v13 + 8 * v12);
      if (v8 != (AudioUnit)v2) {
        memmove(v25, v2, v8 - (AudioUnit)v2);
      }
      this[97] = v13;
      this[98] = (AudioUnit)&v25[8 * v9];
      this[99] = v26;
      if (v2) {
        operator delete(v2);
      }
      goto LABEL_38;
    }
    if (v6 <= v9)
    {
      uint64_t v15 = this[98];
      unint64_t v9 = v6;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = (AudioUnit)((char *)v8 + 8 * (v6 - v9));
      do
      {
        *(void *)((char *)v8 + v14) = v56;
        v14 += 8;
      }
      while (8 * v6 - 8 * v9 != v14);
      this[98] = v15;
      if (v8 == (AudioUnit)v2) {
        goto LABEL_38;
      }
    }
    uint64_t v16 = (OpaqueAudioComponentInstance *)((char *)v2 + 8 * v6);
    unint64_t v17 = (uint64_t *)((char *)v15 - 8 * v6);
    uint64_t v18 = v15;
    if (v17 < (uint64_t *)v8)
    {
      uint64_t v18 = v15;
      do
      {
        uint64_t v19 = *v17++;
        *(void *)uint64_t v18 = v19;
        uint64_t v18 = (OpaqueAudioComponentInstance *)((char *)v18 + 8);
      }
      while (v17 < (uint64_t *)v8);
    }
    this[98] = v18;
    if (v15 != v16) {
      memmove((char *)v15 - 8 * ((v15 - v16) >> 3), v2, v15 - v16);
    }
    int v20 = &v56;
    if (v2 <= &v56)
    {
      if (this[98] <= (AudioUnit)&v56) {
        unint64_t v21 = 0;
      }
      else {
        unint64_t v21 = v6;
      }
      int v20 = (long long *)((char *)&v56 + 8 * v21);
    }
    uint64_t v22 = *(void *)v20;
    do
    {
      *(void *)int v2 = v22;
      int v2 = (long long *)((char *)v2 + 8);
      --v9;
    }
    while (v9);
  }
LABEL_38:
  uint64_t v27 = (long long *)this[100];
  AudioUnit v29 = this[11];
  AudioUnit v28 = this[12];
  *(void *)&long long v56 = 0;
  uint64_t v30 = v28 - v29;
  if (!v30) {
    goto LABEL_71;
  }
  unint64_t v31 = v30 >> 5;
  AudioUnit v32 = this[102];
  AudioUnit v33 = this[101];
  unint64_t v34 = (v33 - (AudioUnit)v27) >> 3;
  if (v31 > (v32 - v33) >> 3)
  {
    unint64_t v35 = v34 + v31;
    if ((v34 + v31) >> 61) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v36 = v32 - (AudioUnit)v27;
    if (v36 >> 2 > v35) {
      unint64_t v35 = v36 >> 2;
    }
    if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v37 = v35;
    }
    if (!v37)
    {
      unsigned int v38 = 0;
LABEL_65:
      uint64_t v46 = 0;
      uint64_t v47 = 8 * v31;
      uint64_t v48 = (char *)v38 + 8 * v31;
      do
      {
        *(void *)((char *)v38 + v46) = 0;
        v46 += 8;
      }
      while (v47 != v46);
      int v49 = (OpaqueAudioComponentInstance *)((char *)v38 + 8 * v37);
      if (v33 != (AudioUnit)v27) {
        memmove(v48, v27, v33 - (AudioUnit)v27);
      }
      this[100] = v38;
      this[101] = (AudioUnit)&v48[8 * v34];
      this[102] = v49;
      if (v27) {
        operator delete(v27);
      }
      goto LABEL_71;
    }
    if (!(v37 >> 61))
    {
      unsigned int v38 = (OpaqueAudioComponentInstance *)operator new(8 * v37);
      goto LABEL_65;
    }
LABEL_79:
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  if (v31 <= v34)
  {
    uint64_t v40 = this[101];
    unint64_t v34 = v31;
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v40 = (AudioUnit)((char *)v33 + 8 * (v31 - v34));
    do
    {
      *(void *)((char *)v33 + v39) = 0;
      v39 += 8;
    }
    while (8 * v31 - 8 * v34 != v39);
    this[101] = v40;
    if (v33 == (AudioUnit)v27) {
      goto LABEL_71;
    }
  }
  uint64_t v41 = (OpaqueAudioComponentInstance *)((char *)v27 + 8 * v31);
  unint64_t v42 = (uint64_t *)((char *)v40 - 8 * v31);
  CFDictionaryRef v43 = v40;
  if (v42 < (uint64_t *)v33)
  {
    CFDictionaryRef v43 = v40;
    do
    {
      uint64_t v44 = *v42++;
      *(void *)CFDictionaryRef v43 = v44;
      CFDictionaryRef v43 = (OpaqueAudioComponentInstance *)((char *)v43 + 8);
    }
    while (v42 < (uint64_t *)v33);
  }
  this[101] = v43;
  if (v40 != v41) {
    memmove((char *)v40 - 8 * ((v40 - v41) >> 3), v27, v40 - v41);
  }
  uint64_t v45 = v56;
  if (v27 > &v56) {
    uint64_t v45 = 0;
  }
  do
  {
    *(void *)uint64_t v27 = v45;
    uint64_t v27 = (long long *)((char *)v27 + 8);
    --v34;
  }
  while (v34);
LABEL_71:
  if (((this[9] - this[8]) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v50 = 0;
    do
    {
      LODWORD(v56) = 0;
      (*((void (**)(AudioUnit *, uint64_t, uint64_t, uint64_t, uint64_t, long long *))*this + 39))(this, 51, 1, v50, 4, &v56);
      uint64_t v50 = (v50 + 1);
    }
    while (v50 < ((unint64_t)(this[9] - this[8]) >> 5));
  }
  if (((this[12] - this[11]) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v51 = 0;
    do
    {
      LODWORD(v56) = 0;
      (*((void (**)(AudioUnit *, uint64_t, uint64_t, uint64_t, uint64_t, long long *))*this + 39))(this, 51, 2, v51, 4, &v56);
      uint64_t v51 = (v51 + 1);
    }
    while (v51 < ((unint64_t)(this[12] - this[11]) >> 5));
  }
  uint64_t result = AudioUnitInitialize(this[106]);
  if (result)
  {
    int v53 = result;
    std::string::basic_string[abi:ne180100]<0>(&v56, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v55, "initialize");
    std::operator+<char>();
    AudioDSPGraph::ThrowException(v53, &v56, 1975, &v55, &v54);
  }
  return result;
}

void sub_248931874(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

OpaqueAudioComponentInstance *AudioDSPGraph::AUBox::close(AudioDSPGraph::AUBox *this)
{
  uint64_t result = (OpaqueAudioComponentInstance *)*((void *)this + 106);
  if (result)
  {
    uint64_t result = (OpaqueAudioComponentInstance *)AudioComponentInstanceDispose(result);
    *((void *)this + 106) = 0;
    if (result)
    {
      int v3 = (int)result;
      std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v5, "close");
      std::operator+<char>();
      AudioDSPGraph::ThrowException(v3, &v6, 1951, &v5, &v4);
    }
  }
  return result;
}

void sub_248931950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::AUBox::open(AudioDSPGraph::AUBox *this)
{
  if (*((void *)this + 106)) {
    return;
  }
  Next = AudioComponentFindNext(0, (const AudioComponentDescription *)((char *)this + 824));
  if (!Next)
  {
    std::string::basic_string[abi:ne180100]<0>(&v18, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v17, "open");
    std::operator+<char>();
    AudioDSPGraph::ThrowException(1633906209, &v18, 1913, &v17, &v16);
  }
  int v3 = (AudioComponentInstance *)((char *)this + 848);
  OSStatus v4 = AudioComponentInstanceNew(Next, (AudioComponentInstance *)this + 106);
  if (v4)
  {
    int v12 = v4;
    std::string::basic_string[abi:ne180100]<0>(&v18, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v17, "open");
    std::operator+<char>();
    AudioDSPGraph::ThrowException(v12, &v18, 1919, &v17, &v16);
  }
  if (!*v3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v18, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v17, "open");
    std::operator+<char>();
    AudioDSPGraph::ThrowException(1633906209, &v18, 1922, &v17, &v16);
  }
  BOOL v5 = AudioComponentInstanceCanDo(*v3, 20)
    && ((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) == 0x20
    && ((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) == 32;
  *((unsigned char *)this + 856) = v5;
  CFStringRef v6 = (CFStringRef)((char *)this + 32);
  if ((*((char *)this + 55) & 0x80000000) == 0)
  {
    size_t v7 = strlen((const char *)this + 32);
    goto LABEL_12;
  }
  CFStringRef v6 = (CFStringRef)v6->isa;
  size_t v7 = strlen((const char *)v6);
  if (v6)
  {
LABEL_12:
    CFStringRef v6 = CFStringCreateWithBytes(0, (const UInt8 *)v6, v7, 0x8000100u, 0);
    CFStringRef v15 = v6;
    if (!v6)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
    goto LABEL_13;
  }
  CFStringRef v15 = 0;
LABEL_13:
  CFStringRef v14 = v6;
  (*(void (**)(AudioDSPGraph::AUBox *, uint64_t, void, void, uint64_t, CFStringRef *))(*(void *)this
                                                                                                  + 312))(this, 54, 0, 0, 8, &v14);
  uint64_t v8 = (*((void *)this + 9) - *((void *)this + 8)) >> 5;
  uint64_t v9 = (*((void *)this + 12) - *((void *)this + 11)) >> 5;
  int v21 = v9;
  int v22 = v8;
  uint64_t v20 = 0;
  int v19 = 4;
  (*(void (**)(AudioDSPGraph::AUBox *, uint64_t, uint64_t, void, int *, char *))(*(void *)this + 304))(this, 11, 1, 0, &v19, (char *)&v20 + 4);
  (*(void (**)(AudioDSPGraph::AUBox *, uint64_t, uint64_t, void, int *, uint64_t *))(*(void *)this + 304))(this, 11, 2, 0, &v19, &v20);
  if (HIDWORD(v20) != v8)
  {
    int v10 = (*(uint64_t (**)(AudioDSPGraph::AUBox *, uint64_t, uint64_t, void, uint64_t, int *))(*(void *)this + 312))(this, 11, 1, 0, 4, &v22);
    if (v10)
    {
      std::string::basic_string[abi:ne180100]<0>(&v18, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v17, "setElementCountOnUnit");
      std::string::basic_string[abi:ne180100]<0>(&v16, "setProperty failed");
      AudioDSPGraph::ThrowException(v10, &v18, 2062, &v17, &v16);
    }
  }
  if (v20 != v9)
  {
    int v11 = (*(uint64_t (**)(AudioDSPGraph::AUBox *, uint64_t, uint64_t, void, uint64_t, int *))(*(void *)this + 312))(this, 11, 2, 0, 4, &v21);
    if (v11)
    {
      std::string::basic_string[abi:ne180100]<0>(&v18, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v17, "setElementCountOnUnit");
      std::string::basic_string[abi:ne180100]<0>(&v16, "setProperty failed");
      AudioDSPGraph::ThrowException(v11, &v18, 2070, &v17, &v16);
    }
  }
  if (v6) {
    CFRelease(v6);
  }
}

void sub_248931E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  applesauce::CF::StringRef::~StringRef(&a10);
  _Unwind_Resume(a1);
}

void AudioDSPGraph::AUBox::decompileBox(uint64_t a1, uint64_t a2, char a3)
{
  int v3 = (char *)(a1 + 32);
  if ((a3 & 1) == 0)
  {
    if (*(char *)(a1 + 55) < 0) {
      int v3 = *(char **)v3;
    }
    std::string::basic_string[abi:ne180100]<0>(v9, v3);
    AudioDSPGraph::asDecompileString(&__p, v9);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"box %s ", v4, p_p);
  }
  if (*(char *)(a1 + 55) < 0) {
    int v3 = *(char **)v3;
  }
  uint64_t v6 = *(void *)(a1 + 56);
  std::string::basic_string[abi:ne180100]<0>(v9, v3);
  AudioDSPGraph::asDecompileString(&__p, v9);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v8 = &__p;
  }
  else {
    uint64_t v8 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  AudioDSPGraph::strprintf((AudioDSPGraph *)"box %qu %s ", v7, v6, v8);
}

void sub_2489320B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::AUBox::process(AudioDSPGraph::AUBox *this, UInt32 a2)
{
  if ((*(unsigned int (**)(AudioDSPGraph::AUBox *))(*(void *)this + 64))(this))
  {
    uint64_t v4 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v5 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56);
    uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6);
    uint64_t v8 = *(void *)(v7 + 56);
    if (v8 != v5)
    {
      AudioDSPGraph::Buffer::copyFrom(*(void **)(v7 + 56), (void *)v5);
      long long v9 = *(_OWORD *)(v5 + 8);
      long long v10 = *(_OWORD *)(v5 + 24);
      long long v11 = *(_OWORD *)(v5 + 40);
      *(_OWORD *)(v8 + 56) = *(_OWORD *)(v5 + 56);
      *(_OWORD *)(v8 + 40) = v11;
      *(_OWORD *)(v8 + 24) = v10;
      *(_OWORD *)(v8 + 8) = v9;
      *(_DWORD *)(v8 + 72) = *(_DWORD *)(v5 + 72);
    }
    *(void *)(v8 + 8) = *(void *)(*((void *)this + 2) + 256);
    uint64_t v12 = v8 + 8;
    long long v13 = *(AudioBufferList **)(v12 + 72);
    CFStringRef v14 = (_DWORD *)(v12 + 64);
    OSStatus v15 = AudioUnitProcess(*((AudioUnit *)this + 106), (AudioUnitRenderActionFlags *)(v12 + 64), (const AudioTimeStamp *)v12, a2, v13);
    if (v15)
    {
      int v44 = v15;
      std::string::basic_string[abi:ne180100]<0>(&__C, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v50, "process");
      std::operator+<char>();
      AudioDSPGraph::ThrowException(v44, (long long *)&__C, 1864, &v50, &v49);
    }
    if ((*(unsigned char *)v14 & 0x10) != 0 && v13->mNumberBuffers)
    {
      uint64_t v16 = 0;
      vDSP_Length v17 = a2;
      for (uint64_t i = 16; ; i += 16)
      {
        LODWORD(__C.mSampleTime) = 0;
        vDSP_maxmgv(*(const float **)((char *)&v13->mNumberBuffers + i), 1, (float *)&__C, v17);
        if (*(float *)&__C.mSampleTime != 0.0) {
          break;
        }
        if (++v16 >= (unint64_t)v13->mNumberBuffers) {
          return;
        }
      }
      *v14 &= ~0x10u;
    }
  }
  else
  {
    uint64_t v19 = *((void *)this + 8);
    if (*((void *)this + 9) != v19)
    {
      uint64_t v20 = 0;
      unint64_t v21 = 0;
      do
      {
        *(void *)(*((void *)this + 97) + 8 * v21++) = *(void *)(*(void *)((*(uint64_t (**)(void))(*(void *)(v19 + v20) + 40))()
                                                                                + 56)
                                                                    + 80);
        uint64_t v19 = *((void *)this + 8);
        v20 += 32;
      }
      while (v21 < (*((void *)this + 9) - v19) >> 5);
    }
    uint64_t v22 = *((void *)this + 11);
    if (*((void *)this + 12) != v22)
    {
      uint64_t v23 = 0;
      unint64_t v24 = 0;
      do
      {
        uint64_t v25 = v22 + v23;
        uint64_t v26 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v22 + v23) + 40))(v22 + v23) + 56);
        *(void *)(*((void *)this + 100) + 8 * v24) = *(void *)(v26 + 80);
        uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)v25 + 40))(v25);
        AudioDSPGraph::Buffer::setByteSize((unsigned int **)v26, *(_DWORD *)(*(void *)(v27 + 120) + 24) * a2);
        ++v24;
        uint64_t v22 = *((void *)this + 11);
        v23 += 32;
      }
      while (v24 < (*((void *)this + 12) - v22) >> 5);
    }
    uint64_t v28 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v29 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v28 + 40))(v28) + 56);
    AudioUnitRenderActionFlags ioActionFlags = 0;
    long long v30 = *(_OWORD *)(v29 + 24);
    long long v31 = *(_OWORD *)(v29 + 56);
    long long v32 = *(_OWORD *)(v29 + 8);
    *(_OWORD *)&__C.mSMPTETime.mSubframes = *(_OWORD *)(v29 + 40);
    *(_OWORD *)&__C.mSMPTETime.mHours = v31;
    *(_OWORD *)&__C.mSampleTime = v32;
    *(_OWORD *)&__C.mRateScalar = v30;
    __C.mSampleTime = *(Float64 *)(*((void *)this + 2) + 256);
    OSStatus v33 = AudioUnitProcessMultiple(*((AudioUnit *)this + 106), &ioActionFlags, &__C, a2, (*((void *)this + 9) - *((void *)this + 8)) >> 5, *((const AudioBufferList ***)this + 97), (*((void *)this + 12) - *((void *)this + 11)) >> 5, *((AudioBufferList ***)this + 100));
    if (v33)
    {
      int v45 = v33;
      std::string::basic_string[abi:ne180100]<0>(&v50, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v49, "process");
      std::operator+<char>();
      AudioDSPGraph::ThrowException(v45, &v50, 1899, &v49, &v46);
    }
    unint64_t v35 = (void *)*((void *)this + 11);
    unint64_t v34 = (void *)*((void *)this + 12);
    if (v35 != v34)
    {
      AudioUnitRenderActionFlags v36 = ioActionFlags;
      unint64_t v37 = v35;
      unsigned int v38 = v35;
      do
      {
        uint64_t v39 = *v38;
        v38 += 4;
        uint64_t v40 = *(void *)((*(uint64_t (**)(void *))(v39 + 40))(v37) + 56);
        long long v42 = *(_OWORD *)&__C.mSMPTETime.mSubframes;
        long long v41 = *(_OWORD *)&__C.mSMPTETime.mHours;
        long long v43 = *(_OWORD *)&__C.mRateScalar;
        *(_OWORD *)(v40 + 8) = *(_OWORD *)&__C.mSampleTime;
        *(_OWORD *)(v40 + 24) = v43;
        *(_OWORD *)(v40 + 40) = v42;
        *(_OWORD *)(v40 + 56) = v41;
        *(_DWORD *)(v40 + 72) = v36;
        v35 += 4;
        unint64_t v37 = v38;
      }
      while (v38 != v34);
    }
  }
}

void sub_248932574(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v21 - 73) < 0) {
    operator delete(*(void **)(v21 - 96));
  }
  if (*(char *)(v21 - 49) < 0) {
    operator delete(*(void **)(v21 - 72));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::AUBox::getFormatFromUnit@<X0>(AudioUnit *this@<X0>, AudioUnitScope inScope@<W1>, AudioUnitElement inElement@<W2>, void *a4@<X8>)
{
  a4[4] = 0;
  *(_OWORD *)a4 = 0u;
  *((_OWORD *)a4 + 1) = 0u;
  UInt32 ioDataSize = 40;
  uint64_t result = AudioUnitGetProperty(this[106], 8u, inScope, inElement, a4, &ioDataSize);
  if (result)
  {
    int v6 = result;
    std::string::basic_string[abi:ne180100]<0>(&v14, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v13, "getFormatFromUnit");
    std::string::basic_string[abi:ne180100]<0>(&v9, "AUBox::getFormatFromUnit ");
    uint64_t v7 = (char *)(*((uint64_t (**)(AudioUnit *))*this + 2))(this);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v10, &v9, v7);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v11, &v10, " ");
    uint64_t v8 = (char *)(this + 4);
    if (*((char *)this + 55) < 0) {
      uint64_t v8 = *(char **)v8;
    }
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v12, &v11, v8);
    AudioDSPGraph::ThrowException(v6, &v14, 2039, &v13, (long long *)&v12);
  }
  return result;
}

void sub_248932718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a33 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (*(char *)(v33 - 49) < 0) {
    operator delete(*(void **)(v33 - 72));
  }
  if (*(char *)(v33 - 25) < 0) {
    operator delete(*(void **)(v33 - 48));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::AUBox::setFormatOnUnit(AudioUnit *this, const AudioStreamBasicDescription *inData, AudioUnitScope a3, AudioUnitElement a4)
{
  uint64_t result = AudioUnitSetProperty(this[106], 8u, a3, a4, inData, 0x28u);
  if (result)
  {
    std::string::basic_string[abi:ne180100]<0>(v15, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(v14, "setFormatOnUnit");
    uint64_t v7 = (*((uint64_t (**)(AudioUnit *))*this + 2))(this);
    uint64_t v8 = this + 4;
    if (*((char *)this + 55) < 0) {
      uint64_t v8 = (void *)*v8;
    }
    int16x8_t v9 = *(int16x8_t *)&inData->mBytesPerPacket;
    v16[0] = *(_OWORD *)&inData->mSampleRate;
    v16[1] = v9;
    uint64_t v17 = *(void *)&inData->mBitsPerChannel;
    CA::StreamDescription::AsString((CA::StreamDescription *)v12, v16, *(double *)v16, v9);
    if (v13 >= 0) {
      std::string v11 = v12;
    }
    else {
      std::string v11 = (void *)v12[0];
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"AUBox::setFormatOnUnit %s %s : %s", v10, v7, v8, v11);
  }
  return result;
}

void sub_2489328BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (*(char *)(v31 - 57) < 0) {
    operator delete(*(void **)(v31 - 80));
  }
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::AUBox::getComponentName(AudioComponentInstance *this@<X0>, uint64_t a2@<X8>)
{
  Component = AudioComponentInstanceGetComponent(this[106]);
  if (Component && (CFStringRef outName = 0, !AudioComponentCopyName(Component, &outName)))
  {
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v8, outName);
    if (!v8)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
    applesauce::CF::convert_to<std::string,0>((uint64_t)&v6, v8);
    *(_OWORD *)a2 = v6;
    CFStringRef v4 = v8;
    *(void *)(a2 + 16) = v7;
    *(unsigned char *)(a2 + 24) = 1;
    if (v4) {
      CFRelease(v4);
    }
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 24) = 0;
  }
}

void sub_2489329E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, const void *a13)
{
  __cxa_free_exception(v13);
  applesauce::CF::StringRef::~StringRef(&a13);
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *AudioDSPGraph::AUBox::getPreset@<X0>(AudioDSPGraph::AUBox *this@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  CFTypeRef v10 = 0;
  int v9 = 8;
  int v3 = (*(uint64_t (**)(AudioDSPGraph::AUBox *, void, void, void, int *, CFTypeRef *))(*(void *)this + 304))(this, 0, 0, 0, &v9, &v10);
  if (v3)
  {
    int v5 = v3;
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "getPreset");
    std::string::basic_string[abi:ne180100]<0>(&v6, "AudioUnitGetProperty ClassInfo");
    AudioDSPGraph::ThrowException(v5, &v8, 1782, &v7, &v6);
  }
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v10);
}

void sub_248932ADC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::AUBox::setPreset(AudioDSPGraph::AUBox *this, const __CFDictionary *a2)
{
  CFDictionaryRef v3 = a2;
  return (*(uint64_t (**)(AudioDSPGraph::AUBox *, void, void, void, uint64_t, const __CFDictionary **))(*(void *)this + 312))(this, 0, 0, 0, 8, &v3);
}

uint64_t AudioDSPGraph::AUBox::setProperty(AudioUnit *this, AudioUnitPropertyID a2, AudioUnitScope a3, AudioUnitElement a4, UInt32 inDataSize, const void *inData)
{
  return AudioUnitSetProperty(this[106], a2, a3, a4, inData, inDataSize);
}

uint64_t AudioDSPGraph::AUBox::getProperty(AudioUnit *this, AudioUnitPropertyID a2, AudioUnitScope a3, AudioUnitElement a4, unsigned int *a5, void *outData)
{
  UInt32 ioDataSize = *a5;
  uint64_t result = AudioUnitGetProperty(this[106], a2, a3, a4, outData, &ioDataSize);
  *a5 = ioDataSize;
  return result;
}

unint64_t AudioDSPGraph::AUBox::getPropertyInfo(AudioUnit *this, AudioUnitPropertyID a2, AudioUnitScope a3, AudioUnitElement a4)
{
  UInt32 outDataSize = 0;
  Boolean outWritable = 0;
  unsigned int PropertyInfo = AudioUnitGetPropertyInfo(this[106], a2, a3, a4, &outDataSize, &outWritable);
  unint64_t v5 = (unint64_t)(outWritable != 0) << 32;
  if (PropertyInfo) {
    uint64_t v6 = PropertyInfo;
  }
  else {
    uint64_t v6 = outDataSize;
  }
  if (PropertyInfo) {
    unint64_t v5 = 0;
  }
  return v5 | v6;
}

__n128 AudioDSPGraph::AUBox::desc@<Q0>(AudioDSPGraph::AUBox *this@<X0>, __n128 *a2@<X8>)
{
  a2[1].n128_u32[0] = *((_DWORD *)this + 210);
  __n128 result = *(__n128 *)((char *)this + 824);
  *a2 = result;
  return result;
}

BOOL AudioDSPGraph::AUBox::usesFixedBlockSize(AudioDSPGraph::AUBox *this)
{
  int v8 = 4;
  int v9 = 0;
  (*(void (**)(AudioDSPGraph::AUBox *, uint64_t, void, void, int *, int *))(*(void *)this + 304))(this, 3700, 0, 0, &v8, &v9);
  int v2 = (*(uint64_t (**)(AudioDSPGraph::AUBox *, uint64_t, void, void, int *, int *))(*(void *)this + 304))(this, 3700, 0, 0, &v8, &v9);
  if (v2)
  {
    int v4 = v2;
    std::string::basic_string[abi:ne180100]<0>(&v7, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v6, "usesFixedBlockSize");
    std::string::basic_string[abi:ne180100]<0>(&v5, "getProperty failed");
    AudioDSPGraph::ThrowException(v4, &v7, 2015, &v6, &v5);
  }
  return v9 != 0;
}

void sub_248932D84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
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
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::AUBox::setUsesFixedBlockSize(AudioDSPGraph::AUBox *this, int a2)
{
  uint64_t result = (*(uint64_t (**)(AudioDSPGraph::AUBox *, uint64_t, void, void))(*(void *)this + 296))(this, 3700, 0, 0);
  if (v5) {
    BOOL v6 = (result & 0xFF00000000) == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    int v7 = a2;
    return (*(uint64_t (**)(AudioDSPGraph::AUBox *, uint64_t, void, void, uint64_t, int *))(*(void *)this + 312))(this, 3700, 0, 0, 4, &v7);
  }
  return result;
}

uint64_t AudioDSPGraph::AUBox::setMaxFrames(AudioDSPGraph::AUBox *this, int a2)
{
  int v3 = a2;
  return (*(uint64_t (**)(AudioDSPGraph::AUBox *, uint64_t, void, void, uint64_t, int *))(*(void *)this + 312))(this, 14, 0, 0, 4, &v3);
}

uint64_t AudioDSPGraph::AUBox::getParameterInfo@<X0>(AudioDSPGraph::AUBox *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v8 = 104;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)this + 304))();
  if (result)
  {
    char v4 = 0;
    *(_DWORD *)a2 = result;
  }
  else
  {
    long long v5 = v14;
    *(_OWORD *)(a2 + 64) = v13;
    *(_OWORD *)(a2 + 80) = v5;
    *(void *)(a2 + 96) = v15;
    long long v6 = v10;
    *(_OWORD *)a2 = v9;
    *(_OWORD *)(a2 + 16) = v6;
    long long v7 = v12;
    char v4 = 1;
    *(_OWORD *)(a2 + 32) = v11;
    *(_OWORD *)(a2 + 48) = v7;
  }
  *(unsigned char *)(a2 + 104) = v4;
  return result;
}

void sub_248932FE4(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

double AudioDSPGraph::AUBox::getParameterList@<D0>(AudioDSPGraph::AUBox *this@<X0>, uint64_t a2@<X1>, std::vector<unsigned int> *a3@<X8>)
{
  unsigned int v6 = (*(uint64_t (**)(AudioDSPGraph::AUBox *, uint64_t, uint64_t, void))(*(void *)this + 296))(this, 3, a2, 0);
  unsigned int v8 = v6;
  if (v9) {
    BOOL v10 = v6 > 3;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    std::vector<unsigned int>::vector(&v12, v6 >> 2);
    unsigned int v11 = v8 & 0xFFFFFFFC;
    if ((*(unsigned int (**)(AudioDSPGraph::AUBox *, uint64_t, uint64_t, void, unsigned int *, std::vector<unsigned int>::pointer))(*(void *)this + 304))(this, 3, a2, 0, &v11, v12.__begin_))
    {
      a3->__begin_ = 0;
      a3->__end_ = 0;
      a3->__end_cap_.__value_ = 0;
      if (v12.__begin_)
      {
        v12.__end_ = v12.__begin_;
        operator delete(v12.__begin_);
      }
    }
    else
    {
      double result = *(double *)&v12.__begin_;
      *a3 = v12;
    }
  }
  else
  {
    a3->__begin_ = 0;
    a3->__end_ = 0;
    a3->__end_cap_.__value_ = 0;
  }
  return result;
}

void sub_248933114(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

AudioUnitParameterValue AudioDSPGraph::AUBox::getParameter(AudioUnit *this, AudioUnitParameterID a2, AudioUnitScope a3, AudioUnitElement a4)
{
  outint Value = 0.0;
  OSStatus Parameter = AudioUnitGetParameter(this[106], a2, a3, a4, &outValue);
  if (Parameter)
  {
    int v6 = Parameter;
    std::string::basic_string[abi:ne180100]<0>(&v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v8, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v7, "AudioUnitGetParameter");
    AudioDSPGraph::ThrowException(v6, &v9, 1702, &v8, &v7);
  }
  return outValue;
}

void sub_2489331BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
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
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::AUBox::setParameter(AudioUnit *this, AudioUnitParameterID a2, AudioUnitScope a3, AudioUnitElement a4, AudioUnitParameterValue a5, UInt32 a6)
{
  uint64_t result = AudioUnitSetParameter(this[106], a2, a3, a4, a5, a6);
  if (result)
  {
    int v11 = result;
    std::string::basic_string[abi:ne180100]<0>(&v12, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v14, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v13, "AudioUnitSetParameter");
    AudioDSPGraph::ThrowException(v11, (long long *)&v12, 1683, &v14, &v13);
  }
  if (*((unsigned char *)this[1] + 735))
  {
    memset(&v12, 0, sizeof(v12));
    v12.mArgument.mParameter.mAudioUnit = this[106];
    *(void *)&v12.mArgument.mProperty.mPropertyID = __PAIR64__(a3, a2);
    v12.mArgument.mParameter.mElement = a4;
    return AUEventListenerNotify(0, 0, &v12);
  }
  return result;
}

void sub_2489332DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::AUBox::selfLatencyInTicks(AudioDSPGraph::AUBox *this)
{
  double v8 = 0.0;
  int v7 = 8;
  int v2 = (*(uint64_t (**)(AudioDSPGraph::AUBox *, uint64_t, void, void, int *, double *))(*(void *)this + 304))(this, 12, 0, 0, &v7, &v8);
  double v3 = v8;
  if (v2) {
    double v3 = 0.0;
  }
  uint64_t v4 = llround(v3 * (double)*(unint64_t *)(*((void *)this + 1) + 664));
  if (v4 <= 0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = -1;
  }
  if (v4 >= 0) {
    return v4;
  }
  else {
    return v5;
  }
}

uint64_t AudioDSPGraph::AUBox::canProcessInPlace(AudioDSPGraph::AUBox *this)
{
  return *((unsigned __int8 *)this + 856);
}

uint64_t AudioDSPGraph::AUBox::bypass(AudioDSPGraph::AUBox *this, int a2)
{
  int v3 = a2;
  return (*(uint64_t (**)(AudioDSPGraph::AUBox *, uint64_t, void, void, uint64_t, int *))(*(void *)this + 312))(this, 21, 0, 0, 4, &v3);
}

BOOL AudioDSPGraph::AUBox::isBypassed(AudioDSPGraph::AUBox *this)
{
  int v4 = 0;
  int v3 = 4;
  if ((*(unsigned int (**)(AudioDSPGraph::AUBox *, uint64_t, void, void, int *, int *))(*(void *)this + 304))(this, 21, 0, 0, &v3, &v4))
  {
    BOOL v1 = 1;
  }
  else
  {
    BOOL v1 = v4 == 0;
  }
  return !v1;
}

BOOL AudioDSPGraph::AUBox::canBypass(AudioDSPGraph::AUBox *this)
{
  return ((*(uint64_t (**)(AudioDSPGraph::AUBox *, uint64_t, void, void))(*(void *)this + 296))(this, 21, 0, 0) & 0xFF00000000) != 0&& v1 != 0;
}

void AudioDSPGraph::AUBox::printShort(uint64_t a1, void *a2, unsigned int a3)
{
}

uint64_t AudioDSPGraph::AUBox::print(uint64_t result, void *a2, int a3, uint64_t a4)
{
  if (a3 >= 2)
  {
    int v4 = a4;
    AudioDSPGraph::Box::print(result, a2, a3, a4);
    AudioDSPGraph::printi(a2, v4 + 4, "enabled %d\n");
  }
  return result;
}

const char *AudioDSPGraph::AUBox::ClassName(AudioDSPGraph::AUBox *this)
{
  return "AUBox";
}

void AudioDSPGraph::AUBox::~AUBox(AudioDSPGraph::AUBox *this)
{
  *(void *)this = &unk_26FC9CF98;
  int v2 = (void *)*((void *)this + 100);
  if (v2)
  {
    *((void *)this + 101) = v2;
    operator delete(v2);
  }
  int v3 = (void *)*((void *)this + 97);
  if (v3)
  {
    *((void *)this + 98) = v3;
    operator delete(v3);
  }
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  void *v2;
  void *v3;
  uint64_t vars8;

  *(void *)this = &unk_26FC9CF98;
  int v2 = (void *)*((void *)this + 100);
  if (v2)
  {
    *((void *)this + 101) = v2;
    operator delete(v2);
  }
  int v3 = (void *)*((void *)this + 97);
  if (v3)
  {
    *((void *)this + 98) = v3;
    operator delete(v3);
  }

  AudioDSPGraph::Box::~Box(this);
}

AudioDSPGraph::Box *AudioDSPGraph::TestBox::process(AudioDSPGraph::Box *this)
{
  if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) != 0)
  {
    char v1 = this;
    uint64_t v2 = AudioDSPGraph::Box::in(this, 0);
    int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 56) + 72);
    uint64_t v4 = AudioDSPGraph::Box::in(v1, 0);
    this = (AudioDSPGraph::Box *)(*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
    int v6 = (AudioDSPGraph::Box *)*((void *)v1 + 11);
    uint64_t v5 = (AudioDSPGraph::Box *)*((void *)v1 + 12);
    if (v6 != v5)
    {
      int v7 = (_OWORD *)(*((void *)this + 7) + 8);
      this = v6;
      double v8 = v6;
      do
      {
        uint64_t v9 = *(void *)v8;
        double v8 = (AudioDSPGraph::Box *)((char *)v8 + 32);
        uint64_t v10 = *(void *)((*(uint64_t (**)(AudioDSPGraph::Box *))(v9 + 40))(this) + 56);
        long long v12 = v7[2];
        long long v11 = v7[3];
        long long v13 = v7[1];
        *(_OWORD *)(v10 + 8) = *v7;
        *(_OWORD *)(v10 + 24) = v13;
        *(_OWORD *)(v10 + 40) = v12;
        *(_OWORD *)(v10 + 56) = v11;
        *(_DWORD *)(v10 + 72) = v3;
        int v6 = (AudioDSPGraph::Box *)((char *)v6 + 32);
        this = v8;
      }
      while (v8 != v5);
    }
  }
  return this;
}

double AudioDSPGraph::TestBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 4.91466378e252;
  *(_OWORD *)a1 = xmmword_24893BE00;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t AudioDSPGraph::TestBox::canProcessInPlace(AudioDSPGraph::TestBox *this)
{
  return *((unsigned __int8 *)this + 772);
}

const char *AudioDSPGraph::TestBox::ClassName(AudioDSPGraph::TestBox *this)
{
  return "test";
}

void AudioDSPGraph::TestBox::~TestBox(AudioDSPGraph::TestBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

uint64_t AudioDSPGraph::CopyBox::initialize(AudioDSPGraph::CopyBox *this)
{
  AudioDSPGraph::Box::initialize(this);
  uint64_t v2 = AudioDSPGraph::Box::in(this, 0);
  int v3 = *(const void **)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
  uint64_t result = memcmp(v3, *(const void **)(v5 + 120), 0x28uLL);
  if (result)
  {
    std::string::basic_string[abi:ne180100]<0>(&v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v8, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v7, "CopyBox input and output format mismatch");
    AudioDSPGraph::ThrowException(1718444833, &v9, 2136, &v8, &v7);
  }
  return result;
}

void sub_248933A5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::CopyBox::process(AudioDSPGraph::CopyBox *this, int a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in(this, 0);
  uint64_t v5 = (unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
  long long v7 = (unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = AudioDSPGraph::Box::in(this, 0);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8);
  AudioDSPGraph::SimpleABL::copy(v5, v7, 0, 0, (*(_DWORD *)(*(void *)(v9 + 120) + 24) * a2), 1);
  uint64_t v10 = AudioDSPGraph::Box::in(this, 0);
  int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 56) + 72);
  uint64_t v12 = AudioDSPGraph::Box::in(this, 0);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12);
  uint64_t v15 = *((void *)this + 11);
  long long v14 = (void *)*((void *)this + 12);
  if ((void *)v15 != v14)
  {
    uint64_t v16 = (_OWORD *)(result[7] + 8);
    uint64_t result = (void *)v15;
    uint64_t v17 = (void *)v15;
    do
    {
      uint64_t v18 = *v17;
      v17 += 4;
      uint64_t v19 = *(void *)((*(uint64_t (**)(void *))(v18 + 40))(result) + 56);
      long long v21 = v16[2];
      long long v20 = v16[3];
      long long v22 = v16[1];
      *(_OWORD *)(v19 + 8) = *v16;
      *(_OWORD *)(v19 + 24) = v22;
      *(_OWORD *)(v19 + 40) = v21;
      *(_OWORD *)(v19 + 56) = v20;
      *(_DWORD *)(v19 + 72) = v11;
      v15 += 32;
      uint64_t result = v17;
    }
    while (v17 != v14);
  }
  return result;
}

uint64_t AudioDSPGraph::CopyBox::hasPresetData(AudioDSPGraph::CopyBox *this)
{
  return 0;
}

double AudioDSPGraph::CopyBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 9.49207469e170;
  *(_OWORD *)a1 = xmmword_24893BDC0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::CopyBox::ClassName(AudioDSPGraph::CopyBox *this)
{
  return "copy";
}

void AudioDSPGraph::CopyBox::~CopyBox(AudioDSPGraph::CopyBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

uint64_t AudioDSPGraph::ArithmeticAbsBox::initialize(AudioDSPGraph::ArithmeticAbsBox *this)
{
  AudioDSPGraph::Box::initialize(this);
  if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) != 0x20
    || ((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0x20)
  {
    std::string::basic_string[abi:ne180100]<0>(v18, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(v17, "initialize");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"There must be one input and one output, instead of %u and %u.", v8, (*((void *)this + 9) - *((void *)this + 8)) >> 5, (*((void *)this + 12) - *((void *)this + 11)) >> 5);
  }
  uint64_t v2 = AudioDSPGraph::Box::in(this, 0);
  int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  if (v3 != *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 28))
  {
    std::string::basic_string[abi:ne180100]<0>(v18, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(v17, "initialize");
    uint64_t v9 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v10 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9) + 120) + 28);
    uint64_t v11 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 40))(v11);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The input and output must have the same channel count, but have %u and %u.", v13, v10, *(unsigned int *)(*(void *)(v12 + 120) + 28));
  }
  uint64_t v5 = AudioDSPGraph::Box::out(this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5);
  unsigned int v7 = *(_DWORD *)(*(void *)(result + 120) + 8);
  if (v7 != 1819304813)
  {
    std::string::basic_string[abi:ne180100]<0>(v18, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(v17, "initialize");
    caulk::string_from_4cc(&v16, v7);
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v15 = &v16;
    }
    else {
      uint64_t v15 = (std::string *)v16.__r_.__value_.__r.__words[0];
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The output must have 'lpcm' format, but has %s instead.", v14, v15);
  }
  return result;
}

void sub_248933F90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (*(char *)(v28 - 17) < 0) {
    operator delete(*(void **)(v28 - 40));
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::ArithmeticAbsBox::process(AudioDSPGraph::ArithmeticAbsBox *this, unsigned int a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in(this, 0);
  uint64_t v5 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
  unsigned int v7 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  if (*v5 != *v7)
  {
    std::string::basic_string[abi:ne180100]<0>(&__A, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(v40, "process");
    uint64_t v33 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v34 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v33 + 40))(v33) + 120) + 28);
    uint64_t v35 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v36 = (*(uint64_t (**)(uint64_t))(*(void *)v35 + 40))(v35);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The input and output must have the same channel count, but have %u and %u.", v37, v34, *(unsigned int *)(*(void *)(v36 + 120) + 28));
  }
  uint64_t v8 = AudioDSPGraph::Box::in(this, 0);
  int v9 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 8);
  char v10 = 2;
  if (v9 == 1718773105) {
    char v10 = 3;
  }
  unint64_t v11 = (unint64_t)a2 << v10;
  if (v11 > v5[3])
  {
    std::string::basic_string[abi:ne180100]<0>(&__A, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(v40, "process");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for input 0 should be at least %u bytes, but is %u.", v38, v11, v5[3]);
  }
  int v12 = 4 * a2;
  if (4 * (unint64_t)a2 > v7[3])
  {
    std::string::basic_string[abi:ne180100]<0>(&__A, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(v40, "process");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The buffer passed for output 0 should be at least %u bytes, but is %u.", v39, 4 * a2, v7[3]);
  }
  int v13 = *v7;
  if (v9 == 1718773105)
  {
    if (v13)
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      std::string v16 = v5 + 4;
      do
      {
        __A.realp = *(float **)&v16[v14];
        __A.imagp = &__A.realp[a2];
        vDSP_zvabs(&__A, 1, *(float **)&v7[v14 + 4], 1, a2);
        v7[v14 + 3] = v12;
        ++v15;
        v14 += 4;
      }
      while (v15 < *v7);
    }
  }
  else if (v13)
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    uint64_t v19 = v5 + 4;
    do
    {
      vDSP_vabs(*(const float **)&v19[v17], 1, *(float **)&v7[v17 + 4], 1, a2);
      v7[v17 + 3] = v12;
      ++v18;
      v17 += 4;
    }
    while (v18 < *v7);
  }
  uint64_t v20 = AudioDSPGraph::Box::in(this, 0);
  int v21 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20) + 56) + 72);
  uint64_t v22 = AudioDSPGraph::Box::in(this, 0);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22);
  uint64_t v25 = *((void *)this + 11);
  unint64_t v24 = (void *)*((void *)this + 12);
  if ((void *)v25 != v24)
  {
    uint64_t v26 = (_OWORD *)(result[7] + 8);
    uint64_t result = (void *)v25;
    uint64_t v27 = (void *)v25;
    do
    {
      uint64_t v28 = *v27;
      v27 += 4;
      uint64_t v29 = *(void *)((*(uint64_t (**)(void *))(v28 + 40))(result) + 56);
      long long v31 = v26[2];
      long long v30 = v26[3];
      long long v32 = v26[1];
      *(_OWORD *)(v29 + 8) = *v26;
      *(_OWORD *)(v29 + 24) = v32;
      *(_OWORD *)(v29 + 40) = v31;
      *(_OWORD *)(v29 + 56) = v30;
      *(_DWORD *)(v29 + 72) = v21;
      v25 += 32;
      uint64_t result = v27;
    }
    while (v27 != v24);
  }
  return result;
}

void sub_248934440(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

double AudioDSPGraph::ArithmeticAbsBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.22205774e161;
  *(_OWORD *)a1 = xmmword_24893BD90;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ArithmeticAbsBox::ClassName(AudioDSPGraph::ArithmeticAbsBox *this)
{
  return "aabs";
}

void AudioDSPGraph::ArithmeticAbsBox::~ArithmeticAbsBox(AudioDSPGraph::ArithmeticAbsBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

void AudioDSPGraph::VectorGainBox::initialize(AudioDSPGraph::VectorGainBox *this)
{
  AudioDSPGraph::Box::initialize(this);
  if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) != 0x20
    || ((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0x20)
  {
    std::string::basic_string[abi:ne180100]<0>(&v70, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&__p, "initialize");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"There must be one input and output, instead of %u and %u.", v55, (*((void *)this + 9) - *((void *)this + 8)) >> 5, (*((void *)this + 12) - *((void *)this + 11)) >> 5);
  }
  uint64_t v2 = AudioDSPGraph::Box::in(this, 0);
  int v3 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  if (v3 != *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 28))
  {
    std::string::basic_string[abi:ne180100]<0>(&v70, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&__p, "initialize");
    uint64_t v62 = AudioDSPGraph::Box::in(this, 0);
    uint64_t v63 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v62 + 40))(v62) + 120) + 28);
    uint64_t v64 = AudioDSPGraph::Box::out(this, 0);
    uint64_t v65 = (*(uint64_t (**)(uint64_t))(*(void *)v64 + 40))(v64);
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The input and output ports must have the same number of channels, but have %u and %u.", v66, v63, *(unsigned int *)(*(void *)(v65 + 120) + 28));
  }
  uint64_t v5 = AudioDSPGraph::Box::in(this, 0);
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 8) != 1718773105
    || (uint64_t v6 = AudioDSPGraph::Box::out(this, 0),
        *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120) + 8) != 1718773105))
  {
    std::string::basic_string[abi:ne180100]<0>(&v70, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&__p, "initialize");
    uint64_t v56 = AudioDSPGraph::Box::in(this, 0);
    int v57 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v56 + 40))(v56) + 120) + 8);
    uint64_t v58 = AudioDSPGraph::Box::out(this, 0);
    if (v57 == 1718773105) {
      uint64_t v59 = "freq";
    }
    else {
      uint64_t v59 = "time";
    }
    if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v58 + 40))(v58) + 120) + 8) == 1718773105) {
      uint64_t v61 = "freq";
    }
    else {
      uint64_t v61 = "time";
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"The input and output must both be frequency-domain, but are '%s' and '%s'", v60, v59, v61);
  }
  uint64_t v7 = AudioDSPGraph::Box::in(this, 0);
  unint64_t v8 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 40);
  *((_DWORD *)this + 193) = v8;
  unint64_t v9 = *((unsigned int *)this + 194);
  v67[0] = 1065353216;
  std::vector<float>::vector(&__p, v8, v67);
  char v10 = (void *)*((void *)this + 102);
  uint64_t v11 = *((void *)this + 101);
  unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v10 - v11) >> 3);
  unint64_t v13 = v9 - v12;
  if (v9 <= v12)
  {
    if (v9 < v12)
    {
      uint64_t v28 = (void *)(v11 + 24 * v9);
      if (v10 != v28)
      {
        uint64_t v29 = (void *)*((void *)this + 102);
        do
        {
          long long v31 = (void *)*(v29 - 3);
          v29 -= 3;
          long long v30 = v31;
          if (v31)
          {
            *(v10 - 2) = v30;
            operator delete(v30);
          }
          char v10 = v29;
        }
        while (v29 != v28);
      }
      *((void *)this + 102) = v28;
    }
  }
  else
  {
    uint64_t v14 = *((void *)this + 103);
    if (0xAAAAAAAAAAAAAAABLL * ((v14 - (uint64_t)v10) >> 3) >= v13)
    {
      long long v32 = &v10[3 * v13];
      uint64_t v33 = 24 * v9 - 8 * (((uint64_t)v10 - v11) >> 3);
      do
      {
        void *v10 = 0;
        v10[1] = 0;
        v10[2] = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v10, __p, (uint64_t)v69, (v69 - (unsigned char *)__p) >> 2);
        v10 += 3;
        v33 -= 24;
      }
      while (v33);
      *((void *)this + 102) = v32;
    }
    else
    {
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v11) >> 3);
      uint64_t v16 = 2 * v15;
      if (2 * v15 <= v9) {
        uint64_t v16 = v9;
      }
      if (v15 >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v16;
      }
      CFTypeRef v73 = (char *)this + 824;
      if (v17 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v18 = (char *)operator new(24 * v17);
      uint64_t v19 = &v18[24 * v12];
      uint64_t v70 = v18;
      v71.i64[0] = (uint64_t)v19;
      v71.i64[1] = (uint64_t)v19;
      uint64_t v72 = &v18[24 * v17];
      uint64_t v20 = 3 * v9;
      int v21 = &v18[24 * v9];
      uint64_t v22 = 8 * v20 - 24 * v12;
      do
      {
        *(void *)uint64_t v19 = 0;
        *((void *)v19 + 1) = 0;
        *((void *)v19 + 2) = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v19, __p, (uint64_t)v69, (v69 - (unsigned char *)__p) >> 2);
        v19 += 24;
        v22 -= 24;
      }
      while (v22);
      v71.i64[1] = (uint64_t)v21;
      uint64_t v23 = (void *)*((void *)this + 102);
      unint64_t v24 = (void *)*((void *)this + 101);
      uint64_t v25 = v71.i64[0];
      if (v23 == v24)
      {
        int64x2_t v27 = vdupq_n_s64((unint64_t)v23);
      }
      else
      {
        do
        {
          *(void *)(v25 - 24) = 0;
          *(void *)(v25 - 16) = 0;
          v25 -= 24;
          *(void *)(v25 + 16) = 0;
          long long v26 = *(_OWORD *)(v23 - 3);
          v23 -= 3;
          *(_OWORD *)uint64_t v25 = v26;
          *(void *)(v25 + 16) = v23[2];
          *uint64_t v23 = 0;
          v23[1] = 0;
          v23[2] = 0;
        }
        while (v23 != v24);
        int64x2_t v27 = *(int64x2_t *)((char *)this + 808);
        int v21 = (char *)v71.i64[1];
      }
      *((void *)this + 101) = v25;
      *((void *)this + 102) = v21;
      int64x2_t v71 = v27;
      uint64_t v34 = (char *)*((void *)this + 103);
      *((void *)this + 103) = v72;
      uint64_t v72 = v34;
      uint64_t v70 = (char *)v27.i64[0];
      std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)&v70);
    }
  }
  if (__p)
  {
    CFNumberRef v69 = __p;
    operator delete(__p);
  }
  unint64_t v35 = *((unsigned int *)this + 193);
  uint64_t v36 = (_DWORD *)*((void *)this + 99);
  uint64_t v37 = *((void *)this + 98);
  unint64_t v38 = ((uint64_t)v36 - v37) >> 2;
  if (v35 <= v38)
  {
    if (v35 < v38) {
      *((void *)this + 99) = v37 + 4 * v35;
    }
  }
  else
  {
    uint64_t v39 = *((void *)this + 100);
    if (v35 - v38 <= (v39 - (uint64_t)v36) >> 2)
    {
      int v53 = &v36[v35 - v38];
      uint64_t v54 = 4 * v35 - 4 * v38;
      do
      {
        *v36++ = 1065353216;
        v54 -= 4;
      }
      while (v54);
      *((void *)this + 99) = v53;
    }
    else
    {
      unint64_t v40 = v39 - v37;
      unint64_t v41 = (v39 - v37) >> 1;
      if (v41 <= v35) {
        unint64_t v41 = *((unsigned int *)this + 193);
      }
      if (v40 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v42 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v42 = v41;
      }
      long long v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v42);
      int v45 = &v43[4 * v38];
      long long v46 = &v43[4 * v35];
      uint64_t v47 = 4 * v35 - 4 * v38;
      uint64_t v48 = v45;
      do
      {
        *(_DWORD *)uint64_t v48 = 1065353216;
        v48 += 4;
        v47 -= 4;
      }
      while (v47);
      long long v49 = &v43[4 * v44];
      long long v50 = (char *)*((void *)this + 99);
      uint64_t v51 = (char *)*((void *)this + 98);
      while (v50 != v51)
      {
        int v52 = *((_DWORD *)v50 - 1);
        v50 -= 4;
        *((_DWORD *)v45 - 1) = v52;
        v45 -= 4;
      }
      *((void *)this + 98) = v45;
      *((void *)this + 99) = v46;
      *((void *)this + 100) = v49;
      if (v51) {
        operator delete(v51);
      }
    }
  }
}

void sub_248934BA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
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

void sub_248934CA0(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
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

uint64_t AudioDSPGraph::VectorGainBox::process(float **this, int a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)this, 0);
  uint64_t v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, 0);
  uint64_t v7 = *(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = *v5;
  LODWORD(__A.realp) = 1065353216;
  vDSP_vfill((const float *)&__A, this[98], 1, this[99] - this[98]);
  unint64_t v9 = (const float **)this[101];
  char v10 = (const float **)this[102];
  while (v9 != v10)
  {
    uint64_t v11 = *v9;
    v9 += 3;
    vDSP_vmin(this[98], 1, v11, 1, this[98], 1, this[99] - this[98]);
  }
  if (v8)
  {
    unint64_t v12 = (float **)(v7 + 16);
    unint64_t v13 = (float **)(v5 + 4);
    do
    {
      uint64_t v14 = *v13;
      v13 += 2;
      unint64_t v15 = *v12;
      __A.realp = v14;
      __A.imagp = &v14[a2];
      v27.realp = v15;
      v27.imagp = &v15[a2];
      int v16 = *(_DWORD *)__A.imagp;
      vDSP_zrvmul(&__A, 1, this[98], 1, &v27, 1, this[99] - this[98]);
      *(_DWORD *)v27.imagp = v16;
      *((_DWORD *)v12 - 1) = 8 * a2;
      v12 += 2;
      --v8;
    }
    while (v8);
  }
  uint64_t v17 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)this, 0);
  uint64_t v18 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v17 + 40))(v17) + 56);
  uint64_t v19 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, 0);
  uint64_t v20 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v19 + 40))(v19) + 56);
  long long v21 = *(_OWORD *)(v18 + 56);
  long long v22 = *(_OWORD *)(v18 + 40);
  long long v23 = *(_OWORD *)(v18 + 24);
  *(_OWORD *)(v20 + 8) = *(_OWORD *)(v18 + 8);
  *(_OWORD *)(v20 + 24) = v23;
  *(_OWORD *)(v20 + 40) = v22;
  *(_OWORD *)(v20 + 56) = v21;
  uint64_t v24 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)this, 0);
  LODWORD(v18) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v24 + 40))(v24) + 56) + 72);
  uint64_t v25 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v25 + 40))(v25);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v18;
  return result;
}

uint64_t AudioDSPGraph::VectorGainBox::hasPresetData(AudioDSPGraph::VectorGainBox *this)
{
  return 0;
}

uint64_t AudioDSPGraph::VectorGainBox::setProperty(AudioDSPGraph::VectorGainBox *this, int a2, int a3, unsigned int a4, unsigned int a5, _DWORD *a6)
{
  if (!(a4 | a3 | (a2 - 100)))
  {
    if (*(unsigned char *)(*((void *)this + 1) + 730)) {
      return 4294956447;
    }
    if (a5 == 4)
    {
      uint64_t v8 = 0;
      *((_DWORD *)this + 194) = *a6;
      return v8;
    }
    return 4294956445;
  }
  if (a2 != 100 && !(a4 | a3) && (a2 - 100) <= *((_DWORD *)this + 194))
  {
    unint64_t v9 = a5 >> 2;
    if (v9 == *((_DWORD *)this + 193))
    {
      unsigned int v10 = a2 - 101;
      uint64_t v11 = *((void *)this + 101);
      unint64_t v12 = (void **)(v11 + 24 * (a2 - 101));
      uint64_t v13 = (uint64_t)v12[2];
      uint64_t v14 = (char *)*v12;
      if (v9 <= (v13 - (uint64_t)*v12) >> 2)
      {
        uint64_t v23 = v11 + 24 * v10;
        uint64_t v25 = *(char **)(v23 + 8);
        uint64_t v18 = (void **)(v23 + 8);
        uint64_t v24 = v25;
        size_t v26 = v25 - v14;
        unint64_t v27 = (v25 - v14) >> 2;
        if (v27 < v9)
        {
          if (v24 != v14)
          {
            memmove(*v12, a6, v26);
            uint64_t v14 = (char *)*v18;
          }
          size_t v20 = 4 * v9 - 4 * v27;
          if (v27 == v9) {
            goto LABEL_22;
          }
          long long v21 = v14;
          long long v22 = (char *)&a6[v27];
          goto LABEL_21;
        }
        size_t v20 = 4 * v9;
        if (a5 < 4) {
          goto LABEL_22;
        }
      }
      else
      {
        if (v14)
        {
          *(void *)(v11 + 24 * v10 + 8) = v14;
          operator delete(v14);
          uint64_t v13 = 0;
          char *v12 = 0;
          v12[1] = 0;
          void v12[2] = 0;
        }
        uint64_t v15 = v13 >> 1;
        if (v13 >> 1 <= v9) {
          uint64_t v15 = v9;
        }
        if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v15;
        }
        std::vector<float>::__vallocate[abi:ne180100]((void *)(v11 + 24 * v10), v16);
        uint64_t v17 = v11 + 24 * v10;
        uint64_t v19 = *(char **)(v17 + 8);
        uint64_t v18 = (void **)(v17 + 8);
        uint64_t v14 = v19;
        size_t v20 = 4 * v9;
      }
      long long v21 = v14;
      long long v22 = (char *)a6;
LABEL_21:
      memmove(v21, v22, v20);
LABEL_22:
      uint64_t v8 = 0;
      *uint64_t v18 = &v14[v20];
      return v8;
    }
    return 4294956445;
  }

  return AudioDSPGraph::Box::setProperty(this, a2, a3, a4, a5, a6);
}

uint64_t AudioDSPGraph::VectorGainBox::getProperty(AudioDSPGraph::VectorGainBox *this, int a2, uint64_t a3, uint64_t a4, unsigned int *a5, _DWORD *__dst)
{
  if (!(a4 | a3 | (a2 - 100)))
  {
    if (*a5 == 4)
    {
      if (!__dst) {
        return 4294967246;
      }
      uint64_t v7 = 0;
      *__dst = *((_DWORD *)this + 194);
      return v7;
    }
    return 561211770;
  }
  if (a2 != 100 && !(a4 | a3) && (a2 - 100) <= *((_DWORD *)this + 194))
  {
    if (*a5 == 4 * *((unsigned int *)this + 193))
    {
      if (__dst)
      {
        uint64_t v8 = *((void *)this + 101) + 24 * (a2 - 101);
        unint64_t v9 = *(unsigned char **)v8;
        unsigned int v10 = *(unsigned char **)(v8 + 8);
        if (v10 != v9) {
          memmove(__dst, v9, v10 - v9);
        }
        return 0;
      }
      return 4294967246;
    }
    return 561211770;
  }

  return AudioDSPGraph::Box::getProperty(this, a2, a3, a4, a5, (CFStringRef *)__dst);
}

uint64_t AudioDSPGraph::VectorGainBox::getPropertyInfo(AudioDSPGraph::VectorGainBox *this, int a2, int a3, int a4)
{
  if (a4 | a3 | (a2 - 100))
  {
    if (a2 == 100 || a4 | a3 || (a2 - 100) > *((_DWORD *)this + 194)) {
      return AudioDSPGraph::Box::getPropertyInfo(this, a2, a3);
    }
    else {
      return (4 * *((_DWORD *)this + 193)) | 0x100000000;
    }
  }
  else if (*(unsigned char *)(*((void *)this + 1) + 730))
  {
    return 4;
  }
  else
  {
    return 0x100000004;
  }
}

double AudioDSPGraph::VectorGainBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.90940534e262;
  *(_OWORD *)a1 = xmmword_24893BDA0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t AudioDSPGraph::VectorGainBox::canProcessInPlace(AudioDSPGraph::VectorGainBox *this)
{
  return 1;
}

const char *AudioDSPGraph::VectorGainBox::ClassName(AudioDSPGraph::VectorGainBox *this)
{
  return "VectorGainBox";
}

void AudioDSPGraph::VectorGainBox::~VectorGainBox(AudioDSPGraph::VectorGainBox *this)
{
  *(void *)this = &unk_26FC9E188;
  uint64_t v3 = (void **)((char *)this + 808);
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = (void *)*((void *)this + 98);
  if (v2)
  {
    *((void *)this + 99) = v2;
    operator delete(v2);
  }
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  void *v2;
  void **v3;
  uint64_t vars8;

  *(void *)this = &unk_26FC9E188;
  uint64_t v3 = (void **)((char *)this + 808);
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = (void *)*((void *)this + 98);
  if (v2)
  {
    *((void *)this + 99) = v2;
    operator delete(v2);
  }

  AudioDSPGraph::Box::~Box(this);
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (char *)v1[1];
      do
      {
        uint64_t v8 = (void *)*((void *)v6 - 3);
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

uint64_t AudioDSPGraph::SumBox::initialize(AudioDSPGraph::SumBox *this)
{
  if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v17, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v16, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v15, "SumBox has no inputs");
    AudioDSPGraph::ThrowException(1970168609, &v17, 2923, &v16, &v15);
  }
  AudioDSPGraph::Box::initialize(this);
  uint64_t v2 = AudioDSPGraph::Box::out(this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2);
  uint64_t v4 = *(_DWORD **)(result + 120);
  int v5 = v4[2];
  if (v5 == 1819304813)
  {
    int v6 = v4[3];
    if ((v6 & 1) == 0 || v4[8] != 32) {
      goto LABEL_28;
    }
  }
  else
  {
    if (v5 != 1718773105 || v4[8] != 64)
    {
LABEL_28:
      std::string::basic_string[abi:ne180100]<0>(&v17, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v16, "initialize");
      std::string::basic_string[abi:ne180100]<0>(&v15, "SumBox output format must be non-interleaved float");
      AudioDSPGraph::ThrowException(1718449215, &v17, 2931, &v16, &v15);
    }
    int v6 = v4[3];
  }
  if ((v6 & 0x20) == 0) {
    goto LABEL_28;
  }
  uint64_t v7 = *((void *)this + 8);
  uint64_t v8 = *((void *)this + 9);
  if (v7 != v8)
  {
    uint64_t v9 = *((void *)this + 8);
    do
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9);
      unsigned int v10 = *(_DWORD **)(result + 120);
      int v11 = v10[2];
      if (v11 == 1819304813)
      {
        int v12 = v10[3];
        if ((v12 & 1) == 0 || v10[8] != 32) {
          goto LABEL_25;
        }
      }
      else
      {
        if (v11 != 1718773105 || v10[8] != 64)
        {
LABEL_25:
          std::string::basic_string[abi:ne180100]<0>(&v17, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v16, "initialize");
          std::string::basic_string[abi:ne180100]<0>(&v15, "SumBox input format must be non-interleaved float");
          AudioDSPGraph::ThrowException(1718449215, &v17, 2937, &v16, &v15);
        }
        int v12 = v10[3];
      }
      if ((v12 & 0x20) == 0) {
        goto LABEL_25;
      }
      int v13 = v10[7];
      int v14 = v4[7];
      if (v13 != v14)
      {
        if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) != 0x20)
        {
          std::string::basic_string[abi:ne180100]<0>(&v17, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v16, "initialize");
          std::string::basic_string[abi:ne180100]<0>(&v15, "SumBox channel mismatch");
          AudioDSPGraph::ThrowException(1718449215, &v17, 2946, &v16, &v15);
        }
        if (v14 != 1)
        {
          std::string::basic_string[abi:ne180100]<0>(&v17, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v16, "initialize");
          std::string::basic_string[abi:ne180100]<0>(&v15, "SumBox output channel count must be mono or matched when input is single-bus");
          AudioDSPGraph::ThrowException(1718449215, &v17, 2943, &v16, &v15);
        }
      }
      v9 += 32;
      v7 += 32;
    }
    while (v9 != v8);
  }
  return result;
}

void sub_24893579C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::SumBox::process(AudioDSPGraph::SumBox *this, unsigned int a2)
{
  uint64_t v3 = this;
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
  int v6 = *(unsigned int **)(*(void *)(v5 + 56) + 80);
  uint64_t v7 = *v6;
  int v8 = 4 * a2;
  uint64_t v9 = (*((void *)v3 + 9) - *((void *)v3 + 8)) & 0x1FFFFFFFE0;
  if (!v9) {
    goto LABEL_26;
  }
  uint64_t v10 = 0;
  BOOL v11 = v9 == 32 && v7 == 1;
  uint64_t v12 = !v11;
  unint64_t v42 = *(unsigned int **)(*(void *)(v5 + 56) + 80);
  long long v43 = v3;
  uint64_t v44 = *v6;
  int v45 = (void **)(v6 + 4);
  LOBYTE(v13) = 1;
  do
  {
    uint64_t v14 = AudioDSPGraph::Box::in(v3, v10);
    long long v15 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v14 + 40))(v14) + 56) + 80);
    uint64_t v16 = AudioDSPGraph::Box::in(v3, v10);
    if ((*(unsigned char *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16) + 56) + 72) & 0x10) == 0)
    {
      if (v13)
      {
        if (*v15)
        {
          unint64_t v17 = 0;
          uint64_t v18 = 0;
          uint64_t v19 = v45;
          uint64_t v20 = 4;
          do
          {
            long long v21 = *(const void **)&v15[v20];
            long long v22 = *v19;
            *((_DWORD *)v19 - 1) = v8;
            if (v18 == v17)
            {
              if (v21 != v22) {
                memcpy(v22, v21, 4 * a2);
              }
            }
            else
            {
              vDSP_vadd((const float *)v21, 1, (const float *)v22, 1, (float *)v22, 1, a2);
            }
            ++v17;
            v18 += v12;
            v20 += 4;
            v19 += 2 * v12;
          }
          while (v17 < *v15);
          LOBYTE(v13) = 0;
          uint64_t v3 = v43;
        }
        else
        {
          LOBYTE(v13) = 0;
        }
      }
      else
      {
        uint64_t v13 = v44;
        if (v44)
        {
          uint64_t v23 = (const float **)(v15 + 4);
          uint64_t v24 = (float **)v45;
          do
          {
            uint64_t v25 = *v23;
            v23 += 2;
            size_t v26 = *v24;
            *((_DWORD *)v24 - 1) = v8;
            vDSP_vadd(v25, 1, v26, 1, v26, 1, a2);
            v24 += 2;
            --v13;
          }
          while (v13);
        }
      }
    }
    uint64_t v10 = (v10 + 1);
  }
  while (v10 < ((*((void *)v3 + 9) - *((void *)v3 + 8)) >> 5));
  uint64_t v7 = v44;
  int v6 = v42;
  if ((v13 & 1) == 0)
  {
    int v30 = 0;
  }
  else
  {
LABEL_26:
    uint64_t v27 = v7;
    if (v7)
    {
      uint64_t v28 = (void **)(v6 + 4);
      do
      {
        uint64_t v29 = *v28;
        *((_DWORD *)v28 - 1) = v8;
        bzero(v29, 4 * a2);
        v28 += 2;
        --v27;
      }
      while (v27);
    }
    int v30 = 16;
  }
  uint64_t v31 = AudioDSPGraph::Box::in(v3, 0);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31);
  uint64_t v33 = (void *)*((void *)v3 + 11);
  uint64_t v34 = (void *)*((void *)v3 + 12);
  if (v33 != v34)
  {
    unint64_t v35 = (_OWORD *)(result[7] + 8);
    uint64_t result = (void *)*((void *)v3 + 11);
    uint64_t v36 = result;
    do
    {
      uint64_t v37 = *v36;
      v36 += 4;
      uint64_t v38 = *(void *)((*(uint64_t (**)(void *))(v37 + 40))(result) + 56);
      long long v40 = v35[2];
      long long v39 = v35[3];
      long long v41 = v35[1];
      *(_OWORD *)(v38 + 8) = *v35;
      *(_OWORD *)(v38 + 24) = v41;
      *(_OWORD *)(v38 + 40) = v40;
      *(_OWORD *)(v38 + 56) = v39;
      *(_DWORD *)(v38 + 72) = v30;
      v33 += 4;
      uint64_t result = v36;
    }
    while (v36 != v34);
  }
  return result;
}

uint64_t AudioDSPGraph::SumBox::hasPresetData(AudioDSPGraph::SumBox *this)
{
  return 0;
}

double AudioDSPGraph::SumBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.49819016e248;
  *(_OWORD *)a1 = xmmword_24893BDD0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::SumBox::ClassName(AudioDSPGraph::SumBox *this)
{
  return "sum";
}

void AudioDSPGraph::SumBox::~SumBox(AudioDSPGraph::SumBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

char *AudioDSPGraph::MixBox::reset(char *this)
{
  uint64_t v1 = this;
  uint64_t v2 = (char *)*((void *)this + 97);
  uint64_t v3 = (unsigned char *)*((void *)this + 98);
  size_t v4 = v3 - v2;
  unint64_t v5 = (v3 - v2) >> 2;
  uint64_t v6 = *((void *)this + 102);
  uint64_t v7 = (char *)*((void *)this + 100);
  if (v5 > (v6 - (uint64_t)v7) >> 2)
  {
    int v8 = this + 800;
    if (v7)
    {
      *((void *)this + 101) = v7;
      operator delete(v7);
      uint64_t v6 = 0;
      *int v8 = 0;
      v1[101] = 0;
      v1[102] = 0;
    }
    if ((v4 & 0x8000000000000000) != 0) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = v6 >> 1;
    if (v6 >> 1 <= v5) {
      uint64_t v9 = (v3 - v2) >> 2;
    }
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v10 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v10 = v9;
    }
    this = std::vector<float>::__vallocate[abi:ne180100](v1 + 100, v10);
    BOOL v11 = (void **)(v1 + 101);
    uint64_t v7 = (char *)v1[101];
LABEL_16:
    if (v3 != v2)
    {
      long long v15 = v7;
      uint64_t v16 = v2;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  BOOL v11 = (void **)(this + 808);
  uint64_t v12 = (unsigned char *)*((void *)this + 101);
  unint64_t v13 = (v12 - v7) >> 2;
  if (v13 >= v5) {
    goto LABEL_16;
  }
  uint64_t v14 = &v2[4 * v13];
  if (v12 != v7)
  {
    this = (char *)memmove(*((void **)this + 100), v2, v12 - v7);
    uint64_t v7 = (char *)*v11;
  }
  size_t v4 = v3 - v14;
  if (v3 != v14)
  {
    long long v15 = v7;
    uint64_t v16 = v14;
LABEL_18:
    this = (char *)memmove(v15, v16, v4);
  }
LABEL_19:
  *BOOL v11 = &v7[v4];
  return this;
}

uint64_t AudioDSPGraph::MixBox::initialize(AudioDSPGraph::MixBox *this)
{
  if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v13, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v12, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v11, "MixBox has no inputs");
    AudioDSPGraph::ThrowException(1970168609, &v13, 3015, &v12, &v11);
  }
  AudioDSPGraph::Box::initialize(this);
  uint64_t v2 = AudioDSPGraph::Box::out(this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2);
  size_t v4 = *(_DWORD **)(result + 120);
  if (v4[2] != 1819304813 || (v4[3] & 1) == 0 || (v4[8] == 32 ? (BOOL v5 = (v4[3] & 0x20) == 0) : (BOOL v5 = 1), v5))
  {
    std::string::basic_string[abi:ne180100]<0>(&v13, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v12, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v11, "MixBox output format must be non-interleaved float");
    AudioDSPGraph::ThrowException(1718449215, &v13, 3024, &v12, &v11);
  }
  uint64_t v6 = *((void *)this + 8);
  uint64_t v7 = *((void *)this + 9);
  if (v6 != v7)
  {
    uint64_t v8 = *((void *)this + 8);
    do
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8);
      uint64_t v9 = *(_DWORD **)(result + 120);
      if (v9[2] != 1819304813 || (v9[3] & 1) == 0 || (v9[8] == 32 ? (BOOL v10 = (v9[3] & 0x20) == 0) : (BOOL v10 = 1), v10))
      {
        std::string::basic_string[abi:ne180100]<0>(&v13, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v12, "initialize");
        std::string::basic_string[abi:ne180100]<0>(&v11, "MixBox input format must be non-interleaved float");
        AudioDSPGraph::ThrowException(1718449215, &v13, 3031, &v12, &v11);
      }
      if (v9[7] != v4[7])
      {
        std::string::basic_string[abi:ne180100]<0>(&v13, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v12, "initialize");
        std::string::basic_string[abi:ne180100]<0>(&v11, "MixBox channel mismatch");
        AudioDSPGraph::ThrowException(1718449215, &v13, 3036, &v12, &v11);
      }
      v8 += 32;
      v6 += 32;
    }
    while (v8 != v7);
  }
  return result;
}

void sub_248935F0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::MixBox::process(AudioDSPGraph::MixBox *this, unsigned int a2)
{
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  BOOL v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = *v5;
  int v7 = 4 * a2;
  if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) == 0) {
    goto LABEL_26;
  }
  unint64_t v8 = 0;
  float v9 = (float)a2;
  char v10 = 1;
  do
  {
    uint64_t v11 = AudioDSPGraph::Box::in(this, v8);
    uint64_t v12 = *(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v11 + 40))(v11) + 56) + 80);
    float __B = 0.0;
    float __B = *(float *)(*((void *)this + 97) + 4 * v8);
    float __Start = 0.0;
    float __Start = *(float *)(*((void *)this + 100) + 4 * v8);
    uint64_t v13 = AudioDSPGraph::Box::in(this, v8);
    if ((*(unsigned char *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v13 + 40))(v13) + 56) + 72) & 0x10) == 0
      && __B != 0.0)
    {
      if (v10)
      {
        if (__B == __Start)
        {
          if (v6)
          {
            uint64_t v14 = (const float **)(v12 + 16);
            long long v15 = (float **)(v5 + 4);
            uint64_t v16 = v6;
            do
            {
              unint64_t v17 = *v14;
              v14 += 2;
              uint64_t v18 = *v15;
              *((_DWORD *)v15 - 1) = v7;
              vDSP_vsmul(v17, 1, &__B, v18, 1, a2);
              v15 += 2;
              --v16;
            }
            while (v16);
          }
        }
        else
        {
          float __Step = (float)(__B - __Start) / v9;
          if (v6)
          {
            uint64_t v24 = (const float **)(v12 + 16);
            uint64_t v25 = (float **)(v5 + 4);
            uint64_t v26 = v6;
            do
            {
              uint64_t v27 = *v24;
              v24 += 2;
              uint64_t v28 = *v25;
              *((_DWORD *)v25 - 1) = v7;
              vDSP_vrampmul(v27, 1, &__Start, &__Step, v28, 1, a2);
              v25 += 2;
              --v26;
            }
            while (v26);
          }
        }
      }
      else if (__B == __Start)
      {
        if (v6)
        {
          uint64_t v19 = (const float **)(v12 + 16);
          uint64_t v20 = (float **)(v5 + 4);
          uint64_t v21 = v6;
          do
          {
            long long v22 = *v19;
            v19 += 2;
            uint64_t v23 = *v20;
            *((_DWORD *)v20 - 1) = v7;
            vDSP_vsma(v22, 1, &__B, v23, 1, v23, 1, a2);
            v20 += 2;
            --v21;
          }
          while (v21);
        }
      }
      else
      {
        float __Step = (float)(__B - __Start) / v9;
        if (v6)
        {
          uint64_t v29 = (const float **)(v12 + 16);
          int v30 = (float **)(v5 + 4);
          uint64_t v31 = v6;
          do
          {
            long long v32 = *v29;
            v29 += 2;
            uint64_t v33 = *v30;
            *((_DWORD *)v30 - 1) = v7;
            vDSP_vrampmuladd(v32, 1, &__Start, &__Step, v33, 1, a2);
            v30 += 2;
            --v31;
          }
          while (v31);
        }
      }
      char v10 = 0;
    }
    *(float *)(*((void *)this + 100) + 4 * v8++) = __B;
  }
  while (v8 < ((*((void *)this + 9) - *((void *)this + 8)) >> 5));
  if ((v10 & 1) == 0)
  {
    int v36 = 0;
  }
  else
  {
LABEL_26:
    if (v6)
    {
      uint64_t v34 = (void **)(v5 + 4);
      do
      {
        unint64_t v35 = *v34;
        *((_DWORD *)v34 - 1) = v7;
        bzero(v35, 4 * a2);
        v34 += 2;
        --v6;
      }
      while (v6);
    }
    int v36 = 16;
  }
  uint64_t v37 = AudioDSPGraph::Box::in(this, 0);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v37 + 40))(v37);
  uint64_t v40 = *((void *)this + 11);
  long long v39 = (void *)*((void *)this + 12);
  if ((void *)v40 != v39)
  {
    long long v41 = (_OWORD *)(result[7] + 8);
    uint64_t result = (void *)v40;
    unint64_t v42 = (void *)v40;
    do
    {
      uint64_t v43 = *v42;
      v42 += 4;
      uint64_t v44 = *(void *)((*(uint64_t (**)(void *))(v43 + 40))(result) + 56);
      long long v46 = v41[2];
      long long v45 = v41[3];
      long long v47 = v41[1];
      *(_OWORD *)(v44 + 8) = *v41;
      *(_OWORD *)(v44 + 24) = v47;
      *(_OWORD *)(v44 + 40) = v46;
      *(_OWORD *)(v44 + 56) = v45;
      *(_DWORD *)(v44 + 72) = v36;
      v40 += 32;
      uint64_t result = v42;
    }
    while (v42 != v39);
  }
  return result;
}

double AudioDSPGraph::MixBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.1238952e219;
  *(_OWORD *)a1 = xmmword_24893BDE0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

__n128 AudioDSPGraph::MixBox::getParameterInfo@<Q0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1 == 1)
  {
    if (!a2)
    {
      uint64_t v15 = 0;
      long long v13 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      v14.n128_u32[0] = 14;
      *(unint64_t *)((char *)v14.n128_u64 + 4) = 0x40000000C0000000;
      v14.n128_u32[3] = 1065353216;
      strlcpy((char *)&v9, "gain", 0x34uLL);
      *((void *)&v13 + 1) = @"gain";
      LODWORD(v15) = v15 | 0xC8000000;
      long long v6 = v10;
      *(_OWORD *)a3 = v9;
      *(_OWORD *)(a3 + 16) = v6;
      long long v7 = v12;
      *(_OWORD *)(a3 + 32) = v11;
      *(_OWORD *)(a3 + 48) = v7;
      __n128 result = v14;
      *(_OWORD *)(a3 + 64) = v13;
      *(__n128 *)(a3 + 80) = result;
      *(void *)(a3 + 96) = v15;
      *(unsigned char *)(a3 + 104) = 1;
      return result;
    }
    int v5 = -10878;
  }
  else
  {
    int v5 = -10866;
  }
  *(_DWORD *)a3 = v5;
  *(unsigned char *)(a3 + 104) = 0;
  return result;
}

void sub_248936418(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void AudioDSPGraph::MixBox::getParameterList(int a1@<W1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (a1 == 1)
  {
    uint64_t v4 = operator new(4uLL);
    *a2 = v4;
    *v4++ = 0;
    a2[1] = v4;
    a2[2] = v4;
  }
}

float AudioDSPGraph::MixBox::getParameter(AudioDSPGraph::MixBox *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4 = *((void *)this + 97);
  if (a4 >= (unint64_t)((*((void *)this + 98) - v4) >> 2))
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, "MixBox::getParameter");
    AudioDSPGraph::ThrowException(1919837985, &v8, 3062, &v7, &v6);
  }
  return *(float *)(v4 + 4 * a4);
}

void sub_2489364F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void *AudioDSPGraph::MixBox::setParameter(void *this, unsigned int a2, unsigned int a3, unsigned int a4, float a5)
{
  uint64_t v5 = this[97];
  if (a4 >= (unint64_t)((this[98] - v5) >> 2))
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v7, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(&v6, "MixBox::setParameter");
    AudioDSPGraph::ThrowException(1919837985, &v8, 3047, &v7, &v6);
  }
  *(float *)(v5 + 4 * a4) = a5;
  if (!*(unsigned char *)(this[1] + 730)) {
    *(float *)(this[100] + 4 * a4) = a5;
  }
  return this;
}

void sub_2489365E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

const char *AudioDSPGraph::MixBox::ClassName(AudioDSPGraph::MixBox *this)
{
  return "mix";
}

void AudioDSPGraph::MixBox::~MixBox(AudioDSPGraph::MixBox *this)
{
  *(void *)this = &unk_26FC9E6A8;
  uint64_t v2 = (void *)*((void *)this + 100);
  if (v2)
  {
    *((void *)this + 101) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 97);
  if (v3)
  {
    *((void *)this + 98) = v3;
    operator delete(v3);
  }
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

{
  void *v2;
  void *v3;
  uint64_t vars8;

  *(void *)this = &unk_26FC9E6A8;
  uint64_t v2 = (void *)*((void *)this + 100);
  if (v2)
  {
    *((void *)this + 101) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 97);
  if (v3)
  {
    *((void *)this + 98) = v3;
    operator delete(v3);
  }

  AudioDSPGraph::Box::~Box(this);
}

uint64_t AudioDSPGraph::ChannelJoinerBox::initialize(AudioDSPGraph::ChannelJoinerBox *this)
{
  AudioDSPGraph::Box::initialize(this);
  uint64_t v2 = AudioDSPGraph::Box::out(this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2);
  uint64_t v4 = *(_DWORD **)(result + 120);
  int v5 = v4[3];
  if ((v5 & 0x20) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v16, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v15, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v14, "ChannelJoinerBox output format must be de-interleaved");
    AudioDSPGraph::ThrowException(1718449215, &v16, 3367, &v15, &v14);
  }
  int v6 = v4[2];
  if (v6 == 1819304813)
  {
    if ((v5 & 1) == 0 || v4[8] != 32) {
      goto LABEL_30;
    }
  }
  else if (v6 != 1718773105 || v4[8] != 64)
  {
LABEL_30:
    std::string::basic_string[abi:ne180100]<0>(&v16, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v15, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v14, "ChannelJoinerBox output format must be 32-bit floating-point PCM or 'freq'");
    AudioDSPGraph::ThrowException(1718449215, &v16, 3371, &v15, &v14);
  }
  if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v7 = 0;
    LODWORD(v8) = 0;
    while (1)
    {
      uint64_t v9 = AudioDSPGraph::Box::in(this, v7);
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9);
      long long v10 = *(_DWORD **)(result + 120);
      int v11 = v10[3];
      if ((v11 & 0x20) == 0)
      {
        std::string::basic_string[abi:ne180100]<0>(&v16, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v15, "initialize");
        std::string::basic_string[abi:ne180100]<0>(&v14, "ChannelJoinerBox input format must be de-interleaved");
        AudioDSPGraph::ThrowException(1718449215, &v16, 3380, &v15, &v14);
      }
      int v12 = v10[2];
      if (v12 == 1819304813)
      {
        if ((v11 & 1) == 0 || v10[8] != 32) {
          goto LABEL_28;
        }
        if (v4[2] == 1718773105 && v4[8] == 64) {
          goto LABEL_27;
        }
      }
      else
      {
        if (v12 != 1718773105 || v10[8] != 64)
        {
LABEL_28:
          std::string::basic_string[abi:ne180100]<0>(&v16, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v15, "initialize");
          std::string::basic_string[abi:ne180100]<0>(&v14, "ChannelJoinerBox input format must be 32-bit floating-point PCM or 'freq'");
          AudioDSPGraph::ThrowException(1718449215, &v16, 3384, &v15, &v14);
        }
        if (v4[2] != 1718773105 || v4[8] != 64)
        {
LABEL_27:
          std::string::basic_string[abi:ne180100]<0>(&v16, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v15, "initialize");
          std::string::basic_string[abi:ne180100]<0>(&v14, "ChannelJoinerBox input and output formats must be compatible");
          AudioDSPGraph::ThrowException(1718449215, &v16, 3389, &v15, &v14);
        }
      }
      uint64_t v8 = (v10[7] + v8);
      uint64_t v7 = (v7 + 1);
      if (v7 >= ((*((void *)this + 9) - *((void *)this + 8)) >> 5)) {
        goto LABEL_24;
      }
    }
  }
  uint64_t v8 = 0;
LABEL_24:
  if (v4[7] != v8)
  {
    std::string::basic_string[abi:ne180100]<0>(&v16, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v15, "initialize");
    AudioDSPGraph::strprintf((AudioDSPGraph *)"ChannelJoinerBox channel mismatch: can't join %u input channels into %u output channels", v13, v8, v4[7]);
  }
  return result;
}

void sub_248936AC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::ChannelJoinerBox::process(AudioDSPGraph::ChannelJoinerBox *this, unsigned int a2)
{
  uint64_t v3 = this;
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  int v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::out(v3, 0);
  char v7 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120) + 8) == 1718773105;
  if (((*((void *)v3 + 9) - *((void *)v3 + 8)) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    size_t v10 = (4 * a2) << v7;
    long long v32 = v3;
    LOBYTE(v11) = 1;
    do
    {
      uint64_t v12 = AudioDSPGraph::Box::in(v3, v8);
      uint64_t v13 = *(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12) + 56) + 80);
      uint64_t v14 = AudioDSPGraph::Box::in(v3, v8);
      uint64_t v15 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v14 + 40))(v14) + 120);
      uint64_t v16 = AudioDSPGraph::Box::in(v3, v8);
      int v17 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16) + 56) + 72);
      if (*(_DWORD *)(v15 + 28))
      {
        unint64_t v18 = 0;
        uint64_t v19 = (void **)&v5[4 * v9 + 4];
        uint64_t v20 = (const void **)(v13 + 16);
        do
        {
          if (v9 + v18 >= *v5) {
            __assert_rtn("process", "Box.cpp", 3421, "outBufferIndex < outABL->mNumberBuffers");
          }
          *((_DWORD *)v19 - 1) = v10;
          if ((v17 & 0x10) != 0)
          {
            bzero(*v19, v10);
          }
          else if (*v20 != *v19)
          {
            memcpy(*v19, *v20, v10);
          }
          ++v18;
          v19 += 2;
          v20 += 2;
        }
        while (v18 < *(unsigned int *)(v15 + 28));
        uint64_t v9 = (v9 + v18);
        uint64_t v3 = v32;
      }
      v11 &= (v17 & 0x10) >> 4;
      uint64_t v8 = (v8 + 1);
    }
    while (v8 < ((*((void *)v3 + 9) - *((void *)v3 + 8)) >> 5));
  }
  else
  {
    LOBYTE(v11) = 1;
  }
  uint64_t v21 = AudioDSPGraph::Box::in(v3, 0);
  uint64_t v22 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v21 + 40))(v21) + 56);
  uint64_t v23 = AudioDSPGraph::Box::out(v3, 0);
  uint64_t v24 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v23 + 40))(v23) + 56);
  long long v25 = *(_OWORD *)(v22 + 56);
  long long v26 = *(_OWORD *)(v22 + 40);
  long long v27 = *(_OWORD *)(v22 + 24);
  *(_OWORD *)(v24 + 8) = *(_OWORD *)(v22 + 8);
  *(_OWORD *)(v24 + 24) = v27;
  *(_OWORD *)(v24 + 40) = v26;
  *(_OWORD *)(v24 + 56) = v25;
  uint64_t v28 = AudioDSPGraph::Box::in(v3, 0);
  LODWORD(v22) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v28 + 40))(v28) + 56) + 72);
  uint64_t v29 = AudioDSPGraph::Box::out(v3, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 40))(v29);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v22;
  if ((v11 & 1) == 0)
  {
    uint64_t v31 = AudioDSPGraph::Box::out(v3, 0);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31);
    *(_DWORD *)(*(void *)(result + 56) + 72) &= ~0x10u;
  }
  return result;
}

uint64_t AudioDSPGraph::ChannelJoinerBox::hasPresetData(AudioDSPGraph::ChannelJoinerBox *this)
{
  return 0;
}

double AudioDSPGraph::ChannelJoinerBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 7.37152887e170;
  *(_OWORD *)a1 = xmmword_24893BE50;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ChannelJoinerBox::ClassName(AudioDSPGraph::ChannelJoinerBox *this)
{
  return "ChannelJoiner";
}

void AudioDSPGraph::ChannelJoinerBox::~ChannelJoinerBox(AudioDSPGraph::ChannelJoinerBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

uint64_t AudioDSPGraph::ChannelSplitterBox::initialize(AudioDSPGraph::ChannelSplitterBox *this)
{
  AudioDSPGraph::Box::initialize(this);
  uint64_t v2 = AudioDSPGraph::Box::in(this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2);
  uint64_t v4 = *(_DWORD **)(result + 120);
  uint64_t v5 = v4[7];
  uint64_t v7 = *((void *)this + 11);
  uint64_t v6 = *((void *)this + 12);
  if (((v6 - v7) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v8 = 0;
    LODWORD(v9) = 0;
    do
    {
      uint64_t v10 = AudioDSPGraph::Box::out(this, v8);
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10);
      uint64_t v9 = (*(_DWORD *)(*(void *)(result + 120) + 28) + v9);
      uint64_t v8 = (v8 + 1);
      uint64_t v7 = *((void *)this + 11);
      uint64_t v6 = *((void *)this + 12);
    }
    while (v8 < ((unint64_t)(v6 - v7) >> 5));
  }
  else
  {
    uint64_t v9 = 0;
  }
  int v11 = v4[2];
  if (v11 == 1819304813)
  {
    int v12 = v4[3];
    if ((v12 & 1) == 0) {
      goto LABEL_50;
    }
    int v13 = v4[8];
    if (v13 != 32) {
      goto LABEL_50;
    }
  }
  else
  {
    if (v11 != 1718773105 || (int v13 = v4[8], v13 != 64))
    {
LABEL_50:
      std::string::basic_string[abi:ne180100]<0>(&v37, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v36, "initialize");
      std::string::basic_string[abi:ne180100]<0>(&v35, "ChannelSplitterBox input format must be non-interleaved float");
      AudioDSPGraph::ThrowException(1718449215, &v37, 3465, &v36, &v35);
    }
    int v12 = v4[3];
  }
  if ((v12 & 0x20) == 0) {
    goto LABEL_50;
  }
  if (v5 != v9)
  {
    std::string::basic_string[abi:ne180100]<0>(&v37, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v36, "initialize");
    uint64_t v34 = (void *)((char *)this + 32);
    if (*((char *)this + 55) < 0) {
      uint64_t v34 = (void *)*v34;
    }
    AudioDSPGraph::strprintf((AudioDSPGraph *)"ChannelSplitterBox %s input has %u channels but output has %u channels", v33, v34, v5, v9);
  }
  uint64_t v14 = (v6 - v7) & 0x1FFFFFFFE0;
  if (v14)
  {
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = AudioDSPGraph::Box::out(this, v15);
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16);
      int v17 = *(_DWORD **)(result + 120);
      int v18 = v17[2];
      if (v18 == 1819304813)
      {
        int v19 = v17[3];
        if ((v19 & 1) == 0 || v17[8] != 32) {
          goto LABEL_41;
        }
      }
      else
      {
        if (v18 != 1718773105 || v17[8] != 64)
        {
LABEL_41:
          std::string::basic_string[abi:ne180100]<0>(&v37, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v36, "initialize");
          uint64_t v28 = (void *)((char *)this + 32);
          if (*((char *)this + 55) < 0) {
            uint64_t v28 = (void *)*v28;
          }
          AudioDSPGraph::strprintf((AudioDSPGraph *)"ChannelSplitterBox %s output format must be non-interleaved float in time- of frequency-domain", v27, v28);
        }
        int v19 = v17[3];
      }
      if ((v19 & 0x20) == 0) {
        goto LABEL_41;
      }
      uint64_t v15 = (v15 + 1);
      unint64_t v20 = *((void *)this + 12) - *((void *)this + 11);
    }
    while (v15 < (v20 >> 5));
    int v11 = v4[2];
    int v13 = v4[8];
    uint64_t v14 = v20 & 0x1FFFFFFFE0;
  }
  if (v11 == 1718773105 && v13 == 64)
  {
    if (v14)
    {
      uint64_t v21 = 0;
      do
      {
        uint64_t v22 = AudioDSPGraph::Box::out(this, v21);
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22);
        uint64_t v23 = *(void *)(result + 120);
        if (*(_DWORD *)(v23 + 8) != 1718773105 || *(_DWORD *)(v23 + 32) != 64)
        {
          std::string::basic_string[abi:ne180100]<0>(&v37, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v36, "initialize");
          long long v32 = (void *)((char *)this + 32);
          if (*((char *)this + 55) < 0) {
            long long v32 = (void *)*v32;
          }
          AudioDSPGraph::strprintf((AudioDSPGraph *)"ChannelSplitterBox %s output is in time-domain but input is in frequency-domain", v31, v32);
        }
        uint64_t v21 = (v21 + 1);
      }
      while (v21 < ((*((void *)this + 12) - *((void *)this + 11)) >> 5));
    }
  }
  else if (v14)
  {
    uint64_t v24 = 0;
    do
    {
      uint64_t v25 = AudioDSPGraph::Box::out(this, v24);
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v25 + 40))(v25);
      uint64_t v26 = *(void *)(result + 120);
      if (*(_DWORD *)(v26 + 8) == 1718773105 && *(_DWORD *)(v26 + 32) == 64)
      {
        std::string::basic_string[abi:ne180100]<0>(&v37, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
        std::string::basic_string[abi:ne180100]<0>(&v36, "initialize");
        int v30 = (void *)((char *)this + 32);
        if (*((char *)this + 55) < 0) {
          int v30 = (void *)*v30;
        }
        AudioDSPGraph::strprintf((AudioDSPGraph *)"ChannelSplitterBox %s output is in frequency-domain but input is in time-domain", v29, v30);
      }
      uint64_t v24 = (v24 + 1);
    }
    while (v24 < ((*((void *)this + 12) - *((void *)this + 11)) >> 5));
  }
  return result;
}

void sub_248937410(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::ChannelSplitterBox::process(AudioDSPGraph::ChannelSplitterBox *this, int a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in(this, 0);
  uint64_t v5 = *(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = (*((void *)this + 12) - *((void *)this + 11)) >> 5;
  uint64_t v7 = AudioDSPGraph::Box::in(this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7);
  if (v6)
  {
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    size_t v11 = ((4 * a2) << (*(_DWORD *)(*(void *)(result + 120) + 8) == 1718773105));
    do
    {
      uint64_t v12 = AudioDSPGraph::Box::out(this, v10);
      int v13 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12) + 56) + 80);
      uint64_t v14 = *v13;
      if (v14)
      {
        uint64_t v15 = (void **)(v13 + 4);
        do
        {
          *((_DWORD *)v15 - 1) = v11;
          uint64_t v16 = *(void **)(v5 + 16 * v9 + 16);
          if (v16 != *v15) {
            memcpy(*v15, v16, v11);
          }
          ++v9;
          v15 += 2;
          --v14;
        }
        while (v14);
      }
      uint64_t v17 = AudioDSPGraph::Box::in(this, 0);
      uint64_t v18 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v17 + 40))(v17) + 56);
      uint64_t v19 = AudioDSPGraph::Box::out(this, v10);
      uint64_t v20 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v19 + 40))(v19) + 56);
      long long v21 = *(_OWORD *)(v18 + 56);
      long long v22 = *(_OWORD *)(v18 + 40);
      long long v23 = *(_OWORD *)(v18 + 24);
      *(_OWORD *)(v20 + 8) = *(_OWORD *)(v18 + 8);
      *(_OWORD *)(v20 + 24) = v23;
      *(_OWORD *)(v20 + 40) = v22;
      *(_OWORD *)(v20 + 56) = v21;
      uint64_t v24 = AudioDSPGraph::Box::in(this, 0);
      LODWORD(v18) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v24 + 40))(v24) + 56)
                               + 72);
      uint64_t v25 = AudioDSPGraph::Box::out(this, v10);
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v25 + 40))(v25);
      *(_DWORD *)(*(void *)(result + 56) + 72) = v18;
      uint64_t v10 = (v10 + 1);
    }
    while (v10 != v6);
  }
  return result;
}

uint64_t AudioDSPGraph::ChannelSplitterBox::hasPresetData(AudioDSPGraph::ChannelSplitterBox *this)
{
  return 0;
}

double AudioDSPGraph::ChannelSplitterBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 7.38215236e170;
  *(_OWORD *)a1 = xmmword_24893BE60;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ChannelSplitterBox::ClassName(AudioDSPGraph::ChannelSplitterBox *this)
{
  return "ChannelSplitter";
}

void AudioDSPGraph::ChannelSplitterBox::~ChannelSplitterBox(AudioDSPGraph::ChannelSplitterBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

uint64_t AudioDSPGraph::ChannelCopierBox::initialize(AudioDSPGraph::ChannelCopierBox *this)
{
  AudioDSPGraph::Box::initialize(this);
  uint64_t v2 = AudioDSPGraph::Box::in(this, 0);
  uint64_t v3 = *(_DWORD **)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  int v4 = v3[2];
  if (v4 == 1819304813)
  {
    int v5 = v3[3];
    if ((v5 & 1) == 0 || v3[8] != 32) {
      goto LABEL_19;
    }
  }
  else
  {
    if (v4 != 1718773105 || v3[8] != 64)
    {
LABEL_19:
      std::string::basic_string[abi:ne180100]<0>(&v15, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v14, "initialize");
      std::string::basic_string[abi:ne180100]<0>(&v13, "ChannelCopierBox input format must be mono, non-interleaved float");
      AudioDSPGraph::ThrowException(1718449215, &v15, 3541, &v14, (long long *)&v13);
    }
    int v5 = v3[3];
  }
  if ((v5 & 0x20) == 0 || v3[7] != 1) {
    goto LABEL_19;
  }
  uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6);
  uint64_t v8 = *(_DWORD **)(result + 120);
  int v9 = v8[2];
  if (v9 == 1819304813)
  {
    int v10 = v8[3];
    if ((v10 & 1) == 0 || v8[8] != 32) {
      goto LABEL_20;
    }
  }
  else
  {
    if (v9 != 1718773105 || v8[8] != 64) {
      goto LABEL_20;
    }
    int v10 = v8[3];
  }
  if ((v10 & 0x20) == 0)
  {
LABEL_20:
    std::string::basic_string[abi:ne180100]<0>(&v15, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v14, "initialize");
    size_t v11 = (char *)this + 32;
    if (*((char *)this + 55) < 0) {
      size_t v11 = *(char **)v11;
    }
    std::string::basic_string[abi:ne180100]<0>(&v12, v11);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v13, "ChannelCopierBox output format must be non-interleaved float ", &v12);
    AudioDSPGraph::ThrowException(1718449215, &v15, 3547, &v14, (long long *)&v13);
  }
  return result;
}

void sub_248937938(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (*(char *)(v26 - 17) < 0) {
    operator delete(*(void **)(v26 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::ChannelCopierBox::process(AudioDSPGraph::ChannelCopierBox *this, int a2)
{
  uint64_t v4 = AudioDSPGraph::Box::in(this, 0);
  uint64_t v5 = *(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v7 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = *v7;
  uint64_t v9 = AudioDSPGraph::Box::in(this, 0);
  char v10 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9) + 120) + 8) == 1718773105;
  if (v8)
  {
    size_t v11 = ((4 * a2) << v10);
    std::string v12 = (void **)(v7 + 4);
    do
    {
      *((_DWORD *)v12 - 1) = v11;
      std::string v13 = *(void **)(v5 + 16);
      if (v13 != *v12) {
        memcpy(*v12, v13, v11);
      }
      v12 += 2;
      --v8;
    }
    while (v8);
  }
  uint64_t v14 = AudioDSPGraph::Box::in(this, 0);
  uint64_t v15 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v14 + 40))(v14) + 56);
  uint64_t v16 = AudioDSPGraph::Box::out(this, 0);
  uint64_t v17 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16) + 56);
  long long v18 = *(_OWORD *)(v15 + 56);
  long long v19 = *(_OWORD *)(v15 + 40);
  long long v20 = *(_OWORD *)(v15 + 24);
  *(_OWORD *)(v17 + 8) = *(_OWORD *)(v15 + 8);
  *(_OWORD *)(v17 + 24) = v20;
  *(_OWORD *)(v17 + 40) = v19;
  *(_OWORD *)(v17 + 56) = v18;
  uint64_t v21 = AudioDSPGraph::Box::in(this, 0);
  LODWORD(v15) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v21 + 40))(v21) + 56) + 72);
  uint64_t v22 = AudioDSPGraph::Box::out(this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v15;
  return result;
}

uint64_t AudioDSPGraph::ChannelCopierBox::hasPresetData(AudioDSPGraph::ChannelCopierBox *this)
{
  return 0;
}

double AudioDSPGraph::ChannelCopierBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 7.36328254e170;
  *(_OWORD *)a1 = xmmword_24893BE70;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::ChannelCopierBox::ClassName(AudioDSPGraph::ChannelCopierBox *this)
{
  return "ChannelCopier";
}

void AudioDSPGraph::ChannelCopierBox::~ChannelCopierBox(AudioDSPGraph::ChannelCopierBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

uint64_t AudioDSPGraph::DeadEndBox::hasPresetData(AudioDSPGraph::DeadEndBox *this)
{
  return 0;
}

double AudioDSPGraph::DeadEndBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 4.23042584e175;
  *(_OWORD *)a1 = xmmword_24893BE90;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::DeadEndBox::ClassName(AudioDSPGraph::DeadEndBox *this)
{
  return "DeadEndBox";
}

void AudioDSPGraph::DeadEndBox::~DeadEndBox(AudioDSPGraph::DeadEndBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

double AudioDSPGraph::ConstantSourceBox::initialize(AudioDSPGraph::ConstantSourceBox *this)
{
  AudioDSPGraph::Box::initialize(this);
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v2 = 0;
    do
    {
      uint64_t v3 = AudioDSPGraph::Box::out(this, v2);
      uint64_t v4 = *(_DWORD **)((*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3) + 120);
      int v5 = v4[2];
      if (v5 == 1819304813)
      {
        int v6 = v4[3];
        if ((v6 & 1) == 0 || v4[8] != 32) {
          goto LABEL_13;
        }
      }
      else
      {
        if (v5 != 1718773105 || v4[8] != 64)
        {
LABEL_13:
          std::string::basic_string[abi:ne180100]<0>(&v10, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
          std::string::basic_string[abi:ne180100]<0>(&v9, "initialize");
          std::string::basic_string[abi:ne180100]<0>(&v8, "ConstantSourceBox output format must be non-interleaved float or 'freq'");
          AudioDSPGraph::ThrowException(1718449215, &v10, 3590, &v9, &v8);
        }
        int v6 = v4[3];
      }
      if ((v6 & 0x20) == 0) {
        goto LABEL_13;
      }
      uint64_t v2 = (v2 + 1);
    }
    while (v2 < ((*((void *)this + 12) - *((void *)this + 11)) >> 5));
  }
  *((_OWORD *)this + 49) = 0u;
  *((void *)this + 100) = 0x3FF0000000000000;
  *(_OWORD *)((char *)this + 808) = 0u;
  *(_OWORD *)((char *)this + 824) = 0u;
  *(void *)&double result = 1;
  *((void *)this + 105) = 1;
  return result;
}

void sub_248937E04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

double AudioDSPGraph::ConstantSourceBox::process(AudioDSPGraph::ConstantSourceBox *this, unsigned int a2)
{
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v3 = 0;
    int v25 = 4 * a2;
    vDSP_Length v4 = a2 - 1;
    int v5 = 8 * a2;
    long long v23 = (long long *)((char *)this + 784);
    vDSP_Length __N = a2 + 1;
    do
    {
      uint64_t v6 = AudioDSPGraph::Box::out(this, v3);
      uint64_t v7 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
      uint64_t v8 = *v7;
      if (v8)
      {
        long long v9 = (float **)(v7 + 4);
        do
        {
          uint64_t v10 = AudioDSPGraph::Box::out(this, v3);
          int v11 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120) + 8);
          std::string v12 = *v9;
          std::string v13 = (const float *)((char *)this + 772);
          if (v11 == 1718773105)
          {
            vDSP_vfill(v13, v12, 1, __N);
            vDSP_vfill((const float *)this + 194, &(*v9)[a2 + 1], 1, v4);
            int v14 = v5;
          }
          else
          {
            vDSP_vfill(v13, v12, 1, a2);
            int v14 = v25;
          }
          *((_DWORD *)v9 - 1) = v14;
          v9 += 2;
          --v8;
        }
        while (v8);
      }
      uint64_t v15 = AudioDSPGraph::Box::out(this, v3);
      *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v15 + 40))(v15) + 56) + 72) = 512;
      uint64_t v16 = AudioDSPGraph::Box::out(this, v3);
      uint64_t v17 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16) + 56);
      long long v18 = *v23;
      long long v19 = v23[1];
      long long v20 = v23[2];
      *(_OWORD *)(v17 + 56) = v23[3];
      *(_OWORD *)(v17 + 40) = v20;
      *(_OWORD *)(v17 + 24) = v19;
      *(_OWORD *)(v17 + 8) = v18;
      uint64_t v3 = (v3 + 1);
    }
    while (v3 < ((*((void *)this + 12) - *((void *)this + 11)) >> 5));
  }
  double result = *((double *)this + 98) + (double)a2;
  *((double *)this + 98) = result;
  return result;
}

double AudioDSPGraph::ConstantSourceBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 9.19367275e170;
  *(_OWORD *)a1 = xmmword_24893BEA0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

__n128 AudioDSPGraph::ConstantSourceBox::getParameterInfo@<Q0>(int a1@<W1>, unsigned int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v5 = -10866;
LABEL_7:
    *(_DWORD *)a3 = v5;
    *(unsigned char *)(a3 + 104) = 0;
    return result;
  }
  if (a2 > 1)
  {
    int v5 = -10878;
    goto LABEL_7;
  }
  uint64_t v16 = 0;
  long long v14 = 0u;
  __n128 v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(unint64_t *)((char *)v15.n128_u64 + 4) = 0x41A00000C1A00000;
  if (a2)
  {
    strlcpy((char *)&v10, "imag value (freq domain only)", 0x34uLL);
    uint64_t v6 = @"imag value (freq domain only)";
  }
  else
  {
    strlcpy((char *)&v10, "real value", 0x34uLL);
    uint64_t v6 = @"real value";
  }
  *((void *)&v14 + 1) = v6;
  LODWORD(v16) = v16 | 0xC8000000;
  long long v7 = v11;
  *(_OWORD *)a3 = v10;
  *(_OWORD *)(a3 + 16) = v7;
  long long v8 = v13;
  *(_OWORD *)(a3 + 32) = v12;
  *(_OWORD *)(a3 + 48) = v8;
  __n128 result = v15;
  *(_OWORD *)(a3 + 64) = v14;
  *(__n128 *)(a3 + 80) = result;
  *(void *)(a3 + 96) = v16;
  *(unsigned char *)(a3 + 104) = 1;
  return result;
}

void sub_24893819C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void AudioDSPGraph::ConstantSourceBox::getParameterList(int a1@<W1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (!a1)
  {
    vDSP_Length v4 = operator new(8uLL);
    *a2 = v4;
    *v4++ = 0x100000000;
    a2[1] = v4;
    a2[2] = v4;
  }
}

float AudioDSPGraph::ConstantSourceBox::getParameter(AudioDSPGraph::ConstantSourceBox *this, int a2, int a3)
{
  if (a3 | a2)
  {
    if (a2 != 1 || a3)
    {
      std::string::basic_string[abi:ne180100]<0>(&v7, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v6, "getParameter");
      std::string::basic_string[abi:ne180100]<0>(&v5, &byte_248942E06);
      AudioDSPGraph::ThrowException(-10878, &v7, 3651, &v6, &v5);
    }
    uint64_t v3 = (char *)this + 776;
  }
  else
  {
    uint64_t v3 = (char *)this + 772;
  }
  return *(float *)v3;
}

void sub_248938280(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::ConstantSourceBox::setParameter(uint64_t this, int a2, int a3, float a4)
{
  if (a3 | a2)
  {
    if (a2 != 1 || a3)
    {
      std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v5, "setParameter");
      std::string::basic_string[abi:ne180100]<0>(&v4, &byte_248942E06);
      AudioDSPGraph::ThrowException(-10878, &v6, 3637, &v5, &v4);
    }
    *(float *)(this + 776) = a4;
  }
  else
  {
    *(float *)(this + 772) = a4;
  }
  return this;
}

void sub_24893835C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

const char *AudioDSPGraph::ConstantSourceBox::ClassName(AudioDSPGraph::ConstantSourceBox *this)
{
  return "ConstantSourceBox";
}

void AudioDSPGraph::ConstantSourceBox::~ConstantSourceBox(AudioDSPGraph::ConstantSourceBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

double AudioDSPGraph::DecibelControlBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 3.63842702e175;
  *(_OWORD *)a1 = xmmword_24893BEB0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

__n128 AudioDSPGraph::DecibelControlBox::getParameterInfo@<Q0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v5 = -10866;
LABEL_3:
    *(_DWORD *)a3 = v5;
    *(unsigned char *)(a3 + 104) = 0;
    return result;
  }
  if (a2 == 1)
  {
    uint64_t v16 = 0;
    long long v14 = 0u;
    v15.n128_u32[3] = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v15.n128_u32[0] = 13;
    *(unint64_t *)((char *)v15.n128_u64 + 4) = 0x7F800000FF800000;
    strlcpy((char *)&v10, "DBValue", 0x34uLL);
    long long v6 = @"DBValue";
  }
  else
  {
    if (a2)
    {
      int v5 = -10878;
      goto LABEL_3;
    }
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v15.n128_u64[0] = 14;
    v15.n128_u64[1] = 0x3F8000007F800000;
    strlcpy((char *)&v10, "LinearValue", 0x34uLL);
    long long v6 = @"LinearValue";
  }
  *((void *)&v14 + 1) = v6;
  LODWORD(v16) = v16 | 0xC8000000;
  long long v7 = v11;
  *(_OWORD *)a3 = v10;
  *(_OWORD *)(a3 + 16) = v7;
  long long v8 = v13;
  *(_OWORD *)(a3 + 32) = v12;
  *(_OWORD *)(a3 + 48) = v8;
  __n128 result = v15;
  *(_OWORD *)(a3 + 64) = v14;
  *(__n128 *)(a3 + 80) = result;
  *(void *)(a3 + 96) = v16;
  *(unsigned char *)(a3 + 104) = 1;
  return result;
}

void sub_248938548(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void AudioDSPGraph::DecibelControlBox::getParameterList(int a1@<W1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (!a1)
  {
    long long v4 = operator new(8uLL);
    *a2 = v4;
    *v4++ = 0x100000000;
    a2[1] = v4;
    a2[2] = v4;
  }
}

float AudioDSPGraph::DecibelControlBox::getParameter(AudioDSPGraph::DecibelControlBox *this, int a2, int a3)
{
  if (a3 | a2)
  {
    if (a2 != 1 || a3)
    {
      std::string::basic_string[abi:ne180100]<0>(&v7, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v6, "getParameter");
      std::string::basic_string[abi:ne180100]<0>(&v5, &byte_248942E06);
      AudioDSPGraph::ThrowException(-10878, &v7, 3720, &v6, &v5);
    }
    uint64_t v3 = (char *)this + 776;
  }
  else
  {
    uint64_t v3 = (char *)this + 772;
  }
  return *(float *)v3;
}

void sub_24893862C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

void AudioDSPGraph::DecibelControlBox::setParameter(AudioDSPGraph::DecibelControlBox *this, int a2, int a3, float a4)
{
  float v4 = a4;
  if (a3 | a2)
  {
    if (a2 != 1 || a3)
    {
      std::string::basic_string[abi:ne180100]<0>(&v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v8, "setParameter");
      std::string::basic_string[abi:ne180100]<0>(&v7, &byte_248942E06);
      AudioDSPGraph::ThrowException(-10878, &v9, 3706, &v8, &v7);
    }
    *((float *)this + 193) = __exp10f(a4 * 0.05);
  }
  else
  {
    if (a4 < 0.0)
    {
      std::string::basic_string[abi:ne180100]<0>(&v9, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v8, "setParameter");
      std::string::basic_string[abi:ne180100]<0>(&v7, "Parameter out of range");
      AudioDSPGraph::ThrowException(1919837985, &v9, 3698, &v8, &v7);
    }
    *((float *)this + 193) = a4;
    float v6 = 1.1755e-38;
    if (v4 >= 1.1755e-38) {
      float v6 = v4;
    }
    float v4 = log10f(v6) * 20.0;
  }
  *((float *)this + 194) = v4;
}

void sub_2489387A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::DecibelControlBox::canProcessInPlace(AudioDSPGraph::DecibelControlBox *this)
{
  return 1;
}

const char *AudioDSPGraph::DecibelControlBox::ClassName(AudioDSPGraph::DecibelControlBox *this)
{
  return "DecibelControlBox";
}

void AudioDSPGraph::DecibelControlBox::~DecibelControlBox(AudioDSPGraph::DecibelControlBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

uint64_t AudioDSPGraph::SingleRateLPCMConverterBox::uninitialize(AudioDSPGraph::SingleRateLPCMConverterBox *this)
{
  uint64_t v2 = (OpaqueAudioConverter *)*((void *)this + 97);
  if (v2) {
    AudioConverterDispose(v2);
  }

  return AudioDSPGraph::Box::uninitialize(this);
}

uint64_t AudioDSPGraph::SingleRateLPCMConverterBox::initialize(AudioConverterRef *this)
{
  AudioDSPGraph::Box::initialize((AudioDSPGraph::Box *)this);
  if (((this[9] - this[8]) & 0x1FFFFFFFE0) != 0x20 || ((this[12] - this[11]) & 0x1FFFFFFFE0) != 0x20)
  {
    std::string::basic_string[abi:ne180100]<0>(&v10, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v9, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v8, "SingleRateLPCMConverterBox only supports 1 bus in 1 bus out");
    AudioDSPGraph::ThrowException(1718449215, &v10, 3771, &v9, &v8);
  }
  uint64_t v2 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)this, 0);
  uint64_t v3 = *(const AudioStreamBasicDescription **)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  if (v3->mFormatID != 1819304813)
  {
    std::string::basic_string[abi:ne180100]<0>(&v10, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v9, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v8, "SingleRateLPCMConverterBox input format must be LPCM");
    AudioDSPGraph::ThrowException(1718449215, &v10, 3777, &v9, &v8);
  }
  if (!v3->mChannelsPerFrame)
  {
    std::string::basic_string[abi:ne180100]<0>(&v10, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v9, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v8, "SingleRateLPCMConverterBox input must have a non-zero number of channels");
    AudioDSPGraph::ThrowException(1718449215, &v10, 3781, &v9, &v8);
  }
  uint64_t v4 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, 0);
  long long v5 = *(const AudioStreamBasicDescription **)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120);
  if (v5->mFormatID != 1819304813)
  {
    std::string::basic_string[abi:ne180100]<0>(&v10, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v9, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v8, "SingleRateLPCMConverterBox output format must be non-interleaved float");
    AudioDSPGraph::ThrowException(1718449215, &v10, 3787, &v9, &v8);
  }
  if (!v5->mChannelsPerFrame)
  {
    std::string::basic_string[abi:ne180100]<0>(&v10, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v9, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v8, "SingleRateLPCMConverterBox output must have a non-zero number of channels");
    AudioDSPGraph::ThrowException(1718449215, &v10, 3791, &v9, &v8);
  }
  if (v3->mSampleRate != v5->mSampleRate)
  {
    std::string::basic_string[abi:ne180100]<0>(&v10, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v9, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v8, "SingleRateLPCMConverterBox input and output sample rates must match");
    AudioDSPGraph::ThrowException(1718449215, &v10, 3795, &v9, &v8);
  }
  uint64_t result = AudioConverterNew(v3, v5, this + 97);
  if (result)
  {
    int v7 = result;
    std::string::basic_string[abi:ne180100]<0>(&v10, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v9, "initialize");
    std::string::basic_string[abi:ne180100]<0>(&v8, "Error in AudioConverterNew");
    AudioDSPGraph::ThrowException(v7, &v10, 3802, &v9, &v8);
  }
  return result;
}

void sub_248938BCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::SingleRateLPCMConverterBox::process(OpaqueAudioConverter **this, UInt32 a2)
{
  uint64_t v4 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, 0);
  long long v5 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  if (*v5)
  {
    unint64_t v6 = 0;
    uint64_t v7 = 3;
    do
    {
      uint64_t v8 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, 0);
      v5[v7] = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 24)
             * a2;
      ++v6;
      v7 += 4;
    }
    while (v6 < *v5);
  }
  long long v9 = this[97];
  uint64_t v10 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)this, 0);
  long long v11 = *(const AudioBufferList **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 56)
                                  + 80);
  uint64_t v12 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, 0);
  uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12);
  AudioConverterConvertComplexBuffer(v9, a2, v11, *(AudioBufferList **)(*(void *)(v13 + 56) + 80));
  uint64_t v14 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)this, 0);
  uint64_t v15 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v14 + 40))(v14) + 56);
  uint64_t v16 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, 0);
  uint64_t v17 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16) + 56);
  long long v18 = *(_OWORD *)(v15 + 56);
  long long v19 = *(_OWORD *)(v15 + 40);
  long long v20 = *(_OWORD *)(v15 + 24);
  *(_OWORD *)(v17 + 8) = *(_OWORD *)(v15 + 8);
  *(_OWORD *)(v17 + 24) = v20;
  *(_OWORD *)(v17 + 40) = v19;
  *(_OWORD *)(v17 + 56) = v18;
  uint64_t v21 = AudioDSPGraph::Box::in((AudioDSPGraph::Box *)this, 0);
  LODWORD(v15) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v21 + 40))(v21) + 56) + 72);
  uint64_t v22 = AudioDSPGraph::Box::out((AudioDSPGraph::Box *)this, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22);
  *(_DWORD *)(*(void *)(result + 56) + 72) = v15;
  return result;
}

double AudioDSPGraph::SingleRateLPCMConverterBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 1.28814877e248;
  *(_OWORD *)a1 = xmmword_24893BF00;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::SingleRateLPCMConverterBox::ClassName(AudioDSPGraph::SingleRateLPCMConverterBox *this)
{
  return "SingleRateLPCMConverterBox";
}

void AudioDSPGraph::SingleRateLPCMConverterBox::~SingleRateLPCMConverterBox(AudioDSPGraph::SingleRateLPCMConverterBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

uint64_t AudioDSPGraph::Box::sampleRate(AudioDSPGraph::Box *this)
{
  if (((*((void *)this + 12) - *((void *)this + 11)) & 0x1FFFFFFFE0) != 0)
  {
    uint64_t v1 = AudioDSPGraph::Box::out(this, 0);
  }
  else
  {
    if (((*((void *)this + 9) - *((void *)this + 8)) & 0x1FFFFFFFE0) == 0) {
      return 1;
    }
    uint64_t v1 = AudioDSPGraph::Box::in(this);
  }
  return **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1) + 120);
}

float AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::reset(uint64_t a1)
{
  float v1 = 0.0;
  if (!*(unsigned char *)(a1 + 780)) {
    float v1 = 1.0;
  }
  float result = *(float *)(a1 + 776) * v1;
  *(float *)(a1 + 804) = result;
  *(_WORD *)(a1 + 812) = 257;
  return result;
}

BOOL AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::initialize(AudioDSPGraph::Box *a1)
{
  AudioDSPGraph::Box::initialize(a1);
  uint64_t v2 = AudioDSPGraph::Box::in(a1, 0);
  uint64_t v3 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  uint64_t v4 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v6 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120);
  *((unsigned char *)a1 + 813) = 1;
  int v7 = *(_DWORD *)(v3 + 8);
  if (v7 == 1819304813)
  {
    int v8 = *(_DWORD *)(v3 + 12);
    if ((v8 & 1) == 0) {
      goto LABEL_60;
    }
    int v9 = *(_DWORD *)(v3 + 32);
    if (v9 != 32) {
      goto LABEL_60;
    }
  }
  else
  {
    if (v7 != 1718773105 || (int v9 = *(_DWORD *)(v3 + 32), v9 != 64))
    {
LABEL_60:
      std::string::basic_string[abi:ne180100]<0>(&v44, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v43, "initialize");
      std::string::basic_string[abi:ne180100]<0>(&v42, "GainBox input format must be non-interleaved float or 'freq'");
      AudioDSPGraph::ThrowException(1718449215, &v44, 2620, &v43, (long long *)&v42);
    }
    int v8 = *(_DWORD *)(v3 + 12);
  }
  if ((v8 & 0x20) == 0) {
    goto LABEL_60;
  }
  int v10 = *(_DWORD *)(v6 + 8);
  if (v10 == 1819304813)
  {
    int v11 = *(_DWORD *)(v6 + 12);
    if ((v11 & 1) == 0) {
      goto LABEL_61;
    }
    int v12 = *(_DWORD *)(v6 + 32);
    if (v12 != 32) {
      goto LABEL_61;
    }
  }
  else
  {
    if (v10 != 1718773105 || (int v12 = *(_DWORD *)(v6 + 32), v12 != 64))
    {
LABEL_61:
      std::string::basic_string[abi:ne180100]<0>(&v44, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v43, "initialize");
      std::string::basic_string[abi:ne180100]<0>(&v42, "GainBox output format must be non-interleaved float or 'freq'");
      AudioDSPGraph::ThrowException(1718449215, &v44, 2624, &v43, (long long *)&v42);
    }
    int v11 = *(_DWORD *)(v6 + 12);
  }
  if ((v11 & 0x20) == 0) {
    goto LABEL_61;
  }
  if (*(double *)v3 == 0.0)
  {
    if (v7 != v10) {
      goto LABEL_53;
    }
  }
  else
  {
    BOOL v13 = *(double *)v6 == 0.0;
    if (*(double *)v3 == *(double *)v6) {
      BOOL v13 = 1;
    }
    if (v7 != v10 || !v13)
    {
LABEL_53:
      std::string::basic_string[abi:ne180100]<0>(&v44, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v43, "initialize");
      CA::StreamDescription::AsString((CA::StreamDescription *)&v38, (void *)v3, v28, v29);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v39, "GainBox input and output formats don't match (", &v38);
      *(void *)&double v30 = std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v40, &v39, " != ").n128_u64[0];
      CA::StreamDescription::AsString((CA::StreamDescription *)v36, (void *)v6, v30, v31);
      if ((v37 & 0x80u) == 0) {
        long long v32 = (const std::string::value_type *)v36;
      }
      else {
        long long v32 = (const std::string::value_type *)v36[0];
      }
      if ((v37 & 0x80u) == 0) {
        std::string::size_type v33 = v37;
      }
      else {
        std::string::size_type v33 = v36[1];
      }
      uint64_t v34 = std::string::append(&v40, v32, v33);
      long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
      v41.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v35;
      v34->__r_.__value_.__l.__size_ = 0;
      v34->__r_.__value_.__r.__words[2] = 0;
      v34->__r_.__value_.__r.__words[0] = 0;
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v42, &v41, ")");
      AudioDSPGraph::ThrowException(1718449215, &v44, 2632, &v43, (long long *)&v42);
    }
  }
  int v14 = *(_DWORD *)(v3 + 16);
  if (v14)
  {
    int v15 = *(_DWORD *)(v6 + 16);
    if (v15 && v14 != v15) {
      goto LABEL_53;
    }
  }
  int v17 = *(_DWORD *)(v3 + 20);
  if (v17)
  {
    int v18 = *(_DWORD *)(v6 + 20);
    if (v18 && v17 != v18) {
      goto LABEL_53;
    }
  }
  int v20 = *(_DWORD *)(v3 + 24);
  if (v20)
  {
    int v21 = *(_DWORD *)(v6 + 24);
    if (v21 && v20 != v21) {
      goto LABEL_53;
    }
  }
  int v23 = *(_DWORD *)(v3 + 28);
  if (v23)
  {
    int v24 = *(_DWORD *)(v6 + 28);
    if (v23 != v24 && v24 != 0 || v9 != v12) {
      goto LABEL_53;
    }
  }
  else if (v9 != v12)
  {
    goto LABEL_53;
  }
  BOOL result = CA::Implementation::EquivalentFormatFlags((CA::Implementation *)v3, (const AudioStreamBasicDescription *)v6, v5);
  if (!result) {
    goto LABEL_53;
  }
  return result;
}

void sub_248939310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (*(char *)(v38 - 81) < 0) {
    operator delete(*(void **)(v38 - 104));
  }
  if (a38 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (*(char *)(v38 - 57) < 0) {
    operator delete(*(void **)(v38 - 80));
  }
  if (*(char *)(v38 - 33) < 0) {
    operator delete(*(void **)(v38 - 56));
  }
  _Unwind_Resume(exception_object);
}

BOOL CA::Implementation::EquivalentFormatFlags(CA::Implementation *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  uint64_t v3 = *((void *)this + 1);
  long long v4 = *(_OWORD *)&a2->mFormatID;
  v5.i64[0] = *(void *)&a2->mFormatID;
  v5.i64[1] = v3;
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v5)))) {
    return 1;
  }
  unsigned int v7 = HIDWORD(*(void *)&a2->mFormatID);
  if (v3 != 1819304813) {
    return HIDWORD(v3) == DWORD1(v4);
  }
  if ((v3 & 0x7FFFFFFF00000000) != 0) {
    int v8 = HIDWORD(v3) & 0x7FFFFFFF;
  }
  else {
    int v8 = HIDWORD(v3);
  }
  unsigned int v9 = *((_DWORD *)this + 6);
  if (v9)
  {
    int v10 = *((_DWORD *)this + 7);
    if ((v3 & 0x2000000000) != 0) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = *((_DWORD *)this + 7);
    }
    if (v11)
    {
      unsigned int v9 = 8 * (v9 / v11);
      unsigned int v12 = *((_DWORD *)this + 8);
      int v13 = v8 | 8;
      BOOL v14 = v9 == v12;
      goto LABEL_17;
    }
    unsigned int v9 = 0;
    unsigned int v12 = *((_DWORD *)this + 8);
    int v13 = v8 | 8;
  }
  else
  {
    int v13 = v8 | 8;
    int v10 = *((_DWORD *)this + 7);
    unsigned int v12 = *((_DWORD *)this + 8);
  }
  BOOL v14 = v12 == 0;
LABEL_17:
  if (v14) {
    int v8 = v13;
  }
  BOOL v16 = (v12 & 7) == 0 && v9 == v12;
  unsigned int v17 = v8 & 0xFFFFFFEF;
  if (!v16) {
    unsigned int v17 = v8;
  }
  if (v17) {
    v17 &= ~4u;
  }
  BOOL v18 = (v17 & 8) == 0 || v12 > 8;
  int v19 = v17 & 2;
  if (v18) {
    int v19 = v17;
  }
  if (v10 == 1) {
    unsigned int v20 = v19 & 0xFFFFFFDF;
  }
  else {
    unsigned int v20 = v19;
  }
  if (!v20) {
    unsigned int v20 = 0x80000000;
  }
  if (v4 != 1819304813) {
    return v20 == v7;
  }
  if ((DWORD1(v4) & 0x7FFFFFFF) != 0) {
    int v21 = DWORD1(v4) & 0x7FFFFFFF;
  }
  else {
    int v21 = HIDWORD(*(void *)&a2->mFormatID);
  }
  UInt32 mBytesPerFrame = a2->mBytesPerFrame;
  if (!mBytesPerFrame)
  {
    int v26 = v21 | 8;
    UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
LABEL_48:
    BOOL v27 = mBitsPerChannel == 0;
    goto LABEL_49;
  }
  UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
  if ((BYTE4(v4) & 0x20) != 0) {
    UInt32 v24 = 1;
  }
  else {
    UInt32 v24 = a2->mChannelsPerFrame;
  }
  if (!v24)
  {
    UInt32 mBytesPerFrame = 0;
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
    int v26 = v21 | 8;
    goto LABEL_48;
  }
  UInt32 mBytesPerFrame = 8 * (mBytesPerFrame / v24);
  UInt32 mBitsPerChannel = a2->mBitsPerChannel;
  int v26 = v21 | 8;
  BOOL v27 = mBytesPerFrame == mBitsPerChannel;
LABEL_49:
  if (v27) {
    int v21 = v26;
  }
  BOOL v28 = (mBitsPerChannel & 7) == 0 && mBytesPerFrame == mBitsPerChannel;
  unsigned int v29 = v21 & 0xFFFFFFEF;
  if (!v28) {
    unsigned int v29 = v21;
  }
  if (v29) {
    v29 &= ~4u;
  }
  BOOL v30 = (v29 & 8) == 0 || mBitsPerChannel > 8;
  unsigned int v7 = v29 & 2;
  if (v30) {
    unsigned int v7 = v29;
  }
  if (mChannelsPerFrame == 1) {
    v7 &= ~0x20u;
  }
  if (!v7) {
    unsigned int v7 = 0x80000000;
  }
  return v20 == v7;
}

uint64_t AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::process(AudioDSPGraph::Box *a1, unsigned int a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = AudioDSPGraph::Box::in(a1, 0);
  int32x4_t v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::out(v3, 0);
  uint64_t v7 = *(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = AudioDSPGraph::Box::out(v3, 0);
  int v54 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 8);
  uint64_t v9 = *v5;
  if (*((unsigned char *)v3 + 812)) {
    *((unsigned char *)v3 + 812) = 0;
  }
  size_t v10 = (4 * a2) << (v54 == 1718773105);
  if (*((unsigned char *)v3 + 813))
  {
    float v11 = 0.0;
    if (!*((unsigned char *)v3 + 780)) {
      float v11 = 1.0;
    }
    *((float *)v3 + 202) = *((float *)v3 + 194) * v11;
  }
  uint64_t v12 = AudioDSPGraph::Box::in(v3, 0);
  if ((*(unsigned char *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12) + 56) + 72) & 0x10) != 0)
  {
    if (v9)
    {
      int v21 = (void **)(v7 + 16);
      do
      {
        bzero(*v21, v10);
        *((_DWORD *)v21 - 1) = v10;
        v21 += 2;
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    vDSP_Length v13 = a2;
    float v14 = *((float *)v3 + 201);
    int v15 = (const float *)((char *)v3 + 808);
    float v16 = *((float *)v3 + 202);
    if (v14 == v16)
    {
      if (v9)
      {
        unsigned int v17 = (float **)(v7 + 16);
        BOOL v18 = (const float **)(v5 + 4);
        do
        {
          int v19 = *v18;
          unsigned int v20 = *v17;
          vDSP_vsmul(*v18, 1, (const float *)v3 + 202, *v17, 1, v13);
          if (v54 == 1718773105) {
            vDSP_vsmul(&v19[v13], 1, (const float *)v3 + 202, &v20[v13], 1, v13);
          }
          *((_DWORD *)v17 - 1) = v10;
          v17 += 2;
          v18 += 2;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      if (*((unsigned char *)v3 + 813))
      {
        double v22 = *((double *)v3 + 98);
        float v23 = (float)(v16 - v14) / (float)(v22 * (double)AudioDSPGraph::Box::sampleRate(v3));
        *((float *)v3 + 200) = v23;
        float v14 = *((float *)v3 + 201);
      }
      else
      {
        float v23 = *((float *)v3 + 200);
      }
      *((unsigned char *)v3 + 813) = 0;
      UInt32 v24 = (const float *)((char *)v3 + 800);
      float v25 = v14 + (float)(v23 * (float)a2);
      if ((v23 <= 0.0 || (float v26 = *v15, v25 <= *v15)) && (v23 >= 0.0 || (float v26 = *v15, v25 >= *v15)))
      {
        if (v9)
        {
          long long v32 = (float **)(v7 + 16);
          std::string::size_type v33 = (const float **)(v5 + 4);
          do
          {
            uint64_t v34 = *v33;
            long long v35 = *v32;
            float v55 = *((float *)v3 + 201);
            vDSP_vrampmul(v34, 1, &v55, (const float *)v3 + 200, v35, 1, v13);
            if (v54 == 1718773105)
            {
              float v55 = *((float *)v3 + 201);
              vDSP_vrampmul(&v34[v13], 1, &v55, (const float *)v3 + 200, &v35[v13], 1, v13);
            }
            v32 += 2;
            v33 += 2;
            --v9;
          }
          while (v9);
        }
      }
      else if (v9)
      {
        vDSP_Length v27 = fabsf((float)(v26 - v14) / v23);
        vDSP_Length __N = a2 - v27;
        int v52 = (const float *)((char *)v3 + 800);
        BOOL v28 = (float **)(v7 + 16);
        unsigned int v29 = (const float **)(v5 + 4);
        int v53 = (float *)v3;
        do
        {
          BOOL v30 = *v29;
          int16x8_t v31 = *v28;
          float __Start = *((float *)v3 + 201);
          vDSP_vrampmul(v30, 1, &__Start, v24, v31, 1, v27);
          vDSP_vsmul(&v30[v27], 1, v15, &v31[v27], 1, __N);
          if (v54 == 1718773105)
          {
            float __Start = v53[201];
            vDSP_vrampmul(&v30[v13], 1, &__Start, v52, &v31[v13], 1, v27);
            vDSP_vsmul(&v30[v27 + v13], 1, v15, &v31[v27 + v13], 1, __N);
          }
          v28 += 2;
          v29 += 2;
          --v9;
          UInt32 v24 = v52;
          uint64_t v3 = (AudioDSPGraph::Box *)v53;
        }
        while (v9);
        float v25 = *v15;
      }
      else
      {
        float v25 = v26;
      }
      *((float *)v3 + 201) = v25;
    }
  }
  if (*((unsigned char *)v3 + 813)) {
    int v36 = 16 * (*((float *)v3 + 202) == 0.0);
  }
  else {
    int v36 = 0;
  }
  uint64_t v37 = AudioDSPGraph::Box::in(v3, 0);
  int v38 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v37 + 40))(v37) + 56) + 72);
  uint64_t v39 = AudioDSPGraph::Box::in(v3, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v39 + 40))(v39);
  std::string v41 = (uint64_t *)*((void *)v3 + 11);
  std::string v42 = (uint64_t *)*((void *)v3 + 12);
  if (v41 != v42)
  {
    int v43 = v38 | v36;
    long long v44 = (_OWORD *)(*(void *)(result + 56) + 8);
    uint64_t result = *((void *)v3 + 11);
    long long v45 = (uint64_t *)result;
    do
    {
      uint64_t v46 = *v45;
      v45 += 4;
      uint64_t v47 = *(void *)((*(uint64_t (**)(uint64_t))(v46 + 40))(result) + 56);
      long long v49 = v44[2];
      long long v48 = v44[3];
      long long v50 = v44[1];
      *(_OWORD *)(v47 + 8) = *v44;
      *(_OWORD *)(v47 + 24) = v50;
      *(_OWORD *)(v47 + 40) = v49;
      *(_OWORD *)(v47 + 56) = v48;
      *(_DWORD *)(v47 + 72) = v43;
      v41 += 4;
      uint64_t result = (uint64_t)v45;
    }
    while (v45 != v42);
  }
  if (*((float *)v3 + 201) == *((float *)v3 + 202)) {
    *((unsigned char *)v3 + 813) = 1;
  }
  return result;
}

uint64_t AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::setProperty(double *a1, int a2, int a3, unsigned int a4, int a5, double *a6)
{
  if (a2 != 3098) {
    return AudioDSPGraph::Box::setProperty((AudioDSPGraph::Box *)a1, a2, a3, a4, a5, a6);
  }
  if (a5 != 8) {
    return 561211770;
  }
  if (a3) {
    return 4294956430;
  }
  double v8 = *a6;
  a1[98] = *a6;
  double v9 = a1[99];
  uint64_t v6 = 0;
  if (v8 < v9) {
    a1[98] = v9;
  }
  return v6;
}

double AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::getProperty(AudioDSPGraph::Box *this, int a2, uint64_t a3, uint64_t a4, unsigned int *a5, CFStringRef *a6)
{
  if (a2 == 3098)
  {
    if (*a5 == 8 && a6 && !a3)
    {
      double result = *((double *)this + 98);
      *(double *)a6 = result;
    }
  }
  else
  {
    AudioDSPGraph::Box::getProperty(this, a2, a3, a4, a5, a6);
  }
  return result;
}

unint64_t AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::getPropertyInfo(AudioDSPGraph::Box *a1, int a2, int a3)
{
  if (a2 == 3098)
  {
    uint64_t v3 = 8;
    if (a3)
    {
      uint64_t v3 = 4294956430;
      unint64_t v4 = 0;
    }
    else
    {
      unint64_t v4 = 0x100000000;
    }
  }
  else
  {
    uint64_t PropertyInfo = AudioDSPGraph::Box::getPropertyInfo(a1, a2, a3);
    unint64_t v4 = PropertyInfo & 0xFFFFFFFF00000000;
    uint64_t v3 = PropertyInfo;
  }
  return v4 | v3;
}

double AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 9.69732525e189;
  *(_OWORD *)a1 = xmmword_24893BD20;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

size_t AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::getParameterInfo@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v4 = -10866;
LABEL_3:
    *(_DWORD *)a3 = v4;
    *(unsigned char *)(a3 + 104) = 0;
    return result;
  }
  if (a2 == 1)
  {
    uint64_t v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    DWORD2(v14) = 1065353216;
    LODWORD(v14) = 2;
    size_t result = strlcpy((char *)&v9, "mute", 0x34uLL);
    *((void *)&v13 + 1) = @"mute";
    LODWORD(v15) = v15 | 0xC8000000;
    long long v6 = v10;
    *(_OWORD *)a3 = v9;
    *(_OWORD *)(a3 + 16) = v6;
    long long v7 = v12;
    *(_OWORD *)(a3 + 32) = v11;
    *(_OWORD *)(a3 + 48) = v7;
    long long v8 = v14;
    *(_OWORD *)(a3 + 64) = v13;
    *(_OWORD *)(a3 + 80) = v8;
    *(void *)(a3 + 96) = v15;
  }
  else
  {
    if (a2)
    {
      int v4 = -10878;
      goto LABEL_3;
    }
    *(void *)(a3 + 96) = 0;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(void *)(a3 + 84) = 0x40000000C0000000;
    *(_DWORD *)(a3 + 92) = 1065353216;
    *(_DWORD *)(a3 + 80) = 14;
    size_t result = strlcpy((char *)a3, "gain", 0x34uLL);
    *(void *)(a3 + 72) = @"gain";
    *(_DWORD *)(a3 + 96) |= 0xC8000000;
  }
  *(unsigned char *)(a3 + 104) = 1;
  return result;
}

void sub_248939D54(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::getParameterList(int a1@<W1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (!a1)
  {
    uint64_t v3 = operator new(8uLL);
    *a2 = v3;
    *v3++ = 0x100000000;
    a2[1] = v3;
    a2[2] = v3;
  }
}

float AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::getParameter(uint64_t a1, int a2, int a3)
{
  if (!(a3 | a2)) {
    return *(float *)(a1 + 776);
  }
  if (a2 != 1 || a3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v6, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
    std::string::basic_string[abi:ne180100]<0>(&v5, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(&v4, &byte_248942E06);
    AudioDSPGraph::ThrowException(-10878, &v6, 2770, &v5, &v4);
  }
  float result = 1.0;
  if (!*(unsigned char *)(a1 + 780)) {
    return 0.0;
  }
  return result;
}

void sub_248939E48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

float AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::setParameter(uint64_t a1, int a2, int a3, float result)
{
  if (a3 | a2)
  {
    if (a2 != 1 || a3)
    {
      std::string::basic_string[abi:ne180100]<0>(&v7, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v6, "setParameter");
      std::string::basic_string[abi:ne180100]<0>(&v5, &byte_248942E06);
      AudioDSPGraph::ThrowException(-10878, &v7, 2750, &v6, &v5);
    }
    *(unsigned char *)(a1 + 780) = result != 0.0;
  }
  else
  {
    *(float *)(a1 + 776) = result;
  }
  if (!*(unsigned char *)(*(void *)(a1 + 8) + 730) || *(unsigned char *)(a1 + 812))
  {
    float v4 = 0.0;
    if (!*(unsigned char *)(a1 + 780)) {
      float v4 = 1.0;
    }
    float result = *(float *)(a1 + 776) * v4;
    *(float *)(a1 + 804) = result;
    *(float *)(a1 + 808) = result;
  }
  return result;
}

void sub_248939F64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::canProcessInPlace()
{
  return 1;
}

const char *AudioDSPGraph::GenericGainBox<AudioDSPGraph::LinearGainPolicy>::ClassName()
{
  return "gain";
}

void AudioDSPGraph::GainBox::~GainBox(AudioDSPGraph::GainBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

float AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::reset(uint64_t a1)
{
  float v1 = 0.0;
  if (!*(unsigned char *)(a1 + 780)) {
    float v1 = 1.0;
  }
  float result = *(float *)(a1 + 776) * v1;
  *(float *)(a1 + 804) = result;
  *(_WORD *)(a1 + 812) = 257;
  return result;
}

BOOL AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::initialize(AudioDSPGraph::Box *a1)
{
  AudioDSPGraph::Box::initialize(a1);
  uint64_t v2 = AudioDSPGraph::Box::in(a1, 0);
  uint64_t v3 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  uint64_t v4 = AudioDSPGraph::Box::out(a1, 0);
  uint64_t v6 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120);
  *((unsigned char *)a1 + 813) = 1;
  int v7 = *(_DWORD *)(v3 + 8);
  if (v7 == 1819304813)
  {
    int v8 = *(_DWORD *)(v3 + 12);
    if ((v8 & 1) == 0) {
      goto LABEL_60;
    }
    int v9 = *(_DWORD *)(v3 + 32);
    if (v9 != 32) {
      goto LABEL_60;
    }
  }
  else
  {
    if (v7 != 1718773105 || (int v9 = *(_DWORD *)(v3 + 32), v9 != 64))
    {
LABEL_60:
      std::string::basic_string[abi:ne180100]<0>(&v44, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v43, "initialize");
      std::string::basic_string[abi:ne180100]<0>(&v42, "GainBox input format must be non-interleaved float or 'freq'");
      AudioDSPGraph::ThrowException(1718449215, &v44, 2620, &v43, (long long *)&v42);
    }
    int v8 = *(_DWORD *)(v3 + 12);
  }
  if ((v8 & 0x20) == 0) {
    goto LABEL_60;
  }
  int v10 = *(_DWORD *)(v6 + 8);
  if (v10 == 1819304813)
  {
    int v11 = *(_DWORD *)(v6 + 12);
    if ((v11 & 1) == 0) {
      goto LABEL_61;
    }
    int v12 = *(_DWORD *)(v6 + 32);
    if (v12 != 32) {
      goto LABEL_61;
    }
  }
  else
  {
    if (v10 != 1718773105 || (int v12 = *(_DWORD *)(v6 + 32), v12 != 64))
    {
LABEL_61:
      std::string::basic_string[abi:ne180100]<0>(&v44, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v43, "initialize");
      std::string::basic_string[abi:ne180100]<0>(&v42, "GainBox output format must be non-interleaved float or 'freq'");
      AudioDSPGraph::ThrowException(1718449215, &v44, 2624, &v43, (long long *)&v42);
    }
    int v11 = *(_DWORD *)(v6 + 12);
  }
  if ((v11 & 0x20) == 0) {
    goto LABEL_61;
  }
  if (*(double *)v3 == 0.0)
  {
    if (v7 != v10) {
      goto LABEL_53;
    }
  }
  else
  {
    BOOL v13 = *(double *)v6 == 0.0;
    if (*(double *)v3 == *(double *)v6) {
      BOOL v13 = 1;
    }
    if (v7 != v10 || !v13)
    {
LABEL_53:
      std::string::basic_string[abi:ne180100]<0>(&v44, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v43, "initialize");
      CA::StreamDescription::AsString((CA::StreamDescription *)&v38, (void *)v3, v28, v29);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v39, "GainBox input and output formats don't match (", &v38);
      *(void *)&double v30 = std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v40, &v39, " != ").n128_u64[0];
      CA::StreamDescription::AsString((CA::StreamDescription *)v36, (void *)v6, v30, v31);
      if ((v37 & 0x80u) == 0) {
        long long v32 = (const std::string::value_type *)v36;
      }
      else {
        long long v32 = (const std::string::value_type *)v36[0];
      }
      if ((v37 & 0x80u) == 0) {
        std::string::size_type v33 = v37;
      }
      else {
        std::string::size_type v33 = v36[1];
      }
      uint64_t v34 = std::string::append(&v40, v32, v33);
      long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
      v41.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v35;
      v34->__r_.__value_.__l.__size_ = 0;
      v34->__r_.__value_.__r.__words[2] = 0;
      v34->__r_.__value_.__r.__words[0] = 0;
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v42, &v41, ")");
      AudioDSPGraph::ThrowException(1718449215, &v44, 2632, &v43, (long long *)&v42);
    }
  }
  int v14 = *(_DWORD *)(v3 + 16);
  if (v14)
  {
    int v15 = *(_DWORD *)(v6 + 16);
    if (v15 && v14 != v15) {
      goto LABEL_53;
    }
  }
  int v17 = *(_DWORD *)(v3 + 20);
  if (v17)
  {
    int v18 = *(_DWORD *)(v6 + 20);
    if (v18 && v17 != v18) {
      goto LABEL_53;
    }
  }
  int v20 = *(_DWORD *)(v3 + 24);
  if (v20)
  {
    int v21 = *(_DWORD *)(v6 + 24);
    if (v21 && v20 != v21) {
      goto LABEL_53;
    }
  }
  int v23 = *(_DWORD *)(v3 + 28);
  if (v23)
  {
    int v24 = *(_DWORD *)(v6 + 28);
    if (v23 != v24 && v24 != 0 || v9 != v12) {
      goto LABEL_53;
    }
  }
  else if (v9 != v12)
  {
    goto LABEL_53;
  }
  BOOL result = CA::Implementation::EquivalentFormatFlags((CA::Implementation *)v3, (const AudioStreamBasicDescription *)v6, v5);
  if (!result) {
    goto LABEL_53;
  }
  return result;
}

void sub_24893A390(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (*(char *)(v38 - 81) < 0) {
    operator delete(*(void **)(v38 - 104));
  }
  if (a38 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (*(char *)(v38 - 57) < 0) {
    operator delete(*(void **)(v38 - 80));
  }
  if (*(char *)(v38 - 33) < 0) {
    operator delete(*(void **)(v38 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::process(AudioDSPGraph::Box *a1, unsigned int a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = AudioDSPGraph::Box::in(a1, 0);
  long long v5 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 80);
  uint64_t v6 = AudioDSPGraph::Box::out(v3, 0);
  uint64_t v7 = *(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
  uint64_t v8 = AudioDSPGraph::Box::out(v3, 0);
  int v54 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120) + 8);
  uint64_t v9 = *v5;
  if (*((unsigned char *)v3 + 812)) {
    *((unsigned char *)v3 + 812) = 0;
  }
  size_t v10 = (4 * a2) << (v54 == 1718773105);
  if (*((unsigned char *)v3 + 813))
  {
    float v11 = 0.0;
    if (!*((unsigned char *)v3 + 780)) {
      float v11 = 1.0;
    }
    *((float *)v3 + 202) = *((float *)v3 + 194) * v11;
  }
  uint64_t v12 = AudioDSPGraph::Box::in(v3, 0);
  if ((*(unsigned char *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12) + 56) + 72) & 0x10) != 0)
  {
    if (v9)
    {
      int v21 = (void **)(v7 + 16);
      do
      {
        bzero(*v21, v10);
        *((_DWORD *)v21 - 1) = v10;
        v21 += 2;
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    vDSP_Length v13 = a2;
    float v14 = *((float *)v3 + 201);
    int v15 = (const float *)((char *)v3 + 808);
    float v16 = *((float *)v3 + 202);
    if (v14 == v16)
    {
      if (v9)
      {
        int v17 = (float **)(v7 + 16);
        int v18 = (const float **)(v5 + 4);
        do
        {
          int v19 = *v18;
          int v20 = *v17;
          vDSP_vsmul(*v18, 1, (const float *)v3 + 202, *v17, 1, v13);
          if (v54 == 1718773105) {
            vDSP_vsmul(&v19[v13], 1, (const float *)v3 + 202, &v20[v13], 1, v13);
          }
          *((_DWORD *)v17 - 1) = v10;
          v17 += 2;
          v18 += 2;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      if (*((unsigned char *)v3 + 813))
      {
        double v22 = *((double *)v3 + 98);
        float v23 = (float)(v16 - v14) / (float)(v22 * (double)AudioDSPGraph::Box::sampleRate(v3));
        *((float *)v3 + 200) = v23;
        float v14 = *((float *)v3 + 201);
      }
      else
      {
        float v23 = *((float *)v3 + 200);
      }
      *((unsigned char *)v3 + 813) = 0;
      int v24 = (const float *)((char *)v3 + 800);
      float v25 = v14 + (float)(v23 * (float)a2);
      if ((v23 <= 0.0 || (float v26 = *v15, v25 <= *v15)) && (v23 >= 0.0 || (float v26 = *v15, v25 >= *v15)))
      {
        if (v9)
        {
          long long v32 = (float **)(v7 + 16);
          std::string::size_type v33 = (const float **)(v5 + 4);
          do
          {
            uint64_t v34 = *v33;
            long long v35 = *v32;
            float v55 = *((float *)v3 + 201);
            vDSP_vrampmul(v34, 1, &v55, (const float *)v3 + 200, v35, 1, v13);
            if (v54 == 1718773105)
            {
              float v55 = *((float *)v3 + 201);
              vDSP_vrampmul(&v34[v13], 1, &v55, (const float *)v3 + 200, &v35[v13], 1, v13);
            }
            v32 += 2;
            v33 += 2;
            --v9;
          }
          while (v9);
        }
      }
      else if (v9)
      {
        vDSP_Length v27 = fabsf((float)(v26 - v14) / v23);
        vDSP_Length __N = a2 - v27;
        int v52 = (const float *)((char *)v3 + 800);
        double v28 = (float **)(v7 + 16);
        int16x8_t v29 = (const float **)(v5 + 4);
        int v53 = (float *)v3;
        do
        {
          double v30 = *v29;
          int16x8_t v31 = *v28;
          float __Start = *((float *)v3 + 201);
          vDSP_vrampmul(v30, 1, &__Start, v24, v31, 1, v27);
          vDSP_vsmul(&v30[v27], 1, v15, &v31[v27], 1, __N);
          if (v54 == 1718773105)
          {
            float __Start = v53[201];
            vDSP_vrampmul(&v30[v13], 1, &__Start, v52, &v31[v13], 1, v27);
            vDSP_vsmul(&v30[v27 + v13], 1, v15, &v31[v27 + v13], 1, __N);
          }
          v28 += 2;
          v29 += 2;
          --v9;
          int v24 = v52;
          uint64_t v3 = (AudioDSPGraph::Box *)v53;
        }
        while (v9);
        float v25 = *v15;
      }
      else
      {
        float v25 = v26;
      }
      *((float *)v3 + 201) = v25;
    }
  }
  if (*((unsigned char *)v3 + 813)) {
    int v36 = 16 * (*((float *)v3 + 202) == 0.0);
  }
  else {
    int v36 = 0;
  }
  uint64_t v37 = AudioDSPGraph::Box::in(v3, 0);
  int v38 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v37 + 40))(v37) + 56) + 72);
  uint64_t v39 = AudioDSPGraph::Box::in(v3, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v39 + 40))(v39);
  std::string v41 = (uint64_t *)*((void *)v3 + 11);
  std::string v42 = (uint64_t *)*((void *)v3 + 12);
  if (v41 != v42)
  {
    int v43 = v38 | v36;
    long long v44 = (_OWORD *)(*(void *)(result + 56) + 8);
    uint64_t result = *((void *)v3 + 11);
    long long v45 = (uint64_t *)result;
    do
    {
      uint64_t v46 = *v45;
      v45 += 4;
      uint64_t v47 = *(void *)((*(uint64_t (**)(uint64_t))(v46 + 40))(result) + 56);
      long long v49 = v44[2];
      long long v48 = v44[3];
      long long v50 = v44[1];
      *(_OWORD *)(v47 + 8) = *v44;
      *(_OWORD *)(v47 + 24) = v50;
      *(_OWORD *)(v47 + 40) = v49;
      *(_OWORD *)(v47 + 56) = v48;
      *(_DWORD *)(v47 + 72) = v43;
      v41 += 4;
      uint64_t result = (uint64_t)v45;
    }
    while (v45 != v42);
  }
  if (*((float *)v3 + 201) == *((float *)v3 + 202)) {
    *((unsigned char *)v3 + 813) = 1;
  }
  return result;
}

uint64_t AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::setProperty(double *a1, int a2, int a3, unsigned int a4, int a5, double *a6)
{
  if (a2 != 3098) {
    return AudioDSPGraph::Box::setProperty((AudioDSPGraph::Box *)a1, a2, a3, a4, a5, a6);
  }
  if (a5 != 8) {
    return 561211770;
  }
  if (a3) {
    return 4294956430;
  }
  double v8 = *a6;
  a1[98] = *a6;
  double v9 = a1[99];
  uint64_t v6 = 0;
  if (v8 < v9) {
    a1[98] = v9;
  }
  return v6;
}

double AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::getProperty(AudioDSPGraph::Box *this, int a2, uint64_t a3, uint64_t a4, unsigned int *a5, CFStringRef *a6)
{
  if (a2 == 3098)
  {
    if (*a5 == 8 && a6 && !a3)
    {
      double result = *((double *)this + 98);
      *(double *)a6 = result;
    }
  }
  else
  {
    AudioDSPGraph::Box::getProperty(this, a2, a3, a4, a5, a6);
  }
  return result;
}

unint64_t AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::getPropertyInfo(AudioDSPGraph::Box *a1, int a2, int a3)
{
  if (a2 == 3098)
  {
    uint64_t v3 = 8;
    if (a3)
    {
      uint64_t v3 = 4294956430;
      unint64_t v4 = 0;
    }
    else
    {
      unint64_t v4 = 0x100000000;
    }
  }
  else
  {
    uint64_t PropertyInfo = AudioDSPGraph::Box::getPropertyInfo(a1, a2, a3);
    unint64_t v4 = PropertyInfo & 0xFFFFFFFF00000000;
    uint64_t v3 = PropertyInfo;
  }
  return v4 | v3;
}

double AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 3.64150051e175;
  *(_OWORD *)a1 = xmmword_24893BDB0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

size_t AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::getParameterInfo@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v4 = -10866;
LABEL_3:
    *(_DWORD *)a3 = v4;
    *(unsigned char *)(a3 + 104) = 0;
    return result;
  }
  if (a2 == 1)
  {
    uint64_t v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    DWORD2(v14) = 1065353216;
    LODWORD(v14) = 2;
    size_t result = strlcpy((char *)&v9, "mute", 0x34uLL);
    *((void *)&v13 + 1) = @"mute";
    LODWORD(v15) = v15 | 0xC8000000;
    long long v6 = v10;
    *(_OWORD *)a3 = v9;
    *(_OWORD *)(a3 + 16) = v6;
    long long v7 = v12;
    *(_OWORD *)(a3 + 32) = v11;
    *(_OWORD *)(a3 + 48) = v7;
    long long v8 = v14;
    *(_OWORD *)(a3 + 64) = v13;
    *(_OWORD *)(a3 + 80) = v8;
    *(void *)(a3 + 96) = v15;
  }
  else
  {
    if (a2)
    {
      int v4 = -10878;
      goto LABEL_3;
    }
    *(void *)(a3 + 96) = 0;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(void *)(a3 + 84) = 0x41C00000C3480000;
    *(_DWORD *)(a3 + 80) = 13;
    size_t result = strlcpy((char *)a3, "dbgain", 0x34uLL);
    *(void *)(a3 + 72) = @"dbgain";
    *(_DWORD *)(a3 + 96) |= 0xC8000000;
  }
  *(unsigned char *)(a3 + 104) = 1;
  return result;
}

void sub_24893AC2C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::getParameterList(int a1@<W1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (!a1)
  {
    uint64_t v3 = operator new(8uLL);
    *a2 = v3;
    *v3++ = 0x100000000;
    a2[1] = v3;
    a2[2] = v3;
  }
}

float AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::getParameter(uint64_t a1, int a2, int a3)
{
  if (a3 | a2)
  {
    if (a2 != 1 || a3)
    {
      std::string::basic_string[abi:ne180100]<0>(&v7, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v6, "getParameter");
      std::string::basic_string[abi:ne180100]<0>(&v5, &byte_248942E06);
      AudioDSPGraph::ThrowException(-10878, &v7, 2770, &v6, &v5);
    }
    float result = 1.0;
    if (!*(unsigned char *)(a1 + 780)) {
      return 0.0;
    }
  }
  else
  {
    float v4 = *(float *)(a1 + 776);
    if (v4 < 1.0e-10) {
      float v4 = 1.0e-10;
    }
    return log10f(v4) * 20.0;
  }
  return result;
}

void sub_24893AD3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

float AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::setParameter(uint64_t a1, int a2, int a3, float result)
{
  if (a3 | a2)
  {
    if (a2 != 1 || a3)
    {
      std::string::basic_string[abi:ne180100]<0>(&v8, "/Library/Caches/com.apple.xbs/Sources/AudioDSPGraph/Library/AudioDSPGraph/Box.cpp");
      std::string::basic_string[abi:ne180100]<0>(&v7, "setParameter");
      std::string::basic_string[abi:ne180100]<0>(&v6, &byte_248942E06);
      AudioDSPGraph::ThrowException(-10878, &v8, 2750, &v7, &v6);
    }
    *(unsigned char *)(a1 + 780) = result != 0.0;
  }
  else
  {
    float result = __exp10f(result / 20.0);
    *(float *)(a1 + 776) = result;
  }
  if (!*(unsigned char *)(*(void *)(a1 + 8) + 730) || *(unsigned char *)(a1 + 812))
  {
    float v5 = 0.0;
    if (!*(unsigned char *)(a1 + 780)) {
      float v5 = 1.0;
    }
    float result = *(float *)(a1 + 776) * v5;
    *(float *)(a1 + 804) = result;
    *(float *)(a1 + 808) = result;
  }
  return result;
}

void sub_24893AE68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::canProcessInPlace()
{
  return 1;
}

const char *AudioDSPGraph::GenericGainBox<AudioDSPGraph::DecibelGainPolicy>::ClassName()
{
  return "dbgain";
}

void AudioDSPGraph::DBGainBox::~DBGainBox(AudioDSPGraph::DBGainBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

float AudioDSPGraph::Boxes::AverageBox::process(AudioDSPGraph::Boxes::AverageBox *this, unsigned int a2)
{
  AudioDSPGraph::SumBox::process(this, a2);
  uint64_t v4 = AudioDSPGraph::Box::out(this, 0);
  if ((*(unsigned char *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 56) + 72) & 0x10) == 0)
  {
    uint64_t v6 = AudioDSPGraph::Box::out(this, 0);
    long long v7 = *(const float ***)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) + 80);
    uint64_t v8 = (*((void *)this + 9) - *((void *)this + 8)) >> 5;
    if (v8 < 2)
    {
      uint64_t v11 = AudioDSPGraph::Box::in(this, 0);
      float v12 = 1.0
          / (float)**(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v11 + 40))(v11) + 56)
                                     + 80);
      vDSP_vsmul(v7[2], 1, &v12, (float *)v7[2], 1, a2);
    }
    else
    {
      float result = 1.0 / (float)v8;
      float __B = result;
      if (*(_DWORD *)v7)
      {
        unint64_t v9 = 0;
        uint64_t v10 = 2;
        do
        {
          vDSP_vsmul(v7[v10], 1, &__B, (float *)v7[v10], 1, a2);
          ++v9;
          v10 += 2;
        }
        while (v9 < *(unsigned int *)v7);
      }
    }
  }
  return result;
}

double AudioDSPGraph::Boxes::AverageBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 3.15583197e161;
  *(_OWORD *)a1 = xmmword_24893BF60;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

const char *AudioDSPGraph::Boxes::AverageBox::ClassName(AudioDSPGraph::Boxes::AverageBox *this)
{
  return "average";
}

void AudioDSPGraph::Boxes::AverageBox::~AverageBox(AudioDSPGraph::Boxes::AverageBox *this)
{
  AudioDSPGraph::Box::~Box(this);

  JUMPOUT(0x24C585790);
}

OSStatus AUEventListenerNotify(AUEventListenerRef inSendingListener, void *inSendingObject, const AudioUnitEvent *inEvent)
{
  return MEMORY[0x270F0FC58](inSendingListener, inSendingObject, inEvent);
}

OSStatus AudioComponentCopyName(AudioComponent inComponent, CFStringRef *outName)
{
  return MEMORY[0x270F0FC78](inComponent, outName);
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x270F0FC80](inComponent, inDesc);
}

Boolean AudioComponentInstanceCanDo(AudioComponentInstance inInstance, SInt16 inSelectorID)
{
  return MEMORY[0x270F0FC98](inInstance, inSelectorID);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x270F0FCA0](inInstance);
}

AudioComponent AudioComponentInstanceGetComponent(AudioComponentInstance inInstance)
{
  return (AudioComponent)MEMORY[0x270F0FCA8](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x270F0FCB0](inComponent, outInstance);
}

OSStatus AudioConverterConvertComplexBuffer(AudioConverterRef inAudioConverter, UInt32 inNumberPCMFrames, const AudioBufferList *inInputData, AudioBufferList *outOutputData)
{
  return MEMORY[0x270F0FCC8](inAudioConverter, *(void *)&inNumberPCMFrames, inInputData, outOutputData);
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x270F0FCD0](inAudioConverter);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x270F0FCD8](inSourceFormat, inDestinationFormat, outAudioConverter);
}

uint64_t AudioSampleRateConverterCreate()
{
  return MEMORY[0x270F0FD00]();
}

uint64_t AudioSampleRateConverterDispose()
{
  return MEMORY[0x270F0FD08]();
}

uint64_t AudioSampleRateConverterGetExpectedNumberOfOutputFrames()
{
  return MEMORY[0x270F0FD10]();
}

uint64_t AudioSampleRateConverterGetLatency()
{
  return MEMORY[0x270F0FD18]();
}

uint64_t AudioSampleRateConverterProcessAudioBufferLists()
{
  return MEMORY[0x270F0FD30]();
}

uint64_t AudioSampleRateConverterReset()
{
  return MEMORY[0x270F0FD38]();
}

OSStatus AudioUnitGetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue *outValue)
{
  return MEMORY[0x270F0FD50](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outValue);
}

OSStatus AudioUnitGetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x270F0FD58](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outData, ioDataSize);
}

OSStatus AudioUnitGetPropertyInfo(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, UInt32 *outDataSize, Boolean *outWritable)
{
  return MEMORY[0x270F0FD60](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outDataSize, outWritable);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x270F0FD68](inUnit);
}

OSStatus AudioUnitProcess(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x270F0FD70](inUnit, ioActionFlags, inTimeStamp, *(void *)&inNumberFrames, ioData);
}

OSStatus AudioUnitProcessMultiple(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inNumberFrames, UInt32 inNumberInputBufferLists, const AudioBufferList **inInputBufferLists, UInt32 inNumberOutputBufferLists, AudioBufferList **ioOutputBufferLists)
{
  return MEMORY[0x270F0FD78](inUnit, ioActionFlags, inTimeStamp, *(void *)&inNumberFrames, *(void *)&inNumberInputBufferLists, inInputBufferLists, *(void *)&inNumberOutputBufferLists, ioOutputBufferLists);
}

OSStatus AudioUnitReset(AudioUnit inUnit, AudioUnitScope inScope, AudioUnitElement inElement)
{
  return MEMORY[0x270F0FD98](inUnit, *(void *)&inScope, *(void *)&inElement);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x270F0FDA8](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, *(void *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270F0FDB0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

OSStatus AudioUnitUninitialize(AudioUnit inUnit)
{
  return MEMORY[0x270F0FDB8](inUnit);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53C0](allocator, buffer, bufLen, isDirectory);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
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

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x270F0FDF0](inExtAudioFile, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t caulk::concurrent::details::lf_read_sync_write_impl::lf_read_sync_write_impl(caulk::concurrent::details::lf_read_sync_write_impl *this)
{
  return MEMORY[0x270F87A90](this);
}

uint64_t caulk::alloc::global_page_cache::instance(caulk::alloc::global_page_cache *this)
{
  return MEMORY[0x270F87B98](this);
}

uint64_t caulk::alloc::details::caching_page_allocator_base::deallocate()
{
  return MEMORY[0x270F87BA0]();
}

uint64_t caulk::alloc::details::caching_page_allocator_base::allocate(caulk::alloc::details::caching_page_allocator_base *this)
{
  return MEMORY[0x270F87BA8](this);
}

uint64_t caulk::concurrent::details::lf_read_sync_write_impl::begin_access(caulk::concurrent::details::lf_read_sync_write_impl *this)
{
  return MEMORY[0x270F87C20](this);
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

{
  return (std::runtime_error *)MEMORY[0x270F983C8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
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

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x270F98838](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x270F98848](this);
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
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

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

float __exp10f(float a1)
{
  MEMORY[0x270ED7DD0](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __udivti3()
{
  return MEMORY[0x270ED7F10]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
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

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int sched_yield(void)
{
  return MEMORY[0x270EDB320]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

void vDSP_DFT_DestroySetup(vDSP_DFT_Setup __Setup)
{
}

void vDSP_DFT_Execute(const vDSP_DFT_SetupStruct *__Setup, const float *__Ir, const float *__Ii, float *__Or, float *__Oi)
{
}

vDSP_DFT_Setup vDSP_DFT_zrop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x270EDE950](__Previous, __Length, *(void *)&__Direction);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_maxmgv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmax(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmin(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vrampmul(const float *__I, vDSP_Stride __IS, float *__Start, const float *__Step, float *__O, vDSP_Stride __OS, vDSP_Length __N)
{
}

void vDSP_vrampmuladd(const float *__I, vDSP_Stride __IS, float *__Start, const float *__Step, float *__O, vDSP_Stride __OS, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zrvadd(const DSPSplitComplex *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zrvdiv(const DSPSplitComplex *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zrvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zrvsub(const DSPSplitComplex *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvabs(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvadd(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvdiv(const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
}

void vDSP_zvneg(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvsub(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}