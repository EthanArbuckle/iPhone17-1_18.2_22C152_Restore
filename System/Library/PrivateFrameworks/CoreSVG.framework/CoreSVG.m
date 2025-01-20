uint64_t CFRetainedFinalize(void *a1)
{
  uint64_t result;

  result = a1[2];
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void ___ZL18is_verbose_loggingv_block_invoke()
{
  if (!is_verbose_logging(void)::isVerbose)
  {
    v0 = getenv("CORESVG_VERBOSE");
    is_verbose_logging(void)::isVerbose = v0 != 0;
    if (!v0) {
      printf("CoreSVG has logged an error. Set environment variabe \"%s\" to learn more.\n", "CORESVG_VERBOSE");
    }
  }
}

void ___ZL16GetClassRegistryv_block_invoke()
{
}

uint64_t CGSVGAttributeGetFloat(uint64_t a1, char *a2)
{
  v3 = (os_unfair_lock_s *)CFRetained::getObject<SVGAttribute>(a1, a2);
  return SVGAttribute::floatValue(v3, (double *)a2);
}

void SVGPaint::~SVGPaint(SVGPaint *this)
{
  SVGPaint::~SVGPaint(this);
  JUMPOUT(0x216677AD0);
}

{
  *(void *)this = &unk_26C30A3F0;
  CFRetained::release(*((void *)this + 13));
  CFRetained::release(*((void *)this + 14));
  *(void *)this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

void SVGAttribute::~SVGAttribute(SVGAttribute *this)
{
  SVGAttribute::~SVGAttribute(this);
  JUMPOUT(0x216677AD0);
}

{
  unsigned int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  *(void *)this = &unk_26C30A150;
  v2 = *((_DWORD *)this + 20);
  if (v2 <= 8)
  {
    if (((1 << v2) & 0x1D8) != 0)
    {
      CFRetained::release(*((void *)this + 11));
    }
    else if (v2 == 1)
    {
      v5 = *((void *)this + 11);
      if (v5)
      {
        v6 = *(void **)v5;
        if (*(void *)v5)
        {
          *(void *)(v5 + 8) = v6;
          operator delete(v6);
        }
        MEMORY[0x216677AD0](v5, 0x80C40D6874129);
      }
    }
  }
  v3 = *((void *)this + 12);
  if (v3)
  {
    v4 = *(void **)v3;
    if (*(void *)v3)
    {
      *(void *)(v3 + 8) = v4;
      operator delete(v4);
    }
    MEMORY[0x216677AD0](v3, 0x20C40960023A9);
  }
  if (*((char *)this + 79) < 0) {
    operator delete(*((void **)this + 7));
  }
  *(void *)this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

void CFRetained::release(uint64_t a1)
{
  if (a1) {
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

uint64_t std::map<std::string,unsigned int,CaseInsensitiveStringLess,std::allocator<std::pair<std::string const,unsigned int>>>::map[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  v4 = (void *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,unsigned int> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 32;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_210A202B4(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,unsigned int> const&>(uint64_t **a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_equal<std::string>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::pair<std::string const,unsigned int> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(a1, v10, v6, v8);
    return v8;
  }
  return result;
}

void std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::pair<std::string const,unsigned int> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    *((void *)v6 + 6) = *(void *)(a2 + 16);
  }
  *((_DWORD *)v6 + 14) = *(_DWORD *)(a2 + 24);
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_210A203DC(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_equal<std::string>(void *a1, void *a2, void *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v9 = a1 + 1;
  if (a1 + 1 != a2
    && !std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100]((uint64_t)(a1 + 2), a5, (uint64_t)(a2 + 4)))
  {
    if (!std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (uint64_t)(a2 + 4), a5))
    {
      *a3 = a2;
      *a4 = (uint64_t)a2;
      return a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      v14 = (void *)a2[1];
      do
      {
        v15 = v14;
        v14 = (void *)*v14;
      }
      while (v14);
    }
    else
    {
      v18 = a2;
      do
      {
        v15 = (void *)v18[2];
        BOOL v17 = *v15 == (void)v18;
        v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100]((uint64_t)(a1 + 2), a5, (uint64_t)(v15 + 4)))goto LABEL_28; {
      uint64_t v13 = *a4;
      }
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = a2;
    }
    return a4;
  }
  if ((void *)*a1 == a2)
  {
    v12 = a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = a2;
      return a2;
    }
  }
  v11 = (void *)*a2;
  if (*a2)
  {
    do
    {
      v12 = v11;
      v11 = (void *)v11[1];
    }
    while (v11);
  }
  else
  {
    v16 = a2;
    do
    {
      v12 = (void *)v16[2];
      BOOL v17 = *v12 == (void)v16;
      v16 = v12;
    }
    while (v17);
  }
  if (std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (uint64_t)(v12 + 4), a5))goto LABEL_16; {
LABEL_28:
  }
  return std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
}

void *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::find<std::string>(uint64_t a1, uint64_t a2)
{
  v2 = (void *)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = (void *)(a1 + 8);
  do
  {
    int v7 = std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v5, (uint64_t)(v3 + 4), a2);
    v8 = v3 + 1;
    if (!v7)
    {
      v8 = v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = (void *)*v8;
  }
  while (*v8);
  if (v6 == v2
    || std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v5, a2, (uint64_t)(v6 + 4)))
  {
    return v2;
  }
  return v6;
}

uint64_t std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v10 = *(std::string *)a2;
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v9 = *(std::string *)a3;
  }
  char v4 = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v5 = &v10;
  }
  else {
    uint64_t v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    v8 = (void *)v9.__r_.__value_.__r.__words[0];
    unsigned int v6 = strcasecmp((const char *)v5, v9.__r_.__value_.__l.__data_);
    operator delete(v8);
    if ((*((unsigned char *)&v10.__r_.__value_.__s + 23) & 0x80) == 0) {
      return v6 >> 31;
    }
    goto LABEL_12;
  }
  unsigned int v6 = strcasecmp((const char *)v5, (const char *)&v9);
  if (v4 < 0) {
LABEL_12:
  }
    operator delete(v10.__r_.__value_.__l.__data_);
  return v6 >> 31;
}

{
  char v4;
  std::string *v5;
  unsigned int v6;
  void *v8;
  std::string v9;
  std::string v10;

  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v10 = *(std::string *)a2;
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v9 = *(std::string *)a3;
  }
  char v4 = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v5 = &v10;
  }
  else {
    uint64_t v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    v8 = (void *)v9.__r_.__value_.__r.__words[0];
    unsigned int v6 = strcasecmp((const char *)v5, v9.__r_.__value_.__l.__data_);
    operator delete(v8);
    if ((*((unsigned char *)&v10.__r_.__value_.__s + 23) & 0x80) == 0) {
      return v6 >> 31;
    }
    goto LABEL_12;
  }
  unsigned int v6 = strcasecmp((const char *)v5, (const char *)&v9);
  if (v4 < 0) {
LABEL_12:
  }
    operator delete(v10.__r_.__value_.__l.__data_);
  return v6 >> 31;
}

void sub_210A2070C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_210A20800(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGStyle::addDefinitionsFromCSS(SVGStyle *this, SVGParser *a2)
{
  SVGParser::ParseRulesetList(a2, v9);
  if (v9[0] != v9[1])
  {
    if (*(char *)(v9[0] + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)v9[0], *(void *)(v9[0] + 8));
    }
    else
    {
      long long v2 = *(_OWORD *)v9[0];
      v8.__r_.__value_.__r.__words[2] = *(void *)(v9[0] + 16);
      *(_OWORD *)&v8.__r_.__value_.__l.__data_ = v2;
    }
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v6, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
    }
    else {
      std::string v6 = v8;
    }
    SVGParser::ParseSelectorListFromRuleset((char *)&v6, &v7);
    if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v6.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v4, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
    }
    else {
      std::string v4 = v8;
    }
    SVGParser::ParseDeclarationBlockFromRuleset((char *)&v4, 0, &v5);
    if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v4.__r_.__value_.__l.__data_);
    }
    operator new();
  }
  v3.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
}

void sub_210A20B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34,uint64_t a35,uint64_t a36,void *__p,uint64_t a38,int a39,__int16 a40,char a41,char a42,char a43)
{
  a15 = (void *)(v43 - 184);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a15);
  if (*(char *)(v43 - 137) < 0) {
    operator delete(*(void **)(v43 - 160));
  }
  a15 = (void *)(v43 - 136);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a15);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  long long v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    std::string v3 = **a1;
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

BOOL SVGStyle::getAttributeMapForIdentifier(SVGStyle *this, char *a2, SVGAttributeMap *a3)
{
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  uint64_t v5 = std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::find<std::string>((uint64_t)this, (uint64_t)__p);
  if ((void *)((char *)this + 8) == v5) {
    std::string v6 = 0;
  }
  else {
    std::string v6 = (const SVGAttributeMap *)v5[7];
  }
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  if (v6) {
    SVGAttributeMap::setAttributes(a3, v6);
  }
  return v6 != 0;
}

void sub_210A20DE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::find<std::string>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(a1 + 8);
  std::string v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  std::string v6 = (void *)(a1 + 8);
  do
  {
    int v7 = std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v5, (uint64_t)(v3 + 4), a2);
    std::string v8 = v3 + 1;
    if (!v7)
    {
      std::string v8 = v3;
      std::string v6 = v3;
    }
    std::string v3 = (void *)*v8;
  }
  while (*v8);
  if (v6 == v2
    || std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v5, a2, (uint64_t)(v6 + 4)))
  {
    return v2;
  }
  return v6;
}

uint64_t *std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,SVGAttributeMap *>>(uint64_t **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t **)std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  result = *v5;
  if (!*v5)
  {
    std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__construct_node<std::pair<std::string const,SVGAttributeMap *>>((uint64_t)a1, a3, (uint64_t)&v7);
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(a1, v8, v5, v7);
    return v7;
  }
  return result;
}

void std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__construct_node<std::pair<std::string const,SVGAttributeMap *>>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  std::string v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  int v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    *((void *)v6 + 6) = *(void *)(a2 + 16);
  }
  *((void *)v6 + 7) = *(void *)(a2 + 24);
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_210A20F9C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__find_equal<std::string>(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  std::string v4 = *(void **)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = v4;
        uint64_t v9 = (uint64_t)(v4 + 4);
        if (!std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v7, a3, (uint64_t)(v4 + 4)))break; {
        std::string v4 = (void *)*v8;
        }
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v7, v9, a3))break; {
      uint64_t v5 = v8 + 1;
      }
      std::string v4 = (void *)v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v10 = *(std::string *)a2;
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v9 = *(std::string *)a3;
  }
  char v4 = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v5 = &v10;
  }
  else {
    uint64_t v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v8 = (void *)v9.__r_.__value_.__r.__words[0];
    unsigned int v6 = strcasecmp((const char *)v5, v9.__r_.__value_.__l.__data_);
    operator delete(v8);
    if ((*((unsigned char *)&v10.__r_.__value_.__s + 23) & 0x80) == 0) {
      return v6 >> 31;
    }
    goto LABEL_12;
  }
  unsigned int v6 = strcasecmp((const char *)v5, (const char *)&v9);
  if (v4 < 0) {
LABEL_12:
  }
    operator delete(v10.__r_.__value_.__l.__data_);
  return v6 >> 31;
}

{
  char v4;
  std::string *v5;
  unsigned int v6;
  void *v8;
  std::string v9;
  std::string v10;

  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v10 = *(std::string *)a2;
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v9 = *(std::string *)a3;
  }
  char v4 = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v5 = &v10;
  }
  else {
    uint64_t v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v8 = (void *)v9.__r_.__value_.__r.__words[0];
    unsigned int v6 = strcasecmp((const char *)v5, v9.__r_.__value_.__l.__data_);
    operator delete(v8);
    if ((*((unsigned char *)&v10.__r_.__value_.__s + 23) & 0x80) == 0) {
      return v6 >> 31;
    }
    goto LABEL_12;
  }
  unsigned int v6 = strcasecmp((const char *)v5, (const char *)&v9);
  if (v4 < 0) {
LABEL_12:
  }
    operator delete(v10.__r_.__value_.__l.__data_);
  return v6 >> 31;
}

void sub_210A21130(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__find_equal<std::string>(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  char v4 = *(void **)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = v4;
        uint64_t v9 = (uint64_t)(v4 + 4);
        if (!std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v7, a3, (uint64_t)(v4 + 4)))break; {
        char v4 = (void *)*v8;
        }
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v7, v9, a3))break; {
      uint64_t v5 = v8 + 1;
      }
      char v4 = (void *)v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v10 = *(std::string *)a2;
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v9 = *(std::string *)a3;
  }
  char v4 = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v5 = &v10;
  }
  else {
    uint64_t v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v8 = (void *)v9.__r_.__value_.__r.__words[0];
    unsigned int v6 = strcasecmp((const char *)v5, v9.__r_.__value_.__l.__data_);
    operator delete(v8);
    if ((*((unsigned char *)&v10.__r_.__value_.__s + 23) & 0x80) == 0) {
      return v6 >> 31;
    }
    goto LABEL_12;
  }
  unsigned int v6 = strcasecmp((const char *)v5, (const char *)&v9);
  if (v4 < 0) {
LABEL_12:
  }
    operator delete(v10.__r_.__value_.__l.__data_);
  return v6 >> 31;
}

{
  char v4;
  std::string *v5;
  unsigned int v6;
  void *v8;
  std::string v9;
  std::string v10;

  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v10 = *(std::string *)a2;
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v9 = *(std::string *)a3;
  }
  char v4 = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v5 = &v10;
  }
  else {
    uint64_t v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v8 = (void *)v9.__r_.__value_.__r.__words[0];
    unsigned int v6 = strcasecmp((const char *)v5, v9.__r_.__value_.__l.__data_);
    operator delete(v8);
    if ((*((unsigned char *)&v10.__r_.__value_.__s + 23) & 0x80) == 0) {
      return v6 >> 31;
    }
    goto LABEL_12;
  }
  unsigned int v6 = strcasecmp((const char *)v5, (const char *)&v9);
  if (v4 < 0) {
LABEL_12:
  }
    operator delete(v10.__r_.__value_.__l.__data_);
  return v6 >> 31;
}

void sub_210A212C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::find<std::string>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  unsigned int v6 = (void *)(a1 + 8);
  do
  {
    int v7 = std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v5, (uint64_t)(v3 + 4), a2);
    uint64_t v8 = v3 + 1;
    if (!v7)
    {
      uint64_t v8 = v3;
      unsigned int v6 = v3;
    }
    uint64_t v3 = (void *)*v8;
  }
  while (*v8);
  if (v6 == v2
    || std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v5, a2, (uint64_t)(v6 + 4)))
  {
    return v2;
  }
  return v6;
}

void sub_210A21448(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGAttributeMap::SVGAttributeMap(SVGAttributeMap *this)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttributeMap::kSVGAttributeMapClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A240;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 6) = (char *)this + 56;
}

void sub_210A214E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *CFRetained::CFRetained(void *a1, uint64_t a2)
{
  *a1 = &unk_26C309FB0;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  CFRetained::getTypeID(a2);
  uint64_t Instance = _CFRuntimeCreateInstance();
  a1[5] = Instance;
  *(void *)(Instance + 16) = a1;
  return a1;
}

void sub_210A21584(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CFRetained::getTypeID(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&CFRetained::getTypeID(std::string const&)::lock);
  if (GetClassRegistry(void)::onceToken != -1) {
    dispatch_once(&GetClassRegistry(void)::onceToken, &__block_literal_global_25);
  }
  uint64_t v2 = (uint64_t **)GetClassRegistry(void)::classRegistry;
  if (std::__tree<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>>>::__count_unique<std::string>(GetClassRegistry(void)::classRegistry, (const void **)a1))
  {
    uint64_t v3 = *(void *)std::map<std::string,std::pair<unsigned long,__CFRuntimeClass *>>::at((uint64_t)v2, (const void **)a1);
  }
  else
  {
    char v4 = malloc_type_calloc(1uLL, 0x60uLL, 0x10D00408820D60FuLL);
    if (*(char *)(a1 + 23) >= 0) {
      uint64_t v5 = (const char *)a1;
    }
    else {
      uint64_t v5 = *(const char **)a1;
    }
    v4[1] = strdup(v5);
    v4[4] = CFRetainedFinalize;
    uint64_t v3 = _CFRuntimeRegisterClass();
    if (*(char *)(a1 + 23) < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
    }
    else {
      std::string __p = *(std::string *)a1;
    }
    uint64_t v8 = v3;
    std::string v9 = v4;
    std::__tree<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::pair<unsigned long,__CFRuntimeClass *>>>(v2, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&CFRetained::getTypeID(std::string const&)::lock);
  return v3;
}

void sub_210A216E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__tree<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>>>::__count_unique<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = a1 + 16;
    uint64_t v5 = 1;
    do
    {
      if (!std::less<std::string>::operator()[abi:ne180100](v4, a2, v2 + 4))
      {
        if (!std::less<std::string>::operator()[abi:ne180100](v4, v2 + 4, a2)) {
          return v5;
        }
        ++v2;
      }
      uint64_t v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t std::map<std::string,std::pair<unsigned long,__CFRuntimeClass *>>::at(uint64_t a1, const void **a2)
{
  uint64_t v2 = *std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__find_equal<std::string>(a1, &v4, a2);
  if (!v2) {
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  }
  return v2 + 56;
}

void sub_210A21898(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
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

void *std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        std::string v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    std::string::size_type v6 = a2;
  }
  else {
    std::string::size_type v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

uint64_t SVGAtom::toName(os_unfair_lock_s *this, char *a2)
{
  if (!a2 || !*a2) {
    return 0;
  }
  int v4 = this + 22;
  os_unfair_lock_lock(this + 22);
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  size_t v5 = (unsigned int *)std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::find<std::string>((uint64_t)this, (uint64_t)__p);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  if (&this[2] == (os_unfair_lock_s *)v5)
  {
    os_unfair_lock_unlock(v4);
    return SVGAtom::insert((uint64_t)this, a2, 0);
  }
  uint64_t v6 = v5[14];
  os_unfair_lock_unlock(v4);
  if (!v6) {
    return SVGAtom::insert((uint64_t)this, a2, 0);
  }
  return v6;
}

void sub_210A21B20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
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

void SVGAttributeMap::SVGAttributeMap(SVGAttributeMap *this, const SVGAttributeMap *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttributeMap::kSVGAttributeMapClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  *((void *)this + 7) = 0;
  *((void *)this + 6) = (char *)this + 56;
  *(void *)this = &unk_26C30A240;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___ZN15SVGAttributeMapC2ERKS__block_invoke;
  v4[3] = &__block_descriptor_tmp_0;
  v4[4] = this;
  SVGAttributeMap::enumerate((uint64_t)a2, (uint64_t)v4);
}

void sub_210A21CD8(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::destroy(v2, *(void **)(v1 + 56));
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void SVGParser::ParseDeclarationBlockFromRuleset(char *__s@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  size_t v4 = __s;
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (__s[23] < 0) {
    size_t v4 = *(char **)__s;
  }
  int64_t v6 = strlen(v4);
  if (v6)
  {
    uint64_t v7 = &v4[v6];
    if ((a2 & 1) == 0)
    {
      uint64_t v8 = v4;
      if (v6 >= 1)
      {
        do
        {
          if (*v8 == 123) {
            break;
          }
          ++v8;
        }
        while (v8 < v7);
      }
      char v9 = v8 + 1;
      if (v8 + 1 >= v7) {
        return;
      }
      int64_t v10 = &v4[v6] - v8;
      v11 = &v4[v6];
      int64_t v12 = v10 - 1;
      uint64_t v7 = v9;
      while (*v7 != 125)
      {
        ++v7;
        if (!--v12)
        {
          size_t v4 = v9;
          uint64_t v7 = v11;
          goto LABEL_14;
        }
      }
      size_t v4 = v9;
    }
LABEL_14:
    if (v4 < v7)
    {
      uint64_t v13 = MEMORY[0x263EF8318];
      do
      {
        do
        {
          unsigned int v14 = *v4;
          if ((v14 & 0x80000000) != 0) {
            int v15 = __maskrune(v14, 0x4000uLL);
          }
          else {
            int v15 = *(_DWORD *)(v13 + 4 * v14 + 60) & 0x4000;
          }
          if (!v15) {
            break;
          }
          ++v4;
        }
        while (v4 < v7);
        v16 = v4;
        if (v4 < v7)
        {
          int64_t v17 = v7 - v4;
          v16 = v4;
          while (*v16 != 59)
          {
            ++v16;
            if (!--v17)
            {
              v16 = v7;
              break;
            }
          }
        }
        size_t v18 = v16 - v4;
        v19 = v16 - 1;
        do
        {
          size_t v20 = v18;
          if (v19 <= v4) {
            break;
          }
          unsigned int v21 = *v19;
          int v22 = (v21 & 0x80000000) != 0 ? __maskrune(v21, 0x4000uLL) : *(_DWORD *)(v13 + 4 * v21 + 60) & 0x4000;
          size_t v18 = v20 - 1;
          --v19;
        }
        while (v22);
        if ((uint64_t)(v20 - 1) < -1) {
          break;
        }
        std::string::basic_string[abi:ne180100](__p, v4, v20);
        unint64_t v23 = a3[1];
        if (v23 >= a3[2])
        {
          uint64_t v25 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (long long *)__p);
        }
        else
        {
          if (SHIBYTE(v30) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)a3[1], (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
          }
          else
          {
            long long v24 = *(_OWORD *)__p;
            *(void *)(v23 + 16) = v30;
            *(_OWORD *)unint64_t v23 = v24;
          }
          uint64_t v25 = v23 + 24;
          a3[1] = v23 + 24;
        }
        a3[1] = v25;
        v26 = v16 + 1;
        do
        {
          size_t v4 = v26;
          if (v26 >= v7) {
            break;
          }
          unsigned int v27 = *v26;
          int v28 = (v27 & 0x80000000) != 0 ? __maskrune(v27, 0x4000uLL) : *(_DWORD *)(v13 + 4 * v27 + 60) & 0x4000;
          v26 = v4 + 1;
        }
        while (v28);
        if (SHIBYTE(v30) < 0) {
          operator delete(__p[0]);
        }
      }
      while (v4 < v7);
    }
  }
}

void sub_210A21F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  v15[1] = v16;
  if (a15 < 0) {
    operator delete(__p);
  }
  std::string __p = v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
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
    int64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    int64_t v10 = 0;
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

void sub_210A220D4(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
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

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    int64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_210A22378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  v11 = this;
  long long v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    int64_t v6 = a2;
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
      int64_t v6 = (long long *)((char *)v6 + 24);
      long long v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_210A22498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void SVGParser::ParseDeclarationBlockIntoAttributeMap(long long **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1 != v2)
  {
    uint64_t v3 = MEMORY[0x263EF8318];
    while (1)
    {
      if (*((char *)v1 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)v1, *((void *)v1 + 1));
      }
      else
      {
        long long v4 = *v1;
        v23.__r_.__value_.__r.__words[2] = *((void *)v1 + 2);
        *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v4;
      }
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v5 = &v23;
      }
      else {
        unint64_t v5 = (std::string *)v23.__r_.__value_.__r.__words[0];
      }
      int64_t v6 = strlen((const char *)v5);
      if (!v6)
      {
        int v13 = 2;
        if ((*((unsigned char *)&v23.__r_.__value_.__s + 23) & 0x80) == 0) {
          goto LABEL_51;
        }
        goto LABEL_50;
      }
      int64_t v7 = v6;
      unint64_t v8 = (std::string *)((char *)v5 + v6);
      uint64_t v9 = v5;
      if (v6 >= 1)
      {
        do
        {
          unsigned int v10 = v9->__r_.__value_.__s.__data_[0];
          if ((v10 & 0x80000000) != 0) {
            int v11 = __maskrune(v10, 0x4000uLL);
          }
          else {
            int v11 = *(_DWORD *)(v3 + 4 * v10 + 60) & 0x4000;
          }
          if (v11) {
            break;
          }
          if (v9->__r_.__value_.__s.__data_[0] == 58) {
            break;
          }
          uint64_t v9 = (std::string *)((char *)v9 + 1);
        }
        while (v9 < v8);
      }
      std::string::basic_string[abi:ne180100](__dst, v5, (char *)v9 - (char *)v5);
      if (v9 >= v8)
      {
LABEL_22:
        if (!v9->__r_.__value_.__s.__data_[0])
        {
          int v13 = 1;
          goto LABEL_47;
        }
      }
      else
      {
        int64_t v12 = (char *)v5 + v7 - (char *)v9;
        while (v9->__r_.__value_.__s.__data_[0] != 58)
        {
          uint64_t v9 = (std::string *)((char *)v9 + 1);
          if (!--v12)
          {
            uint64_t v9 = (std::string *)((char *)v5 + v7);
            goto LABEL_22;
          }
        }
      }
      std::string::basic_string[abi:ne180100](&__p, (char *)&v9->__r_.__value_.__l.__data_ + 1, (size_t)v8 + ~(unint64_t)v9);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v18, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else {
        std::string v18 = __p;
      }
      SVGParser::StripLeadingTrailingWhitespace(&v18, &v19);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      std::string __p = v19;
      *((unsigned char *)&v19.__r_.__value_.__s + 23) = 0;
      v19.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v18.__r_.__value_.__l.__data_);
      }
      if ((v22 & 0x80u) == 0) {
        unint64_t v15 = v22;
      }
      else {
        unint64_t v15 = (unint64_t)__dst[1];
      }
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if (v15)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
        }
        if (size)
        {
          if ((v22 & 0x80u) == 0) {
            int64_t v17 = __dst;
          }
          else {
            int64_t v17 = (void **)__dst[0];
          }
          SVGAtom::ToName((SVGAtom *)v17, v14);
          operator new();
        }
      }
      if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      int v13 = 0;
LABEL_47:
      if ((char)v22 < 0) {
        operator delete(__dst[0]);
      }
      if ((*((unsigned char *)&v23.__r_.__value_.__s + 23) & 0x80) == 0) {
        goto LABEL_51;
      }
LABEL_50:
      operator delete(v23.__r_.__value_.__l.__data_);
LABEL_51:
      if (!v13)
      {
        uint64_t v1 = (long long *)((char *)v1 + 24);
        if (v1 != v2) {
          continue;
        }
      }
      return;
    }
  }
}

void sub_210A22758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  MEMORY[0x216677AD0](v35, 0x10B3C405B4D0908);
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
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
    int64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    int64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

uint64_t SVGAtom::ToName(SVGAtom *this, const char *a2)
{
  if (SVGAtom::SharedInstance(void)::onceToken != -1) {
    dispatch_once(&SVGAtom::SharedInstance(void)::onceToken, &__block_literal_global);
  }
  uint64_t v3 = (os_unfair_lock_s *)SVGAtom::SharedInstance(void)::instance;
  return SVGAtom::toName(v3, (char *)this);
}

std::string *SVGParser::StripLeadingTrailingWhitespace@<X0>(std::string *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v2 = this;
  if ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    if (*((unsigned char *)&this->__r_.__value_.__s + 23)) {
      goto LABEL_3;
    }
LABEL_15:
    *a2 = *this;
    *(_OWORD *)&this->__r_.__value_.__r.__words[1] = 0uLL;
    this->__r_.__value_.__r.__words[0] = 0;
    return this;
  }
  std::string::size_type size = this->__r_.__value_.__l.__size_;
  if (!size) {
    goto LABEL_15;
  }
LABEL_3:
  std::string::size_type v5 = 0;
  uint64_t v6 = MEMORY[0x263EF8318];
  do
  {
    unsigned int v7 = *std::string::at(v2, v5);
    if ((v7 & 0x80000000) != 0)
    {
      if (!__maskrune(v7, 0x4000uLL)) {
        goto LABEL_10;
      }
    }
    else if ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x4000) == 0)
    {
      goto LABEL_10;
    }
    ++v5;
  }
  while (size != v5);
  std::string::size_type v5 = size;
LABEL_10:
  if (v5 <= size - 1)
  {
    std::string::size_type v8 = size + 1;
    do
    {
      unsigned int v9 = *std::string::at(v2, v8 - 2);
      if ((v9 & 0x80000000) != 0) {
        int v10 = __maskrune(v9, 0x4000uLL);
      }
      else {
        int v10 = *(_DWORD *)(v6 + 4 * v9 + 60) & 0x4000;
      }
      --v8;
    }
    while (v10);
    return std::string::basic_string(a2, v2, v5, v8 - v5, (std::allocator<char> *)&v11);
  }
  else
  {
    return (std::string *)std::string::basic_string[abi:ne180100]<0>(a2, (char *)&unk_210A5361E);
  }
}

uint64_t SVGAttribute::SVGAttribute(uint64_t a1, int a2, uint64_t a3)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 80) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  MEMORY[0x216677A40](a1 + 56, a3);
  return a1;
}

{
  void *__p[2];
  char v8;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 3;
  *(void *)(a1 + 88) = a3;
  CFRetained::retain(a3);
  return a1;
}

{
  void *__p[2];
  char v8;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 4;
  *(void *)(a1 + 88) = a3;
  CFRetained::retain(a3);
  return a1;
}

{
  void *__p[2];
  char v8;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 7;
  *(void *)(a1 + 88) = a3;
  CFRetained::retain(a3);
  return a1;
}

{
  void *__p[2];
  char v8;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 6;
  *(void *)(a1 + 88) = a3;
  CFRetained::retain(a3);
  return a1;
}

{
  void *__p[2];
  char v8;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 8;
  *(void *)(a1 + 88) = a3;
  CFRetained::retain(a3);
  return a1;
}

void sub_210A22AF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 79) < 0) {
    operator delete(*v16);
  }
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void SVGParser::ParseSelectorListFromRuleset(char *__s@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2 = __s;
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (__s[23] < 0) {
    uint64_t v2 = *(char **)__s;
  }
  size_t v4 = strlen(v2);
  if (v4)
  {
    std::string::size_type v5 = &v2[v4];
    uint64_t v6 = &v2[v4];
    uint64_t v7 = MEMORY[0x263EF8318];
    do
    {
      if (v2 >= v5) {
        break;
      }
      uint64_t v8 = 0;
      unsigned int v9 = v2;
      while (1)
      {
        unsigned int v10 = v2[v8];
        if ((v10 & 0x80000000) != 0 ? __maskrune(v10, 0x4000uLL) : *(_DWORD *)(v7 + 4 * v10 + 60) & 0x4000) {
          break;
        }
        int v12 = v2[v8];
        if (v12 == 44 || v12 == 123)
        {
          unsigned int v9 = &v2[v8];
          break;
        }
        ++v9;
        if (v6 - v2 == ++v8)
        {
          unsigned int v9 = v6;
          break;
        }
      }
      std::string::basic_string[abi:ne180100](__p, v2, v9 - v2);
      unint64_t v13 = a2[1];
      if (v13 >= a2[2])
      {
        uint64_t v15 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a2, (long long *)__p);
      }
      else
      {
        if (SHIBYTE(v21) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a2[1], (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        }
        else
        {
          long long v14 = *(_OWORD *)__p;
          *(void *)(v13 + 16) = v21;
          *(_OWORD *)unint64_t v13 = v14;
        }
        uint64_t v15 = v13 + 24;
        a2[1] = v13 + 24;
      }
      a2[1] = v15;
      if (v9 < v5)
      {
        int64_t v16 = v6 - v9;
        do
        {
          unsigned int v17 = *v9;
          if ((v17 & 0x80000000) != 0) {
            int v18 = __maskrune(v17, 0x4000uLL);
          }
          else {
            int v18 = *(_DWORD *)(v7 + 4 * v17 + 60) & 0x4000;
          }
          int v19 = *v9;
          if (v18)
          {
            if (v19 == 123) {
              goto LABEL_34;
            }
          }
          else if (v19 != 44)
          {
            goto LABEL_34;
          }
          ++v9;
          --v16;
        }
        while (v16);
        unsigned int v9 = v6;
      }
      int v19 = *v9;
LABEL_34:
      uint64_t v2 = v9;
      if (SHIBYTE(v21) < 0) {
        operator delete(__p[0]);
      }
    }
    while (v19 != 123);
  }
}

void sub_210A22D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v17 = v16;
  v15[1] = v17;
  if (a15 < 0) {
    operator delete(__p);
  }
  std::string __p = v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

uint64_t SVGAttributeMap::setAttributes(SVGAttributeMap *this, const SVGAttributeMap *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZN15SVGAttributeMap13setAttributesERKS__block_invoke;
  v3[3] = &__block_descriptor_tmp_15;
  v3[4] = this;
  return SVGAttributeMap::enumerate((uint64_t)a2, (uint64_t)v3);
}

void SVGParser::ParseRulesetList(SVGParser *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = this;
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  int64_t v5 = strlen((const char *)this);
  if (v5 >= 1)
  {
    uint64_t v6 = (SVGParser *)((char *)v3 + v5);
    uint64_t v7 = (SVGParser *)((char *)v3 + v5);
    uint64_t v8 = (uint64_t)v3 + v5 - 1;
    uint64_t v9 = MEMORY[0x263EF8318];
    do
    {
      unsigned int v10 = v3;
      do
      {
        unsigned int v11 = *(char *)v10;
        if ((v11 & 0x80000000) != 0) {
          int v12 = __maskrune(v11, 0x4000uLL);
        }
        else {
          int v12 = *(_DWORD *)(v9 + 4 * v11 + 60) & 0x4000;
        }
        if (!v12) {
          break;
        }
        unsigned int v10 = (SVGParser *)((char *)v10 + 1);
      }
      while (v10 < v6);
      if (v10 < v6)
      {
        int64_t v13 = v7 - v10;
        while (*(unsigned char *)v10 != 123)
        {
          unsigned int v10 = (SVGParser *)((char *)v10 + 1);
          if (!--v13)
          {
            unsigned int v10 = v7;
            break;
          }
        }
      }
      if (v10 >= v6)
      {
        BOOL v14 = 0;
      }
      else if (*(unsigned char *)v10 == 125)
      {
        BOOL v14 = 1;
      }
      else
      {
        uint64_t v15 = v7;
        uint64_t v16 = (SVGParser *)((char *)v10 + 1);
        uint64_t v17 = v8 - (void)v10;
        while (1)
        {
          int v18 = v16;
          if (!v17) {
            break;
          }
          uint64_t v16 = (SVGParser *)((char *)v16 + 1);
          --v17;
          if (*(unsigned char *)v18 == 125)
          {
            uint64_t v15 = v18;
            break;
          }
        }
        BOOL v14 = v18 < v6;
        unsigned int v10 = v15;
      }
      int v19 = (SVGParser *)((char *)v10 + v14);
      std::string::basic_string[abi:ne180100](&__p, v3, v19 - v3);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v25, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else {
        std::string v25 = __p;
      }
      SVGParser::StripLeadingTrailingWhitespace(&v25, &v26);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      std::string __p = v26;
      *((unsigned char *)&v26.__r_.__value_.__s + 23) = 0;
      v26.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      char v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        if (!__p.__r_.__value_.__l.__size_) {
          goto LABEL_49;
        }
        if (__p.__r_.__value_.__l.__size_ != 1)
        {
          unsigned __int8 v22 = (std::string *)a2[1];
          if ((unint64_t)v22 >= a2[2]) {
            goto LABEL_46;
          }
LABEL_44:
          std::string::__init_copy_ctor_external(v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          goto LABEL_45;
        }
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      else
      {
        if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
          goto LABEL_50;
        }
        if (HIBYTE(__p.__r_.__value_.__r.__words[2]) != 1)
        {
          unsigned __int8 v22 = (std::string *)a2[1];
          if ((unint64_t)v22 >= a2[2]) {
            goto LABEL_46;
          }
          goto LABEL_42;
        }
        p_p = &__p;
      }
      if (!p_p->__r_.__value_.__s.__data_[0]) {
        goto LABEL_48;
      }
      unsigned __int8 v22 = (std::string *)a2[1];
      if ((unint64_t)v22 >= a2[2])
      {
LABEL_46:
        uint64_t v24 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a2, (long long *)&__p);
        goto LABEL_47;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        goto LABEL_44;
      }
LABEL_42:
      long long v23 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
      v22->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
LABEL_45:
      uint64_t v24 = (uint64_t)&v22[1];
      a2[1] = (uint64_t)&v22[1];
LABEL_47:
      a2[1] = v24;
      char v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
LABEL_48:
      if (v20 < 0) {
LABEL_49:
      }
        operator delete(__p.__r_.__value_.__l.__data_);
LABEL_50:
      uint64_t v3 = v19;
    }
    while (v19 < v6);
  }
}

void sub_210A23068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v25 = v24;
  v23[1] = v25;
  if (a23 < 0) {
    operator delete(__p);
  }
  std::string __p = v23;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t SVGAtom::insert(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (os_unfair_lock_s *)(a1 + 88);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if (!a3)
  {
    uint64_t v7 = *(void *)(a1 + 16);
    if ((unint64_t)(v7 - 4294967294) < 0xFFFFFFFF00000001)
    {
      a3 = 0xFFFFFFFFLL;
      goto LABEL_15;
    }
    a3 = 0xFFFFFFFFLL;
    while (1)
    {
      uint64_t v7 = (v7 + 1);
      if (!*(void *)(a1 + 32))
      {
LABEL_14:
        a3 = v7;
        goto LABEL_15;
      }
      uint64_t v8 = *(uint64_t **)(a1 + 32);
      while (1)
      {
        unsigned int v9 = *((_DWORD *)v8 + 8);
        if (v7 >= v9) {
          break;
        }
LABEL_10:
        uint64_t v8 = (uint64_t *)*v8;
        if (!v8) {
          goto LABEL_14;
        }
      }
      if (v9 < v7) {
        break;
      }
      if (v7 == -1) {
        goto LABEL_15;
      }
    }
    ++v8;
    goto LABEL_10;
  }
LABEL_15:
  std::string::basic_string[abi:ne180100]<0>(&__p, a2);
  int v14 = a3;
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__emplace_unique_key_args<std::string,std::pair<std::string,SVGAtom::Name>>((uint64_t **)a1, (uint64_t)&__p, (uint64_t)&__p);
  if (v13 < 0) {
    operator delete(__p);
  }
  LODWORD(__p) = a3;
  std::string::basic_string[abi:ne180100]<0>(&v12, a2);
  std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::__emplace_unique_key_args<SVGAtom::Name,std::pair<SVGAtom::Name,std::string>>((uint64_t **)(a1 + 24), (unsigned int *)&__p, (uint64_t)&__p);
  if (v15 < 0) {
    operator delete(v12);
  }
  os_unfair_lock_unlock(v6);
  return a3;
}

void sub_210A231F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::pair<unsigned long,__CFRuntimeClass *>>>(uint64_t **a1, const void **a2, uint64_t a3)
{
  int64_t v5 = (uint64_t **)std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  result = *v5;
  if (!*v5)
  {
    std::__tree<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>>>::__construct_node<std::pair<std::string const,std::pair<unsigned long,__CFRuntimeClass *>>>((uint64_t)a1, a3, (uint64_t)&v7);
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(a1, v8, v5, v7);
    return v7;
  }
  return result;
}

__n128 std::__tree<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<unsigned long,__CFRuntimeClass *>>>>::__construct_node<std::pair<std::string const,std::pair<unsigned long,__CFRuntimeClass *>>>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x48uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    *((void *)v6 + 6) = *(void *)(a2 + 16);
  }
  __n128 result = *(__n128 *)(a2 + 24);
  *(__n128 *)(v6 + 56) = result;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_210A2332C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264187360, MEMORY[0x263F8C068]);
}

void sub_210A23390(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_equal<std::string>(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  size_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = v4;
        uint64_t v9 = (uint64_t)(v4 + 4);
        if (!std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v7, a3, (uint64_t)(v4 + 4)))break; {
        size_t v4 = (void *)*v8;
        }
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v7, v9, a3))break; {
      uint64_t v5 = v8 + 1;
      }
      size_t v4 = (void *)v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264187358, MEMORY[0x263F8C060]);
}

void sub_210A234A4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

CFStringRef CGSVGAtomCopyString(unsigned int a1)
{
  CFStringRef result = (CFStringRef)SVGAtom::ToString(a1);
  if (result)
  {
    uint64_t v2 = (const char *)result;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
    return CFStringCreateWithCString(v3, v2, 0x8000100u);
  }
  return result;
}

uint64_t *std::map<std::string,SVGAttributeMap *,CaseInsensitiveStringLess,std::allocator<std::pair<std::string const,SVGAttributeMap *>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,SVGAttributeMap *>,std::__tree_node<std::__value_type<std::string,SVGAttributeMap *>,void *> *,long>>>(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    size_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      CFStringRef result = std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,SVGAttributeMap *> const&>(v5, v6, (uint64_t)(v4 + 4), (uint64_t)(v4 + 4));
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          size_t v4 = v8;
        }
        while (!v9);
      }
      size_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,SVGAttributeMap *> const&>(uint64_t **a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__find_equal<std::string>(a1, a2, &v10, &v9, a3);
  CFStringRef result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__construct_node<std::pair<std::string const,SVGAttributeMap *> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(a1, v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__find_equal<std::string>(void *a1, void *a2, void *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v9 = a1 + 1;
  if (a1 + 1 != a2
    && !std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100]((uint64_t)(a1 + 2), a5, (uint64_t)(a2 + 4)))
  {
    if (!std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (uint64_t)(a2 + 4), a5))
    {
      *a3 = a2;
      *a4 = (uint64_t)a2;
      return a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      int v14 = (void *)a2[1];
      do
      {
        char v15 = v14;
        int v14 = (void *)*v14;
      }
      while (v14);
    }
    else
    {
      int v18 = a2;
      do
      {
        char v15 = (void *)v18[2];
        BOOL v17 = *v15 == (void)v18;
        int v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100]((uint64_t)(a1 + 2), a5, (uint64_t)(v15 + 4)))goto LABEL_28; {
      uint64_t v13 = *a4;
      }
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = a2;
    }
    return a4;
  }
  if ((void *)*a1 == a2)
  {
    int v12 = a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = a2;
      return a2;
    }
  }
  unsigned int v11 = (void *)*a2;
  if (*a2)
  {
    do
    {
      int v12 = v11;
      unsigned int v11 = (void *)v11[1];
    }
    while (v11);
  }
  else
  {
    uint64_t v16 = a2;
    do
    {
      int v12 = (void *)v16[2];
      BOOL v17 = *v12 == (void)v16;
      uint64_t v16 = v12;
    }
    while (v17);
  }
  if (std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (uint64_t)(v12 + 4), a5))goto LABEL_16; {
LABEL_28:
  }
  return std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
}

void std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__construct_node<std::pair<std::string const,SVGAttributeMap *> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    *((void *)v6 + 6) = *(void *)(a2 + 16);
  }
  *((void *)v6 + 7) = *(void *)(a2 + 24);
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_210A2384C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void SVGStyle::~SVGStyle(char **this)
{
  uint64_t v2 = (char *)(this + 1);
  uint64_t v3 = *this;
  if (*this != (char *)(this + 1))
  {
    do
    {
      if (v3[55] < 0) {
        std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v3 + 4), *((void *)v3 + 5));
      }
      else {
        std::string __p = *(std::string *)(v3 + 32);
      }
      uint64_t v8 = (CFTypeRef *)*((void *)v3 + 7);
      CFRetained::release(v8);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      size_t v4 = (char *)*((void *)v3 + 1);
      if (v4)
      {
        do
        {
          uint64_t v5 = v4;
          size_t v4 = *(char **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          uint64_t v5 = (char *)*((void *)v3 + 2);
          BOOL v6 = *(void *)v5 == (void)v3;
          uint64_t v3 = v5;
        }
        while (!v6);
      }
      uint64_t v3 = v5;
    }
    while (v5 != v2);
  }
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy((uint64_t)this, this[1]);
}

BOOL SVGDocument::read(SVGDocument *this, const __CFData *a2, SVGReaderOptions *a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v6 = *((void *)this + 6);
  if (v6)
  {
    if (*(void *)(v6 + 96) != *(void *)(v6 + 88))
    {
      SVGUtilities::error((SVGUtilities *)"Root Node is already populated in SVGDocument. Skipping read.", (const char *)a2);
      return 0;
    }
    CFRetained::release((CFTypeRef *)v6);
  }
  SVGReader::SVGReader((SVGReader *)v16, a2, a3);
  uint64_t v8 = v17;
  *((void *)this + 6) = v17;
  CFRetained::retain(v8);
  if (v18)
  {
    std::map<std::string,SVGAttributeMap *,CaseInsensitiveStringLess,std::allocator<std::pair<std::string const,SVGAttributeMap *>>>::map[abi:ne180100]((uint64_t *)&v14, v18);
    uint64_t v9 = v14;
    if (v14 != v15)
    {
      do
      {
        SVGDocument::addNamedStyle((uint64_t)this, (uint64_t)(v9 + 4), (CFTypeRef *)v9[7]);
        uint64_t v10 = v9[1];
        if (v10)
        {
          do
          {
            unsigned int v11 = (char **)v10;
            uint64_t v10 = *(char **)v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            unsigned int v11 = (char **)v9[2];
            BOOL v12 = *v11 == (char *)v9;
            uint64_t v9 = v11;
          }
          while (!v12);
        }
        uint64_t v9 = v11;
      }
      while (v11 != v15);
    }
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy((uint64_t)&v14, v15[0]);
  }
  BOOL v7 = (!a3 || *((_DWORD *)a3 + 8) != 1 || SVGDocument::checkProfileSettings(this, a2)) && *((void *)this + 6) != 0;
  SVGReader::~SVGReader((SVGReader *)v16);
  return v7;
}

void sub_210A23A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  SVGReader::~SVGReader((SVGReader *)va);
  _Unwind_Resume(a1);
}

void SVGDocument::addNamedStyle(uint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  if (a3)
  {
    uint64_t v3 = *(uint64_t ***)(a1 + 64);
    if (!v3) {
      operator new();
    }
    SVGStyle::addNamedStyle(v3, a2, a3);
  }
}

void sub_210A23B38(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x1020C402C28E7A6);
  _Unwind_Resume(a1);
}

void SVGStyle::addNamedStyle(uint64_t **a1, uint64_t a2, CFTypeRef *a3)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::find<std::string>((uint64_t)a1, a2);
  if (a1 + 1 != v6)
  {
    uint64_t v7 = (uint64_t)v6;
    CFRetained::release((CFTypeRef *)v6[7]);
    std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::erase(a1, v7);
  }
  CFRetained::retain(a3);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  uint64_t v9 = a3;
  std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,SVGAttributeMap *>>(a1, (uint64_t)&__p, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_210A23C10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGParser::ParseCommandList(SVGParser *this, const char *a2)
{
  uint64_t v2 = this;
  operator new();
}

void sub_210A23DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  MEMORY[0x216677AD0](v12, 0x10F3C40176D6E88);
  _Unwind_Resume(a1);
}

uint64_t SVGPathCommand::ExpectedFloatCount(int a1)
{
  uint64_t result = 0;
  if (!(!v2 & v1))
  {
    switch(a1)
    {
      case 'A':
        goto LABEL_8;
      case 'B':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'I':
      case 'J':
      case 'K':
      case 'N':
      case 'O':
      case 'P':
      case 'R':
      case 'U':
        return result;
      case 'C':
        goto LABEL_9;
      case 'H':
      case 'V':
        goto LABEL_6;
      case 'L':
      case 'M':
      case 'T':
        goto LABEL_5;
      case 'Q':
      case 'S':
        goto LABEL_7;
      default:
        JUMPOUT(0);
    }
  }
  switch(a1)
  {
    case 'a':
LABEL_8:
      uint64_t result = 7;
      break;
    case 'c':
LABEL_9:
      uint64_t result = 6;
      break;
    case 'h':
    case 'v':
LABEL_6:
      uint64_t result = 1;
      break;
    case 'l':
    case 'm':
    case 't':
LABEL_5:
      uint64_t result = 2;
      break;
    case 'q':
    case 's':
LABEL_7:
      uint64_t result = 4;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t CFRetained::retain(uint64_t a1)
{
  if (a1) {
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  return a1;
}

void SVGAttributeMap::~SVGAttributeMap(SVGAttributeMap *this)
{
  SVGAttributeMap::~SVGAttributeMap(this);
  JUMPOUT(0x216677AD0);
}

{
  *(void *)this = &unk_26C30A240;
  SVGAttributeMap::enumerate((uint64_t)this, (uint64_t)&__block_literal_global_0);
  std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::destroy((uint64_t)this + 48, *((void **)this + 7));
  *(void *)this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

void std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t SVGAttributeMap::enumerate(uint64_t result, uint64_t a2)
{
  char v8 = 0;
  char v2 = *(void **)(result + 48);
  uint64_t v3 = (void *)(result + 56);
  if (v2 != (void *)(result + 56))
  {
    do
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, char *))(a2 + 16))(a2, *((unsigned int *)v2 + 8), v2[5], &v8);
      if (v8) {
        break;
      }
      uint64_t v5 = (void *)v2[1];
      if (v5)
      {
        do
        {
          uint64_t v6 = v5;
          uint64_t v5 = (void *)*v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          uint64_t v6 = (void *)v2[2];
          BOOL v7 = *v6 == (void)v2;
          char v2 = v6;
        }
        while (!v7);
      }
      char v2 = v6;
    }
    while (v6 != v3);
  }
  return result;
}

void CFRetained::release(CFTypeRef *this)
{
}

void ___ZN15SVGAttributeMapD2Ev_block_invoke(int a1, int a2, CFTypeRef *this)
{
  if (this) {
    CFRetained::release(this);
  }
}

void ___ZN14SVGViewBoxNode17updatedAttributesEP15SVGAttributeMap_block_invoke(uint64_t a1, unsigned int a2, os_unfair_lock_s *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (((*(uint64_t (**)(uint64_t))(*(void *)v5 + 64))(v5) & 1) == 0)
  {
    switch(a2)
    {
      case 'A':
        if ((SVGAttribute::rectValue(a3, (CGRect *)(v5 + 240)) & 1) == 0) {
          goto LABEL_14;
        }
        return;
      case 'B':
        BOOL v7 = (double *)(v5 + 224);
        goto LABEL_13;
      case 'C':
        BOOL v7 = (double *)(v5 + 208);
        goto LABEL_13;
      case 'D':
      case 'E':
        return;
      case 'F':
        BOOL v7 = (double *)(v5 + 216);
        goto LABEL_13;
      default:
        if (a2 != 30)
        {
          if (a2 != 46) {
            return;
          }
          uint64_t v6 = SVGAttribute::stringValue((SVGAttribute *)a3);
          if (SVGViewBoxNode::ParseAspectRatio(v5, v6)) {
            return;
          }
LABEL_14:
          char v8 = SVGAtom::ToString(a2);
          SVGUtilities::log((SVGUtilities *)"Failed to parse %s for node name \"svg\"", v9, v8);
          return;
        }
        BOOL v7 = (double *)(v5 + 232);
LABEL_13:
        if ((SVGAttribute::floatValue(a3, v7) & 1) == 0) {
          goto LABEL_14;
        }
        break;
    }
  }
}

uint64_t SVGViewBoxNode::updatedSpecificAttribute()
{
  return 0;
}

BOOL SVGParser::ParseCGFloatList(char *a1, void *a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a1 && a3)
  {
    uint64_t v21 = a1;
    uint64_t v6 = MEMORY[0x263EF8318];
    while (1)
    {
      if (SVGParser::IsAllowedSeparator((SVGParser *)*a1))
      {
        do
          ++v21;
        while (SVGParser::IsAllowedSeparator((SVGParser *)*v21));
      }
      uint64_t v7 = *v21;
      if ((v7 - 45) >= 2
        && v7 != 43
        && (!*v21 || (v7 & 0x80) != 0 || (*(_DWORD *)(v6 + 4 * v7 + 60) & 0x400) == 0))
      {
        break;
      }
      uint64_t v20 = 0;
      if (!SVGParser::ParseCGFloat(v21, (double *)&v20, &v21, 0)) {
        break;
      }
      uint64_t v9 = *(void **)(a3 + 8);
      unint64_t v8 = *(void *)(a3 + 16);
      if ((unint64_t)v9 >= v8)
      {
        unsigned int v11 = *(void **)a3;
        uint64_t v12 = ((uint64_t)v9 - *(void *)a3) >> 3;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
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
          uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a3 + 16, v15);
          unsigned int v11 = *(void **)a3;
          uint64_t v9 = *(void **)(a3 + 8);
        }
        else
        {
          uint64_t v16 = 0;
        }
        uint64_t v17 = &v16[8 * v12];
        *(void *)uint64_t v17 = v20;
        uint64_t v10 = v17 + 8;
        while (v9 != v11)
        {
          uint64_t v18 = *--v9;
          *((void *)v17 - 1) = v18;
          v17 -= 8;
        }
        *(void *)a3 = v17;
        *(void *)(a3 + 8) = v10;
        *(void *)(a3 + 16) = &v16[8 * v15];
        if (v11) {
          operator delete(v11);
        }
      }
      else
      {
        *uint64_t v9 = v20;
        uint64_t v10 = v9 + 1;
      }
      *(void *)(a3 + 8) = v10;
      a1 = v21;
    }
    if (a2) {
      *a2 = v21;
    }
    return *(void *)(a3 + 8) != *(void *)a3;
  }
  return v3;
}

BOOL SVGParser::IsAllowedSeparator(SVGParser *this)
{
  if (this == 44) {
    return 1;
  }
  if ((this & 0x80000000) != 0) {
    int v2 = __maskrune((__darwin_ct_rune_t)this, 0x4000uLL);
  }
  else {
    int v2 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * this + 60) & 0x4000;
  }
  return v2 != 0;
}

BOOL SVGParser::ParseCGFloat(const char *a1, double *a2, char **a3, _DWORD *a4)
{
  uint64_t v8 = MEMORY[0x263EF8318];
  while (1)
  {
    uint64_t v9 = *(unsigned __int8 *)a1;
    BOOL v10 = v9 > 0x2E || ((1 << v9) & 0x680000000000) == 0;
    if (!v10 || (v9 & 0x80) == 0 && (*(_DWORD *)(v8 + 4 * v9 + 60) & 0x400) != 0) {
      break;
    }
    BOOL result = SVGParser::IsAllowedSeparator((SVGParser *)(char)v9);
    if (!result) {
      return result;
    }
    ++a1;
  }
  *__error() = 0;
  unint64_t v15 = 0;
  if (GetLocaleC(void)::onceToken != -1) {
    dispatch_once(&GetLocaleC(void)::onceToken, &__block_literal_global_2);
  }
  double v12 = strtod_l(a1, &v15, (locale_t)GetLocaleC(void)::localeC);
  unint64_t v13 = v15;
  if (a1 == v15) {
    return 0;
  }
  double v14 = v12;
  if (a4)
  {
    *a4 = 1;
    while (a1 <= v13)
    {
      if (*a1 == 46)
      {
        *a4 = 0;
        break;
      }
      ++a1;
    }
  }
  if (a3) {
    *a3 = v13;
  }
  if (*__error()) {
    return 0;
  }
  *a2 = v14;
  return 1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t SVGPath::addCommand(SVGPath *this, SVGPathCommand *a2)
{
  unint64_t v6 = *((void *)this + 8);
  size_t v4 = (char *)this + 64;
  unint64_t v5 = v6;
  uint64_t v7 = (void *)*((void *)v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = (void **)(v4 - 16);
    uint64_t v10 = *((void *)v4 - 2);
    uint64_t v11 = ((uint64_t)v7 - v10) >> 3;
    if ((unint64_t)(v11 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v5 - v10;
    uint64_t v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      unint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v4, v14);
    }
    else {
      unint64_t v15 = 0;
    }
    uint64_t v16 = &v15[8 * v11];
    uint64_t v17 = &v15[8 * v14];
    *(void *)uint64_t v16 = a2;
    uint64_t v8 = v16 + 8;
    int v19 = (char *)*((void *)this + 6);
    uint64_t v18 = (char *)*((void *)this + 7);
    if (v18 != v19)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      uint64_t v18 = (char *)*v9;
    }
    *((void *)this + 6) = v16;
    *((void *)this + 7) = v8;
    *((void *)this + 8) = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    void *v7 = a2;
    uint64_t v8 = v7 + 1;
  }
  *((void *)this + 7) = v8;
  return CFRetained::retain((uint64_t)a2);
}

uint64_t SVGPathCommand::SVGPathCommand(uint64_t a1, int a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPathCommand::kSVGPathCommandClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A1C0;
  *(_DWORD *)(a1 + 48) = a2;
  *(void *)(a1 + 56) = 0;
  if (SVGPathCommand::ExpectedFloatCount(a2)) {
    operator new();
  }
  return a1;
}

void sub_210A246DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

char *SVGPathCommand::appendFloats(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  uint64_t v4 = *(void *)(a1 + 56);
  if (!v4) {
    SVGPathCommand::appendFloats();
  }
  uint64_t v5 = *(void *)(v4 + 8);
  return std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(v4, v5, a3, a4, (a4 - a3) >> 3);
}

char *SVGPathCommand::appendFloats(uint64_t a1, char **a2)
{
  return SVGPathCommand::appendFloats(a1, (uint64_t)a2, *a2, a2[1]);
}

char *std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    uint64_t v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 3;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 2 > v14) {
      unint64_t v14 = v16 >> 2;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v37 = v9;
    if (v17) {
      uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v9, v17);
    }
    else {
      uint64_t v18 = 0;
    }
    int v28 = &v18[8 * v15];
    std::string __p = v18;
    v34 = v28;
    v36 = &v18[8 * v17];
    uint64_t v29 = 8 * a5;
    uint64_t v30 = &v28[8 * a5];
    do
    {
      uint64_t v31 = *(void *)v7;
      v7 += 8;
      *(void *)int v28 = v31;
      v28 += 8;
      v29 -= 8;
    }
    while (v29);
    uint64_t v35 = v30;
    uint64_t v5 = std::vector<double>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 3;
  if (v20 >= a5)
  {
    uint64_t v21 = &__src[8 * a5];
    long long v23 = *(char **)(v9 - 8);
LABEL_17:
    uint64_t v24 = &v5[8 * a5];
    uint64_t v25 = &v23[-8 * a5];
    std::string v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      std::string v26 = v23;
      do
      {
        uint64_t v27 = *(void *)v25;
        v25 += 8;
        *(void *)std::string v26 = v27;
        v26 += 8;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-8 * ((v23 - v24) >> 3)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  uint64_t v21 = &__src[8 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  }
  long long v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_210A24950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(char **)(a2 + 8);
  char v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    uint64_t v7 = *(char **)(a2 + 8);
    do
    {
      uint64_t v9 = *((void *)v8 - 1);
      v8 -= 8;
      *((void *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    uint64_t v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  uint64_t v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

BOOL ___ZN8SVGStyle21addDefinitionsFromCSSEPKc_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (SVGParser *)SVGAtom::ToString(a2);
  BOOL result = SVGParser::StringBeginsWith(v3, "--", v4);
  if (result) {
    *(unsigned char *)(v2 + 24) = 1;
  }
  return result;
}

void *SVGAtom::toString(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 88);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if (!*(void *)(a1 + 40))
  {
    uint64_t v5 = *(void **)a1;
    if (*(void *)a1 != a1 + 8)
    {
      do
      {
        if (*((char *)v5 + 55) < 0) {
          std::string::__init_copy_ctor_external(&v20, (const std::string::value_type *)v5[4], v5[5]);
        }
        else {
          std::string v20 = *(std::string *)(v5 + 4);
        }
        unsigned int v21 = *((_DWORD *)v5 + 14);
        unsigned int v18 = v21;
        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&__p, v20.__r_.__value_.__l.__data_, v20.__r_.__value_.__l.__size_);
        }
        else {
          std::string __p = v20;
        }
        std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::__emplace_unique_key_args<SVGAtom::Name,std::pair<SVGAtom::Name,std::string>>((uint64_t **)(a1 + 24), &v18, (uint64_t)&v18);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v20.__r_.__value_.__l.__data_);
        }
        char v6 = (void *)v5[1];
        if (v6)
        {
          do
          {
            uint64_t v7 = v6;
            char v6 = (void *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            uint64_t v7 = (void *)v5[2];
            BOOL v8 = *v7 == (void)v5;
            uint64_t v5 = v7;
          }
          while (!v8);
        }
        uint64_t v5 = v7;
      }
      while (v7 != (void *)(a1 + 8));
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = a1 + 32;
  uint64_t v9 = v11;
  if (!v11) {
    goto LABEL_30;
  }
  uint64_t v12 = v10;
  do
  {
    unsigned int v13 = *(_DWORD *)(v9 + 32);
    BOOL v14 = v13 >= a2;
    if (v13 >= a2) {
      uint64_t v15 = (uint64_t *)v9;
    }
    else {
      uint64_t v15 = (uint64_t *)(v9 + 8);
    }
    if (v14) {
      uint64_t v12 = v9;
    }
    uint64_t v9 = *v15;
  }
  while (*v15);
  if (v12 != v10 && *(_DWORD *)(v12 + 32) <= a2)
  {
    uint64_t v16 = (void *)(v12 + 40);
    if (*(char *)(v12 + 63) < 0) {
      uint64_t v16 = (void *)*v16;
    }
  }
  else
  {
LABEL_30:
    uint64_t v16 = 0;
  }
  os_unfair_lock_unlock(v4);
  return v16;
}

void sub_210A24C2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *SVGAtom::ToString(unsigned int a1)
{
  if (SVGAtom::SharedInstance(void)::onceToken != -1) {
    dispatch_once(&SVGAtom::SharedInstance(void)::onceToken, &__block_literal_global);
  }
  uint64_t v2 = SVGAtom::SharedInstance(void)::instance;
  return SVGAtom::toString(v2, a1);
}

BOOL SVGParser::StringBeginsWith(SVGParser *this, const char *a2, const char *a3)
{
  BOOL result = 0;
  if (this && a2)
  {
    size_t v6 = strlen((const char *)this);
    size_t v7 = strlen(a2);
    return v6 >= v7 && strncasecmp((const char *)this, a2, v7) == 0;
  }
  return result;
}

void ___ZN15SVGAttributeMapC2ERKS__block_invoke()
{
}

void sub_210A24DAC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void SVGAttribute::SVGAttribute(SVGAttribute *this, const SVGAttribute *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A150;
  *((_DWORD *)this + 12) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((_DWORD *)this + 20) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  *((_DWORD *)this + 12) = *((_DWORD *)a2 + 12);
  std::string::operator=((std::string *)((char *)this + 56), (const std::string *)((char *)a2 + 56));
  int v4 = *((_DWORD *)a2 + 20);
  *((_DWORD *)this + 20) = v4;
  *((_DWORD *)this + 26) = *((_DWORD *)a2 + 26);
  switch(v4)
  {
    case 1:
      operator new();
    case 2:
      *((_DWORD *)this + 22) = *((_DWORD *)a2 + 22);
      break;
    case 3:
      operator new();
    case 4:
      operator new();
    case 6:
      operator new();
    case 7:
      operator new();
    case 8:
      operator new();
    default:
      return;
  }
}

void sub_210A24FC8(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v3, 0x10B3C40FABA7DC6);
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*v2);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void ___ZN15SVGAttributeMap13setAttributesERKS__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void ___ZN12SVGShapeNode17updatedAttributesEP15SVGAttributeMap_block_invoke(uint64_t a1, signed int a2, os_unfair_lock_s *this)
{
  int v4 = *(double **)(a1 + 32);
  if (a2 <= 46)
  {
    switch(a2)
    {
      case 9:
        uint64_t v5 = v4 + 34;
        break;
      case 10:
        uint64_t v5 = v4 + 35;
        break;
      case 30:
        uint64_t v5 = v4 + 31;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(a2)
    {
      case '3':
        uint64_t v5 = v4 + 32;
        break;
      case '4':
        uint64_t v5 = v4 + 33;
        break;
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ':':
      case ';':
      case '<':
      case '=':
      case '>':
      case '?':
      case '@':
      case 'A':
        return;
      case 'B':
        uint64_t v5 = v4 + 30;
        break;
      case 'C':
      case 'D':
        uint64_t v5 = v4 + 26;
        break;
      case 'E':
        uint64_t v5 = v4 + 28;
        break;
      case 'F':
      case 'G':
        uint64_t v5 = v4 + 27;
        break;
      case 'H':
        uint64_t v5 = v4 + 29;
        break;
      default:
        if (a2 != 47) {
          return;
        }
        uint64_t v5 = v4 + 36;
        break;
    }
  }
  if ((SVGAttribute::floatValue(this, v5) & 1) == 0)
  {
    char v6 = SVGAtom::ToString(a2);
    SVGUtilities::error((SVGUtilities *)"SVGShapeNode: Error parsing atom: %s\n", v7, v6);
  }
}

uint64_t ___ZN15SVGAttributeMap19addUniqueAttributesEPKS__block_invoke(uint64_t a1, unsigned int a2, SVGAttribute *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v3 + 56);
  uint64_t v4 = v3 + 56;
  uint64_t v5 = v6;
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = v4;
  do
  {
    unsigned int v8 = *(_DWORD *)(v5 + 32);
    BOOL v9 = v8 >= a2;
    if (v8 >= a2) {
      uint64_t v10 = (uint64_t *)v5;
    }
    else {
      uint64_t v10 = (uint64_t *)(v5 + 8);
    }
    if (v9) {
      uint64_t v7 = v5;
    }
    uint64_t v5 = *v10;
  }
  while (*v10);
  if (v7 == v4
    || *(_DWORD *)(v7 + 32) > a2
    || (uint64_t v11 = *(SVGAttribute **)(v7 + 40)) == 0
    || (uint64_t result = SVGAttribute::isEqual(v11, a3), (result & 1) == 0))
  {
LABEL_14:
    operator new();
  }
  return result;
}

void sub_210A252B0(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void SVGAttributeMap::CreateWithDefaults(SVGAttributeMap *this)
{
}

void sub_210A257E4(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void SVGAttributeMap::setAttribute(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = (uint64_t **)(a1 + 48);
  unsigned int v8 = *(_DWORD *)(a2 + 48);
  if (v6)
  {
    uint64_t v9 = a1 + 56;
    do
    {
      unsigned int v10 = *(_DWORD *)(v6 + 32);
      BOOL v11 = v10 >= v8;
      if (v10 >= v8) {
        uint64_t v12 = (uint64_t *)v6;
      }
      else {
        uint64_t v12 = (uint64_t *)(v6 + 8);
      }
      if (v11) {
        uint64_t v9 = v6;
      }
      uint64_t v6 = *v12;
    }
    while (*v12);
    if (v9 != a1 + 56 && v8 >= *(_DWORD *)(v9 + 32))
    {
      CFRetained::release(*(CFTypeRef **)(v9 + 40));
      std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::__remove_node_pointer(v7, (uint64_t *)v9);
      operator delete((void *)v9);
      unsigned int v8 = *(_DWORD *)(a2 + 48);
    }
  }
  LODWORD(v14) = v8;
  *((void *)&v14 + 1) = a2;
  std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::__emplace_unique_key_args<SVGAtom::Name,std::pair<SVGAtom::Name const,SVGAttribute *>>(v7, (unsigned int *)&v14, &v14);
  if (!a3) {
    CFRetained::retain((CFTypeRef *)a2);
  }
  unsigned int v13 = *(SVGNode **)(a1 + 72);
  if (v13) {
    SVGNode::updatedAttribute(v13, (SVGAttribute *)a2);
  }
}

uint64_t **std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::__emplace_unique_key_args<SVGAtom::Name,std::pair<SVGAtom::Name const,SVGAttribute *>>(uint64_t **a1, unsigned int *a2, _OWORD *a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    unsigned int v7 = *a2;
    while (1)
    {
      while (1)
      {
        unsigned int v8 = (uint64_t **)v5;
        unsigned int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unsigned int v8 = a1 + 1;
LABEL_10:
    unsigned int v10 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v10 + 2) = *a3;
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unsigned int v9 = (uint64_t **)a2[2];
          }
          else
          {
            unsigned int v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unsigned int v9 = v2;
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
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

CFTypeRef CFRetained::retain(CFTypeRef *this)
{
  return CFRetain(this[5]);
}

void SVGAttribute::SVGAttribute(uint64_t a1, int a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 1;
  operator new();
}

{
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 1;
  operator new();
}

{
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 1;
  operator new();
}

{
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 1;
  operator new();
}

{
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 3;
  operator new();
}

{
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 3;
  operator new();
}

{
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 3;
  operator new();
}

{
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 1;
  operator new();
}

{
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 1;
  operator new();
}

void sub_210A25D0C(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;
  MEMORY[0x216677AD0](v4, 0x80C40D6874129);
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*v3);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  int v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  int v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *int v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    uint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      uint64_t v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }
      else
      {
        uint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      uint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *uint64_t v24 = v23;
      goto LABEL_72;
    }
    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    unint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      unint64_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  std::string v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    unint64_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    std::string v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *std::string v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  uint64_t v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t SVGAttribute::SVGAttribute(uint64_t a1, unsigned int a2, int a3)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 2;
  int v6 = SVGAtom::ToString(a2);
  MEMORY[0x216677A40](a1 + 56, v6);
  *(_DWORD *)(a1 + 88) = a3;
  return a1;
}

void sub_210A26240(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_210A2634C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 79) < 0) {
    operator delete(*v16);
  }
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void SVGPaint::SVGPaint(SVGPaint *this, const SVGColor *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPaint::kSVGPaintClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A3F0;
  *((_DWORD *)this + 12) = 1;
  SVGColor::SVGColor((uint64_t)this + 56, 0, 0.0, 0.0, 0.0, 1.0);
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((void *)this + 12) = 0x3FF0000000000000;
  SVGColor::SVGColor((uint64_t)v4, (uint64_t)a2);
  SVGColor::operator=((uint64_t)this + 56, (uint64_t)v4);
}

void sub_210A26478(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  *(void *)uint64_t v19 = &unk_26C309FB0;
  if (*(char *)(v19 + 31) < 0) {
    operator delete(*(void **)(v19 + 8));
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGColor::SVGColor(uint64_t result, int a2, double a3, double a4, double a5, double a6)
{
  *(_DWORD *)(result + 32) = 53;
  *(double *)uint64_t result = a3;
  *(double *)(result + 8) = a4;
  *(double *)(result + 16) = a5;
  *(double *)(result + 24) = a6;
  if (a2 == 2)
  {
    int v6 = 73;
  }
  else
  {
    if (a2 != 1) {
      return result;
    }
    int v6 = 15;
  }
  *(_DWORD *)(result + 32) = v6;
  return result;
}

__n128 SVGColor::operator=(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  *(__n128 *)(a1 + 16) = result;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return result;
}

__n128 SVGColor::SVGColor(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 32) = 53;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  *(__n128 *)(a1 + 16) = result;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return result;
}

void SVGColor::SVGColor(SVGColor *this, SVGColor *a2, SVGColor *a3)
{
  *((_DWORD *)this + 8) = 53;
  if (!SVGColor::GetColorWithString(a2, (double *)this, a3))
  {
    *(_OWORD *)this = 0u;
    *((_OWORD *)this + 1) = 0u;
  }
}

BOOL SVGColor::GetColorWithString(SVGColor *this, double *a2, SVGColor *a3)
{
  *(void *)&v59[58] = *MEMORY[0x263EF8340];
  int v5 = (const char *)strlen((const char *)this);
  if (!SVGParser::StripLeadingTrailingWhitespace(this, v5, (uint64_t)&__s, (char *)0x40)) {
    return 0;
  }
  if (NameToColorMap(void)::__onceToken != -1) {
    dispatch_once(&NameToColorMap(void)::__onceToken, &__block_literal_global_1);
  }
  uint64_t v6 = NameToColorMap(void)::__colorMap;
  std::string::basic_string[abi:ne180100]<0>(__p, &__s);
  uint64_t v7 = std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::find<std::string>(v6, (uint64_t)__p);
  if (v54 < 0) {
    operator delete(__p[0]);
  }
  if ((void *)(v6 + 8) != v7)
  {
    unsigned int v8 = *((_DWORD *)v7 + 14);
    int8x8_t v9 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v8), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL);
    v10.i64[0] = v9.u32[0];
    v10.i64[1] = v9.u32[1];
    *(float64x2_t *)a2 = vdivq_f64(vcvtq_f64_u64(v10), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL));
    double v11 = (double)v8 / 255.0;
LABEL_8:
    a2[2] = v11;
    a2[3] = 1.0;
    return 1;
  }
  size_t v13 = strlen(&__s);
  if (__s == 35)
  {
    size_t v15 = v13;
    if (v13 == 7 || v13 == 4)
    {
      *__error() = 0;
      unsigned int v16 = strtoul(v56, 0, 16);
      if (!*__error())
      {
        if (v15 == 4) {
          unsigned int v21 = 15;
        }
        else {
          unsigned int v21 = 255;
        }
        double v22 = 255.0;
        if (v15 == 4) {
          double v22 = 15.0;
        }
        int8x8_t v23 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v16), (uint32x2_t)vneg_s32((int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v15 == 4), 0x1FuLL)), (int8x8_t)0x400000008, (int8x8_t)0x800000010))), (int8x8_t)vdup_n_s32(v21));
        v24.i64[0] = v23.u32[0];
        v24.i64[1] = v23.u32[1];
        *(float64x2_t *)a2 = vdivq_f64(vcvtq_f64_u64(v24), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22, 0));
        double v11 = (double)(v21 & v16) / v22;
        goto LABEL_8;
      }
    }
  }
  *a2 = 0.0;
  a2[1] = 0.0;
  a2[2] = 0.0;
  a2[3] = 1.0;
  if (SVGParser::StringBeginsWith((SVGParser *)&__s, "rgb(", v14))
  {
    char ColorValues = ReadColorValues((SVGParser *)&v57, (SVGColor *)a2);
  }
  else if (SVGParser::StringBeginsWith((SVGParser *)&__s, "rgba(", v17))
  {
    char ColorValues = ReadColorValues((SVGParser *)&v58, (SVGColor *)a2);
  }
  else
  {
    if (!SVGParser::StringBeginsWith((SVGParser *)&__s, "color(", v19))
    {
      if (SVGParser::StringBeginsWith((SVGParser *)&__s, "hsl(", v20))
      {
        if ((ReadColorValues((SVGParser *)&v57, (SVGColor *)a2) & 1) == 0) {
          return 0;
        }
      }
      else
      {
        if (!SVGParser::StringBeginsWith((SVGParser *)&__s, "hsla(", v25))
        {
          if (SVGParser::StringBeginsWith((SVGParser *)&__s, "none", v26))
          {
            a2[3] = 0.0;
            return 1;
          }
          return 0;
        }
        if (!ReadColorValues((SVGParser *)&v58, (SVGColor *)a2)) {
          return 0;
        }
      }
      double v27 = *a2;
      double v28 = a2[1];
      double v29 = a2[2];
      double v30 = v28 + v29 - v29 * v28;
      double v31 = v29 * (v28 + 1.0);
      if (v29 > 0.5) {
        double v31 = v30;
      }
      double v32 = -(v31 - v29 * 2.0);
      double v33 = v31 - v32;
      double v34 = (v27 + -3.33333333 - floor(v27 + -3.33333333)) * 6.0;
      if (v34 + -4.0 >= 0.0) {
        double v35 = v32;
      }
      else {
        double v35 = v32 + (v31 - v32) * (4.0 - v34);
      }
      if (v34 + -3.0 < 0.0) {
        double v35 = v31;
      }
      double v36 = v34 + -1.0;
      double v37 = v32 + v33 * v34;
      if (v36 >= 0.0) {
        double v37 = v35;
      }
      v38.f64[1] = *a2;
      v38.f64[0] = v27 + 3.33333333;
      float64x2_t v39 = vsubq_f64(v38, vrndmq_f64(v38));
      __asm { FMOV            V4.2D, #6.0 }
      float64x2_t v45 = vmulq_f64(v39, _Q4);
      __asm
      {
        FMOV            V4.2D, #-4.0
        FMOV            V6.2D, #4.0
      }
      float64x2_t v48 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v32, 0);
      int8x16_t v49 = vbslq_s8((int8x16_t)vcltzq_f64(vaddq_f64(v45, _Q4)), (int8x16_t)vmlaq_n_f64(v48, vsubq_f64(_Q6, v45), v33), (int8x16_t)v48);
      __asm { FMOV            V6.2D, #-3.0 }
      int8x16_t v51 = vbslq_s8((int8x16_t)vcltzq_f64(vaddq_f64(v45, _Q6)), (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v31, 0), v49);
      __asm { FMOV            V4.2D, #-1.0 }
      *(int8x16_t *)a2 = vbslq_s8((int8x16_t)vcltzq_f64(vaddq_f64(v45, _Q4)), (int8x16_t)vmlaq_n_f64(v48, v45, v33), v51);
      a2[2] = v37;
      return 1;
    }
    char ColorValues = ReadColorValues((SVGParser *)v59, (SVGColor *)a2);
  }
  return (ColorValues & 1) != 0;
}

void sub_210A269A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGParser::StripLeadingTrailingWhitespace(SVGParser *this, const char *a2, uint64_t a3, char *a4)
{
  if (!a2) {
    return 0;
  }
  unsigned int v8 = 0;
  uint64_t v9 = a3 + 1;
  uint64_t v10 = MEMORY[0x263EF8318];
  while (1)
  {
    unsigned int v11 = v8[(void)this];
    if ((v11 & 0x80000000) != 0) {
      break;
    }
    if ((*(_DWORD *)(v10 + 4 * v11 + 60) & 0x4000) == 0) {
      goto LABEL_10;
    }
LABEL_7:
    if (a2 == ++v8) {
      return 0;
    }
  }
  if (__maskrune(v11, 0x4000uLL)) {
    goto LABEL_7;
  }
LABEL_10:
  size_t v13 = (char *)this - 1;
  uint64_t v14 = v9 - (void)v8;
  size_t v15 = v8;
  do
  {
    unsigned int v16 = a2[(void)v13];
    if ((v16 & 0x80000000) != 0) {
      uint64_t result = __maskrune(v16, 0x4000uLL);
    }
    else {
      uint64_t result = *(_DWORD *)(v10 + 4 * v16 + 60) & 0x4000;
    }
    --v13;
    ++v15;
    --v14;
  }
  while (result);
  if (a2 + 1 != v15 && a2 - v15 + 2 <= (unint64_t)a4)
  {
    unint64_t v17 = 0;
    do
    {
      *(unsigned char *)(a3 + v17) = v8[(void)this + v17];
      ++v17;
    }
    while (v17 < a2 - v15 + 1);
    a2[v14] = 0;
    return 1;
  }
  return result;
}

void SVGNode::updatedAttribute(SVGNode *this, SVGAttribute *a2)
{
  if (*((_DWORD *)a2 + 12) == 31)
  {
    uint64_t v3 = SVGAttribute::stringValue(a2);
    if (*((void *)this + 6))
    {
      if (*(char *)(v3 + 23) >= 0) {
        uint64_t v4 = (char *)v3;
      }
      else {
        uint64_t v4 = *(char **)v3;
      }
      int v5 = (SVGNode *)*((void *)this + 6);
      SVGNode::updateChildIdentifer(v5, this, v4);
    }
  }
}

void SVGPaint::SVGPaint(SVGPaint *this)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPaint::kSVGPaintClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A3F0;
  *((_DWORD *)this + 12) = 0;
  SVGColor::SVGColor((uint64_t)this + 56, 0, 0.0, 0.0, 0.0, 1.0);
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((void *)this + 12) = 0x3FF0000000000000;
}

void sub_210A26BFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void sub_210A26D28(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x80C40D6874129);
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*v3);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_210A26E08(_Unwind_Exception *exception_object)
{
  char v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_210A26F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (*(char *)(v23 + 79) < 0) {
    operator delete(*v24);
  }
  *(void *)uint64_t v23 = &unk_26C309FB0;
  if (*(char *)(v23 + 31) < 0) {
    operator delete(*(void **)(v23 + 8));
  }
  _Unwind_Resume(exception_object);
}

void *SVGParser::FormatString@<X0>(SVGParser *this@<X0>, void *a2@<X8>, ...)
{
  va_start(va, a2);
  va_copy(v4, va);
  return SVGParser::FormatString(this, (va_list *)v4, a2);
}

void *SVGParser::FormatString@<X0>(SVGParser *this@<X0>, va_list *a2@<X1>, void *a3@<X8>)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (vsnprintf(__str, 0x400uLL, (const char *)this, *a2) >= 0x401) {
    SVGUtilities::error((SVGUtilities *)"Invalid format string or arguments provided", v5);
  }
  return std::string::basic_string[abi:ne180100]<0>(a3, __str);
}

void SVGReader::~SVGReader(SVGReader *this)
{
  CFRetained::release(*((void *)this + 1));
  uint64_t v2 = (SVGStyle *)*((void *)this + 2);
  if (v2)
  {
    SVGStyle::~SVGStyle(v2);
    MEMORY[0x216677AD0]();
  }
  char v3 = (void *)*((void *)this + 3);
  if (v3)
  {
    *((void *)this + 4) = v3;
    operator delete(v3);
  }
}

void SVGRootNode::~SVGRootNode(SVGRootNode *this)
{
  SVGRootNode::~SVGRootNode(this);
  JUMPOUT(0x216677AD0);
}

{
  const void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26C30A0F0;
  uint64_t v2 = (const void *)*((void *)this + 35);
  if (v2) {
    CFRelease(v2);
  }
  SVGMask::~SVGMask(this);
}

void SVGNode::~SVGNode(SVGNode *this)
{
  *(void *)this = &unk_26C30A320;
  uint64_t v2 = *((void *)this + 7);
  if (v2) {
    SVGAttributeMap::setOwnerNode(v2, 0);
  }
  uint64_t v3 = *((void *)this + 23);
  if (v3)
  {
    if (*(char *)(v3 + 23) < 0) {
      operator delete(*(void **)v3);
    }
    MEMORY[0x216677AD0](v3, 0x1012C40EC159624);
  }
  uint64_t v4 = *((void *)this + 24);
  if (v4)
  {
    if (*(char *)(v4 + 23) < 0) {
      operator delete(*(void **)v4);
    }
    MEMORY[0x216677AD0](v4, 0x1012C40EC159624);
  }
  CFRetained::release(*((void *)this + 7));
  int v5 = (uint64_t *)*((void *)this + 11);
  uint64_t v6 = (uint64_t *)*((void *)this + 12);
  while (v5 != v6)
  {
    uint64_t v7 = *v5;
    *(void *)(v7 + 48) = 0;
    CFRetained::release((CFTypeRef *)v7);
    ++v5;
  }
  uint64_t v8 = (uint64_t *)*((void *)this + 14);
  uint64_t v9 = (uint64_t *)*((void *)this + 15);
  while (v8 != v9)
  {
    uint64_t v10 = *v8;
    *(void *)(v10 + 48) = 0;
    CFRetained::release((CFTypeRef *)v10);
    ++v8;
  }
  unsigned int v11 = (SVGNode *)*((void *)this + 20);
  if (v11 != (SVGNode *)((char *)this + 168))
  {
    do
    {
      CFRetained::release(*((CFTypeRef **)v11 + 7));
      uint64_t v12 = (SVGNode *)*((void *)v11 + 1);
      if (v12)
      {
        do
        {
          size_t v13 = v12;
          uint64_t v12 = *(SVGNode **)v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          size_t v13 = (SVGNode *)*((void *)v11 + 2);
          BOOL v14 = *(void *)v13 == (void)v11;
          unsigned int v11 = v13;
        }
        while (!v14);
      }
      unsigned int v11 = v13;
    }
    while (v13 != (SVGNode *)((char *)this + 168));
  }
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy((uint64_t)this + 160, *((char **)this + 21));
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy((uint64_t)this + 136, *((char **)this + 18));
  uint64_t v15 = (void *)*((void *)this + 14);
  if (v15)
  {
    *((void *)this + 15) = v15;
    operator delete(v15);
  }
  unsigned int v16 = (void *)*((void *)this + 11);
  if (v16)
  {
    *((void *)this + 12) = v16;
    operator delete(v16);
  }
  if (*((char *)this + 87) < 0) {
    operator delete(*((void **)this + 8));
  }
  *(void *)this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  uint64_t vars8;

  SVGNode::~SVGNode(this);
  JUMPOUT(0x216677AD0);
}

void std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

uint64_t *std::map<std::string,SVGAttributeMap *,CaseInsensitiveStringLess,std::allocator<std::pair<std::string const,SVGAttributeMap *>>>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<std::string,SVGAttributeMap *,CaseInsensitiveStringLess,std::allocator<std::pair<std::string const,SVGAttributeMap *>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,SVGAttributeMap *>,std::__tree_node<std::__value_type<std::string,SVGAttributeMap *>,void *> *,long>>>(a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_210A27428(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::floatValue(os_unfair_lock_s *this, double *a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v7, this + 27);
  if (!SVGAttribute::resolveAsFloats((SVGAttribute *)this)
    || (uint64_t v4 = **(double ***)&this[22]._os_unfair_lock_opaque,
        *(double **)(*(void *)&this[22]._os_unfair_lock_opaque + 8) == v4))
  {
    uint64_t v5 = 0;
  }
  else
  {
    *a2 = *v4;
    uint64_t v5 = 1;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v7);
  return v5;
}

void sub_210A274B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

uint64_t ___ZL33ApplyUniqueAttributesToAttributesP15SVGAttributeMapS0__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = SVGAttributeMap::attribute(*(void *)(a1 + 32), *(_DWORD *)(a3 + 48));
  if (!result) {
    operator new();
  }
  return result;
}

void sub_210A27560(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void SVGPathCommand::appendFloats()
{
  __assert_rtn("appendFloats", "SVGPath.cpp", 137, "_floats != nullptr");
}

CGPath *CGSVGPathCreateCGPath(uint64_t a1, const char *a2)
{
  uint64_t v3 = (os_unfair_lock_s *)CFRetained::getObject<SVGPath>(a1, a2);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (SVGPath *)v3;
  Mutable = (CGPath *)SVGPath::copyCachedCGPath(v3);
  if (!Mutable)
  {
    v147 = v4;
    double v6 = *MEMORY[0x263F00148];
    double v7 = *(double *)(MEMORY[0x263F00148] + 8);
    Mutable = CGPathCreateMutable();
    uint64_t v9 = CFRetained::getObject<SVGPath>(a1, v8);
    if (v9)
    {
      uint64_t v11 = v9[7] - v9[6];
      if (v11)
      {
        unint64_t v12 = 0;
        int v13 = 0;
        uint64_t v14 = v11 >> 3;
        double x = v6;
        double y = v7;
        uint64_t v155 = v11 >> 3;
        while (1)
        {
          unint64_t v17 = CFRetained::getObject<SVGPath>(a1, v10);
          if (v17 && (uint64_t v19 = v17[6], v12 < (v17[7] - v19) >> 3)) {
            uint64_t v20 = *(void *)(*(void *)(v19 + 8 * v12) + 40);
          }
          else {
            uint64_t v20 = 0;
          }
          unsigned int v21 = (unsigned int *)CFRetained::getObject<SVGPathCommand>(v20, v18);
          if (v21) {
            break;
          }
          uint64_t v22 = 0;
LABEL_14:
          uint64_t v143 = v22;
          uint64_t v23 = "Unhandled operator '%c'\n";
LABEL_15:
          SVGUtilities::log((SVGUtilities *)v23, v10, v143);
LABEL_16:
          ++v12;
          int v13 = v22;
          if (v12 == v14) {
            goto LABEL_174;
          }
        }
        uint64_t v22 = v21[12];
        if ((int)v22 <= 96)
        {
          switch((int)v22)
          {
            case 'A':
              goto LABEL_51;
            case 'B':
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'I':
            case 'J':
            case 'K':
            case 'N':
            case 'O':
            case 'P':
            case 'R':
            case 'U':
              goto LABEL_14;
            case 'C':
              goto LABEL_57;
            case 'H':
            case 'V':
              goto LABEL_19;
            case 'L':
            case 'M':
              goto LABEL_32;
            case 'Q':
              goto LABEL_61;
            case 'S':
              goto LABEL_65;
            case 'T':
              goto LABEL_69;
            default:
              if (v22 != 90) {
                goto LABEL_14;
              }
              goto LABEL_89;
          }
        }
        switch((int)v22)
        {
          case 'a':
LABEL_51:
            float64x2_t v45 = CFRetained::getObject<SVGPathCommand>(v20, v10);
            if (!v45) {
              goto LABEL_55;
            }
            v46 = (uint64_t *)v45[7];
            if (!v46) {
              goto LABEL_55;
            }
            uint64_t v48 = *v46;
            uint64_t v47 = *(void *)(v45[7] + 8);
            unint64_t v49 = (v47 - v48) >> 3;
            if (0x6DB6DB6DB6DB6DB7 * v49 > 0x2492492492492492)
            {
              SVGUtilities::log((SVGUtilities *)"A/a command was given the wrong number of floats.\n", v10);
LABEL_55:
              double v50 = y;
              double v51 = x;
              goto LABEL_56;
            }
            if (v47 == v48) {
              goto LABEL_55;
            }
            v90 = 0;
            uint64_t v146 = (v47 - v48) >> 3;
            double v144 = v7;
            double v145 = v6;
            break;
          case 'b':
          case 'd':
          case 'e':
          case 'f':
          case 'g':
          case 'i':
          case 'j':
          case 'k':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
          case 'u':
            goto LABEL_14;
          case 'c':
LABEL_57:
            v52 = CFRetained::getObject<SVGPathCommand>(v20, v10);
            if (!v52) {
              goto LABEL_16;
            }
            v53 = (uint64_t *)v52[7];
            if (!v53) {
              goto LABEL_16;
            }
            uint64_t v55 = *v53;
            uint64_t v54 = *(void *)(v52[7] + 8);
            unint64_t v56 = (v54 - v55) >> 3;
            if (__ROR8__(0xAAAAAAAAAAAAAAABLL * v56, 1) > 0x2AAAAAAAAAAAAAAAuLL)
            {
              uint64_t v23 = "C/c command was given the wrong number of points.\n";
              goto LABEL_15;
            }
            if (v54 != v55)
            {
              v130 = 0;
              do
              {
                FloatAtIndedouble x = CGSVGPathCommandGetFloatAtIndex(v20, v130);
                double v132 = CGSVGPathCommandGetFloatAtIndex(v20, v130 + 1);
                double v6 = CGSVGPathCommandGetFloatAtIndex(v20, v130 + 2);
                double v7 = CGSVGPathCommandGetFloatAtIndex(v20, v130 + 3);
                double v133 = CGSVGPathCommandGetFloatAtIndex(v20, v130 + 4);
                v134 = v130 + 5;
                double v135 = CGSVGPathCommandGetFloatAtIndex(v20, v134);
                if ((v22 - 97) > 0x15)
                {
                  double x = v133;
                  double y = v135;
                }
                else
                {
                  int v136 = 1 << (v22 - 97);
                  if ((v136 & 0x2D1885) != 0)
                  {
                    FloatAtIndedouble x = x + FloatAtIndex;
                    double v132 = y + v132;
                    double v6 = x + v6;
                    double v7 = y + v7;
                    double x = x + v133;
                  }
                  else
                  {
                    double x = v133;
                  }
                  if ((v136 & 0x2D1885) != 0) {
                    double y = y + v135;
                  }
                  else {
                    double y = v135;
                  }
                }
                CGPathAddCurveToPoint(Mutable, 0, FloatAtIndex, v132, v6, v7, x, y);
                v130 = v134 + 1;
              }
              while ((unint64_t)v130 < v56);
            }
            goto LABEL_16;
          case 'h':
          case 'v':
LABEL_19:
            uint64x2_t v24 = CFRetained::getObject<SVGPathCommand>(v20, v10);
            if (v24 && (uint64_t v25 = (void *)v24[7]) != 0 && (v26 = *(void *)(v24[7] + 8) - *v25) != 0)
            {
              double v27 = 0;
              int v28 = v22 & 0xFFFFFFDF;
              uint64_t v29 = v26 >> 3;
              do
              {
                double v30 = CGSVGPathCommandGetFloatAtIndex(v20, v27);
                if ((((v22 - 97) < 0x16) & (0x2D1885u >> (v22 - 97))) != 0)
                {
                  double v31 = y + v30;
                  double v32 = x + v30;
                  if (v28 == 72) {
                    double x = v32;
                  }
                  else {
                    double y = v31;
                  }
                }
                else if (v28 == 72)
                {
                  double x = v30;
                }
                else
                {
                  double y = v30;
                }
                CGPathAddLineToPoint(Mutable, 0, x, y);
                ++v27;
              }
              while ((const char *)v29 != v27);
              uint64_t v14 = v155;
            }
            else
            {
              uint64_t v14 = v155;
            }
            goto LABEL_16;
          case 'l':
          case 'm':
LABEL_32:
            double v33 = CFRetained::getObject<SVGPathCommand>(v20, v10);
            if (v33)
            {
              double v34 = (void *)v33[7];
              if (v34)
              {
                uint64_t v35 = *(void *)(v33[7] + 8) - *v34;
                if (v35)
                {
                  double v36 = 0;
                  unint64_t v37 = v35 >> 3;
                  do
                  {
                    double v38 = CGSVGPathCommandGetFloatAtIndex(v20, v36);
                    float64x2_t v39 = v36 + 1;
                    double v40 = CGSVGPathCommandGetFloatAtIndex(v20, v39);
                    unsigned int v41 = v22 - 97;
                    double v42 = x + v38;
                    double v43 = y + v40;
                    if (((1 << (v22 - 97)) & 0x2D1885) == 0)
                    {
                      double v42 = v38;
                      double v43 = v40;
                    }
                    if (v41 <= 0x15) {
                      double x = v42;
                    }
                    else {
                      double x = v38;
                    }
                    if (v41 <= 0x15) {
                      double y = v43;
                    }
                    else {
                      double y = v40;
                    }
                    v44 = v39 - 1;
                    if ((v22 & 0xFFFFFFDF) == 0x4D && v39 == (const char *)1) {
                      CGPathMoveToPoint(Mutable, 0, x, y);
                    }
                    else {
                      CGPathAddLineToPoint(Mutable, 0, x, y);
                    }
                    double v36 = v39 + 1;
                  }
                  while ((unint64_t)(v44 + 2) < v37);
                  uint64_t v14 = v155;
                }
              }
            }
            goto LABEL_16;
          case 'q':
LABEL_61:
            char v57 = CFRetained::getObject<SVGPathCommand>(v20, v10);
            if (!v57) {
              goto LABEL_16;
            }
            char v58 = (uint64_t *)v57[7];
            if (!v58) {
              goto LABEL_16;
            }
            uint64_t v60 = *v58;
            uint64_t v59 = v58[1];
            uint64_t v61 = v59 - *v58;
            if ((v61 & 0x18) != 0)
            {
              uint64_t v23 = "Q/q command was given the wrong number of points.\n";
              goto LABEL_15;
            }
            if (v59 != v60)
            {
              v137 = 0;
              unint64_t v138 = v61 >> 3;
              do
              {
                double v6 = CGSVGPathCommandGetFloatAtIndex(v20, v137);
                double v7 = CGSVGPathCommandGetFloatAtIndex(v20, v137 + 1);
                double v139 = CGSVGPathCommandGetFloatAtIndex(v20, v137 + 2);
                v140 = v137 + 3;
                double v141 = CGSVGPathCommandGetFloatAtIndex(v20, v140);
                if (v22 == 113)
                {
                  double v6 = x + v6;
                  double v7 = y + v7;
                  double x = x + v139;
                }
                else
                {
                  double x = v139;
                }
                if (v22 == 113) {
                  double y = y + v141;
                }
                else {
                  double y = v141;
                }
                CGPathAddQuadCurveToPoint(Mutable, 0, v6, v7, x, y);
                v137 = v140 + 1;
              }
              while ((unint64_t)v137 < v138);
            }
            goto LABEL_16;
          case 's':
LABEL_65:
            v62 = CFRetained::getObject<SVGPathCommand>(v20, v10);
            if (v62 && (v63 = (void *)v62[7]) != 0)
            {
              uint64_t v64 = v63[1] - *v63;
              if ((v64 & 0x18) != 0)
              {
                uint64_t v23 = "S/s command was given the wrong number of points.\n";
                goto LABEL_15;
              }
              unint64_t v77 = v64 >> 3;
            }
            else
            {
              unint64_t v77 = 0;
            }
            HIDWORD(v78) = v13 - 67;
            LODWORD(v78) = v13 - 67;
            if ((v78 >> 4) >= 4)
            {
              double v7 = y;
              double v6 = x;
            }
            if (v77)
            {
              for (uint64_t i = 0; (unint64_t)i < v77; uint64_t i = v83 + 1)
              {
                double v80 = x + x - v6;
                double v81 = y + y - v7;
                double v6 = CGSVGPathCommandGetFloatAtIndex(v20, i);
                double v7 = CGSVGPathCommandGetFloatAtIndex(v20, i + 1);
                double v82 = CGSVGPathCommandGetFloatAtIndex(v20, i + 2);
                v83 = i + 3;
                double v84 = CGSVGPathCommandGetFloatAtIndex(v20, v83);
                unsigned int v85 = v22 - 97;
                double v86 = x + v6;
                double v87 = y + v7;
                double v88 = x + v82;
                double v89 = y + v84;
                if (((1 << (v22 - 97)) & 0x2D1885) == 0)
                {
                  double v86 = v6;
                  double v87 = v7;
                  double v88 = v82;
                  double v89 = v84;
                }
                if (v85 > 0x15)
                {
                  double x = v82;
                }
                else
                {
                  double v6 = v86;
                  double v7 = v87;
                  double x = v88;
                }
                if (v85 <= 0x15) {
                  double y = v89;
                }
                else {
                  double y = v84;
                }
                CGPathAddCurveToPoint(Mutable, 0, v80, v81, v6, v7, x, y);
              }
            }
            goto LABEL_16;
          case 't':
LABEL_69:
            if ((v13 - 81) > 0x23 || ((1 << (v13 - 81)) & 0x900000009) == 0)
            {
              double v7 = y;
              double v6 = x;
            }
            v65 = CFRetained::getObject<SVGPathCommand>(v20, v10);
            if (v65)
            {
              v66 = (void *)v65[7];
              if (v66)
              {
                uint64_t v67 = *(void *)(v65[7] + 8) - *v66;
                if (v67)
                {
                  v68 = 0;
                  unint64_t v69 = v67 >> 3;
                  do
                  {
                    double v6 = x + x - v6;
                    double v7 = y + y - v7;
                    double v70 = CGSVGPathCommandGetFloatAtIndex(v20, v68);
                    v71 = v68 + 1;
                    double v72 = CGSVGPathCommandGetFloatAtIndex(v20, v71);
                    unsigned int v73 = v22 - 97;
                    double v74 = x + v70;
                    double v75 = y + v72;
                    if (((1 << (v22 - 97)) & 0x2D1885) == 0)
                    {
                      double v74 = v70;
                      double v75 = v72;
                    }
                    if (v73 <= 0x15) {
                      double x = v74;
                    }
                    else {
                      double x = v70;
                    }
                    if (v73 <= 0x15) {
                      double y = v75;
                    }
                    else {
                      double y = v72;
                    }
                    CGPathAddQuadCurveToPoint(Mutable, 0, v6, v7, x, y);
                    v68 = v71 + 1;
                  }
                  while ((unint64_t)v68 < v69);
                }
              }
            }
            goto LABEL_16;
          default:
            if (v22 != 122) {
              goto LABEL_14;
            }
LABEL_89:
            CGPathCloseSubpath(Mutable);
            CGPoint CurrentPoint = CGPathGetCurrentPoint(Mutable);
            double x = CurrentPoint.x;
            double y = CurrentPoint.y;
            double v7 = CurrentPoint.y;
            double v6 = CurrentPoint.x;
            goto LABEL_16;
        }
        while (1)
        {
          double v91 = CGSVGPathCommandGetFloatAtIndex(v20, v90);
          sdouble y = CGSVGPathCommandGetFloatAtIndex(v20, v90 + 1);
          double v92 = CGSVGPathCommandGetFloatAtIndex(v20, v90 + 5);
          double v93 = CGSVGPathCommandGetFloatAtIndex(v20, v90 + 6);
          double v156 = CGSVGPathCommandGetFloatAtIndex(v20, v90 + 2);
          double v158 = CGSVGPathCommandGetFloatAtIndex(v20, v90 + 3);
          double v95 = CGSVGPathCommandGetFloatAtIndex(v20, v90 + 4);
          unsigned int v96 = v22 - 97;
          double v97 = x + v92;
          double v98 = y + v93;
          if (((1 << (v22 - 97)) & 0x2D1885) == 0)
          {
            double v98 = v93;
            double v97 = v92;
          }
          if (v96 <= 0x15) {
            CGFloat v99 = v98;
          }
          else {
            CGFloat v99 = v93;
          }
          if (v96 <= 0x15) {
            double v92 = v97;
          }
          if (v91 != 0.0 && sy != 0.0) {
            break;
          }
          SVGUtilities::log((SVGUtilities *)"Warning: ellipses path has invalid rx or ry value. Drawing line.\n", v94);
          CGPathAddLineToPoint(Mutable, 0, v92, v99);
          double v50 = y;
          double v51 = x;
LABEL_143:
          v90 += 7;
          if ((unint64_t)v90 >= v49)
          {
LABEL_56:
            double y = v50;
            double x = v51;
            goto LABEL_16;
          }
        }
        BOOL v100 = v95 > 0.0;
        double v101 = fabs(sy);
        double v102 = fabs(v91);
        double v103 = v156 / 180.0 * 3.14159265;
        double angle = v103;
        double v157 = v95;
        __double2 v104 = __sincos_stret(v103);
        double v150 = v92;
        CGFloat v151 = v99;
        double v105 = x - v92;
        double v106 = v104.__sinval * (y - v99) * 0.5 + v104.__cosval * (x - v92) * 0.5;
        double v107 = v104.__cosval * (y - v99) * 0.5 - v105 * v104.__sinval * 0.5;
        double v108 = v106 * v106 / (v91 * v91) + v107 * v107 / (sy * sy);
        double v109 = sqrt(v108);
        if (v108 <= 1.0) {
          double v110 = 1.0;
        }
        else {
          double v110 = v109;
        }
        double v111 = v101 * v110;
        double v112 = v102 * v110;
        double v113 = sqrt((v111 * (v112 * v112) * v111 - v107 * (v112 * v112) * v107 - v106 * (v111 * v111) * v106)/ (v106 * (v106 * (v111 * v111)) + v107 * (v112 * v112) * v107));
        if (v158 > 0.0 == v100) {
          double v113 = -v113;
        }
        double v114 = v107 * v112 / v111 * v113;
        double v115 = -(v111 * v106) / v112 * v113;
        v168.ddouble x = (v106 - v114) / v112;
        v168.ddouble y = (v107 - v115) / v111;
        ddouble x = v168.dx;
        v166.ddouble x = 1.0;
        v166.ddouble y = 0.0;
        Vec2Angle(v166, v168);
        double startAngle = v116;
        double v117 = -v106;
        double v118 = v114;
        sdouble x = v112;
        v169.ddouble x = (v117 - v114) / v112;
        double v148 = v115;
        CGFloat sya = v111;
        v169.ddouble y = (-v107 - v115) / v111;
        v167.ddouble y = (v107 - v115) / v111;
        v167.ddouble x = dx;
        Vec2Angle(v167, v169);
        double v120 = v119;
        if (v157 <= 0.0)
        {
          if (v158 > 0.0 || v119 <= 0.0)
          {
            v121 = CGContextClosePath;
            double v51 = v150;
            double v50 = v151;
            double cosval = v104.__cosval;
            double sinval = v104.__sinval;
            double v7 = v144;
            double v6 = v145;
            double v124 = v148;
            if (v119 <= -6.28318531)
            {
              do
                double v120 = v120 + 6.28318531;
              while (v120 <= -6.28318531);
            }
LABEL_133:
            CGFloat v125 = (x + v51) * 0.5 + cosval * v118 - sinval * v124;
            double v126 = cosval * v124 + sinval * v118;
            long long v127 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
            *(_OWORD *)&matrix.a = *MEMORY[0x263F000D0];
            *(_OWORD *)&matrix.c = v127;
            *(_OWORD *)&matrix.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
            *(_OWORD *)&v163.a = *(_OWORD *)&matrix.a;
            *(_OWORD *)&v163.c = v127;
            *(_OWORD *)&v163.tdouble x = *(_OWORD *)&matrix.tx;
            CGAffineTransformTranslate(&v164, &v163, v125, (y + v50) * 0.5 + v126);
            matridouble x = v164;
            CGAffineTransform v162 = v164;
            CGAffineTransformRotate(&v164, &v162, angle);
            matridouble x = v164;
            CGAffineTransform v161 = v164;
            CGAffineTransformScale(&v164, &v161, sx, sya);
            matridouble x = v164;
            if (v158 <= 0.0 || v157 <= 0.0 || v120 >= 0.0)
            {
              if (v158 <= 0.0 || v157 > 0.0 || v120 <= 0.0)
              {
                CGFloat v129 = startAngle;
                if (v120 == 0.0) {
                  double v120 = *((double *)v121 + 480);
                }
                goto LABEL_142;
              }
              double v128 = -6.28318531;
            }
            else
            {
              double v128 = *((double *)v121 + 480);
            }
            double v120 = v120 + v128;
            CGFloat v129 = startAngle;
LABEL_142:
            CGPathAddRelativeArc(Mutable, &matrix, 0.0, 0.0, 1.0, v129, v120);
            double y = v50;
            double x = v51;
            unint64_t v49 = v146;
            goto LABEL_143;
          }
          double v120 = v119 + -6.28318531;
          v121 = CGContextClosePath;
          double v51 = v150;
          double v50 = v151;
          double cosval = v104.__cosval;
          double sinval = v104.__sinval;
          double v7 = v144;
          double v6 = v145;
        }
        else
        {
          v121 = CGContextClosePath;
          if (v119 >= 0.0)
          {
            double v51 = v150;
            double v50 = v151;
            double v7 = v144;
            double v6 = v145;
          }
          else
          {
            double v51 = v150;
            double v50 = v151;
            double v7 = v144;
            double v6 = v145;
            do
              double v120 = v120 + 6.28318531;
            while (v120 < 0.0);
          }
          double v120 = fmod(v120, 6.28318531);
          double cosval = v104.__cosval;
          double sinval = v104.__sinval;
        }
        double v124 = v148;
        goto LABEL_133;
      }
    }
LABEL_174:
    SVGPath::setCGPath((os_unfair_lock_s *)v147, Mutable);
  }
  return Mutable;
}

double CGSVGPathCommandGetFloatAtIndex(uint64_t a1, const char *a2)
{
  uint64_t v3 = CFRetained::getObject<SVGPathCommand>(a1, a2);
  double result = 0.0;
  if (v3)
  {
    uint64_t v5 = (uint64_t *)v3[7];
    if (v5)
    {
      uint64_t v6 = *v5;
      if ((unint64_t)a2 < (*(void *)(v3[7] + 8) - v6) >> 3) {
        return *(double *)(v6 + 8 * (void)a2);
      }
    }
  }
  return result;
}

void *CFRetained::getObject<SVGPathCommand>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  uint64_t v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

void *CFRetained::getObject<SVGPath>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  uint64_t v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

const void *SVGPath::copyCachedCGPath(os_unfair_lock_s *this)
{
  uint64_t v2 = this + 32;
  os_unfair_lock_lock(this + 32);
  uint64_t v3 = *(const void **)&this[18]._os_unfair_lock_opaque;
  if (v3) {
    CFRetain(v3);
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

void SVGPath::setCGPath(os_unfair_lock_s *this, const CGPath *a2)
{
  uint64_t v4 = this + 32;
  os_unfair_lock_lock(this + 32);
  uint64_t v5 = *(const void **)&this[18]._os_unfair_lock_opaque;
  if (v5)
  {
    CFRelease(v5);
    *(void *)&this[18]._os_unfair_lock_opaque = 0;
  }
  if (a2)
  {
    *(void *)&this[18]._os_unfair_lock_opaque = a2;
    CFRetain(a2);
  }
  os_unfair_lock_unlock(v4);
}

os_unfair_lock_s *CGSVGAttributeGetTransform(uint64_t a1, char *a2)
{
  double result = (os_unfair_lock_s *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    return (os_unfair_lock_s *)SVGAttribute::transformValue(result, (CGAffineTransform *)a2);
  }
  return result;
}

void SVGReader::SVGReader(SVGReader *this, CFDataRef theData, const SVGReaderOptions *a3)
{
  *(void *)this = a3;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 5) = 0;
  BytePtr = (const char *)CFDataGetBytePtr(theData);
  if (BytePtr)
  {
    Length = (SVGReader *)CFDataGetLength(theData);
    if ((int)Length <= 0)
    {
      SVGReader::report(Length, (SVGParser *)"Got zero-length from CFDataRef", 0, v7);
    }
    else
    {
      Memordouble y = xmlReadMemory(BytePtr, (int)Length, 0, 0, 0);
      uint64_t v10 = (xmlDoc *)Memory;
      if (Memory)
      {
        xmlNodePtr RootElement = xmlDocGetRootElement(Memory);
        int v13 = (SVGReader *)SVGAtom::ToName((SVGAtom *)RootElement->name, v12);
        if (v13 == 61) {
          operator new();
        }
        SVGReader::report(v13, (SVGParser *)"Root XML node does not have \"SVG\" type", 0, v14);
        xmlFreeDoc(v10);
      }
      else
      {
        SVGReader::report(0, (SVGParser *)"Failed to parse with xmlReadMemory", 0, v9);
      }
    }
  }
  else
  {
    SVGReader::report(0, (SVGParser *)"Got null from CFDataGetBytePtr(...)", 0, v4);
  }
}

void sub_210A28738(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)(v1 + 24);
  if (v3)
  {
    *(void *)(v1 + 32) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void SVGReader::parseXMLNode(SVGReader *this, _xmlNode *a2, SVGNode *a3)
{
  if (a2->type != XML_COMMENT_NODE && !xmlNodeIsText(a2))
  {
    if (a2->type == XML_CDATA_SECTION_NODE)
    {
      SVGUtilities::log((SVGUtilities *)"CDATA section node is not currently supported", v4);
    }
    else
    {
      name = (SVGAtom *)a2->name;
      if (name && *(unsigned char *)name)
      {
        SVGAtom::ToName(name, v4);
        operator new();
      }
      uint64_t line = a2->line;
      SVGReader::report(name, (SVGParser *)"Invalid node name", line, v5);
    }
  }
}

void sub_210A28F0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t SVGNode::setAttributes(SVGNode *this, CFTypeRef *a2)
{
  SVGAttributeMap::setOwnerNode(*((void *)this + 7), 0);
  CFRetained::release(*((CFTypeRef **)this + 7));
  if (!a2) {
    operator new();
  }
  *((void *)this + 7) = a2;
  CFRetained::retain(a2);
  SVGAttributeMap::setOwnerNode(*((void *)this + 7), (uint64_t)this);
  uint64_t v4 = *(uint64_t (**)(SVGNode *, CFTypeRef *))(*(void *)this + 24);
  return v4(this, a2);
}

void sub_210A29094(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4084D8EEBALL);
  _Unwind_Resume(a1);
}

uint64_t SVGAttributeMap::setOwnerNode(uint64_t result, uint64_t a2)
{
  *(void *)(result + 72) = a2;
  return result;
}

void SVGReader::parseXMLNodeAttributes(SVGReader *this, _xmlNode *a2, SVGAttributeMap *a3)
{
  for (uint64_t i = a2->properties; i; uint64_t i = i->next)
  {
    uint64_t v6 = (SVGReader *)SVGAtom::ToName((SVGAtom *)i->name, (const char *)a2);
    if (*(void *)this && *(unsigned char *)(*(void *)this + 8) && v6 >= 0x9F)
    {
      SVGReader::report(v6, (SVGParser *)"Attribute: '%s' is not allowed in strict mode", a2->line, v7, i->name);
    }
    else if (v6)
    {
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)i->children->content);
      SVGAttributeMap::setAttribute();
    }
  }
}

void sub_210A29188(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGAttributeMap::setAttribute()
{
}

void sub_210A29218(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::SVGAttribute(uint64_t a1, int a2, const std::string *a3)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 80) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  std::string::operator=((std::string *)(a1 + 56), a3);
  return a1;
}

void sub_210A292E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 79) < 0) {
    operator delete(*v16);
  }
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

BOOL SVGShapeNode::IsValidShapePrimitive(unsigned int a1)
{
  return a1 <= 0x31 && ((1 << a1) & 0x2341100010008) != 0 || a1 == 10001;
}

SVGAttribute *SVGReader::ApplyStyleToAttributes(SVGReader *this, SVGNode *a2, SVGStyle *a3, SVGAttributeMap *a4)
{
  double result = (SVGAttribute *)SVGAttributeMap::attribute((uint64_t)a3, 0x3Cu);
  if (result)
  {
    uint64_t v6 = SVGAttribute::stringValue(result);
    if (*(char *)(v6 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)v6, *(void *)(v6 + 8));
    }
    else
    {
      long long v7 = *(_OWORD *)v6;
      v10.__r_.__value_.__r.__words[2] = *(void *)(v6 + 16);
      *(_OWORD *)&v10.__r_.__value_.__l.__data_ = v7;
    }
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v8, v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
    }
    else {
      std::string v8 = v10;
    }
    SVGParser::ParseDeclarationBlockFromRuleset((char *)&v8, 1, &v9);
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v8.__r_.__value_.__l.__data_);
    }
    operator new();
  }
  if (a2) {
    operator new();
  }
  return result;
}

void sub_210A29694(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGNode::addChild(SVGNode *this, SVGNode *a2)
{
  if (a2 == this)
  {
    SVGUtilities::error((SVGUtilities *)"Warning: attempted to add a node to itself, causing a cycle. Ignoring.", (const char *)a2);
  }
  else if (a2)
  {
    unint64_t v6 = *((void *)this + 13);
    uint64_t v4 = (char *)this + 104;
    unint64_t v5 = v6;
    long long v7 = (void *)*((void *)v4 - 1);
    if ((unint64_t)v7 >= v6)
    {
      uint64_t v9 = (void **)(v4 - 16);
      uint64_t v10 = *((void *)v4 - 2);
      uint64_t v11 = ((uint64_t)v7 - v10) >> 3;
      if ((unint64_t)(v11 + 1) >> 61) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v5 - v10;
      uint64_t v13 = v12 >> 2;
      if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
        uint64_t v13 = v11 + 1;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14) {
        uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v4, v14);
      }
      else {
        uint64_t v15 = 0;
      }
      unsigned int v16 = &v15[8 * v11];
      unint64_t v17 = &v15[8 * v14];
      *(void *)unsigned int v16 = a2;
      std::string v8 = v16 + 8;
      uint64_t v19 = (char *)*((void *)this + 11);
      uint64_t v18 = (char *)*((void *)this + 12);
      if (v18 != v19)
      {
        do
        {
          uint64_t v20 = *((void *)v18 - 1);
          v18 -= 8;
          *((void *)v16 - 1) = v20;
          v16 -= 8;
        }
        while (v18 != v19);
        uint64_t v18 = (char *)*v9;
      }
      *((void *)this + 11) = v16;
      *((void *)this + 12) = v8;
      *((void *)this + 13) = v17;
      if (v18) {
        operator delete(v18);
      }
    }
    else
    {
      void *v7 = a2;
      std::string v8 = v7 + 1;
    }
    *((void *)this + 12) = v8;
    CFRetained::retain((CFTypeRef *)a2);
    *((void *)a2 + 6) = this;
    if (SVGNode::identifier(a2) && *SVGNode::identifier(a2))
    {
      unsigned int v21 = SVGNode::identifier(a2);
      std::string::basic_string[abi:ne180100]<0>(__p, v21);
      uint64x2_t v24 = a2;
      std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,SVGNode *>>((uint64_t **)this + 17, (uint64_t)__p, (uint64_t)__p);
      if (v23 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_210A298C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *SVGNode::identifier(SVGNode *this)
{
  uint64_t v1 = (SVGAttribute *)SVGAttributeMap::attribute(*((void *)this + 7), 0x1Fu);
  if (!v1) {
    return (char *)&unk_210A5361E;
  }
  double result = (char *)SVGAttribute::stringValue(v1);
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

CFStringRef CGSVGAttributeCopyString(uint64_t a1, const char *a2)
{
  uint64_t v2 = (SVGAttribute *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = SVGAttribute::stringValue(v2);
  if (*(char *)(v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *(void *)(v3 + 8));
  }
  else
  {
    long long v4 = *(_OWORD *)v3;
    __p.__r_.__value_.__r.__words[2] = *(void *)(v3 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v4;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  CFStringRef v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB30], (const char *)p_p, 0x8000100u);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v5;
}

void sub_210A299C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGAttribute::stringValue(SVGAttribute *this)
{
  if (*((char *)this + 79) < 0) {
    uint64_t v2 = *((void *)this + 8);
  }
  else {
    uint64_t v2 = *((unsigned __int8 *)this + 79);
  }
  uint64_t v3 = (void **)((char *)this + 56);
  if (!v2)
  {
    switch(*((_DWORD *)this + 20))
    {
      case 1:
        long long v4 = (void *)*((void *)this + 11);
        if (*((_DWORD *)this + 26) == 9)
        {
          CFStringRef v5 = (void *)*v4;
          unint64_t v6 = (void *)v4[1];
          if ((void *)((char *)v6 - *v4) == (void *)8)
          {
            CGSVGLengthMakeWithType();
            SVGUtilities::CGSVGLengthToString(v7, v8, &__p);
            if (*((char *)this + 79) < 0) {
              operator delete(*v3);
            }
            *(_OWORD *)uint64_t v3 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            *((void *)this + 9) = *((void *)&__p.__r_.__value_.__l + 2);
            goto LABEL_36;
          }
        }
        else
        {
          CFStringRef v5 = (void *)*v4;
          unint64_t v6 = (void *)v4[1];
        }
        for (; v5 != v6; ++v5)
        {
          SVGParser::FormatString((SVGParser *)"%g ", &__p, *v5);
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
          std::string::append((std::string *)((char *)this + 56), (const std::string::value_type *)p_p, size);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
LABEL_36:
        if (*((char *)this + 79) < 0)
        {
          std::string::__init_copy_ctor_external(&v15, *((const std::string::value_type **)this + 7), *((void *)this + 8));
        }
        else
        {
          *(_OWORD *)&v15.__r_.__value_.__l.__data_ = *(_OWORD *)v3;
          v15.__r_.__value_.__r.__words[2] = *((void *)this + 9);
        }
        SVGParser::StripLeadingTrailingWhitespace(&v15, &__p);
        if (*((char *)this + 79) < 0) {
          operator delete(*v3);
        }
        *(_OWORD *)uint64_t v3 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *((void *)this + 9) = *((void *)&__p.__r_.__value_.__l + 2);
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = 0;
        __p.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v15.__r_.__value_.__l.__data_);
        }
        break;
      case 3:
        uint64_t v11 = (SVGPaint *)*((void *)this + 11);
        if (v11)
        {
          SVGPaint::createStringRepresentation(v11, (uint64_t)&__p);
          goto LABEL_21;
        }
        return (uint64_t)this + 56;
      case 4:
        uint64_t v9 = (SVGPath *)*((void *)this + 11);
        if (v9)
        {
          SVGPath::createStringRepresentation(v9, &__p);
          goto LABEL_21;
        }
        return (uint64_t)this + 56;
      case 6:
        uint64_t v10 = (SVGMask *)*((void *)this + 11);
        if (v10) {
          goto LABEL_20;
        }
        return (uint64_t)this + 56;
      case 7:
        uint64_t v10 = (SVGMask *)*((void *)this + 11);
        if (v10) {
          goto LABEL_20;
        }
        return (uint64_t)this + 56;
      case 8:
        uint64_t v10 = (SVGMask *)*((void *)this + 11);
        if (v10)
        {
LABEL_20:
          SVGMask::createStringRepresentation(v10, &__p);
LABEL_21:
          if (*((char *)this + 79) < 0) {
            operator delete(*v3);
          }
          *(_OWORD *)uint64_t v3 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *((void *)this + 9) = *((void *)&__p.__r_.__value_.__l + 2);
        }
        return (uint64_t)this + 56;
      default:
        return (uint64_t)this + 56;
    }
  }
  return (uint64_t)this + 56;
}

void sub_210A29C1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *CFRetained::getObject<SVGAttribute>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  uint64_t v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

BOOL SVGStyle::getAttributeMapForClassAttribute(SVGStyle *this, SVGAttribute *a2, SVGAttributeMap *a3)
{
  if (!a2 || *((_DWORD *)a2 + 12) != 4) {
    return 0;
  }
  uint64_t v5 = SVGAttribute::stringValue(a2);
  if (*(char *)(v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)v5, *(void *)(v5 + 8));
  }
  else
  {
    long long v6 = *(_OWORD *)v5;
    v18.__r_.__value_.__r.__words[2] = *(void *)(v5 + 16);
    *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v6;
  }
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v8 = &v18;
  }
  else {
    int v8 = (std::string *)v18.__r_.__value_.__r.__words[0];
  }
  SVGParser::ParseClassPropertyValue((SVGParser *)v8, &v16);
  uint64_t v9 = v16;
  uint64_t v10 = v17;
  if (v16 == v17)
  {
    int v14 = 0;
  }
  else
  {
    int v11 = 0;
    do
    {
      if (*(char *)(v9 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v9, *(void *)(v9 + 8));
      }
      else
      {
        long long v12 = *(_OWORD *)v9;
        __p.__r_.__value_.__r.__words[2] = *(void *)(v9 + 16);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v12;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if (SVGStyle::getAttributeMapForIdentifier(this, (char *)p_p, a3)) {
        int v11 = 1;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      v9 += 24;
    }
    while (v9 != v10);
    int v14 = v11;
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  return v14 != 0;
}

void sub_210A29E20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL SVGStyle::getAttributeMapForElement(SVGStyle *this, SVGNode *a2, SVGAttributeMap *a3)
{
  if (!a2) {
    return 0;
  }
  long long v4 = (char *)a2 + 64;
  if (*((char *)a2 + 87) < 0) {
    long long v4 = *(char **)v4;
  }
  return SVGStyle::getAttributeMapForIdentifier(this, v4, a3);
}

BOOL SVGStyle::getAttributeMapForIdentifierAttribute(SVGStyle *this, SVGAttribute *a2, SVGAttributeMap *a3)
{
  if (!a2 || *((_DWORD *)a2 + 12) != 31) {
    return 0;
  }
  uint64_t v5 = SVGAttribute::stringValue(a2);
  if (*(char *)(v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *(void *)(v5 + 8));
  }
  else
  {
    long long v6 = *(_OWORD *)v5;
    __p.__r_.__value_.__r.__words[2] = *(void *)(v5 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v6;
  }
  std::string::insert(&__p, 0, "#");
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  BOOL AttributeMapForIdentifier = SVGStyle::getAttributeMapForIdentifier(this, (char *)p_p, a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return AttributeMapForIdentifier;
}

void sub_210A29F5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGRootNode::SVGRootNode(SVGRootNode *this)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "svg");
  SVGViewBoxNode::SVGViewBoxNode(this, __p);
}

void sub_210A29FF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGViewBoxNode::SVGViewBoxNode(SVGNode *a1, const char *a2)
{
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  SVGNode::SVGNode(a1, a2);
}

void sub_210A2A0B4(_Unwind_Exception *a1)
{
  SVGNode::~SVGNode(v1);
  _Unwind_Resume(a1);
}

uint64_t SVGViewBoxNode::updatedAttributes(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZN14SVGViewBoxNode17updatedAttributesEP15SVGAttributeMap_block_invoke;
  v3[3] = &__block_descriptor_tmp_12;
  v3[4] = a1;
  return SVGAttributeMap::enumerate(a2, (uint64_t)v3);
}

void SVGNode::SVGNode(SVGNode *this, const char *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A320;
  *((void *)this + 6) = 0;
  operator new();
}

void sub_210A2A248(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(v3, *(char **)(v1 + 168));
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(v4, *(char **)(v1 + 144));
  uint64_t v7 = *(void **)(v1 + 112);
  if (v7)
  {
    *(void *)(v1 + 120) = v7;
    operator delete(v7);
  }
  int v8 = *v5;
  if (*v5)
  {
    *(void *)(v1 + 96) = v8;
    operator delete(v8);
  }
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

uint64_t SVGShapeNode::updatedAttributes(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZN12SVGShapeNode17updatedAttributesEP15SVGAttributeMap_block_invoke;
  v3[3] = &__block_descriptor_tmp_13;
  v3[4] = a1;
  return SVGAttributeMap::enumerate(a2, (uint64_t)v3);
}

void SVGShapeNode::SVGShapeNode(void *a1)
{
}

void sub_210A2A464(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x10F3C40176D6E88);
  SVGNode::~SVGNode(v1);
  _Unwind_Resume(a1);
}

void SVGPath::SVGPath(SVGPath *this)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPath::kSVGPathClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A370;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  uint64_t v2 = MEMORY[0x263F000D0];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *((_OWORD *)this + 5) = *MEMORY[0x263F000D0];
  *((_OWORD *)this + 6) = v3;
  *((_OWORD *)this + 7) = *(_OWORD *)(v2 + 32);
  *((_DWORD *)this + 32) = 0;
}

void sub_210A2A534(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGNode::SVGNode(void *a1)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  CFRetained::CFRetained(a1, (uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_26C30A320;
  a1[6] = 0;
  operator new();
}

{
  void *__p[2];
  char v3;

  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  CFRetained::CFRetained(a1, (uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_26C30A320;
  a1[6] = 0;
  operator new();
}

void sub_210A2A684(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x10B3C4084D8EEBALL);
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void SVGShapeNode::setPath(SVGShapeNode *this, SVGPath *a2)
{
}

void sub_210A2A7B8(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void sub_210A2A888(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 79) < 0) {
    operator delete(*v16);
  }
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void SVGParser::ParseClassPropertyValue(SVGParser *this@<X0>, uint64_t *a2@<X8>)
{
  char v3 = this;
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  int64_t v5 = strlen((const char *)this);
  if (v5 >= 1)
  {
    unint64_t v6 = (unint64_t)v3 + v5;
    uint64_t v7 = (SVGParser *)((char *)v3 + v5);
    uint64_t v8 = MEMORY[0x263EF8318];
    do
    {
      do
      {
        unsigned int v9 = *(char *)v3;
        if ((v9 & 0x80000000) != 0) {
          int v10 = __maskrune(v9, 0x4000uLL);
        }
        else {
          int v10 = *(_DWORD *)(v8 + 4 * v9 + 60) & 0x4000;
        }
        if (!v10) {
          break;
        }
        char v3 = (SVGParser *)((char *)v3 + 1);
      }
      while ((unint64_t)v3 < v6);
      int v11 = v3;
      if ((unint64_t)v3 < v6)
      {
        int64_t v12 = v7 - v3;
        int v11 = v3;
        while (1)
        {
          unsigned int v13 = *(char *)v11;
          int v14 = (v13 & 0x80000000) != 0 ? __maskrune(v13, 0x4000uLL) : *(_DWORD *)(v8 + 4 * v13 + 60) & 0x4000;
          if (v14 || *(unsigned char *)v11 == 44) {
            break;
          }
          int v11 = (SVGParser *)((char *)v11 + 1);
          if (!--v12)
          {
            int v11 = v7;
            break;
          }
        }
      }
      std::string::basic_string[abi:ne180100](&__dst, v3, v11 - v3);
      std::string::insert(&__dst, 0, ".");
      unint64_t v15 = a2[1];
      if (v15 >= a2[2])
      {
        uint64_t v17 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a2, (long long *)&__dst);
      }
      else
      {
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a2[1], __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
        }
        else
        {
          long long v16 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
          *(void *)(v15 + 16) = *((void *)&__dst.__r_.__value_.__l + 2);
          *(_OWORD *)unint64_t v15 = v16;
        }
        uint64_t v17 = v15 + 24;
        a2[1] = v15 + 24;
      }
      a2[1] = v17;
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__dst.__r_.__value_.__l.__data_);
      }
      char v3 = (SVGParser *)((char *)v11 + 1);
    }
    while ((unint64_t)v11 + 1 < v6);
  }
}

void sub_210A2AA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  v15[1] = v16;
  if (a15 < 0) {
    operator delete(__p);
  }
  std::string __p = v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void SVGAttributeMap::filter(uint64_t a1, uint64_t (*a2)(void, void))
{
  uint64_t v2 = (uint64_t **)(a1 + 48);
  char v3 = *(void **)(a1 + 48);
  uint64_t v4 = (void *)(a1 + 56);
  if (v3 != (void *)(a1 + 56))
  {
    do
    {
      if (a2(*((unsigned int *)v3 + 8), v3[5]))
      {
        unint64_t v6 = (void *)v3[1];
        if (v6)
        {
          do
          {
            uint64_t v7 = v6;
            unint64_t v6 = (void *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            uint64_t v7 = (void *)v3[2];
            BOOL v8 = *v7 == (void)v3;
            char v3 = v7;
          }
          while (!v8);
        }
      }
      else
      {
        CFRetained::release((CFTypeRef *)v3[5]);
        unsigned int v9 = (void *)v3[1];
        int v10 = v3;
        if (v9)
        {
          do
          {
            uint64_t v7 = v9;
            unsigned int v9 = (void *)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            uint64_t v7 = (void *)v10[2];
            BOOL v8 = *v7 == (void)v10;
            int v10 = v7;
          }
          while (!v8);
        }
        std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::__remove_node_pointer(v2, v3);
        operator delete(v3);
      }
      char v3 = v7;
    }
    while (v7 != v4);
  }
}

BOOL SVGAtom::isKnown(uint64_t a1, unsigned int a2)
{
  unsigned int v6 = a2;
  char v3 = (os_unfair_lock_s *)(a1 + 88);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  BOOL v4 = std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::find<SVGAtom::Name>((void *)(a1 + 48), &v6) != 0;
  os_unfair_lock_unlock(v3);
  return v4;
}

uint64_t *std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::find<SVGAtom::Name>(void *a1, unsigned int *a2)
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
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  unsigned int v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (double result = *v6; result; double result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
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

BOOL SVGAtom::IsKnown(unsigned int a1)
{
  if (SVGAtom::SharedInstance(void)::onceToken != -1) {
    dispatch_once(&SVGAtom::SharedInstance(void)::onceToken, &__block_literal_global);
  }
  uint64_t v2 = SVGAtom::SharedInstance(void)::instance;
  return SVGAtom::isKnown(v2, a1);
}

uint64_t *std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,SVGNode *>>(uint64_t **a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = (uint64_t **)std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  double result = *v5;
  if (!*v5)
  {
    std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__construct_node<std::pair<std::string const,SVGNode *>>((uint64_t)a1, a3, (uint64_t)&v7);
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(a1, v8, v5, v7);
    return v7;
  }
  return result;
}

void std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__construct_node<std::pair<std::string const,SVGNode *>>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  unsigned int v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    *((void *)v6 + 6) = *(void *)(a2 + 16);
  }
  *((void *)v6 + 7) = *(void *)(a2 + 24);
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_210A2AE0C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__find_equal<std::string>(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint8x8_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = v4;
        uint64_t v9 = (uint64_t)(v4 + 4);
        if (!std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v7, a3, (uint64_t)(v4 + 4)))break; {
        uint8x8_t v4 = (void *)*v8;
        }
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v7, v9, a3))break; {
      uint64_t v5 = v8 + 1;
      }
      uint8x8_t v4 = (void *)v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void SVGReader::parseXMLNodeXmlNS(SVGReader *this, _xmlNode *a2, SVGAttributeMap *a3)
{
  if (a2)
  {
    nsDef = a2->nsDef;
    if (nsDef)
    {
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)nsDef->href);
      SVGAttributeMap::setAttribute();
    }
  }
}

void sub_210A2AF28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGNode::addUniqueAttributes(SVGAttributeMap **this, const SVGAttributeMap *a2)
{
}

void SVGAttributeMap::addUniqueAttributes(SVGAttributeMap *this, const SVGAttributeMap *a2)
{
}

void sub_210A2B05C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4084D8EEBALL);
  _Unwind_Resume(a1);
}

xmlChar *SVGReader::parseXMLNodeStyle(SVGReader *this, _xmlNode *cur)
{
  double result = xmlNodeGetContent(cur);
  if (result)
  {
    uint8x8_t v4 = result;
    if (*result)
    {
      uint64_t v5 = (SVGStyle *)*((void *)this + 2);
      if (!v5) {
        operator new();
      }
      SVGStyle::addDefinitionsFromCSS(v5, (SVGParser *)result);
    }
    unsigned int v6 = (uint64_t (*)(xmlChar *))*MEMORY[0x263F8C880];
    return (xmlChar *)v6(v4);
  }
  return result;
}

void sub_210A2B130(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x1020C402C28E7A6);
  _Unwind_Resume(a1);
}

void SVGStyle::SVGStyle(SVGStyle *this)
{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  *((unsigned char *)this + 24) = 0;
}

SVGAtom *CGSVGAtomFromString(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (SVGAtom *)v5;
  SVGUtilities::StringWithCFString(a1, v5);
  if (v6 < 0)
  {
    uint64_t v1 = (SVGAtom *)v5[0];
    if (!v5[0])
    {
      uint64_t v3 = 0;
      goto LABEL_8;
    }
  }
  uint64_t v1 = (SVGAtom *)SVGAtom::ToName(v1, v2);
  if (v6 < 0)
  {
    uint64_t v3 = (void *)v5[0];
LABEL_8:
    operator delete(v3);
  }
  return v1;
}

void sub_210A2B1E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFStringRef CGSVGDocumentGetNamedStyle(uint64_t a1, const char *a2)
{
  CFStringRef v2 = (const __CFString *)a2;
  uint64_t v3 = CFRetained::getObject<SVGDocument>(a1, a2);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (uint64_t)v3;
  SVGUtilities::StringWithCFString(v2, __p);
  uint64_t NamedStyle = SVGDocument::findNamedStyle(v4, (uint64_t)__p);
  uint64_t v6 = NamedStyle;
  if (NamedStyle) {
    CFStringRef v2 = *(const __CFString **)(NamedStyle + 40);
  }
  if (v9 < 0)
  {
    operator delete(__p[0]);
    if (v6) {
      return v2;
    }
    return 0;
  }
  if (!NamedStyle) {
    return 0;
  }
  return v2;
}

void sub_210A2B27C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *CGSVGNodeEnumerate(uint64_t a1, const char *a2)
{
  double result = CFRetained::getObject<SVGNode>(a1, a2);
  if (result)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    v4[2] = __CGSVGNodeEnumerate_block_invoke;
    v4[3] = &unk_264187880;
    v4[4] = a2;
    return (void *)SVGNode::enumerate((uint64_t)result, (uint64_t)v4);
  }
  return result;
}

SVGNode *CGSVGNodeFindChildWithStringIdentifier(uint64_t a1, const __CFString *this)
{
  if (!this) {
    return 0;
  }
  SVGUtilities::StringWithCFString(this, __p);
  if (v7 >= 0) {
    uint64_t v3 = (char *)__p;
  }
  else {
    uint64_t v3 = (char *)__p[0];
  }
  ChildWithCStringIdentifier = CGSVGNodeFindChildWithCStringIdentifier(a1, v3);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return ChildWithCStringIdentifier;
}

void sub_210A2B38C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGUtilities::StringWithCFString(const __CFString *this@<X0>, void *a2@<X8>)
{
  if (!this || (CFTypeID v5 = CFGetTypeID(this), v5 != CFStringGetTypeID()))
  {
    char v7 = (char *)&unk_210A5361E;
    goto LABEL_6;
  }
  CStringPtr = CFStringGetCStringPtr(this, 0x8000100u);
  if (CStringPtr)
  {
    char v7 = (char *)CStringPtr;
LABEL_6:
    std::string::basic_string[abi:ne180100]<0>(a2, v7);
    return;
  }
  std::string::basic_string[abi:ne180100]<0>(a2, (char *)&unk_210A5361E);
  CFIndex Length = CFStringGetLength(this);
  CFIndex v9 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  int v10 = (char *)malloc_type_malloc(v9, 0x515BE0F3uLL);
  if (v10)
  {
    if (CFStringGetCString(this, v10, v9, 0x8000100u)) {
      MEMORY[0x216677A50](a2, v10, v9);
    }
    free(v10);
  }
}

void sub_210A2B4C4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

SVGNode *CGSVGNodeFindChildWithCStringIdentifier(uint64_t a1, char *a2)
{
  double result = (SVGNode *)CFRetained::getObject<SVGNode>(a1, a2);
  if (result)
  {
    double result = (SVGNode *)SVGNode::findChildWithIdentifier(result, a2);
    if (result) {
      return (SVGNode *)*((void *)result + 5);
    }
  }
  return result;
}

uint64_t SVGNode::findChildWithIdentifier(SVGNode *this, char *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = (char *)this + 136;
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  uint64_t v5 = std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__count_unique<std::string>((uint64_t)v4, (uint64_t)__p);
  uint64_t v6 = v5;
  if ((v13 & 0x80000000) == 0)
  {
    if (v5) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  operator delete(__p[0]);
  if (!v6)
  {
LABEL_7:
    CFIndex v9 = (SVGNode **)*((void *)this + 11);
    uint64_t v8 = (SVGNode **)*((void *)this + 12);
    while (v9 != v8)
    {
      uint64_t ChildWithIdentifier = SVGNode::findChildWithIdentifier(*v9, a2);
      if (ChildWithIdentifier) {
        return ChildWithIdentifier;
      }
      ++v9;
    }
    return 0;
  }
LABEL_4:
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  uint64_t v7 = std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::find<std::string>((uint64_t)v4, (uint64_t)__p)[7];
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  return v7;
}

void sub_210A2B5EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__count_unique<std::string>(uint64_t a1, uint64_t a2)
{
  CFStringRef v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = a1 + 16;
    uint64_t v5 = 1;
    do
    {
      if ((std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v4, a2, (uint64_t)(v2 + 4)) & 1) == 0)
      {
        if (!std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v4, (uint64_t)(v2 + 4), a2))return v5; {
        ++v2;
        }
      }
      CFStringRef v2 = (void *)*v2;
    }
    while (v2);
  }
  return 0;
}

void *CGSVGNodeGetChildCount(uint64_t a1, const char *a2)
{
  double result = CFRetained::getObject<SVGNode>(a1, a2);
  if (result) {
    return (void *)((uint64_t)(result[12] - result[11]) >> 3);
  }
  return result;
}

void *CGSVGNodeGetParent(uint64_t a1, const char *a2)
{
  double result = CFRetained::getObject<SVGNode>(a1, a2);
  if (result)
  {
    uint64_t v3 = result[6];
    if (v3) {
      return *(void **)(v3 + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t CGSVGNodeGetType(uint64_t a1, const char *a2)
{
  CFStringRef v2 = (char *)CFRetained::getObject<SVGNode>(a1, a2);
  if (!v2) {
    return 12;
  }
  uint64_t v3 = v2;
  {
    return 2;
  }
  {
    return 0;
  }
  uint64_t v5 = (SVGAtom *)(v3 + 64);
  uint64_t v6 = v3 + 64;
  if (v3[87] < 0) {
    uint64_t v6 = *(const char **)v5;
  }
  uint64_t v7 = (const char *)SVGAtom::ToString(0x1Du);
  if (!strcmp(v6, v7)) {
    return 1;
  }
  uint64_t v8 = v3 + 64;
  if (v3[87] < 0) {
    uint64_t v8 = *(const char **)v5;
  }
  CFIndex v9 = (const char *)SVGAtom::ToString(0x21u);
  if (!strcmp(v8, v9)) {
    return 4;
  }
  int v10 = v3 + 64;
  if (v3[87] < 0) {
    int v10 = *(const char **)v5;
  }
  int v11 = (const char *)SVGAtom::ToString(0x30u);
  if (!strcmp(v10, v11)) {
    return 5;
  }
  int64_t v12 = v3 + 64;
  if (v3[87] < 0) {
    int64_t v12 = *(const char **)v5;
  }
  char v13 = (const char *)SVGAtom::ToString(5u);
  if (!strcmp(v12, v13)) {
    return 6;
  }
  int v14 = v3 + 64;
  if (v3[87] < 0) {
    int v14 = *(const char **)v5;
  }
  unint64_t v15 = (const char *)SVGAtom::ToString(0x4Au);
  if (!strcmp(v14, v15)) {
    return 7;
  }
  uint64_t v16 = v3 + 64;
  if (v3[87] < 0) {
    uint64_t v16 = *(const char **)v5;
  }
  uint64_t v17 = (const char *)SVGAtom::ToString(0x4Du);
  if (!strcmp(v16, v17)) {
    return 9;
  }
  std::string v18 = v3 + 64;
  if (v3[87] < 0) {
    std::string v18 = *(const char **)v5;
  }
  uint64_t v19 = (const char *)SVGAtom::ToString(0x4Fu);
  if (!strcmp(v18, v19)) {
    return 8;
  }
  uint64_t v20 = v3 + 64;
  if (v3[87] < 0) {
    uint64_t v20 = *(const char **)v5;
  }
  unsigned int v21 = (const char *)SVGAtom::ToString(0x54u);
  if (!strcmp(v20, v21)) {
    return 10;
  }
  if (v3[87] < 0) {
    uint64_t v5 = *(SVGAtom **)v5;
  }
  int v23 = SVGAtom::ToName(v5, v22);
  if (SVGFilter::IsValidFilterPrimitive(v23)) {
    return 11;
  }
  else {
    return 3;
  }
}

void *CGSVGNodeGetAttributeMap(uint64_t a1, const char *a2)
{
  double result = CFRetained::getObject<SVGNode>(a1, a2);
  if (result) {
    return *(void **)(result[7] + 40);
  }
  return result;
}

uint64_t CGSVGNodeFindAttribute(uint64_t a1, const char *a2)
{
  unsigned int v2 = a2;
  uint64_t result = (uint64_t)CFRetained::getObject<SVGNode>(a1, a2);
  if (result)
  {
    uint64_t result = SVGNode::findAttribute(result, v2);
    if (result) {
      return *(void *)(result + 40);
    }
  }
  return result;
}

void *CGSVGNodeGetChildAtIndex(uint64_t a1, const char *a2)
{
  uint64_t result = CFRetained::getObject<SVGNode>(a1, a2);
  if (result)
  {
    uint64_t v4 = result[11];
    if ((unint64_t)a2 >= (result[12] - v4) >> 3) {
      return 0;
    }
    else {
      return *(void **)(*(void *)(v4 + 8 * (void)a2) + 40);
    }
  }
  return result;
}

void *CFRetained::getObject<SVGNode>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  unsigned int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

uint64_t SVGNode::findAttribute(uint64_t a1, unsigned int a2)
{
  do
  {
    uint64_t result = SVGAttributeMap::attribute(*(void *)(a1 + 56), a2);
    if (result) {
      break;
    }
    a1 = *(void *)(a1 + 48);
  }
  while (a1);
  return result;
}

uint64_t std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v10 = *(std::string *)a2;
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v9 = *(std::string *)a3;
  }
  char v4 = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v5 = &v10;
  }
  else {
    uint64_t v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v8 = (void *)v9.__r_.__value_.__r.__words[0];
    unsigned int v6 = strcasecmp((const char *)v5, v9.__r_.__value_.__l.__data_);
    operator delete(v8);
    if ((*((unsigned char *)&v10.__r_.__value_.__s + 23) & 0x80) == 0) {
      return v6 >> 31;
    }
    goto LABEL_12;
  }
  unsigned int v6 = strcasecmp((const char *)v5, (const char *)&v9);
  if (v4 < 0) {
LABEL_12:
  }
    operator delete(v10.__r_.__value_.__l.__data_);
  return v6 >> 31;
}

{
  char v4;
  std::string *v5;
  unsigned int v6;
  void *v8;
  std::string v9;
  std::string v10;

  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v10 = *(std::string *)a2;
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v9 = *(std::string *)a3;
  }
  char v4 = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v5 = &v10;
  }
  else {
    uint64_t v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v8 = (void *)v9.__r_.__value_.__r.__words[0];
    unsigned int v6 = strcasecmp((const char *)v5, v9.__r_.__value_.__l.__data_);
    operator delete(v8);
    if ((*((unsigned char *)&v10.__r_.__value_.__s + 23) & 0x80) == 0) {
      return v6 >> 31;
    }
    goto LABEL_12;
  }
  unsigned int v6 = strcasecmp((const char *)v5, (const char *)&v9);
  if (v4 < 0) {
LABEL_12:
  }
    operator delete(v10.__r_.__value_.__l.__data_);
  return v6 >> 31;
}

void sub_210A2BB80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGNode::enumerate(uint64_t a1, uint64_t a2)
{
  char v3 = 0;
  return EnumerateNode(a1, a2, &v3);
}

uint64_t EnumerateNode(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned char *))(a2 + 16))(a2, a1, 0, a3);
  uint64_t v7 = *(uint64_t **)(a1 + 88);
  uint64_t v8 = *(uint64_t **)(a1 + 96);
  while (v7 != v8)
  {
    if (*a3) {
      return result;
    }
    uint64_t v9 = *v7++;
    uint64_t result = EnumerateNode(v9, a2, a3);
  }
  if (!*a3)
  {
    std::string v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned char *))(a2 + 16);
    return v10(a2, a1, 1, a3);
  }
  return result;
}

uint64_t __CGSVGNodeEnumerate_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

double CGSVGDocumentGetCanvasSize(uint64_t a1, const char *a2)
{
  unsigned int v2 = (SVGDocument *)CFRetained::getObject<SVGDocument>(a1, a2);
  if (!v2) {
    return *MEMORY[0x263F001B0];
  }
  *(void *)&double result = SVGDocument::canvasSize(v2).u64[0];
  return result;
}

void *CGSVGDocumentGetRootNode(uint64_t a1, const char *a2)
{
  double result = CFRetained::getObject<SVGDocument>(a1, a2);
  if (result)
  {
    uint64_t v3 = result[6];
    if (v3) {
      return *(void **)(v3 + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *CFRetained::getObject<SVGDocument>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  unsigned int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

void CGSVGDocumentCreateFromData()
{
}

void sub_210A2BE38(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4079506790);
  _Unwind_Resume(a1);
}

void SVGDocument::validateSizes(SVGNode **this)
{
  double v2 = *(double *)SVGDocument::canvasSize((SVGDocument *)this).i64;
  char v4 = this[6];
  *((_OWORD *)v4 + 13) = *MEMORY[0x263F00148];
  if (v2 < 1.0 || v3 < 1.0)
  {
    BoundingBodouble x = SVGNode::getBoundingBox(v4, 0, 2);
    if (BoundingBox < 0.0) {
      BoundingBodouble x = 0.0;
    }
    std::string v10 = this[6];
    if (v7 < 0.0) {
      double v7 = 0.0;
    }
    *((double *)v10 + 30) = BoundingBox;
    *((double *)v10 + 31) = v7;
    *((void *)v10 + 32) = v8;
    *((void *)v10 + 33) = v9;
  }
}

int8x16_t SVGDocument::canvasSize(SVGDocument *this)
{
  uint64_t v1 = (float64x2_t *)*((void *)this + 6);
  if (v1)
  {
    __asm { FMOV            V2.2D, #1.0 }
    return vbslq_s8(vandq_s8((int8x16_t)vcgtq_f64(v1[16], _Q2), (int8x16_t)vcgtq_f64(_Q2, v1[14])), (int8x16_t)v1[16], (int8x16_t)v1[14]);
  }
  else
  {
    return *(int8x16_t *)MEMORY[0x263F001B0];
  }
}

void SVGDocument::SVGDocument(SVGDocument *this)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGDocument::kSVGDocumentClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A080;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  operator new();
}

void sub_210A2BFAC(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  MEMORY[0x216677AD0](v3, 0x10F3C40B1BF57FCLL);
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

uint64_t CreateReadOptions(const __CFDictionary *a1)
{
  if (a1 && CFDictionaryGetCount(a1) >= 1) {
    operator new();
  }
  return 0;
}

void sub_210A2C208(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4084D8EEBALL);
  _Unwind_Resume(a1);
}

uint64_t SVGStyle::findNamedStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::find<std::string>(a1, a2);
  if ((void *)(a1 + 8) == v3) {
    return 0;
  }
  else {
    return v3[7];
  }
}

uint64_t SVGDocument::findNamedStyle(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return SVGStyle::findNamedStyle(result, a2);
  }
  return result;
}

SVGAttributeMap *CGSVGAttributeMapGetCount(uint64_t a1, const char *a2)
{
  uint64_t result = (SVGAttributeMap *)CFRetained::getObject<SVGAttributeMap>(a1, a2);
  if (result)
  {
    return (SVGAttributeMap *)SVGAttributeMap::count(result);
  }
  return result;
}

SVGShapeNode *CGSVGShapeNodeGetFloatCount(uint64_t a1, const char *a2)
{
  uint64_t result = (SVGShapeNode *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (result)
  {
    uint64_t result = (SVGShapeNode *)SVGShapeNode::pointList(result);
    if (result) {
      return (SVGShapeNode *)((uint64_t)(*((void *)result + 1) - *(void *)result) >> 3);
    }
  }
  return result;
}

os_unfair_lock_s *CGSVGAttributeGetAtom(uint64_t a1, char *a2)
{
  uint64_t result = (os_unfair_lock_s *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    uint32_t v4 = 0;
    uint64_t result = (os_unfair_lock_s *)SVGAttribute::nameValue(result, &v4);
    if (result)
    {
      *(_DWORD *)a2 = v4;
      return (os_unfair_lock_s *)1;
    }
  }
  return result;
}

BOOL SVGAttribute::nameValue(os_unfair_lock_s *a1, uint32_t *a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v7, a1 + 27);
  BOOL v5 = SVGAttribute::resolveAsName((SVGAttribute *)a1, v4);
  if (v5) {
    *a2 = a1[22]._os_unfair_lock_opaque;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v7);
  return v5;
}

void sub_210A2C38C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

BOOL SVGAttribute::resolveAsName(SVGAttribute *this, const char *a2)
{
  int v2 = *((_DWORD *)this + 20);
  if (v2 != 2)
  {
    if (*((char *)this + 79) < 0)
    {
      if (*((void *)this + 8))
      {
        *((_DWORD *)this + 20) = 2;
        uint32_t v4 = (SVGAtom *)*((void *)this + 7);
        goto LABEL_7;
      }
    }
    else if (*((unsigned char *)this + 79))
    {
      uint32_t v4 = (SVGAttribute *)((char *)this + 56);
      *((_DWORD *)this + 20) = 2;
LABEL_7:
      *((_DWORD *)this + 22) = SVGAtom::ToName(v4, a2);
      int v2 = *((_DWORD *)this + 20);
    }
  }
  return v2 == 2;
}

SVGShapeNode *CGSVGShapeNodeGetFloats(uint64_t a1, char *a2)
{
  uint64_t result = (SVGShapeNode *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (result)
  {
    uint64_t result = (SVGShapeNode *)SVGShapeNode::pointList(result);
    if (result)
    {
      uint32_t v4 = *(const void **)result;
      size_t v5 = *((void *)result + 1) - *(void *)result;
      return (SVGShapeNode *)memcpy(a2, v4, v5);
    }
  }
  return result;
}

SVGShapeNode *CGSVGShapeNodeGetPath(uint64_t a1, const char *a2)
{
  uint64_t result = (SVGShapeNode *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (result)
  {
    uint64_t result = SVGShapeNode::path(result);
    if (result) {
      return (SVGShapeNode *)*((void *)result + 5);
    }
  }
  return result;
}

unsigned int *CGSVGShapeNodeGetPrimitive(uint64_t a1, const char *a2)
{
  uint64_t result = (unsigned int *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (result) {
    return (unsigned int *)result[74];
  }
  return result;
}

void *CFRetained::getObject<SVGShapeNode>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

SVGPath *SVGShapeNode::path(SVGShapeNode *this)
{
  uint64_t result = (SVGPath *)SVGAttributeMap::attribute(*((void *)this + 7), 0xBu);
  int v2 = 0;
  if (result)
  {
    if (SVGAttribute::pathValue((os_unfair_lock_s *)result, &v2)) {
      return v2;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t SVGAttribute::pathValue(os_unfair_lock_s *this, SVGPath **a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v7, this + 27);
  uint64_t v5 = SVGAttribute::resolveAsPath((SVGAttribute *)this, v4);
  if (v5) {
    *a2 = *(SVGPath **)&this[22]._os_unfair_lock_opaque;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v7);
  return v5;
}

void sub_210A2C5DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::resolveAsPath(SVGAttribute *this, const char *a2)
{
  if (*((_DWORD *)this + 20) != 4)
  {
    uint64_t v3 = (SVGAttribute *)((char *)this + 56);
    if (*((char *)this + 79) < 0) {
      uint64_t v3 = *(SVGParser **)v3;
    }
    SVGParser::ParseCommandList(v3, a2);
  }
  return 1;
}

uint64_t SVGAttribute::rectValue(os_unfair_lock_s *this, CGRect *a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v8, this + 27);
  if (SVGAttribute::resolveAsFloats((SVGAttribute *)this)
    && (uint64_t v4 = **(void **)&this[22]._os_unfair_lock_opaque,
        (unint64_t)(*(void *)(*(void *)&this[22]._os_unfair_lock_opaque + 8) - v4) >= 0x19))
  {
    CGSize v5 = *(CGSize *)(v4 + 16);
    a2->origin = *(CGPoint *)v4;
    a2->std::string::size_type size = v5;
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v8);
  return v6;
}

void sub_210A2C6CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::transformValue(os_unfair_lock_s *this, CGAffineTransform *a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v9, this + 27);
  if (SVGAttribute::resolveAsFloats((SVGAttribute *)this)
    && (uint64_t v4 = **(_OWORD ***)&this[22]._os_unfair_lock_opaque,
        *(void *)(*(void *)&this[22]._os_unfair_lock_opaque + 8) - (void)v4 == 48))
  {
    long long v5 = v4[1];
    long long v6 = v4[2];
    *(_OWORD *)&a2->a = *v4;
    *(_OWORD *)&a2->c = v5;
    *(_OWORD *)&a2->tdouble x = v6;
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v9);
  return v7;
}

void sub_210A2C760(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

void SVGScopedUnfairLock::~SVGScopedUnfairLock(os_unfair_lock_t *this)
{
}

void SVGScopedUnfairLock::SVGScopedUnfairLock(SVGScopedUnfairLock *this, os_unfair_lock_t lock)
{
  *(void *)this = lock;
  os_unfair_lock_lock(lock);
}

uint64_t SVGAttribute::resolveAsFloats(SVGAttribute *this)
{
  if (*((_DWORD *)this + 20) != 1) {
    operator new();
  }
  return 1;
}

uint64_t SVGParser::ParseTransforms(SVGParser *this, char *a2, CGAffineTransform *a3, char **a4)
{
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v18[8] = *MEMORY[0x263F000D0];
  *(_OWORD *)&v18[24] = v4;
  *(_OWORD *)&v18[40] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(void *)std::string v18 = 0;
  if (!*(unsigned char *)this) {
    return 0;
  }
  long long v6 = this;
  uint64_t v7 = 0;
  do
  {
    if ((SVGParser::ParseTransformMatrix(v6, (char *)&v17, (CGAffineTransform *)v18, a4) & 1) != 0
      || (SVGParser::ParseTransformTranslate(v6, (char *)&v17, (CGAffineTransform *)v18, v8) & 1) != 0
      || (SVGParser::ParseTransformScale(v6, (char *)&v17, (CGAffineTransform *)v18, v9) & 1) != 0
      || (SVGParser::ParseTransformRotate(v6, (char *)&v17, (CGAffineTransform *)v18, v10) & 1) != 0
      || SVGParser::ParseTransformSkewX(v6, &v17.a, (CGAffineTransform *)v18, v11)
      || SVGParser::ParseTransformSkewY(v6, &v17.a, (CGAffineTransform *)v18, v12))
    {
      ++v7;
      CGAffineTransform t1 = v17;
      CGAffineTransform v15 = *(CGAffineTransform *)&v18[8];
      CGAffineTransformConcat((CGAffineTransform *)&v18[8], &t1, &v15);
      long long v6 = *(SVGParser **)v18;
    }
    else
    {
      long long v6 = (SVGParser *)((char *)v6 + 1);
    }
  }
  while (*(unsigned char *)v6);
  if (!v7) {
    return 0;
  }
  long long v13 = *(_OWORD *)&v18[24];
  *(_OWORD *)a2 = *(_OWORD *)&v18[8];
  *((_OWORD *)a2 + 1) = v13;
  *((_OWORD *)a2 + 2) = *(_OWORD *)&v18[40];
  return 1;
}

uint64_t SVGParser::ParseTransformMatrix(SVGParser *this, char *a2, CGAffineTransform *a3, char **a4)
{
  std::string __p = 0;
  long long v13 = 0;
  uint64_t v14 = 0;
  BOOL v5 = ParseTransformPrefix((uint64_t)this, "matrix", a3, (uint64_t)&__p);
  long long v6 = __p;
  if (v5 && (unint64_t)(v13 - (unsigned char *)__p) >= 0x30)
  {
    long long v9 = *((_OWORD *)__p + 1);
    long long v10 = *((_OWORD *)__p + 2);
    *(_OWORD *)a2 = *(_OWORD *)__p;
    *((_OWORD *)a2 + 1) = v9;
    *((_OWORD *)a2 + 2) = v10;
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    if (!__p) {
      return v8;
    }
  }
  long long v13 = v6;
  operator delete(v6);
  return v7;
}

void sub_210A2D05C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL ParseTransformPrefix(uint64_t a1, char *__s, void *a3, uint64_t a4)
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = (char *)(a1 - 1);
  uint64_t v8 = MEMORY[0x263EF8318];
  do
  {
    unsigned int v9 = v7[1];
    if ((v9 & 0x80000000) != 0) {
      int v10 = __maskrune(v9, 0x4000uLL);
    }
    else {
      int v10 = *(_DWORD *)(v8 + 4 * v9 + 60) & 0x4000;
    }
    ++v7;
  }
  while (v10);
  size_t v11 = strlen(__s);
  if (strncasecmp(v7, __s, v11)) {
    return 0;
  }
  while (1)
  {
    uint64_t v13 = *v7;
    if ((*v7 & 0x80000000) == 0 && (*(_DWORD *)(v8 + 4 * v13 + 60) & 0x400) != 0) {
      break;
    }
    BOOL v14 = v13 > 0x2E;
    uint64_t v15 = (1 << v13) & 0x680000000001;
    if (!v14 && v15 != 0) {
      break;
    }
    ++v7;
  }
  return SVGParser::ParseCGFloatList(v7, a3, a4);
}

uint64_t SVGParser::ParseTransformTranslate(SVGParser *this, char *a2, CGAffineTransform *a3, char **a4)
{
  uint64_t v13 = 0;
  BOOL v14 = 0;
  uint64_t v15 = 0;
  BOOL v5 = ParseTransformPrefix((uint64_t)this, "translate", a3, (uint64_t)&v13);
  long long v6 = v13;
  if (v5)
  {
    uint64_t v7 = v14 - v13;
    if (v7)
    {
      if (v7 == 1) {
        CGFloat v8 = 0.0;
      }
      else {
        CGFloat v8 = v13[1];
      }
      CGAffineTransformMakeTranslation(&v12, *v13, v8);
      long long v11 = *(_OWORD *)&v12.c;
      *(_OWORD *)a2 = *(_OWORD *)&v12.a;
      *((_OWORD *)a2 + 1) = v11;
      *((_OWORD *)a2 + 2) = *(_OWORD *)&v12.tx;
      uint64_t v9 = 1;
      goto LABEL_9;
    }
  }
  uint64_t v9 = 0;
  uint64_t result = 0;
  if (v13)
  {
LABEL_9:
    BOOL v14 = v6;
    operator delete(v6);
    return v9;
  }
  return result;
}

void sub_210A2D22C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)(v1 - 40);
  if (v3)
  {
    *(void *)(v1 - 32) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGParser::ParseTransformRotate(SVGParser *this, char *a2, CGAffineTransform *a3, char **a4)
{
  int v23 = 0;
  uint64x2_t v24 = 0;
  uint64_t v25 = 0;
  BOOL v5 = ParseTransformPrefix((uint64_t)this, "rotate", a3, (uint64_t)&v23);
  long long v6 = v23;
  if (v5)
  {
    uint64_t v7 = v24 - v23;
    if (v7)
    {
      if (v7 == 1)
      {
        CGAffineTransformMakeRotation(&v22, *v23 / 180.0 * 3.14159265);
        long long v10 = *(_OWORD *)&v22.c;
        *(_OWORD *)a2 = *(_OWORD *)&v22.a;
        *((_OWORD *)a2 + 1) = v10;
        long long v11 = *(_OWORD *)&v22.tx;
      }
      else
      {
        if (v7 == 2) {
          goto LABEL_5;
        }
        memset(&v22, 0, sizeof(v22));
        double v12 = v23[1];
        double v13 = v23[2];
        CGAffineTransformMakeTranslation(&v22, -v12, -v13);
        memset(&v21, 0, sizeof(v21));
        CGAffineTransformMakeRotation(&v21, *v6 / 180.0 * 3.14159265);
        memset(&v20, 0, sizeof(v20));
        CGAffineTransformMakeTranslation(&v20, v12, v13);
        CGAffineTransform t1 = v22;
        CGAffineTransform t2 = v21;
        CGAffineTransformConcat(&v18, &t1, &t2);
        CGAffineTransform v15 = v20;
        CGAffineTransformConcat(&v19, &v18, &v15);
        long long v14 = *(_OWORD *)&v19.c;
        *(_OWORD *)a2 = *(_OWORD *)&v19.a;
        *((_OWORD *)a2 + 1) = v14;
        long long v11 = *(_OWORD *)&v19.tx;
      }
      *((_OWORD *)a2 + 2) = v11;
      uint64_t v8 = 1;
      goto LABEL_10;
    }
  }
LABEL_5:
  uint64_t v8 = 0;
  uint64_t result = 0;
  if (v23)
  {
LABEL_10:
    uint64x2_t v24 = v6;
    operator delete(v6);
    return v8;
  }
  return result;
}

void sub_210A2D3E4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)(v1 - 72);
  if (v3)
  {
    *(void *)(v1 - 64) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

BOOL SVGParser::ParseTransformSkewY(SVGParser *this, double *a2, CGAffineTransform *a3, char **a4)
{
  long long v10 = 0;
  long long v11 = 0;
  uint64_t v12 = 0;
  BOOL v5 = ParseTransformPrefix((uint64_t)this, "skewY", a3, (uint64_t)&v10);
  long long v6 = v10;
  BOOL v7 = v11 != v10 && v5;
  if (v7)
  {
    long double v8 = tan(*v10 / 180.0 * 3.14159265);
    *a2 = 1.0;
    a2[1] = v8;
    *((_OWORD *)a2 + 1) = xmmword_210A52F40;
    a2[4] = 0.0;
    a2[5] = 0.0;
  }
  else if (!v10)
  {
    return 0;
  }
  long long v11 = v6;
  operator delete(v6);
  return v7;
}

void sub_210A2D4B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL SVGParser::ParseTransformSkewX(SVGParser *this, double *a2, CGAffineTransform *a3, char **a4)
{
  long long v10 = 0;
  long long v11 = 0;
  uint64_t v12 = 0;
  BOOL v5 = ParseTransformPrefix((uint64_t)this, "skewX", a3, (uint64_t)&v10);
  long long v6 = v10;
  BOOL v7 = v11 != v10 && v5;
  if (v7)
  {
    long double v8 = tan(*v10 / 180.0 * 3.14159265);
    *(_OWORD *)a2 = xmmword_210A52E10;
    a2[2] = v8;
    a2[4] = 0.0;
    a2[5] = 0.0;
    a2[3] = 1.0;
  }
  else if (!v10)
  {
    return 0;
  }
  long long v11 = v6;
  operator delete(v6);
  return v7;
}

void sub_210A2D584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGParser::ParseTransformScale(SVGParser *this, char *a2, CGAffineTransform *a3, char **a4)
{
  double v13 = 0;
  long long v14 = 0;
  uint64_t v15 = 0;
  BOOL v5 = ParseTransformPrefix((uint64_t)this, "scale", a3, (uint64_t)&v13);
  long long v6 = v13;
  if (v5)
  {
    uint64_t v7 = v14 - v13;
    if (v7)
    {
      if (v7 == 1) {
        CGFloat v8 = *v13;
      }
      else {
        CGFloat v8 = v13[1];
      }
      CGAffineTransformMakeScale(&v12, *v13, v8);
      long long v11 = *(_OWORD *)&v12.c;
      *(_OWORD *)a2 = *(_OWORD *)&v12.a;
      *((_OWORD *)a2 + 1) = v11;
      *((_OWORD *)a2 + 2) = *(_OWORD *)&v12.tx;
      uint64_t v9 = 1;
      goto LABEL_9;
    }
  }
  uint64_t v9 = 0;
  uint64_t result = 0;
  if (v13)
  {
LABEL_9:
    long long v14 = v6;
    operator delete(v6);
    return v9;
  }
  return result;
}

void sub_210A2D654(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)(v1 - 40);
  if (v3)
  {
    *(void *)(v1 - 32) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGShapeNode::pointList(SVGShapeNode *this)
{
  uint64_t v2 = SVGAttributeMap::attribute(*((void *)this + 7), 0x2Bu);
  uint64_t v7 = 0;
  if (v2)
  {
    if (SVGAttribute::pointsValue(v2, &v7)) {
      return v7;
    }
    else {
      return 0;
    }
  }
  else
  {
    if ((*((_DWORD *)this + 74) & 0xFFFFFFFE) == 0x2C)
    {
      std::string __p = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      operator new();
    }
    return 0;
  }
}

void sub_210A2D72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  MEMORY[0x216677AD0](v10, 0x10B3C405B4D0908);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::pointsValue(uint64_t a1, void *a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v7, (os_unfair_lock_t)(a1 + 108));
  uint64_t v4 = *(void *)(a1 + 96);
  if (v4)
  {
    *a2 = v4;
    uint64_t v5 = 1;
  }
  else
  {
    if (SVGAttribute::resolveAsFloats((SVGAttribute *)a1)
      && *(void *)(*(void *)(a1 + 88) + 8) - **(void **)(a1 + 88) >= 9uLL)
    {
      operator new();
    }
    uint64_t v5 = 0;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v7);
  return v5;
}

void sub_210A2DA28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void *CGSVGAttributeMapEnumerate(uint64_t a1, const char *a2)
{
  uint64_t result = CFRetained::getObject<SVGAttributeMap>(a1, a2);
  if (result)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    v4[2] = __CGSVGAttributeMapEnumerate_block_invoke;
    v4[3] = &unk_2641878D0;
    v4[4] = a2;
    return (void *)SVGAttributeMap::enumerate((uint64_t)result, (uint64_t)v4);
  }
  return result;
}

uint64_t CGSVGAttributeMapGetAttribute(uint64_t a1, const char *a2)
{
  unsigned int v2 = a2;
  uint64_t result = (uint64_t)CFRetained::getObject<SVGAttributeMap>(a1, a2);
  if (result)
  {
    uint64_t result = SVGAttributeMap::attribute(result, v2);
    if (result) {
      return *(void *)(result + 40);
    }
  }
  return result;
}

void *CFRetained::getObject<SVGAttributeMap>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  unsigned int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

void SVGReader::resolveDefinitions(SVGNode **this, SVGNode *a2)
{
  SVGReader::ResolveAttributeDefinition((uint64_t)this, (uint64_t)a2, 18);
  SVGReader::ResolveAttributeDefinition((uint64_t)this, (uint64_t)a2, 57);
  SVGReader::ResolveAttributeDefinition((uint64_t)this, (uint64_t)a2, 6);
  SVGReader::ResolveAttributeDefinition((uint64_t)this, (uint64_t)a2, 74);
  SVGReader::ResolveAttributeDefinition((uint64_t)this, (uint64_t)a2, 84);
  SVGReader::resolveUseDefinition(this, a2);
  uint64_t v5 = (SVGNode **)*((void *)a2 + 11);
  uint64_t v6 = (SVGNode **)*((void *)a2 + 12);
  while (v5 != v6)
  {
    os_unfair_lock_t v7 = *v5++;
    SVGReader::resolveDefinitions((SVGReader *)this, v7);
  }
  CGFloat v8 = (char *)*((void *)a2 + 20);
  uint64_t v9 = (char *)a2 + 168;
  if (v8 != (char *)a2 + 168)
  {
    do
    {
      uint64_t v10 = *((void *)v8 + 7);
      ResolvePatternHrefDefinition(v10, v4);
      CGAffineTransform v12 = *(SVGNode ***)(v10 + 88);
      long long v11 = *(SVGNode ***)(v10 + 96);
      while (v12 != v11)
      {
        double v13 = *v12++;
        SVGReader::resolveDefinitions((SVGReader *)this, v13);
      }
      long long v14 = (char *)*((void *)v8 + 1);
      if (v14)
      {
        do
        {
          uint64_t v15 = v14;
          long long v14 = *(char **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          uint64_t v15 = (char *)*((void *)v8 + 2);
          BOOL v16 = *(void *)v15 == (void)v8;
          CGFloat v8 = v15;
        }
        while (!v16);
      }
      CGFloat v8 = v15;
    }
    while (v15 != v9);
  }
}

void SVGReader::ResolveAttributeDefinition(uint64_t a1, uint64_t a2, signed int a3)
{
  uint64_t v6 = (SVGAttribute *)SVGAttributeMap::attribute(*(void *)(a2 + 56), a3);
  if (v6)
  {
    uint64_t v8 = (uint64_t)v6;
    if (!*((_DWORD *)v6 + 20) && SVGAttribute::stringValueBeginsWith(v6, "url", v7))
    {
      std::string __p = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      if (!SVGAttribute::urlValue(v8, (uint64_t)&__p)) {
        goto LABEL_34;
      }
      if (SHIBYTE(v20) < 0)
      {
        if (!v19) {
          goto LABEL_34;
        }
        p_p = (char *)__p;
      }
      else
      {
        if (!HIBYTE(v20)) {
          goto LABEL_34;
        }
        p_p = (char *)&__p;
      }
      DefinitionNode = (char *)SVGNode::findDefinitionNode(*(SVGNode **)(a1 + 8), p_p);
      if (DefinitionNode)
      {
        if (SVGNode::isChildOf(a2, (uint64_t)DefinitionNode))
        {
          long long v11 = (void *)(a2 + 64);
          if (*(char *)(a2 + 87) < 0) {
            long long v11 = (void *)*v11;
          }
          CGAffineTransform v12 = SVGNode::identifier((SVGNode *)a2);
          double v13 = DefinitionNode + 64;
          if (DefinitionNode[87] < 0) {
            double v13 = (void *)*v13;
          }
          long long v14 = SVGNode::identifier((SVGNode *)DefinitionNode);
          SVGUtilities::log((SVGUtilities *)"Error: Cyclical dependency found when trying to resolve node: %s(%s) attributes with %s(%s)", v15, v11, v12, v13, v14);
          goto LABEL_34;
        }
        if (a3 <= 56)
        {
          if (a3 == 6)
          {
            {
              operator new();
            }
            goto LABEL_34;
          }
          if (a3 != 18) {
            goto LABEL_34;
          }
        }
        else
        {
          if (a3 == 84)
          {
            {
              operator new();
            }
            goto LABEL_34;
          }
          if (a3 == 74)
          {
            {
              operator new();
            }
            goto LABEL_34;
          }
          if (a3 != 57) {
            goto LABEL_34;
          }
        }
        {
          ResolveGradientHrefDefinition((uint64_t)DefinitionNode, v16);
          operator new();
        }
        {
          ResolvePatternHrefDefinition((uint64_t)DefinitionNode, v17);
          operator new();
        }
      }
LABEL_34:
      if (SHIBYTE(v20) < 0) {
        operator delete(__p);
      }
    }
  }
}

void sub_210A2E08C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  MEMORY[0x216677AD0](v19, 0x10B3C405B4D0908);
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t SVGAttributeMap::attribute(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v2 = a1 + 56;
  uint64_t v3 = v4;
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v2;
  do
  {
    unsigned int v6 = *(_DWORD *)(v3 + 32);
    BOOL v7 = v6 >= a2;
    if (v6 >= a2) {
      uint64_t v8 = (uint64_t *)v3;
    }
    else {
      uint64_t v8 = (uint64_t *)(v3 + 8);
    }
    if (v7) {
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v5 != v2 && *(_DWORD *)(v5 + 32) <= a2) {
    return *(void *)(v5 + 40);
  }
  else {
    return 0;
  }
}

void SVGReader::resolveUseDefinition(SVGNode **this, SVGNode *a2)
{
  uint64_t v4 = (SVGNode *)((char *)a2 + 64);
  if (*((char *)a2 + 87) < 0) {
    uint64_t v4 = *(SVGAtom **)v4;
  }
  if (SVGAtom::ToName(v4, (const char *)a2) == 20001)
  {
    uint64_t v5 = (char *)*((void *)a2 + 25);
    if (v5 && v5[23] < 0) {
      uint64_t v5 = *(char **)v5;
    }
    uint64_t ChildWithIdentifier = (SVGNode *)SVGNode::findChildWithIdentifier(this[1], v5);
    if (ChildWithIdentifier) {
      goto LABEL_12;
    }
    BOOL v7 = (char *)*((void *)a2 + 25);
    if (v7 && v7[23] < 0) {
      BOOL v7 = *(char **)v7;
    }
    uint64_t ChildWithIdentifier = SVGNode::findDefinitionNode(a2, v7);
    if (ChildWithIdentifier)
    {
LABEL_12:
      if (!SVGNode::isChildOf((uint64_t)a2, (uint64_t)ChildWithIdentifier))
      {
        CGAffineTransform v12 = (uint64_t *)(*(uint64_t (**)(SVGNode *))(*(void *)ChildWithIdentifier + 16))(ChildWithIdentifier);
        double v13 = (SVGStyle *)*((void *)a2 + 7);
        uint64_t v14 = *((void *)ChildWithIdentifier + 7);
        SVGReader::ApplyStyleToAttributes((SVGReader *)v12, this[2], v13, v15);
        int64x2_t v28 = vdupq_n_s64(0x7FF8000000000000uLL);
        int64x2_t v29 = v28;
        v33.__r_.__value_.__r.__words[0] = 0;
        v33.__r_.__value_.__l.__size_ = (std::string::size_type)&v33;
        v33.__r_.__value_.__r.__words[2] = 0x2000000000;
        char v34 = 0;
        *(void *)&v30.origin.double x = MEMORY[0x263EF8330];
        *(void *)&v30.origin.double y = 0x40000000;
        *(void *)&v30.size.width = ___ZL28ConvertUseElementCoordinatesP15SVGAttributeMapR6CGRect_block_invoke;
        *(void *)&v30.size.height = &unk_2641877C0;
        double v31 = &v33;
        double v32 = &v28;
        SVGAttributeMap::enumerate((uint64_t)v13, (uint64_t)&v30);
        if (*(unsigned char *)(v33.__r_.__value_.__l.__size_ + 24))
        {
          SVGAttributeMap::removeAttribute((uint64_t)v13, 0x43u);
          SVGAttributeMap::removeAttribute((uint64_t)v13, 0x46u);
          SVGAttributeMap::removeAttribute((uint64_t)v13, 0x42u);
          SVGAttributeMap::removeAttribute((uint64_t)v13, 0x1Eu);
          int v16 = *(unsigned __int8 *)(v33.__r_.__value_.__l.__size_ + 24);
          _Block_object_dispose(&v33, 8);
          if (v16)
          {
            CGAffineTransform v17 = (os_unfair_lock_s *)SVGAttributeMap::attribute(v14, 0x41u);
            if (!v17 || (SVGAttribute::rectValue(v17, &v30) & 1) == 0)
            {
              v30.origin.double x = (*(double (**)(SVGNode *, void))(*(void *)ChildWithIdentifier + 32))(ChildWithIdentifier, 0);
              v30.origin.double y = v18;
              v30.size.width = v19;
              v30.size.height = v20;
            }
            memset(&v33, 0, sizeof(v33));
            SVGParser::FormatString((SVGParser *)"translate(%g,%g)", &__p, *(_OWORD *)&v28);
            if ((v27 & 0x80u) == 0) {
              p_p = (const std::string::value_type *)&__p;
            }
            else {
              p_p = (const std::string::value_type *)__p;
            }
            if ((v27 & 0x80u) == 0) {
              std::string::size_type v22 = v27;
            }
            else {
              std::string::size_type v22 = v26;
            }
            std::string::append(&v33, p_p, v22);
            if ((char)v27 < 0) {
              operator delete(__p);
            }
            if (v30.size.width > 0.0 && v30.size.height > 0.0)
            {
              SVGParser::FormatString((SVGParser *)"scale(%g,%g)", &__p, *(double *)v29.i64 / v30.size.width, *(double *)&v29.i64[1] / v30.size.height);
              int v23 = (v27 & 0x80u) == 0 ? (const std::string::value_type *)&__p : (const std::string::value_type *)__p;
              std::string::size_type v24 = (v27 & 0x80u) == 0 ? v27 : v26;
              std::string::append(&v33, v23, v24);
              if ((char)v27 < 0) {
                operator delete(__p);
              }
            }
            operator new();
          }
        }
        else
        {
          _Block_object_dispose(&v33, 8);
        }
        SVGAttributeMap::removeAttribute((uint64_t)v13, 0x4E20u);
        SVGAttributeMap::removeAttribute(v12[7], 0x1Fu);
        SVGNode::addUniqueAttributes((SVGAttributeMap **)v12, v13);
      }
      uint64_t v8 = SVGNode::identifier(a2);
      uint64_t v9 = (void *)((char *)ChildWithIdentifier + 64);
      if (*((char *)ChildWithIdentifier + 87) < 0) {
        uint64_t v9 = (void *)*v9;
      }
      uint64_t v10 = SVGNode::identifier(ChildWithIdentifier);
      SVGUtilities::log((SVGUtilities *)"Error: Cyclical dependency found when trying to resolve use definition: %s with %s(%s)", v11, v8, v9, v10);
    }
  }
}

void sub_210A2E624(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v17 - 73) < 0) {
    operator delete(*(void **)(v17 - 96));
  }
  _Unwind_Resume(exception_object);
}

BOOL SVGAttribute::stringValueBeginsWith(SVGAttribute *this, const char *a2, const char *a3)
{
  uint64_t v4 = (SVGAttribute *)((char *)this + 56);
  if (*((char *)this + 79) < 0) {
    uint64_t v4 = *(SVGParser **)v4;
  }
  return SVGParser::StringBeginsWith(v4, a2, a3);
}

void SVGUtilities::error(SVGUtilities *this, const char *a2, ...)
{
  va_start(va, a2);
  if (is_verbose_logging(void)::onceToken != -1) {
    dispatch_once(&is_verbose_logging(void)::onceToken, &__block_literal_global_21);
  }
  if (is_verbose_logging(void)::isVerbose)
  {
    printf("CoreSVG: Error: ");
    vprintf((const char *)this, va);
  }
}

void SVGPath::~SVGPath(SVGPath *this)
{
  SVGPath::~SVGPath(this);
  JUMPOUT(0x216677AD0);
}

{
  CFTypeRef **v2;
  CFTypeRef **v3;
  const void *v4;
  void *v5;

  *(void *)this = &unk_26C30A370;
  uint64_t v2 = (CFTypeRef **)*((void *)this + 6);
  uint64_t v3 = (CFTypeRef **)*((void *)this + 7);
  while (v2 != v3)
    CFRetained::release(*v2++);
  uint64_t v4 = (const void *)*((void *)this + 9);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 6);
  if (v5)
  {
    *((void *)this + 7) = v5;
    operator delete(v5);
  }
  *(void *)this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

void ___ZN7SVGAtom14SharedInstanceEv_block_invoke()
{
}

void sub_210A2E860(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10A0C4095436CDBLL);
  _Unwind_Resume(a1);
}

void SVGAtom::SVGAtom(SVGAtom *this)
{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  *((void *)this + 4) = 0;
  *((void *)this + 3) = (char *)this + 32;
  *((void *)this + 5) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 1065353216;
  *((_DWORD *)this + 22) = 0;
  SVGAtom::initializeTable(this);
}

void sub_210A2E8F4(_Unwind_Exception *a1)
{
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::~__hash_table(v3);
  std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::destroy(v2, *(char **)(v1 + 32));
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

void *SVGAtom::initializeTable(SVGAtom *this)
{
  SVGAtom::_mapInit((uint64_t)this, "accumulate", 142);
  unsigned int v3 = 142;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "additive", 141);
  unsigned int v3 = 141;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "animate", 131);
  unsigned int v3 = 131;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "animateMotion", 133);
  unsigned int v3 = 133;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "animateTransform", 134);
  unsigned int v3 = 134;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "attributeName", 135);
  unsigned int v3 = 135;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "attributeType", 136);
  unsigned int v3 = 136;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "baseProfile", 106);
  unsigned int v3 = 106;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "begin", 137);
  unsigned int v3 = 137;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "bevel", 1);
  unsigned int v3 = 1;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "bias", 124);
  unsigned int v3 = 124;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "butt", 2);
  unsigned int v3 = 2;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "by", 144);
  unsigned int v3 = 144;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "calcMode", 152);
  unsigned int v3 = 152;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "circle", 3);
  unsigned int v3 = 3;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "class", 4);
  unsigned int v3 = 4;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "clipPath", 5);
  unsigned int v3 = 5;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "clip-path", 6);
  unsigned int v3 = 6;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "clipPathUnits", 7);
  unsigned int v3 = 7;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "clip-rule", 8);
  unsigned int v3 = 8;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "color", 158);
  unsigned int v3 = 158;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "cx", 9);
  unsigned int v3 = 9;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "cy", 10);
  unsigned int v3 = 10;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "d", 11);
  unsigned int v3 = 11;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "defs", 14);
  unsigned int v3 = 14;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "display-p3", 15);
  unsigned int v3 = 15;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "divisor", 123);
  unsigned int v3 = 123;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "dur", 138);
  unsigned int v3 = 138;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "dx", 96);
  unsigned int v3 = 96;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "dy", 97);
  unsigned int v3 = 97;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "edgeMode", 127);
  unsigned int v3 = 127;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "editable", 113);
  unsigned int v3 = 113;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "ellipse", 16);
  unsigned int v3 = 16;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "end", 146);
  unsigned int v3 = 146;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "evenodd", 17);
  unsigned int v3 = 17;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "extended-srgb", 73);
  unsigned int v3 = 73;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "externalResourcesRequired", 108);
  unsigned int v3 = 108;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "feBlend", 101);
  unsigned int v3 = 101;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "feComposite", 114);
  unsigned int v3 = 114;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "feConvolveMatrix", 120);
  unsigned int v3 = 120;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "feFlood", 91);
  unsigned int v3 = 91;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "feGaussianBlur", 103);
  unsigned int v3 = 103;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "feImage", 94);
  unsigned int v3 = 94;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "feMerge", 98);
  unsigned int v3 = 98;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "feMergeNode", 99);
  unsigned int v3 = 99;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "feOffset", 95);
  unsigned int v3 = 95;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "feTile", 100);
  unsigned int v3 = 100;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "fill", 18);
  unsigned int v3 = 18;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "fill-opacity", 19);
  unsigned int v3 = 19;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "fill-rule", 20);
  unsigned int v3 = 20;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "fill-stroke", 21);
  unsigned int v3 = 21;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "filter", 84);
  unsigned int v3 = 84;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "filterRes", 87);
  unsigned int v3 = 87;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "filterUnits", 85);
  unsigned int v3 = 85;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "flood-color", 92);
  unsigned int v3 = 92;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "flood-opacity", 93);
  unsigned int v3 = 93;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "focusable", 109);
  unsigned int v3 = 109;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "font", 22);
  unsigned int v3 = 22;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "font-family", 23);
  unsigned int v3 = 23;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "font-size", 24);
  unsigned int v3 = 24;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "font-weight", 25);
  unsigned int v3 = 25;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "from", 139);
  unsigned int v3 = 139;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "fx", 26);
  unsigned int v3 = 26;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "fy", 27);
  unsigned int v3 = 27;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "g", 29);
  unsigned int v3 = 29;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "gradientTransform", 78);
  unsigned int v3 = 78;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "gradientUnits", 28);
  unsigned int v3 = 28;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "spreadMethod", 130);
  unsigned int v3 = 130;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "height", 30);
  unsigned int v3 = 30;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "id", 31);
  unsigned int v3 = 31;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "image", 77);
  unsigned int v3 = 77;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "in", 88);
  unsigned int v3 = 88;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "in2", 89);
  unsigned int v3 = 89;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "k1", 116);
  unsigned int v3 = 116;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "k2", 117);
  unsigned int v3 = 117;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "k3", 118);
  unsigned int v3 = 118;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "k4", 119);
  unsigned int v3 = 119;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "kernelMatrix", 122);
  unsigned int v3 = 122;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "kernelUnitLength", 128);
  unsigned int v3 = 128;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "keySplines", 154);
  unsigned int v3 = 154;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "keyTimes", 153);
  unsigned int v3 = 153;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "keyPoints", 156);
  unsigned int v3 = 156;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "line", 32);
  unsigned int v3 = 32;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "linearGradient", 33);
  unsigned int v3 = 33;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "mask", 74);
  unsigned int v3 = 74;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "maskUnits", 75);
  unsigned int v3 = 75;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "maskContentUnits", 76);
  unsigned int v3 = 76;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "max", 148);
  unsigned int v3 = 148;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "mesh", 36);
  unsigned int v3 = 36;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "min", 147);
  unsigned int v3 = 147;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "miter", 37);
  unsigned int v3 = 37;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "mode", 102);
  unsigned int v3 = 102;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "mpath", 155);
  unsigned int v3 = 155;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "nonzero", 39);
  unsigned int v3 = 39;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "offset", 40);
  unsigned int v3 = 40;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "opacity", 41);
  unsigned int v3 = 41;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "operator", 115);
  unsigned int v3 = 115;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "order", 121);
  unsigned int v3 = 121;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "path", 42);
  unsigned int v3 = 42;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "pattern", 79);
  unsigned int v3 = 79;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "patternContentUnits", 81);
  unsigned int v3 = 81;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "patternTransform", 82);
  unsigned int v3 = 82;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "patternUnits", 80);
  unsigned int v3 = 80;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "playbackOrder", 111);
  unsigned int v3 = 111;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "points", 43);
  unsigned int v3 = 43;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "polygon", 44);
  unsigned int v3 = 44;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "polyline", 45);
  unsigned int v3 = 45;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "preserveAspectRatio", 46);
  unsigned int v3 = 46;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "preserveAlpha", 129);
  unsigned int v3 = 129;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "primitiveUnits", 86);
  unsigned int v3 = 86;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "r", 47);
  unsigned int v3 = 47;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "radialGradient", 48);
  unsigned int v3 = 48;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "rect", 49);
  unsigned int v3 = 49;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "repeatDuration", 151);
  unsigned int v3 = 151;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "repeatCount", 150);
  unsigned int v3 = 150;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "restart", 149);
  unsigned int v3 = 149;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "result", 90);
  unsigned int v3 = 90;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "round", 50);
  unsigned int v3 = 50;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "rx", 51);
  unsigned int v3 = 51;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "ry", 52);
  unsigned int v3 = 52;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "set", 132);
  unsigned int v3 = 132;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "srgb", 53);
  unsigned int v3 = 53;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stdDeviation", 104);
  unsigned int v3 = 104;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "square", 54);
  unsigned int v3 = 54;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stop", 55);
  unsigned int v3 = 55;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stop-color", 56);
  unsigned int v3 = 56;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stop-opacity", 83);
  unsigned int v3 = 83;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stroke", 57);
  unsigned int v3 = 57;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stroke-dasharray", 12);
  unsigned int v3 = 12;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stroke-dashoffset", 13);
  unsigned int v3 = 13;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stroke-linecap", 34);
  unsigned int v3 = 34;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stroke-linejoin", 35);
  unsigned int v3 = 35;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stroke-miterlimit", 38);
  unsigned int v3 = 38;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stroke-opacity", 58);
  unsigned int v3 = 58;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "stroke-width", 59);
  unsigned int v3 = 59;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "style", 60);
  unsigned int v3 = 60;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "svg", 61);
  unsigned int v3 = 61;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "snapShotTime", 110);
  unsigned int v3 = 110;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "symbol", 62);
  unsigned int v3 = 62;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "targetX", 125);
  unsigned int v3 = 125;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "targetY", 126);
  unsigned int v3 = 126;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "text-anchor", 157);
  unsigned int v3 = 157;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "timelineBegin", 112);
  unsigned int v3 = 112;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "to", 140);
  unsigned int v3 = 140;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "transform", 63);
  unsigned int v3 = 63;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "type", 143);
  unsigned int v3 = 143;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "values", 145);
  unsigned int v3 = 145;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "version", 64);
  unsigned int v3 = 64;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "viewBox", 65);
  unsigned int v3 = 65;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "width", 66);
  unsigned int v3 = 66;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "x", 67);
  unsigned int v3 = 67;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "xmlns", 105);
  unsigned int v3 = 105;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "x1", 68);
  unsigned int v3 = 68;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "x2", 69);
  unsigned int v3 = 69;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "y", 70);
  unsigned int v3 = 70;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "y1", 71);
  unsigned int v3 = 71;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "y2", 72);
  unsigned int v3 = 72;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "zoomAndPan", 107);
  unsigned int v3 = 107;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "text", 10001);
  unsigned int v3 = 10001;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "letter-spacing", 10000);
  unsigned int v3 = 10000;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "href", 20000);
  unsigned int v3 = 20000;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "use", 20001);
  unsigned int v3 = 20001;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "xlink:href", 20000);
  unsigned int v3 = 20000;
  std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
  SVGAtom::_mapInit((uint64_t)this, "unknown", 0);
  unsigned int v3 = 0;
  return std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>((uint64_t)this + 48, &v3, &v3);
}

void *std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__emplace_unique_key_args<SVGAtom::Name,SVGAtom::Name>(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
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
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
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
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  CGFloat v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }
  *uint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    CGFloat v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_210A30784(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t SVGAtom::_mapInit(uint64_t a1, char *a2, uint64_t a3)
{
  unint64_t v6 = (os_unfair_lock_s *)(a1 + 88);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  std::string::basic_string[abi:ne180100]<0>(&__p, a2);
  int v11 = a3;
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__emplace_unique_key_args<std::string,std::pair<std::string,SVGAtom::Name>>((uint64_t **)a1, (uint64_t)&__p, (uint64_t)&__p);
  if (v10 < 0) {
    operator delete(__p);
  }
  LODWORD(__p) = a3;
  std::string::basic_string[abi:ne180100]<0>(&v9, a2);
  std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::__emplace_unique_key_args<SVGAtom::Name,std::pair<SVGAtom::Name,std::string>>((uint64_t **)(a1 + 24), (unsigned int *)&__p, (uint64_t)&__p);
  if (v12 < 0) {
    operator delete(v9);
  }
  os_unfair_lock_unlock(v6);
  return a3;
}

void sub_210A30850(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

_OWORD *std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__emplace_unique_key_args<std::string,std::pair<std::string,SVGAtom::Name>>(uint64_t **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void **)std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  unint64_t v6 = *v5;
  if (!*v5)
  {
    unint64_t v7 = (uint64_t **)v5;
    unint64_t v6 = operator new(0x40uLL);
    v6[2] = *(_OWORD *)a3;
    *((void *)v6 + 6) = *(void *)(a3 + 16);
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *((_DWORD *)v6 + 14) = *(_DWORD *)(a3 + 24);
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(a1, v9, v7, (uint64_t *)v6);
  }
  return v6;
}

uint64_t **std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::__emplace_unique_key_args<SVGAtom::Name,std::pair<SVGAtom::Name,std::string>>(uint64_t **a1, unsigned int *a2, uint64_t a3)
{
  unint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    unsigned int v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint8x8_t v8 = (uint64_t **)v5;
        unsigned int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        unint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        unint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint8x8_t v8 = a1 + 1;
LABEL_10:
    char v10 = (char *)operator new(0x40uLL);
    *((_DWORD *)v10 + 8) = *(_DWORD *)a3;
    *(_OWORD *)(v10 + 40) = *(_OWORD *)(a3 + 8);
    *((void *)v10 + 7) = *(void *)(a3 + 24);
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__rehash<true>(uint64_t a1, size_t __n)
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
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      int v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    char v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

locale_t ___ZL10GetLocaleCv_block_invoke()
{
  locale_t result = newlocale(63, "C", 0);
  GetLocaleC(void)::localeC = (uint64_t)result;
  return result;
}

void ___ZL14NameToColorMapv_block_invoke()
{
  MEMORY[0x270FA5388]();
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

void sub_210A320AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v11 = (char *)(v9 + 4759);
  uint64_t v12 = -4768;
  float v13 = v11;
  while (1)
  {
    int v14 = *v13;
    v13 -= 32;
    if (v14 < 0) {
      operator delete(*(void **)(v11 - 23));
    }
    int v11 = v13;
    v12 += 32;
    if (!v12)
    {
      MEMORY[0x216677AD0](a9, 0x1020C4062D53EE8);
      _Unwind_Resume(a1);
    }
  }
}

void sub_210A32378()
{
}

double CGSVGViewBoxNodeGetPosition(uint64_t a1, const char *a2)
{
  uint64_t v2 = (double *)CFRetained::getObject<SVGViewBoxNode>(a1, a2);
  if (v2) {
    return v2[26];
  }
  else {
    return 0.0;
  }
}

void *CFRetained::getObject<SVGViewBoxNode>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  uint64_t v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

double *CGSVGViewBoxNodeSetSize(uint64_t a1, const char *a2, double a3, double a4)
{
  locale_t result = (double *)CFRetained::getObject<SVGViewBoxNode>(a1, a2);
  if (result)
  {
    result[28] = a3;
    result[29] = a4;
  }
  return result;
}

double CGSVGViewBoxNodeGetSize(uint64_t a1, const char *a2)
{
  uint64_t v2 = (char *)CFRetained::getObject<SVGViewBoxNode>(a1, a2);
  unint64_t v3 = v2 + 224;
  if (!v2) {
    unint64_t v3 = (char *)MEMORY[0x263F001B0];
  }
  return *(double *)v3;
}

double *CGSVGViewBoxNodeSetViewbox(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  locale_t result = (double *)CFRetained::getObject<SVGViewBoxNode>(a1, a2);
  if (result)
  {
    result[30] = a3;
    result[31] = a4;
    result[32] = a5;
    result[33] = a6;
  }
  return result;
}

double CGSVGViewBoxNodeGetViewbox(uint64_t a1, const char *a2)
{
  uint64_t v2 = (char *)CFRetained::getObject<SVGViewBoxNode>(a1, a2);
  unint64_t v3 = (char *)MEMORY[0x263F001A8];
  if (v2) {
    unint64_t v3 = v2 + 240;
  }
  return *(double *)v3;
}

_DWORD *CGSVGViewBoxNodeSetAspectRatio(uint64_t a1, const char *a2)
{
  int v2 = (int)a2;
  locale_t result = CFRetained::getObject<SVGViewBoxNode>(a1, a2);
  if (result) {
    result[68] = v2;
  }
  return result;
}

unsigned int *CGSVGViewBoxNodeGetAspectRatio(uint64_t a1, const char *a2)
{
  locale_t result = (unsigned int *)CFRetained::getObject<SVGViewBoxNode>(a1, a2);
  if (result) {
    return (unsigned int *)result[68];
  }
  return result;
}

_DWORD *CGSVGViewBoxNodeSetAspectRatioMeetOrSlice(uint64_t a1, const char *a2)
{
  int v2 = (int)a2;
  locale_t result = CFRetained::getObject<SVGViewBoxNode>(a1, a2);
  if (result) {
    result[69] = v2;
  }
  return result;
}

uint64_t CGSVGViewBoxNodeGetAspectRatioMeetOrSlice(uint64_t a1, const char *a2)
{
  int v2 = CFRetained::getObject<SVGViewBoxNode>(a1, a2);
  if (v2) {
    int v3 = v2[69];
  }
  else {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

uint64_t CGSVGCanvasGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGCanvas::kSVGCanvasClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A32640(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFTypeRef CGSVGCanvasRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGCanvasRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

SVGCanvas *CGSVGCanvasGetCurrentGroup(uint64_t a1, const char *a2)
{
  locale_t result = (SVGCanvas *)CFRetained::getObject<SVGCanvas>(a1, a2);
  if (result)
  {
    locale_t result = (SVGCanvas *)SVGCanvas::currentGroup(result);
    if (result) {
      return (SVGCanvas *)*((void *)result + 5);
    }
  }
  return result;
}

void *CFRetained::getObject<SVGCanvas>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

SVGCanvas *CGSVGCanvasPushGroup(uint64_t a1, const char *a2)
{
  locale_t result = (SVGCanvas *)CFRetained::getObject<SVGCanvas>(a1, a2);
  if (result) {
    SVGCanvas::pushGroup(result);
  }
  return result;
}

void *CGSVGCanvasPopGroup(uint64_t a1, const char *a2)
{
  locale_t result = CFRetained::getObject<SVGCanvas>(a1, a2);
  if (result)
  {
    return (void *)SVGCanvas::popGroup((uint64_t)result);
  }
  return result;
}

SVGCanvas *CGSVGCanvasAddRect(uint64_t a1, const char *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  locale_t result = (SVGCanvas *)CFRetained::getObject<SVGCanvas>(a1, a2);
  if (result)
  {
    v11.origin.double x = a3;
    v11.origin.double y = a4;
    v11.size.width = a5;
    v11.size.height = a6;
    SVGCanvas::addRect(result, v11);
  }
  return result;
}

SVGCanvas *CGSVGCanvasAddEllipseInRect(uint64_t a1, const char *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  locale_t result = (SVGCanvas *)CFRetained::getObject<SVGCanvas>(a1, a2);
  if (result)
  {
    v11.origin.double x = a3;
    v11.origin.double y = a4;
    v11.size.width = a5;
    v11.size.height = a6;
    SVGCanvas::addEllipseInRect(result, v11);
  }
  return result;
}

SVGCanvas *CGSVGCanvasAddLine(uint64_t a1, const char *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  locale_t result = (SVGCanvas *)CFRetained::getObject<SVGCanvas>(a1, a2);
  if (result)
  {
    v11.double x = a3;
    v11.double y = a4;
    v12.double x = a5;
    v12.double y = a6;
    SVGCanvas::addLine(result, v11, v12);
  }
  return result;
}

SVGCanvas *CGSVGCanvasAddPath(uint64_t a1, const char *a2)
{
  locale_t result = (SVGCanvas *)CFRetained::getObject<SVGCanvas>(a1, a2);
  if (result) {
    SVGCanvas::addPath(result);
  }
  return result;
}

uint64_t CGSVGCanvasAddPolyline(uint64_t a1, uint64_t a2, unint64_t a3)
{
  std::string __p = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  SVGUtilities::CGPointListFromFloats(a2, a3, (uint64_t)&__p);
  if (CFRetained::getObject<SVGCanvas>(a1, v4)) {
    SVGCanvas::addPolyline();
  }
  if (__p)
  {
    uint64_t v7 = __p;
    operator delete(__p);
  }
  return 0;
}

void sub_210A3297C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CGSVGCanvasAddPolygon(uint64_t a1, uint64_t a2, unint64_t a3)
{
  std::string __p = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  SVGUtilities::CGPointListFromFloats(a2, a3, (uint64_t)&__p);
  if (CFRetained::getObject<SVGCanvas>(a1, v4)) {
    SVGCanvas::addPolygon();
  }
  if (__p)
  {
    uint64_t v7 = __p;
    operator delete(__p);
  }
  return 0;
}

void sub_210A32A1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  locale_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

BOOL SVGAtom::HasAtom(SVGAtom *this, const char *a2)
{
  if (SVGAtom::SharedInstance(void)::onceToken != -1) {
    dispatch_once(&SVGAtom::SharedInstance(void)::onceToken, &__block_literal_global);
  }
  char v3 = (os_unfair_lock_s *)SVGAtom::SharedInstance(void)::instance;
  return SVGAtom::hasAtom(v3, (char *)this);
}

uint64_t SVGAtom::SharedInstance(SVGAtom *this)
{
  if (SVGAtom::SharedInstance(void)::onceToken != -1) {
    dispatch_once(&SVGAtom::SharedInstance(void)::onceToken, &__block_literal_global);
  }
  return SVGAtom::SharedInstance(void)::instance;
}

BOOL SVGAtom::hasAtom(os_unfair_lock_s *this, char *a2)
{
  int8x8_t v4 = this + 22;
  os_unfair_lock_lock(this + 22);
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  unint64_t v5 = (SVGAtom *)std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::find<std::string>((uint64_t)this, (uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  os_unfair_lock_unlock(v4);
  return &this[2] != (os_unfair_lock_s *)v5;
}

void sub_210A32BA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGAtom::~SVGAtom(char **this)
{
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }
}

uint64_t std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::~__hash_table(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      char v3 = (void *)*v2;
      operator delete(v2);
      int v2 = v3;
    }
    while (v3);
  }
  int8x8_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void SVGAttribute::SVGAttribute(uint64_t a1, int a2, uint64_t a3, int a4)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  CFRetained::CFRetained((void *)a1, (uint64_t)__p);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  *(void *)(a1 + 56) = 0;
  *(void *)a1 = &unk_26C30A150;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 80) = 1;
  if (a4 == 1) {
    int v7 = 9;
  }
  else {
    int v7 = 0;
  }
  *(_DWORD *)(a1 + 104) = v7;
  operator new();
}

void sub_210A32E14(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x80C40D6874129);
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*v3);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void sub_210A32F94(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;
  MEMORY[0x216677AD0](v4, 0x80C40D6874129);
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*v3);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void sub_210A330E4(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x10B3C40C2CA9EE7);
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*v3);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void sub_210A33214(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 79) < 0) {
    operator delete(*v16);
  }
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void sub_210A33344(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x10B3C40C2CA9EE7);
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*v3);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void sub_210A33490(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x10B3C40C2CA9EE7);
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*v3);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void sub_210A335C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 79) < 0) {
    operator delete(*v16);
  }
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void sub_210A33714(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;
  MEMORY[0x216677AD0](v4, 0x80C40D6874129);
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*v3);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void sub_210A339FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 79) < 0) {
    operator delete(*v16);
  }
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void sub_210A33B18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 79) < 0) {
    operator delete(*v16);
  }
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
}

BOOL SVGAttribute::resolveAsMask(SVGAttribute *this, uint64_t a2, const char *a3)
{
  if (*((_DWORD *)this + 20) != 7)
  {
    uint64_t v4 = (SVGAttribute *)((char *)this + 56);
    if (*((char *)this + 79) < 0) {
      uint64_t v4 = *(SVGParser **)v4;
    }
    if (SVGParser::StringBeginsWith(v4, "url(", a3))
    {
      *((_DWORD *)this + 20) = 7;
      operator new();
    }
  }
  return *((_DWORD *)this + 20) == 7;
}

void sub_210A33C3C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405372943BLL);
  _Unwind_Resume(a1);
}

BOOL SVGAttribute::resolveAsPaint(SVGAttribute *this)
{
  SVGColor::SVGColor((uint64_t)v5, 0, 0.0, 0.0, 0.0, 1.0);
  if (*((_DWORD *)this + 20) != 3)
  {
    uint64_t v2 = (SVGAttribute *)((char *)this + 56);
    if (!std::string::compare((const std::string *)((char *)this + 56), "none"))
    {
      *((_DWORD *)this + 20) = 3;
      operator new();
    }
    if (*((char *)this + 79) < 0) {
      uint64_t v2 = *(SVGColor **)v2;
    }
    if (SVGColor::GetColorWithString(v2, v5, v3))
    {
      *((_DWORD *)this + 20) = 3;
      operator new();
    }
  }
  return *((_DWORD *)this + 20) == 3;
}

void sub_210A33D4C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40C2CA9EE7);
  _Unwind_Resume(a1);
}

BOOL SVGAttribute::resolveAsClipPath(SVGAttribute *this, uint64_t a2, const char *a3)
{
  if (*((_DWORD *)this + 20) != 6)
  {
    uint64_t v4 = (SVGAttribute *)((char *)this + 56);
    if (*((char *)this + 79) < 0) {
      uint64_t v4 = *(SVGParser **)v4;
    }
    if (SVGParser::StringBeginsWith(v4, "url(", a3))
    {
      *((_DWORD *)this + 20) = 6;
      operator new();
    }
  }
  return *((_DWORD *)this + 20) == 6;
}

void sub_210A33DFC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C407B03486ALL);
  _Unwind_Resume(a1);
}

BOOL SVGAttribute::resolveAsURL(SVGAttribute *this, uint64_t a2, const char *a3)
{
  if (*((_DWORD *)this + 20) == 5) {
    return 1;
  }
  uint64_t v4 = (SVGAttribute *)((char *)this + 56);
  if (*((char *)this + 79) < 0) {
    uint64_t v4 = *(SVGParser **)v4;
  }
  if (SVGParser::StringBeginsWith(v4, "url(", a3))
  {
    *((_DWORD *)this + 20) = 5;
    return 1;
  }
  return *((_DWORD *)this + 20) == 5;
}

BOOL SVGAttribute::resolveAsFilter(SVGAttribute *this, uint64_t a2, const char *a3)
{
  if (*((_DWORD *)this + 20) != 8)
  {
    uint64_t v4 = (SVGAttribute *)((char *)this + 56);
    if (*((char *)this + 79) < 0) {
      uint64_t v4 = *(SVGParser **)v4;
    }
    if (SVGParser::StringBeginsWith(v4, "url(", a3))
    {
      *((_DWORD *)this + 20) = 8;
      operator new();
    }
  }
  return *((_DWORD *)this + 20) == 8;
}

void sub_210A33F10(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40FABA7DC6);
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::lengthValue(uint64_t a1, uint64_t a2)
{
  uint64_t result = SVGAttribute::resolveAsFloats((SVGAttribute *)a1);
  if (result)
  {
    unint64_t v5 = **(void ***)(a1 + 88);
    if (*(void **)(*(void *)(a1 + 88) + 8) == v5)
    {
      return 0;
    }
    else
    {
      *(void *)a2 = *v5;
      *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 104) == 9;
      return 1;
    }
  }
  return result;
}

BOOL SVGAttribute::maskValue(os_unfair_lock_s *this, SVGMask **a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v8, this + 27);
  BOOL v6 = SVGAttribute::resolveAsMask((SVGAttribute *)this, v4, v5);
  if (v6) {
    *a2 = *(SVGMask **)&this[22]._os_unfair_lock_opaque;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v8);
  return v6;
}

void sub_210A33FF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

BOOL SVGAttribute::paintValue(os_unfair_lock_s *this, SVGPaint **a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v6, this + 27);
  BOOL v4 = SVGAttribute::resolveAsPaint((SVGAttribute *)this);
  if (v4) {
    *a2 = *(SVGPaint **)&this[22]._os_unfair_lock_opaque;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v6);
  return v4;
}

void sub_210A34070(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::pointValue(os_unfair_lock_s *this, CGPoint *a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v7, this + 27);
  if (SVGAttribute::resolveAsFloats((SVGAttribute *)this)
    && (BOOL v4 = **(CGPoint ***)&this[22]._os_unfair_lock_opaque,
        *(void *)(*(void *)&this[22]._os_unfair_lock_opaque + 8) - (void)v4 >= 9uLL))
  {
    *a2 = *v4;
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v7);
  return v5;
}

void sub_210A340FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::floatsValue(uint64_t a1, void *a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v6, (os_unfair_lock_t)(a1 + 108));
  uint64_t v4 = SVGAttribute::resolveAsFloats((SVGAttribute *)a1);
  if (v4) {
    *a2 = *(void *)(a1 + 88);
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v6);
  return v4;
}

void sub_210A34174(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

BOOL SVGAttribute::clipPathValue(os_unfair_lock_s *this, SVGClipPath **a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v8, this + 27);
  BOOL v6 = SVGAttribute::resolveAsClipPath((SVGAttribute *)this, v4, v5);
  if (v6) {
    *a2 = *(SVGClipPath **)&this[22]._os_unfair_lock_opaque;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v8);
  return v6;
}

void sub_210A341EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::lengthType(os_unfair_lock_s *this)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v4, this + 27);
  if (!SVGAttribute::resolveAsFloats((SVGAttribute *)this)
    || *(void *)(*(void *)&this[22]._os_unfair_lock_opaque + 8) == **(void **)&this[22]._os_unfair_lock_opaque)
  {
    uint64_t os_unfair_lock_opaque = 0;
  }
  else
  {
    uint64_t os_unfair_lock_opaque = this[26]._os_unfair_lock_opaque;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v4);
  return os_unfair_lock_opaque;
}

void sub_210A34268(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::urlValue(uint64_t a1, uint64_t a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v11, (os_unfair_lock_t)(a1 + 108));
  if (!SVGAttribute::resolveAsURL((SVGAttribute *)a1, v4, v5)) {
    goto LABEL_10;
  }
  BOOL v6 = (const char *)(a1 + 56);
  if (*(char *)(a1 + 79) < 0) {
    BOOL v6 = *(const char **)v6;
  }
  if (SVGParser::GetParentheticalComponent(v6, a2)
    && (*(char *)(a2 + 23) >= 0 ? (os_unfair_lock_t v8 = (SVGParser *)a2) : (os_unfair_lock_t v8 = *(SVGParser **)a2),
        SVGParser::StringBeginsWith(v8, "#", v7)))
  {
    uint64_t v9 = 1;
    std::string::replace((std::string *)a2, 0, 1uLL, (const std::string::value_type *)&unk_210A5361E);
  }
  else
  {
LABEL_10:
    uint64_t v9 = 0;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v11);
  return v9;
}

void sub_210A3432C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

BOOL SVGAttribute::filterValue(os_unfair_lock_s *this, SVGFilter **a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v8, this + 27);
  BOOL v6 = SVGAttribute::resolveAsFilter((SVGAttribute *)this, v4, v5);
  if (v6) {
    *a2 = *(SVGFilter **)&this[22]._os_unfair_lock_opaque;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v8);
  return v6;
}

void sub_210A343A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::isEqual(SVGAttribute *this, const SVGAttribute *a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v19, (os_unfair_lock_t)this + 27);
  int v5 = *((_DWORD *)this + 20);
  if (v5 && ((int v6 = *((_DWORD *)a2 + 20)) != 0 ? (v7 = v5 == v6) : (v7 = 0), v7))
  {
    uint64_t isEqual = 0;
    switch(v5)
    {
      case 1:
        char v10 = (uint64_t *)*((void *)this + 11);
        uint64_t v11 = *((void *)a2 + 11);
        uint64_t v13 = *v10;
        uint64_t v12 = v10[1];
        uint64_t v14 = v12 - *v10;
        uint64_t v15 = *(double **)v11;
        if (v14 != *(void *)(v11 + 8) - *(void *)v11) {
          goto LABEL_6;
        }
        if (v13 == v12)
        {
          uint64_t isEqual = 1;
        }
        else
        {
          uint64_t v16 = v13 + 8;
          do
          {
            double v17 = *v15++;
            uint64_t isEqual = *(double *)(v16 - 8) == v17;
            BOOL v18 = *(double *)(v16 - 8) != v17 || v16 == v12;
            v16 += 8;
          }
          while (!v18);
        }
        break;
      case 2:
        uint64_t isEqual = *((_DWORD *)this + 22) == *((_DWORD *)a2 + 22);
        break;
      case 3:
        uint64_t isEqual = SVGPaint::isEqual(*((SVGPaint **)this + 11), *((const SVGPaint **)a2 + 11));
        break;
      case 4:
      case 5:
        break;
      default:
        SVGUtilities::error((SVGUtilities *)"isEqual(): Unexpected expected type: %d\n", v4, *((unsigned int *)this + 20));
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    uint64_t isEqual = 0;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v19);
  return isEqual;
}

void sub_210A344E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SVGAttribute::print(SVGAttribute *this)
{
  uint64_t v2 = SVGAtom::ToString(*((_DWORD *)this + 12));
  uint64_t v4 = (void *)((char *)this + 56);
  if (*((char *)this + 79) < 0) {
    uint64_t v4 = (void *)*v4;
  }
  return SVGUtilities::print((SVGUtilities *)"%s: %s", v3, v2, v4);
}

void SVGAttributeMap::createShallowCopy(SVGAttributeMap *this)
{
}

void sub_210A345FC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4084D8EEBALL);
  _Unwind_Resume(a1);
}

void ___ZNK15SVGAttributeMap17createShallowCopyEv_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t SVGAttributeMap::hasAttribute(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 56);
  if (!v2) {
    return 0;
  }
  while (1)
  {
    unsigned int v3 = *((_DWORD *)v2 + 8);
    if (v3 <= a2) {
      break;
    }
LABEL_5:
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      return 0;
    }
  }
  if (v3 < a2)
  {
    ++v2;
    goto LABEL_5;
  }
  return 1;
}

void SVGAttributeMap::removeAttribute(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v2 = a1 + 56;
  uint64_t v3 = v4;
  if (v4)
  {
    int v5 = (uint64_t **)(v2 - 8);
    uint64_t v6 = v2;
    do
    {
      unsigned int v7 = *(_DWORD *)(v3 + 32);
      BOOL v8 = v7 >= a2;
      if (v7 >= a2) {
        uint64_t v9 = (uint64_t *)v3;
      }
      else {
        uint64_t v9 = (uint64_t *)(v3 + 8);
      }
      if (v8) {
        uint64_t v6 = v3;
      }
      uint64_t v3 = *v9;
    }
    while (*v9);
    if (v6 != v2 && *(_DWORD *)(v6 + 32) <= a2)
    {
      CFRetained::release(*(CFTypeRef **)(v6 + 40));
      std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::__remove_node_pointer(v5, (uint64_t *)v6);
      operator delete((void *)v6);
    }
  }
}

uint64_t SVGAttributeMap::count(SVGAttributeMap *this)
{
  return *((void *)this + 8);
}

uint64_t SVGAttributeMap::print(SVGAttributeMap *this)
{
  return SVGAttributeMap::enumerate((uint64_t)this, (uint64_t)&__block_literal_global_19);
}

uint64_t ___ZNK15SVGAttributeMap5printEv_block_invoke(int a1, int a2, SVGAttribute *this)
{
  SVGAttribute::print(this);
  return SVGUtilities::print((SVGUtilities *)"\n", v3);
}

void CFRetained::~CFRetained(void **this)
{
  *this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  *this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  JUMPOUT(0x216677AD0);
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
}

void std::vector<double>::__throw_out_of_range[abi:ne180100]()
{
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

double SVGColor::at(SVGColor *this, int a2)
{
  switch(a2)
  {
    case 0:
      goto LABEL_6;
    case 1:
      this = (SVGColor *)((char *)this + 8);
      goto LABEL_6;
    case 2:
      this = (SVGColor *)((char *)this + 16);
      goto LABEL_6;
    case 3:
      this = (SVGColor *)((char *)this + 24);
LABEL_6:
      double result = *(double *)this;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

double *SVGColor::setAt(double *this, int a2, double a3)
{
  switch(a2)
  {
    case 0:
      goto LABEL_5;
    case 1:
      ++this;
      goto LABEL_5;
    case 2:
      this += 2;
      goto LABEL_5;
    case 3:
      this += 3;
LABEL_5:
      *this = a3;
      break;
    default:
      return this;
  }
  return this;
}

void SVGColor::SVGColor(SVGColor *this, unsigned int a2)
{
  *((_DWORD *)this + 8) = 53;
  int8x8_t v2 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a2), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL);
  v3.i64[0] = v2.u32[0];
  v3.i64[1] = v2.u32[1];
  *(float64x2_t *)this = vdivq_f64(vcvtq_f64_u64(v3), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL));
  *((double *)this + 2) = (double)a2 / 255.0;
  *((void *)this + 3) = 0x3FF0000000000000;
}

void SVGColor::SVGColor(SVGColor *this, double *a2)
{
  *((_DWORD *)this + 8) = 53;
  *(double *)this = *a2;
  *((double *)this + 1) = a2[1];
  *((double *)this + 2) = a2[2];
  *((double *)this + 3) = a2[3];
}

BOOL SVGColor::isEqual(SVGColor *this, const SVGColor *a2)
{
  BOOL v4 = SVGUtilities::CGFloatEqualToFloat(this, *(double *)this, *(double *)a2);
  if (!v4) {
    return 0;
  }
  BOOL v5 = SVGUtilities::CGFloatEqualToFloat((SVGUtilities *)v4, *((double *)this + 1), *((double *)a2 + 1));
  if (!v5) {
    return 0;
  }
  BOOL v6 = SVGUtilities::CGFloatEqualToFloat((SVGUtilities *)v5, *((double *)this + 2), *((double *)a2 + 2));
  if (!v6) {
    return 0;
  }
  double v7 = *((double *)this + 3);
  double v8 = *((double *)a2 + 3);
  return SVGUtilities::CGFloatEqualToFloat((SVGUtilities *)v6, v7, v8);
}

void SVGColor::GetStringForColor(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = SVGUtilities::CGFloatClamp((SVGUtilities *)a1, *(double *)a1 * 255.0, 0.0, 255.0);
  double v6 = SVGUtilities::CGFloatClamp(v5, *(double *)(a1 + 8) * 255.0, 0.0, 255.0);
  double v8 = SVGUtilities::CGFloatClamp(v7, *(double *)(a1 + 16) * 255.0, 0.0, 255.0);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  BOOL v10 = SVGUtilities::CGFloatEqualToFloat(v9, *(double *)(a1 + 24), 1.0);
  uint64_t v11 = (int)v4;
  uint64_t v12 = (int)v6;
  uint64_t v13 = (int)v8;
  if (v10)
  {
    double v15 = *(double *)a1;
    double v14 = *(double *)(a1 + 8);
    double v17 = *(double *)(a1 + 16);
    double v16 = *(double *)(a1 + 24);
    int v18 = *(_DWORD *)(a1 + 32);
    if (NameToColorMap(void)::__onceToken != -1) {
      dispatch_once(&NameToColorMap(void)::__onceToken, &__block_literal_global_1);
    }
    if (v18 != 53) {
      goto LABEL_14;
    }
    os_unfair_lock_t v19 = (void *)NameToColorMap(void)::__colorMap;
    BOOL v20 = SVGUtilities::CGFloatEqualToFloat((SVGUtilities *)v10, v16, 1.0);
    if (!v20) {
      goto LABEL_14;
    }
    double v21 = SVGUtilities::CGFloatClamp((SVGUtilities *)v20, v15 * 255.0, 0.0, 255.0);
    double v23 = SVGUtilities::CGFloatClamp(v22, v14 * 255.0, 0.0, 255.0);
    double v25 = SVGUtilities::CGFloatClamp(v24, v17 * 255.0, 0.0, 255.0);
    int64x2_t v28 = (void *)*v19;
    unsigned __int8 v27 = v19 + 1;
    std::string::size_type v26 = v28;
    if (v28 == v27) {
      goto LABEL_14;
    }
    while (*((_DWORD *)v26 + 14) != (((int)v23 << 8) | ((int)v21 << 16) | (int)v25))
    {
      int64x2_t v29 = (void *)v26[1];
      if (v29)
      {
        do
        {
          CGRect v30 = v29;
          int64x2_t v29 = (void *)*v29;
        }
        while (v29);
      }
      else
      {
        do
        {
          CGRect v30 = (void *)v26[2];
          BOOL v31 = *v30 == (void)v26;
          std::string::size_type v26 = v30;
        }
        while (!v31);
      }
      std::string::size_type v26 = v30;
      if (v30 == v27) {
        goto LABEL_14;
      }
    }
    double v32 = (char *)(v26 + 4);
    if ((*((char *)v26 + 55) & 0x80000000) == 0 || (double v32 = *(char **)v32) != 0)
    {
      std::string::basic_string[abi:ne180100]<0>(&v33, v32);
      if (*(char *)(a2 + 23) < 0) {
        operator delete(*(void **)a2);
      }
    }
    else
    {
LABEL_14:
      SVGParser::FormatString((SVGParser *)"#%02x%02x%02x", &v33, v11, v12, v13);
    }
    goto LABEL_17;
  }
  if (*(double *)(a1 + 24) > 0.0)
  {
    SVGParser::FormatString((SVGParser *)"rgba(%d,%d,%d,%g)", &v33, (int)v4, (int)v6, (int)v8, *(void *)(a1 + 24));
LABEL_17:
    *(_OWORD *)a2 = v33;
    *(void *)(a2 + 16) = v34;
    return;
  }
  MEMORY[0x216677A40](a2, "none");
}

void sub_210A34CB8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t ReadColorValues(SVGParser *a1, SVGColor *a2)
{
  uint64_t v4 = 0;
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v5 = 1;
  while (1)
  {
    char v6 = v5;
    unsigned int v7 = ReadColorValues(char const*,SVGColor *)::kColorSpaceNames[v4];
    double v8 = (const char *)SVGAtom::ToString(v7);
    if (SVGParser::StringBeginsWith(a1, v8, v9)) {
      break;
    }
    char v5 = 0;
    uint64_t v4 = 1;
    if ((v6 & 1) == 0) {
      goto LABEL_4;
    }
  }
  *((_DWORD *)a2 + 8) = v7;
  a1 = (SVGParser *)((char *)a1 + strlen(v8));
  for (unint64_t i = *(char *)a1; (SVGParser::IsDigitCharacter((SVGParser *)i) & 1) == 0 && *(unsigned char *)a1; unint64_t i = v14)
  {
    unsigned int v14 = *((char *)a1 + 1);
    a1 = (SVGParser *)((char *)a1 + 1);
  }
LABEL_4:
  std::string __p = 0;
  unsigned __int8 v27 = 0;
  uint64_t v28 = 0;
  SVGParser::GetSeparatedWhitespaceComponents((const char *)a1, &__p, 0);
  uint64_t v11 = (int *)__p;
  BOOL v10 = v27;
  if ((unint64_t)((char *)v27 - (unsigned char *)__p - 33) < 0xFFFFFFFFFFFFFFF7) {
    goto LABEL_5;
  }
  if (__p != v27)
  {
    int v15 = 0;
    while ((SVGParser::StripLeadingTrailingWhitespace((SVGParser *)((char *)a1 + *v11), (const char *)v11[1], (uint64_t)v29, (char *)0x40) & 1) != 0)
    {
      double v25 = 1.0;
      int v24 = 0;
      double v23 = 0;
      BOOL v16 = SVGParser::ParseCGFloat(v29, &v25, &v23, &v24);
      if (!v16) {
        break;
      }
      double v17 = 1.0;
      if (v25 < 0.0 || v25 > 1.0 || v24 != 0)
      {
        double v17 = 255.0;
        if (v23)
        {
          double v17 = 100.0;
          if (*v23 != 37) {
            double v17 = 255.0;
          }
        }
      }
      double v20 = SVGUtilities::CGFloatClamp((SVGUtilities *)v16, v25 / v17, 0.0, 1.0);
      double v21 = (double *)a2;
      switch(v15)
      {
        case 0:
          goto LABEL_28;
        case 1:
          double v21 = (double *)((char *)a2 + 8);
          goto LABEL_28;
        case 2:
          double v21 = (double *)((char *)a2 + 16);
          goto LABEL_28;
        case 3:
          double v21 = (double *)((char *)a2 + 24);
LABEL_28:
          *double v21 = v20;
          break;
        default:
          break;
      }
      v11 += 2;
      ++v15;
      if (v11 == v10) {
        goto LABEL_30;
      }
    }
LABEL_5:
    uint64_t v12 = 0;
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v12 = 1;
LABEL_31:
  if (__p)
  {
    unsigned __int8 v27 = (int *)__p;
    operator delete(__p);
  }
  return v12;
}

void sub_210A34F84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGPattern::SVGPattern(SVGPattern *this)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "pattern");
  SVGViewBoxNode::SVGViewBoxNode(this, __p);
}

void sub_210A3504C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGPattern::copy(SVGPattern *this)
{
}

void sub_210A350F8(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C40BA4B7CADLL);
  _Unwind_Resume(a1);
}

void SVGPattern::SVGPattern(SVGPattern *this, const SVGPattern *a2)
{
}

void SVGPattern::~SVGPattern(SVGPattern *this)
{
  SVGMask::~SVGMask(this);
  JUMPOUT(0x216677AD0);
}

uint64_t SVGPattern::print(SVGPattern *this, const char *a2)
{
  SVGUtilities::print((SVGUtilities *)"\n", a2);
  uint64_t v4 = (SVGUtilities *)SVGUtilities::print((SVGUtilities *)"Pattern: Size: {%.2f, %.2f} Viewbox: ", v3, *((void *)this + 28), *((void *)this + 29));
  SVGUtilities::printIgnoringIndention(v4, *(CGRect *)((char *)this + 240));
  return SVGUtilities::print((SVGUtilities *)"\n", v5);
}

uint64_t SVGPattern::inheritParentPattern(SVGPattern *this)
{
  uint64_t v2 = *(void *)(*((void *)this + 35) + 56);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = ___ZN10SVGPattern20inheritParentPatternEv_block_invoke;
  void v9[3] = &__block_descriptor_tmp_2;
  v9[4] = this;
  SVGAttributeMap::enumerate(v2, (uint64_t)v9);
  if (*((void *)this + 12) == *((void *)this + 11))
  {
    uint64_t v4 = *((void *)this + 35);
    char v5 = *(uint64_t **)(v4 + 88);
    char v6 = *(uint64_t **)(v4 + 96);
    while (v5 != v6)
    {
      uint64_t v7 = *v5++;
      double v8 = (SVGNode *)(*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
      SVGNode::addChild(this, v8);
      CFRetained::release((CFTypeRef *)v8);
    }
  }
  return (*(uint64_t (**)(SVGPattern *, void))(*(void *)this + 24))(this, *((void *)this + 7));
}

uint64_t ___ZN10SVGPattern20inheritParentPatternEv_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t result = SVGAttributeMap::hasAttribute(*(void *)(*(void *)(a1 + 32) + 56), a2);
  if ((result & 1) == 0) {
    operator new();
  }
  return result;
}

void sub_210A353D8(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

__n128 SVGPattern::drawCells(SVGPattern *this, CGContextRef c, CGRect a3, CGFloat a4)
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (*((unsigned char *)this + 289))
  {
    CGContextFillRect(c, a3);
  }
  else
  {
    *((unsigned char *)this + 289) = 1;
    int IsUserSpace = SVGPattern::attributeIsUserSpace((uint64_t)this, 0x50u, 0);
    uint64_t v12 = (long long *)((char *)this + 208);
    double v13 = *((double *)this + 26);
    if (IsUserSpace)
    {
      double v14 = *((double *)this + 27);
      double v15 = *((double *)this + 28);
      double v16 = *((double *)this + 29);
    }
    else
    {
      double v13 = width * v13;
      double v14 = height * *((double *)this + 27);
      double v15 = width * *((double *)this + 28);
      double v16 = height * *((double *)this + 29);
    }
    long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v32.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v32.c = v17;
    *(_OWORD *)&v32.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    int v18 = (os_unfair_lock_s *)SVGAttributeMap::attribute(*((void *)this + 7), 0x52u);
    if (v18) {
      SVGAttribute::transformValue(v18, &v32);
    }
    long long v19 = *v12;
    long long v30 = *((_OWORD *)this + 14);
    long long v31 = v19;
    *((double *)this + 26) = v13;
    *((double *)this + 27) = v14;
    *((double *)this + 28) = v15;
    *((double *)this + 29) = v16;
    *((double *)this + 37) = width;
    *((double *)this + 38) = height;
    *(void *)&callbacks.version = 0;
    callbacks.drawPattern = (CGPatternDrawPatternCallback)SVGPattern::drawCells(CGContext *,CGRect,double)::$_0::__invoke;
    callbacks.releaseInfo = 0;
    CGAffineTransform t1 = v32;
    memset(&v28, 0, sizeof(v28));
    CGContextGetCTM(&t2, c);
    CGAffineTransformConcat(&v28, &t1, &t2);
    matriCGFloat x = v28;
    v34.origin.CGFloat x = v13;
    v34.origin.CGFloat y = v14;
    v34.size.double width = v15;
    v34.size.double height = v16;
    double v20 = CGPatternCreate(this, v34, &matrix, v15, v16, kCGPatternTilingConstantSpacingMinimalDistortion, 1, &callbacks);
    Pattern = CGColorSpaceCreatePattern(0);
    CGContextSetFillColorSpace(c, Pattern);
    CGFloat components = a4;
    CGContextSetFillPattern(c, v20, &components);
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    CGContextFillRect(c, v35);
    CGColorSpaceRelease(Pattern);
    CGPatternRelease(v20);
    long long v22 = v30;
    long long *v12 = v31;
    *((_OWORD *)this + 14) = v22;
    __n128 result = *(__n128 *)MEMORY[0x263F001B0];
    *(_OWORD *)((char *)this + 296) = *MEMORY[0x263F001B0];
    *((unsigned char *)this + 289) = 0;
  }
  return result;
}

uint64_t SVGPattern::attributeIsUserSpace(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = (SVGAttribute *)SVGAttributeMap::attribute(*(void *)(a1 + 56), a2);
  if (!v4) {
    return a3;
  }
  uint64_t v5 = SVGAttribute::stringValue(v4);
  if (*(char *)(v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *(void *)(v5 + 8));
  }
  else
  {
    long long v6 = *(_OWORD *)v5;
    __p.__r_.__value_.__r.__words[2] = *(void *)(v5 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v6;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__p.__r_.__value_.__l.__size_ != 14
      || (*(void *)__p.__r_.__value_.__l.__data_ == 0x6361705372657375
        ? (BOOL v10 = *(void *)(__p.__r_.__value_.__r.__words[0] + 6) == 0x6573556E4F656361)
        : (BOOL v10 = 0),
          !v10))
    {
      if (__p.__r_.__value_.__l.__size_ == 17)
      {
        unint64_t v11 = 0x6F626A656374426FLL;
        unint64_t v12 = bswap64(*(void *)__p.__r_.__value_.__l.__data_);
        if (v12 == 0x6F626A656374426FLL
          && (unint64_t v11 = 0x756E64696E67426FLL,
              unint64_t v12 = bswap64(*(void *)(__p.__r_.__value_.__r.__words[0] + 8)),
              v12 == 0x756E64696E67426FLL))
        {
          int v13 = *(unsigned __int8 *)(__p.__r_.__value_.__r.__words[0] + 16) - 120;
        }
        else if (v12 < v11)
        {
          int v13 = -1;
        }
        else
        {
          int v13 = 1;
        }
        operator delete(__p.__r_.__value_.__l.__data_);
        if (!v13) {
          return 0;
        }
      }
      else
      {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      return a3;
    }
    operator delete(__p.__r_.__value_.__l.__data_);
    return 1;
  }
  if (HIBYTE(__p.__r_.__value_.__r.__words[2]) == 14)
  {
    if (__p.__r_.__value_.__r.__words[0] != 0x6361705372657375
      || *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 6) != 0x6573556E4F656361)
    {
      return a3;
    }
    return 1;
  }
  if (HIBYTE(__p.__r_.__value_.__r.__words[2]) == 17)
  {
    unint64_t v7 = 0x6F626A656374426FLL;
    unint64_t v8 = bswap64(__p.__r_.__value_.__r.__words[0]);
    if (v8 == 0x6F626A656374426FLL
      && (unint64_t v7 = 0x756E64696E67426FLL, v8 = bswap64(__p.__r_.__value_.__l.__size_), v8 == 0x756E64696E67426FLL))
    {
      int v9 = __p.__r_.__value_.__s.__data_[16] - 120;
    }
    else
    {
      int v9 = v8 < v7 ? -1 : 1;
    }
    if (!v9) {
      return 0;
    }
  }
  return a3;
}

void SVGPattern::draw(SVGPattern *this, CGContext *a2)
{
  if (*((double *)this + 32) <= 0.0
    && *((double *)this + 33) <= 0.0
    && (SVGPattern::attributeIsUserSpace((uint64_t)this, 0x51u, 1) & 1) == 0)
  {
    CGFloat v4 = *((double *)this + 37);
    CGFloat v5 = *((double *)this + 38);
    CGContextScaleCTM(a2, v4, v5);
  }
}

uint64_t SVGPattern::isEqual()
{
  return 0;
}

uint64_t SVGPattern::updatedSpecificAttribute(double *a1, signed int a2, uint64_t a3)
{
  uint64_t result = 0;
  if (a2 > 66)
  {
    if (a2 == 70)
    {
      CGSVGLengthMake();
      double v21 = v16;
      uint64_t v22 = v17;
      if (SVGAttribute::lengthValue(a3, (uint64_t)&v21))
      {
        double v18 = v21;
        if (v22 == 1) {
          double v18 = v21 / 100.0;
        }
        a1[27] = v18;
        return 1;
      }
    }
    else
    {
      if (a2 != 67) {
        return result;
      }
      CGSVGLengthMake();
      double v21 = v10;
      uint64_t v22 = v11;
      if (SVGAttribute::lengthValue(a3, (uint64_t)&v21))
      {
        double v12 = v21;
        if (v22 == 1) {
          double v12 = v21 / 100.0;
        }
        a1[26] = v12;
        return 1;
      }
    }
  }
  else if (a2 == 30)
  {
    CGSVGLengthMake();
    double v21 = v13;
    uint64_t v22 = v14;
    if (SVGAttribute::lengthValue(a3, (uint64_t)&v21))
    {
      double v15 = v21;
      if (v22 == 1) {
        double v15 = v21 / 100.0;
      }
      a1[29] = v15;
      return 1;
    }
  }
  else
  {
    if (a2 != 66) {
      return result;
    }
    CGSVGLengthMake();
    double v21 = v7;
    uint64_t v22 = v8;
    if (SVGAttribute::lengthValue(a3, (uint64_t)&v21))
    {
      double v9 = v21;
      if (v22 == 1) {
        double v9 = v21 / 100.0;
      }
      a1[28] = v9;
      return 1;
    }
  }
  long long v19 = SVGAtom::ToString(a2);
  SVGUtilities::log((SVGUtilities *)"Failed to parse %s for node name \"pattern\"", v20, v19);
  return 1;
}

uint64_t SVGPattern::drawCells(CGContext *,CGRect,double)::$_0::__invoke(uint64_t a1, int a2)
{
  return SVGUtilities::CGContextDrawSVGDefinitionNode(a2, *(void *)(a1 + 40), 0);
}

uint64_t CGSVGGradientStopGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGGradientStop::kSVGGradientStopClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A35AAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGGradientStopCreateWithColor(uint64_t a1)
{
  SVGColor::SVGColor((uint64_t)v1, *(_DWORD *)(a1 + 32), *(double *)a1, *(double *)(a1 + 8), *(double *)(a1 + 16), *(double *)(a1 + 24));
  operator new();
}

void sub_210A35B38(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40C1F8F287);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGGradientStopRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGGradientStopRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void CGSVGGradientStopGetColor(uint64_t a1@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  CGFloat v4 = CFRetained::getObject<SVGGradientStop>(a1, a2);
  if (v4)
  {
    SVGColor::SVGColor((uint64_t)v5, (uint64_t)v4 + 48);
    CGSVGColorCreateRGBA(a3, v5[0], v5[1], v5[2], v5[3]);
  }
  else
  {
    CGSVGColorCreateRGBA(a3, 0.0, 0.0, 0.0, 1.0);
  }
}

void *CFRetained::getObject<SVGGradientStop>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  uint64_t v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

double CGSVGGradientStopGetOpacity(uint64_t a1, const char *a2)
{
  uint64_t v2 = (double *)CFRetained::getObject<SVGGradientStop>(a1, a2);
  if (v2) {
    return v2[11];
  }
  else {
    return 1.0;
  }
}

void CGSVGGradientStopGetOffset(uint64_t a1, const char *a2)
{
  if (!CFRetained::getObject<SVGGradientStop>(a1, a2))
  {
    CGSVGLengthMake();
  }
}

uint64_t CGSVGGradientGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A35D5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGGradientCreate()
{
}

void sub_210A35DC4(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C40A581D00ALL);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGGradientRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGGradientRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t CGSVGGradientGetType(uint64_t a1, const char *a2)
{
  uint64_t v2 = (unsigned int *)CFRetained::getObject<SVGGradient>(a1, a2);
  if (v2) {
    return v2[52];
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void *CFRetained::getObject<SVGGradient>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  uint64_t v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

void *CGSVGGradientAddStop(uint64_t a1, const char *a2)
{
  CGFloat v4 = (SVGGradient *)CFRetained::getObject<SVGGradient>(a1, a2);
  uint64_t result = CFRetained::getObject<SVGGradientStop>(a1, v5);
  if (v4 && result)
  {
    uint64_t v8 = (SVGGradientStop *)CFRetained::getObject<SVGGradientStop>((uint64_t)a2, v7);
    return (void *)SVGGradient::addStop(v4, v8);
  }
  return result;
}

void *CGSVGGradientGetNumberOfStops(uint64_t a1, const char *a2)
{
  uint64_t result = CFRetained::getObject<SVGGradient>(a1, a2);
  if (result) {
    return (void *)((uint64_t)(result[28] - result[27]) >> 3);
  }
  return result;
}

void *CGSVGGradientGetStop(uint64_t a1, const char *a2)
{
  uint64_t result = CFRetained::getObject<SVGGradient>(a1, a2);
  if (result)
  {
    uint64_t v4 = result[27];
    if ((unint64_t)a2 >= (result[28] - v4) >> 3) {
      return 0;
    }
    else {
      return *(void **)(*(void *)(v4 + 8 * (void)a2) + 40);
    }
  }
  return result;
}

void CGSVGGradientGetStart(uint64_t a1@<X0>, const char *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = CFRetained::getObject<SVGGradient>(a1, a2);
  if (v4)
  {
    long long v5 = v4[16];
    *a3 = v4[15];
    a3[1] = v5;
  }
  else
  {
    CGSVGPointMake((uint64_t)a3, 0.0, 0.0);
  }
}

__n128 CGSVGGradientSetStart(uint64_t a1, uint64_t a2)
{
  char v3 = CFRetained::getObject<SVGGradient>(a1, (const char *)a2);
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    long long v5 = *(_OWORD *)(a2 + 16);
    v3[15] = *(_OWORD *)a2;
    v3[16] = v5;
  }
  return result;
}

void CGSVGGradientGetEnd(uint64_t a1@<X0>, const char *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = CFRetained::getObject<SVGGradient>(a1, a2);
  if (v4)
  {
    long long v5 = v4[18];
    *a3 = v4[17];
    a3[1] = v5;
  }
  else
  {
    CGSVGPointMake((uint64_t)a3, 0.0, 0.0);
  }
}

__n128 CGSVGGradientSetEnd(uint64_t a1, uint64_t a2)
{
  char v3 = CFRetained::getObject<SVGGradient>(a1, (const char *)a2);
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    long long v5 = *(_OWORD *)(a2 + 16);
    v3[17] = *(_OWORD *)a2;
    v3[18] = v5;
  }
  return result;
}

void CGSVGGradientGetCenter(uint64_t a1@<X0>, const char *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = CFRetained::getObject<SVGGradient>(a1, a2);
  if (v4)
  {
    long long v5 = v4[20];
    *a3 = v4[19];
    a3[1] = v5;
  }
  else
  {
    CGSVGPointMake((uint64_t)a3, 0.0, 0.0);
  }
}

__n128 CGSVGGradientSetCenter(uint64_t a1, uint64_t a2)
{
  char v3 = CFRetained::getObject<SVGGradient>(a1, (const char *)a2);
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    long long v5 = *(_OWORD *)(a2 + 16);
    v3[19] = *(_OWORD *)a2;
    v3[20] = v5;
  }
  return result;
}

void CGSVGGradientGetFocal(uint64_t a1@<X0>, const char *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = CFRetained::getObject<SVGGradient>(a1, a2);
  if (v4)
  {
    long long v5 = v4[22];
    *a3 = v4[21];
    a3[1] = v5;
  }
  else
  {
    CGSVGPointMake((uint64_t)a3, 0.0, 0.0);
  }
}

__n128 CGSVGGradientSetFocal(uint64_t a1, uint64_t a2)
{
  char v3 = CFRetained::getObject<SVGGradient>(a1, (const char *)a2);
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    long long v5 = *(_OWORD *)(a2 + 16);
    v3[21] = *(_OWORD *)a2;
    v3[22] = v5;
  }
  return result;
}

void CGSVGGradientGetRadius(uint64_t a1, const char *a2)
{
  if (!CFRetained::getObject<SVGGradient>(a1, a2))
  {
    CGSVGLengthMake();
  }
}

void *CGSVGGradientSetRadius(uint64_t a1, const char *a2, uint64_t a3)
{
  __n128 result = CFRetained::getObject<SVGGradient>(a1, a2);
  if (result)
  {
    result[46] = a2;
    result[47] = a3;
  }
  return result;
}

unsigned int *CGSVGGradientGetSpreadMethod(uint64_t a1, const char *a2)
{
  __n128 result = (unsigned int *)CFRetained::getObject<SVGGradient>(a1, a2);
  if (result) {
    return (unsigned int *)result[96];
  }
  return result;
}

_DWORD *CGSVGGradientSetSpreadMethod(uint64_t a1, const char *a2)
{
  int v2 = (int)a2;
  __n128 result = CFRetained::getObject<SVGGradient>(a1, a2);
  if (result) {
    result[96] = v2;
  }
  return result;
}

__n128 CGSVGGradientGetGradientTransform@<Q0>(uint64_t a1@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (char *)CFRetained::getObject<SVGGradient>(a1, a2);
  if (v4) {
    long long v5 = v4 + 392;
  }
  else {
    long long v5 = (char *)MEMORY[0x263F000D0];
  }
  long long v6 = *((_OWORD *)v5 + 1);
  *(_OWORD *)a3 = *(_OWORD *)v5;
  *(_OWORD *)(a3 + 16) = v6;
  __n128 result = *((__n128 *)v5 + 2);
  *(__n128 *)(a3 + 32) = result;
  return result;
}

__n128 CGSVGGradientSetGradientTransform(uint64_t a1, uint64_t a2)
{
  char v3 = (char *)CFRetained::getObject<SVGGradient>(a1, (const char *)a2);
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    long long v5 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v3 + 408) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 424) = v5;
    *(__n128 *)(v3 + 392) = result;
  }
  return result;
}

unsigned int *CGSVGGradientGetSpread(uint64_t a1, const char *a2)
{
  __n128 result = (unsigned int *)CFRetained::getObject<SVGGradient>(a1, a2);
  if (result) {
    return (unsigned int *)result[96];
  }
  return result;
}

_DWORD *CGSVGGradientSetSpread(uint64_t a1, const char *a2)
{
  int v2 = (int)a2;
  __n128 result = CFRetained::getObject<SVGGradient>(a1, a2);
  if (result) {
    result[96] = v2;
  }
  return result;
}

uint64_t CGSVGMaskGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A363B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGMaskCreate()
{
}

void sub_210A36418(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405372943BLL);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGMaskRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGMaskRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

CGImageRef CGSVGMaskCreateMask(uint64_t a1, const char *a2)
{
  char v3 = (SVGMask *)CFRetained::getObject<SVGMask>(a1, a2);
  long long v5 = (SVGNode *)CFRetained::getObject<SVGNode>((uint64_t)a2, v4);
  if (!v3 || !v5) {
    return 0;
  }
  return SVGMask::createMask(v3, v5);
}

void *CFRetained::getObject<SVGMask>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

uint64_t SVGPathCommand::CharacterFromType(char a1)
{
  return a1;
}

void SVGPathCommand::SVGPathCommand(SVGPathCommand *this, const SVGPathCommand *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPathCommand::kSVGPathCommandClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A1C0;
  *((_DWORD *)this + 12) = *((_DWORD *)a2 + 12);
  *((void *)this + 7) = 0;
  if (*((void *)a2 + 7)) {
    operator new();
  }
}

void sub_210A366F4(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x80C40D6874129);
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void SVGPathCommand::~SVGPathCommand(SVGPathCommand *this)
{
  *(void *)this = &unk_26C30A1C0;
  uint64_t v2 = *((void *)this + 7);
  if (v2)
  {
    char v3 = *(void **)v2;
    if (*(void *)v2)
    {
      *(void *)(v2 + 8) = v3;
      operator delete(v3);
    }
    MEMORY[0x216677AD0](v2, 0x80C40D6874129);
  }
  *(void *)this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  uint64_t vars8;

  SVGPathCommand::~SVGPathCommand(this);
  JUMPOUT(0x216677AD0);
}

uint64_t SVGPathCommand::isRelative(SVGPathCommand *this)
{
  return ((*((_DWORD *)this + 12) - 97) < 0x16) & (0x2D0885u >> (*((unsigned char *)this + 48) - 97));
}

void SVGPathCommand::appendPoint(SVGPathCommand *this, CGPoint a2)
{
  uint64_t v2 = *((void *)this + 7);
  if (!v2) {
    SVGPathCommand::appendPoint();
  }
  CGFloat y = a2.y;
  CGFloat x = a2.x;
  unint64_t v6 = *(void *)(v2 + 16);
  double v7 = *(CGFloat **)(v2 + 8);
  if ((unint64_t)v7 >= v6)
  {
    double v9 = *(CGFloat **)v2;
    uint64_t v10 = ((uint64_t)v7 - *(void *)v2) >> 3;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 61) {
      goto LABEL_36;
    }
    uint64_t v12 = v6 - (void)v9;
    if (v12 >> 2 > v11) {
      unint64_t v11 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v2 + 16, v13);
      double v9 = *(CGFloat **)v2;
      double v7 = *(CGFloat **)(v2 + 8);
    }
    else
    {
      uint64_t v14 = 0;
    }
    double v15 = (CGFloat *)&v14[8 * v10];
    double v16 = &v14[8 * v13];
    CGFloat *v15 = x;
    uint64_t v8 = v15 + 1;
    while (v7 != v9)
    {
      uint64_t v17 = *((void *)v7-- - 1);
      *((void *)v15-- - 1) = v17;
    }
    *(void *)uint64_t v2 = v15;
    *(void *)(v2 + 8) = v8;
    *(void *)(v2 + 16) = v16;
    if (v9) {
      operator delete(v9);
    }
  }
  else
  {
    CGFloat *v7 = a2.x;
    uint64_t v8 = v7 + 1;
  }
  *(void *)(v2 + 8) = v8;
  uint64_t v18 = *((void *)this + 7);
  long long v19 = *(CGFloat **)(v18 + 8);
  unint64_t v20 = *(void *)(v18 + 16);
  if ((unint64_t)v19 < v20)
  {
    CGFloat *v19 = y;
    double v21 = v19 + 1;
    goto LABEL_34;
  }
  uint64_t v22 = *(CGFloat **)v18;
  uint64_t v23 = ((uint64_t)v19 - *(void *)v18) >> 3;
  unint64_t v24 = v23 + 1;
  if ((unint64_t)(v23 + 1) >> 61) {
LABEL_36:
  }
    std::vector<double>::__throw_length_error[abi:ne180100]();
  uint64_t v25 = v20 - (void)v22;
  if (v25 >> 2 > v24) {
    unint64_t v24 = v25 >> 2;
  }
  if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v26 = v24;
  }
  if (v26)
  {
    unsigned __int8 v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v18 + 16, v26);
    uint64_t v22 = *(CGFloat **)v18;
    long long v19 = *(CGFloat **)(v18 + 8);
  }
  else
  {
    unsigned __int8 v27 = 0;
  }
  CGAffineTransform v28 = (CGFloat *)&v27[8 * v23];
  int64x2_t v29 = &v27[8 * v26];
  *CGAffineTransform v28 = y;
  double v21 = v28 + 1;
  while (v19 != v22)
  {
    uint64_t v30 = *((void *)v19-- - 1);
    *((void *)v28-- - 1) = v30;
  }
  *(void *)uint64_t v18 = v28;
  *(void *)(v18 + 8) = v21;
  *(void *)(v18 + 16) = v29;
  if (v22) {
    operator delete(v22);
  }
LABEL_34:
  *(void *)(v18 + 8) = v21;
}

void SVGPathCommand::appendPoints(uint64_t a1, void **a2)
{
}

void SVGPathCommand::appendPoints(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (!*(void *)(a1 + 56)) {
    SVGPathCommand::appendPoints();
  }
  for (unint64_t i = a3; i != a4; i += 2)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void **)(v7 + 8);
    unint64_t v9 = *(void *)(v7 + 16);
    if ((unint64_t)v8 >= v9)
    {
      unint64_t v11 = *(void **)v7;
      uint64_t v12 = ((uint64_t)v8 - *(void *)v7) >> 3;
      unint64_t v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 61) {
        goto LABEL_38;
      }
      uint64_t v14 = v9 - (void)v11;
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
        double v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v7 + 16, v15);
        unint64_t v11 = *(void **)v7;
        uint64_t v8 = *(void **)(v7 + 8);
      }
      else
      {
        double v16 = 0;
      }
      uint64_t v17 = &v16[8 * v12];
      *(void *)uint64_t v17 = *i;
      uint64_t v10 = v17 + 8;
      while (v8 != v11)
      {
        uint64_t v18 = *--v8;
        *((void *)v17 - 1) = v18;
        v17 -= 8;
      }
      *(void *)uint64_t v7 = v17;
      *(void *)(v7 + 8) = v10;
      *(void *)(v7 + 16) = &v16[8 * v15];
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      void *v8 = *i;
      uint64_t v10 = v8 + 1;
    }
    *(void *)(v7 + 8) = v10;
    uint64_t v19 = *(void *)(a1 + 56);
    unint64_t v20 = *(void **)(v19 + 8);
    unint64_t v21 = *(void *)(v19 + 16);
    if ((unint64_t)v20 >= v21)
    {
      uint64_t v23 = *(void **)v19;
      uint64_t v24 = ((uint64_t)v20 - *(void *)v19) >> 3;
      unint64_t v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) >> 61) {
LABEL_38:
      }
        std::vector<double>::__throw_length_error[abi:ne180100]();
      uint64_t v26 = v21 - (void)v23;
      if (v26 >> 2 > v25) {
        unint64_t v25 = v26 >> 2;
      }
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v27 = v25;
      }
      if (v27)
      {
        CGAffineTransform v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v19 + 16, v27);
        uint64_t v23 = *(void **)v19;
        unint64_t v20 = *(void **)(v19 + 8);
      }
      else
      {
        CGAffineTransform v28 = 0;
      }
      int64x2_t v29 = &v28[8 * v24];
      *(void *)int64x2_t v29 = i[1];
      uint64_t v22 = v29 + 8;
      while (v20 != v23)
      {
        uint64_t v30 = *--v20;
        *((void *)v29 - 1) = v30;
        v29 -= 8;
      }
      *(void *)uint64_t v19 = v29;
      *(void *)(v19 + 8) = v22;
      *(void *)(v19 + 16) = &v28[8 * v27];
      if (v23) {
        operator delete(v23);
      }
    }
    else
    {
      *unint64_t v20 = i[1];
      uint64_t v22 = v20 + 1;
    }
    *(void *)(v19 + 8) = v22;
  }
}

void SVGPathCommand::appendFloat(SVGPathCommand *this, double a2)
{
  uint64_t v3 = *((void *)this + 7);
  uint64_t v4 = *(double **)(v3 + 8);
  unint64_t v5 = *(void *)(v3 + 16);
  if ((unint64_t)v4 >= v5)
  {
    uint64_t v7 = *(double **)v3;
    uint64_t v8 = ((uint64_t)v4 - *(void *)v3) >> 3;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - (void)v7;
    if (v10 >> 2 > v9) {
      unint64_t v9 = v10 >> 2;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3 + 16, v11);
      uint64_t v7 = *(double **)v3;
      uint64_t v4 = *(double **)(v3 + 8);
    }
    else
    {
      uint64_t v12 = 0;
    }
    unint64_t v13 = (double *)&v12[8 * v8];
    uint64_t v14 = &v12[8 * v11];
    *unint64_t v13 = a2;
    unint64_t v6 = v13 + 1;
    while (v4 != v7)
    {
      uint64_t v15 = *((void *)v4-- - 1);
      *((void *)v13-- - 1) = v15;
    }
    *(void *)uint64_t v3 = v13;
    *(void *)(v3 + 8) = v6;
    *(void *)(v3 + 16) = v14;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    double *v4 = a2;
    unint64_t v6 = v4 + 1;
  }
  *(void *)(v3 + 8) = v6;
}

void SVGPath::SVGPath(SVGPath *this, const SVGPath *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPath::kSVGPathClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A370;
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v5 = *MEMORY[0x263F000D0];
  *((_OWORD *)this + 6) = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *((_OWORD *)this + 7) = v4;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = v5;
  *((_DWORD *)this + 32) = 0;
  if (*((void *)a2 + 6) != *((void *)a2 + 7)) {
    operator new();
  }
}

void sub_210A36E7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void SVGPath::appendCommands(SVGPath *this, const SVGPath *a2)
{
  if (*((void *)a2 + 6) != *((void *)a2 + 7)) {
    operator new();
  }
}

void sub_210A36F8C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40A582917CLL);
  _Unwind_Resume(a1);
}

double SVGPath::boundingBox(SVGPath *this)
{
  CGPath = (const CGPath *)SVGPath::copyCachedCGPath((os_unfair_lock_s *)this);
  if (!CGPath) {
    CGPath = CGSVGPathCreateCGPath(*((void *)this + 5), v3);
  }
  long long v4 = CGPath;
  *(void *)&double v5 = (unint64_t)CGPathGetBoundingBox(CGPath);
  CGPathRelease(v4);
  return v5;
}

void SVGPath::createStringRepresentation(SVGPath *this@<X0>, std::string *a2@<X8>)
{
  memset(&v22, 0, sizeof(v22));
  uint64_t v3 = *((void *)this + 6);
  uint64_t v4 = *((void *)this + 7);
  if (v3 == v4) {
    goto LABEL_42;
  }
  do
  {
    uint64_t v5 = *(void *)(*(void *)v3 + 56);
    if (v5)
    {
      unint64_t v6 = *(double **)v5;
      uint64_t v7 = (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 3;
    }
    else
    {
      unint64_t v6 = 0;
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(unsigned int *)(*(void *)v3 + 48);
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::size_type size = v22.__r_.__value_.__l.__size_;
      if (!v22.__r_.__value_.__l.__size_) {
        goto LABEL_12;
      }
      int v10 = *(unsigned __int8 *)(v22.__r_.__value_.__r.__words[0] + v22.__r_.__value_.__l.__size_ - 1);
    }
    else
    {
      std::string::size_type size = HIBYTE(v22.__r_.__value_.__r.__words[2]);
      if (!*((unsigned char *)&v22.__r_.__value_.__s + 23)) {
        goto LABEL_12;
      }
      int v10 = *(&v21 + HIBYTE(v22.__r_.__value_.__r.__words[2]));
    }
    if (v10 == 32) {
      std::string::resize(&v22, size - 1, 0);
    }
LABEL_12:
    SVGParser::FormatString((SVGParser *)"%c", &__p, v8);
    if ((v21 & 0x80u) == 0) {
      p_p = (const std::string::value_type *)&__p;
    }
    else {
      p_p = (const std::string::value_type *)__p;
    }
    if ((v21 & 0x80u) == 0) {
      std::string::size_type v12 = v21;
    }
    else {
      std::string::size_type v12 = v20;
    }
    std::string::append(&v22, p_p, v12);
    if ((char)v21 < 0)
    {
      operator delete(__p);
      if (!v7) {
        goto LABEL_37;
      }
      while (1)
      {
LABEL_20:
        double v13 = *v6;
        if (*v6 < 0.0)
        {
          if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::size_type v14 = v22.__r_.__value_.__l.__size_;
            if (v22.__r_.__value_.__l.__size_)
            {
              int v15 = *(unsigned __int8 *)(v22.__r_.__value_.__r.__words[0] + v22.__r_.__value_.__l.__size_ - 1);
LABEL_26:
              if (v15 == 32)
              {
                std::string::resize(&v22, v14 - 1, 0);
                double v13 = *v6;
              }
            }
          }
          else
          {
            std::string::size_type v14 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
            if (*((unsigned char *)&v22.__r_.__value_.__s + 23))
            {
              int v15 = *(&v21 + HIBYTE(v22.__r_.__value_.__r.__words[2]));
              goto LABEL_26;
            }
          }
        }
        SVGParser::FormatString((SVGParser *)"%g ", &__p, *(void *)&v13);
        if ((v21 & 0x80u) == 0) {
          double v16 = (const std::string::value_type *)&__p;
        }
        else {
          double v16 = (const std::string::value_type *)__p;
        }
        if ((v21 & 0x80u) == 0) {
          std::string::size_type v17 = v21;
        }
        else {
          std::string::size_type v17 = v20;
        }
        std::string::append(&v22, v16, v17);
        if ((char)v21 < 0) {
          operator delete(__p);
        }
        ++v6;
        if (!--v7) {
          goto LABEL_37;
        }
      }
    }
    if (v7) {
      goto LABEL_20;
    }
LABEL_37:
    v3 += 8;
  }
  while (v3 != v4);
  if ((SHIBYTE(v22.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_42:
    std::string v18 = v22;
    goto LABEL_44;
  }
  std::string::__init_copy_ctor_external(&v18, v22.__r_.__value_.__l.__data_, v22.__r_.__value_.__l.__size_);
LABEL_44:
  SVGParser::StripLeadingTrailingWhitespace(&v18, a2);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
}

void sub_210A37254(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGPath::print(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 48);
  uint64_t v2 = *(void *)(this + 56);
  if (v1 != v2)
  {
    int v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(*(void *)v1 + 56);
      if (v4)
      {
        uint64_t v5 = *(double **)v4;
        uint64_t v6 = (uint64_t)(*(void *)(v4 + 8) - *(void *)v4) >> 3;
      }
      else
      {
        uint64_t v6 = 0;
        uint64_t v5 = 0;
      }
      printf("Command %d, %ld floats, type %c:\n    ", v3, v6, *(char *)(*(void *)v1 + 48));
      for (; v6; --v6)
      {
        double v7 = *v5++;
        printf("%f ", v7);
      }
      ++v3;
      this = putchar(10);
      v1 += 8;
    }
    while (v1 != v2);
  }
  return this;
}

void SVGCanvas::SVGCanvas(SVGCanvas *this, const SVGDocument *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGCanvas::kSVGCanvasClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A410;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 6) = a2;
  uint64_t v4 = *((void *)a2 + 6);
  uint64_t v5 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)this + 72, 1uLL);
  double v7 = &v5[v6];
  *uint64_t v5 = v4;
  uint64_t v8 = v5 + 1;
  int v10 = (char *)*((void *)this + 7);
  unint64_t v9 = (char *)*((void *)this + 8);
  if (v9 != v10)
  {
    do
    {
      uint64_t v11 = *((void *)v9 - 1);
      v9 -= 8;
      *--uint64_t v5 = v11;
    }
    while (v9 != v10);
    unint64_t v9 = (char *)*((void *)this + 7);
  }
  *((void *)this + 7) = v5;
  *((void *)this + 8) = v8;
  *((void *)this + 9) = v7;
  if (v9) {
    operator delete(v9);
  }
  *((void *)this + 8) = v8;
}

void sub_210A37460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  std::string v18 = *v16;
  if (*v16)
  {
    *(void *)(v15 + 64) = v18;
    operator delete(v18);
  }
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void SVGCanvas::~SVGCanvas(SVGCanvas *this)
{
  *(void *)this = &unk_26C30A410;
  if (!*((void *)this + 6))
  {
    uint64_t v2 = (CFTypeRef **)*((void *)this + 7);
    if (*((CFTypeRef ***)this + 8) == v2) {
      std::vector<double>::__throw_out_of_range[abi:ne180100]();
    }
    CFRetained::release(*v2);
  }
  int v3 = (void *)*((void *)this + 7);
  if (v3)
  {
    *((void *)this + 8) = v3;
    operator delete(v3);
  }
  *(void *)this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  uint64_t vars8;

  SVGCanvas::~SVGCanvas(this);
  JUMPOUT(0x216677AD0);
}

void SVGCanvas::pushGroup(SVGCanvas *this)
{
}

void sub_210A376C8(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4060DEF9A3);
  _Unwind_Resume(a1);
}

uint64_t SVGCanvas::currentGroup(SVGCanvas *this)
{
  return *(void *)(*((void *)this + 8) - 8);
}

uint64_t SVGCanvas::popGroup(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 64);
  if ((unint64_t)(v1 - *(void *)(this + 56)) >= 9) {
    *(void *)(this + 64) = v1 - 8;
  }
  return this;
}

void SVGCanvas::addRect(SVGCanvas *this, CGRect a2)
{
}

void sub_210A377F4(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4099030930);
  _Unwind_Resume(a1);
}

void SVGCanvas::addEllipseInRect(SVGCanvas *this, CGRect a2)
{
}

void sub_210A378F4(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4099030930);
  _Unwind_Resume(a1);
}

void SVGCanvas::addLine(SVGCanvas *this, CGPoint a2, CGPoint a3)
{
}

void sub_210A379A0(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4099030930);
  _Unwind_Resume(a1);
}

void SVGCanvas::addPath(SVGCanvas *this)
{
}

void sub_210A37A24(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4099030930);
  _Unwind_Resume(a1);
}

void SVGCanvas::addPolyline()
{
}

void sub_210A37AC0(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4099030930);
  _Unwind_Resume(a1);
}

void SVGCanvas::addPolygon()
{
}

void sub_210A37B5C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4099030930);
  _Unwind_Resume(a1);
}

void SVGCanvas::addText(SVGCanvas *this, const char *a2, CGPoint a3)
{
}

void sub_210A37C0C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4099030930);
  _Unwind_Resume(a1);
}

uint64_t SVGCanvas::rootNode(SVGCanvas *this)
{
  uint64_t v1 = *((void *)this + 7);
  if (*((void *)this + 8) == v1) {
    std::vector<double>::__throw_out_of_range[abi:ne180100]();
  }
  return *(void *)v1;
}

void SVGMask::SVGMask(SVGMask *this, const char *a2)
{
}

void sub_210A37CD8(_Unwind_Exception *a1)
{
  SVGNode::~SVGNode(v1);
  _Unwind_Resume(a1);
}

void SVGMask::SVGMask(SVGMask *this, const SVGMask *a2)
{
}

void SVGMask::~SVGMask(SVGMask *this)
{
  SVGNode::~SVGNode(this);
  JUMPOUT(0x216677AD0);
}

void SVGMask::copy(SVGMask *this)
{
}

void sub_210A37E1C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405372943BLL);
  _Unwind_Resume(a1);
}

void SVGMask::updatedAttributes(SVGMask *this, SVGAttributeMap *a2)
{
  uint64_t v42 = 0;
  double v43 = &v42;
  uint64_t v44 = 0x3802000000;
  float64x2_t v45 = __Block_byref_object_copy_;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  v46 = __Block_byref_object_dispose_;
  CGSVGLengthMakeWithType();
  uint64_t v47 = v4;
  uint64_t v48 = v5;
  uint64_t v35 = 0;
  double v36 = &v35;
  uint64_t v37 = 0x3802000000;
  double v38 = __Block_byref_object_copy_;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  float64x2_t v39 = __Block_byref_object_dispose_;
  CGSVGLengthMakeWithType();
  uint64_t v40 = v6;
  uint64_t v41 = v7;
  uint64_t v28 = 0;
  int64x2_t v29 = &v28;
  uint64_t v30 = 0x3802000000;
  long long v31 = __Block_byref_object_copy_;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  CGAffineTransform v32 = __Block_byref_object_dispose_;
  CGSVGLengthMakeWithType();
  uint64_t v33 = v8;
  uint64_t v34 = v9;
  uint64_t v21 = 0;
  std::string v22 = &v21;
  uint64_t v23 = 0x3802000000;
  uint64_t v24 = __Block_byref_object_copy_;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  unint64_t v25 = __Block_byref_object_dispose_;
  CGSVGLengthMakeWithType();
  uint64_t v26 = v10;
  uint64_t v27 = v11;
  uint64_t v17 = 0;
  std::string v18 = &v17;
  uint64_t v19 = 0x2000000000;
  int v20 = 0;
  uint64_t v13 = 0;
  std::string::size_type v14 = &v13;
  uint64_t v15 = 0x2000000000;
  int v16 = 1;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 0x40000000;
  v12[2] = ___ZN7SVGMask17updatedAttributesEP15SVGAttributeMap_block_invoke;
  void v12[3] = &unk_264187560;
  v12[4] = &v42;
  v12[5] = &v35;
  v12[6] = &v28;
  v12[7] = &v21;
  v12[8] = &v17;
  v12[9] = &v13;
  SVGAttributeMap::enumerate((uint64_t)a2, (uint64_t)v12);
  *((double *)this + 26) = CGSVGLengthScaledLength(v43[5], v43[6], 1.0);
  *((double *)this + 27) = CGSVGLengthScaledLength(v36[5], v36[6], 1.0);
  *((double *)this + 28) = CGSVGLengthScaledLength(v29[5], v29[6], 1.0);
  *((double *)this + 29) = CGSVGLengthScaledLength(v22[5], v22[6], 1.0);
  *((_DWORD *)this + 60) = *((_DWORD *)v18 + 6);
  *((_DWORD *)this + 61) = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v42, 8);
}

void sub_210A380F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 176), 8);
  _Block_object_dispose((const void *)(v34 - 120), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void ___ZN7SVGMask17updatedAttributesEP15SVGAttributeMap_block_invoke(void *a1, int a2, SVGAttribute *this)
{
  int v5 = *((_DWORD *)this + 12);
  switch(v5)
  {
    case 'B':
      uint64_t v6 = a1[6];
      goto LABEL_7;
    case 'C':
      uint64_t v6 = a1[4];
      goto LABEL_7;
    case 'D':
    case 'E':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
      return;
    case 'F':
      uint64_t v6 = a1[5];
      goto LABEL_7;
    case 'K':
      uint64_t v9 = SVGAttribute::stringValue(this);
      int v10 = *(char *)(v9 + 23);
      if (v10 < 0)
      {
        if (*(void *)(v9 + 8) != 14) {
          return;
        }
        uint64_t v9 = *(void *)v9;
      }
      else if (v10 != 14)
      {
        return;
      }
      if (*(void *)v9 == 0x6361705372657375 && *(void *)(v9 + 6) == 0x6573556E4F656361) {
        *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = 1;
      }
      return;
    case 'L':
      uint64_t v11 = SVGAttribute::stringValue(this);
      int v12 = *(char *)(v11 + 23);
      if (v12 < 0)
      {
        if (*(void *)(v11 + 8) != 17) {
          return;
        }
        uint64_t v11 = *(void *)v11;
      }
      else if (v12 != 17)
      {
        return;
      }
      if (*(void *)v11 == 0x6F427463656A626FLL
        && *(void *)(v11 + 8) == 0x6F42676E69646E75
        && *(unsigned char *)(v11 + 16) == 120)
      {
        *(_DWORD *)(*(void *)(a1[9] + 8) + 24) = 0;
      }
      return;
    default:
      if (v5 != 30) {
        return;
      }
      uint64_t v6 = a1[7];
LABEL_7:
      if ((SVGAttribute::lengthValue((uint64_t)this, *(void *)(v6 + 8) + 40) & 1) == 0)
      {
        uint64_t v7 = SVGAtom::ToString(*((_DWORD *)this + 12));
        SVGUtilities::log((SVGUtilities *)"SVGMask: Attribute parse error: %s\n", v8, v7);
      }
      return;
  }
}

CGImageRef SVGMask::createMask(SVGMask *this, SVGNode *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 280)) {
    return 0;
  }
  *((unsigned char *)this + 280) = 1;
  double v7 = (*(double (**)(SVGNode *, void))(*(void *)a2 + 32))(a2, 0);
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  double v11 = *((double *)this + 26);
  if (*((_DWORD *)this + 60))
  {
    double v12 = *((double *)this + 27);
    double v13 = *((double *)this + 28);
    double v14 = *((double *)this + 29);
  }
  else
  {
    double v11 = v7 + v11 * v5;
    double v12 = v4 + *((double *)this + 27) * v6;
    double v13 = v5 * *((double *)this + 28);
    double v14 = v6 * *((double *)this + 29);
  }
  CGImageRef v2 = 0;
  *((double *)this + 31) = v11;
  *((double *)this + 32) = v12;
  *((double *)this + 33) = v13;
  *((double *)this + 34) = v14;
  if (v13 != 0.0 && v14 != 0.0)
  {
    uint64_t v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
    if (v15)
    {
      int v16 = CGBitmapContextCreate(0, (unint64_t)v13, (unint64_t)v14, 8uLL, 0, v15, 1u);
      uint64_t v17 = v16;
      if (v16)
      {
        CGContextTranslateCTM(v16, -*((double *)this + 31), -*((double *)this + 32));
        if (!*((_DWORD *)this + 61))
        {
          v25.b = 0.0;
          v25.c = 0.0;
          v25.a = v9;
          v25.d = v10;
          v25.tCGFloat x = v7;
          v25.tCGFloat y = v8;
          CGContextConcatCTM(v17, &v25);
        }
        SVGUtilities::CGContextDrawSVGDefinitionNode(v17, *((const char **)this + 5), 0);
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    CGColorSpaceRelease(v15);
    Image = CGBitmapContextCreateImage(v17);
    CGContextRelease(v17);
    uint64_t v19 = malloc_type_calloc((unint64_t)(v14 * (double)(unint64_t)((v13 * 8.0 + 7.0) * 0.125)), 1uLL, 0x100004077774924uLL);
    DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
    if (DeviceGray)
    {
      uint64_t v21 = CGBitmapContextCreate(v19, (unint64_t)v13, (unint64_t)v14, 8uLL, (unint64_t)((v13 * 8.0 + 7.0) * 0.125), DeviceGray, 0);
      std::string v22 = v21;
      if (v21)
      {
        v28.origin.CGFloat x = 0.0;
        v28.origin.CGFloat y = 0.0;
        v28.size.double width = v13;
        v28.size.double height = v14;
        CGContextDrawImage(v21, v28, Image);
      }
    }
    else
    {
      std::string v22 = 0;
    }
    CGColorSpaceRelease(DeviceGray);
    CGImageRelease(Image);
    uint64_t v23 = CGDataProviderCreateWithData(v19, v19, (unint64_t)(v14 * (double)(unint64_t)((v13 * 8.0 + 7.0) * 0.125)), (CGDataProviderReleaseDataCallback)ReleaseCallbackForMaskData);
    *(_OWORD *)decode = xmmword_210A52E10;
    CGImageRef v2 = CGImageMaskCreate((unint64_t)v13, (unint64_t)v14, 8uLL, 8uLL, (unint64_t)((v13 * 8.0 + 7.0) * 0.125), v23, decode, 0);
    CGDataProviderRelease(v23);
    CGContextRelease(v22);
    *((unsigned char *)this + 280) = 0;
  }
  return v2;
}

void ReleaseCallbackForMaskData(void *a1, const void *a2)
{
  if (a1) {
    free(a1);
  }
}

uint64_t SVGMask::print(SVGMask *this)
{
  CGImageRef v2 = (char *)this + 64;
  if (*((char *)this + 87) < 0) {
    CGImageRef v2 = *(const char **)v2;
  }
  printf("Node: %s \n", v2);
  if (*((_DWORD *)this + 60) == 1) {
    int v3 = "userSpaceOnUse : true [non default]";
  }
  else {
    int v3 = "objectBoundingBox: true [default]";
  }
  printf("maskUnits: %s\n", v3);
  if (*((_DWORD *)this + 61)) {
    double v4 = "userSpaceOnUse: true [default]";
  }
  else {
    double v4 = "objectBoundingBox : true [non default]";
  }
  printf("maskContentUnits: %s\n", v4);
  SVGAttributeMap::print(*((SVGAttributeMap **)this + 7));
  uint64_t result = puts("\nMasking Nodes: ");
  double v7 = (uint64_t *)*((void *)this + 11);
  double v6 = (uint64_t *)*((void *)this + 12);
  while (v7 != v6)
  {
    uint64_t v8 = *v7++;
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 48))(v8);
  }
  return result;
}

uint64_t SVGMask::printWithNodeToMask(uint64_t a1, uint64_t a2)
{
  puts("\nNodeToMask:");
  (*(void (**)(uint64_t))(*(void *)a2 + 48))(a2);
  double v4 = (*(double (**)(uint64_t, void))(*(void *)a2 + 32))(a2, 0);
  printf("Node to mask bounding box: %g %g %g %g\n\n", v4, v5, v6, v7);
  uint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 48);
  return v8(a1);
}

void *SVGMask::createStringRepresentation@<X0>(SVGMask *this@<X0>, void *a2@<X8>)
{
  uint64_t v3 = SVGNode::identifier(this);
  return SVGParser::FormatString((SVGParser *)"url(#%s)", a2, v3);
}

void ___ZN8SVGStyle21addDefinitionsFromCSSEPKc_block_invoke()
{
}

void sub_210A388B4(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
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

uint64_t *std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::erase(uint64_t **a1, uint64_t a2)
{
  uint64_t v3 = std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::__remove_node_pointer(a1, (uint64_t *)a2);
  if (*(char *)(a2 + 55) < 0) {
    operator delete(*(void **)(a2 + 32));
  }
  operator delete((void *)a2);
  return v3;
}

void SVGDocument::~SVGDocument(SVGDocument *this)
{
  *(void *)this = &unk_26C30A080;
  CFRetained::release(*((void *)this + 6));
  CFRetained::release(*((void *)this + 7));
  uint64_t v2 = (SVGStyle *)*((void *)this + 8);
  if (v2)
  {
    SVGStyle::~SVGStyle(v2);
    MEMORY[0x216677AD0]();
  }
  *(void *)this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  uint64_t vars8;

  SVGDocument::~SVGDocument(this);
  JUMPOUT(0x216677AD0);
}

BOOL SVGDocument::read(SVGDocument *this, const char *a2, SVGReaderOptions *a3)
{
  if (!a2) {
    return 0;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v6 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x8000100u);
  if (!v6) {
    return 0;
  }
  CFStringRef v7 = v6;
  if (!CFStringHasSuffix(v6, @"file://"))
  {
    CFStringRef v8 = CFStringCreateWithFormat(v5, 0, @"file://%@", v7);
    CFRelease(v7);
    CFStringRef v7 = v8;
  }
  CFURLRef v9 = CFURLCreateWithString(v5, v7, 0);
  CFRelease(v7);
  BOOL v10 = SVGDocument::read(this, v9, a3);
  if (v9) {
    CFRelease(v9);
  }
  return v10;
}

BOOL SVGDocument::read(SVGDocument *this, CFURLRef url, SVGReaderOptions *a3)
{
  uint64_t v3 = a3;
  uint64_t v13 = 0;
  char v14 = 0;
  uint64_t v15 = 0;
  int v16 = 0;
  char v17 = 1;
  int v18 = 0;
  if (a3) {
    CFStringRef v6 = (int *)a3;
  }
  else {
    CFStringRef v6 = (int *)&v13;
  }
  if (v6[6] < 1)
  {
    if (!a3) {
      uint64_t v3 = (SVGReaderOptions *)&v13;
    }
    CFURLRef v9 = (const void *)*((void *)v3 + 2);
    if (v9) {
      CFRelease(v9);
    }
    *((void *)v3 + 2) = 0;
  }
  else
  {
    CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], url);
    CFStringRef v8 = (SVGReaderOptions *)&v13;
    if (v3) {
      CFStringRef v8 = v3;
    }
    *((void *)v8 + 2) = PathComponent;
  }
  CFDataWithContentsOfURL = CreateCFDataWithContentsOfURL(url);
  BOOL v11 = SVGDocument::read(this, CFDataWithContentsOfURL, (SVGReaderOptions *)v6);
  if (CFDataWithContentsOfURL) {
    CFRelease(CFDataWithContentsOfURL);
  }
  SVGReaderOptions::~SVGReaderOptions((SVGReaderOptions *)&v13);
  return v11;
}

void sub_210A38C08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SVGReaderOptions::~SVGReaderOptions((SVGReaderOptions *)va);
  _Unwind_Resume(a1);
}

BOOL SVGDocument::checkProfileSettings(SVGDocument *this, CFDataRef theData)
{
  v84[3] = *MEMORY[0x263EF8340];
  if (CFDataGetLength(theData) < 32001)
  {
    LODWORD(v69) = 105;
    std::string::basic_string[abi:ne180100]<0>(&v70, "http://www.w3.org/2000/svg");
    int v73 = 64;
    std::string::basic_string[abi:ne180100]<0>(v74, "1.2");
    int v75 = 106;
    std::string::basic_string[abi:ne180100]<0>(v76, "tiny-ps");
    std::map<SVGAtom::Name,std::string>::map[abi:ne180100]((uint64_t)&v67, (unsigned int *)&v69, 3);
    for (uint64_t i = 0; i != -12; i -= 4)
    {
      if (SHIBYTE(v76[i + 2]) < 0) {
        operator delete((void *)v76[i]);
      }
    }
    CFStringRef v8 = v67;
    if (v67 != v68)
    {
      while (1)
      {
        CFURLRef v9 = (SVGAttribute *)SVGAttributeMap::attribute(*(void *)(*((void *)this + 6) + 56), *((_DWORD *)v8 + 8));
        if (!v9) {
          break;
        }
        BOOL v10 = (unsigned __int8 *)SVGAttribute::stringValue(v9);
        uint64_t v11 = v10[23];
        if ((v11 & 0x80u) == 0) {
          double v12 = (char *)v10[23];
        }
        else {
          double v12 = (char *)*((void *)v10 + 1);
        }
        uint64_t v13 = (char *)*((unsigned __int8 *)v8 + 63);
        int v14 = (char)v13;
        if ((char)v13 < 0) {
          uint64_t v13 = v8[6];
        }
        if (v12 != v13) {
          break;
        }
        if (v14 >= 0) {
          uint64_t v15 = (char *)(v8 + 5);
        }
        else {
          uint64_t v15 = v8[5];
        }
        if ((v11 & 0x80) != 0)
        {
          if (memcmp(*(const void **)v10, v15, *((void *)v10 + 1))) {
            break;
          }
        }
        else if (v10[23])
        {
          while (*v10 == *v15)
          {
            ++v10;
            ++v15;
            if (!--v11) {
              goto LABEL_24;
            }
          }
          break;
        }
LABEL_24:
        int v16 = v8[1];
        if (v16)
        {
          do
          {
            char v17 = (char **)v16;
            int v16 = *(char **)v16;
          }
          while (v16);
        }
        else
        {
          do
          {
            char v17 = (char **)v8[2];
            BOOL v18 = *v17 == (char *)v8;
            CFStringRef v8 = v17;
          }
          while (!v18);
        }
        CFStringRef v8 = v17;
        if (v17 == v68) {
          goto LABEL_30;
        }
      }
      std::string v22 = SVGAtom::ToString(*((_DWORD *)v8 + 8));
      uint64_t v24 = v8 + 5;
      if (*((char *)v8 + 63) < 0) {
        uint64_t v24 = (void *)*v24;
      }
      SVGUtilities::error((SVGUtilities *)"\nTiny SVG P/S profile requires attribute: %s with value: %s on root node", v23, v22, v24);
      BOOL v6 = 0;
      goto LABEL_123;
    }
LABEL_30:
    std::string::basic_string[abi:ne180100]<0>(v65, "title");
    v62 = 0;
    v63 = 0;
    uint64_t v64 = 0;
    SVGNode::findChildNodesWithName(*((void *)this + 6), (unsigned __int8 *)v65, &v62);
    if (v63 - (unsigned char *)v62 != 8)
    {
      SVGUtilities::error((SVGUtilities *)"SVG Tiny P/S profile requires title node to be present once", v19);
      BOOL v6 = 0;
LABEL_119:
      if (v62)
      {
        v63 = v62;
        operator delete(v62);
      }
      if (v66 < 0) {
        operator delete(v65[0]);
      }
LABEL_123:
      std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::destroy((uint64_t)&v67, v68[0]);
      return v6;
    }
    std::string::basic_string[abi:ne180100]<0>(&v59, (char *)&unk_210A5361E);
    int v20 = *(const char **)(*(void *)v62 + 192);
    if (v20)
    {
      if ((v20[23] & 0x80000000) == 0 || (int v20 = *(const char **)v20) != 0) {
        MEMORY[0x216677A40](&v59);
      }
    }
    if ((char)v61 < 0)
    {
      unint64_t v21 = v60;
      if (!v60) {
        goto LABEL_44;
      }
    }
    else
    {
      unint64_t v21 = v61;
      if (!v61) {
        goto LABEL_44;
      }
    }
    if (v21 < 0x41)
    {
      std::string::basic_string[abi:ne180100]<0>(v57, "desc");
      std::string __p = 0;
      uint64_t v55 = 0;
      uint64_t v56 = 0;
      SVGNode::findChildNodesWithName(*((void *)this + 6), (unsigned __int8 *)v57, &__p);
      CGAffineTransform v25 = (char *)__p;
      uint64_t v26 = v55;
      if (__p != v55)
      {
        do
        {
          std::string::basic_string[abi:ne180100]<0>(&v69, (char *)&unk_210A5361E);
          uint64_t v27 = *(const char **)(*(void *)v25 + 192);
          if (v27)
          {
            if ((v27[23] & 0x80000000) == 0 || (uint64_t v27 = *(const char **)v27) != 0) {
              MEMORY[0x216677A40](&v69);
            }
          }
          if (SHIBYTE(v71) < 0)
          {
            if (!v70)
            {
LABEL_100:
              SVGUtilities::error((SVGUtilities *)"\nSVG Tiny P/S profile requires that description node must not be empty", v27);
              if (SHIBYTE(v71) < 0) {
                operator delete(v69);
              }
              BOOL v6 = 0;
              goto LABEL_113;
            }
            operator delete(v69);
          }
          else if (!HIBYTE(v71))
          {
            goto LABEL_100;
          }
          v25 += 8;
        }
        while (v25 != v26);
      }
      std::string::basic_string[abi:ne180100]<0>(&v69, "image");
      std::string::basic_string[abi:ne180100]<0>(&v72, "switch");
      std::list<std::string>::list(v53, (uint64_t)&v69, 2);
      for (uint64_t j = 0; j != -6; j -= 3)
      {
        if (SHIBYTE(v74[j]) < 0) {
          operator delete(*(void **)((char *)&v72 + j * 8));
        }
      }
      for (uint64_t k = v53[1]; (uint64_t *)k != v53; uint64_t k = *(void *)(k + 8))
      {
        uint64_t v30 = (void *)(k + 16);
        if (SVGNode::hasChildNodeWithName(*((void *)this + 6), (unsigned __int8 *)(k + 16)))
        {
          if (*(char *)(k + 39) < 0) {
            uint64_t v30 = (void *)*v30;
          }
          SVGUtilities::error((SVGUtilities *)"\nSVG Tiny P/S profile does not allow %s node", v31, v30);
          BOOL v6 = 0;
          goto LABEL_112;
        }
      }
      LODWORD(v69) = 107;
      std::string::basic_string[abi:ne180100]<0>(&v70, "disable");
      int v73 = 108;
      std::string::basic_string[abi:ne180100]<0>(v74, "false");
      int v75 = 109;
      std::string::basic_string[abi:ne180100]<0>(v76, "false");
      int v77 = 110;
      std::string::basic_string[abi:ne180100]<0>(v78, "none");
      int v79 = 111;
      std::string::basic_string[abi:ne180100]<0>(v80, "all");
      int v81 = 112;
      std::string::basic_string[abi:ne180100]<0>(v82, "onLoad");
      int v83 = 113;
      std::string::basic_string[abi:ne180100]<0>(v84, "none");
      std::map<SVGAtom::Name,std::string>::map[abi:ne180100]((uint64_t)&v51, (unsigned int *)&v69, 7);
      for (uint64_t m = 0; m != -28; m -= 4)
      {
        if (SHIBYTE(v84[m + 2]) < 0) {
          operator delete((void *)v84[m]);
        }
      }
      uint64_t v33 = v51;
      if (v51 == v52)
      {
LABEL_96:
        unint64_t v69 = 0;
        double v70 = 0;
        uint64_t v71 = 0;
        SVGNode::findChildAttributesWithName(*((uint64_t **)this + 6), 18, (void **)&v69);
        SVGNode::findChildAttributesWithName(*((uint64_t **)this + 6), 57, (void **)&v69);
        v46 = v69;
        unint64_t v47 = ((v70 - v69) >> 3) - 3;
        BOOL v6 = v47 < 0xFFFFFFFFFFFFFFFELL;
        if (v47 >= 0xFFFFFFFFFFFFFFFELL)
        {
          SVGUtilities::error((SVGUtilities *)"\nSVG Tiny P/S profile requires at least two colors in the document", v45);
          v46 = v69;
        }
        if (v46)
        {
          double v70 = v46;
          operator delete(v46);
        }
      }
      else
      {
        while (1)
        {
          unint64_t v69 = 0;
          double v70 = 0;
          uint64_t v71 = 0;
          SVGNode::findChildAttributesWithName(*((uint64_t **)this + 6), *((unsigned int *)v33 + 8), (void **)&v69);
          uint64_t v34 = v69;
          uint64_t v35 = v70;
          if (v69 != v70) {
            break;
          }
LABEL_88:
          if (v34)
          {
            double v70 = v34;
            operator delete(v34);
          }
          double v43 = v33[1];
          if (v43)
          {
            do
            {
              uint64_t v44 = (char **)v43;
              double v43 = *(char **)v43;
            }
            while (v43);
          }
          else
          {
            do
            {
              uint64_t v44 = (char **)v33[2];
              BOOL v18 = *v44 == (char *)v33;
              uint64_t v33 = v44;
            }
            while (!v18);
          }
          uint64_t v33 = v44;
          if (v44 == v52) {
            goto LABEL_96;
          }
        }
        double v36 = (unsigned __int8 **)(v33 + 5);
        while (1)
        {
          uint64_t v37 = (unsigned __int8 *)SVGAttribute::stringValue(*(SVGAttribute **)v34);
          uint64_t v38 = v37[23];
          if ((v38 & 0x80u) == 0) {
            float64x2_t v39 = (char *)v37[23];
          }
          else {
            float64x2_t v39 = (char *)*((void *)v37 + 1);
          }
          uint64_t v40 = (char *)*((unsigned __int8 *)v33 + 63);
          int v41 = (char)v40;
          if ((char)v40 < 0) {
            uint64_t v40 = v33[6];
          }
          if (v39 != v40) {
            break;
          }
          if (v41 >= 0) {
            uint64_t v42 = (unsigned __int8 *)(v33 + 5);
          }
          else {
            uint64_t v42 = *v36;
          }
          if ((v38 & 0x80) != 0)
          {
            if (memcmp(*(const void **)v37, v42, *((void *)v37 + 1))) {
              break;
            }
          }
          else if (v37[23])
          {
            while (*v37 == *v42)
            {
              ++v37;
              ++v42;
              if (!--v38) {
                goto LABEL_86;
              }
            }
            break;
          }
LABEL_86:
          v34 += 8;
          if (v34 == v35)
          {
            uint64_t v34 = v69;
            goto LABEL_88;
          }
        }
        uint64_t v48 = SVGAtom::ToString(*(_DWORD *)(*(void *)v34 + 48));
        if (*((char *)v33 + 63) < 0) {
          double v36 = (unsigned __int8 **)*v36;
        }
        SVGUtilities::error((SVGUtilities *)"\nSVG Tiny P/S profile requires that if attribute : %s is present it needs to have the value: %s", v49, v48, v36);
        if (v69)
        {
          double v70 = v69;
          operator delete(v69);
        }
        BOOL v6 = 0;
      }
      std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::destroy((uint64_t)&v51, v52[0]);
LABEL_112:
      std::__list_imp<std::string>::clear(v53);
LABEL_113:
      if (__p)
      {
        uint64_t v55 = (char *)__p;
        operator delete(__p);
      }
      if (v58 < 0) {
        operator delete(v57[0]);
      }
      goto LABEL_117;
    }
LABEL_44:
    SVGUtilities::error((SVGUtilities *)"\nSVG Tiny P/S profile requires a title string that is not empty and is no more than 64 characters in length", v20);
    BOOL v6 = 0;
LABEL_117:
    if ((char)v61 < 0) {
      operator delete(v59);
    }
    goto LABEL_119;
  }
  CFIndex Length = CFDataGetLength(theData);
  SVGUtilities::error((SVGUtilities *)"File size for Tiny SVG P/S profile needs to be less that 32 kilobytes. File size for given file is: %zu bytes", v5, Length);
  return 0;
}

void sub_210A393C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,char a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  std::__list_imp<std::string>::clear(&a15);
  if (__p)
  {
    a19 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  v52 = a33;
  if (a33)
  {
    *(void *)(v50 + 8) = a33;
    operator delete(v52);
  }
  if (a41 < 0) {
    operator delete(*(void **)(v50 + 24));
  }
  std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::destroy((uint64_t)&a42, *(char **)(v50 + 56));
  _Unwind_Resume(a1);
}

__CFData *CreateCFDataWithContentsOfURL(CFURLRef fileURL)
{
  v12[1] = *MEMORY[0x263EF8340];
  if (!fileURL) {
    return 0;
  }
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v2 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], fileURL);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  if (!CFReadStreamOpen(v2))
  {
    CFRelease(v3);
    return 0;
  }
  Mutable = CFDataCreateMutable(v1, 0);
  BOOL v6 = (CFIndex *)MEMORY[0x263EF8AF8];
  if ((explicit & 1) == 0
  {
    CreateCFDataWithContentsOfURL(__CFURL const*)::kBufferCFIndex Length = *v6;
  }
  MEMORY[0x270FA5388]();
  CFStringRef v8 = (UInt8 *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFIndex v9 = CFReadStreamRead(v3, v8, *v6);
  if (v9 >= 1)
  {
    for (uint64_t i = v9; i > 0; uint64_t i = CFReadStreamRead(v3, v8, *v6))
      CFDataAppendBytes(Mutable, v8, i);
  }
  CFReadStreamClose(v3);
  CFRelease(v3);
  return Mutable;
}

BOOL SVGDocument::read(SVGDocument *this, CGDataProviderRef provider, SVGReaderOptions *a3)
{
  CFDataRef v5 = CGDataProviderCopyData(provider);
  BOOL v6 = SVGDocument::read(this, v5, a3);
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

BOOL SVGDocument::write(uint64_t a1, const char *a2, uint64_t a3)
{
  SVGWriter::SVGWriter((uint64_t)v8, a3);
  BOOL v5 = SVGWriter::write((SVGWriter *)v8, *(SVGRootNode **)(a1 + 48), a2, *(const SVGStyle **)(a1 + 64));
  SVGPathCommand::TypeFromCharacter((SVGPathCommand *)v8, v6);
  return v5;
}

void sub_210A397EC(_Unwind_Exception *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL SVGDocument::write(uint64_t a1, __CFData *a2, uint64_t a3)
{
  SVGWriter::SVGWriter((uint64_t)v8, a3);
  BOOL v5 = SVGWriter::write((SVGWriter *)v8, *(SVGRootNode **)(a1 + 48), a2, *(const SVGStyle **)(a1 + 64));
  SVGPathCommand::TypeFromCharacter((SVGPathCommand *)v8, v6);
  return v5;
}

void sub_210A3985C(_Unwind_Exception *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL SVGDocument::write(uint64_t a1, const __CFURL *a2, uint64_t a3)
{
  SVGWriter::SVGWriter((uint64_t)v8, a3);
  BOOL v5 = SVGWriter::write((SVGWriter *)v8, *(SVGRootNode **)(a1 + 48), a2, *(const SVGStyle **)(a1 + 64));
  SVGPathCommand::TypeFromCharacter((SVGPathCommand *)v8, v6);
  return v5;
}

void sub_210A398CC(_Unwind_Exception *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t SVGDocument::canvas(SVGDocument *this)
{
  if (!*((void *)this + 7)) {
    operator new();
  }
  return *((void *)this + 7);
}

void sub_210A39934(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C405E75A9C0);
  _Unwind_Resume(a1);
}

uint64_t SVGDocument::hasWideGamutContent(SVGDocument *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 6) + 40))();
}

uint64_t SVGDocument::hasMonochromeContent(SVGDocument *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 6) + 56))();
}

uint64_t SVGDocument::hasNodeWithName(uint64_t a1, unsigned __int8 *a2)
{
  return SVGNode::hasChildNodeWithName(*(void *)(a1 + 48), a2);
}

void SVGDocument::findNodesWithName(uint64_t a1, unsigned __int8 *a2, void **a3)
{
}

void SVGDocument::findAttributesWithName(uint64_t a1, uint64_t a2, void **a3)
{
}

void std::__list_imp<std::string>::clear(void *a1)
{
  if (a1[2])
  {
    uint64_t v3 = *a1;
    uint64_t v2 = a1[1];
    double v4 = *(void **)v2;
    v4[1] = *(void *)(*a1 + 8);
    **(void **)(v3 + 8) = v4;
    a1[2] = 0;
    while ((void *)v2 != a1)
    {
      uint64_t v5 = *(void *)(v2 + 8);
      std::__list_imp<std::string>::__delete_node[abi:ne180100]<>((int)a1, (void **)v2);
      uint64_t v2 = v5;
    }
  }
}

void std::__list_imp<std::string>::__delete_node[abi:ne180100]<>(int a1, void **__p)
{
  if (*((char *)__p + 39) < 0) {
    operator delete(__p[2]);
  }
  operator delete(__p);
}

uint64_t std::map<SVGAtom::Name,std::string>::map[abi:ne180100](uint64_t a1, unsigned int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  double v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::__emplace_hint_unique_key_args<SVGAtom::Name,std::pair<SVGAtom::Name const,std::string> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 8;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_210A39AD0(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::__emplace_hint_unique_key_args<SVGAtom::Name,std::pair<SVGAtom::Name const,std::string> const&>(uint64_t **a1, uint64_t *a2, unsigned int *a3, uint64_t a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::__find_equal<SVGAtom::Name>(a1, a2, &v10, &v9, a3);
  uint64_t result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::__construct_node<std::pair<SVGAtom::Name const,std::string> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::__find_equal<SVGAtom::Name>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, unsigned int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (unsigned int v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    CFStringRef v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      BOOL v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      uint64_t v9 = (uint64_t *)*a2;
      do
      {
        BOOL v10 = v9;
        uint64_t v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      uint64_t v13 = a2;
      do
      {
        BOOL v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        uint64_t v13 = v10;
      }
      while (v14);
    }
    unsigned int v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          char v17 = (uint64_t *)v16;
          unsigned int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      char v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    double v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      double v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          unint64_t v21 = (uint64_t *)v20;
          unsigned int v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      unint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__tree<std::__value_type<SVGAtom::Name,std::string>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,std::string>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,std::string>>>::__construct_node<std::pair<SVGAtom::Name const,std::string> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  unsigned int v6 = (char *)operator new(0x40uLL);
  *(void *)(a3 + 8) = v5;
  *(void *)a3 = v6;
  *(unsigned char *)(a3 + 16) = 0;
  *((_DWORD *)v6 + 8) = *(_DWORD *)a2;
  unsigned int v7 = (std::string *)(v6 + 40);
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)(a2 + 8);
    v7->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
  }
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_210A39DA4(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<SVGAtom::Name,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<SVGAtom::Name,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 63) < 0) {
      operator delete(__p[5]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *std::list<std::string>::list(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  *a1 = (uint64_t)a1;
  a1[1] = (uint64_t)a1;
  a1[2] = 0;
  if (a3)
  {
    uint64_t v5 = 24 * a3;
    do
    {
      unsigned int v6 = std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>((uint64_t)a1, 0, 0, a2);
      uint64_t v7 = *a1;
      *unsigned int v6 = *a1;
      v6[1] = a1;
      *(void *)(v7 + 8) = v6;
      *a1 = (uint64_t)v6;
      ++a1[2];
      a2 += 24;
      v5 -= 24;
    }
    while (v5);
  }
  return a1;
}

void sub_210A39EA0(_Unwind_Exception *a1)
{
  std::__list_imp<std::string>::clear(v1);
  _Unwind_Resume(a1);
}

void *std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = operator new(0x28uLL);
  void *v7 = a2;
  v7[1] = a3;
  CFStringRef v8 = (std::string *)(v7 + 2);
  if (*(char *)(a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = *(_OWORD *)a4;
    v7[4] = *(void *)(a4 + 16);
  }
  return v7;
}

void sub_210A39F1C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t CGSVGColorCreateWithRGBA@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  *(void *)(a2 + 32) = 0;
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(_DWORD *)(a2 + 32) = result;
  return result;
}

void CGSVGColorCreateRGBA(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *(void *)(a1 + 32) = 0;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(double *)(a1 + 16) = a4;
  *(double *)(a1 + 24) = a5;
}

void CGSVGColorCreateDisplayP3(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *(void *)(a1 + 32) = 1;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(double *)(a1 + 16) = a4;
  *(double *)(a1 + 24) = a5;
}

BOOL CGSVGColorCreateFromCString@<W0>(BOOL result@<X0>, uint64_t a2@<X8>)
{
  if (result
    && (uint64_t v3 = (SVGColor *)result,
        SVGColor::SVGColor((uint64_t)v6, 0, 0.0, 0.0, 0.0, 1.0),
        uint64_t result = SVGColor::GetColorWithString(v3, (double *)v6, v4)))
  {
    *(void *)(a2 + 32) = 0;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    if (v7 == 15) {
      *(_DWORD *)(a2 + 32) = 1;
    }
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    *(void *)(a2 + 24) = 0x3FF0000000000000;
    *(void *)(a2 + 32) = 0;
  }
  return result;
}

const __CFString *CGSVGColorCreateFromString@<X0>(const __CFString *result@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (result)
  {
    CFStringGetCString(result, buffer, 128, 0x8000100u);
    return (const __CFString *)CGSVGColorCreateFromCString((BOOL)buffer, (uint64_t)a2);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = 0x3FF0000000000000;
    a2[4] = 0;
  }
  return result;
}

CGColorRef CGSVGColorCreateCGColor(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2)
  {
    if (v2 == 2)
    {
      uint64_t v3 = (const __CFString **)MEMORY[0x263F00238];
    }
    else
    {
      if (v2 != 1)
      {
        CFStringRef v4 = 0;
        goto LABEL_9;
      }
      uint64_t v3 = (const __CFString **)MEMORY[0x263F001E8];
    }
  }
  else
  {
    uint64_t v3 = (const __CFString **)MEMORY[0x263F002D8];
  }
  CFStringRef v4 = *v3;
LABEL_9:
  long long v5 = CGColorSpaceCreateWithName(v4);
  long long v6 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v6;
  CGColorRef v7 = CGColorCreate(v5, (const CGFloat *)v9);
  CGColorSpaceRelease(v5);
  return v7;
}

void CGSVGDrawState::CGSVGDrawState(CGSVGDrawState *this, const CGSVGDrawState *a2)
{
  *(_WORD *)this = 0;
  *((_DWORD *)this + 1) = 0;
  *(_OWORD *)((char *)this + 8) = xmmword_210A52E80;
  *((void *)this + 7) = 0;
  int v2 = (char *)this + 56;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 3) = 0;
  *((unsigned char *)this + 48) = 0;
  *((void *)this + 8) = 0;
  *((unsigned char *)this + 72) = 0;
  long long v3 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  *((_OWORD *)this + 5) = *MEMORY[0x263F001A8];
  *((_OWORD *)this + 6) = v3;
  *((void *)this + 14) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)((char *)this + 120) = _Q0;
  *((void *)this + 17) = 0x3FF0000000000000;
  *((unsigned char *)this + 144) = 0;
  *((void *)this + 25) = 0;
  *(_OWORD *)((char *)this + 180) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  if (this == a2) {
    CGSVGDrawState::CGSVGDrawState();
  }
  uint64_t v11 = (_OWORD *)((char *)this + 80);
  *(_WORD *)this = *(_WORD *)a2;
  *((_DWORD *)this + 1) = *((_DWORD *)a2 + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  CGSVGDrawState::setFontFamily(this, *((CFTypeRef *)a2 + 25));
  *((_OWORD *)this + 1) = *((_OWORD *)a2 + 1);
  long long v12 = *((_OWORD *)a2 + 2);
  *((void *)this + 6) = *((void *)a2 + 6);
  *((_OWORD *)this + 2) = v12;
  long long v13 = *(_OWORD *)((char *)a2 + 56);
  *((void *)v2 + 2) = *((void *)a2 + 9);
  *(_OWORD *)int v2 = v13;
  long long v14 = *((_OWORD *)a2 + 6);
  _OWORD *v11 = *((_OWORD *)a2 + 5);
  v11[1] = v14;
  *((void *)this + 14) = *((void *)a2 + 14);
  *(_OWORD *)((char *)this + 120) = *(_OWORD *)((char *)a2 + 120);
  *((void *)this + 17) = *((void *)a2 + 17);
  *((unsigned char *)this + 144) = *((unsigned char *)a2 + 144);
  *((void *)this + 19) = *((void *)a2 + 19);
  long long v15 = *((_OWORD *)a2 + 10);
  long long v16 = *((_OWORD *)a2 + 11);
  *((void *)this + 24) = *((void *)a2 + 24);
  *((_OWORD *)this + 10) = v15;
  *((_OWORD *)this + 11) = v16;
}

void *CGSVGDrawState::setFontFamily(void *this, CFTypeRef cf)
{
  if (cf)
  {
    long long v3 = this;
    CFStringRef v4 = (const void *)this[25];
    if (v4)
    {
      CFRelease(v4);
      v3[25] = 0;
    }
    this = CFRetain(cf);
    v3[25] = this;
  }
  return this;
}

void CGSVGDrawState::~CGSVGDrawState(CGSVGDrawState *this)
{
  uint64_t v1 = (const void *)*((void *)this + 25);
  if (v1) {
    CFRelease(v1);
  }
}

void *CGContextDrawSVGDocument(CGContext *a1, const char *a2)
{
  RootNode = (const char *)CGSVGDocumentGetRootNode((uint64_t)a2, a2);
  return CGContextDrawSVGNodeWithOptions(a1, RootNode, 0);
}

void *CGContextDrawSVGDocumentWithOptions(CGContext *a1, const char *a2, const __CFDictionary *a3)
{
  RootNode = (const char *)CGSVGDocumentGetRootNode((uint64_t)a2, a2);
  return CGContextDrawSVGNodeWithOptions(a1, RootNode, a3);
}

void *CGContextDrawSVGNodeWithOptions(CGContext *a1, const char *a2, const __CFDictionary *a3)
{
  uint64_t result = CFRetained::getObject<SVGNode>((uint64_t)a2, a2);
  if (a1)
  {
    CFStringRef v8 = result;
    if (result)
    {
      memset(v42, 0, sizeof(v42));
      while (1)
      {
        uint64_t v9 = v8[6];
        if (!v9) {
          break;
        }
        CFStringRef v8 = (void *)v8[6];
        uint64_t v20 = *(void *)(v9 + 40);
        std::vector<CGSVGNode *>::insert((uint64_t)v42, v42[0], &v20);
      }
      uint64_t v10 = v8[5];
      if (!a3 || !CFDictionaryGetValue(a3, @"drawingDefinition"))
      {
        GetCanvasSize(v10, v7);
        double v12 = v11;
        CGContextSaveGState(a1);
        CGContextScaleCTM(a1, 1.0, -1.0);
        CGContextTranslateCTM(a1, 0.0, -v12);
      }
      long long v41 = 0u;
      long long v40 = 0u;
      long long v39 = 0u;
      uint64_t v38 = a1;
      LOWORD(v20) = 0;
      HIDWORD(v20) = 0;
      long long v21 = xmmword_210A52E80;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v22 = 0;
      char v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      char v28 = 0;
      long long v13 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      long long v29 = *MEMORY[0x263F001A8];
      long long v30 = v13;
      __asm { FMOV            V1.2D, #1.0 }
      long long v32 = _Q1;
      uint64_t v31 = 0;
      uint64_t v33 = 0x3FF0000000000000;
      char v34 = 0;
      uint64_t v37 = 0;
      memset(v36, 0, sizeof(v36));
      long long v35 = 0u;
      *(void *)&long long v41 = std::vector<CGSVGDrawState>::__push_back_slow_path<CGSVGDrawState>((uint64_t *)&v40 + 1, (const CGSVGDrawState *)&v20);
      CGSVGDrawState::~CGSVGDrawState((CGSVGDrawState *)&v20);
      *(void *)&long long v39 = a2;
      if (a3)
      {
        *((void *)&v39 + 1) = CFDictionaryGetValue(a3, @"willDraw");
        Value = (SVGAttributeMap *)CFDictionaryGetValue(a3, @"didDraw");
        *(void *)&long long v40 = Value;
      }
      CGSVGAttributeMapCreateWithDefaults(Value);
    }
  }
  return result;
}

void sub_210A3A6F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  uint64_t v23 = *(void **)(v21 - 104);
  if (v23)
  {
    *(void *)(v21 - 96) = v23;
    operator delete(v23);
  }
  _Unwind_Resume(exception_object);
}

void *CGContextDrawSVGNode(CGContext *a1, const char *a2)
{
  return CGContextDrawSVGNodeWithOptions(a1, a2, 0);
}

char *std::vector<CGSVGNode *>::insert(uint64_t a1, char *__src, void *a3)
{
  CFStringRef v4 = __src;
  long long v6 = *(char **)(a1 + 8);
  unint64_t v9 = *(void *)(a1 + 16);
  uint64_t v7 = a1 + 16;
  unint64_t v8 = v9;
  if ((unint64_t)v6 >= v9)
  {
    long long v14 = *(unsigned char **)a1;
    unint64_t v15 = ((uint64_t)&v6[-*(void *)a1] >> 3) + 1;
    if (v15 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v16 = (__src - v14) >> 3;
    uint64_t v17 = v8 - (void)v14;
    if (v17 >> 2 > v15) {
      unint64_t v15 = v17 >> 2;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v15;
    }
    uint64_t v25 = v7;
    if (v18) {
      uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v7, v18);
    }
    else {
      uint64_t v19 = 0;
    }
    std::string __p = v19;
    uint64_t v22 = &v19[8 * v16];
    uint64_t v23 = v22;
    uint64_t v24 = &v19[8 * v18];
    std::__split_buffer<CGSVGNode *>::push_back(&__p, a3);
    CFStringRef v4 = std::vector<CGSVGNode *>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v23 != v22) {
      v23 += (v22 - v23 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    *(void *)__src = *a3;
    *(void *)(a1 + 8) = __src + 8;
  }
  else
  {
    uint64_t v10 = __src + 8;
    double v11 = v6 - 8;
    double v12 = v6;
    while (v11 < v6)
    {
      uint64_t v13 = *(void *)v11;
      v11 += 8;
      *(void *)double v12 = v13;
      v12 += 8;
    }
    *(void *)(a1 + 8) = v12;
    if (v6 != v10) {
      memmove(&v6[-8 * ((v6 - v10) >> 3)], __src, v6 - v10);
    }
    *(void *)CFStringRef v4 = *a3;
  }
  return v4;
}

void sub_210A3A8C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double GetCanvasSize(uint64_t a1, const char *a2)
{
  if (CGSVGNodeGetType(a1, a2))
  {
    CGSVGNodeGetBoundingBox(a1);
    return v4;
  }
  double result = CGSVGViewBoxNodeGetSize(a1, v3);
  if (result < 1.0 || v7 < 1.0)
  {
    CGSVGViewBoxNodeGetViewbox(a1, v5);
    return v4;
  }
  return result;
}

void ApplyCGSVGAttributes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(CGContext **)a1;
  uint64_t Attribute = CGSVGAttributeMapGetAttribute(a2, (const char *)0x13);
  if (Attribute)
  {
    double v22 = 1.0;
    Float = (SVGUtilities *)CGSVGAttributeGetFloat(Attribute, (char *)&v22);
    if (Float) {
      *(double *)(*(void *)(a1 + 40) - 88) = SVGUtilities::CGFloatClamp(Float, v22, 0.0, 1.0)
    }
                                               * *(double *)(*(void *)(a1 + 40) - 88);
  }
  uint64_t v9 = CGSVGAttributeMapGetAttribute(a2, (const char *)0x3A);
  if (v9)
  {
    double v22 = 1.0;
    uint64_t v10 = (SVGUtilities *)CGSVGAttributeGetFloat(v9, (char *)&v22);
    if (v10) {
      *(double *)(*(void *)(a1 + 40) - 80) = SVGUtilities::CGFloatClamp(v10, v22, 0.0, 1.0)
    }
                                               * *(double *)(*(void *)(a1 + 40) - 80);
  }
  uint64_t v11 = CGSVGAttributeMapGetAttribute(a2, (const char *)0xC);
  if (v11)
  {
    uint64_t v13 = v11;
    size_t FloatCount = (size_t)CGSVGAttributeGetFloatCount(v11, v12);
    if (FloatCount)
    {
      size_t v15 = FloatCount;
      uint64_t v16 = (char *)malloc_type_malloc(8 * FloatCount, 0x100004000313F17uLL);
      CGSVGAttributeGetFloats(v13, v16);
      double v22 = 0.0;
      uint64_t v17 = CGSVGAttributeMapGetAttribute(a2, (const char *)0xD);
      if (v17)
      {
        CGSVGAttributeGetFloat(v17, (char *)&v22);
        CGFloat v18 = v22;
      }
      else
      {
        CGFloat v18 = 0.0;
      }
      CGContextSetLineDash(*(CGContextRef *)a1, v18, (const CGFloat *)v16, v15);
      free(v16);
    }
  }
  double v22 = 0.0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2000000000;
  char v25 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 0x40000000;
  v21[2] = ___ZL20ApplyCGSVGAttributesP21CGSVGDrawStateContextP17CGSVGAttributeMapP9CGSVGNode_block_invoke;
  v21[3] = &unk_2641875D8;
  v21[6] = a1;
  v21[7] = a3;
  v21[4] = &v22;
  v21[5] = v6;
  CGSVGAttributeMapEnumerate(a2, (const char *)v21);
  if (*((unsigned char *)v23 + 24))
  {
    if (a3)
    {
      uint64_t v20 = (void *)(a1 + 40);
      if (CGSVGNodeGetType(a3, v19) == 2 && (!*(unsigned char *)(*v20 - 208) || !*(unsigned char *)(*v20 - 207))) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v20 = (void *)(a1 + 40);
    }
    CGContextBeginTransparencyLayer(v6, 0);
    *(unsigned char *)(*v20 - 64) = 1;
  }
LABEL_21:
  _Block_object_dispose(&v22, 8);
}

void sub_210A3AB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PushSVGNodeAttributes(uint64_t a1, uint64_t a2)
{
  CGContextSaveGState(*(CGContextRef *)a1);
  CGSVGDrawState::CGSVGDrawState((CGSVGDrawState *)v8, (const CGSVGDrawState *)(*(void *)(a1 + 40) - 208));
  v8[144] = 0;
  unint64_t v4 = *(void *)(a1 + 40);
  if (v4 >= *(void *)(a1 + 48))
  {
    uint64_t v6 = std::vector<CGSVGDrawState>::__push_back_slow_path<CGSVGDrawState const&>((uint64_t *)(a1 + 32), (const CGSVGDrawState *)v8);
  }
  else
  {
    CGSVGDrawState::CGSVGDrawState(*(CGSVGDrawState **)(a1 + 40), (const CGSVGDrawState *)v8);
    uint64_t v6 = v4 + 208;
    *(void *)(a1 + 40) = v4 + 208;
  }
  *(void *)(a1 + 40) = v6;
  AttributeMap = CGSVGNodeGetAttributeMap(a2, v5);
  ApplyCGSVGAttributes(a1, (uint64_t)AttributeMap, a2);
  CGSVGDrawState::~CGSVGDrawState((CGSVGDrawState *)v8);
}

void sub_210A3AC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void PopSVGNodeAttributes(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(CGContext **)a1;
  CGSVGDrawState::CGSVGDrawState((CGSVGDrawState *)v27, (const CGSVGDrawState *)(*(void *)(a1 + 40) - 208));
  CGSVGDrawState::~CGSVGDrawState((CGSVGDrawState *)(*(void *)(a1 + 40) - 208));
  *(void *)(a1 + 40) = v6;
  if (v27[144]) {
    CGContextEndTransparencyLayer(v4);
  }
  AttributeMap = CGSVGNodeGetAttributeMap(a2, v5);
  if (CGSVGAttributeMapGetAttribute((uint64_t)AttributeMap, (const char *)0x54))
  {
    uint64_t v9 = (char *)CFRetained::getObject<SVGNode>(a2, v8);
    uint64_t v10 = v9 + 64;
    if (v9[87] < 0) {
      uint64_t v10 = *(const char **)v10;
    }
    if (strcmp("g", v10))
    {
      uint64_t v28 = 0;
      double v12 = CGSVGNodeGetAttributeMap(a2, v11);
      uint64_t Attribute = CGSVGAttributeMapGetAttribute((uint64_t)v12, (const char *)0x54);
      if (Attribute)
      {
        if (CGSVGAttributeGetFilter(Attribute, (char *)&v28))
        {
          size_t v15 = (SVGFilter *)CFRetained::getObject<SVGFilter>(v28, v14);
          uint64_t v16 = *(CGContext **)a1;
          double BoundingBoxWithOptions = CGSVGNodeGetBoundingBoxWithOptions(a2, 0, 0);
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          v30.origin.CGFloat x = CGSVGNodeGetBoundingBoxWithOptions(a2, 0, 3);
          v30.origin.CGFloat y = v24;
          v30.size.double width = v25;
          v30.size.double height = v26;
          v29.origin.CGFloat x = BoundingBoxWithOptions;
          v29.origin.CGFloat y = v19;
          v29.size.double width = v21;
          v29.size.double height = v23;
          SVGFilter::draw(v15, v16, (const SVGNode *)v9, v29, v30);
        }
      }
    }
  }
  CGContextRestoreGState(v4);
  CGSVGDrawState::~CGSVGDrawState((CGSVGDrawState *)v27);
}

void sub_210A3ADD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CGSVGDrawState::~CGSVGDrawState((CGSVGDrawState *)va);
  _Unwind_Resume(a1);
}

void ___ZL20ApplyCGSVGAttributesP21CGSVGDrawStateContextP17CGSVGAttributeMapP9CGSVGNode_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if ((int)a2 <= 33)
  {
    switch((int)a2)
    {
      case 18:
        CFStringRef v6 = CGSVGAttributeCopyString(a3, a2);
        CFStringRef v7 = v6;
        if (v6 && CFEqual(v6, @"currentColor"))
        {
          uint64_t v41 = *(void *)(a1 + 48);
          uint64_t v42 = *(void *)(a1 + 56);
          uint64_t v43 = *(void *)(v41 + 40);
          long long v44 = *(_OWORD *)(v43 - 32);
          v49[0] = *(_OWORD *)(v43 - 48);
          v49[1] = v44;
          uint64_t v50 = *(void *)(v43 - 16);
          float64x2_t v45 = v49;
          int v46 = 0;
LABEL_65:
          ApplyCGSVGCurrentColor(v41, (uint64_t)v45, v46, v42);
        }
        else
        {
          v55.CGFloat a = 0.0;
          if (CGSVGAttributeGetPaint(a3, (char *)&v55))
          {
            uint64_t v8 = *(void *)(a1 + 48);
            CGFloat a = v55.a;
            int v10 = 0;
LABEL_32:
            ApplyCGSVGPaint(v8, *(const char **)&a, v10);
          }
LABEL_33:
          if (!v7) {
            return;
          }
        }
        CFRelease(v7);
        return;
      case 19:
      case 21:
      case 22:
        return;
      case 20:
        LODWORD(v55.a) = 0;
        if (CGSVGAttributeGetAtom(a3, (char *)&v55))
        {
          if (LODWORD(v55.a) == 39)
          {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 40) - 204) = 0;
          }
          else if (LODWORD(v55.a) == 17)
          {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 40) - 204) = 1;
          }
          else
          {
            SVGUtilities::log((SVGUtilities *)"Error: Given fill-rule was undefined\n", v21);
          }
        }
        return;
      case 23:
        CFStringRef v22 = CGSVGAttributeCopyString(a3, a2);
        CGSVGDrawState::setFontFamily((void *)(*(void *)(*(void *)(a1 + 48) + 40) - 208), v22);
        CFRelease(v22);
        return;
      case 24:
        v55.CGFloat a = 16.0;
        if (CGSVGAttributeGetFloat(a3, (char *)&v55)) {
          *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 40) - 200) = v55.a;
        }
        return;
      case 25:
        v55.CGFloat a = 0.0;
        if (CGSVGAttributeGetFloat(a3, (char *)&v55)) {
          *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 40) - 192) = v55.a;
        }
        return;
      default:
        if (a2 == 6)
        {
          v55.CGFloat a = 0.0;
          if (CGSVGAttributeGetClipPath(a3, (char *)&v55))
          {
            uint64_t v13 = *(CGContext ***)(a1 + 48);
            uint64_t v14 = *(void *)(a1 + 56);
            size_t v15 = *v13;
            uint64_t v16 = (SVGClipPath *)CFRetained::getObject<SVGClipPath>(*(uint64_t *)&v55.a, v12);
            double v18 = (SVGNode *)CFRetained::getObject<SVGNode>(v14, v17);
            CGClippingPath = SVGClipPath::getCGClippingPath(v16, v18);
            CGContextAddPath(v15, CGClippingPath);
            CGContextClip(v15);
          }
        }
        return;
    }
  }
  if ((int)a2 > 58)
  {
    if ((int)a2 <= 73)
    {
      if (a2 == 59)
      {
        v55.CGFloat a = 0.0;
        if (CGSVGAttributeGetFloat(a3, (char *)&v55)) {
          CGContextSetLineWidth(*(CGContextRef *)(a1 + 40), v55.a);
        }
      }
      else if (a2 == 63 && CGSVGAttributeGetFloatCount(a3, a2) == (void *)6)
      {
        CGSVGAttributeGetFloats(a3, (char *)&v55);
        uint64_t v11 = *(CGContext **)(a1 + 40);
        transforuint64_t m = v55;
        CGContextConcatCTM(v11, &transform);
      }
    }
    else
    {
      switch(a2)
      {
        case 0x4A:
          v55.CGFloat a = 0.0;
          if (CGSVGAttributeGetMask(a3, (char *)&v55))
          {
            CGRect v29 = *(CGContext ***)(a1 + 48);
            uint64_t v30 = *(void *)(a1 + 56);
            uint64_t v31 = *v29;
            long long v32 = (char *)CFRetained::getObject<SVGMask>(*(uint64_t *)&v55.a, v28);
            char v34 = (SVGNode *)CFRetained::getObject<SVGNode>(v30, v33);
            Masuint64_t k = (CGImage *)SVGMask::createMask((SVGMask *)v32, v34);
            CGContextClipToMask(v31, *(CGRect *)(v32 + 248), Mask);
            CGImageRelease(Mask);
          }
          break;
        case 0x9E:
          uint64_t v53 = 0;
          if (CGSVGAttributeGetPaint(a3, (char *)&v53) && CGSVGPaintGetType(v53, v36) == 1)
          {
            CGSVGPaintGetColor(v53, v37, (uint64_t)&v55);
            uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 40);
            long long v39 = *(_OWORD *)&v55.a;
            long long v40 = *(_OWORD *)&v55.c;
            *(CGFloat *)(v38 - 16) = v55.tx;
            *(_OWORD *)(v38 - 48) = v39;
            *(_OWORD *)(v38 - 32) = v40;
          }
          break;
        case 0x2710:
          v55.CGFloat a = 0.0;
          if (CGSVGAttributeGetFloat(a3, (char *)&v55)) {
            *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 40) - 184) = v55.a;
          }
          break;
      }
    }
  }
  else
  {
    switch((int)a2)
    {
      case '""':
        LODWORD(v55.a) = 0;
        if (!CGSVGAttributeGetAtom(a3, (char *)&v55)) {
          return;
        }
        switch(LODWORD(v55.a))
        {
          case 2:
            CGLineCap v5 = kCGLineCapButt;
            break;
          case 0x36:
            CGLineCap v5 = kCGLineCapSquare;
            break;
          case 0x32:
            CGLineCap v5 = kCGLineCapRound;
            break;
          default:
            return;
        }
        CGContextSetLineCap(*(CGContextRef *)(a1 + 40), v5);
        break;
      case '#':
        LODWORD(v55.a) = 0;
        if (!CGSVGAttributeGetAtom(a3, (char *)&v55)) {
          return;
        }
        switch(LODWORD(v55.a))
        {
          case 1:
            CGLineJoin v23 = kCGLineJoinBevel;
            break;
          case 0x25:
            CGLineJoin v23 = kCGLineJoinMiter;
            break;
          case 0x32:
            CGLineJoin v23 = kCGLineJoinRound;
            break;
          default:
            return;
        }
        CGContextSetLineJoin(*(CGContextRef *)(a1 + 40), v23);
        break;
      case '$':
      case '%':
      case '\'':
      case '(':
        return;
      case '&':
        v55.CGFloat a = 0.0;
        if (CGSVGAttributeGetFloat(a3, (char *)&v55)) {
          CGContextSetMiterLimit(*(CGContextRef *)(a1 + 40), v55.a);
        }
        break;
      case ')':
        v55.CGFloat a = 1.0;
        Float = (SVGUtilities *)CGSVGAttributeGetFloat(a3, (char *)&v55);
        if (Float)
        {
          double v25 = SVGUtilities::CGFloatClamp(Float, v55.a, 0.0, 1.0);
          v55.CGFloat a = v25;
          if (v25 < 1.0)
          {
            uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 40);
            CGFloat v27 = v25 * *(double *)(v26 - 72);
            *(CGFloat *)(v26 - 72) = v27;
            v55.CGFloat a = v27;
            CGContextSetAlpha(*(CGContextRef *)(a1 + 40), v27);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
          }
        }
        break;
      default:
        if (a2 == 57)
        {
          CFStringRef v20 = CGSVGAttributeCopyString(a3, a2);
          CFStringRef v7 = v20;
          if (v20 && CFEqual(v20, @"currentColor"))
          {
            uint64_t v41 = *(void *)(a1 + 48);
            uint64_t v42 = *(void *)(a1 + 56);
            uint64_t v47 = *(void *)(v41 + 40);
            long long v48 = *(_OWORD *)(v47 - 32);
            v51[0] = *(_OWORD *)(v47 - 48);
            v51[1] = v48;
            uint64_t v52 = *(void *)(v47 - 16);
            float64x2_t v45 = v51;
            int v46 = 1;
            goto LABEL_65;
          }
          v55.CGFloat a = 0.0;
          if (!CGSVGAttributeGetPaint(a3, (char *)&v55)) {
            goto LABEL_33;
          }
          uint64_t v8 = *(void *)(a1 + 48);
          CGFloat a = v55.a;
          int v10 = 1;
          goto LABEL_32;
        }
        break;
    }
  }
}

void ApplyCGSVGCurrentColor(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  CFStringRef v7 = *(CGContext **)a1;
  AttributeMap = CGSVGNodeGetAttributeMap(a4, (const char *)a2);
  uint64_t Attribute = CGSVGAttributeMapGetAttribute((uint64_t)AttributeMap, (const char *)0x9E);
  if (!Attribute)
  {
    if (a3 == 1) {
      goto LABEL_6;
    }
LABEL_9:
    *(double *)(a2 + 24) = *(double *)(*(void *)(a1 + 40) - 88) * *(double *)(a2 + 24);
    uint64_t v18 = *(void *)(a2 + 32);
    long long v15 = *(_OWORD *)(a2 + 16);
    v17[0] = *(_OWORD *)a2;
    v17[1] = v15;
    CGColor = CGSVGColorCreateCGColor((uint64_t)v17);
    goto LABEL_10;
  }
  CFStringRef v11 = CGSVGAttributeCopyString(Attribute, v10);
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  CGSVGColorCreateFromString(v11, &v23);
  v21[0] = v23;
  v21[1] = v24;
  uint64_t v22 = v25;
  CGColor = CGSVGColorCreateCGColor((uint64_t)v21);
  CFRelease(v11);
  if (a3 == 1)
  {
    if (CGColor)
    {
LABEL_7:
      CGContextSetStrokeColorWithColor(v7, CGColor);
      CGColorRelease(CGColor);
      uint64_t v14 = *(void *)(a1 + 40);
      *(void *)(v14 - 152) = 0;
      *(void *)(v14 - 144) = 0;
      *(unsigned char *)(v14 - 208) = 1;
      return;
    }
LABEL_6:
    *(double *)(a2 + 24) = *(double *)(*(void *)(a1 + 40) - 80) * *(double *)(a2 + 24);
    uint64_t v20 = *(void *)(a2 + 32);
    long long v13 = *(_OWORD *)(a2 + 16);
    v19[0] = *(_OWORD *)a2;
    v19[1] = v13;
    CGColor = CGSVGColorCreateCGColor((uint64_t)v19);
    goto LABEL_7;
  }
  if (!CGColor) {
    goto LABEL_9;
  }
LABEL_10:
  CGContextSetFillColorWithColor(v7, CGColor);
  CGColorRelease(CGColor);
  uint64_t v16 = *(void *)(a1 + 40);
  *(void *)(v16 - 176) = 0;
  *(void *)(v16 - 168) = 0;
  *(unsigned char *)(v16 - 207) = 1;
}

void ApplyCGSVGPaint(uint64_t a1, const char *a2, int a3)
{
  CFStringRef v6 = *(CGContext **)a1;
  unsigned int Type = CGSVGPaintGetType((uint64_t)a2, a2);
  if (Type == 1)
  {
    uint64_t v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    CGSVGPaintGetColor((uint64_t)a2, v8, (uint64_t)&v25);
    uint64_t v9 = *(void *)(a1 + 40);
    if (a3 == 1)
    {
      *((double *)&v26 + 1) = *(double *)(v9 - 80) * *((double *)&v26 + 1);
      uint64_t v24 = v27;
      v23[0] = v25;
      v23[1] = v26;
      CGColor = CGSVGColorCreateCGColor((uint64_t)v23);
      CGContextSetStrokeColorWithColor(v6, CGColor);
      CGColorRelease(CGColor);
      uint64_t v11 = *(void *)(a1 + 40);
      *(void *)(v11 - 152) = 0;
      *(void *)(v11 - 144) = 0;
LABEL_16:
      *(unsigned char *)(v11 - 208) = 1;
      return;
    }
    *((double *)&v26 + 1) = *(double *)(v9 - 88) * *((double *)&v26 + 1);
    uint64_t v22 = v27;
    v21[0] = v25;
    v21[1] = v26;
    uint64_t v20 = CGSVGColorCreateCGColor((uint64_t)v21);
    CGContextSetFillColorWithColor(v6, v20);
    CGColorRelease(v20);
    uint64_t v11 = *(void *)(a1 + 40);
    *(void *)(v11 - 176) = 0;
    *(void *)(v11 - 168) = 0;
LABEL_18:
    *(unsigned char *)(v11 - 207) = 1;
    return;
  }
  unsigned int v12 = Type;
  if ((Type & 0xFFFFFFFE) == 2)
  {
    Gradient = CGSVGPaintGetGradient((uint64_t)a2, v8);
    Pattern = CGSVGPaintGetPattern((uint64_t)a2, v14);
    if (v12 == 2)
    {
      uint64_t Attribute = CGSVGNodeFindAttribute((uint64_t)Gradient, (const char *)0x1C);
      if (Attribute)
      {
        CFStringRef v18 = CGSVGAttributeCopyString(Attribute, v17);
        BOOL v19 = CFStringGetCharacterAtIndex(v18, 0) == 117;
        CFRelease(v18);
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 1;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (a3 == 1)
    {
      *(void *)(v11 - 152) = Gradient;
      *(void *)(v11 - 144) = Pattern;
      *(unsigned char *)(v11 - 136) = v19;
      goto LABEL_16;
    }
    *(void *)(v11 - 176) = Gradient;
    *(void *)(v11 - 168) = Pattern;
    *(unsigned char *)(v11 - 160) = v19;
    goto LABEL_18;
  }
  if (!Type)
  {
    if (a3 == 1)
    {
      CGContextSetRGBStrokeColor(v6, 0.0, 0.0, 0.0, 1.0);
      *(unsigned char *)(*(void *)(a1 + 40) - 208) = 0;
    }
    else
    {
      CGContextSetRGBFillColor(v6, 0.0, 0.0, 0.0, 1.0);
      *(unsigned char *)(*(void *)(a1 + 40) - 207) = 0;
    }
  }
}

void *CFRetained::getObject<SVGClipPath>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

uint64_t std::vector<CGSVGDrawState>::__push_back_slow_path<CGSVGDrawState const&>(uint64_t *a1, const CGSVGDrawState *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x4EC4EC4EC4EC4EC5 * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x13B13B13B13B13BLL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x4EC4EC4EC4EC4EC5 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x9D89D89D89D89DLL) {
    unint64_t v9 = 0x13B13B13B13B13BLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  if (v9) {
    int v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGSVGDrawState>>(v7, v9);
  }
  else {
    int v10 = 0;
  }
  long long v13 = v10;
  uint64_t v14 = (CGSVGDrawState *)&v10[208 * v4];
  uint64_t v16 = &v10[208 * v9];
  CGSVGDrawState::CGSVGDrawState(v14, a2);
  long long v15 = (char *)v14 + 208;
  std::vector<CGSVGDrawState>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<CGSVGDrawState>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_210A3B8E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<CGSVGDrawState>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<CGSVGDrawState>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CGSVGDrawState>,std::reverse_iterator<CGSVGDrawState*>,std::reverse_iterator<CGSVGDrawState*>,std::reverse_iterator<CGSVGDrawState*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CGSVGDrawState>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x13B13B13B13B13CLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(208 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CGSVGDrawState>,std::reverse_iterator<CGSVGDrawState*>,std::reverse_iterator<CGSVGDrawState*>,std::reverse_iterator<CGSVGDrawState*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = 0;
  uint64_t v11 = a7 - 208;
  while (a3 + v10 != a5)
  {
    unsigned int v12 = (CGSVGDrawState *)(v11 + v10);
    v10 -= 208;
    CGSVGDrawState::CGSVGDrawState(v12, (const CGSVGDrawState *)(v10 + a3));
  }
  return a6;
}

uint64_t std::__split_buffer<CGSVGDrawState>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 208;
    CGSVGDrawState::~CGSVGDrawState((CGSVGDrawState *)(i - 208));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void ___ZL11DrawSVGNodeP21CGSVGDrawStateContextP9CGSVGNodePK14__CFDictionary_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 1)
  {
    unint64_t v138 = *(void **)(a1 + 32);
    uint64_t v139 = v138[3];
    if (v139)
    {
      (*(void (**)(void, void, uint64_t))(v139 + 16))(v138[3], *v138, a2);
      unint64_t v138 = *(void **)(a1 + 32);
    }
    PopSVGNodeAttributes((uint64_t)v138, a2);
    return;
  }
  if (a3) {
    return;
  }
  PushSVGNodeAttributes(*(void *)(a1 + 32), a2);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[2];
  if (v7) {
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 16))(v7, *v6, a2);
  }
  int Type = CGSVGNodeGetType(a2, v5);
  if (!Type)
  {
    if (!DrawFilterNodeWithDefsOnly(a2, *(const char **)(a1 + 40))) {
      return;
    }
    double v141 = *(CGContext ***)(a1 + 32);
    double CanvasSize = GetCanvasSize(a2, v140);
    double v144 = v143;
    ViewboCGFloat x = CGSVGViewBoxNodeGetViewbox(a2, v145);
    double v148 = v147;
    double v150 = v149;
    double v152 = v151;
    unsigned int AspectRatio = CGSVGViewBoxNodeGetAspectRatio(a2, v153);
    int AspectRatioMeetOrSlice = CGSVGViewBoxNodeGetAspectRatioMeetOrSlice(a2, v155);
    long long v157 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&x[0].double a = *MEMORY[0x263F000D0];
    *(_OWORD *)&x[0].c = v157;
    *(_OWORD *)&x[0].tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    if (v150 <= 0.0 || v152 <= 0.0)
    {
      long long v161 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&y[0].double a = *MEMORY[0x263F000D0];
      *(_OWORD *)&y[0].c = v161;
      *(_OWORD *)&y[0].tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGAffineTransformTranslate(x, y, -Viewbox, -v148);
LABEL_189:
      v174 = *v141;
      double Position = CGSVGViewBoxNodeGetPosition(a2, v162);
      CGContextTranslateCTM(v174, Position, v176);
      v218.origin.CGFloat x = 0.0;
      v218.origin.CGFloat y = 0.0;
      v218.size.unint64_t width = CanvasSize;
      v218.size.double height = v144;
      CGContextClipToRect(v174, v218);
      matriCGFloat x = x[0];
      CGContextConcatCTM(v174, &matrix);
      v178 = CFRetained::getObject<SVGViewBoxNode>(a2, v177);
      (*(void (**)(void *, CGContext *))(*(void *)v178 + 72))(v178, v174);
      return;
    }
    if (!AspectRatio)
    {
      long long v163 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&y[0].double a = *MEMORY[0x263F000D0];
      *(_OWORD *)&y[0].c = v163;
      *(_OWORD *)&y[0].tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGAffineTransformScale(x, y, CanvasSize / v150, v144 / v152);
      CGAffineTransform m = x[0];
      double v164 = -Viewbox;
      double v165 = -v148;
      p_CGAffineTransform m = &m;
LABEL_188:
      CGAffineTransformTranslate(&matrix, p_m, v164, v165);
      x[0] = matrix;
      goto LABEL_189;
    }
    double v158 = CanvasSize / v150;
    double v159 = v144 / v152;
    y[0].double a = CanvasSize / v150;
    matrix.double a = v144 / v152;
    if (AspectRatioMeetOrSlice) {
      BOOL v160 = v158 < v159;
    }
    else {
      BOOL v160 = v159 < v158;
    }
    p_matriCGFloat x = y;
    if (v160) {
      p_matriCGFloat x = &matrix;
    }
    double a = p_matrix->a;
    double v169 = v150 * p_matrix->a;
    long long v170 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&y[0].double a = *MEMORY[0x263F000D0];
    *(_OWORD *)&y[0].c = v170;
    *(_OWORD *)&y[0].tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    CGAffineTransformScale(x, y, a, a);
    CGAffineTransform m = x[0];
    CGAffineTransformTranslate(&matrix, &m, -Viewbox, -v148);
    x[0] = matrix;
    if (AspectRatio <= 8)
    {
      double v171 = 0.0;
      if (((1 << AspectRatio) & 0x92) != 0)
      {
LABEL_183:
        double v172 = 0.0;
        if (AspectRatio >= 4)
        {
          double v173 = v152 * a;
          if (AspectRatio - 4 > 2) {
            double v172 = v144 - v173;
          }
          else {
            double v172 = v144 * 0.5 - v173 * 0.5;
          }
        }
        CGAffineTransform v207 = x[0];
        double v164 = v171 / a;
        double v165 = v172 / a;
        p_CGAffineTransform m = &v207;
        goto LABEL_188;
      }
      if (((1 << AspectRatio) & 0x124) != 0)
      {
        double v171 = CanvasSize * 0.5 - v169 * 0.5;
        goto LABEL_183;
      }
    }
    double v171 = CanvasSize - v169;
    goto LABEL_183;
  }
  if (Type == 2 && DrawFilterNodeWithDefsOnly(a2, *(const char **)(a1 + 40)))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(v9 + 40);
    int v11 = 1;
    CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB30];
    keCGFloat y = (void *)*MEMORY[0x263F03A80];
    v188 = (void *)*MEMORY[0x263F03C00];
    v187 = (void *)*MEMORY[0x263F03B60];
    v186 = (void *)*MEMORY[0x263F039A0];
    v182 = (void *)*MEMORY[0x263F03CB8];
    v183 = (void *)*MEMORY[0x263F03C60];
    v184 = (void *)*MEMORY[0x263F03CB0];
    v185 = (void *)*MEMORY[0x263F03C88];
    uint64_t v195 = v9;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    c = *(CGContext **)v9;
    while (1)
    {
      do
      {
        char v12 = v11;
        char v13 = v11 ^ 1;
        if ((v11 ^ 1)) {
          break;
        }
        int v11 = 0;
      }
      while (!*(unsigned char *)(v10 - 207));
      if (!(v12 & 1 | (*(unsigned char *)(v10 - 208) != 0))) {
        return;
      }
      CGContextBeginPath(c);
      int Primitive = CGSVGShapeNodeGetPrimitive(a2, v14);
      int v17 = Primitive;
      if (Primitive > 31) {
        break;
      }
      if (Primitive != 3)
      {
        if (Primitive != 16) {
          goto LABEL_29;
        }
        x[0].double a = 0.0;
        y[0].double a = 0.0;
        matrix.double a = 0.0;
        m.double a = 0.0;
        CGSVGShapeNodeGetEllipseGeometry(a2, (char *)x, y, &matrix, &m.a);
        CFStringRef v18 = c;
        if (matrix.a <= 0.0 || m.a <= 0.0) {
          goto LABEL_125;
        }
        CGFloat v19 = x[0].a - matrix.a;
        double v20 = y[0].a - m.a;
        double v21 = matrix.a + matrix.a;
        double v22 = m.a + m.a;
        long long v23 = c;
        goto LABEL_27;
      }
      x[0].double a = 0.0;
      y[0].double a = 0.0;
      matrix.double a = 0.0;
      CGSVGShapeNodeGetCircleGeometry(a2, (char *)x, y, &matrix.a);
      CFStringRef v18 = c;
      if (matrix.a > 0.0)
      {
        CGFloat v19 = x[0].a - matrix.a;
        double v20 = y[0].a - matrix.a;
        double v21 = matrix.a + matrix.a;
        long long v23 = c;
        double v22 = matrix.a + matrix.a;
LABEL_27:
        CGContextAddEllipseInRect(v23, *(CGRect *)&v19);
      }
LABEL_125:
      int v83 = *(_DWORD *)(v10 - 204);
      BOOL v84 = *(_OWORD *)(v10 - 152) != 0;
      if (v12) {
        BOOL v84 = *(_OWORD *)(v10 - 176) != 0;
      }
      if (v84)
      {
        CGContextSaveGState(v18);
        if ((v12 & 1) == 0) {
          CGContextReplacePathWithStrokedPath(v18);
        }
        *(CGRect *)(v10 - 128) = CGContextGetPathBoundingBox(v18);
        if (v83)
        {
          if (v83 == 1) {
            CGContextEOClip(v18);
          }
        }
        else
        {
          CGContextClip(v18);
        }
        uint64_t v85 = -80;
        if (v12) {
          uint64_t v85 = -88;
        }
        uint64_t v86 = -136;
        if (v12) {
          uint64_t v86 = -160;
        }
        uint64_t v87 = -144;
        if (v12) {
          uint64_t v87 = -168;
        }
        uint64_t v88 = -152;
        if (v12) {
          uint64_t v88 = -176;
        }
        int v89 = *(unsigned __int8 *)(v10 + v86);
        uint64_t v90 = *(void *)(v10 + v88);
        uint64_t v91 = *(void *)(v10 + v87);
        double v92 = *(double *)(v10 + v85);
        double v93 = *(CGContext **)v195;
        CGFloat v94 = *(double *)(v10 - 128);
        CGFloat v95 = *(double *)(v10 - 120);
        CGFloat v96 = *(double *)(v10 - 112);
        CGFloat v97 = *(double *)(v10 - 104);
        CGContextSaveGState(*(CGContextRef *)v195);
        if (v89)
        {
          if (!v90) {
            goto LABEL_154;
          }
        }
        else
        {
          CGContextTranslateCTM(v93, v94, v95);
          CGContextScaleCTM(v93, v96, v97);
          if (!v90)
          {
LABEL_154:
            CGFloat v129 = (SVGPattern *)CFRetained::getObject<SVGPattern>(v91, v98);
            SVGPattern::drawCells(v129, v93, *(CGRect *)(v10 - 128), v92);
            goto LABEL_158;
          }
        }
        CFIndex NumberOfStops = (CFIndex)CGSVGGradientGetNumberOfStops(v90, v98);
        Mutable = CFArrayCreateMutable(allocator, NumberOfStops, MEMORY[0x263EFFF70]);
        double v101 = (CGFloat *)malloc_type_malloc(8 * NumberOfStops, 0x100004000313F17uLL);
        if (NumberOfStops)
        {
          for (uint64_t i = 0; i != (const char *)NumberOfStops; ++i)
          {
            Stop = CGSVGGradientGetStop(v90, i);
            OpacitCGFloat y = CGSVGGradientStopGetOpacity((uint64_t)Stop, v104);
            CGSVGGradientStopGetOffset((uint64_t)Stop, v106);
            v101[(void)i] = CGSVGLengthScaledLength(v107, v108, 1.0);
            memset(x, 0, 40);
            CGSVGGradientStopGetColor((uint64_t)Stop, v109, (uint64_t)x);
            x[0].d = v92 * Opacity;
            matrix.tCGFloat x = x[0].tx;
            *(_OWORD *)&matrix.double a = *(_OWORD *)&x[0].a;
            *(_OWORD *)&matrix.c = *(_OWORD *)&x[0].c;
            CGColorRef CGColor = CGSVGColorCreateCGColor((uint64_t)&matrix);
            CFArrayAppendValue(Mutable, CGColor);
            CFRelease(CGColor);
          }
        }
        double v111 = CGGradientCreateWithColors(0, Mutable, v101);
        free(v101);
        CFRelease(Mutable);
        int v113 = CGSVGGradientGetType(v90, v112);
        memset(&m, 0, 32);
        if (v113)
        {
          CGSVGGradientGetCenter(v90, v114, &m);
          memset(&v207, 0, 32);
          CGSVGGradientGetFocal(v90, v115, &v207);
          CGSVGGradientGetRadius(v90, v116);
          uint64_t v118 = v117;
          int v120 = v119;
          long long valuePtr = *(_OWORD *)&m.a;
          long long v206 = *(_OWORD *)&m.c;
          double v121 = CGSVGPointScaledPoint((uint64_t)&valuePtr, 1.0);
          CGFloat v123 = v122;
          *(_OWORD *)v203 = *(_OWORD *)&v207.a;
          long long v204 = *(_OWORD *)&v207.c;
          double v124 = CGSVGPointScaledPoint((uint64_t)v203, 1.0);
          CGFloat v126 = v125;
          double v127 = CGSVGLengthScaledLength(v118, v120, 1.0);
          memset(x, 0, 48);
          CGSVGGradientGetGradientTransform(v90, v128, (uint64_t)x);
          y[0] = x[0];
          CGContextConcatCTM(v93, y);
          v213.CGFloat x = v124;
          v213.CGFloat y = v126;
          v216.CGFloat x = v121;
          v216.CGFloat y = v123;
          CGContextDrawRadialGradient(v93, v111, v213, 0.0, v216, v127, 3u);
        }
        else
        {
          CGSVGGradientGetStart(v90, v114, &m);
          memset(&v207, 0, 32);
          CGSVGGradientGetEnd(v90, v130, &v207);
          long long valuePtr = *(_OWORD *)&m.a;
          long long v206 = *(_OWORD *)&m.c;
          double v131 = CGSVGPointScaledPoint((uint64_t)&valuePtr, 1.0);
          CGFloat v133 = v132;
          *(_OWORD *)v203 = *(_OWORD *)&v207.a;
          long long v204 = *(_OWORD *)&v207.c;
          double v134 = CGSVGPointScaledPoint((uint64_t)v203, 1.0);
          CGFloat v136 = v135;
          memset(x, 0, 48);
          CGSVGGradientGetGradientTransform(v90, v137, (uint64_t)x);
          y[0] = x[0];
          CGContextConcatCTM(v93, y);
          v214.CGFloat x = v131;
          v214.CGFloat y = v133;
          v215.CGFloat x = v134;
          v215.CGFloat y = v136;
          CGContextDrawLinearGradient(v93, v111, v214, v215, 3u);
        }
        CFStringRef v18 = c;
        CGGradientRelease(v111);
LABEL_158:
        CGContextRestoreGState(v93);
        CGContextRestoreGState(v18);
        if ((v12 & 1) == 0)
        {
          *(void *)(v10 - 152) = 0;
          *(void *)(v10 - 144) = 0;
          return;
        }
        int v11 = 0;
        *(void *)(v10 - 176) = 0;
        *(void *)(v10 - 168) = 0;
      }
      else
      {
        if ((v12 & 1) == 0)
        {
          CGContextStrokePath(v18);
          return;
        }
        if (v83)
        {
          int v11 = 0;
          if (v83 == 1)
          {
            CGContextEOFillPath(c);
            int v11 = 0;
          }
        }
        else
        {
          CGContextFillPath(v18);
          int v11 = 0;
        }
      }
    }
    if (Primitive == 32)
    {
      x[0].double a = 0.0;
      y[0].double a = 0.0;
      matrix.double a = 0.0;
      m.double a = 0.0;
      CGSVGShapeNodeGetLineGeometry(a2, (char *)x, y, &matrix, &m.a);
      CFStringRef v18 = c;
      CGContextMoveToPoint(c, x[0].a, y[0].a);
      CGContextAddLineToPoint(c, matrix.a, m.a);
      goto LABEL_125;
    }
    if (Primitive == 49)
    {
      x[0].double a = 0.0;
      y[0].double a = 0.0;
      matrix.double a = 0.0;
      m.double a = 0.0;
      v207.double a = 0.0;
      *(void *)&long long valuePtr = 0;
      CGSVGShapeNodeGetRectGeometry(a2, (char *)x, y, &matrix, &m, &v207, (double *)&valuePtr);
      CGFloat v24 = matrix.a;
      CFStringRef v18 = c;
      if (matrix.a <= 0.0) {
        goto LABEL_125;
      }
      CGFloat v25 = m.a;
      if (m.a <= 0.0) {
        goto LABEL_125;
      }
      double v26 = v207.a;
      double v27 = *(double *)&valuePtr;
      if (v207.a > 0.0 || *(double *)&valuePtr > 0.0)
      {
        if (v207.a > 0.0)
        {
          if (*(double *)&valuePtr <= 0.0)
          {
            *(CGFloat *)&long long valuePtr = v207.a;
            double v27 = v207.a;
          }
        }
        else
        {
          *(void *)&v207.double a = valuePtr;
          double v26 = *(double *)&valuePtr;
        }
      }
      else
      {
        *(void *)&long long valuePtr = 0;
        v207.double a = 0.0;
        double v27 = 0.0;
        double v26 = 0.0;
      }
      if (v26 > matrix.a * 0.5)
      {
        v207.double a = matrix.a * 0.5;
        double v26 = matrix.a * 0.5;
      }
      if (v27 > m.a * 0.5)
      {
        *(double *)&long long valuePtr = m.a * 0.5;
        double v27 = m.a * 0.5;
      }
      CGFloat v59 = x[0].a;
      CGFloat v60 = y[0].a;
      CGPath = CGPathCreateWithRoundedRect(*(CGRect *)(&v24 - 2), v26, v27, 0);
LABEL_85:
      unsigned __int8 v61 = CGPath;
      CGContextAddPath(v18, CGPath);
      CFRelease(v61);
      goto LABEL_125;
    }
LABEL_29:
    if ((Primitive & 0xFFFFFFFE) == 0x2C)
    {
      size_t FloatCount = CGSVGShapeNodeGetFloatCount(a2, v16);
      CFStringRef v18 = c;
      if ((unint64_t)FloatCount >= 3)
      {
        CGRect v29 = FloatCount;
        uint64_t v30 = malloc_type_malloc(8 * (void)FloatCount, 0x100004000313F17uLL);
        CGSVGShapeNodeGetFloats(a2, (char *)v30);
        CGContextMoveToPoint(c, *(CGFloat *)v30, *((CGFloat *)v30 + 1));
        uint64_t v31 = 0;
        do
        {
          CGContextAddLineToPoint(c, *((CGFloat *)v30 + v31 + 2), *((CGFloat *)v30 + v31 + 3));
          unint64_t v32 = v31 + 4;
          v31 += 2;
        }
        while (v32 < (unint64_t)v29);
        if (v17 == 44) {
          CGContextClosePath(c);
        }
        free(v30);
      }
      goto LABEL_125;
    }
    if (Primitive != 10001)
    {
      CFStringRef v18 = c;
      if (Primitive != 42) {
        goto LABEL_125;
      }
      Path = CGSVGShapeNodeGetPath(a2, v16);
      if (!Path) {
        goto LABEL_125;
      }
      CGPath = CGSVGPathCreateCGPath((uint64_t)Path, v34);
      if (!CGPath) {
        goto LABEL_125;
      }
      goto LABEL_85;
    }
    CFStringRef v36 = CGSVGShapeNodeCopyText(a2, v16);
    if (v36)
    {
      CFStringRef v38 = v36;
      AttributeMap = CGSVGNodeGetAttributeMap(a2, v37);
      CGSVGDrawState::CGSVGDrawState((CGSVGDrawState *)x, (const CGSVGDrawState *)(*(void *)(v195 + 40) - 208));
      v203[0] = 0.0;
      uint64_t Attribute = CGSVGAttributeMapGetAttribute((uint64_t)AttributeMap, (const char *)0x43);
      if (Attribute && (CGSVGAttributeGetFloat(Attribute, (char *)v203) & 1) == 0) {
        SVGUtilities::log((SVGUtilities *)"Text node x argument is unexpected type\n", v41);
      }
      CGFloat v201 = 0.0;
      uint64_t v42 = CGSVGAttributeMapGetAttribute((uint64_t)AttributeMap, (const char *)0x46);
      if (v42 && (CGSVGAttributeGetFloat(v42, (char *)&v201) & 1) == 0) {
        SVGUtilities::log((SVGUtilities *)"Text node y argument is unexpected type\n", v43);
      }
      CGColorRef ColorForNode = CreateColorForNode(a2, (const char *)0x39);
      CGColorRef v45 = CreateColorForNode(a2, (const char *)0x12);
      CGSVGDrawState::CGSVGDrawState((CGSVGDrawState *)y, (const CGSVGDrawState *)x);
      *(double *)&long long valuePtr = y[0].c / 400.0 + -1.0;
      SVGUtilities::StringWithCFString((const __CFString *)v200, &matrix);
      CGColorRef v189 = v45;
      CFStringRef v191 = v38;
      if (matrix.c >= 0.0) {
        CGFloat v46 = COERCE_DOUBLE(&matrix);
      }
      else {
        CGFloat v46 = matrix.a;
      }
      memset(&m, 0, 24);
      SVGParser::GetComponentsSeparatedByDelimiters(*(const char **)&v46, ",", (uint64_t *)&m);
      CGFloat v47 = m.a;
      CGFloat b = m.b;
      while (*(void *)&v47 != *(void *)&b)
      {
        if (*(char *)(*(void *)&v47 + 23) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&v207, **(const std::string::value_type ***)&v47, *(void *)(*(void *)&v47 + 8));
        }
        else
        {
          long long v49 = **(_OWORD **)&v47;
          v207.c = *(CGFloat *)(*(void *)&v47 + 16);
          *(_OWORD *)&v207.double a = v49;
        }
        if (v207.c >= 0.0) {
          CGFloat v50 = COERCE_DOUBLE(&v207);
        }
        else {
          CGFloat v50 = v207.a;
        }
        size_t v51 = strlen(*(const char **)&v50);
        if (!strncasecmp(*(const char **)&v50, "monospace", v51))
        {
          uint64_t v52 = "Courier";
        }
        else if (!strncasecmp(*(const char **)&v50, "serif", v51))
        {
          uint64_t v52 = "Times";
        }
        else if (!strncasecmp(*(const char **)&v50, "sans-serif", v51))
        {
          uint64_t v52 = "Helvetica";
        }
        else if (!strncasecmp(*(const char **)&v50, "cursive", v51))
        {
          uint64_t v52 = "Apple Chancery";
        }
        else if (!strncasecmp(*(const char **)&v50, "fantasy", v51))
        {
          uint64_t v52 = "Papyrus";
        }
        else
        {
          uint64_t v52 = *(const char **)&v50;
        }
        uint64_t v53 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFStringRef v54 = CFStringCreateWithCString(allocator, v52, 0x8000100u);
        CFDictionaryAddValue(v53, key, v54);
        CFRelease(v54);
        if (*(double *)&valuePtr != 0.0)
        {
          CGAffineTransform v55 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          CFNumberRef v56 = CFNumberCreate(alloc, kCFNumberCGFloatType, &valuePtr);
          CFDictionaryAddValue(v55, v188, v56);
          CFRelease(v56);
          CFDictionaryAddValue(v53, v187, v55);
          CFRelease(v55);
        }
        char v57 = CTFontDescriptorCreateWithAttributes(v53);
        CFRelease(v53);
        CTFontRef v58 = CTFontCreateWithFontDescriptor(v57, y[0].b, 0);
        CFRelease(v57);
        if (SHIBYTE(v207.c) < 0) {
          operator delete(*(void **)&v207.a);
        }
        if (v58) {
          goto LABEL_87;
        }
        *(void *)&v47 += 24;
      }
      CTFontRef v58 = 0;
LABEL_87:
      *(void *)&v207.double a = &m;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v207);
      if (SHIBYTE(matrix.c) < 0) {
        operator delete(*(void **)&matrix.a);
      }
      CGSVGDrawState::~CGSVGDrawState((CGSVGDrawState *)y);
      v62 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(v62, v186, v58);
      CFRelease(v58);
      if (ColorForNode)
      {
        CFDictionarySetValue(v62, v184, ColorForNode);
        CFRelease(ColorForNode);
        matrix.double a = 0.0;
        uint64_t v63 = CGSVGNodeFindAttribute(a2, (const char *)0x3B);
        CGSVGAttributeGetFloat(v63, (char *)&matrix);
        double v64 = matrix.a;
        double v65 = v64 * 100.0 / CTFontGetSize(v58);
        if (v189) {
          double v65 = -v65;
        }
        matrix.double a = v65;
        CFNumberRef v66 = CFNumberCreate(0, kCFNumberCGFloatType, &matrix);
        CFDictionarySetValue(v62, v182, v66);
        CFRelease(v66);
        char v13 = 0;
      }
      if (v189)
      {
        CFDictionarySetValue(v62, v183, v189);
        CFRelease(v189);
      }
      else
      {
        v13 |= v12;
      }
      CFNumberRef v67 = CFNumberCreate(alloc, kCFNumberCGFloatType, &x[0].d);
      CFDictionarySetValue(v62, v185, v67);
      CFRelease(v67);
      CFAttributedStringRef attrString = CFAttributedStringCreate(alloc, v191, v62);
      CFRelease(v191);
      CFRelease(v62);
      uint64_t line = CTLineCreateWithAttributedString(attrString);
      memset(&matrix, 0, sizeof(matrix));
      CGAffineTransformMakeScale(&matrix, 1.0, -1.0);
      v181 = *(CGContext **)v195;
      uint64_t v68 = CGSVGNodeFindAttribute(a2, (const char *)0x9D);
      if (v68)
      {
        CFStringRef v70 = CGSVGAttributeCopyString(v68, v69);
        if (v70)
        {
          CGRect ImageBounds = CTLineGetImageBounds(line, v181);
          unint64_t width = (unint64_t)ImageBounds.size.width;
          if (CFEqual(v70, @"end")) {
            goto LABEL_101;
          }
          if (CFEqual(v70, @"middle"))
          {
            width >>= 1;
LABEL_101:
            v203[0] = v203[0] - (double)width;
          }
          CFRelease(v70);
        }
      }
      if (v13)
      {
        uint64_t v72 = CGPathCreateMutable();
        CFArrayRef GlyphRuns = CTLineGetGlyphRuns(line);
        CFIndex Count = CFArrayGetCount(GlyphRuns);
        if (Count >= 1)
        {
          CFIndex v74 = 0;
          CFArrayRef v190 = GlyphRuns;
          while (1)
          {
            ValueAtIndeCGFloat x = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v74);
            CFIndex GlyphCount = CTRunGetGlyphCount(ValueAtIndex);
            GlyphsPtr = CTRunGetGlyphsPtr(ValueAtIndex);
            if (GlyphsPtr)
            {
              memset(&m, 0, 24);
              std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short const*,unsigned short const*>(&m, GlyphsPtr, (uint64_t)&GlyphsPtr[GlyphCount], GlyphCount);
              CGFloat v78 = m.a;
            }
            else
            {
              std::vector<unsigned short>::vector(&m, GlyphCount);
              CGFloat v78 = m.a;
              v211.location = 0;
              v211.length = GlyphCount;
              CTRunGetGlyphs(ValueAtIndex, v211, *(CGGlyph **)&m.a);
            }
            PositionsPtr = CTRunGetPositionsPtr(ValueAtIndex);
            if (PositionsPtr)
            {
              memset(&m, 0, 24);
              std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint const*,CGPoint const*>(&m, PositionsPtr, (uint64_t)&PositionsPtr[GlyphCount], GlyphCount);
              CGFloat v80 = m.a;
            }
            else
            {
              std::vector<CGPoint>::vector(&m, GlyphCount);
              CGFloat v80 = m.a;
              v212.location = 0;
              v212.length = GlyphCount;
              CTRunGetPositions(ValueAtIndex, v212, *(CGPoint **)&m.a);
            }
            if (GlyphCount >= 1) {
              break;
            }
            if (v80 != 0.0) {
              goto LABEL_117;
            }
LABEL_118:
            if (v78 != 0.0) {
              operator delete(*(void **)&v78);
            }
            ++v74;
            CFArrayRef GlyphRuns = v190;
            if (v74 == Count) {
              goto LABEL_121;
            }
          }
          uint64_t v81 = 0;
          do
          {
            double v82 = CTFontCreatePathForGlyph(v58, *(_WORD *)(*(void *)&v78 + v81), &matrix);
            memset(&m, 0, sizeof(m));
            CGAffineTransformMakeTranslation(&m, v203[0] + *(double *)(*(void *)&v80 + 8 * v81), v201 + *(double *)(*(void *)&v80 + 8 * v81 + 8));
            CGPathAddPath(v72, &m, v82);
            CGPathRelease(v82);
            v81 += 2;
            --GlyphCount;
          }
          while (GlyphCount);
LABEL_117:
          operator delete(*(void **)&v80);
          goto LABEL_118;
        }
LABEL_121:
        CGContextAddPath(v181, v72);
        CGPathRelease(v72);
      }
      else
      {
        CGAffineTransform m = matrix;
        CGContextSetTextMatrix(v181, &m);
        CGContextSetTextPosition(v181, v203[0], v201);
        CTLineDraw(line, v181);
      }
      CFRelease(attrString);
      CFRelease(line);
      CGSVGDrawState::~CGSVGDrawState((CGSVGDrawState *)x);
    }
    CFStringRef v18 = c;
    goto LABEL_125;
  }
}

void sub_210A3CDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

uint64_t DrawFilterNodeWithDefsOnly(uint64_t a1, const char *a2)
{
  AttributeMap = CGSVGNodeGetAttributeMap(a1, a2);
  uint64_t Attribute = CGSVGAttributeMapGetAttribute((uint64_t)AttributeMap, (const char *)0x54);
  uint64_t v6 = 0;
  if (!Attribute || !CGSVGAttributeGetFilter(Attribute, (char *)&v6)) {
    return 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)a2, @"drawingDefinition");
  if (result) {
    return 1;
  }
  return result;
}

CGColorRef CreateColorForNode(uint64_t a1, const char *a2)
{
  uint64_t Attribute = CGSVGNodeFindAttribute(a1, a2);
  uint64_t v8 = 0;
  unsigned int Paint = CGSVGAttributeGetPaint(Attribute, (char *)&v8);
  CGColorRef result = 0;
  if (Paint)
  {
    if (CGSVGPaintGetType(v8, v3) == 1)
    {
      CGSVGPaintGetColor(v8, v6, (uint64_t)v7);
      return CGSVGColorCreateCGColor((uint64_t)v7);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *std::vector<unsigned short>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned short>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 2 * a2);
    a1[1] = &v4[2 * a2];
  }
  return a1;
}

void sub_210A3D01C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned short>::__vallocate[abi:ne180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  CGColorRef result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

void *std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short const*,unsigned short const*>(void *result, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    CGColorRef result = std::vector<unsigned short>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      CGColorRef result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_210A3D10C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<CGPoint>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<CGPoint>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 16 * a2);
    a1[1] = &v4[16 * a2];
  }
  return a1;
}

void sub_210A3D184(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<CGPoint>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  CGColorRef result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint const*,CGPoint const*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    CGColorRef result = std::vector<CGPoint>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      CGColorRef result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_210A3D244(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *CFRetained::getObject<SVGPattern>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

void *CFRetained::getObject<SVGFilter>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

void std::vector<CGSVGDrawState>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  int v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        CGSVGDrawState::~CGSVGDrawState((CGSVGDrawState *)(v4 - 208));
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__split_buffer<CGSVGNode *>::push_back(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      int v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1[4], v16);
      CGFloat v19 = &v17[8 * (v16 >> 2)];
      double v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        long long v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)long long v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      CGFloat v25 = (char *)*a1;
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
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      char v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      long long v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

char *std::vector<CGSVGNode *>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(char **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    BOOL v8 = __src;
    uint64_t v7 = *(char **)(a2 + 8);
    do
    {
      uint64_t v9 = *((void *)v8 - 1);
      v8 -= 8;
      *((void *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    uint64_t v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  char v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  int64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  long long v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

uint64_t std::vector<CGSVGDrawState>::__push_back_slow_path<CGSVGDrawState>(uint64_t *a1, const CGSVGDrawState *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x4EC4EC4EC4EC4EC5 * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x13B13B13B13B13BLL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x4EC4EC4EC4EC4EC5 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x9D89D89D89D89DLL) {
    unint64_t v9 = 0x13B13B13B13B13BLL;
  }
  else {
    unint64_t v9 = v5;
  }
  int v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGSVGDrawState>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  char v13 = v10;
  int64_t v14 = (CGSVGDrawState *)&v10[208 * v4];
  unint64_t v16 = &v10[208 * v9];
  CGSVGDrawState::CGSVGDrawState(v14, a2);
  long long v15 = (char *)v14 + 208;
  std::vector<CGSVGDrawState>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<CGSVGDrawState>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_210A3D6D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<CGSVGDrawState>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CGSVGFilterGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A3D744(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CGSVGFilterPrimitiveGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A3D7B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGFilterPrimitiveCreate()
{
}

void sub_210A3D81C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C403455F984);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGFilterPrimitiveRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGFilterPrimitiveRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void CGSVGFilterCreate()
{
}

void sub_210A3D8C0(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40FABA7DC6);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGFilterRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGFilterRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void SVGImage::SVGImage(SVGImage *this)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "image");
  SVGViewBoxNode::SVGViewBoxNode(this, __p);
}

void sub_210A3D9C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGImage::SVGImage(SVGImage *this, SVGDocument *a2)
{
}

{
  SVGImage::SVGImage(this);
}

void sub_210A3DA24(_Unwind_Exception *a1)
{
  SVGImage::~SVGImage(v1);
  _Unwind_Resume(a1);
}

void SVGImage::~SVGImage(SVGImage *this)
{
  *(void *)this = &unk_26C30A390;
  int v2 = *((_DWORD *)this + 72);
  if (v2 == 2)
  {
    CFRetained::release(*((CFTypeRef **)this + 37));
  }
  else if (v2 == 1)
  {
    CGImageRelease(*((CGImageRef *)this + 37));
  }
  char v3 = (const void *)*((void *)this + 35);
  if (v3) {
    CFRelease(v3);
  }
  CGPathRelease(*((CGPathRef *)this + 39));
  SVGMask::~SVGMask(this);
}

{
  uint64_t vars8;

  SVGImage::~SVGImage(this);
  JUMPOUT(0x216677AD0);
}

void sub_210A3DB0C(_Unwind_Exception *a1)
{
  SVGImage::~SVGImage(v1);
  _Unwind_Resume(a1);
}

void SVGImage::SVGImage(SVGImage *this, CGImage *a2)
{
}

{
  SVGImage::SVGImage(this);
}

void sub_210A3DB94(_Unwind_Exception *a1)
{
  SVGImage::~SVGImage(v1);
  _Unwind_Resume(a1);
}

void sub_210A3DC1C(_Unwind_Exception *a1)
{
  SVGImage::~SVGImage(v1);
  _Unwind_Resume(a1);
}

void SVGImage::copy(SVGImage *this)
{
}

void sub_210A3DC7C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C406E4AB7DALL);
  _Unwind_Resume(a1);
}

BOOL SVGImage::rasterImage(SVGImage *this, CGImage **a2)
{
  int v2 = *((_DWORD *)this + 72);
  if (v2 == 1) {
    *a2 = (CGImage *)*((void *)this + 37);
  }
  return v2 == 1;
}

BOOL SVGImage::svgImage(SVGImage *this, SVGDocument **a2)
{
  int v2 = *((_DWORD *)this + 72);
  if (v2 == 2) {
    *a2 = (SVGDocument *)*((void *)this + 37);
  }
  return v2 == 2;
}

void SVGImage::draw(SVGImage *this, CGContextRef c)
{
  CGContextScaleCTM(c, 1.0, -1.0);
  int v4 = *((_DWORD *)this + 72);
  if (v4)
  {
    if (v4 == 2)
    {
      SVGDocument::canvasSize(*((SVGDocument **)this + 37));
      char v13 = *(const char **)(*((void *)this + 37) + 40);
      CGContextTranslateCTM(c, 0.0, -v14);
      CGContextDrawSVGDocument(c, v13);
    }
    else if (v4 == 1)
    {
      double Width = (double)CGImageGetWidth(*((CGImageRef *)this + 37));
      double Height = (double)CGImageGetHeight(*((CGImageRef *)this + 37));
      CGContextTranslateCTM(c, 0.0, -Height);
      uint64_t v7 = (CGImage *)*((void *)this + 37);
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      double v10 = Width;
      double v11 = Height;
      CGContextDrawImage(c, *(CGRect *)&v8, v7);
    }
  }
  else if (*((unsigned char *)this + 304))
  {
    double v12 = *((double *)this + 29);
    CGContextSetRGBStrokeColor(c, 1.0, 0.0, 0.0, 1.0);
    CGContextTranslateCTM(c, 0.0, -v12);
    CGContextAddPath(c, *((CGPathRef *)this + 39));
    CGContextDrawPath(c, kCGPathStroke);
  }
}

uint64_t SVGImage::hasWideGamutColor(SVGImage *this)
{
  int v1 = *((_DWORD *)this + 72);
  if (v1 == 2)
  {
    int v4 = (SVGDocument *)*((void *)this + 37);
    return SVGDocument::hasWideGamutContent(v4);
  }
  else if (v1 == 1)
  {
    ColorSpace = CGImageGetColorSpace(*((CGImageRef *)this + 37));
    return CGColorSpaceIsWideGamutRGB(ColorSpace);
  }
  else
  {
    return 0;
  }
}

uint64_t SVGImage::print(SVGImage *this, const char *a2)
{
  SVGUtilities::print((SVGUtilities *)"\n", a2);
  int v4 = (SVGUtilities *)SVGUtilities::print((SVGUtilities *)"ImageNode: Size: {%.2f, %.2f} Viewbox: ", v3, *((void *)this + 28), *((void *)this + 29));
  SVGUtilities::printIgnoringIndention(v4, *(CGRect *)((char *)this + 240));
  return SVGUtilities::print((SVGUtilities *)"\n", v5);
}

void SVGImage::updatedAttributes(SVGImage *this, SVGAttributeMap *a2)
{
  SVGViewBoxNode::updatedAttributes((uint64_t)this, (uint64_t)a2);
  SVGImage::calcSize(this);
}

void SVGImage::calcSize(SVGImage *this)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = *((_DWORD *)this + 72);
  if (v2 == 2)
  {
    char v3 = *(_OWORD **)(*((void *)this + 37) + 48);
    long long v4 = v3[16];
    *((_OWORD *)this + 15) = v3[15];
    *((_OWORD *)this + 16) = v4;
    v3[13] = *MEMORY[0x263F00148];
    SVGDocument::validateSizes(*((SVGNode ***)this + 37));
    int v2 = *((_DWORD *)this + 72);
  }
  if (!v2)
  {
    if (*((unsigned char *)this + 304))
    {
      Mutable = CGPathCreateMutable();
      points.CGFloat x = 0.0;
      points.CGFloat y = 0.0;
      v14.size.CGFloat width = *((CGFloat *)this + 28);
      v14.size.CGFloat height = *((CGFloat *)this + 29);
      CGFloat width = v14.size.width;
      CGFloat height = v14.size.height;
      v10.CGFloat x = 0.0;
      v10.CGFloat y = v14.size.height;
      CGFloat v11 = v14.size.width;
      uint64_t v12 = 0;
      uint64_t v6 = (const CGAffineTransform *)MEMORY[0x263F000D0];
      v14.origin.CGFloat x = 0.0;
      v14.origin.CGFloat y = 0.0;
      CGPathAddRect(Mutable, MEMORY[0x263F000D0], v14);
      CGPathAddLines(Mutable, v6, &points, 2uLL);
      CGPathAddLines(Mutable, v6, &v10, 2uLL);
      CGPathRelease(*((CGPathRef *)this + 39));
      *((void *)this + 39) = Mutable;
    }
  }
}

uint64_t SVGImage::updatedSpecificAttribute(uint64_t a1, int a2, SVGAttribute *this)
{
  if (a2 == 65) {
    return 1;
  }
  if (a2 != 20000) {
    return 0;
  }
  unint64_t v5 = *(const void **)(a1 + 280);
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = SVGAttribute::stringValue(this);
  if (*(char *)(v6 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)v6, *(void *)(v6 + 8));
  }
  else
  {
    long long v7 = *(_OWORD *)v6;
    v15.__r_.__value_.__r.__words[2] = *(void *)(v6 + 16);
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v7;
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    CGPoint v10 = &v15;
  }
  else {
    CGPoint v10 = (std::string *)v15.__r_.__value_.__r.__words[0];
  }
  CFStringRef v11 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)v10, 0x8000100u);
  *(void *)(a1 + 280) = CFURLCreateWithString(v9, v11, 0);
  CFRelease(v11);
  uint64_t v12 = *(void *)(a1 + 280);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v15.__r_.__value_.__l.__data_);
    if (v12) {
      return 1;
    }
LABEL_17:
    uint64_t v13 = SVGAtom::ToString(0x4E20u);
    SVGUtilities::log((SVGUtilities *)"Failed to parse %s for node name \"svg\"", v14, v13);
    return 1;
  }
  if (!v12) {
    goto LABEL_17;
  }
  return 1;
}

void sub_210A3E268(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double SVGImage::boundingBox(uint64_t a1)
{
  return *(double *)(a1 + 208);
}

uint64_t SVGImage::hasMonochromeColor(SVGImage *this)
{
  int v1 = *((_DWORD *)this + 72);
  if (v1 == 1)
  {
    ColorSpace = CGImageGetColorSpace(*((CGImageRef *)this + 37));
    return CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelMonochrome;
  }
  else if (v1 == 2)
  {
    int v2 = (SVGDocument *)*((void *)this + 37);
    return SVGDocument::hasMonochromeContent(v2);
  }
  else
  {
    return 0;
  }
}

void SVGImage::SVGImage(SVGImage *this, const SVGImage *a2)
{
}

void sub_210A3E39C(_Unwind_Exception *a1)
{
  SVGMask::~SVGMask(v1);
  _Unwind_Resume(a1);
}

uint64_t CGSVGPaintGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPaint::kSVGPaintClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A3E408(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGPaintCreateNone()
{
}

void sub_210A3E464(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40C2CA9EE7);
  _Unwind_Resume(a1);
}

void CGSVGPaintCreateWithColor()
{
}

void sub_210A3E4F0(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40C2CA9EE7);
  _Unwind_Resume(a1);
}

void *CGSVGPaintCreateWithGradient(uint64_t a1, const char *a2)
{
  CGColorRef result = CFRetained::getObject<SVGGradient>(a1, a2);
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A3E564(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40C2CA9EE7);
  _Unwind_Resume(a1);
}

void *CGSVGPaintCreateWithPattern(uint64_t a1, const char *a2)
{
  CGColorRef result = CFRetained::getObject<SVGPattern>(a1, a2);
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A3E5D8(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40C2CA9EE7);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGPaintRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGPaintRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

unsigned int *CGSVGPaintGetType(uint64_t a1, const char *a2)
{
  CGColorRef result = (unsigned int *)CFRetained::getObject<SVGPaint>(a1, a2);
  if (result) {
    return (unsigned int *)result[12];
  }
  return result;
}

void *CFRetained::getObject<SVGPaint>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

double *CGSVGPaintIsVisible(uint64_t a1, const char *a2)
{
  CGColorRef result = (double *)CFRetained::getObject<SVGPaint>(a1, a2);
  if (result)
  {
    if (*((_DWORD *)result + 12)) {
      return (double *)(result[12] > 0.0);
    }
    else {
      return 0;
    }
  }
  return result;
}

double CGSVGPaintGetOpacity(uint64_t a1, const char *a2)
{
  int v2 = (double *)CFRetained::getObject<SVGPaint>(a1, a2);
  if (v2) {
    return v2[12];
  }
  else {
    return 1.0;
  }
}

double *CGSVGPaintSetOpacity(uint64_t a1, const char *a2, double a3)
{
  CGColorRef result = (double *)CFRetained::getObject<SVGPaint>(a1, a2);
  if (result) {
    result[12] = a3;
  }
  return result;
}

uint64_t CGSVGPaintGetColor@<X0>(uint64_t a1@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  long long v4 = CFRetained::getObject<SVGPaint>(a1, a2);
  if (v4)
  {
    SVGColor::SVGColor((uint64_t)v7, (uint64_t)v4 + 56);
    if (v8 == 15) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2 * (v8 == 73);
    }
    return CGSVGColorCreateWithRGBA(v5, a3, v7[0], v7[1], v7[2], v7[3]);
  }
  else
  {
    return CGSVGColorCreateWithRGBA(0, a3, 0.0, 0.0, 0.0, 0.0);
  }
}

void *CGSVGPaintGetGradient(uint64_t a1, const char *a2)
{
  CGColorRef result = CFRetained::getObject<SVGPaint>(a1, a2);
  if (result)
  {
    uint64_t v3 = result[13];
    if (v3) {
      return *(void **)(v3 + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *CGSVGPaintGetPattern(uint64_t a1, const char *a2)
{
  CGColorRef result = CFRetained::getObject<SVGPaint>(a1, a2);
  if (result)
  {
    uint64_t v3 = result[14];
    if (v3) {
      return *(void **)(v3 + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

void SVGGradientStop::SVGGradientStop(SVGGradientStop *this)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGGradientStop::kSVGGradientStopClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A260;
  SVGColor::SVGColor((uint64_t)this + 48, 0, 0.0, 0.0, 0.0, 1.0);
  *((void *)this + 11) = 0x3FF0000000000000;
}

void sub_210A3E8F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void SVGGradientStop::SVGGradientStop(SVGGradientStop *this, const SVGColor *a2, double a3)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGGradientStop::kSVGGradientStopClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A260;
  SVGColor::SVGColor((uint64_t)this + 48, (uint64_t)a2);
  *((void *)this + 11) = 0x3FF0000000000000;
  CGSVGLengthMake();
  *((void *)this + 12) = v5;
  *((void *)this + 13) = v6;
}

void sub_210A3E9F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void *SVGGradientStop::SVGGradientStop(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGGradientStop::kSVGGradientStopClassName);
  CFRetained::CFRetained(a1, (uint64_t)__p);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_26C30A260;
  SVGColor::SVGColor((uint64_t)(a1 + 6), a2);
  a1[11] = 0x3FF0000000000000;
  a1[12] = a3;
  a1[13] = a4;
  return a1;
}

void sub_210A3EAE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *(void *)uint64_t v15 = &unk_26C309FB0;
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*(void **)(v15 + 8));
  }
  _Unwind_Resume(exception_object);
}

void SVGGradientStop::SVGGradientStop(SVGGradientStop *this, const SVGGradientStop *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGGradientStop::kSVGGradientStopClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A260;
  uint64_t v4 = SVGColor::SVGColor((uint64_t)this + 48, 0, 0.0, 0.0, 0.0, 1.0);
  *((void *)this + 11) = 0x3FF0000000000000;
  *((_OWORD *)this + 6) = *((_OWORD *)a2 + 6);
  SVGColor::operator=(v4, (uint64_t)a2 + 48);
  *((void *)this + 11) = *((void *)a2 + 11);
}

void sub_210A3EBF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void SVGGradientStop::~SVGGradientStop(void **this)
{
  *this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  *this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  *this = &unk_26C309FB0;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  JUMPOUT(0x216677AD0);
}

double SVGGradientStop::setColor(SVGGradientStop *this, const SVGColor *a2)
{
  *(void *)&double result = SVGColor::operator=((uint64_t)this + 48, (uint64_t)a2).n128_u64[0];
  return result;
}

BOOL SVGGradientStop::isEqual(SVGGradientStop *this, const SVGGradientStop *a2)
{
  BOOL result = CGSVGLengthEqualToLength(*((void *)this + 12), *((void *)this + 13), *((void *)a2 + 12), *((void *)a2 + 13));
  if (result)
  {
    BOOL result = SVGColor::isEqual((SVGGradientStop *)((char *)this + 48), (const SVGGradientStop *)((char *)a2 + 48));
    if (result) {
      return *((double *)this + 11) == *((double *)a2 + 11);
    }
  }
  return result;
}

void SVGGradientStop::copy(SVGGradientStop *this)
{
}

void sub_210A3EDFC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40C1F8F287);
  _Unwind_Resume(a1);
}

void SVGGradientStop::print(SVGGradientStop *this)
{
  SVGColor::SVGColor((uint64_t)v4, (uint64_t)this + 48);
  SVGColor::GetStringForColor((uint64_t)v4, (uint64_t)v5);
  if (v6 >= 0) {
    char v3 = v5;
  }
  else {
    char v3 = (void **)v5[0];
  }
  SVGUtilities::print((SVGUtilities *)"Stop: Offset: %g, Color: %s\n", v2, *((void *)this + 12), v3);
  if (v6 < 0) {
    operator delete(v5[0]);
  }
}

void sub_210A3EE9C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 17) < 0) {
    operator delete(*(void **)(v1 - 40));
  }
  _Unwind_Resume(exception_object);
}

void SVGGradient::SVGGradient(void *a1)
{
}

void sub_210A3EFAC(_Unwind_Exception *a1)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *((void *)v1 + 28) = v4;
    operator delete(v4);
  }
  SVGNode::~SVGNode(v1);
  _Unwind_Resume(a1);
}

void SVGGradient::SVGGradient(SVGGradient *this, const SVGGradient *a2)
{
}

void sub_210A3F110(_Unwind_Exception *a1)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *((void *)v1 + 28) = v4;
    operator delete(v4);
  }
  SVGNode::~SVGNode(v1);
  _Unwind_Resume(a1);
}

uint64_t SVGGradient::addStop(SVGGradient *this, SVGGradientStop *a2)
{
  uint64_t v4 = (char *)*((void *)this + 27);
  char v6 = (char *)*((void *)this + 28);
  uint64_t v5 = (void *)((char *)this + 216);
  uint64_t v7 = v6 - v4;
  if (v6 != v4 && (*((void *)a2 + 12) & 0x7FFFFFFFFFFFFFFFLL) == 0)
  {
    *((_OWORD *)a2 + 6) = *(_OWORD *)(*((void *)v6 - 1) + 96);
    uint64_t v15 = (char *)this + 232;
    unint64_t v16 = *((void *)this + 29);
    char v6 = (char *)*((void *)this + 28);
    if ((unint64_t)v6 >= v16)
    {
      uint64_t v23 = (uint64_t)&v6[-*v5] >> 3;
      if (!((unint64_t)(v23 + 1) >> 61))
      {
        uint64_t v24 = v16 - *v5;
        uint64_t v25 = v24 >> 2;
        if (v24 >> 2 <= (unint64_t)(v23 + 1)) {
          uint64_t v25 = v23 + 1;
        }
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v25;
        }
        if (v26) {
          double v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v15, v26);
        }
        else {
          double v27 = 0;
        }
        uint64_t v18 = &v27[8 * v23];
        CGFloat v19 = &v27[8 * v26];
        *(void *)uint64_t v18 = a2;
        int v17 = v18 + 8;
        uint64_t v28 = (char *)*((void *)this + 27);
        double v20 = (char *)*((void *)this + 28);
        if (v20 == v28) {
          goto LABEL_30;
        }
        do
        {
          uint64_t v29 = *((void *)v20 - 1);
          v20 -= 8;
          *((void *)v18 - 1) = v29;
          v18 -= 8;
        }
        while (v20 != v28);
        goto LABEL_29;
      }
LABEL_35:
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
LABEL_13:
    *(void *)char v6 = a2;
    int v17 = v6 + 8;
    goto LABEL_32;
  }
  char v8 = (char *)this + 232;
  unint64_t v9 = *((void *)this + 29);
  if ((unint64_t)v6 < v9) {
    goto LABEL_13;
  }
  uint64_t v10 = v7 >> 3;
  unint64_t v11 = (v7 >> 3) + 1;
  if (v11 >> 61) {
    goto LABEL_35;
  }
  uint64_t v12 = v9 - (void)v4;
  if (v12 >> 2 > v11) {
    unint64_t v11 = v12 >> 2;
  }
  if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v13 = v11;
  }
  if (v13) {
    CGRect v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v8, v13);
  }
  else {
    CGRect v14 = 0;
  }
  uint64_t v18 = &v14[8 * v10];
  CGFloat v19 = &v14[8 * v13];
  *(void *)uint64_t v18 = a2;
  int v17 = v18 + 8;
  uint64_t v21 = (char *)*((void *)this + 27);
  double v20 = (char *)*((void *)this + 28);
  if (v20 == v21) {
    goto LABEL_30;
  }
  do
  {
    uint64_t v22 = *((void *)v20 - 1);
    v20 -= 8;
    *((void *)v18 - 1) = v22;
    v18 -= 8;
  }
  while (v20 != v21);
LABEL_29:
  double v20 = (char *)*v5;
LABEL_30:
  *((void *)this + 27) = v18;
  *((void *)this + 28) = v17;
  *((void *)this + 29) = v19;
  if (v20) {
    operator delete(v20);
  }
LABEL_32:
  *((void *)this + 28) = v17;
  return CFRetained::retain((uint64_t)a2);
}

void SVGGradient::~SVGGradient(SVGGradient *this)
{
  *(void *)this = &unk_26C30A0A0;
  int v2 = (CFTypeRef **)*((void *)this + 27);
  char v3 = (CFTypeRef **)*((void *)this + 28);
  if (v2 != v3)
  {
    do
      CFRetained::release(*v2++);
    while (v2 != v3);
    int v2 = (CFTypeRef **)*((void *)this + 27);
  }
  if (v2)
  {
    *((void *)this + 28) = v2;
    operator delete(v2);
  }
  SVGNode::~SVGNode(this);
}

{
  uint64_t vars8;

  SVGGradient::~SVGGradient(this);
  JUMPOUT(0x216677AD0);
}

void SVGGradient::updatedAttributes(SVGGradient *this, SVGAttributeMap *a2)
{
  uint64_t v48 = 0;
  long long v49 = &v48;
  uint64_t v50 = 0x4802000000;
  size_t v51 = __Block_byref_object_copy__0;
  uint64_t v52 = __Block_byref_object_dispose__0;
  memset(v53, 0, sizeof(v53));
  CGSVGPointMake((uint64_t)v53, 0.0, 0.0);
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x4802000000;
  CGColorRef v45 = __Block_byref_object_copy__0;
  CGFloat v46 = __Block_byref_object_dispose__0;
  memset(v47, 0, sizeof(v47));
  CGSVGPointMakeWithTypes(1, 1, (uint64_t)v47, 100.0, 0.0);
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x4802000000;
  long long v39 = __Block_byref_object_copy__0;
  long long v40 = __Block_byref_object_dispose__0;
  memset(v41, 0, sizeof(v41));
  CGSVGPointMakeWithTypes(1, 1, (uint64_t)v41, 50.0, 50.0);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x4802000000;
  v34[3] = __Block_byref_object_copy__0;
  v34[4] = __Block_byref_object_dispose__0;
  memset(v35, 0, sizeof(v35));
  CGSVGPointMakeWithTypes(1, 1, (uint64_t)v35, 50.0, 50.0);
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3802000000;
  uint64_t v30 = __Block_byref_object_copy__2;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v31 = __Block_byref_object_dispose__3;
  CGSVGLengthMakeWithType();
  uint64_t v32 = v4;
  uint64_t v33 = v5;
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x5802000000;
  uint64_t v22 = __Block_byref_object_copy__4;
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v24 = *MEMORY[0x263F000D0];
  uint64_t v23 = __Block_byref_object_dispose__5;
  long long v25 = v6;
  long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000;
  int v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 0x40000000;
  v14[2] = ___ZN11SVGGradient17updatedAttributesEP15SVGAttributeMap_block_invoke;
  v14[3] = &unk_264187620;
  v14[4] = &v48;
  v14[5] = &v42;
  v14[6] = &v36;
  v14[7] = v34;
  v14[8] = &v27;
  v14[9] = &v19;
  v14[10] = &v15;
  SVGAttributeMap::enumerate((uint64_t)a2, (uint64_t)v14);
  long long v7 = *(_OWORD *)(v49 + 7);
  *((_OWORD *)this + 15) = *(_OWORD *)(v49 + 5);
  *((_OWORD *)this + 16) = v7;
  long long v8 = *(_OWORD *)(v43 + 7);
  *((_OWORD *)this + 17) = *(_OWORD *)(v43 + 5);
  *((_OWORD *)this + 18) = v8;
  long long v9 = *(_OWORD *)(v37 + 7);
  *((_OWORD *)this + 19) = *(_OWORD *)(v37 + 5);
  *((_OWORD *)this + 20) = v9;
  *((_OWORD *)this + 23) = *(_OWORD *)(v28 + 5);
  if (SVGAttributeMap::hasAttribute((uint64_t)a2, 0x1Au)) {
    uint64_t v10 = v34;
  }
  else {
    uint64_t v10 = &v36;
  }
  *((_OWORD *)this + 21) = *(_OWORD *)(v10[1] + 40);
  if (SVGAttributeMap::hasAttribute((uint64_t)a2, 0x1Bu)) {
    unint64_t v11 = v34;
  }
  else {
    unint64_t v11 = &v36;
  }
  *((_OWORD *)this + 22) = *(_OWORD *)(v11[1] + 56);
  long long v12 = *(_OWORD *)(v20 + 9);
  long long v13 = *(_OWORD *)(v20 + 5);
  *(_OWORD *)((char *)this + 408) = *(_OWORD *)(v20 + 7);
  *(_OWORD *)((char *)this + 424) = v12;
  *(_OWORD *)((char *)this + 392) = v13;
  *((_DWORD *)this + 96) = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);
}

void sub_210A3F7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose((const void *)(v52 - 208), 8);
  _Block_object_dispose((const void *)(v52 - 136), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

__n128 __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

{
  __n128 result;
  long long v3;

  __n128 result = *(__n128 *)(a2 + 40);
  char v3 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

__n128 __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  long long v3 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void ___ZN11SVGGradient17updatedAttributesEP15SVGAttributeMap_block_invoke(void *a1, int a2, os_unfair_lock_s *this)
{
  int os_unfair_lock_opaque = this[12]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque <= 46)
  {
    if (os_unfair_lock_opaque > 25)
    {
      if (os_unfair_lock_opaque != 26)
      {
        if (os_unfair_lock_opaque != 27) {
          return;
        }
        uint64_t v7 = a1[7];
        goto LABEL_21;
      }
      uint64_t v6 = a1[7];
    }
    else
    {
      if (os_unfair_lock_opaque != 9)
      {
        if (os_unfair_lock_opaque != 10) {
          return;
        }
        uint64_t v7 = a1[6];
LABEL_21:
        uint64_t v10 = *(void *)(v7 + 8) + 56;
        goto LABEL_26;
      }
      uint64_t v6 = a1[6];
    }
LABEL_25:
    uint64_t v10 = *(void *)(v6 + 8) + 40;
LABEL_26:
    if ((SVGAttribute::lengthValue((uint64_t)this, v10) & 1) == 0)
    {
LABEL_27:
      unint64_t v11 = SVGAtom::ToString(this[12]._os_unfair_lock_opaque);
      SVGUtilities::log((SVGUtilities *)"SVGGradient: Attribute parse error: %s\n", v12, v11);
    }
    return;
  }
  switch(os_unfair_lock_opaque)
  {
    case 'D':
      uint64_t v6 = a1[4];
      goto LABEL_25;
    case 'E':
      uint64_t v6 = a1[5];
      goto LABEL_25;
    case 'F':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
      return;
    case 'G':
      uint64_t v7 = a1[4];
      goto LABEL_21;
    case 'H':
      uint64_t v7 = a1[5];
      goto LABEL_21;
    case 'N':
      if ((SVGAttribute::transformValue(this, (CGAffineTransform *)(*(void *)(a1[9] + 8) + 40)) & 1) == 0) {
        goto LABEL_27;
      }
      return;
    default:
      if (os_unfair_lock_opaque == 47)
      {
        uint64_t v6 = a1[8];
        goto LABEL_25;
      }
      if (os_unfair_lock_opaque != 130) {
        return;
      }
      uint64_t v8 = SVGAttribute::stringValue((SVGAttribute *)this);
      int v9 = *(char *)(v8 + 23);
      if (v9 < 0)
      {
        if (*(void *)(v8 + 8) != 3) {
          goto LABEL_35;
        }
        uint64_t v8 = *(void *)v8;
      }
      else if (v9 != 3)
      {
        goto LABEL_35;
      }
      if (*(_WORD *)v8 == 24944 && *(unsigned char *)(v8 + 2) == 100)
      {
        *(_DWORD *)(*(void *)(a1[10] + 8) + 24) = 0;
        return;
      }
LABEL_35:
      uint64_t v14 = SVGAttribute::stringValue((SVGAttribute *)this);
      int v15 = *(char *)(v14 + 23);
      if (v15 < 0)
      {
        if (*(void *)(v14 + 8) != 7) {
          goto LABEL_44;
        }
        uint64_t v14 = *(void *)v14;
      }
      else if (v15 != 7)
      {
        goto LABEL_44;
      }
      if (*(_DWORD *)v14 == 1818649970 && *(_DWORD *)(v14 + 3) == 1952671084)
      {
        uint64_t v20 = *(void *)(a1[10] + 8);
        int v21 = 1;
        goto LABEL_57;
      }
LABEL_44:
      uint64_t v17 = SVGAttribute::stringValue((SVGAttribute *)this);
      int v18 = *(char *)(v17 + 23);
      if (v18 < 0)
      {
        if (*(void *)(v17 + 8) != 6) {
          return;
        }
        uint64_t v17 = *(void *)v17;
      }
      else if (v18 != 6)
      {
        return;
      }
      if (*(_DWORD *)v17 == 1701864818 && *(_WORD *)(v17 + 4) == 29793)
      {
        uint64_t v20 = *(void *)(a1[10] + 8);
        int v21 = 2;
LABEL_57:
        *(_DWORD *)(v20 + 24) = v21;
      }
      return;
  }
}

void SVGGradient::addStop(SVGGradient *this, const SVGGradientStop *a2)
{
}

void sub_210A3FBE4(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40C1F8F287);
  _Unwind_Resume(a1);
}

BOOL SVGGradient::isEqual(SVGGradient *this, const SVGGradient *a2)
{
  long long v4 = *((_OWORD *)this + 16);
  v15[0] = *((_OWORD *)this + 15);
  v15[1] = v4;
  long long v5 = *((_OWORD *)a2 + 16);
  v14[0] = *((_OWORD *)a2 + 15);
  v14[1] = v5;
  BOOL result = CGSVGPointEqualToPoint((uint64_t)v15, (uint64_t)v14);
  if (result)
  {
    long long v7 = *((_OWORD *)this + 18);
    v13[0] = *((_OWORD *)this + 17);
    v13[1] = v7;
    long long v8 = *((_OWORD *)a2 + 18);
    v12[0] = *((_OWORD *)a2 + 17);
    v12[1] = v8;
    BOOL result = CGSVGPointEqualToPoint((uint64_t)v13, (uint64_t)v12);
    if (result)
    {
      if (*((_DWORD *)this + 52) == *((_DWORD *)a2 + 52)
        && *((_DWORD *)this + 96) == *((_DWORD *)a2 + 96)
        && (uint64_t v10 = (const SVGGradientStop **)*((void *)a2 + 27),
            int v9 = (const SVGGradientStop **)*((void *)a2 + 28),
            unint64_t v11 = (SVGGradientStop **)*((void *)this + 27),
            (char *)v9 - (char *)v10 == *((void *)this + 28) - (void)v11))
      {
        if (v10 != v9)
        {
          while (v11 != *((SVGGradientStop ***)this + 28))
          {
            BOOL result = SVGGradientStop::isEqual(*v11, *v10);
            if (result)
            {
              ++v10;
              ++v11;
              BOOL result = 1;
              if (v10 != *((const SVGGradientStop ***)a2 + 28)) {
                continue;
              }
            }
            return result;
          }
        }
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t SVGGradient::setParentGradient(SVGGradient *this, const SVGGradient *a2)
{
  *((void *)this + 55) = a2;
  return SVGGradient::inheritParentGradient(this);
}

uint64_t SVGGradient::inheritParentGradient(SVGGradient *this)
{
  uint64_t v2 = *(void *)(*((void *)this + 55) + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  _OWORD v6[2] = ___ZN11SVGGradient21inheritParentGradientEv_block_invoke;
  v6[3] = &__block_descriptor_tmp_11;
  v6[4] = this;
  SVGAttributeMap::enumerate(v2, (uint64_t)v6);
  if (*((void *)this + 12) == *((void *)this + 11))
  {
    uint64_t v4 = *((void *)this + 55);
    long long v5 = *(SVGGradientStop ***)(v4 + 216);
    if (v5 != *(SVGGradientStop ***)(v4 + 224)) {
      SVGGradientStop::copy(*v5);
    }
  }
  return (*(uint64_t (**)(SVGGradient *, void))(*(void *)this + 24))(this, *((void *)this + 7));
}

uint64_t ___ZN11SVGGradient21inheritParentGradientEv_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t result = SVGAttributeMap::hasAttribute(*(void *)(*(void *)(a1 + 32) + 56), a2);
  if ((result & 1) == 0) {
    operator new();
  }
  return result;
}

void sub_210A3FE8C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void SVGGradient::print(SVGGradient *this, const char *a2)
{
  long long v3 = (SVGUtilities *)SVGUtilities::print((SVGUtilities *)"Gradient: %lu stop(s)\n", a2, (uint64_t)(*((void *)this + 28) - *((void *)this + 27)) >> 3);
  SVGUtilities::indent(v3);
  uint64_t v6 = (SVGGradientStop **)*((void *)this + 27);
  long long v5 = (SVGGradientStop **)*((void *)this + 28);
  while (v6 != v5)
  {
    long long v7 = *v6++;
    SVGGradientStop::print(v7);
  }
  SVGUtilities::unindent(v4);
}

uint64_t CGSVGImageGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A3FF78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGImageCreateWithNoImage()
{
}

void sub_210A3FFDC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C406E4AB7DALL);
  _Unwind_Resume(a1);
}

uint64_t CGSVGImageCreateWithRasterImage(uint64_t result)
{
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A4004C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C406E4AB7DALL);
  _Unwind_Resume(a1);
}

uint64_t CGSVGImageCreateWithSVGDocument(uint64_t result)
{
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A400B8(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C406E4AB7DALL);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGImageRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGImageRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

unsigned int *CGSVGImageGetType(uint64_t a1, const char *a2)
{
  uint64_t result = (unsigned int *)CFRetained::getObject<SVGImage>(a1, a2);
  if (result) {
    return (unsigned int *)result[72];
  }
  return result;
}

void *CFRetained::getObject<SVGImage>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  uint64_t v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

CGImage *CGSVGImageGetRasterImage(uint64_t a1, const char *a2)
{
  char v3 = 0;
  uint64_t result = (CGImage *)CFRetained::getObject<SVGImage>(a1, a2);
  if (result)
  {
    SVGImage::rasterImage(result, &v3);
    return v3;
  }
  return result;
}

SVGImage *CGSVGImageGetSVGDocument(uint64_t a1, const char *a2)
{
  char v3 = 0;
  uint64_t result = (SVGImage *)CFRetained::getObject<SVGImage>(a1, a2);
  if (result)
  {
    SVGImage::svgImage(result, &v3);
    if (v3) {
      return (SVGImage *)*((void *)v3 + 5);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t CGSVGDocumentGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGDocument::kSVGDocumentClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A4028C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGDocumentCreate()
{
}

void sub_210A402FC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4079506790);
  _Unwind_Resume(a1);
}

void CGSVGDocumentCreateFromURL()
{
}

void sub_210A403CC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4079506790);
  _Unwind_Resume(a1);
}

void CGSVGDocumentCreateFromDataProvider()
{
}

void sub_210A4049C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4079506790);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGDocumentRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGDocumentRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

BOOL CGSVGDocumentWriteToData(uint64_t a1, char *a2, const __CFDictionary *a3)
{
  long long v5 = CFRetained::getObject<SVGDocument>(a1, a2);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t)v5;
  uint64_t v7 = CreateWriteOptions(a3);
  BOOL v8 = SVGDocument::write(v6, (__CFData *)a2, v7);
  if (v7) {
    MEMORY[0x216677AD0](v7, 0x1000C4033FC2DF1);
  }
  return v8;
}

uint64_t CreateWriteOptions(const __CFDictionary *a1)
{
  if (a1 && CFDictionaryGetCount(a1) >= 1) {
    operator new();
  }
  return 0;
}

BOOL CGSVGDocumentWriteToURL(uint64_t a1, const char *a2, const __CFDictionary *a3)
{
  BOOL v3 = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t v6 = CFRetained::getObject<SVGDocument>(a1, a2);
      uint64_t v7 = CreateWriteOptions(a3);
      BOOL v3 = SVGDocument::write((uint64_t)v6, (const __CFURL *)a2, v7);
      if (v7) {
        MEMORY[0x216677AD0](v7, 0x1000C4033FC2DF1);
      }
    }
  }
  return v3;
}

SVGDocument *CGSVGDocumentGetCanvas(uint64_t a1, const char *a2)
{
  uint64_t result = (SVGDocument *)CFRetained::getObject<SVGDocument>(a1, a2);
  if (result) {
    return *(SVGDocument **)(SVGDocument::canvas(result) + 40);
  }
  return result;
}

SVGDocument *CGSVGDocumentContainsWideGamutContent(uint64_t a1, const char *a2)
{
  uint64_t result = (SVGDocument *)CFRetained::getObject<SVGDocument>(a1, a2);
  if (result)
  {
    return (SVGDocument *)SVGDocument::hasWideGamutContent(result);
  }
  return result;
}

void CGSVGDocumentAddNamedStyle(uint64_t a1, const char *a2, uint64_t a3)
{
  long long v5 = CFRetained::getObject<SVGDocument>(a1, a2);
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    SVGUtilities::StringWithCFString((const __CFString *)a2, __p);
    BOOL v8 = (CFTypeRef *)CFRetained::getObject<SVGAttributeMap>(a3, v7);
    if (v8) {
      SVGDocument::addNamedStyle(v6, (uint64_t)__p, v8);
    }
    if (v10 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_210A407BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

SVGDocument *CGSVGDocumentIsMonochrome(uint64_t a1, const char *a2)
{
  uint64_t result = (SVGDocument *)CFRetained::getObject<SVGDocument>(a1, a2);
  if (result)
  {
    return (SVGDocument *)SVGDocument::hasMonochromeContent(result);
  }
  return result;
}

void CGSVGDocumentDefsAddNode(uint64_t a1, const char *a2)
{
  BOOL v3 = CFRetained::getObject<SVGDocument>(a1, a2);
  if (v3)
  {
    uint64_t v5 = v3[6];
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 40);
      if (v6)
      {
        uint64_t v7 = (SVGNode *)CFRetained::getObject<SVGNode>(v6, v4);
        if (v7)
        {
          int v9 = v7;
          char v10 = (SVGNode *)CFRetained::getObject<SVGNode>((uint64_t)a2, v8);
          if (v10)
          {
            SVGNode::addDefinitionNode(v9, v9, v10);
          }
        }
      }
    }
  }
}

CFStringRef CGSVGDocumentDefsGetNode(uint64_t a1, const char *a2)
{
  CFStringRef v2 = (const __CFString *)a2;
  BOOL v3 = CFRetained::getObject<SVGDocument>(a1, a2);
  if (!v3) {
    return 0;
  }
  uint64_t v5 = v3[6];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *(void *)(v5 + 40);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = (SVGNode *)CFRetained::getObject<SVGNode>(v6, v4);
  if (!v7) {
    return 0;
  }
  BOOL v8 = v7;
  SVGUtilities::StringWithCFString(v2, __p);
  if (v14 >= 0) {
    int v9 = (char *)__p;
  }
  else {
    int v9 = (char *)__p[0];
  }
  DefinitionNode = SVGNode::findDefinitionNode(v8, v9);
  unint64_t v11 = DefinitionNode;
  if (DefinitionNode) {
    CFStringRef v2 = (const __CFString *)*((void *)DefinitionNode + 5);
  }
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (!v11) {
    return 0;
  }
  return v2;
}

void sub_210A4092C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGDocumentDefsEnumerate(uint64_t a1, const char *a2)
{
  BOOL v3 = CFRetained::getObject<SVGDocument>(a1, a2);
  if (v3)
  {
    uint64_t v5 = v3[6];
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 40);
      if (v6)
      {
        uint64_t v7 = CFRetained::getObject<SVGNode>(v6, v4);
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 0x40000000;
        v8[2] = __CGSVGDocumentDefsEnumerate_block_invoke;
        v8[3] = &unk_264187690;
        v8[4] = a2;
        SVGNode::enumerate((uint64_t)v7, (uint64_t)v8);
      }
    }
  }
}

void __CGSVGDocumentDefsEnumerate_block_invoke(uint64_t a1, const char *a2)
{
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x8000100u);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CFRelease(v3);
}

void CopyOptionsIntoMap(const __CFString *a1, const __CFString *a2, void *a3)
{
  SVGUtilities::StringWithCFString(a1, v7);
  SVGUtilities::StringWithCFString(a2, &__p);
  if (v8 >= 0) {
    uint64_t v5 = v7;
  }
  else {
    uint64_t v5 = (void **)v7[0];
  }
  SVGAtom::ToName((SVGAtom *)v5, v4);
  operator new();
}

void sub_210A40B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  MEMORY[0x216677AD0](v20, 0x10B3C405B4D0908);
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(a1);
}

SVGAtom *CGSVGAtomFromCString(SVGAtom *result, const char *a2)
{
  if (result) {
    return (SVGAtom *)SVGAtom::ToName(result, a2);
  }
  return result;
}

void SVGClipPath::SVGClipPath(SVGClipPath *this, const char *a2)
{
}

void sub_210A40BF4(_Unwind_Exception *a1)
{
  SVGNode::~SVGNode(v1);
  _Unwind_Resume(a1);
}

void SVGClipPath::SVGClipPath(SVGClipPath *this, const SVGClipPath *a2)
{
}

void sub_210A40C6C(_Unwind_Exception *a1)
{
  SVGNode::~SVGNode(v1);
  _Unwind_Resume(a1);
}

void SVGClipPath::~SVGClipPath(SVGClipPath *this)
{
  *(void *)this = &unk_26C30A030;
  CFStringRef v2 = (const CGPath *)*((void *)this + 26);
  if (v2)
  {
    CGPathRelease(v2);
    *((void *)this + 26) = 0;
  }
  SVGNode::~SVGNode(this);
}

{
  uint64_t vars8;

  SVGClipPath::~SVGClipPath(this);
  JUMPOUT(0x216677AD0);
}

void SVGClipPath::releaseCGPath(SVGClipPath *this)
{
  CFStringRef v2 = (const CGPath *)*((void *)this + 26);
  if (v2)
  {
    CGPathRelease(v2);
    *((void *)this + 26) = 0;
  }
}

void SVGClipPath::updatedAttributes(SVGClipPath *this, SVGAttributeMap *a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000;
  int v7 = 1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZN11SVGClipPath17updatedAttributesEP15SVGAttributeMap_block_invoke;
  v3[3] = &unk_2641876C8;
  v3[4] = &v4;
  SVGAttributeMap::enumerate((uint64_t)a2, (uint64_t)v3);
  *((_DWORD *)this + 54) = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
}

void sub_210A40E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN11SVGClipPath17updatedAttributesEP15SVGAttributeMap_block_invoke(uint64_t result, int a2, SVGAttribute *this)
{
  if (*((_DWORD *)this + 12) == 7)
  {
    uint64_t v3 = result;
    uint64_t v4 = (const std::string *)SVGAttribute::stringValue(this);
    uint64_t result = std::string::compare(v4, "objectBoundingBox");
    if (!result) {
      *(_DWORD *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = 0;
    }
  }
  return result;
}

CGMutablePathRef SVGClipPath::getCGClippingPath(SVGClipPath *this, SVGNode *a2)
{
  SVGScopedUnfairLock::SVGScopedUnfairLock((SVGScopedUnfairLock *)&v30, (os_unfair_lock_t)this + 55);
  int v5 = *((_DWORD *)this + 54);
  if (a2 || v5)
  {
    CGFloat v7 = *MEMORY[0x263F000D0];
    long long v29 = *(_OWORD *)(MEMORY[0x263F000D0] + 8);
    if (v5)
    {
      CGFloat v9 = *(double *)(MEMORY[0x263F000D0] + 24);
      double BoundingBoxWithOptions = *(double *)(MEMORY[0x263F000D0] + 32);
      CGFloat v10 = *(double *)(MEMORY[0x263F000D0] + 40);
    }
    else
    {
      double BoundingBoxWithOptions = CGSVGNodeGetBoundingBoxWithOptions(*((void *)a2 + 5), 0, 0);
      CGFloat v10 = v11;
      CGFloat v7 = v12;
      CGFloat v9 = v13;
      long long v29 = 0uLL;
    }
    CGMutablePathRef Mutable = (CGMutablePathRef)*((void *)this + 26);
    if (!Mutable)
    {
      CGMutablePathRef Mutable = CGPathCreateMutable();
      *((void *)this + 26) = Mutable;
      uint64_t v15 = *((void *)this + 11);
      uint64_t v16 = *((void *)this + 12);
      if (v15 != v16)
      {
        do
        {
          uint64_t v17 = *(const void **)v15;
          int v18 = (SVGAtom *)(*(void *)v15 + 64);
          if (*(char *)(*(void *)v15 + 87) < 0) {
            int v18 = *(SVGAtom **)v18;
          }
          unsigned int v19 = SVGAtom::ToName(v18, v14);
          if (SVGShapeNode::IsValidShapePrimitive(v19))
          {
            if (v20)
            {
              SVGPath = SVGShapeNode::createSVGPath(v20);
              uint64_t v22 = (CFTypeRef *)SVGPath;
              if (SVGPath)
              {
                CGPath = CGSVGPathCreateCGPath(*((void *)SVGPath + 5), v14);
                memset(&m, 0, sizeof(m));
                *(_OWORD *)&t1.CGFloat b = v29;
                t1.double a = v7;
                t1.d = v9;
                t1.tCGFloat x = BoundingBoxWithOptions;
                t1.tCGFloat y = v10;
                long long v24 = *((_OWORD *)v22 + 6);
                *(_OWORD *)&v26.double a = *((_OWORD *)v22 + 5);
                *(_OWORD *)&v26.c = v24;
                *(_OWORD *)&v26.tCGFloat x = *((_OWORD *)v22 + 7);
                CGAffineTransformConcat(&m, &t1, &v26);
                CGPathAddPath(*((CGMutablePathRef *)this + 26), &m, CGPath);
                CGPathRelease(CGPath);
                CFRetained::release(v22);
              }
            }
          }
          v15 += 8;
        }
        while (v15 != v16);
        CGMutablePathRef Mutable = (CGMutablePathRef)*((void *)this + 26);
      }
    }
  }
  else
  {
    SVGUtilities::error((SVGUtilities *)"objectBoundingBox option was given without a relative object.", v4);
    CGMutablePathRef Mutable = 0;
  }
  SVGScopedUnfairLock::~SVGScopedUnfairLock(&v30);
  return Mutable;
}

void sub_210A4106C(_Unwind_Exception *a1)
{
  SVGScopedUnfairLock::~SVGScopedUnfairLock((os_unfair_lock_t *)(v1 - 120));
  _Unwind_Resume(a1);
}

uint64_t SVGClipPath::print(uint64_t this)
{
  uint64_t v1 = *(uint64_t **)(this + 88);
  CFStringRef v2 = *(uint64_t **)(this + 96);
  while (v1 != v2)
  {
    uint64_t v3 = *v1++;
    this = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 48))(v3);
  }
  return this;
}

uint64_t CGSVGPathCommandGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPathCommand::kSVGPathCommandClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A41144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unsigned int *CGSVGPathCommandGetType(uint64_t a1, const char *a2)
{
  uint64_t result = (unsigned int *)CFRetained::getObject<SVGPathCommand>(a1, a2);
  if (result) {
    return (unsigned int *)result[12];
  }
  return result;
}

void CGSVGPathCommandAppendFloats(uint64_t a1, char *__src, uint64_t a3)
{
  std::string __p = 0;
  CGFloat v7 = 0;
  uint64_t v8 = 0;
  SVGUtilities::CGFloatListFromFloats(__src, a3, (uint64_t)&__p);
  int v5 = CFRetained::getObject<SVGPathCommand>(a1, v4);
  if (v5) {
    SVGPathCommand::appendFloats((uint64_t)v5, (char **)&__p);
  }
  if (__p)
  {
    CGFloat v7 = __p;
    operator delete(__p);
  }
}

void sub_210A411E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGPathCommandAppendPoint(uint64_t a1, const char *a2, double a3, double a4)
{
  uint64_t v6 = (SVGPathCommand *)CFRetained::getObject<SVGPathCommand>(a1, a2);
  if (v6)
  {
    double v7 = a3;
    double v8 = a4;
    SVGPathCommand::appendPoint(v6, *(CGPoint *)&v7);
  }
}

void *CGSVGPathCommandGetFloatCount(uint64_t a1, const char *a2)
{
  uint64_t result = CFRetained::getObject<SVGPathCommand>(a1, a2);
  if (result)
  {
    char v3 = (void *)result[7];
    if (v3) {
      return (void *)((uint64_t)(v3[1] - *v3) >> 3);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t CGSVGPathGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPath::kSVGPathClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A412E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGPathCreate()
{
}

void sub_210A41344(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C40176D6E88);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGPathRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGPathRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void *CGSVGPathAppendCommand(uint64_t a1, const char *a2)
{
  uint64_t result = CFRetained::getObject<SVGPath>(a1, a2);
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A41414(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40A582917CLL);
  _Unwind_Resume(a1);
}

void *CGSVGPathGetCommandCount(uint64_t a1, const char *a2)
{
  uint64_t result = CFRetained::getObject<SVGPath>(a1, a2);
  if (result) {
    return (void *)((uint64_t)(result[7] - result[6]) >> 3);
  }
  return result;
}

void *CGSVGPathGetCommandAtIndex(uint64_t a1, const char *a2)
{
  uint64_t result = CFRetained::getObject<SVGPath>(a1, a2);
  if (result)
  {
    uint64_t v4 = result[6];
    if ((unint64_t)a2 >= (result[7] - v4) >> 3) {
      return 0;
    }
    else {
      return *(void **)(*(void *)(v4 + 8 * (void)a2) + 40);
    }
  }
  return result;
}

uint64_t CGSVGPathCreateWithCGPath(uint64_t result)
{
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A415FC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C40176D6E88);
  _Unwind_Resume(a1);
}

void __CGSVGPathCreateWithCGPath_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFStringRef v2 = *(long long **)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
      operator new();
    case 1:
      operator new();
    case 2:
      long long v3 = v2[1];
      long long v12 = *v2;
      long long v13 = v3;
      uint64_t v4 = operator new(0x20uLL);
      CGFloat v10 = v4 + 2;
      double v11 = v4 + 2;
      long long v5 = v13;
      _OWORD *v4 = v12;
      v4[1] = v5;
      std::string __p = v4;
      operator new();
    case 3:
      long long v6 = v2[1];
      long long v12 = *v2;
      long long v13 = v6;
      long long v14 = v2[2];
      double v7 = operator new(0x30uLL);
      CGFloat v10 = v7 + 3;
      double v11 = v7 + 3;
      long long v8 = v13;
      _OWORD *v7 = v12;
      v7[1] = v8;
      v7[2] = v14;
      std::string __p = v7;
      operator new();
    case 4:
      operator new();
    default:
      return;
  }
}

void sub_210A41818(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C40A582917CLL);
  _Unwind_Resume(a1);
}

uint64_t CGSVGPathCreateWithPathDescription(const __CFString *a1)
{
  if (a1)
  {
    SVGUtilities::StringWithCFString(a1, __p);
    if (v5 < 0)
    {
      if (__p[1])
      {
        CFStringRef v2 = (void **)__p[0];
LABEL_8:
        SVGParser::ParseCommandList((SVGParser *)v2, v1);
      }
      operator delete(__p[0]);
    }
    else if (v5)
    {
      CFStringRef v2 = __p;
      goto LABEL_8;
    }
  }
  return 0;
}

void sub_210A41920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFStringRef CGSVGPathCreatePathDescription(uint64_t a1, const char *a2)
{
  CFStringRef v2 = (SVGPath *)CFRetained::getObject<SVGPath>(a1, a2);
  if (!v2) {
    return 0;
  }
  SVGPath::createStringRepresentation(v2, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  CFStringRef v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)p_p, 0x8000100u);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v4;
}

void sub_210A419BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void Vec2Angle(CGVector a1, CGVector a2)
{
  double v2 = (a1.dy * a2.dy + a1.dx * a2.dx) / (sqrt(a1.dy * a1.dy + a1.dx * a1.dx) * sqrt(a2.dy * a2.dy + a2.dx * a2.dx));
  long double v3 = -1.0;
  if (v2 >= -1.0)
  {
    long double v3 = v2;
    if (v2 > 1.0) {
      long double v3 = 1.0;
    }
  }
  fabs(acos(v3));
}

void FilterResult::FilterResult(FilterResult *this, CIImage *a2)
{
  *(void *)this = a2;
  *((void *)this + 1) = 0;
}

void FilterResult::~FilterResult(FilterResult *this)
{
  double v2 = (void *)*((void *)this + 1);
  if (v2) {
    free(v2);
  }
}

void SVGFilterPrimitive::SVGFilterPrimitive(void *a1)
{
}

void SVGFilterPrimitive::~SVGFilterPrimitive(SVGFilterPrimitive *this)
{
  SVGNode::~SVGNode(this);
  JUMPOUT(0x216677AD0);
}

void SVGFilterPrimitive::draw(SVGFilterPrimitive *a1, const char *a2, uint64_t *a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  *(double *)uint64_t v33 = a5;
  *(double *)&v33[1] = a6;
  *(double *)uint64_t v32 = a7;
  *(double *)&v32[1] = a8;
  *((void *)a1 + 26) = a2;
  CGFloat v10 = (void *)((char *)a1 + 208);
  *((void *)a1 + 27) = *a3;
  *((void *)a1 + 28) = a4;
  *((void *)a1 + 29) = v33;
  *((void *)a1 + 30) = v32;
  uint64_t v11 = SVGFilterPrimitive::selectPrimitive(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_210A5361E);
  SVGFilterPrimitive::stringAttr((uint64_t)a1, 0x5Au, (uint64_t)__p, &v31);
  if (v30 < 0) {
    operator delete(__p[0]);
  }
  if ((*((unsigned char *)&v31.__r_.__value_.__s + 23) & 0x80) == 0)
  {
    long long v12 = &v31;
    switch(*((unsigned char *)&v31.__r_.__value_.__s + 23))
    {
      case 9:
        goto LABEL_31;
      case 0xA:
      case 0xC:
      case 0xE:
        goto LABEL_54;
      case 0xB:
        uint64_t v13 = *(std::string::size_type *)((char *)v31.__r_.__value_.__r.__words + 3);
        BOOL v14 = v31.__r_.__value_.__r.__words[0] == 0x6C41656372756F53;
        uint64_t v15 = 0x6168706C41656372;
        goto LABEL_40;
      case 0xD:
        uint64_t v13 = *(std::string::size_type *)((char *)v31.__r_.__value_.__r.__words + 5);
        BOOL v14 = v31.__r_.__value_.__r.__words[0] == 0x7247656372756F53;
        uint64_t v15 = 0x6369687061724765;
LABEL_40:
        if (!v14 || v13 != v15) {
          goto LABEL_54;
        }
        goto LABEL_56;
      case 0xF:
        if ((v31.__r_.__value_.__r.__words[0] != 0x756F72676B636142
           || *(std::string::size_type *)((char *)v31.__r_.__value_.__r.__words + 7) != 0x6567616D49646E75)
          && (v31.__r_.__value_.__r.__words[0] != 0x756F72676B636142
           || *(std::string::size_type *)((char *)v31.__r_.__value_.__r.__words + 7) != 0x6168706C41646E75))
        {
          goto LABEL_54;
        }
        goto LABEL_56;
      default:
        if (&v31) {
          goto LABEL_54;
        }
        *a3 = v11;
        v10[4] = 0;
        *(_OWORD *)CGFloat v10 = 0u;
        *((_OWORD *)v10 + 1) = 0u;
        return;
    }
  }
  std::string::size_type size = v31.__r_.__value_.__l.__size_;
  if (v31.__r_.__value_.__l.__size_)
  {
    if (v31.__r_.__value_.__l.__size_ == 11)
    {
      if (*(void *)v31.__r_.__value_.__l.__data_ == 0x6C41656372756F53
        && *(void *)(v31.__r_.__value_.__r.__words[0] + 3) == 0x6168706C41656372)
      {
        goto LABEL_56;
      }
      std::string::size_type size = v31.__r_.__value_.__l.__size_;
    }
    else if (v31.__r_.__value_.__l.__size_ == 13 {
           && *(void *)v31.__r_.__value_.__l.__data_ == 0x7247656372756F53
    }
           && *(void *)(v31.__r_.__value_.__r.__words[0] + 5) == 0x6369687061724765)
    {
      goto LABEL_56;
    }
    if (size != 15
      || (*(void *)v31.__r_.__value_.__l.__data_ == 0x756F72676B636142
        ? (BOOL v19 = *(void *)(v31.__r_.__value_.__r.__words[0] + 7) == 0x6567616D49646E75)
        : (BOOL v19 = 0),
          !v19
       && ((std::string::size_type size = v31.__r_.__value_.__l.__size_, v31.__r_.__value_.__l.__size_ != 15)
        || (*(void *)v31.__r_.__value_.__l.__data_ == 0x756F72676B636142
          ? (BOOL v20 = *(void *)(v31.__r_.__value_.__r.__words[0] + 7) == 0x6168706C41646E75)
          : (BOOL v20 = 0),
            !v20))))
    {
      if (size != 9) {
        goto LABEL_54;
      }
      long long v12 = (std::string *)v31.__r_.__value_.__r.__words[0];
LABEL_31:
      std::string::size_type v21 = v12->__r_.__value_.__r.__words[0];
      int v22 = v12->__r_.__value_.__s.__data_[8];
      if (v21 != 0x6E6961506C6C6946 || v22 != 116)
      {
LABEL_54:
        if (std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v31, "StrokePaint"))
        {
          uint64_t v27 = *((void *)a1 + 28);
          __p[0] = &v31;
          *((void *)std::__hash_table<std::__hash_value_type<std::string,FilterResult *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,FilterResult *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,FilterResult *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,FilterResult *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v27, (unsigned __int8 *)&v31, (uint64_t)&std::piecewise_construct, (long long **)__p)+ 5) = v11;
        }
      }
    }
  }
LABEL_56:
  int v28 = SHIBYTE(v31.__r_.__value_.__r.__words[2]);
  *a3 = v11;
  *(_OWORD *)CGFloat v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v10[4] = 0;
  if (v28 < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
}

void sub_210A41EA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGFilterPrimitive::selectPrimitive(SVGFilterPrimitive *this, const char *a2)
{
  long double v3 = (SVGFilterPrimitive *)((char *)this + 64);
  if (*((char *)this + 87) < 0) {
    long double v3 = *(SVGAtom **)v3;
  }
  int v4 = SVGAtom::ToName(v3, a2);
  if (v4 > 102)
  {
    switch(v4)
    {
      case 'x':
        operator new();
      case 'r':
        operator new();
      case 'g':
        operator new();
    }
  }
  else
  {
    switch(v4)
    {
      case '[':
        operator new();
      case '_':
        operator new();
      case 'e':
        operator new();
    }
  }
  return 0;
}

void sub_210A42088(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x1080C40825B58B5);
  _Unwind_Resume(a1);
}

void SVGFilterPrimitive::stringAttr(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  long long v6 = (SVGAttribute *)SVGAttributeMap::attribute(*(void *)(a1 + 56), a2);
  if (v6)
  {
    uint64_t v7 = SVGAttribute::stringValue(v6);
    if ((*(char *)(v7 + 23) & 0x80000000) == 0)
    {
      long long v8 = *(_OWORD *)v7;
      a4->__r_.__value_.__r.__words[2] = *(void *)(v7 + 16);
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v8;
      return;
    }
    CGFloat v9 = *(const std::string::value_type **)v7;
    std::string::size_type v10 = *(void *)(v7 + 8);
  }
  else
  {
    if ((*(char *)(a3 + 23) & 0x80000000) == 0)
    {
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
      a4->__r_.__value_.__r.__words[2] = *(void *)(a3 + 16);
      return;
    }
    CGFloat v9 = *(const std::string::value_type **)a3;
    std::string::size_type v10 = *(void *)(a3 + 8);
  }
  std::string::__init_copy_ctor_external(a4, v9, v10);
}

BOOL std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1) {
        goto LABEL_10;
      }
      a1 = (void *)*a1;
      return memcmp(a1, __s, v4) != 0;
    }
  }
  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1) {
LABEL_10:
    }
      std::string::__throw_out_of_range[abi:ne180100]();
    return memcmp(a1, __s, v4) != 0;
  }
  return 1;
}

id SVGFilterPrimitive::drawFeGaussianBlur(SVGFilterPrimitive *this)
{
  v11[1] = *MEMORY[0x263EF8340];
  double v2 = SVGFilterPrimitive::inputImage<CIImage>((uint64_t)this, 0x58u);
  if (v2)
  {
    double v4 = fmin(SVGFilterPrimitive::pointAttr((uint64_t)this, 0x68u, *MEMORY[0x263F00148]), 100.0);
    if (v4 != fmin(v5, 100.0)) {
      SVGUtilities::log((SVGUtilities *)"Different radii for gaussian blur not supported", v3);
    }
    std::string::size_type v10 = @"inputRadius";
    long long v6 = [NSNumber numberWithDouble:v4];
    v11[0] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    long long v8 = [v2 imageByApplyingFilter:@"CIGaussianBlur" withInputParameters:v7];
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

void sub_210A42328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SVGFilterPrimitive::drawFeOffset(double **this)
{
  double v2 = SVGFilterPrimitive::inputImage<CIImage>((uint64_t)this, 0x58u);
  if (v2)
  {
    double v3 = SVGFilterPrimitive::floatAttr((uint64_t)this, 0x60u, 0.0);
    double v4 = *this[30];
    CGFloat v5 = SVGFilterPrimitive::floatAttr((uint64_t)this, 0x61u, 0.0) * this[30][1];
    memset(&v9, 0, sizeof(v9));
    CGAffineTransformMakeTranslation(&v9, v3 * v4, v5);
    CGAffineTransform v8 = v9;
    long long v6 = [v2 imageByApplyingTransform:&v8];
  }
  else
  {
    long long v6 = 0;
  }

  return v6;
}

void sub_210A42434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SVGFilterPrimitive::drawFeFlood(SVGFilterPrimitive *this)
{
  SVGColor::SVGColor((uint64_t)v15, 0, 0.0, 0.0, 0.0, 1.0);
  SVGFilterPrimitive::colorAttr((uint64_t)this, 0x5Cu, v15, (uint64_t)v16);
  double v17 = SVGFilterPrimitive::floatAttr((uint64_t)this, 0x5Du, 1.0);
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  CGSVGColorCreateRGBA((uint64_t)&v12, v16[0], v16[1], v16[2], v17);
  v10[0] = v12;
  v10[1] = v13;
  uint64_t v11 = v14;
  CGColorRef CGColor = CGSVGColorCreateCGColor((uint64_t)v10);
  double v3 = [MEMORY[0x263F00608] colorWithCGColor:CGColor];
  CGColorRelease(CGColor);
  double v4 = (double *)*((void *)this + 29);
  double v5 = *v4;
  double v6 = v4[1];
  uint64_t v7 = [MEMORY[0x263F00650] imageWithColor:v3];
  CGAffineTransform v8 = objc_msgSend(v7, "imageByCroppingToRect:", 0.0, 0.0, v5, v6);

  return v8;
}

void sub_210A4257C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SVGFilterPrimitive::drawFeComposite(SVGFilterPrimitive *this)
{
  v64[1] = *MEMORY[0x263EF8340];
  double v2 = SVGFilterPrimitive::inputImage<CIImage>((uint64_t)this, 0x58u);
  uint64_t v3 = SVGFilterPrimitive::inputImage<CIImage>((uint64_t)this, 0x59u);
  double v4 = (void *)v3;
  double v5 = 0;
  if (!v2 || !v3) {
    goto LABEL_50;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "over");
  SVGFilterPrimitive::stringAttr((uint64_t)this, 0x73u, (uint64_t)__p, &v48);
  if (v47 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v63 = @"inputBackgroundImage";
  v64[0] = v4;
  CGColorRef v45 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type size = v48.__r_.__value_.__l.__size_;
    if (v48.__r_.__value_.__l.__size_ == 2)
    {
      if (*(_WORD *)v48.__r_.__value_.__l.__data_ == 28265) {
        goto LABEL_30;
      }
      std::string::size_type size = v48.__r_.__value_.__l.__size_;
    }
    else if (v48.__r_.__value_.__l.__size_ == 4 && *(_DWORD *)v48.__r_.__value_.__l.__data_ == 1919252079)
    {
      goto LABEL_44;
    }
    if (size == 3)
    {
      if (*(_WORD *)v48.__r_.__value_.__l.__data_ == 30063 && *(unsigned char *)(v48.__r_.__value_.__r.__words[0] + 2) == 116) {
        goto LABEL_45;
      }
      std::string::size_type size = v48.__r_.__value_.__l.__size_;
    }
    if (size == 4)
    {
      if (*(_DWORD *)v48.__r_.__value_.__l.__data_ == 1886352481) {
        goto LABEL_46;
      }
      std::string::size_type size = v48.__r_.__value_.__l.__size_;
    }
    if (size == 3)
    {
      CGAffineTransform v8 = (std::string *)v48.__r_.__value_.__r.__words[0];
      goto LABEL_37;
    }
LABEL_41:
    if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v48, "arithmetic"))
    {
      double v14 = SVGFilterPrimitive::floatAttr((uint64_t)this, 0x74u, 0.0);
      double v15 = SVGFilterPrimitive::floatAttr((uint64_t)this, 0x75u, 0.0);
      double v16 = SVGFilterPrimitive::floatAttr((uint64_t)this, 0x76u, 0.0);
      double v17 = SVGFilterPrimitive::floatAttr((uint64_t)this, 0x77u, 0.0);
      uint64_t v44 = [v2 imageByApplyingFilter:@"CIMultiplyCompositing" withInputParameters:v45];
      v57[0] = @"inputRVector";
      int v18 = [MEMORY[0x263F00680] vectorWithX:v14 Y:0.0 Z:0.0 W:0.0];
      v58[0] = v18;
      v57[1] = @"inputGVector";
      BOOL v19 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:v14 Z:0.0 W:0.0];
      v58[1] = v19;
      v57[2] = @"inputBVector";
      BOOL v20 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:0.0 Z:v14 W:0.0];
      v58[2] = v20;
      v57[3] = @"inputAVector";
      std::string::size_type v21 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:0.0 Z:0.0 W:v14];
      v58[3] = v21;
      v57[4] = @"inputBiasVector";
      int v22 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
      v58[4] = v22;
      uint64_t v23 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:5];
      uint64_t v43 = [v44 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v23];

      v55[0] = @"inputRVector";
      long long v24 = [MEMORY[0x263F00680] vectorWithX:v15 Y:0.0 Z:0.0 W:0.0];
      v56[0] = v24;
      v55[1] = @"inputGVector";
      long long v25 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:v15 Z:0.0 W:0.0];
      v56[1] = v25;
      v55[2] = @"inputBVector";
      CGAffineTransform v26 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:0.0 Z:v15 W:0.0];
      v56[2] = v26;
      v55[3] = @"inputAVector";
      uint64_t v27 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:0.0 Z:0.0 W:v15];
      char v56[3] = v27;
      v55[4] = @"inputBiasVector";
      int v28 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
      v56[4] = v28;
      long long v29 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:5];
      uint64_t v42 = [v2 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v29];

      uint64_t v53 = @"inputBackgroundImage";
      CFStringRef v54 = v42;
      char v30 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      std::string v31 = [v43 imageByApplyingFilter:@"CIAdditionCompositing" withInputParameters:v30];

      v51[0] = @"inputRVector";
      uint64_t v32 = [MEMORY[0x263F00680] vectorWithX:v16 Y:0.0 Z:0.0 W:0.0];
      v52[0] = v32;
      v51[1] = @"inputGVector";
      uint64_t v33 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:v16 Z:0.0 W:0.0];
      v52[1] = v33;
      _OWORD v51[2] = @"inputBVector";
      char v34 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:0.0 Z:v16 W:0.0];
      v52[2] = v34;
      v51[3] = @"inputAVector";
      long long v35 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:0.0 Z:0.0 W:v16];
      v52[3] = v35;
      v51[4] = @"inputBiasVector";
      uint64_t v36 = [MEMORY[0x263F00680] vectorWithX:v17 Y:v17 Z:v17 W:v17];
      v52[4] = v36;
      uint64_t v37 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:5];
      uint64_t v38 = [v4 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v37];

      long long v49 = @"inputBackgroundImage";
      uint64_t v50 = v38;
      long long v39 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      double v5 = [v31 imageByApplyingFilter:@"CIAdditionCompositing" withInputParameters:v39];

LABEL_43:
      goto LABEL_48;
    }
    goto LABEL_44;
  }
  if (HIBYTE(v48.__r_.__value_.__r.__words[2]) != 2)
  {
    if (HIBYTE(v48.__r_.__value_.__r.__words[2]) != 3)
    {
      if (HIBYTE(v48.__r_.__value_.__r.__words[2]) != 4) {
        goto LABEL_41;
      }
      if (LODWORD(v48.__r_.__value_.__l.__data_) != 1886352481)
      {
        if (LODWORD(v48.__r_.__value_.__l.__data_) != 1919252079) {
          goto LABEL_35;
        }
LABEL_44:
        CGAffineTransform v9 = @"CISourceOverCompositing";
        goto LABEL_47;
      }
LABEL_46:
      CGAffineTransform v9 = @"CISourceAtopCompositing";
      goto LABEL_47;
    }
    if (LOWORD(v48.__r_.__value_.__l.__data_) != 30063 || v48.__r_.__value_.__s.__data_[2] != 116)
    {
LABEL_35:
      if (HIBYTE(v48.__r_.__value_.__r.__words[2]) == 3)
      {
        CGAffineTransform v8 = &v48;
LABEL_37:
        int data_low = LOWORD(v8->__r_.__value_.__l.__data_);
        int v12 = v8->__r_.__value_.__s.__data_[2];
        if (data_low == 28536 && v12 == 114)
        {
          uint64_t v44 = [v2 imageByApplyingFilter:@"CISourceOutCompositing" withInputParameters:v45];
          unsigned __int8 v61 = @"inputBackgroundImage";
          v62 = v2;
          uint64_t v43 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          uint64_t v41 = objc_msgSend(v4, "imageByApplyingFilter:withInputParameters:", @"CISourceOutCompositing");
          CGFloat v59 = @"inputBackgroundImage";
          uint64_t v60 = v41;
          uint64_t v42 = (void *)v41;
          std::string v31 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
          double v5 = [v44 imageByApplyingFilter:@"CISourceOverCompositing" withInputParameters:v31];
          goto LABEL_43;
        }
        goto LABEL_41;
      }
      goto LABEL_41;
    }
LABEL_45:
    CGAffineTransform v9 = @"CISourceOutCompositing";
    goto LABEL_47;
  }
  if (LOWORD(v48.__r_.__value_.__l.__data_) != 28265) {
    goto LABEL_41;
  }
LABEL_30:
  CGAffineTransform v9 = @"CISourceInCompositing";
LABEL_47:
  double v5 = [v2 imageByApplyingFilter:v9 withInputParameters:v45];
LABEL_48:

  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
LABEL_50:

  return v5;
}

void sub_210A42E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id SVGFilterPrimitive::drawFeBlend(SVGFilterPrimitive *this)
{
  v24[1] = *MEMORY[0x263EF8340];
  double v2 = SVGFilterPrimitive::inputImage<CIImage>((uint64_t)this, 0x58u);
  uint64_t v3 = SVGFilterPrimitive::inputImage<CIImage>((uint64_t)this, 0x59u);
  double v4 = (void *)v3;
  double v5 = 0;
  if (!v2 || !v3) {
    goto LABEL_54;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "normal");
  SVGFilterPrimitive::stringAttr((uint64_t)this, 0x66u, (uint64_t)__p, &v22);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v23 = @"inputBackgroundImage";
  v24[0] = v4;
  double v6 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  if ((SHIBYTE(v22.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (HIBYTE(v22.__r_.__value_.__r.__words[2]) != 6)
    {
      if (HIBYTE(v22.__r_.__value_.__r.__words[2]) != 7)
      {
        if (HIBYTE(v22.__r_.__value_.__r.__words[2]) != 8 || v22.__r_.__value_.__r.__words[0] != 0x796C7069746C756DLL) {
          goto LABEL_51;
        }
        goto LABEL_57;
      }
      uint64_t v11 = &v22;
LABEL_33:
      datdouble a = (int)v11->__r_.__value_.__l.__data_;
      int v13 = *(_DWORD *)((char *)v11->__r_.__value_.__r.__words + 3);
      if (data == 1751607660 && v13 == 1852142696)
      {
        double v15 = @"CILightenBlendMode";
        goto LABEL_52;
      }
      goto LABEL_51;
    }
    if (LODWORD(v22.__r_.__value_.__l.__data_) == 1836216174 && WORD2(v22.__r_.__value_.__r.__words[0]) == 27745) {
      goto LABEL_51;
    }
    if (LODWORD(v22.__r_.__value_.__l.__data_) != 1701995379 || WORD2(v22.__r_.__value_.__r.__words[0]) != 28261)
    {
      if (LODWORD(v22.__r_.__value_.__l.__data_) != 1802658148 || WORD2(v22.__r_.__value_.__r.__words[0]) != 28261) {
        goto LABEL_51;
      }
      goto LABEL_59;
    }
LABEL_58:
    double v15 = @"CIScreenBlendMode";
    goto LABEL_52;
  }
  std::string::size_type size = v22.__r_.__value_.__l.__size_;
  if (v22.__r_.__value_.__l.__size_ == 6
    && *(_DWORD *)v22.__r_.__value_.__l.__data_ == 1836216174
    && *(_WORD *)(v22.__r_.__value_.__r.__words[0] + 4) == 27745)
  {
    goto LABEL_51;
  }
  if (v22.__r_.__value_.__l.__size_ == 8)
  {
    if (*(void *)v22.__r_.__value_.__l.__data_ == 0x796C7069746C756DLL)
    {
LABEL_57:
      double v15 = @"CIMultiplyBlendMode";
      goto LABEL_52;
    }
    std::string::size_type size = v22.__r_.__value_.__l.__size_;
  }
  if (size != 6) {
    goto LABEL_30;
  }
  if (*(_DWORD *)v22.__r_.__value_.__l.__data_ == 1701995379
    && *(_WORD *)(v22.__r_.__value_.__r.__words[0] + 4) == 28261)
  {
    goto LABEL_58;
  }
  std::string::size_type size = v22.__r_.__value_.__l.__size_;
  if (v22.__r_.__value_.__l.__size_ != 6)
  {
LABEL_30:
    if (size == 7)
    {
      uint64_t v11 = (std::string *)v22.__r_.__value_.__r.__words[0];
      goto LABEL_33;
    }
LABEL_51:
    double v15 = @"CISourceOverCompositing";
    goto LABEL_52;
  }
  if (*(_DWORD *)v22.__r_.__value_.__l.__data_ != 1802658148
    || *(_WORD *)(v22.__r_.__value_.__r.__words[0] + 4) != 28261)
  {
    if ((*((unsigned char *)&v22.__r_.__value_.__s + 23) & 0x80) == 0) {
      goto LABEL_51;
    }
    goto LABEL_30;
  }
LABEL_59:
  double v15 = @"CIDarkenBlendMode";
LABEL_52:
  double v5 = [v2 imageByApplyingFilter:v15 withInputParameters:v6];

  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
LABEL_54:

  return v5;
}

void sub_210A43330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void SVGFilterPrimitive::drawFeConvolveMatrix(SVGFilterPrimitive *this@<X0>, _OWORD *a2@<X8>)
{
  double v4 = (const vImage_Buffer *)SVGFilterPrimitive::inputImage<vImage_Buffer>((uint64_t)this, 0x58u);
  if (v4)
  {
    double v5 = v4;
    CGAffineTransform v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v6 = SVGFilterPrimitive::floatsAttr((uint64_t)this, 0x7Au, (uint64_t)&v26);
    if (MEMORY[0x216677E80](&dest, v5->height, v5->width, *(unsigned int *)(*(void *)(*((void *)this + 26) + 8) + 4), 0))
    {
      *(void *)a2 = 0;
    }
    else
    {
      v23.datdouble a = 0;
      uint64_t v7 = &v24;
      vImage_Buffer v24 = dest;
      uint64_t v8 = *(void *)(v6 + 8) - *(void *)v6;
      if (v8
        && (unint64_t v9 = v8 >> 3, v10 = sqrt((double)(unint64_t)(v8 >> 3)), v8 >> 3 == v10 * v10)
        && SVGFilterPrimitive::floatAttr((uint64_t)this, 0x79u, (double)v10) == (double)v10)
      {
        int v12 = *(double **)v6;
        int v13 = *(double **)(v6 + 8);
        if (*(double **)v6 == v13)
        {
          double v16 = 0.0;
        }
        else
        {
          int v14 = 0;
          do
          {
            double v15 = *v12++;
            int v14 = (int)(v15 + (double)v14);
          }
          while (v12 != v13);
          double v16 = (double)v14;
        }
        int32_t divisor = (int)SVGFilterPrimitive::floatAttr((uint64_t)this, 0x7Bu, v16);
        if (divisor)
        {
          double v18 = SVGFilterPrimitive::floatAttr((uint64_t)this, 0x7Cu, 0.0);
          *(void *)color = 0;
          char v21 = 0;
          uint64_t v22 = 0;
          std::vector<short>::reserve((void **)color, v9);
          std::transform[abi:ne180100]<std::__wrap_iter<double *>,std::back_insert_iterator<std::vector<short>>,SVGFilterPrimitive::drawFeConvolveMatrix(void)::$_1>(*(uint64_t **)v6, *(void **)(v6 + 8), (uint64_t)color);
          if (vImageConvolveWithBias_ARGB8888(v5, &dest, 0, 0, 0, *(const int16_t **)color, v10, v10, divisor, (int)(v18 * (double)divisor * 255.0), 0, 8u))
          {
            free(dest.data);
            *(void *)a2 = 0;
          }
          else
          {
            long long v19 = *(_OWORD *)&dest.width;
            *a2 = *(_OWORD *)&dest.data;
            a2[1] = v19;
          }
          if (*(void *)color)
          {
            char v21 = *(const int16_t **)color;
            operator delete(*(void **)color);
          }
        }
        else
        {
          SVGFilterPrimitive::drawFeConvolveMatrix(void)const::$_0::operator()(&v23, a2);
        }
      }
      else
      {
        *(_DWORD *)color = 0;
        if (vImageBufferFill_ARGB8888(&v24, color, 0))
        {
          free(v24.data);
          uint64_t v7 = &v23;
        }
        long long v11 = *(_OWORD *)&v7->width;
        *a2 = *(_OWORD *)&v7->data;
        a2[1] = v11;
      }
    }
    if (v26)
    {
      uint64_t v27 = v26;
      operator delete(v26);
    }
  }
  else
  {
    *(void *)a2 = 0;
  }
}

void sub_210A4360C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  double v16 = *(void **)(v14 - 104);
  if (v16)
  {
    *(void *)(v14 - 96) = v16;
    operator delete(v16);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *SVGFilterPrimitive::inputImage<FilterResult>(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = (SVGAttribute *)SVGAttributeMap::attribute(*(void *)(a1 + 56), a2);
  if (v3)
  {
    double v4 = (unsigned __int8 *)SVGAttribute::stringValue(v3);
    uint64_t result = std::__hash_table<std::__hash_value_type<std::string,FilterResult *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,FilterResult *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,FilterResult *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,FilterResult *>>>::find<std::string>(*(void **)(a1 + 224), v4);
    if (!result) {
      return result;
    }
    uint64_t v6 = result + 40;
  }
  else
  {
    uint64_t v6 = (unsigned __int8 *)(a1 + 216);
  }
  return *(unsigned __int8 **)v6;
}

unsigned __int8 *SVGFilterPrimitive::inputImage<CIImage>(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = SVGFilterPrimitive::inputImage<FilterResult>(a1, a2);
  if (v3)
  {
    double v4 = (void **)v3;
    double v5 = *(void **)v3;
    if (*(void *)v3)
    {
LABEL_3:
      uint64_t v3 = v5;
      goto LABEL_6;
    }
    uint64_t v11 = 0;
    uint64_t v6 = (CGImage *)MEMORY[0x216677EB0](v3 + 8, *(void *)(*(void *)(a1 + 208) + 8), 0, 0, 0, &v11);
    uint64_t v7 = v6;
    if (!v11)
    {
      uint64_t v9 = [MEMORY[0x263F00650] imageWithCGImage:v6];
      uint32_t v10 = *v4;
      unsigned __int8 *v4 = (void *)v9;

      CGImageRelease(v7);
      double v5 = *v4;
      goto LABEL_3;
    }
    CGImageRelease(v6);
    uint64_t v3 = 0;
  }
LABEL_6:
  return v3;
}

_OWORD *SVGFilterPrimitive::inputImage<vImage_Buffer>(uint64_t a1, unsigned int a2)
{
  v11[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = SVGFilterPrimitive::inputImage<FilterResult>(a1, a2);
  if (!v3) {
    return 0;
  }
  double v4 = v3 + 8;
  if (!*((void *)v3 + 1))
  {
    double v5 = (CGImage *)objc_msgSend(**(id **)(a1 + 208), "createCGImage:fromRect:", *(void *)v3, 0.0, 0.0, **(double **)(a1 + 232), *(double *)(*(void *)(a1 + 232) + 8));
    memset(v11, 0, 24);
    uint64_t v6 = MEMORY[0x216677E90](v10, *(void *)(*(void *)(a1 + 208) + 8), v11, v5, 0);
    CGImageRelease(v5);
    uint64_t v7 = 0;
    if (!v6)
    {
      long long v8 = v10[1];
      _OWORD *v4 = v10[0];
      v4[1] = v8;
      return v4;
    }
    return (_OWORD *)v7;
  }
  return v4;
}

double SVGFilterPrimitive::pointAttr(uint64_t a1, unsigned int a2, double a3)
{
  uint64_t v5 = SVGAttributeMap::attribute(*(void *)(a1 + 56), a2);
  if (v5)
  {
    uint64_t v9 = 0;
    if (SVGAttribute::floatsValue(v5, &v9))
    {
      uint64_t v6 = *(double **)v9;
      uint64_t v7 = (uint64_t)(*(void *)(v9 + 8) - *(void *)v9) >> 3;
      if (v7 == 2)
      {
        return *v6 * **(double **)(a1 + 240);
      }
      else if (v7 == 1)
      {
        return *v6 * **(double **)(a1 + 240);
      }
    }
  }
  return a3;
}

double SVGFilterPrimitive::floatAttr(uint64_t a1, unsigned int a2, double a3)
{
  double v4 = (os_unfair_lock_s *)SVGAttributeMap::attribute(*(void *)(a1 + 56), a2);
  if (v4)
  {
    double v6 = 0.0;
    if (SVGAttribute::floatValue(v4, &v6)) {
      return v6;
    }
  }
  return a3;
}

uint64_t SVGFilterPrimitive::floatsAttr(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = SVGAttributeMap::attribute(*(void *)(a1 + 56), a2);
  if (v4)
  {
    uint64_t v6 = 0;
    if (SVGAttribute::floatsValue(v4, &v6)) {
      return v6;
    }
  }
  return a3;
}

double SVGFilterPrimitive::colorAttr@<D0>(uint64_t a1@<X0>, unsigned int a2@<W1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = (os_unfair_lock_s *)SVGAttributeMap::attribute(*(void *)(a1 + 56), a2);
  if (v6)
  {
    uint64_t v9 = 0;
    if (SVGAttribute::paintValue(v6, &v9))
    {
      if (*((_DWORD *)v9 + 12) == 1) {
        a3 = (char *)v9 + 56;
      }
      else {
        SVGUtilities::log((SVGUtilities *)"feFlood with non-color paint not supported", v7);
      }
    }
    *(void *)&double result = SVGColor::SVGColor(a4, (uint64_t)a3).n128_u64[0];
  }
  else
  {
    *(void *)&double result = SVGColor::SVGColor(a4, (uint64_t)a3).n128_u64[0];
  }
  return result;
}

BOOL std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1) {
        goto LABEL_10;
      }
      a1 = (void *)*a1;
      return memcmp(a1, __s, v4) == 0;
    }
  }
  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1) {
LABEL_10:
    }
      std::string::__throw_out_of_range[abi:ne180100]();
    return memcmp(a1, __s, v4) == 0;
  }
  return 0;
}

__n128 SVGFilterPrimitive::drawFeConvolveMatrix(void)const::$_0::operator()@<Q0>(const vImage_Buffer *a1@<X0>, _OWORD *a2@<X8>)
{
  double v2 = a1;
  *(_DWORD *)color = 0;
  p_datdouble a = &a1[1].data;
  if (vImageBufferFill_ARGB8888(a1 + 1, color, 0)) {
    free(*p_data);
  }
  else {
    double v2 = (const vImage_Buffer *)p_data;
  }
  __n128 result = *(__n128 *)&v2->data;
  long long v6 = *(_OWORD *)&v2->width;
  *a2 = *(_OWORD *)&v2->data;
  a2[1] = v6;
  return result;
}

void std::vector<short>::reserve(void **a1, unint64_t a2)
{
  size_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 1)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    long long v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFELL];
    uint64_t v9 = &v6[2 * v8];
    uint32_t v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    int v12 = v7;
    if (v11 != *a1)
    {
      int v12 = v7;
      do
      {
        __int16 v13 = *((_WORD *)v11 - 1);
        v11 -= 2;
        *((_WORD *)v12 - 1) = v13;
        v12 -= 2;
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

uint64_t *std::transform[abi:ne180100]<std::__wrap_iter<double *>,std::back_insert_iterator<std::vector<short>>,SVGFilterPrimitive::drawFeConvolveMatrix(void)::$_1>(uint64_t *result, void *a2, uint64_t a3)
{
  uint64_t v7 = a3;
  if (result != a2)
  {
    size_t v4 = (double *)result;
    do
    {
      double v5 = *v4++;
      __int16 v6 = llround(v5);
      __n128 result = std::back_insert_iterator<std::vector<short>>::operator=[abi:ne180100](&v7, &v6);
    }
    while (v4 != (double *)a2);
  }
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,FilterResult *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,FilterResult *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,FilterResult *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,FilterResult *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  uint64_t v8 = (void *)(a1 + 24);
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
    uint64_t v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
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
  std::__hash_table<std::__hash_value_type<std::string,FilterResult *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,FilterResult *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,FilterResult *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,FilterResult *>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
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
    std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__rehash<true>(a1, v22);
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
  vImage_Buffer v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *vImage_Buffer v23 = v26[0];
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

void sub_210A43EA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,FilterResult *>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,FilterResult *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,FilterResult *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,FilterResult *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,FilterResult *>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint64_t v8 = operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  void *v8 = 0;
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
  void v8[5] = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_210A43F5C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,FilterResult *>,void *>>>::operator()[abi:ne180100](v3, v2);
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
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      size_t v22 = a2 + 4;
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
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
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
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
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

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,FilterResult *>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
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

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,FilterResult *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,FilterResult *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,FilterResult *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,FilterResult *>>>::find<std::string>(void *a1, unsigned __int8 *a2)
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
      if (v13 == v6)
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

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

uint64_t *std::back_insert_iterator<std::vector<short>>::operator=[abi:ne180100](uint64_t *a1, _WORD *a2)
{
  uint64_t v4 = *a1;
  int8x8_t v5 = *(_WORD **)(*a1 + 8);
  unint64_t v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    unint64_t v8 = *(_WORD **)v4;
    uint64_t v9 = (uint64_t)v5 - *(void *)v4;
    if (v9 <= -3) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v9 >> 1;
    unint64_t v11 = *v6 - (void)v8;
    if (v11 <= (v9 >> 1) + 1) {
      uint64_t v12 = v10 + 1;
    }
    else {
      uint64_t v12 = *v6 - (void)v8;
    }
    if (v11 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v13 = v12;
    }
    if (v13)
    {
      BOOL v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)v6, v13);
      unint64_t v8 = *(_WORD **)v4;
      int8x8_t v5 = *(_WORD **)(v4 + 8);
    }
    else
    {
      BOOL v14 = 0;
    }
    uint64_t v15 = &v14[2 * v10];
    unint64_t v16 = &v14[2 * v13];
    *(_WORD *)uint64_t v15 = *a2;
    uint8x8_t v7 = v15 + 2;
    while (v5 != v8)
    {
      __int16 v17 = *--v5;
      *((_WORD *)v15 - 1) = v17;
      v15 -= 2;
    }
    *(void *)uint64_t v4 = v15;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v16;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *int8x8_t v5 = *a2;
    uint8x8_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

void CGSVGShapeNodeCreate()
{
}

void sub_210A4477C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4099030930);
  _Unwind_Resume(a1);
}

SVGPath *CGSVGShapeNodeSetPath(uint64_t a1, const char *a2)
{
  uint64_t v3 = (SVGShapeNode *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  uint64_t result = (SVGPath *)CFRetained::getObject<SVGPath>((uint64_t)a2, v4);
  if (v3 && result)
  {
    SVGShapeNode::setPath(v3, result);
  }
  return result;
}

CGPath *CGSVGShapeNodeCreateCGPath(uint64_t a1, const char *a2)
{
  uint64_t result = (CGPath *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (result)
  {
    return SVGShapeNode::createCGPath(result);
  }
  return result;
}

void CGSVGShapeNodeSetFloats(uint64_t a1, uint64_t a2, unint64_t a3)
{
  std::string __p = 0;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  SVGUtilities::CGPointListFromFloats(a2, a3, (uint64_t)&__p);
  if (CFRetained::getObject<SVGShapeNode>(a1, v4)) {
    SVGShapeNode::setPointList();
  }
  if (__p)
  {
    unint64_t v6 = __p;
    operator delete(__p);
  }
}

void sub_210A44898(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double *CGSVGShapeNodeSetRectGeometry(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  uint64_t result = (double *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (result)
  {
    if (*((_DWORD *)result + 74) == 49)
    {
      result[26] = a3;
      result[27] = a4;
      result[30] = a5;
      result[31] = a6;
      result[32] = a7;
      result[33] = a8;
    }
  }
  return result;
}

double CGSVGShapeNodeGetRectGeometry(uint64_t a1, char *a2, void *a3, void *a4, void *a5, void *a6, double *a7)
{
  uint64_t v13 = (double *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (v13)
  {
    if (*((_DWORD *)v13 + 74) == 49)
    {
      *(double *)a2 = v13[26];
      *a3 = *((void *)v13 + 27);
      *a4 = *((void *)v13 + 30);
      *a5 = *((void *)v13 + 31);
      *a6 = *((void *)v13 + 32);
      double result = v13[33];
      *a7 = result;
    }
  }
  return result;
}

double *CGSVGShapeNodeSetCircleGeometry(uint64_t a1, const char *a2, double a3, double a4, double a5)
{
  double result = (double *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (result)
  {
    if (*((_DWORD *)result + 74) == 3)
    {
      result[34] = a3;
      result[35] = a4;
      result[36] = a5;
    }
  }
  return result;
}

double CGSVGShapeNodeGetCircleGeometry(uint64_t a1, char *a2, void *a3, double *a4)
{
  uint64_t v7 = (double *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (v7)
  {
    if (*((_DWORD *)v7 + 74) == 3)
    {
      *(double *)a2 = v7[34];
      *a3 = *((void *)v7 + 35);
      double result = v7[36];
      *a4 = result;
    }
  }
  return result;
}

double *CGSVGShapeNodeSetEllipseGeometry(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  double result = (double *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (result)
  {
    if (*((_DWORD *)result + 74) == 16)
    {
      result[34] = a3;
      result[35] = a4;
      result[32] = a5;
      result[33] = a6;
    }
  }
  return result;
}

double CGSVGShapeNodeGetEllipseGeometry(uint64_t a1, char *a2, void *a3, void *a4, double *a5)
{
  uint64_t v9 = (double *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (v9)
  {
    if (*((_DWORD *)v9 + 74) == 16)
    {
      *(double *)a2 = v9[34];
      *a3 = *((void *)v9 + 35);
      *a4 = *((void *)v9 + 32);
      double result = v9[33];
      *a5 = result;
    }
  }
  return result;
}

double *CGSVGShapeNodeSetLineGeometry(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  double result = (double *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (result)
  {
    if (*((_DWORD *)result + 74) == 32)
    {
      result[26] = a3;
      result[27] = a4;
      result[28] = a5;
      result[29] = a6;
    }
  }
  return result;
}

double CGSVGShapeNodeGetLineGeometry(uint64_t a1, char *a2, void *a3, void *a4, double *a5)
{
  uint64_t v9 = (double *)CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (v9)
  {
    if (*((_DWORD *)v9 + 74) == 32)
    {
      *(double *)a2 = v9[26];
      *a3 = *((void *)v9 + 27);
      *a4 = *((void *)v9 + 28);
      double result = v9[29];
      *a5 = result;
    }
  }
  return result;
}

CFStringRef CGSVGShapeNodeCopyText(uint64_t a1, const char *a2)
{
  uint64_t v2 = CFRetained::getObject<SVGShapeNode>(a1, a2);
  if (!v2) {
    return 0;
  }
  if (v2[74] != 10001) {
    return 0;
  }
  uint64_t v3 = (const char *)*((void *)v2 + 24);
  if (!v3) {
    return 0;
  }
  if (v3[23] < 0)
  {
    uint64_t v3 = *(const char **)v3;
    if (!v3) {
      return 0;
    }
  }
  if (!*v3) {
    return 0;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  return CFStringCreateWithCString(v4, v3, 0x8000100u);
}

BOOL CGSVGLengthEqualToLength(uint64_t a1, int a2, uint64_t a3, int a4)
{
  return a2 == a4 && vabdd_f64(*(double *)&a1, *(double *)&a3) < 0.00000011920929;
}

double CGSVGLengthScaledLength(uint64_t a1, int a2, double a3)
{
  double result = *(double *)&a1;
  if (a2 == 1) {
    return *(double *)&a1 * a3 / 100.0;
  }
  return result;
}

void CGSVGPointMake(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(double *)a1 = a2;
  *(_DWORD *)(a1 + 8) = 0;
  *(double *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 24) = 0;
}

uint64_t CGSVGPointMakeWithTypes@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  *(double *)a3 = a4;
  *(_DWORD *)(a3 + 8) = result;
  *(double *)(a3 + 16) = a5;
  *(_DWORD *)(a3 + 24) = a2;
  return result;
}

void CGSVGPointMakeWithPoint(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(double *)a1 = a2;
  *(_DWORD *)(a1 + 8) = 0;
  *(double *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 24) = 0;
}

BOOL CGSVGPointEqualToPoint(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8)
      && vabdd_f64(*(double *)a1, *(double *)a2) < 0.00000011920929
      && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24)
      && vabdd_f64(*(double *)(a1 + 16), *(double *)(a2 + 16)) < 0.00000011920929;
}

double CGSVGPointScaledPoint(uint64_t a1, double a2)
{
  double result = *(double *)a1;
  if (*(_DWORD *)(a1 + 8) == 1) {
    return result * a2 / 100.0;
  }
  return result;
}

uint64_t CGSVGPatternGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A44DE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGPatternCreate()
{
}

void sub_210A44E44(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C40BA4B7CADLL);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGPatternRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGPatternRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void sub_210A44FE4(_Unwind_Exception *a1)
{
  uint64_t v6 = v2;
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(v4, *(char **)(v1 + 168));
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(v6, *(char **)(v1 + 144));
  unint64_t v8 = *(void **)(v1 + 112);
  if (v8)
  {
    *(void *)(v1 + 120) = v8;
    operator delete(v8);
  }
  uint64_t v9 = *v5;
  if (*v5)
  {
    *(void *)(v1 + 96) = v9;
    operator delete(v9);
  }
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v3);
  }
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void SVGNode::copy(SVGNode *this)
{
}

void sub_210A450F4(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4060DEF9A3);
  _Unwind_Resume(a1);
}

void SVGNode::setAttributes(SVGNode *this, const SVGAttributeMap *a2)
{
}

void sub_210A451C8(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4084D8EEBALL);
  _Unwind_Resume(a1);
}

void SVGNode::setAttribute(SVGNode *this, SVGAttribute *a2)
{
}

void SVGNode::updateChildIdentifer(SVGNode *this, SVGNode *a2, char *__s)
{
  uint64_t v6 = (uint64_t **)((char *)this + 136);
  int8x8_t v5 = (SVGNode *)*((void *)this + 17);
  if (v5 == (SVGNode *)((char *)this + 144))
  {
LABEL_9:
    if (!__s) {
      return;
    }
    goto LABEL_12;
  }
  while (*((SVGNode **)v5 + 7) != a2)
  {
    uint64_t v7 = (SVGNode *)*((void *)v5 + 1);
    if (v7)
    {
      do
      {
        unint64_t v8 = v7;
        uint64_t v7 = *(SVGNode **)v7;
      }
      while (v7);
    }
    else
    {
      do
      {
        unint64_t v8 = (SVGNode *)*((void *)v5 + 2);
        BOOL v9 = *(void *)v8 == (void)v5;
        int8x8_t v5 = v8;
      }
      while (!v9);
    }
    int8x8_t v5 = v8;
    if (v8 == (SVGNode *)((char *)this + 144)) {
      goto LABEL_9;
    }
  }
  std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__erase_unique<std::string>((uint64_t **)this + 17, (uint64_t)v5 + 32);
  if (__s)
  {
LABEL_12:
    if (*__s)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, __s);
      uint64_t v12 = a2;
      std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,SVGNode *>>(v6, (uint64_t)__p, (uint64_t)__p);
      if (v11 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_210A452D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGNode::setIdentifier(SVGNode *this, char *a2)
{
  if (a2 && *a2)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, a2);
    SVGAttributeMap::setAttribute();
  }
  uint64_t v2 = *((void *)this + 7);
  SVGAttributeMap::removeAttribute(v2, 0x1Fu);
}

void sub_210A45374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGNode::setIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2) {
    SVGAttributeMap::setAttribute();
  }
  SVGAttributeMap::removeAttribute(v3, 0x1Fu);
}

void SVGNode::addDefinitionChild(SVGNode *this, SVGNode *a2)
{
  if (a2 == this)
  {
    SVGUtilities::error((SVGUtilities *)"Warning: attempted to add a node to itself, causing a cycle. Ignoring.", (const char *)a2);
  }
  else if (a2)
  {
    unint64_t v6 = *((void *)this + 16);
    uint64_t v4 = (char *)this + 128;
    unint64_t v5 = v6;
    uint64_t v7 = (void *)*((void *)v4 - 1);
    if ((unint64_t)v7 >= v6)
    {
      BOOL v9 = (void **)(v4 - 16);
      uint64_t v10 = *((void *)v4 - 2);
      uint64_t v11 = ((uint64_t)v7 - v10) >> 3;
      if ((unint64_t)(v11 + 1) >> 61) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v5 - v10;
      uint64_t v13 = v12 >> 2;
      if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
        uint64_t v13 = v11 + 1;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14) {
        uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v4, v14);
      }
      else {
        uint64_t v15 = 0;
      }
      unint64_t v16 = &v15[8 * v11];
      __int16 v17 = &v15[8 * v14];
      *(void *)unint64_t v16 = a2;
      unint64_t v8 = v16 + 8;
      uint64_t v19 = (char *)*((void *)this + 14);
      uint64_t v18 = (char *)*((void *)this + 15);
      if (v18 != v19)
      {
        do
        {
          uint64_t v20 = *((void *)v18 - 1);
          v18 -= 8;
          *((void *)v16 - 1) = v20;
          v16 -= 8;
        }
        while (v18 != v19);
        uint64_t v18 = (char *)*v9;
      }
      *((void *)this + 14) = v16;
      *((void *)this + 15) = v8;
      *((void *)this + 16) = v17;
      if (v18) {
        operator delete(v18);
      }
    }
    else
    {
      void *v7 = a2;
      unint64_t v8 = v7 + 1;
    }
    *((void *)this + 15) = v8;
    CFRetained::retain((CFTypeRef *)a2);
    *((void *)a2 + 6) = this;
  }
}

void SVGNode::replaceChildWithChild(SVGNode *this, CFTypeRef *a2, CFTypeRef *a3)
{
  uint64_t v7 = (CFTypeRef **)*((void *)this + 11);
  unint64_t v6 = (CFTypeRef **)*((void *)this + 12);
  if (v7 != v6)
  {
    while (*v7 != a2)
    {
      if (++v7 == v6)
      {
        uint64_t v7 = (CFTypeRef **)*((void *)this + 12);
        break;
      }
    }
  }
  if (v7 != v6)
  {
    if (SVGNode::identifier((SVGNode *)a2) && *SVGNode::identifier((SVGNode *)a2))
    {
      unint64_t v8 = SVGNode::identifier((SVGNode *)a2);
      std::string::basic_string[abi:ne180100]<0>(__p, v8);
      uint64_t v9 = std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__count_unique<std::string>((uint64_t)this + 136, (uint64_t)__p);
      uint64_t v10 = v9;
      if ((v15 & 0x80000000) == 0)
      {
        if (!v9) {
          goto LABEL_14;
        }
LABEL_12:
        uint64_t v11 = SVGNode::identifier((SVGNode *)a2);
        std::string::basic_string[abi:ne180100]<0>(__p, v11);
        uint64_t v12 = std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::find<std::string>((uint64_t)this + 136, (uint64_t)__p);
        std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::erase((uint64_t **)this + 17, (uint64_t)v12);
        if (v15 < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_14;
      }
      operator delete(__p[0]);
      if (v10) {
        goto LABEL_12;
      }
    }
LABEL_14:
    CFRetained::release(*v7);
    void *v7 = a3;
    CFRetained::retain(a3);
    a3[6] = this;
    if (SVGNode::identifier((SVGNode *)a3) && *SVGNode::identifier((SVGNode *)a3))
    {
      uint64_t v13 = SVGNode::identifier((SVGNode *)a3);
      std::string::basic_string[abi:ne180100]<0>(__p, v13);
      unint64_t v16 = a3;
      std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,SVGNode *>>((uint64_t **)this + 17, (uint64_t)__p, (uint64_t)__p);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_210A45658(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGNode::removeChildAtIndex(SVGNode *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 11);
  if (a2 >= (*((void *)this + 12) - v2) >> 3) {
    return;
  }
  unint64_t v5 = *(SVGNode **)(v2 + 8 * a2);
  if (SVGNode::identifier(v5) && *SVGNode::identifier(v5))
  {
    unint64_t v6 = SVGNode::identifier(v5);
    std::string::basic_string[abi:ne180100]<0>(__p, v6);
    uint64_t v7 = std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__count_unique<std::string>((uint64_t)this + 136, (uint64_t)__p);
    uint64_t v8 = v7;
    if ((v15 & 0x80000000) == 0)
    {
      if (!v7) {
        goto LABEL_10;
      }
LABEL_8:
      uint64_t v9 = SVGNode::identifier(v5);
      std::string::basic_string[abi:ne180100]<0>(__p, v9);
      uint64_t v10 = std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::find<std::string>((uint64_t)this + 136, (uint64_t)__p);
      std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::erase((uint64_t **)this + 17, (uint64_t)v10);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
      goto LABEL_10;
    }
    operator delete(__p[0]);
    if (v8) {
      goto LABEL_8;
    }
  }
LABEL_10:
  uint64_t v11 = *((void *)this + 12);
  uint64_t v12 = *((void *)this + 11) + 8 * a2;
  uint64_t v13 = v11 - (v12 + 8);
  if (v11 != v12 + 8) {
    memmove((void *)v12, (const void *)(v12 + 8), v11 - (v12 + 8));
  }
  *((void *)this + 12) = v12 + v13;
  CFRetained::release((CFTypeRef *)v5);
}

void sub_210A45798(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGNode::hasChildNodeWithName(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 87);
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 72);
  }
  uint64_t v6 = a2[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a2 + 1);
  }
  if (v5 != v6) {
    goto LABEL_15;
  }
  uint64_t v8 = (const void **)(a1 + 64);
  if (v7 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v4 & 0x80) != 0)
  {
    if (memcmp(*v8, a2, *(void *)(a1 + 72))) {
      goto LABEL_15;
    }
    return 1;
  }
  if (!*(unsigned char *)(a1 + 87)) {
    return 1;
  }
  while (*(unsigned __int8 *)v8 == *a2)
  {
    uint64_t v8 = (const void **)((char *)v8 + 1);
    ++a2;
    if (!--v4) {
      return 1;
    }
  }
LABEL_15:
  uint64_t v9 = *(void **)(a1 + 88);
  uint64_t v10 = *(void **)(a1 + 96);
  while (v9 != v10)
  {
    if (SVGNode::hasChildNodeWithName(*v9, v2)) {
      return 1;
    }
    ++v9;
  }
  uint64_t v11 = *(void **)(a1 + 160);
  uint64_t v12 = (void *)(a1 + 168);
  if (v11 != v12)
  {
    while (1)
    {
      uint64_t result = SVGNode::hasChildNodeWithName(v11[7], v2);
      if (result) {
        break;
      }
      unint64_t v14 = (void *)v11[1];
      if (v14)
      {
        do
        {
          char v15 = v14;
          unint64_t v14 = (void *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          char v15 = (void *)v11[2];
          BOOL v16 = *v15 == (void)v11;
          uint64_t v11 = v15;
        }
        while (!v16);
      }
      uint64_t v11 = v15;
      if (v15 == v12) {
        return result;
      }
    }
    return 1;
  }
  return 0;
}

void SVGNode::findChildNodesWithName(uint64_t a1, unsigned __int8 *a2, void **a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 87);
  if ((v6 & 0x80u) == 0) {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 87);
  }
  else {
    uint64_t v7 = *(void *)(a1 + 72);
  }
  uint64_t v8 = a2[23];
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *((void *)a2 + 1);
  }
  if (v7 != v8) {
    goto LABEL_32;
  }
  uint64_t v10 = (const void **)(a1 + 64);
  if (v9 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v6 & 0x80) != 0)
  {
    if (memcmp(*v10, a2, *(void *)(a1 + 72))) {
      goto LABEL_32;
    }
    goto LABEL_15;
  }
  if (!*(unsigned char *)(a1 + 87))
  {
LABEL_15:
    unint64_t v11 = (unint64_t)a3[2];
    uint64_t v12 = a3[1];
    if ((unint64_t)v12 >= v11)
    {
      uint64_t v14 = ((char *)v12 - (unsigned char *)*a3) >> 3;
      if ((unint64_t)(v14 + 1) >> 61) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v15 = v11 - (void)*a3;
      uint64_t v16 = v15 >> 2;
      if (v15 >> 2 <= (unint64_t)(v14 + 1)) {
        uint64_t v16 = v14 + 1;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v16;
      }
      if (v17) {
        uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a3 + 2), v17);
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = &v18[8 * v14];
      uint64_t v20 = &v18[8 * v17];
      *(void *)uint64_t v19 = a1;
      uint64_t v13 = v19 + 8;
      size_t v22 = (char *)*a3;
      uint64_t v21 = (char *)a3[1];
      if (v21 != *a3)
      {
        do
        {
          uint64_t v23 = *((void *)v21 - 1);
          v21 -= 8;
          *((void *)v19 - 1) = v23;
          v19 -= 8;
        }
        while (v21 != v22);
        uint64_t v21 = (char *)*a3;
      }
      *a3 = v19;
      a3[1] = v13;
      a3[2] = v20;
      if (v21) {
        operator delete(v21);
      }
    }
    else
    {
      void *v12 = a1;
      uint64_t v13 = v12 + 1;
    }
    a3[1] = v13;
    goto LABEL_32;
  }
  while (*(unsigned __int8 *)v10 == *a2)
  {
    uint64_t v10 = (const void **)((char *)v10 + 1);
    ++a2;
    if (!--v6) {
      goto LABEL_15;
    }
  }
LABEL_32:
  unint64_t v24 = *(uint64_t **)(a1 + 88);
  uint64_t v25 = *(uint64_t **)(a1 + 96);
  while (v24 != v25)
  {
    uint64_t v26 = *v24++;
    SVGNode::findChildNodesWithName(v26, v4, a3);
  }
  uint64_t v27 = *(void **)(a1 + 160);
  uint64_t v28 = (void *)(a1 + 168);
  if (v27 != v28)
  {
    do
    {
      if (*((char *)v27 + 55) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v27[4], v27[5]);
      }
      else {
        std::string __p = *(std::string *)(v27 + 4);
      }
      uint64_t v33 = v27[7];
      ((void (*)(void))SVGNode::findChildNodesWithName)();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      uint64_t v29 = (void *)v27[1];
      if (v29)
      {
        do
        {
          uint64_t v30 = v29;
          uint64_t v29 = (void *)*v29;
        }
        while (v29);
      }
      else
      {
        do
        {
          uint64_t v30 = (void *)v27[2];
          BOOL v31 = *v30 == (void)v27;
          uint64_t v27 = v30;
        }
        while (!v31);
      }
      uint64_t v27 = v30;
    }
    while (v30 != v28);
  }
}

void sub_210A45B08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGNode::findChildAttributesWithName(uint64_t *a1, uint64_t a2, void **a3)
{
  uint64_t v6 = SVGAttributeMap::attribute(a1[7], a2);
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = (unint64_t)a3[2];
    int v9 = (uint64_t *)a3[1];
    if ((unint64_t)v9 >= v8)
    {
      uint64_t v11 = ((char *)v9 - (unsigned char *)*a3) >> 3;
      if ((unint64_t)(v11 + 1) >> 61) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v8 - (void)*a3;
      uint64_t v13 = v12 >> 2;
      if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
        uint64_t v13 = v11 + 1;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14) {
        uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a3 + 2), v14);
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v16 = (uint64_t *)&v15[8 * v11];
      unint64_t v17 = &v15[8 * v14];
      uint64_t *v16 = v7;
      uint64_t v10 = v16 + 1;
      uint64_t v19 = (char *)*a3;
      uint64_t v18 = (char *)a3[1];
      if (v18 != *a3)
      {
        do
        {
          uint64_t v20 = *((void *)v18 - 1);
          v18 -= 8;
          *--uint64_t v16 = v20;
        }
        while (v18 != v19);
        uint64_t v18 = (char *)*a3;
      }
      *a3 = v16;
      a3[1] = v10;
      a3[2] = v17;
      if (v18) {
        operator delete(v18);
      }
    }
    else
    {
      *int v9 = v6;
      uint64_t v10 = v9 + 1;
    }
    a3[1] = v10;
  }
  uint64_t v21 = (uint64_t *)a1[11];
  size_t v22 = (uint64_t *)a1[12];
  while (v21 != v22)
  {
    uint64_t v23 = *v21++;
    SVGNode::findChildAttributesWithName(v23, a2, a3);
  }
  unint64_t v24 = (uint64_t *)a1[20];
  uint64_t v25 = a1 + 21;
  if (v24 != v25)
  {
    do
    {
      if (*((char *)v24 + 55) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v24[4], v24[5]);
      }
      else {
        std::string __p = *(std::string *)(v24 + 4);
      }
      uint64_t v30 = v24[7];
      ((void (*)(void))SVGNode::findChildAttributesWithName)();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      uint64_t v26 = (uint64_t *)v24[1];
      if (v26)
      {
        do
        {
          uint64_t v27 = v26;
          uint64_t v26 = (uint64_t *)*v26;
        }
        while (v26);
      }
      else
      {
        do
        {
          uint64_t v27 = (uint64_t *)v24[2];
          BOOL v28 = *v27 == (void)v24;
          unint64_t v24 = v27;
        }
        while (!v28);
      }
      unint64_t v24 = v27;
    }
    while (v27 != v25);
  }
}

void sub_210A45CDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGNode::addDefinitionNode(SVGNode *this, SVGNode *a2, SVGNode *a3)
{
  if (*((void *)this + 6))
  {
    uint64_t v3 = "Add definition node should be called on root node";
LABEL_3:
    SVGUtilities::error((SVGUtilities *)v3, (const char *)a2, a3);
    return;
  }
  if (SVGAttributeMap::attribute(*((void *)a3 + 7), 0x1Fu))
  {
    uint64_t v7 = SVGNode::identifier(a3);
    if (!*v7)
    {
      uint64_t v3 = "Invalid node Id for node";
      goto LABEL_3;
    }
    unint64_t v8 = v7;
    std::string::basic_string[abi:ne180100]<0>(__p, v7);
    int v9 = (void *)std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::find<std::string>((uint64_t)this + 160, (const void **)__p);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
    if ((void *)((char *)this + 168) != v9)
    {
      uint64_t v10 = (SVGNode *)v9[7];
      if (v10 == a3) {
        return;
      }
      CFRetained::release((CFTypeRef *)v10);
      std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::erase((uint64_t **)this + 20, (uint64_t)v9);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v8);
    uint64_t v13 = a3;
    std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,SVGNode *>>((uint64_t **)this + 20, (const void **)__p, (uint64_t)__p);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
    CFRetained::retain((uint64_t)a3);
    SVGNode::addDefinitionChild(a2, a3);
  }
  else
  {
    SVGNode::addDefinitionChild(a2, a3);
  }
}

void sub_210A45E6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

SVGNode *SVGNode::findDefinitionNode(SVGNode *this, char *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = (char *)this + 160;
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  uint64_t v5 = (void *)std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::find<std::string>((uint64_t)v4, (const void **)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  if ((void *)((char *)this + 168) != v5) {
    return (SVGNode *)v5[7];
  }
  uint64_t result = (SVGNode *)*((void *)this + 6);
  if (result) {
    return (SVGNode *)SVGNode::findDefinitionNode(result, a2);
  }
  return result;
}

void sub_210A45F1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double SVGNode::boundingBox(uint64_t a1, uint64_t a2)
{
  CGFloat v3 = *MEMORY[0x263F001A8];
  CGFloat v2 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v4 = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v6 = *(void **)(a1 + 88);
  uint64_t v7 = *(void **)(a1 + 96);
  if (v6 == v7) {
    return *MEMORY[0x263F001A8];
  }
  do
  {
    double x = (*(double (**)(void, uint64_t))(*(void *)*v6 + 32))(*v6, a2);
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
    v17.origin.double x = v3;
    v17.origin.CGFloat y = v2;
    v17.size.CGFloat width = v5;
    v17.size.CGFloat height = v4;
    if (!CGRectIsEmpty(v17))
    {
      v18.origin.double x = v3;
      v18.origin.CGFloat y = v2;
      v18.size.CGFloat width = v5;
      v18.size.CGFloat height = v4;
      v20.origin.double x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGRect v19 = CGRectUnion(v18, v20);
      double x = v19.origin.x;
      CGFloat y = v19.origin.y;
      CGFloat width = v19.size.width;
      CGFloat height = v19.size.height;
    }
    ++v6;
    CGFloat v4 = height;
    CGFloat v5 = width;
    CGFloat v2 = y;
    CGFloat v3 = x;
  }
  while (v6 != v7);
  return x;
}

void SVGNode::ancestorTransforms(SVGNode *this@<X0>, const SVGNode *a2@<X1>, uint64_t a3@<X8>)
{
  CGFloat v5 = (const SVGNode *)*((void *)this + 6);
  uint64_t v27 = 0;
  BOOL v28 = 0;
  uint64_t v29 = 0;
  std::vector<SVGNode const*>::reserve((void **)&v27, 0x10uLL);
  if (v5) {
    BOOL v6 = v5 == a2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = v28;
  }
  else
  {
    uint64_t v7 = v28;
    do
    {
      if (v7 >= v29)
      {
        uint64_t v8 = v7 - v27;
        if ((unint64_t)(v8 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v9 = ((char *)v29 - (char *)v27) >> 2;
        if (v9 <= v8 + 1) {
          unint64_t v9 = v8 + 1;
        }
        if ((unint64_t)((char *)v29 - (char *)v27) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v10 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v10 = v9;
        }
        if (v10) {
          uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v29, v10);
        }
        else {
          uint64_t v11 = 0;
        }
        double v12 = (const SVGNode **)&v11[8 * v8];
        void *v12 = v5;
        uint64_t v7 = v12 + 1;
        double v14 = v27;
        uint64_t v13 = v28;
        if (v28 != v27)
        {
          do
          {
            uint64_t v15 = *--v13;
            *--double v12 = v15;
          }
          while (v13 != v14);
          uint64_t v13 = v27;
        }
        uint64_t v27 = v12;
        BOOL v28 = v7;
        uint64_t v29 = (const SVGNode **)&v11[8 * v10];
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        *v7++ = v5;
      }
      BOOL v28 = v7;
      CGFloat v5 = (const SVGNode *)*((void *)v5 + 6);
      if (v5) {
        BOOL v16 = v5 == a2;
      }
      else {
        BOOL v16 = 1;
      }
    }
    while (!v16);
  }
  uint64_t v17 = MEMORY[0x263F000D0];
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a3 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a3 + 16) = v18;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(v17 + 32);
  CGRect v19 = v27;
  if (v7 == v27)
  {
    if (!v7) {
      return;
    }
  }
  else
  {
    do
    {
      uint64_t v20 = (uint64_t)*--v7;
      uint64_t v21 = *(void *)(v20 + 56);
      if (v21)
      {
        size_t v22 = (os_unfair_lock_s *)SVGAttributeMap::attribute(v21, 0x3Fu);
        if (v22)
        {
          if (SVGAttribute::transformValue(v22, &v26))
          {
            CGAffineTransform t1 = v26;
            long long v23 = *(_OWORD *)(a3 + 16);
            *(_OWORD *)&v24.double a = *(_OWORD *)a3;
            *(_OWORD *)&v24.c = v23;
            *(_OWORD *)&v24.tdouble x = *(_OWORD *)(a3 + 32);
            CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &v24);
          }
        }
        CGRect v19 = v27;
      }
    }
    while (v7 != v19);
  }
  BOOL v28 = v7;
  operator delete(v7);
}

void sub_210A46240(_Unwind_Exception *exception_object)
{
  CGFloat v3 = *(void **)(v1 - 88);
  if (v3)
  {
    *(void *)(v1 - 80) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<SVGNode const*>::reserve(void **a1, unint64_t a2)
{
  CGFloat v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    BOOL v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v9 = &v6[8 * v8];
    uint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    double v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
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

double SVGNode::transform@<D0>(SVGNode *this@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x263F000D0];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *a2 = *MEMORY[0x263F000D0];
  a2[1] = v4;
  long long v5 = *(_OWORD *)(v3 + 32);
  a2[2] = v5;
  uint64_t v6 = *((void *)this + 7);
  if (v6)
  {
    uint64_t v7 = (os_unfair_lock_s *)SVGAttributeMap::attribute(v6, 0x3Fu);
    if (v7)
    {
      if (SVGAttribute::transformValue(v7, &v10))
      {
        long long v8 = *(_OWORD *)&v10.c;
        *a2 = *(_OWORD *)&v10.a;
        a2[1] = v8;
        *(CGFloat *)&long long v5 = v10.tx;
        a2[2] = *(_OWORD *)&v10.tx;
      }
    }
  }
  return *(double *)&v5;
}

CGFloat SVGNode::calculateBoundingBox(void *a1, uint64_t a2)
{
  CGFloat v5 = *MEMORY[0x263F001A8];
  CGFloat v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  if (a1)
  {
    if (v8)
    {
      unint64_t v9 = v8;
      CGAffineTransform v10 = SVGShapeNode::path(v8);
      if (v10)
      {
        CGPath = CGSVGPathCreateCGPath(*((void *)v10 + 5), v11);
        BoundingBoCGFloat x = CGPathGetBoundingBox(CGPath);
        CGFloat x = BoundingBox.origin.x;
        CGFloat y = BoundingBox.origin.y;
        CGFloat width = BoundingBox.size.width;
        CGFloat height = BoundingBox.size.height;
        CGFloat v17 = -SVGNode::calculateStrokeWidthForBoundingBox((uint64_t)a1, a2);
        v48.origin.CGFloat x = x;
        v48.origin.CGFloat y = y;
        v48.size.CGFloat width = width;
        v48.size.CGFloat height = height;
        CGRect v49 = CGRectInset(v48, v17, v17);
        double v18 = v49.origin.x;
        CGFloat v19 = v49.origin.y;
        CGFloat v20 = v49.size.width;
        CGFloat v21 = v49.size.height;
        CGPathRelease(CGPath);
      }
      else
      {
        double v18 = (*(double (**)(SVGShapeNode *, uint64_t))(*(void *)v9 + 32))(v9, a2);
        CGFloat v19 = v40;
        CGFloat v20 = v41;
        CGFloat v21 = v42;
      }
      SVGNode::transform((SVGNode *)a1, &v46);
      CGAffineTransform v26 = &v46;
      goto LABEL_15;
    }
    {
      double v18 = (*(double (**)(void *, void))(*(void *)v22 + 32))(v22, 0);
      CGFloat v19 = v23;
      CGFloat v20 = v24;
      CGFloat v21 = v25;
      SVGNode::transform((SVGNode *)a1, v45);
      CGAffineTransform v26 = (CGAffineTransform *)v45;
LABEL_15:
      v54.origin.CGFloat x = v18;
      v54.origin.CGFloat y = v19;
      v54.size.CGFloat width = v20;
      v54.size.CGFloat height = v21;
      *(void *)&double v36 = (unint64_t)CGRectApplyAffineTransform(v54, v26);
      return v36;
    }
  }
  uint64_t v27 = (void *)a1[11];
  BOOL v28 = (void *)a1[12];
  if (v27 == v28) {
    return v5;
  }
  do
  {
    CGFloat v29 = SVGNode::calculateBoundingBox(*v27, a2);
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    SVGNode::transform((SVGNode *)a1, &v44);
    v50.origin.CGFloat x = v29;
    v50.origin.CGFloat y = v31;
    v50.size.CGFloat width = v33;
    v50.size.CGFloat height = v35;
    CGRect v51 = CGRectApplyAffineTransform(v50, &v44);
    double v36 = v51.origin.x;
    CGFloat v37 = v51.origin.y;
    CGFloat v38 = v51.size.width;
    CGFloat v39 = v51.size.height;
    v51.origin.CGFloat x = v5;
    v51.origin.CGFloat y = v4;
    v51.size.CGFloat width = v7;
    v51.size.CGFloat height = v6;
    if (!CGRectIsEmpty(v51))
    {
      v52.origin.CGFloat x = v5;
      v52.origin.CGFloat y = v4;
      v52.size.CGFloat width = v7;
      v52.size.CGFloat height = v6;
      v55.origin.CGFloat x = v36;
      v55.origin.CGFloat y = v37;
      v55.size.CGFloat width = v38;
      v55.size.CGFloat height = v39;
      CGRect v53 = CGRectUnion(v52, v55);
      double v36 = v53.origin.x;
      CGFloat v37 = v53.origin.y;
      CGFloat v38 = v53.size.width;
      CGFloat v39 = v53.size.height;
    }
    ++v27;
    CGFloat v6 = v39;
    CGFloat v7 = v38;
    CGFloat v4 = v37;
    CGFloat v5 = v36;
  }
  while (v27 != v28);
  return v36;
}

double SVGNode::calculateStrokeWidthForBoundingBox(uint64_t a1, int a2)
{
  double v2 = 0.0;
  if (a2)
  {
    uint64_t v3 = a1;
    uint64_t v4 = a1;
    if (a2 != 2) {
      goto LABEL_23;
    }
    uint64_t v5 = a1;
    while (1)
    {
      CGFloat v6 = (os_unfair_lock_s *)SVGAttributeMap::attribute(*(void *)(v5 + 56), 0x39u);
      if (v6) {
        break;
      }
      uint64_t v5 = *(void *)(v5 + 48);
      if (!v5)
      {
        *(double *)&uint64_t v15 = 0.0;
        goto LABEL_8;
      }
    }
    *(double *)&uint64_t v15 = 0.0;
    SVGAttribute::paintValue(v6, &v15);
LABEL_8:
    uint64_t v7 = v3;
    while (1)
    {
      long long v8 = (os_unfair_lock_s *)SVGAttributeMap::attribute(*(void *)(v7 + 56), 0x3Au);
      if (v8) {
        break;
      }
      uint64_t v7 = *(void *)(v7 + 48);
      if (!v7)
      {
        double v14 = 1.0;
        goto LABEL_13;
      }
    }
    double v14 = 1.0;
    SVGAttribute::floatValue(v8, &v14);
LABEL_13:
    uint64_t v9 = v3;
    while (1)
    {
      CGAffineTransform v10 = (os_unfair_lock_s *)SVGAttributeMap::attribute(*(void *)(v9 + 56), 0x29u);
      if (v10) {
        break;
      }
      uint64_t v9 = *(void *)(v9 + 48);
      if (!v9)
      {
        double v13 = 1.0;
        goto LABEL_18;
      }
    }
    double v13 = 1.0;
    SVGAttribute::floatValue(v10, &v13);
LABEL_18:
    if (*(double *)&v15 != 0.0 && *((_DWORD *)v15 + 12) && v14 != 0.0 && v13 != 0.0)
    {
      uint64_t v4 = v3;
LABEL_23:
      while (!SVGAttributeMap::attribute(*(void *)(v4 + 56), 0x39u))
      {
        uint64_t v4 = *(void *)(v4 + 48);
        if (!v4) {
          return v2;
        }
      }
      while (1)
      {
        uint64_t v11 = (os_unfair_lock_s *)SVGAttributeMap::attribute(*(void *)(v3 + 56), 0x3Bu);
        if (v11) {
          break;
        }
        uint64_t v3 = *(void *)(v3 + 48);
        if (!v3) {
          return 0.5;
        }
      }
      *(double *)&uint64_t v15 = 0.0;
      SVGAttribute::floatValue(v11, (double *)&v15);
      return *(double *)&v15 * 0.5;
    }
  }
  return v2;
}

double SVGNode::getBoundingBox(SVGNode *a1, const SVGNode *a2, uint64_t a3)
{
  int v3 = a3;
  double v6 = SVGNode::calculateBoundingBox(a1, a3);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if (v3 != 3)
  {
    memset(&v15, 0, sizeof(v15));
    SVGNode::ancestorTransforms(a1, a2, (uint64_t)&v15);
    CGAffineTransform v14 = v15;
    v16.origin.CGFloat x = v6;
    v16.origin.CGFloat y = v8;
    v16.size.CGFloat width = v10;
    v16.size.CGFloat height = v12;
    *(void *)&double v6 = (unint64_t)CGRectApplyAffineTransform(v16, &v14);
  }
  return v6;
}

uint64_t SVGNode::hasWideGamutColor(SVGNode *this)
{
  uint64_t v2 = *((void *)this + 7);
  if (v2)
  {
    CGFloat v10 = 0;
    int v3 = (os_unfair_lock_s *)SVGAttributeMap::attribute(v2, 0x12u);
    if (v3)
    {
      if (SVGAttribute::paintValue(v3, &v10) && (SVGPaint::isWideGamut(v10) & 1) != 0) {
        return 1;
      }
    }
    uint64_t v4 = (os_unfair_lock_s *)SVGAttributeMap::attribute(*((void *)this + 7), 0x39u);
    if (v4)
    {
      if (SVGAttribute::paintValue(v4, &v10) && SVGPaint::isWideGamut(v10)) {
        return 1;
      }
    }
  }
  uint64_t v6 = *((void *)this + 11);
  uint64_t v7 = *((void *)this + 12);
  if (v6 == v7) {
    return 0;
  }
  uint64_t v8 = v6 + 8;
  do
  {
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(v8 - 8) + 40))(*(void *)(v8 - 8));
    if (result) {
      break;
    }
    BOOL v9 = v8 == v7;
    v8 += 8;
  }
  while (!v9);
  return result;
}

void SVGNode::print(SVGAttributeMap **this)
{
  uint64_t v2 = this + 8;
  if (*((char *)this + 87) < 0) {
    uint64_t v2 = (void *)*v2;
  }
  int v3 = SVGNode::identifier((SVGNode *)this);
  uint64_t v5 = (SVGUtilities *)SVGUtilities::print((SVGUtilities *)"Node: %s (id: %s), %lu children, %lu definitions\n", v4, v2, v3, (this[12] - this[11]) >> 3, this[22]);
  SVGUtilities::indent(v5);
  uint64_t v6 = (SVGUtilities *)SVGAttributeMap::print(this[7]);
  uint64_t v8 = this[11];
  uint64_t v7 = this[12];
  while (v8 != v7)
  {
    uint64_t v9 = *(void *)v8;
    uint64_t v8 = (SVGAttributeMap *)((char *)v8 + 8);
    uint64_t v6 = (SVGUtilities *)(*(uint64_t (**)(uint64_t))(*(void *)v9 + 48))(v9);
  }
  SVGUtilities::unindent(v6);
}

uint64_t SVGNode::setComment(uint64_t this, const char *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(void *)(this + 184);
  if (v4)
  {
    if (*(char *)(v4 + 23) < 0) {
      operator delete(*(void **)v4);
    }
    this = MEMORY[0x216677AD0](v4, 0x1012C40EC159624);
  }
  if (a2) {
    operator new();
  }
  *(void *)(v3 + 184) = 0;
  return this;
}

void sub_210A46AF0(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

void SVGNode::setText(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 192);
  if (v1)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    MEMORY[0x216677AD0](v1, 0x1012C40EC159624);
  }
  operator new();
}

void sub_210A46BB8(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t SVGNode::setText(uint64_t this, const char *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(void *)(this + 192);
  if (v4)
  {
    if (*(char *)(v4 + 23) < 0) {
      operator delete(*(void **)v4);
    }
    this = MEMORY[0x216677AD0](v4, 0x1012C40EC159624);
  }
  if (a2) {
    operator new();
  }
  *(void *)(v3 + 192) = 0;
  return this;
}

void sub_210A46C6C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

void SVGNode::setHref(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    MEMORY[0x216677AD0](v1, 0x1012C40EC159624);
  }
  operator new();
}

void sub_210A46D34(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

BOOL SVGNode::isChildOf(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  do
  {
    a1 = *(void *)(a1 + 48);
    BOOL v2 = a1 != 0;
  }
  while (a1 != a2 && a1 != 0);
  return v2;
}

void SVGNode::SVGNode(SVGNode *this, const SVGNode *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A320;
  *((void *)this + 6) = 0;
  operator new();
}

void sub_210A46F50(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x10B3C4084D8EEBALL);
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

uint64_t SVGNode::hasMonochromeColor(SVGNode *this)
{
  uint64_t v2 = *((void *)this + 7);
  if (!v2) {
    return 1;
  }
  uint64_t v9 = 0;
  uint64_t v3 = (os_unfair_lock_s *)SVGAttributeMap::attribute(v2, 0x12u);
  if (!v3 || !SVGAttribute::paintValue(v3, &v9) || (SVGPaint::isMonochrome((uint64_t)v9, (const char *)0x12) & 1) != 0)
  {
    uint64_t v8 = 0;
    char v4 = (os_unfair_lock_s *)SVGAttributeMap::attribute(*((void *)this + 7), 0x39u);
    if (!v4
      || !SVGAttribute::paintValue(v4, &v8)
      || SVGPaint::isMonochrome((uint64_t)v8, (const char *)0x39))
    {
      uint64_t v6 = *((void *)this + 11);
      uint64_t v5 = *((void *)this + 12);
      while (v6 != v5)
      {
        if (((*(uint64_t (**)(void))(**(void **)v6 + 56))() & 1) == 0) {
          return 0;
        }
        v6 += 8;
      }
      return 1;
    }
  }
  return 0;
}

void SVGNode::printTree(SVGNode *this)
{
  uint64_t v2 = (char *)this + 64;
  if (*((char *)this + 87) < 0) {
    uint64_t v2 = *(const char **)v2;
  }
  printf("\nNode: <%s>. ", v2);
  uint64_t v3 = *((void *)this + 6);
  if (v3)
  {
    char v4 = (const char *)(v3 + 64);
    if (*(char *)(v3 + 87) < 0) {
      char v4 = *(const char **)v4;
    }
    printf("Parent: <%s>", v4);
  }
  puts("\nAttributes: ");
  SVGAttributeMap::print(*((SVGAttributeMap **)this + 7));
  uint64_t v5 = (SVGNode **)*((void *)this + 11);
  uint64_t v6 = (SVGNode **)*((void *)this + 12);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    SVGNode::printTree(v7);
  }
  uint64_t v8 = (SVGNode *)*((void *)this + 20);
  if (v8 != (SVGNode *)((char *)this + 168))
  {
    do
    {
      if (*((char *)v8 + 55) < 0) {
        std::string::__init_copy_ctor_external(&v12, *((const std::string::value_type **)v8 + 4), *((void *)v8 + 5));
      }
      else {
        std::string v12 = *(std::string *)((char *)v8 + 32);
      }
      double v13 = (SVGNode *)*((void *)v8 + 7);
      printf("\nNodes under <defs>:");
      SVGNode::printTree(v13);
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v12.__r_.__value_.__l.__data_);
      }
      uint64_t v9 = (SVGNode *)*((void *)v8 + 1);
      if (v9)
      {
        do
        {
          CGFloat v10 = v9;
          uint64_t v9 = *(SVGNode **)v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          CGFloat v10 = (SVGNode *)*((void *)v8 + 2);
          BOOL v11 = *(void *)v10 == (void)v8;
          uint64_t v8 = v10;
        }
        while (!v11);
      }
      uint64_t v8 = v10;
    }
    while (v10 != (SVGNode *)((char *)this + 168));
  }
}

void sub_210A47234(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGNode::enumerate(uint64_t a1, uint64_t a2)
{
  char v9 = 0;
  uint64_t v2 = *(void **)(a1 + 160);
  uint64_t v3 = (void *)(a1 + 168);
  if (v2 != (void *)(a1 + 168))
  {
    do
    {
      if (*((char *)v2 + 55) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v2[4], v2[5]);
      }
      else {
        std::string __p = *(std::string *)(v2 + 4);
      }
      (*(void (**)(uint64_t, std::string *, void, char *))(a2 + 16))(a2, &__p, v2[7], &v9);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v9) {
        break;
      }
      uint64_t v5 = (void *)v2[1];
      if (v5)
      {
        do
        {
          uint64_t v6 = v5;
          uint64_t v5 = (void *)*v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          uint64_t v6 = (void *)v2[2];
          BOOL v7 = *v6 == (void)v2;
          uint64_t v2 = v6;
        }
        while (!v7);
      }
      uint64_t v2 = v6;
    }
    while (v6 != v3);
  }
}

void sub_210A4732C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_210A47420(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::find<std::string>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = (void *)(a1 + 8);
  do
  {
    int v7 = std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v5, (uint64_t)(v3 + 4), a2);
    uint64_t v8 = v3 + 1;
    if (!v7)
    {
      uint64_t v8 = v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = (void *)*v8;
  }
  while (*v8);
  if (v6 == v2
    || std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>::operator()[abi:ne180100](v5, a2, (uint64_t)(v6 + 4)))
  {
    return v2;
  }
  return v6;
}

uint64_t std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    uint64_t v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      uint64_t v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

uint64_t *std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,SVGNode *>>(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t **)std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__construct_node<std::pair<std::string const,SVGNode *>>((uint64_t)a1, a3, (uint64_t)&v7);
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::__insert_node_at(a1, v8, v5, v7);
    return v7;
  }
  return result;
}

void std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__construct_node<std::pair<std::string const,SVGNode *>>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  BOOL v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    *((void *)v6 + 6) = *(void *)(a2 + 16);
  }
  *((void *)v6 + 7) = *(void *)(a2 + 24);
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_210A47668(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::__erase_unique<std::string>(uint64_t **a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t **)std::__tree<std::__value_type<std::string,SVGNode *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGNode *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGNode *>>>::find<std::string>((uint64_t)a1, a2);
  if (a1 + 1 == v3) {
    return 0;
  }
  std::__tree<std::__value_type<std::string,SVGAttributeMap *>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAttributeMap *>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAttributeMap *>>>::erase(a1, (uint64_t)v3);
  return 1;
}

void SVGPaint::SVGPaint(SVGPaint *this, SVGGradient *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPaint::kSVGPaintClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A3F0;
  *((_DWORD *)this + 12) = 2;
  SVGColor::SVGColor((uint64_t)this + 56, 0, 0.0, 0.0, 0.0, 1.0);
  *((void *)this + 13) = a2;
  *((void *)this + 14) = 0;
  *((void *)this + 12) = 0x3FF0000000000000;
  CFRetained::retain((uint64_t)a2);
}

void sub_210A4777C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void SVGPaint::SVGPaint(SVGPaint *this, const SVGGradient *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPaint::kSVGPaintClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A3F0;
  *((_DWORD *)this + 12) = 2;
  SVGColor::SVGColor((uint64_t)this + 56, 0, 0.0, 0.0, 0.0, 1.0);
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((void *)this + 12) = 0x3FF0000000000000;
  operator new();
}

void sub_210A478A8(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x10F3C40A581D00ALL);
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

void SVGPaint::SVGPaint(SVGPaint *this, SVGPattern *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPaint::kSVGPaintClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A3F0;
  *((_DWORD *)this + 12) = 3;
  SVGColor::SVGColor((uint64_t)this + 56, 0, 0.0, 0.0, 0.0, 1.0);
  *((void *)this + 12) = 0x3FF0000000000000;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = a2;
  CFRetained::retain((uint64_t)a2);
}

void sub_210A479CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void SVGPaint::SVGPaint(SVGPaint *this, const SVGPaint *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGPaint::kSVGPaintClassName);
  CFRetained::CFRetained(this, (uint64_t)__p);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26C30A3F0;
  *((_DWORD *)this + 12) = *((_DWORD *)a2 + 12);
  SVGColor::SVGColor((uint64_t)this + 56, 0, 0.0, 0.0, 0.0, 1.0);
  *((void *)this + 13) = 0;
  *((void *)this + 12) = 0x3FF0000000000000;
  *((void *)this + 14) = 0;
  int v4 = *((_DWORD *)this + 12);
  switch(v4)
  {
    case 3:
      operator new();
    case 2:
      operator new();
    case 1:
      SVGColor::SVGColor((uint64_t)v5, (uint64_t)a2 + 56);
      SVGColor::operator=((uint64_t)this + 56, (uint64_t)v5);
      break;
  }
}

void sub_210A47B68(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v2, 0x10F3C40A581D00ALL);
  *(void *)uint64_t v1 = &unk_26C309FB0;
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(a1);
}

uint64_t SVGPaint::isWideGamut(SVGPaint *this)
{
  int v1 = *((_DWORD *)this + 12);
  if (v1 == 3)
  {
    uint64_t v3 = *((void *)this + 14);
    uint64_t v4 = *(void *)(v3 + 88);
    uint64_t v5 = *(void *)(v3 + 96);
    if (v4 != v5)
    {
      uint64_t v6 = v4 + 8;
      do
      {
        uint64_t result = (*(uint64_t (**)(void))(**(void **)(v6 - 8) + 40))(*(void *)(v6 - 8));
        if (result) {
          break;
        }
        BOOL v11 = v6 == v5;
        v6 += 8;
      }
      while (!v11);
      return result;
    }
    return 0;
  }
  if (v1 != 2)
  {
    if (v1 == 1) {
      return *((_DWORD *)this + 22) == 15;
    }
    return 0;
  }
  uint64_t v7 = *((void *)this + 13);
  uint64_t v8 = *(void *)(v7 + 216);
  uint64_t v9 = *(void *)(v7 + 224);
  if (v8 == v9) {
    return 0;
  }
  uint64_t v10 = v8 + 8;
  do
  {
    SVGColor::SVGColor((uint64_t)v12, *(void *)(v10 - 8) + 48);
    uint64_t result = v13 == 15;
    BOOL v11 = v13 == 15 || v10 == v9;
    v10 += 8;
  }
  while (!v11);
  return result;
}

uint64_t SVGPaint::isEqual(SVGPaint *this, const SVGPaint *a2)
{
  int v2 = *((_DWORD *)this + 12);
  if (v2 != *((_DWORD *)a2 + 12)) {
    return 0;
  }
  switch(v2)
  {
    case 0:
      return 1;
    case 2:
      uint64_t v5 = (SVGGradient *)*((void *)this + 13);
      uint64_t v6 = (const SVGGradient *)*((void *)a2 + 13);
      return SVGGradient::isEqual(v5, v6);
    case 1:
      uint64_t v3 = (SVGPaint *)((char *)this + 56);
      SVGColor::SVGColor((uint64_t)v7, (uint64_t)a2 + 56);
      return SVGColor::isEqual(v3, (const SVGColor *)v7);
    default:
      return SVGPattern::isEqual();
  }
}

double SVGPaint::createStringRepresentation@<D0>(SVGPaint *this@<X0>, uint64_t a2@<X8>)
{
  std::string::basic_string[abi:ne180100]<0>((void *)a2, "none");
  int v5 = *((_DWORD *)this + 12);
  switch(v5)
  {
    case 3:
      uint64_t v6 = SVGNode::identifier(*((SVGNode **)this + 14));
      SVGParser::FormatString((SVGParser *)"url(#%s)", &v9, v6);
      break;
    case 2:
      uint64_t v7 = SVGNode::identifier(*((SVGNode **)this + 13));
      SVGParser::FormatString((SVGParser *)"url(#%s)", &v9, v7);
      break;
    case 1:
      SVGColor::SVGColor((uint64_t)v8, (uint64_t)this + 56);
      SVGColor::GetStringForColor((uint64_t)v8, (uint64_t)&v9);
      break;
    default:
      return result;
  }
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
  double result = *(double *)&v9;
  *(_OWORD *)a2 = v9;
  *(void *)(a2 + 16) = v10;
  return result;
}

void sub_210A47E74(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGPaint::isMonochrome(uint64_t a1, const char *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  uint64_t result = 1;
  switch((int)v2)
  {
    case 0:
      return result;
    case 1:
      double v5 = *(double *)(a1 + 64);
      if (vabdd_f64(*(double *)(a1 + 56), v5) >= 0.00000011920929) {
        goto LABEL_22;
      }
      uint64_t result = vabdd_f64(v5, *(double *)(a1 + 72)) < 0.00000011920929;
      break;
    case 2:
      uint64_t v6 = *(void *)(a1 + 104);
      uint64_t v7 = *(void *)(v6 + 216);
      uint64_t v8 = *(void *)(v6 + 224);
      if (v7 != v8)
      {
        for (uint64_t i = v7 + 8; ; i += 8)
        {
          SVGColor::SVGColor((uint64_t)&v17, *(void *)(i - 8) + 48);
          if (vabdd_f64(v17, v18) >= 0.00000011920929) {
            break;
          }
          double v10 = vabdd_f64(v18, v19);
          uint64_t result = v10 < 0.00000011920929;
          if (v10 >= 0.00000011920929 || i == v8) {
            return result;
          }
        }
LABEL_22:
        uint64_t result = 0;
      }
      break;
    case 3:
      uint64_t v12 = *(void *)(a1 + 112);
      uint64_t v13 = *(void *)(v12 + 88);
      uint64_t v14 = *(void *)(v12 + 96);
      if (v13 != v14)
      {
        uint64_t v15 = v13 + 8;
        do
        {
          uint64_t result = (*(uint64_t (**)(void))(**(void **)(v15 - 8) + 56))(*(void *)(v15 - 8));
          if (result) {
            BOOL v16 = v15 == v14;
          }
          else {
            BOOL v16 = 1;
          }
          v15 += 8;
        }
        while (!v16);
      }
      break;
    default:
      SVGUtilities::log((SVGUtilities *)"\nUnsupported paint type : %u", a2, v2);
      uint64_t result = 1;
      break;
  }
  return result;
}

BOOL SVGParser::ParseBinary(uint64_t a1, double *a2, void *a3, _DWORD *a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v8 = MEMORY[0x263EF8318];
  while (1)
  {
    uint64_t v9 = *(unsigned __int8 *)(v7 - 1);
    if (v9 <= 0x2E && ((1 << v9) & 0x680000000000) != 0) {
      return 0;
    }
    BOOL v11 = (SVGParser *)(char)v9;
    if ((v11 & 0x80000000) == 0 && (*(_DWORD *)(v8 + 4 * v9 + 60) & 0x400) != 0) {
      break;
    }
    BOOL result = SVGParser::IsAllowedSeparator(v11);
    if (!result) {
      return result;
    }
    ++v7;
  }
  if ((v11 & 0xFFFFFFFE) != 0x30) {
    return 0;
  }
  if (a4)
  {
    *a4 = 1;
    LOBYTE(v11) = *(unsigned char *)(v7 - 1);
  }
  *a2 = (double)((char)v11 - 48);
  if (a3) {
    *a3 = v7;
  }
  return 1;
}

uint64_t SVGParser::IsDigitCharacter(SVGParser *this)
{
  if (this <= 0x2E && ((1 << (char)this) & 0x680000000000) != 0) {
    return 1;
  }
  if ((this & 0x80000000) != 0) {
    return 0;
  }
  return (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * this + 60) >> 10) & 1;
}

BOOL SVGParser::ParseCGFloatListEllipticalArcCurve(char *a1, void *a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a1 && a3)
  {
    int v6 = 0;
    size_t v22 = a1;
    uint64_t v7 = MEMORY[0x263EF8318];
    while (1)
    {
      if (SVGParser::IsAllowedSeparator((SVGParser *)*a1))
      {
        do
          ++v22;
        while (SVGParser::IsAllowedSeparator((SVGParser *)*v22));
      }
      uint64_t v8 = *v22;
      if ((v8 - 45) >= 2
        && v8 != 43
        && (!*v22 || (v8 & 0x80) != 0 || (*(_DWORD *)(v7 + 4 * v8 + 60) & 0x400) == 0))
      {
        break;
      }
      uint64_t v21 = 0;
      if ((v6 - 3) >= 2)
      {
        if (!SVGParser::ParseCGFloat(v22, (double *)&v21, &v22, 0)) {
          break;
        }
      }
      else if (!SVGParser::ParseBinary((uint64_t)v22, (double *)&v21, &v22, 0))
      {
        break;
      }
      double v10 = *(void **)(a3 + 8);
      unint64_t v9 = *(void *)(a3 + 16);
      if ((unint64_t)v10 >= v9)
      {
        uint64_t v12 = *(void **)a3;
        uint64_t v13 = ((uint64_t)v10 - *(void *)a3) >> 3;
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v15 = v9 - (void)v12;
        if (v15 >> 2 > v14) {
          unint64_t v14 = v15 >> 2;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          double v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a3 + 16, v16);
          uint64_t v12 = *(void **)a3;
          double v10 = *(void **)(a3 + 8);
        }
        else
        {
          double v17 = 0;
        }
        double v18 = &v17[8 * v13];
        *(void *)double v18 = v21;
        BOOL v11 = v18 + 8;
        while (v10 != v12)
        {
          uint64_t v19 = *--v10;
          *((void *)v18 - 1) = v19;
          v18 -= 8;
        }
        *(void *)a3 = v18;
        *(void *)(a3 + 8) = v11;
        *(void *)(a3 + 16) = &v17[8 * v16];
        if (v12) {
          operator delete(v12);
        }
      }
      else
      {
        *double v10 = v21;
        BOOL v11 = v10 + 1;
      }
      *(void *)(a3 + 8) = v11;
      if ((void *)((char *)v11 - *(void *)a3) == (void *)56) {
        int v6 = 0;
      }
      else {
        ++v6;
      }
      a1 = v22;
    }
    if (a2) {
      *a2 = v22;
    }
    return *(void *)(a3 + 8) != *(void *)a3;
  }
  return v3;
}

void SVGParser::GetSeparatedWhitespaceComponents(const char *a1, void **a2, char a3)
{
  size_t v6 = strlen(a1);
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = MEMORY[0x263EF8318];
    do
    {
      unsigned int v10 = a1[v8];
      if ((v10 & 0x80000000) != 0)
      {
        if (__maskrune(v10, 0x4000uLL)) {
          goto LABEL_9;
        }
      }
      else if ((*(_DWORD *)(v9 + 4 * v10 + 60) & 0x4000) != 0)
      {
        goto LABEL_9;
      }
      if ((a3 & 1) != 0 || a1[v8] != 44)
      {
        unint64_t v11 = v8;
        if (v8 < v7)
        {
          unint64_t v11 = v8;
          while (1)
          {
            unsigned int v12 = a1[v11];
            if ((v12 & 0x80000000) != 0)
            {
              if (__maskrune(v12, 0x4000uLL)) {
                break;
              }
            }
            else if ((*(_DWORD *)(v9 + 4 * v12 + 60) & 0x4000) != 0)
            {
              break;
            }
            if ((a3 & 1) == 0 && a1[v11] == 44) {
              break;
            }
            if (v7 == ++v11)
            {
              unint64_t v11 = v7;
              break;
            }
          }
        }
        unsigned int v13 = v11 - v8;
        uint64_t v15 = (unint64_t *)a2[1];
        unint64_t v14 = (unint64_t)a2[2];
        if ((unint64_t)v15 >= v14)
        {
          uint64_t v17 = ((char *)v15 - (unsigned char *)*a2) >> 3;
          if ((unint64_t)(v17 + 1) >> 61) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v18 = v14 - (void)*a2;
          uint64_t v19 = v18 >> 2;
          if (v18 >> 2 <= (unint64_t)(v17 + 1)) {
            uint64_t v19 = v17 + 1;
          }
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20) {
            uint64_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a2 + 2), v20);
          }
          else {
            uint64_t v21 = 0;
          }
          size_t v22 = (unint64_t *)&v21[8 * v17];
          *size_t v22 = v8 | ((unint64_t)v13 << 32);
          unint64_t v16 = v22 + 1;
          double v24 = (char *)*a2;
          double v23 = (char *)a2[1];
          if (v23 != *a2)
          {
            do
            {
              unint64_t v25 = *((void *)v23 - 1);
              v23 -= 8;
              *--size_t v22 = v25;
            }
            while (v23 != v24);
            double v23 = (char *)*a2;
          }
          *a2 = v22;
          a2[1] = v16;
          a2[2] = &v21[8 * v20];
          if (v23) {
            operator delete(v23);
          }
        }
        else
        {
          unint64_t *v15 = v8 | ((unint64_t)v13 << 32);
          unint64_t v16 = v15 + 1;
        }
        a2[1] = v16;
        goto LABEL_37;
      }
LABEL_9:
      unint64_t v11 = v8;
LABEL_37:
      unint64_t v8 = v11 + 1;
    }
    while (v11 + 1 < v7);
  }
}

BOOL SVGParser::GetParentheticalComponent(const char *a1, uint64_t a2)
{
  int64_t v4 = strlen(a1);
  unint64_t v5 = (unint64_t)&a1[v4];
  size_t v6 = a1;
  if (v4 >= 1)
  {
    do
    {
      if (*v6 == 40) {
        break;
      }
      ++v6;
    }
    while ((unint64_t)v6 < v5);
  }
  unint64_t v7 = v6 + 1;
  if ((unint64_t)(v6 + 1) < v5)
  {
    uint64_t v8 = &a1[v4] - v6 - 1;
    unint64_t v7 = v6 + 1;
    while (*v7 != 41)
    {
      ++v7;
      if (!--v8)
      {
        unint64_t v7 = &a1[v4];
        break;
      }
    }
  }
  int64_t v9 = v7 - v6;
  if (v7 - v6 >= 1) {
    MEMORY[0x216677A50](a2);
  }
  return v9 > 0;
}

void SVGParser::GetComponentsSeparatedByDelimiters(const char *a1, const char *a2, uint64_t *a3)
{
  unint64_t v5 = (char *)a1;
  size_t v6 = strlen(a1);
  if ((v6 & 0x8000000000000000) == 0)
  {
    size_t v7 = v6;
    unint64_t v8 = (unint64_t)&v5[v6];
    int64_t v9 = strlen(a2);
    int v10 = 0;
    unint64_t v11 = &a2[v9];
    unsigned int v12 = &v5[v7];
    unsigned int v13 = a2 + 1;
    unint64_t v14 = v5;
    CGFloat v35 = 0;
    do
    {
      int v15 = *v5;
      if (v9 < 1)
      {
        BOOL v17 = 0;
      }
      else
      {
        unint64_t v16 = v13;
        do
        {
          BOOL v17 = *((unsigned __int8 *)v16 - 1) == v15;
          BOOL v18 = *((unsigned __int8 *)v16 - 1) == v15 || v16 >= v11;
          ++v16;
        }
        while (!v18);
      }
      if (v15 == 39 || v15 == 34)
      {
        if (v10)
        {
          if (v15 == v10)
          {
            TrimmedString(v35 + 1, v5 - 1, __s);
            uint64_t v19 = (std::string::value_type *)HIBYTE(v37);
            char v20 = HIBYTE(v37);
            if (v37 < 0) {
              uint64_t v19 = __s[1];
            }
            if (v19)
            {
              unint64_t v21 = a3[1];
              if (v21 >= a3[2])
              {
                uint64_t v27 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (long long *)__s);
              }
              else
              {
                if (SHIBYTE(v37) < 0)
                {
                  std::string::__init_copy_ctor_external((std::string *)a3[1], __s[0], (std::string::size_type)__s[1]);
                }
                else
                {
                  long long v22 = *(_OWORD *)__s;
                  *(void *)(v21 + 16) = v37;
                  *(_OWORD *)unint64_t v21 = v22;
                }
                uint64_t v27 = v21 + 24;
                a3[1] = v21 + 24;
              }
              a3[1] = v27;
              char v20 = HIBYTE(v37);
            }
            if (v20 < 0) {
              operator delete(__s[0]);
            }
            int v10 = 0;
            CGFloat v35 = 0;
LABEL_65:
            unint64_t v14 = v5 + 1;
            if ((unint64_t)(v5 + 1) < v8)
            {
              do
              {
                unsigned int v33 = *v14;
                double v34 = a2;
                if (v9 < 1)
                {
LABEL_69:
                  if ((v33 & 0x80000000) != 0)
                  {
                    if (!__maskrune(v33, 0x4000uLL)) {
                      goto LABEL_75;
                    }
                  }
                  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v33 + 60) & 0x4000) == 0)
                  {
                    goto LABEL_75;
                  }
                }
                else
                {
                  while (*(unsigned __int8 *)v34 != v33)
                  {
                    if (++v34 >= v11) {
                      goto LABEL_69;
                    }
                  }
                }
                ++v14;
              }
              while (v14 != (char *)v8);
              unint64_t v14 = (char *)v8;
            }
          }
        }
        else
        {
          int v10 = *v5;
          CGFloat v35 = v5;
        }
      }
      else
      {
        if (v10) {
          BOOL v23 = 0;
        }
        else {
          BOOL v23 = v17;
        }
        if (v14 >= v5) {
          BOOL v23 = 0;
        }
        if ((char *)v8 == v5 || v23)
        {
          TrimmedString(v14, v5 - 1, __s);
          double v24 = (std::string::value_type *)HIBYTE(v37);
          if (v37 < 0) {
            double v24 = __s[1];
          }
          if (v24)
          {
            unint64_t v25 = a3[1];
            if (v25 >= a3[2])
            {
              uint64_t v28 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (long long *)__s);
            }
            else
            {
              if (SHIBYTE(v37) < 0)
              {
                std::string::__init_copy_ctor_external((std::string *)a3[1], __s[0], (std::string::size_type)__s[1]);
              }
              else
              {
                long long v26 = *(_OWORD *)__s;
                *(void *)(v25 + 16) = v37;
                *(_OWORD *)unint64_t v25 = v26;
              }
              uint64_t v28 = v25 + 24;
              a3[1] = v25 + 24;
            }
            unsigned int v13 = a2 + 1;
            a3[1] = v28;
          }
          if ((char *)v8 != v5 && (unint64_t)v14 < v8)
          {
            do
            {
              while (1)
              {
                unsigned int v29 = *v14;
                double v30 = a2;
                if (v9 >= 1) {
                  break;
                }
LABEL_52:
                if ((v29 & 0x80000000) != 0) {
                  int v31 = __maskrune(v29, 0x4000uLL);
                }
                else {
                  int v31 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v29 + 60) & 0x4000;
                }
                ++v14;
                if (v31) {
                  BOOL v32 = v14 == v12;
                }
                else {
                  BOOL v32 = 1;
                }
                if (v32) {
                  goto LABEL_62;
                }
              }
              while (*(unsigned __int8 *)v30 != v29)
              {
                if (++v30 >= v11) {
                  goto LABEL_52;
                }
              }
              ++v14;
            }
            while (v14 != v12);
          }
LABEL_62:
          if (SHIBYTE(v37) < 0) {
            operator delete(__s[0]);
          }
          if ((char *)v8 == v5) {
            return;
          }
          goto LABEL_65;
        }
      }
LABEL_75:
      ++v5;
    }
    while ((unint64_t)v5 <= v8);
  }
}

void sub_210A48880(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  *(void *)(v17 + 8) = v18;
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *TrimmedString@<X0>(char *__src@<X0>, char *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = a2;
  int64_t v4 = __src;
  uint64_t v6 = MEMORY[0x263EF8318];
  if (__src < a2)
  {
    int64_t v7 = a2 - __src;
    do
    {
      unsigned int v8 = *v4;
      if ((v8 & 0x80000000) != 0)
      {
        if (!__maskrune(v8, 0x4000uLL)) {
          goto LABEL_9;
        }
      }
      else if ((*(_DWORD *)(v6 + 4 * v8 + 60) & 0x4000) == 0)
      {
        goto LABEL_9;
      }
      ++v4;
      --v7;
    }
    while (v7);
    int64_t v4 = (char *)v3;
  }
LABEL_9:
  while (v3 > v4)
  {
    unsigned int v9 = *v3;
    if ((v9 & 0x80000000) != 0)
    {
      if (!__maskrune(v9, 0x4000uLL)) {
        break;
      }
    }
    else if ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x4000) == 0)
    {
      break;
    }
    --v3;
  }
  return std::string::basic_string[abi:ne180100](a3, v4, v3 - v4 + 1);
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

void SVGReaderOptions::~SVGReaderOptions(SVGReaderOptions *this)
{
  CFRetained::release(*(void *)this);
  uint64_t v2 = (const void *)*((void *)this + 2);
  if (v2) {
    CFRelease(v2);
  }
}

void SVGReader::report(SVGReader *this, SVGParser *a2, uint64_t a3, uint64_t a4, ...)
{
  *(void *)unsigned int v9 = &a4;
  SVGParser::FormatString(a2, (va_list *)v9, __p);
  if (v8 >= 0) {
    uint64_t v6 = __p;
  }
  else {
    uint64_t v6 = (void **)__p[0];
  }
  if ((a3 & 0x80000000) != 0) {
    SVGUtilities::error((SVGUtilities *)"Reader: %s\n", v5, v6);
  }
  else {
    SVGUtilities::error((SVGUtilities *)"Reader: Error on line %d: %s\n", v5, a3, v6);
  }
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_210A48AB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFURLRef SVGRootNode::setWorkingDir(SVGRootNode *this, CFURLRef relativeURL)
{
  int64_t v4 = (const void *)*((void *)this + 35);
  if (v4) {
    CFRelease(v4);
  }
  CFURLRef result = CFURLCopyAbsoluteURL(relativeURL);
  *((void *)this + 35) = result;
  return result;
}

void SVGReader::parseXMLNodeGradient()
{
}

void sub_210A48E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,char a32)
{
  MEMORY[0x216677AD0](v32, 0x10F3C40A581D00ALL);
  _Unwind_Resume(a1);
}

double ___ZN9SVGReader20parseXMLNodeGradientEP8_xmlNodeP7SVGNodeN7SVGAtom4NameE_block_invoke(uint64_t a1, int a2, os_unfair_lock_s *this)
{
  double v7 = 0.0;
  char v8 = 0;
  switch(a2)
  {
    case 'S':
      if (SVGAttribute::floatValue(this, &v7))
      {
        double result = v7;
        *(double *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 88) = v7;
      }
      break;
    case '8':
      if (SVGAttribute::paintValue(this, &v8) && *((_DWORD *)v8 + 12) == 1)
      {
        unint64_t v5 = *(SVGGradientStop **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        SVGColor::SVGColor((uint64_t)v6, (uint64_t)v8 + 56);
        return SVGGradientStop::setColor(v5, (const SVGColor *)v6);
      }
      break;
    case '(':
      if (SVGAttribute::lengthValue((uint64_t)this, (uint64_t)v6))
      {
        double result = v6[0];
        *(_OWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 96) = *(_OWORD *)v6;
      }
      break;
  }
  return result;
}

uint64_t ApplyVariablesToAttributes(const SVGAttributeMap *a1, SVGAttributeMap *a2)
{
  uint64_t result = SVGAttributeMap::count(a1);
  if (result)
  {
    v3[0] = 0;
    v3[1] = v3;
    v3[2] = 0x2000000000;
    v3[3] = 0;
    operator new();
  }
  return result;
}

void sub_210A49124(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4084D8EEBALL);
  _Unwind_Resume(a1);
}

uint64_t SetNodeTextIfAvailable(_xmlNode *a1, SVGNode *a2)
{
  Content = (char *)xmlNodeGetContent(a1);
  int64_t v4 = Content;
  if (Content && *Content)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, Content);
    SVGParser::StripLeadingTrailingWhitespace(&__p, &v8);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string::size_type size = HIBYTE(v8.__r_.__value_.__r.__words[2]);
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = v8.__r_.__value_.__l.__size_;
    }
    if (size) {
      SVGNode::setText((uint64_t)a2);
    }
    if ((*((unsigned char *)&v8.__r_.__value_.__s + 23) & 0x80) != 0) {
      operator delete(v8.__r_.__value_.__l.__data_);
    }
  }
  return ((uint64_t (*)(char *))*MEMORY[0x263F8C880])(v4);
}

void sub_210A49208(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void SVGReader::parseXMLNodeClipPath(SVGReader *this, _xmlNode *a2, SVGNode *a3)
{
}

void sub_210A49348(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C407B03486ALL);
  _Unwind_Resume(a1);
}

void SVGReader::parseXMLNodeMask(SVGReader *this, _xmlNode *a2, SVGNode *a3)
{
}

void sub_210A4948C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405372943BLL);
  _Unwind_Resume(a1);
}

void SVGReader::parseXMLNodePattern(SVGReader *this, _xmlNode *a2, SVGNode *a3)
{
}

void sub_210A495CC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C40BA4B7CADLL);
  _Unwind_Resume(a1);
}

void SVGReader::parseXMLNodeFilter(SVGReader *this, _xmlNode *a2, SVGNode *a3)
{
}

void sub_210A497AC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4084D8EEBALL);
  _Unwind_Resume(a1);
}

void SVGReader::parseXMLNodeImage(SVGReader *this, _xmlNode *a2)
{
}

void sub_210A49BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  MEMORY[0x216677AD0](v14, 0x10F3C406E4AB7DALL);
  SVGReaderOptions::~SVGReaderOptions((SVGReaderOptions *)&__p);
  _Unwind_Resume(a1);
}

void ResolveGradientHrefDefinition(uint64_t a1, const char *a2)
{
  uint64_t v3 = (SVGAtom *)(a1 + 64);
  int v4 = *(char *)(a1 + 87);
  unint64_t v5 = (SVGAtom *)(a1 + 64);
  if (v4 < 0) {
    unint64_t v5 = *(SVGAtom **)v3;
  }
  if (SVGAtom::ToName(v5, a2) == 33) {
    goto LABEL_34;
  }
  if (*(char *)(a1 + 87) < 0) {
    uint64_t v3 = *(SVGAtom **)v3;
  }
  if (SVGAtom::ToName(v3, v6) == 48)
  {
LABEL_34:
    if (v7)
    {
      std::string v8 = v7;
      if (!*((unsigned char *)v7 + 448))
      {
        *((unsigned char *)v7 + 448) = 1;
        unsigned int v9 = (SVGAttribute *)SVGAttributeMap::attribute(*(void *)(a1 + 56), 0x4E20u);
        if (v9)
        {
          unint64_t v11 = v9;
          if (!*((_DWORD *)v9 + 20) && SVGAttribute::stringValueBeginsWith(v9, "#", v10))
          {
            uint64_t v12 = SVGAttribute::stringValue(v11);
            if (*(char *)(v12 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&__str, *(const std::string::value_type **)v12, *(void *)(v12 + 8));
            }
            else
            {
              long long v13 = *(_OWORD *)v12;
              __str.__r_.__value_.__r.__words[2] = *(void *)(v12 + 16);
              *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v13;
            }
            std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
            if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              std::string::size_type size = __str.__r_.__value_.__l.__size_;
            }
            std::string::basic_string(&v20, &__str, 1uLL, size - 1, (std::allocator<char> *)&v22);
            if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
            {
              if (!v20.__r_.__value_.__l.__size_)
              {
LABEL_28:
                if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v20.__r_.__value_.__l.__data_);
                }
                goto LABEL_30;
              }
              int v15 = (std::string *)v20.__r_.__value_.__r.__words[0];
            }
            else
            {
              if (!*((unsigned char *)&v20.__r_.__value_.__s + 23))
              {
LABEL_30:
                if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(__str.__r_.__value_.__l.__data_);
                }
                return;
              }
              int v15 = &v20;
            }
            DefinitionNode = SVGNode::findDefinitionNode((SVGNode *)a1, (char *)v15);
            uint64_t v18 = DefinitionNode;
            if (DefinitionNode)
            {
              if (v19 && v8 != v19)
              {
                SVGGradient::setParentGradient(v8, v19);
                ResolveGradientHrefDefinition(v18);
              }
            }
            else
            {
              SVGUtilities::log((SVGUtilities *)"Failed to resolve gradient xlink:href definition\n", v17);
            }
            goto LABEL_28;
          }
        }
      }
    }
  }
}

void sub_210A49E9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void ResolvePatternHrefDefinition(uint64_t a1, const char *a2)
{
  uint64_t v3 = (SVGAtom *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0) {
    uint64_t v3 = *(SVGAtom **)v3;
  }
  if (SVGAtom::ToName(v3, a2) == 79)
  {
    if (v4)
    {
      unint64_t v5 = v4;
      if (!*((unsigned char *)v4 + 288))
      {
        *((unsigned char *)v4 + 288) = 1;
        uint64_t v6 = (SVGAttribute *)SVGAttributeMap::attribute(*(void *)(a1 + 56), 0x4E20u);
        if (v6)
        {
          std::string v8 = v6;
          if (!*((_DWORD *)v6 + 20) && SVGAttribute::stringValueBeginsWith(v6, "#", v7))
          {
            uint64_t v9 = SVGAttribute::stringValue(v8);
            if (*(char *)(v9 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&__str, *(const std::string::value_type **)v9, *(void *)(v9 + 8));
            }
            else
            {
              long long v10 = *(_OWORD *)v9;
              __str.__r_.__value_.__r.__words[2] = *(void *)(v9 + 16);
              *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v10;
            }
            std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
            if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              std::string::size_type size = __str.__r_.__value_.__l.__size_;
            }
            std::string::basic_string(&v18, &__str, 1uLL, size - 1, (std::allocator<char> *)&v20);
            if (!std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v18, (char *)&unk_210A5361E))
            {
              if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v12 = &v18;
              }
              else {
                uint64_t v12 = (std::string *)v18.__r_.__value_.__r.__words[0];
              }
              DefinitionNode = SVGNode::findDefinitionNode((SVGNode *)a1, (char *)v12);
              int v15 = DefinitionNode;
              if (DefinitionNode)
              {
                if (v16)
                {
                  uint64_t v17 = v16;
                  if (v5 != v16)
                  {
                    *((void *)v5 + 35) = v16;
                    SVGPattern::inheritParentPattern(v5);
                    ResolvePatternHrefDefinition(v15);
                    *((void *)v5 + 35) = v17;
                    SVGPattern::inheritParentPattern(v5);
                  }
                }
              }
              else
              {
                SVGUtilities::log((SVGUtilities *)"Failed to resolve pattern xlink:href definition\n", v14);
              }
            }
            if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v18.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__str.__r_.__value_.__l.__data_);
            }
          }
        }
      }
    }
  }
}

void sub_210A4A0E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void ___ZL26ApplyVariablesToAttributesPK15SVGAttributeMapPS__block_invoke(uint64_t a1, int a2, SVGAttribute *this)
{
  uint64_t v4 = SVGAttribute::stringValue(this);
  if (*(char *)(v4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v24, *(const std::string::value_type **)v4, *(void *)(v4 + 8));
  }
  else
  {
    long long v6 = *(_OWORD *)v4;
    v24.__r_.__value_.__r.__words[2] = *(void *)(v4 + 16);
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v6;
  }
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    double v7 = &v24;
  }
  else {
    double v7 = (std::string *)v24.__r_.__value_.__r.__words[0];
  }
  if (SVGParser::StringBeginsWith((SVGParser *)v7, "var(", v5))
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string v8 = &v24;
    }
    else {
      std::string v8 = (std::string *)v24.__r_.__value_.__r.__words[0];
    }
    SVGParser::GetComponentsSeparatedByDelimiters((const char *)v8, "())", &v21);
    if (v22 - v21 == 48)
    {
      std::string v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v9 = (const char *)(v21 + 24);
      if (*(char *)(v21 + 47) < 0) {
        uint64_t v9 = *(const char **)v9;
      }
      SVGParser::GetComponentsSeparatedByDelimiters(v9, ",", (uint64_t *)&v18);
      if (v19 != v18)
      {
        uint64_t v11 = 0;
        if ((unint64_t)(((char *)v19 - (char *)v18) / 24) <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = ((char *)v19 - (char *)v18) / 24;
        }
        do
        {
          long long v13 = (char *)&v18[v11];
          if (SHIBYTE(v18[v11 + 2]) < 0) {
            long long v13 = *(char **)v13;
          }
          if (!SVGParser::StringBeginsWith((SVGParser *)v13, "--", v10))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, v13);
            SVGAttributeMap::setAttribute();
          }
          unsigned int v15 = SVGAtom::ToName((SVGAtom *)v13, v14);
          unint64_t v16 = (SVGAttribute *)SVGAttributeMap::attribute(*(void *)(a1 + 40), v15);
          if (v16)
          {
            SVGAttribute::stringValue(v16);
            SVGAttributeMap::setAttribute();
          }
          v11 += 3;
          --v12;
        }
        while (v12);
      }
      __p[0] = &v18;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    }
    std::string v18 = (void **)&v21;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v18);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
}

void sub_210A4A328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char **__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char *a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::string __p = &a16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  a16 = &a19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a16);
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(a1);
}

void ___ZL26ApplyVariablesToAttributesPK15SVGAttributeMapPS__block_invoke_2()
{
}

void sub_210A4A414(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

uint64_t ___ZL28ConvertUseElementCoordinatesP15SVGAttributeMapR6CGRect_block_invoke(uint64_t result, int a2, os_unfair_lock_s *this)
{
  uint64_t v3 = result;
  if (a2 > 66)
  {
    if (a2 == 70)
    {
      uint64_t v4 = (double *)(*(void *)(result + 40) + 8);
    }
    else
    {
      if (a2 != 67) {
        return result;
      }
      uint64_t v4 = *(double **)(result + 40);
    }
  }
  else if (a2 == 30)
  {
    uint64_t v4 = (double *)(*(void *)(result + 40) + 24);
  }
  else
  {
    if (a2 != 66) {
      return result;
    }
    uint64_t v4 = (double *)(*(void *)(result + 40) + 16);
  }
  uint64_t result = SVGAttribute::floatValue(this, v4);
  *(unsigned char *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = 1;
  return result;
}

void SVGRootNode::copy(SVGRootNode *this)
{
}

void sub_210A4A508(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C40B1BF57FCLL);
  _Unwind_Resume(a1);
}

void SVGRootNode::print(SVGRootNode *this, const char *a2)
{
  SVGUtilities::print((SVGUtilities *)"\n", a2);
  uint64_t v4 = (SVGUtilities *)SVGUtilities::print((SVGUtilities *)"RootNode: Size: {%.2f, %.2f} Viewbox: ", v3, *((void *)this + 28), *((void *)this + 29));
  SVGUtilities::printIgnoringIndention(v4, *(CGRect *)((char *)this + 240));
  long long v6 = (SVGUtilities *)SVGUtilities::print((SVGUtilities *)"\n", v5);
  SVGUtilities::indent(v6);
  uint64_t v9 = (uint64_t *)*((void *)this + 11);
  std::string v8 = (uint64_t *)*((void *)this + 12);
  while (v9 != v8)
  {
    uint64_t v10 = *v9++;
    double v7 = (SVGUtilities *)(*(uint64_t (**)(uint64_t))(*(void *)v10 + 48))(v10);
  }
  SVGUtilities::unindent(v7);
}

void SVGRootNode::adjustSizeAndViewboxToFitContents(SVGRootNode *this, CGSize a2)
{
  double height = a2.height;
  double width = a2.width;
  v5.origin.CGFloat x = (*(double (**)(SVGRootNode *, void))(*(void *)this + 32))(this, 0);
  *((void *)this + 28) = *(void *)&v5.size.width;
  *((void *)this + 29) = *(void *)&v5.size.height;
  *(CGRect *)((char *)this + 240) = CGRectInset(v5, -width, -height);
}

void SVGRootNode::SVGRootNode(SVGRootNode *this, const SVGRootNode *a2)
{
}

void sub_210A4A6AC(_Unwind_Exception *a1)
{
  SVGMask::~SVGMask(v1);
  _Unwind_Resume(a1);
}

void SVGFilter::SVGFilter(SVGFilter *this, const char *a2)
{
}

void sub_210A4A748(_Unwind_Exception *a1)
{
  SVGNode::~SVGNode(v1);
  _Unwind_Resume(a1);
}

void SVGFilter::SVGFilter(SVGFilter *this, const SVGFilter *a2)
{
}

void SVGFilter::~SVGFilter(SVGFilter *this)
{
  SVGNode::~SVGNode(this);
  JUMPOUT(0x216677AD0);
}

void SVGFilter::draw(SVGFilter *this, CGContext *a2, const SVGNode *a3, CGRect a4, CGRect a5)
{
  if (*((_DWORD *)this + 60))
  {
    double v8 = *((double *)this + 26);
    double v9 = *((double *)this + 27);
    double v10 = *((double *)this + 28);
    double v11 = *((double *)this + 29);
  }
  else
  {
    double v8 = a4.origin.x + *((double *)this + 26) * a4.size.width;
    double v9 = a4.origin.y + *((double *)this + 27) * a4.size.height;
    double v10 = a4.size.width * *((double *)this + 28);
    double v11 = a4.size.height * *((double *)this + 29);
  }
  CGImageRef SourceImage = SVGFilter::createSourceImage((uint64_t)this, 0, (uint64_t)a3, v8, v9, v10, v11);
  if (SourceImage)
  {
    long long v13 = SourceImage;
    uint64_t v14 = [MEMORY[0x263F00650] imageWithCGImage:SourceImage];
    CGImageRelease(v13);
    unsigned int v15 = SVGFilter::createSourceImage((uint64_t)this, 1, (uint64_t)a3, v8, v9, v10, v11);
    if (v15)
    {
      [MEMORY[0x263F00650] imageWithCGImage:v15];
      objc_claimAutoreleasedReturnValue();
      CGImageRelease(v15);
      CGImageGetBitsPerComponent(v13);
      CGImageGetBitsPerPixel(v13);
      CGImageGetColorSpace(v13);
      CGImageGetBitmapInfo(v13);
      CGImageGetRenderingIntent(v13);
      objc_msgSend(MEMORY[0x263F00628], "contextWithCGContext:options:", a2, 0, a2);
      (id)objc_claimAutoreleasedReturnValue();
      operator new();
    }
  }
}

void sub_210A4AF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void **a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37)
{
  a27 = (void **)&a33;
  std::vector<std::unique_ptr<FilterResult>>::__destroy_vector::operator()[abi:ne180100](&a27);

  _Unwind_Resume(a1);
}

double SVGFilter::filterRegion(SVGFilter *this, CGRect a2)
{
  double x = a2.origin.x;
  double result = *((double *)this + 26);
  if (!*((_DWORD *)this + 60)) {
    return x + result * a2.size.width;
  }
  return result;
}

CGImageRef SVGFilter::createSourceImage(uint64_t a1, int a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  v23[1] = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 248))
  {
    *(unsigned char *)(a1 + 248) = 1;
    uint64_t v22 = @"removeAncestorTransforms";
    v23[0] = MEMORY[0x263EFFA80];
    CFDictionaryRef v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    if (a2 == 1)
    {
      uint64_t v19 = CGBitmapContextCreate(0, (unint64_t)a6, (unint64_t)a7, 8uLL, 0, 0, 7u);
      uint64_t v20 = v19;
      if (v19)
      {
        CGContextTranslateCTM(v19, -a4, -a5);
        SVGUtilities::CGContextDrawSVGDefinitionNode((int)v20, *(void *)(a3 + 40), v16);
        CGImageRef Image = CGBitmapContextCreateImage(v20);
        CGContextRelease(v20);
        goto LABEL_12;
      }
    }
    else if (a2)
    {
      SVGUtilities::log((SVGUtilities *)"\nSpecified image source for the filter is currently not supported", v15);
    }
    else
    {
      uint64_t v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
      if (v17)
      {
        std::string v18 = CGBitmapContextCreate(0, (unint64_t)a6, (unint64_t)a7, 8uLL, 0, v17, 1u);
        CGColorSpaceRelease(v17);
        if (v18)
        {
          CGContextTranslateCTM(v18, -a4, -a5);
          SVGUtilities::CGContextDrawSVGDefinitionNode((int)v18, *(void *)(a3 + 40), v16);
          CGImageRef Image = CGBitmapContextCreateImage(v18);
          CGContextRelease(v18);
LABEL_12:

          goto LABEL_13;
        }
      }
    }
    CGImageRef Image = 0;
    goto LABEL_12;
  }
  CGImageRef Image = 0;
LABEL_13:
  *(unsigned char *)(a1 + 248) = 0;
  return Image;
}

void sub_210A4B21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SVGFilter::filterPrimitive(unsigned int a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = (int *)"9SVGFilter";
  while (SupportedFilters[v1] != a1)
  {
    if (++v1 == 6) {
      goto LABEL_6;
    }
  }
  uint64_t v2 = &SupportedFilters[v1];
LABEL_6:
  if ((char *)v2 - (char *)SupportedFilters != 24) {
    operator new();
  }
  uint64_t v3 = SVGAtom::ToString(a1);
  SVGUtilities::log((SVGUtilities *)"\nFilter primitive: <%s> is currently not supported.", v4, v3);
  return 0;
}

void sub_210A4B2F0(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C403455F984);
  _Unwind_Resume(a1);
}

void SVGFilter::updatedAttributes(SVGFilter *this, SVGAttributeMap *a2)
{
  uint64_t v45 = 0;
  CGAffineTransform v46 = &v45;
  uint64_t v47 = 0x4012000000;
  CGRect v48 = __Block_byref_object_copy__1;
  CGRect v49 = __Block_byref_object_dispose__1;
  CGRect v50 = "";
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  CGSVGLengthMakeWithType();
  uint64_t v51 = v4;
  uint64_t v52 = v5;
  uint64_t v37 = 0;
  CGFloat v38 = &v37;
  uint64_t v39 = 0x4012000000;
  double v40 = __Block_byref_object_copy__1;
  double v41 = __Block_byref_object_dispose__1;
  double v42 = "";
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  CGSVGLengthMakeWithType();
  uint64_t v43 = v6;
  uint64_t v44 = v7;
  uint64_t v29 = 0;
  double v30 = &v29;
  uint64_t v31 = 0x4012000000;
  uint64_t v32 = __Block_byref_object_copy__1;
  unsigned int v33 = __Block_byref_object_dispose__1;
  double v34 = "";
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  CGSVGLengthMakeWithType();
  uint64_t v35 = v8;
  uint64_t v36 = v9;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x4012000000;
  std::string v24 = __Block_byref_object_copy__1;
  unint64_t v25 = __Block_byref_object_dispose__1;
  long long v26 = "";
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  CGSVGLengthMakeWithType();
  uint64_t v27 = v10;
  uint64_t v28 = v11;
  uint64_t v17 = 0;
  std::string v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 1;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  _OWORD v12[2] = ___ZN9SVGFilter17updatedAttributesEP15SVGAttributeMap_block_invoke;
  void v12[3] = &unk_2641877E8;
  v12[4] = &v45;
  v12[5] = &v37;
  v12[6] = &v29;
  v12[7] = &v21;
  v12[8] = &v17;
  v12[9] = &v13;
  SVGAttributeMap::enumerate((uint64_t)a2, (uint64_t)v12);
  *((double *)this + 26) = CGSVGLengthScaledLength(v46[6], v46[7], 1.0);
  *((double *)this + 27) = CGSVGLengthScaledLength(v38[6], v38[7], 1.0);
  *((double *)this + 28) = CGSVGLengthScaledLength(v30[6], v30[7], 1.0);
  *((double *)this + 29) = CGSVGLengthScaledLength(v22[6], v22[7], 1.0);
  *((_DWORD *)this + 60) = *((_DWORD *)v18 + 6);
  *((_DWORD *)this + 61) = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v45, 8);
}

void sub_210A4B5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void ___ZN9SVGFilter17updatedAttributesEP15SVGAttributeMap_block_invoke(void *a1, int a2, SVGAttribute *this)
{
  int v5 = *((_DWORD *)this + 12);
  if (v5 <= 69)
  {
    switch(v5)
    {
      case 30:
        uint64_t v6 = a1[7];
        break;
      case 66:
        uint64_t v6 = a1[6];
        break;
      case 67:
        uint64_t v6 = a1[4];
        break;
      default:
        return;
    }
LABEL_12:
    if ((SVGAttribute::lengthValue((uint64_t)this, *(void *)(v6 + 8) + 48) & 1) == 0)
    {
      uint64_t v7 = SVGAtom::ToString(*((_DWORD *)this + 12));
      SVGUtilities::log((SVGUtilities *)"SVGFilter: Attribute parse error: %s\n", v8, v7);
    }
    return;
  }
  switch(v5)
  {
    case 'V':
      uint64_t v9 = SVGAttribute::stringValue(this);
      int v10 = *(char *)(v9 + 23);
      if (v10 < 0)
      {
        if (*(void *)(v9 + 8) != 17) {
          return;
        }
        uint64_t v9 = *(void *)v9;
      }
      else if (v10 != 17)
      {
        return;
      }
      if (*(void *)v9 == 0x6F427463656A626FLL
        && *(void *)(v9 + 8) == 0x6F42676E69646E75
        && *(unsigned char *)(v9 + 16) == 120)
      {
        *(_DWORD *)(*(void *)(a1[9] + 8) + 24) = 0;
      }
      break;
    case 'U':
      uint64_t v11 = SVGAttribute::stringValue(this);
      int v12 = *(char *)(v11 + 23);
      if (v12 < 0)
      {
        if (*(void *)(v11 + 8) != 14) {
          return;
        }
        uint64_t v11 = *(void *)v11;
      }
      else if (v12 != 14)
      {
        return;
      }
      if (*(void *)v11 == 0x6361705372657375 && *(void *)(v11 + 6) == 0x6573556E4F656361) {
        *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = 1;
      }
      break;
    case 'F':
      uint64_t v6 = a1[5];
      goto LABEL_12;
    default:
      return;
  }
}

uint64_t SVGFilter::IsValidFilterPrimitive(int a1)
{
  return ((a1 - 91) < 0x1E) & (0x20801699u >> (a1 - 91));
}

void std::vector<std::unique_ptr<FilterResult>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (FilterResult **)**a1;
  if (v2)
  {
    uint64_t v4 = (FilterResult **)v1[1];
    int v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<FilterResult>::reset[abi:ne180100](--v4, 0);
      while (v4 != v2);
      int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

FilterResult *std::unique_ptr<FilterResult>::reset[abi:ne180100](FilterResult **a1, FilterResult *a2)
{
  __n128 result = *a1;
  *a1 = a2;
  if (result)
  {
    FilterResult::~FilterResult(result);
    JUMPOUT(0x216677AD0);
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,FilterResult *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,FilterResult *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,FilterResult *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,FilterResult *>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,FilterResult *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,FilterResult *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,FilterResult *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,FilterResult *>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,FilterResult *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,FilterResult *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,FilterResult *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,FilterResult *>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
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
}

void *std::__hash_table<std::__hash_value_type<std::string,FilterResult *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,FilterResult *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,FilterResult *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,FilterResult *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  uint64_t v8 = (void *)(a1 + 24);
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
    uint64_t v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(void **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, (unsigned __int8 *)i + 16, a2)) {
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
  uint64_t v17 = (void *)(a1 + 16);
  uint64_t i = operator new(0x30uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v10;
  std::string v18 = *a4;
  long long v19 = **a4;
  *((void *)i + 4) = *((void *)*a4 + 2);
  *((_OWORD *)i + 1) = v19;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *(void *)std::string v18 = 0;
  *((void *)i + 5) = 0;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    std::__hash_table<SVGAtom::Name,std::hash<SVGAtom::Name>,std::equal_to<SVGAtom::Name>,std::allocator<SVGAtom::Name>>::__rehash<true>(a1, v25);
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
  uint64_t v26 = *(void *)a1;
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v4);
  if (v27)
  {
    *(void *)uint64_t i = *v27;
LABEL_38:
    *uint64_t v27 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v17;
  *uint64_t v17 = i;
  *(void *)(v26 + 8 * v4) = v17;
  if (*(void *)i)
  {
    unint64_t v28 = *(void *)(*(void *)i + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v28 >= v11) {
        v28 %= v11;
      }
    }
    else
    {
      v28 &= v11 - 1;
    }
    uint64_t v27 = (void *)(*(void *)a1 + 8 * v28);
    goto LABEL_38;
  }
LABEL_39:
  ++*v8;
  return i;
}

void sub_210A4BBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,FilterResult *>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<std::unique_ptr<FilterResult>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::unique_ptr<FilterResult>::reset[abi:ne180100]((FilterResult **)(i - 8), 0);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

BOOL SVGViewBoxNode::ParseAspectRatio(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 272) = 5;
  uint64_t v17 = 0;
  std::string v18 = 0;
  uint64_t v19 = 0;
  if (*(char *)(a2 + 23) >= 0) {
    unint64_t v4 = (const char *)a2;
  }
  else {
    unint64_t v4 = *(const char **)a2;
  }
  SVGParser::GetSeparatedWhitespaceComponents(v4, (void **)&v17, 1);
  int v5 = v17;
  uint64_t v6 = v18;
  uint64_t v7 = ((char *)v18 - (char *)v17) >> 3;
  unint64_t v8 = v7 - 1;
  if (v18 != v17 && (unint64_t)(v7 - 1) <= 1)
  {
    unint64_t v15 = v7 - 1;
    while (1)
    {
      std::string::basic_string(&v16, (const std::string *)a2, *v5, v5[1], (std::allocator<char> *)&v20);
      int v10 = SHIBYTE(v16.__r_.__value_.__r.__words[2]);
      uint64_t v11 = (void *)v16.__r_.__value_.__r.__words[0];
      if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint8x8_t v12 = &v16;
      }
      else {
        uint8x8_t v12 = (std::string *)v16.__r_.__value_.__r.__words[0];
      }
      if (!strcasecmp((const char *)v12, "None"))
      {
        *(_DWORD *)(a1 + 272) = 0;
        if (v10 < 0) {
          goto LABEL_37;
        }
        goto LABEL_40;
      }
      if (!strcasecmp((const char *)v12, "xMinYMin"))
      {
        int v13 = 1;
        goto LABEL_36;
      }
      if (!strcasecmp((const char *)v12, "xMidYMin"))
      {
        int v13 = 2;
        goto LABEL_36;
      }
      if (!strcasecmp((const char *)v12, "xMaxYMin"))
      {
        int v13 = 3;
        goto LABEL_36;
      }
      if (!strcasecmp((const char *)v12, "xMinYMid"))
      {
        int v13 = 4;
        goto LABEL_36;
      }
      if (!strcasecmp((const char *)v12, "xMidYMid"))
      {
        int v13 = 5;
        goto LABEL_36;
      }
      if (!strcasecmp((const char *)v12, "xMaxYMid"))
      {
        int v13 = 6;
        goto LABEL_36;
      }
      if (!strcasecmp((const char *)v12, "xMinYMax")) {
        break;
      }
      if (!strcasecmp((const char *)v12, "xMidYMax"))
      {
        int v13 = 8;
LABEL_36:
        *(_DWORD *)(a1 + 272) = v13;
        if (v10 < 0) {
          goto LABEL_37;
        }
        goto LABEL_40;
      }
      if (!strcasecmp((const char *)v12, "xMaxYMax"))
      {
        *(_DWORD *)(a1 + 272) = 9;
LABEL_39:
        if ((v10 & 0x80000000) == 0) {
          goto LABEL_40;
        }
LABEL_37:
        operator delete(v11);
        goto LABEL_40;
      }
      if (!strcasecmp((const char *)v12, "Meet"))
      {
        *(_DWORD *)(a1 + 276) = 0;
        if ((v10 & 0x80000000) == 0) {
          goto LABEL_40;
        }
        goto LABEL_37;
      }
      if (strcasecmp((const char *)v12, "Slice")) {
        goto LABEL_39;
      }
      *(_DWORD *)(a1 + 276) = 1;
      if (v10 < 0) {
        goto LABEL_37;
      }
LABEL_40:
      v5 += 2;
      if (v5 == v6)
      {
        int v5 = v17;
        unint64_t v8 = v15;
        goto LABEL_44;
      }
    }
    int v13 = 7;
    goto LABEL_36;
  }
LABEL_44:
  if (v5)
  {
    std::string v18 = v5;
    operator delete(v5);
  }
  return v8 < 2;
}

void sub_210A4BEF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGViewBoxNode::print(SVGViewBoxNode *this, const char *a2)
{
  SVGUtilities::print((SVGUtilities *)"\n", a2);
  unint64_t v4 = (SVGUtilities *)SVGUtilities::print((SVGUtilities *)"ViewBoxNode: Size: {%.2f, %.2f} Viewbox: ", v3, *((void *)this + 28), *((void *)this + 29));
  SVGUtilities::printIgnoringIndention(v4, *(CGRect *)((char *)this + 240));
  return SVGUtilities::print((SVGUtilities *)"\n", v5);
}

void SVGViewBoxNode::SVGViewBoxNode(SVGViewBoxNode *this, const SVGViewBoxNode *a2)
{
}

void SVGShapeNode::copy(SVGShapeNode *this)
{
}

void sub_210A4C060(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4099030930);
  _Unwind_Resume(a1);
}

void SVGShapeNode::~SVGShapeNode(SVGShapeNode *this)
{
  SVGNode::~SVGNode(this);
  JUMPOUT(0x216677AD0);
}

CGPath *SVGShapeNode::createCGPath(SVGShapeNode *this)
{
  if (*((_DWORD *)this + 74) != 42)
  {
    CGMutablePathRef Mutable = CGPathCreateMutable();
    uint64_t v7 = Mutable;
    int v8 = *((_DWORD *)this + 74);
    if (v8 <= 43)
    {
      switch(v8)
      {
        case 3:
          double v29 = *((double *)this + 36);
          if (v29 <= 0.0) {
            return v7;
          }
          double v30 = *((double *)this + 34) - v29;
          double v31 = *((double *)this + 35) - v29;
          double v32 = v29 + v29;
          double v33 = v32;
          break;
        case 16:
          double v36 = *((double *)this + 32);
          if (v36 <= 0.0) {
            return v7;
          }
          double v37 = *((double *)this + 33);
          if (v37 <= 0.0) {
            return v7;
          }
          double v30 = *((double *)this + 34) - v36;
          double v31 = *((double *)this + 35) - v37;
          double v32 = v36 + v36;
          double v33 = v37 + v37;
          break;
        case 32:
          CGPathMoveToPoint(Mutable, 0, *((CGFloat *)this + 26), *((CGFloat *)this + 27));
          CGPathAddLineToPoint(v7, 0, *((CGFloat *)this + 28), *((CGFloat *)this + 29));
          return v7;
        default:
LABEL_40:
          CGPathRelease(Mutable);
          double v34 = SVGAtom::ToString(*((_DWORD *)this + 74));
          SVGUtilities::error((SVGUtilities *)"Invalid shape primitive: %s", v35, v34);
          return 0;
      }
      CGPathAddEllipseInRect(Mutable, 0, *(CGRect *)&v30);
      return v7;
    }
    if ((v8 - 44) < 2)
    {
      unint64_t v9 = (const void **)SVGShapeNode::pointList(this);
      if (v9)
      {
        int v10 = v9;
        int64_t v11 = (unsigned char *)v9[1] - (unsigned char *)*v9;
        if ((unint64_t)v11 >= 0x11)
        {
          unint64_t v12 = v11 >> 3;
          int v13 = (CGFloat *)malloc_type_malloc(v11, 0x100004000313F17uLL);
          memcpy(v13, *v10, (unsigned char *)v10[1] - (unsigned char *)*v10);
          CGPathMoveToPoint(v7, 0, *v13, v13[1]);
          uint64_t v14 = 0;
          do
          {
            CGPathAddLineToPoint(v7, 0, v13[v14 + 2], v13[v14 + 3]);
            unint64_t v15 = v14 + 4;
            v14 += 2;
          }
          while (v15 < v12);
          if (*((_DWORD *)this + 74) == 44) {
            CGPathCloseSubpath(v7);
          }
          free(v13);
        }
      }
      return v7;
    }
    if (v8 == 49)
    {
      double v16 = *((double *)this + 30);
      if (v16 > 0.0)
      {
        double v17 = *((double *)this + 31);
        if (v17 > 0.0)
        {
          double v18 = *((double *)this + 32);
          double v19 = *((double *)this + 33);
          BOOL v20 = v18 <= 0.0;
          BOOL v21 = v18 > 0.0;
          if (v19 > 0.0)
          {
            BOOL v21 = 1;
            BOOL v20 = 1;
          }
          double v22 = 0.0;
          if (v21) {
            double v22 = *((double *)this + 33);
          }
          if (v18 <= 0.0) {
            double v23 = v22;
          }
          else {
            double v23 = *((double *)this + 32);
          }
          if (v20) {
            double v24 = v22;
          }
          else {
            double v24 = *((double *)this + 32);
          }
          double v25 = v16 * 0.5;
          if (v18 <= v16 * 0.5) {
            double v25 = v23;
          }
          if (v19 <= v17 * 0.5) {
            double v26 = v24;
          }
          else {
            double v26 = v17 * 0.5;
          }
          uint64_t v27 = *((void *)this + 26);
          uint64_t v28 = *((void *)this + 27);
          CGPathAddRoundedRect(Mutable, 0, *(CGRect *)(&v16 - 2), v25, v26);
        }
      }
      return v7;
    }
    goto LABEL_40;
  }
  uint64_t v2 = SVGShapeNode::path(this);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *((void *)v2 + 5);
  return CGSVGPathCreateCGPath(v4, v3);
}

_OWORD *SVGShapeNode::createSVGPath(SVGShapeNode *this)
{
  if (*((_DWORD *)this + 74) == 42)
  {
    uint64_t v2 = SVGShapeNode::path(this);
    if (v2)
    {
      SVGNode::transform(this, v11);
      long long v3 = v11[1];
      v2[5] = v11[0];
      v2[6] = v3;
      v2[7] = v11[2];
      CFRetained::retain((uint64_t)v2);
    }
  }
  else
  {
    CGPath = SVGShapeNode::createCGPath(this);
    int v5 = CGPath;
    if (CGPath)
    {
      uint64_t v6 = CGSVGPathCreateWithCGPath((uint64_t)CGPath);
      uint64_t v2 = CFRetained::getObject<SVGPath>(v6, v7);
      SVGNode::transform(this, v10);
      long long v8 = v10[1];
      v2[5] = v10[0];
      v2[6] = v8;
      v2[7] = v10[2];
    }
    else
    {
      uint64_t v2 = 0;
    }
    CGPathRelease(v5);
  }
  return v2;
}

void SVGShapeNode::setPointList()
{
}

void sub_210A4C480(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

double SVGShapeNode::boundingBox(SVGShapeNode *this, const char *a2)
{
  int v2 = (int)a2;
  uint64_t v4 = (double *)MEMORY[0x263F001A8];
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  int v9 = *((_DWORD *)this + 74);
  if (v9 > 43)
  {
    if ((v9 - 44) < 2)
    {
      uint64_t v17 = SVGShapeNode::pointList(this);
      if (v17)
      {
        double v18 = *(double **)v17;
        double v19 = *(double **)(v17 + 8);
        if (*(double **)v17 == v19)
        {
          double v6 = 3.40282347e38;
          double v21 = 1.17549435e-38;
          double v20 = 1.17549435e-38;
          double v5 = 3.40282347e38;
        }
        else
        {
          double v20 = 1.17549435e-38;
          double v5 = 3.40282347e38;
          double v6 = 3.40282347e38;
          double v21 = 1.17549435e-38;
          do
          {
            double v22 = *v18;
            double v23 = v18[1];
            v18 += 2;
            double v5 = fmin(v5, v22);
            double v6 = fmin(v6, v23);
            double v20 = fmax(v20, v22);
            double v21 = fmax(v21, v23);
          }
          while (v18 != v19);
        }
        double v7 = v20 - v5;
        double v8 = v21 - v6;
        goto LABEL_27;
      }
      goto LABEL_20;
    }
    if (v9 == 10001) {
      goto LABEL_27;
    }
    if (v9 == 49)
    {
      double v5 = *((double *)this + 26);
      double v6 = *((double *)this + 27);
      double v7 = *((double *)this + 30);
      double v8 = *((double *)this + 31);
      goto LABEL_27;
    }
  }
  else if (v9 <= 31)
  {
    if (v9 == 3)
    {
      double v24 = *((double *)this + 36);
      double v5 = *((double *)this + 34) - v24;
      double v6 = *((double *)this + 35) - v24;
      double v7 = v24 + v24;
      double v8 = v24 + v24;
      goto LABEL_27;
    }
    if (v9 == 16)
    {
      double v15 = *((double *)this + 32);
      double v16 = *((double *)this + 33);
      double v5 = *((double *)this + 34) - v15;
      double v6 = *((double *)this + 35) - v16;
      double v7 = v15 + v15;
      double v8 = v16 + v16;
      goto LABEL_27;
    }
  }
  else
  {
    switch(v9)
    {
      case ' ':
        v32.origin.double x = *((CGFloat *)this + 26);
        v32.origin.CGFloat y = *((CGFloat *)this + 27);
        v32.size.double width = *((double *)this + 28) - v32.origin.x;
        v32.size.double height = *((double *)this + 29) - v32.origin.y;
        *(CGRect *)&double v11 = CGRectStandardize(v32);
        goto LABEL_22;
      case '$':
        goto LABEL_27;
      case '*':
        int v10 = SVGShapeNode::path(this);
        if (v10)
        {
          double v11 = SVGPath::boundingBox(v10);
LABEL_22:
          double v5 = v11;
          double v6 = v12;
          double v7 = v13;
          double v8 = v14;
          goto LABEL_27;
        }
LABEL_20:
        double v5 = *v4;
        double v6 = v4[1];
        double v7 = v4[2];
        double v8 = v4[3];
        goto LABEL_27;
    }
  }
  SVGUtilities::log((SVGUtilities *)"SVGShapeNode::boundingBox: unhandled type: %d\n", a2, *((unsigned int *)this + 74));
LABEL_27:
  double v25 = -SVGNode::calculateStrokeWidthForBoundingBox((uint64_t)this, v2);
  double v26 = v5;
  double v27 = v6;
  double v28 = v7;
  double v29 = v8;
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v26, v25, v25);
  return result;
}

uint64_t SVGShapeNode::print(SVGShapeNode *this)
{
  SVGNode::print((SVGAttributeMap **)this);
  SVGUtilities::indent(v2);
  long long v3 = SVGAtom::ToString(*((_DWORD *)this + 74));
  double v5 = (SVGUtilities *)SVGUtilities::print((SVGUtilities *)"Shape: %s ", v4, v3);
  if (*((_DWORD *)this + 74) == 10001)
  {
    uint64_t v7 = *((void *)this + 24);
    if (v7)
    {
      if ((*(char *)(v7 + 23) & 0x80000000) == 0 || *(void *)v7)
      {
        SVGUtilities::printIgnoringIndention((SVGUtilities *)" \"", v6);
        int v9 = (uint64_t *)*((void *)this + 24);
        if (v9 && *((char *)v9 + 23) < 0) {
          int v9 = (uint64_t *)*v9;
        }
        SVGUtilities::printIgnoringIndention((SVGUtilities *)"%s", v8, v9);
        double v5 = (SVGUtilities *)SVGUtilities::printIgnoringIndention((SVGUtilities *)"\"", v10);
      }
    }
  }
  SVGUtilities::unindent(v5);
  return SVGUtilities::print((SVGUtilities *)"\n", v11);
}

BOOL SVGShapeNode::standardizeShape(SVGShapeNode *this, const SVGAttributeMap *a2)
{
  int v2 = *((_DWORD *)this + 74);
  if (v2 == 49)
  {
    v3.f64[0] = *((float64_t *)this + 32);
    double v4 = *((double *)this + 33);
    if (v4 > 0.0 && v3.f64[0] <= 0.0) {
      v3.f64[0] = *((float64_t *)this + 33);
    }
    if (v3.f64[0] > 0.0 && v4 <= 0.0) {
      double v4 = v3.f64[0];
    }
    __asm { FMOV            V3.2D, #0.5 }
    v3.f64[1] = v4;
    *((float64x2_t *)this + 16) = vminnmq_f64(v3, vmulq_f64(*((float64x2_t *)this + 15), _Q3));
  }
  return v2 == 49;
}

void SVGShapeNode::SVGShapeNode(SVGShapeNode *this, const SVGShapeNode *a2)
{
}

void CGSVGRootNodeCreate()
{
}

void sub_210A4C8EC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10F3C40B1BF57FCLL);
  _Unwind_Resume(a1);
}

double *CGSVGRootNodeSetSize(uint64_t a1, const char *a2, double a3, double a4)
{
  double result = (double *)CFRetained::getObject<SVGRootNode>(a1, a2);
  if (result)
  {
    result[28] = a3;
    result[29] = a4;
  }
  return result;
}

void *CFRetained::getObject<SVGRootNode>(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    SVGUtilities::error((SVGUtilities *)"NULL ref passed to getObject", a2);
    return 0;
  }
  int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
}

double CGSVGRootNodeGetSize(uint64_t a1, const char *a2)
{
  int v2 = (char *)CFRetained::getObject<SVGRootNode>(a1, a2);
  float64x2_t v3 = v2 + 224;
  if (!v2) {
    float64x2_t v3 = (char *)MEMORY[0x263F001B0];
  }
  return *(double *)v3;
}

double *CGSVGRootNodeSetViewbox(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  double result = (double *)CFRetained::getObject<SVGRootNode>(a1, a2);
  if (result)
  {
    result[30] = a3;
    result[31] = a4;
    result[32] = a5;
    result[33] = a6;
  }
  return result;
}

double CGSVGRootNodeGetViewbox(uint64_t a1, const char *a2)
{
  int v2 = (char *)CFRetained::getObject<SVGRootNode>(a1, a2);
  float64x2_t v3 = (char *)MEMORY[0x263F001A8];
  if (v2) {
    float64x2_t v3 = v2 + 240;
  }
  return *(double *)v3;
}

_DWORD *CGSVGRootNodeSetAspectRatio(uint64_t a1, const char *a2)
{
  int v2 = (int)a2;
  double result = CFRetained::getObject<SVGRootNode>(a1, a2);
  if (result) {
    result[68] = v2;
  }
  return result;
}

unsigned int *CGSVGRootNodeGetAspectRatio(uint64_t a1, const char *a2)
{
  double result = (unsigned int *)CFRetained::getObject<SVGRootNode>(a1, a2);
  if (result) {
    return (unsigned int *)result[68];
  }
  return result;
}

_DWORD *CGSVGRootNodeSetAspectRatioMeetOrSlice(uint64_t a1, const char *a2)
{
  int v2 = (int)a2;
  double result = CFRetained::getObject<SVGRootNode>(a1, a2);
  if (result) {
    result[69] = v2;
  }
  return result;
}

uint64_t CGSVGRootNodeGetAspectRatioMeetOrSlice(uint64_t a1, const char *a2)
{
  int v2 = CFRetained::getObject<SVGRootNode>(a1, a2);
  if (v2) {
    int v3 = v2[69];
  }
  else {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

uint64_t SVGUtilities::shared(SVGUtilities *this)
{
  if (SVGUtilities::shared(void)::onceToken != -1) {
    dispatch_once(&SVGUtilities::shared(void)::onceToken, &__block_literal_global_3);
  }
  return SVGUtilities::shared(void)::utilities;
}

void ___ZN12SVGUtilities6sharedEv_block_invoke()
{
}

void SVGUtilities::indent(SVGUtilities *this)
{
  if (SVGUtilities::shared(void)::onceToken != -1) {
    dispatch_once(&SVGUtilities::shared(void)::onceToken, &__block_literal_global_3);
  }
  ++*(_DWORD *)SVGUtilities::shared(void)::utilities;
}

void SVGUtilities::unindent(SVGUtilities *this)
{
  if (SVGUtilities::shared(void)::onceToken != -1) {
    dispatch_once(&SVGUtilities::shared(void)::onceToken, &__block_literal_global_3);
  }
  if (*(int *)SVGUtilities::shared(void)::utilities >= 1) {
    --*(_DWORD *)SVGUtilities::shared(void)::utilities;
  }
}

uint64_t SVGUtilities::print(SVGUtilities *this, const char *a2, ...)
{
  va_start(va, a2);
  if (SVGUtilities::shared(void)::onceToken != -1) {
    dispatch_once(&SVGUtilities::shared(void)::onceToken, &__block_literal_global_3);
  }
  printf("%.*s", 2 * *(_DWORD *)SVGUtilities::shared(void)::utilities, "                                      ");
  return vprintf((const char *)this, va);
}

uint64_t SVGUtilities::printIgnoringIndention(SVGUtilities *this, CGRect a2)
{
  return printf("{{%g, %g}, {%g, %g}}", a2.origin.x, a2.origin.y, a2.size.width, a2.size.height);
}

uint64_t SVGUtilities::printIgnoringIndention(SVGUtilities *this, const char *a2, ...)
{
  va_start(va, a2);
  return vprintf((const char *)this, va);
}

void SVGUtilities::log(SVGUtilities *this, const char *a2, ...)
{
  va_start(va, a2);
  if (is_verbose_logging(void)::onceToken != -1) {
    dispatch_once(&is_verbose_logging(void)::onceToken, &__block_literal_global_21);
  }
  if (is_verbose_logging(void)::isVerbose)
  {
    if (SVGUtilities::shared(void)::onceToken != -1) {
      dispatch_once(&SVGUtilities::shared(void)::onceToken, &__block_literal_global_3);
    }
    printf("%.*s", 2 * *(_DWORD *)SVGUtilities::shared(void)::utilities, "                                      ");
    vprintf((const char *)this, va);
  }
}

CGFloat SVGUtilities::CGRectGetCenter(SVGUtilities *this, CGRect a2)
{
  return a2.origin.x + a2.size.width * 0.5;
}

BOOL SVGUtilities::CGFloatEqualToFloat(SVGUtilities *this, double a2, double a3)
{
  return vabdd_f64(a2, a3) <= 0.00000001;
}

double SVGUtilities::CGFloatClamp(SVGUtilities *this, double a2, double a3, double a4)
{
  return fmin(fmax(a2, a3), a4);
}

void SVGUtilities::CGPointListConvertToFloatList(uint64_t **a1, char **a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  if (*a1 != v3)
  {
    double v5 = a2 + 2;
    double v6 = a2[1];
    do
    {
      uint64_t v8 = *v2;
      uint64_t v7 = v2[1];
      int v9 = *v5;
      if (v6 >= *v5)
      {
        double v11 = *a2;
        uint64_t v12 = (v6 - *a2) >> 3;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 61) {
          goto LABEL_37;
        }
        uint64_t v14 = v9 - v11;
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
          double v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v5, v15);
          double v11 = *a2;
          double v6 = a2[1];
        }
        else
        {
          double v16 = 0;
        }
        uint64_t v17 = &v16[8 * v12];
        *(void *)uint64_t v17 = v8;
        int v10 = v17 + 8;
        while (v6 != v11)
        {
          uint64_t v18 = *((void *)v6 - 1);
          v6 -= 8;
          *((void *)v17 - 1) = v18;
          v17 -= 8;
        }
        int v9 = &v16[8 * v15];
        *a2 = v17;
        a2[1] = v10;
        a2[2] = v9;
        if (v11)
        {
          operator delete(v11);
          int v9 = *v5;
        }
      }
      else
      {
        *(void *)double v6 = v8;
        int v10 = v6 + 8;
      }
      a2[1] = v10;
      if (v10 >= v9)
      {
        double v19 = *a2;
        uint64_t v20 = (v10 - *a2) >> 3;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 61) {
LABEL_37:
        }
          std::vector<double>::__throw_length_error[abi:ne180100]();
        uint64_t v22 = v9 - v19;
        if (v22 >> 2 > v21) {
          unint64_t v21 = v22 >> 2;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          double v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v5, v23);
          double v19 = *a2;
          int v10 = a2[1];
        }
        else
        {
          double v24 = 0;
        }
        double v25 = &v24[8 * v20];
        *(void *)double v25 = v7;
        double v6 = v25 + 8;
        while (v10 != v19)
        {
          uint64_t v26 = *((void *)v10 - 1);
          v10 -= 8;
          *((void *)v25 - 1) = v26;
          v25 -= 8;
        }
        *a2 = v25;
        a2[1] = v6;
        a2[2] = &v24[8 * v23];
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        *(void *)int v10 = v7;
        double v6 = v10 + 8;
      }
      a2[1] = v6;
      v2 += 2;
    }
    while (v2 != v3);
  }
}

char *SVGUtilities::CGFloatListFromFloats(char *__src, uint64_t a2, uint64_t a3)
{
  return std::vector<double>::__insert_with_size[abi:ne180100]<double const*,double const*>(a3, *(void *)(a3 + 8), __src, &__src[8 * a2], a2);
}

void SVGUtilities::CGPointListFromFloats(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2) {
    SVGUtilities::CGPointListFromFloats();
  }
  if (a2)
  {
    unint64_t v6 = 0;
    uint64_t v7 = (void *)(a3 + 16);
    uint64_t v8 = *(void **)(a3 + 8);
    do
    {
      uint64_t v9 = *(void *)(a1 + 8 * v6);
      uint64_t v10 = *(void *)(a1 + ((8 * v6) | 8));
      if ((unint64_t)v8 >= *v7)
      {
        double v11 = *(void **)a3;
        uint64_t v12 = ((uint64_t)v8 - *(void *)a3) >> 4;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v14 = *v7 - (void)v11;
        if (v14 >> 3 > v13) {
          unint64_t v13 = v14 >> 3;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v15)
        {
          double v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)v7, v15);
          double v11 = *(void **)a3;
          uint64_t v8 = *(void **)(a3 + 8);
        }
        else
        {
          double v16 = 0;
        }
        uint64_t v17 = &v16[16 * v12];
        *(void *)uint64_t v17 = v9;
        *((void *)v17 + 1) = v10;
        uint64_t v18 = v17;
        if (v8 != v11)
        {
          do
          {
            *((_OWORD *)v18 - 1) = *((_OWORD *)v8 - 1);
            v18 -= 16;
            v8 -= 2;
          }
          while (v8 != v11);
          double v11 = *(void **)a3;
        }
        uint64_t v8 = v17 + 16;
        *(void *)a3 = v18;
        *(void *)(a3 + 8) = v17 + 16;
        *(void *)(a3 + 16) = &v16[16 * v15];
        if (v11) {
          operator delete(v11);
        }
      }
      else
      {
        void *v8 = v9;
        v8[1] = v10;
        v8 += 2;
      }
      *(void *)(a3 + 8) = v8;
      v6 += 2;
    }
    while (v6 < a2);
  }
}

double SVGUtilities::CGSVGLengthToString@<D0>(uint64_t a1@<X0>, int a2@<W1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (a2 == 1) {
    SVGParser::FormatString((SVGParser *)"%g%%", &v5, a1);
  }
  else {
    SVGParser::FormatString((SVGParser *)"%g", &v5, a1);
  }
  double result = *(double *)&v5;
  *(_OWORD *)a3 = v5;
  a3[2] = v6;
  return result;
}

uint64_t SVGUtilities::CreateCFDataFromDataURL(SVGUtilities *this, const __CFURL *a2)
{
  return objc_claimAutoreleasedReturnValue();
}

void SVGUtilities::CGContextDrawSVGDefinitionNode(CGContext *a1, const char *a2, CFDictionaryRef theDict)
{
  _OWORD v9[2] = *MEMORY[0x263EF8340];
  if (theDict) {
    BOOL v5 = CFDictionaryGetValue(theDict, @"removeAncestorTransforms") != (const void *)*MEMORY[0x263EFFB38];
  }
  else {
    BOOL v5 = 1;
  }
  v8[1] = @"removeAncestorTransforms";
  v9[0] = MEMORY[0x263EFFA88];
  v8[0] = @"drawingDefinition";
  uint64_t v6 = [NSNumber numberWithBool:v5];
  v9[1] = v6;
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  CGContextDrawSVGNodeWithOptions(a1, a2, v7);
}

void sub_210A4D304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFIndex CFRetained::getRetainCount(CFTypeRef *this)
{
  return CFGetRetainCount(this[5]);
}

void SVGUtilities::bitmapContextDebugInfo(SVGUtilities *this, CGContext *a2, const char *a3, unint64_t a4, unint64_t a5)
{
  int v7 = (int)a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (CGContextGetType() == 4)
  {
    memset(&v30, 0, sizeof(v30));
    CGContextGetCTM(&v30, this);
    size_t Width = CGBitmapContextGetWidth(this);
    size_t Height = CGBitmapContextGetHeight(this);
    printf("\n%s, context address: %p, width: %zu, height: %zu, Transforms: %g %g %g %g %g %g\n", (const char *)a2, this, Width, Height, v30.a, v30.b, v30.c, v30.d, v30.tx, v30.ty);
    if (this)
    {
      if (v7)
      {
        size_t BytesPerRow = CGBitmapContextGetBytesPerRow(this);
        size_t v14 = CGBitmapContextGetHeight(this);
        size_t v15 = v14 * BytesPerRow;
        double v16 = malloc_type_calloc(v14 * BytesPerRow, 1uLL, 0x100004077774924uLL);
        Datdouble a = CGBitmapContextGetData(this);
        memcpy(v16, Data, v15);
        size_t v18 = CGBitmapContextGetWidth(this);
        size_t BitsPerComponent = CGBitmapContextGetBitsPerComponent(this);
        size_t v20 = CGBitmapContextGetBytesPerRow(this);
        ColorSpace = CGBitmapContextGetColorSpace(this);
        uint32_t BitmapInfo = CGBitmapContextGetBitmapInfo(this);
        unint64_t v23 = CGBitmapContextCreate(v16, v18, v14, BitsPerComponent, v20, ColorSpace, BitmapInfo);
        CGContextCopyTopGState();
        CGContextReplaceTopGState();
        CGGStateRelease();
        if (CGContextGetType() == 4)
        {
          CGContextSaveGState(v23);
          CGContextSetRGBStrokeColor(v23, 0.5, 0.8, 0.8, 0.5);
          size_t v25 = CGBitmapContextGetWidth(v23);
          CGBitmapContextGetHeight(v23);
          int v26 = 0;
          do
          {
            CGContextMoveToPoint(v23, 0.0, (double)v26);
            CGContextAddLineToPoint(v23, (double)v25, (double)v26);
            v26 += a5;
          }
          while (CGBitmapContextGetHeight(v23) >= v26);
          size_t v27 = CGBitmapContextGetHeight(v23);
          CGBitmapContextGetWidth(v23);
          int v28 = 0;
          do
          {
            CGContextMoveToPoint(v23, (double)v28, 0.0);
            CGContextAddLineToPoint(v23, (double)v28, (double)v27);
            v28 += a4;
          }
          while (CGBitmapContextGetWidth(v23) >= v28);
          *(_OWORD *)lengths = xmmword_210A53000;
          CGContextSetLineDash(v23, 0.0, lengths, 2uLL);
          CGContextStrokePath(v23);
          CGContextSetRGBFillColor(v23, 0.0, 0.0, 0.0, 0.7);
          CGContextAddArc(v23, (double)(unint64_t)((double)a4 * 0.1), (double)(unint64_t)((double)a5 * 0.1), (double)(unint64_t)((double)a4 * 0.1), 0.0, 6.28318531, 0);
          CGContextFillPath(v23);
          CGContextRestoreGState(v23);
        }
        else
        {
          SVGUtilities::log((SVGUtilities *)"drawGridLinesOnBitmapContext provides debug information for the bitmap contexts only", v24);
        }
        CGImageRef Image = CGBitmapContextCreateImage(v23);
        CGContextRelease(v23);
        free(v16);
      }
      else
      {
        CGImageRef Image = CGBitmapContextCreateImage(this);
      }
      snprintf((char *)lengths, 0x400uLL, "*/%s.png", (const char *)a2);
      if (Image)
      {
        CGImageWriteToFile();
        CGImageRelease(Image);
      }
    }
  }
  else
  {
    SVGUtilities::log((SVGUtilities *)"bitmapContextDebugInfo provides debug information for the bitmap contexts only", v10);
  }
}

char *std::vector<double>::__insert_with_size[abi:ne180100]<double const*,double const*>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  BOOL v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  int v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    unint64_t v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 3;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 2 > v14) {
      unint64_t v14 = v16 >> 2;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v37 = v9;
    if (v17) {
      size_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v9, v17);
    }
    else {
      size_t v18 = 0;
    }
    int v28 = &v18[8 * v15];
    std::string __p = v18;
    double v34 = v28;
    double v36 = &v18[8 * v17];
    uint64_t v29 = 8 * a5;
    CGAffineTransform v30 = &v28[8 * a5];
    do
    {
      uint64_t v31 = *(void *)v7;
      v7 += 8;
      *(void *)int v28 = v31;
      v28 += 8;
      v29 -= 8;
    }
    while (v29);
    uint64_t v35 = v30;
    BOOL v5 = std::vector<double>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 3;
  if (v20 >= a5)
  {
    unint64_t v21 = &__src[8 * a5];
    unint64_t v23 = *(char **)(v9 - 8);
LABEL_17:
    double v24 = &v5[8 * a5];
    size_t v25 = &v23[-8 * a5];
    int v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      int v26 = v23;
      do
      {
        uint64_t v27 = *(void *)v25;
        v25 += 8;
        *(void *)int v26 = v27;
        v26 += 8;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-8 * ((v23 - v24) >> 3)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  unint64_t v21 = &__src[8 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  }
  unint64_t v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_210A4D918(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CGSVGNodeGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A4D9A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CGSVGNodeCreate(const __CFString *a1)
{
  if (a1)
  {
    SVGUtilities::StringWithCFString(a1, &__p);
    operator new();
  }
  return 0;
}

void sub_210A4DA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v16 = v15;
  MEMORY[0x216677AD0](v16, 0x10B3C4060DEF9A3);
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void CGSVGNodeCreateGroupNode()
{
}

void sub_210A4DABC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4060DEF9A3);
  _Unwind_Resume(a1);
}

void *CGSVGNodeCopy(uint64_t a1, const char *a2)
{
  double result = CFRetained::getObject<SVGNode>(a1, a2);
  if (result)
  {
    double result = (void *)(*(uint64_t (**)(void *))(*result + 16))(result);
    if (result) {
      return (void *)result[5];
    }
  }
  return result;
}

CFTypeRef CGSVGNodeRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGNodeRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void *CGSVGNodeIsRoot(uint64_t a1, const char *a2)
{
  double result = CFRetained::getObject<SVGNode>(a1, a2);
  if (result) {
  return result;
  }
}

CFStringRef CGSVGNodeCopyName(uint64_t a1, const char *a2)
{
  CFStringRef result = (CFStringRef)CFRetained::getObject<SVGNode>(a1, a2);
  if (result)
  {
    CFStringRef v3 = result;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    BOOL v5 = (const char *)&v3[2];
    if (SHIBYTE(v3[2].data) < 0) {
      BOOL v5 = *(const char **)v5;
    }
    return CFStringCreateWithCString(v4, v5, 0x8000100u);
  }
  return result;
}

CFTypeRef *CGSVGNodeSetAttributeMap(uint64_t a1, const char *a2)
{
  CFStringRef result = (CFTypeRef *)CFRetained::getObject<SVGNode>(a1, a2);
  if (result)
  {
    BOOL v5 = (SVGNode *)result;
    CFStringRef result = (CFTypeRef *)CFRetained::getObject<SVGAttributeMap>((uint64_t)a2, v4);
    if (result)
    {
      return (CFTypeRef *)SVGNode::setAttributes(v5, result);
    }
  }
  return result;
}

void CGSVGNodeSetAttribute(uint64_t a1, const char *a2)
{
  CFStringRef v3 = (SVGNode *)CFRetained::getObject<SVGNode>(a1, a2);
  if (v3)
  {
    BOOL v5 = v3;
    uint64_t v6 = (SVGAttribute *)CFRetained::getObject<SVGAttribute>((uint64_t)a2, v4);
    if (v6)
    {
      SVGNode::setAttribute(v5, v6);
    }
  }
}

void CGSVGNodeSetCStringIdentifier(uint64_t a1, char *a2)
{
  CFStringRef v3 = (SVGNode *)CFRetained::getObject<SVGNode>(a1, a2);
  if (a2 && v3)
  {
    SVGNode::setIdentifier(v3, a2);
  }
}

void CGSVGNodeSetStringIdentifier(uint64_t a1, const __CFString *this)
{
  if (this)
  {
    SVGUtilities::StringWithCFString(this, __p);
    CFAllocatorRef v4 = CFRetained::getObject<SVGNode>(a1, v3);
    if (v4) {
      SVGNode::setIdentifier((uint64_t)v4, (uint64_t)__p);
    }
    if (v6 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_210A4DD84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFStringRef CGSVGNodeCopyStringIdentifier(uint64_t a1, const char *a2)
{
  int v2 = (SVGNode *)CFRetained::getObject<SVGNode>(a1, a2);
  if (!v2) {
    return 0;
  }
  CFStringRef v3 = SVGNode::identifier(v2);
  if (!v3) {
    return 0;
  }
  CFAllocatorRef v4 = v3;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  return CFStringCreateWithCString(v5, v4, 0x8000100u);
}

void CGSVGNodeAddChild(uint64_t a1, const char *a2)
{
  CFStringRef v3 = (SVGNode *)CFRetained::getObject<SVGNode>(a1, a2);
  CFAllocatorRef v5 = (SVGNode *)CFRetained::getObject<SVGNode>((uint64_t)a2, v4);
  if (v3 && v5)
  {
    SVGNode::addChild(v3, v5);
  }
}

void CGSVGNodeRemoveChildAtIndex(uint64_t a1, const char *a2)
{
  CFStringRef v3 = (SVGNode *)CFRetained::getObject<SVGNode>(a1, a2);
  if (v3)
  {
    SVGNode::removeChildAtIndex(v3, (unint64_t)a2);
  }
}

double CGSVGNodeGetBoundingBoxWithOptions(uint64_t a1, const char *a2, uint64_t a3)
{
  CFAllocatorRef v5 = (SVGNode *)CFRetained::getObject<SVGNode>(a1, a2);
  if (!v5) {
    return *MEMORY[0x263F001A8];
  }
  int v7 = v5;
  if (a2)
  {
    uint64_t v8 = (const SVGNode *)CFRetained::getObject<SVGNode>((uint64_t)a2, v6);
    CFAllocatorRef v5 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  return SVGNode::getBoundingBox(v5, v8, a3);
}

void *CGSVGNodeSetCStringComment(uint64_t a1, const char *a2)
{
  CFStringRef result = CFRetained::getObject<SVGNode>(a1, a2);
  if (a2 && result)
  {
    return (void *)SVGNode::setComment((uint64_t)result, a2);
  }
  return result;
}

void CGSVGNodeSetStringComment(uint64_t a1, const __CFString *this)
{
  if (this)
  {
    SVGUtilities::StringWithCFString(this, __p);
    if (v5 >= 0) {
      CFStringRef v3 = __p;
    }
    else {
      CFStringRef v3 = (void **)__p[0];
    }
    CGSVGNodeSetCStringComment(a1, (const char *)v3);
    if (v5 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_210A4DFC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *CGSVGNodeSetCStringText(uint64_t a1, const char *a2)
{
  CFStringRef result = CFRetained::getObject<SVGNode>(a1, a2);
  if (a2 && result)
  {
    return (void *)SVGNode::setText((uint64_t)result, a2);
  }
  return result;
}

void *CGSVGNodeSetStringText(uint64_t a1, const char *a2)
{
  CFStringRef result = CFRetained::getObject<SVGNode>(a1, a2);
  if (a2)
  {
    uint64_t v4 = (uint64_t)result;
    if (result)
    {
      SVGUtilities::StringWithCFString((const __CFString *)a2, &__p);
      SVGNode::setText(v4);
    }
  }
  return result;
}

void sub_210A4E088(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFStringRef CGSVGNodeCopyText(uint64_t a1, const char *a2)
{
  int v2 = CFRetained::getObject<SVGNode>(a1, a2);
  if (!v2) {
    return 0;
  }
  CFStringRef v3 = (const char *)v2[24];
  if (!v3) {
    return 0;
  }
  if (v3[23] < 0)
  {
    CFStringRef v3 = *(const char **)v3;
    if (!v3) {
      return 0;
    }
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  return CFStringCreateWithCString(v4, v3, 0x8000100u);
}

CGPath *CGSVGNodeCreateCompoundCGPath(uint64_t a1, const char *a2)
{
  CFStringRef v3 = CFRetained::getObject<SVGNode>(a1, a2);
  if (!v3) {
    return 0;
  }
  CFAllocatorRef v4 = v3;
  do
  {
    uint64_t v5 = (uint64_t)v4;
    CFAllocatorRef v4 = (void *)v4[6];
  }
  while (v4);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x5802000000;
  v30[3] = __Block_byref_object_copy__2;
  char v6 = (const char *)MEMORY[0x263F000D0];
  if (a2) {
    char v6 = a2;
  }
  long long v7 = *((_OWORD *)v6 + 1);
  long long v31 = *(_OWORD *)v6;
  v30[4] = __Block_byref_object_dispose__2;
  long long v32 = v7;
  long long v33 = *((_OWORD *)v6 + 2);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x4002000000;
  void v26[3] = __Block_byref_object_copy__1;
  v26[4] = __Block_byref_object_dispose__2;
  uint64_t v27 = 0;
  int v28 = 0;
  uint64_t v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x4002000000;
  unint64_t v21 = __Block_byref_object_copy__3;
  int64_t v22 = __Block_byref_object_dispose__4;
  std::string __p = 0;
  double v24 = 0;
  uint64_t v25 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2000000000;
  char v17 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 0x40000000;
  _OWORD v15[2] = __CGSVGNodeCreateCompoundCGPath_block_invoke;
  v15[3] = &unk_2641878A8;
  v15[4] = v26;
  v15[5] = v30;
  v15[7] = &v18;
  v15[8] = v3;
  v15[6] = v16;
  SVGNode::enumerate(v5, (uint64_t)v15);
  if (v19[6] == v19[5])
  {
    CGMutablePathRef Mutable = 0;
  }
  else
  {
    CGMutablePathRef Mutable = CGPathCreateMutable();
    uint64_t v10 = v19[5];
    uint64_t v11 = v19[6];
    while (v10 != v11)
    {
      uint64_t v12 = *(void *)(v10 + 48);
      CGPath = CGSVGPathCreateCGPath(*(void *)(v12 + 40), v8);
      CFRetained::release((CFTypeRef *)v12);
      CGPathAddPath(Mutable, (const CGAffineTransform *)v10, CGPath);
      CGPathRelease(CGPath);
      v10 += 56;
    }
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  if (__p)
  {
    double v24 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(v26, 8);
  if (v27)
  {
    int v28 = v27;
    operator delete(v27);
  }
  _Block_object_dispose(v30, 8);
  return Mutable;
}

void sub_210A4E368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  if (__p)
  {
    a28 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose(&a30, 8);
  if (a35)
  {
    a36 = (uint64_t)a35;
    operator delete(a35);
  }
  _Block_object_dispose((const void *)(v36 - 136), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(void *a1, uint64_t a2)
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

void __Block_byref_object_dispose__2(uint64_t a1)
{
  int v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

__n128 __Block_byref_object_copy__3(void *a1, uint64_t a2)
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

void __Block_byref_object_dispose__4(uint64_t a1)
{
  int v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void __CGSVGNodeCreateCompoundCGPath_block_invoke(void *a1, void *a2, int a3)
{
  if (a3)
  {
    if ((void *)a1[8] == a2) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
    uint64_t v5 = *(void *)(*(void *)(a1[4] + 8) + 48);
    if (v5 != *(void *)(*(void *)(a1[4] + 8) + 40))
    {
      uint64_t v6 = *(void *)(a1[5] + 8);
      long long v7 = *(_OWORD *)(v5 - 48);
      long long v8 = *(_OWORD *)(v5 - 32);
      *(_OWORD *)(v6 + 72) = *(_OWORD *)(v5 - 16);
      *(_OWORD *)(v6 + 56) = v8;
      *(_OWORD *)(v6 + 40) = v7;
      *(void *)(*(void *)(a1[4] + 8) + 48) -= 48;
    }
  }
  else
  {
    long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v66.double a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v66.c = v9;
    *(_OWORD *)&v66.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    uint64_t v10 = a2[7];
    if (v10)
    {
      uint64_t v11 = (os_unfair_lock_s *)SVGAttributeMap::attribute(v10, 0x3Fu);
      if (v11) {
        SVGAttribute::transformValue(v11, &v66);
      }
    }
    uint64_t v12 = *(void **)(a1[4] + 8);
    unint64_t v13 = (long long *)(*(void *)(a1[5] + 8) + 40);
    unint64_t v14 = (_OWORD *)v12[6];
    unint64_t v15 = v12[7];
    if ((unint64_t)v14 >= v15)
    {
      uint64_t v19 = v12[5];
      unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v14 - v19) >> 4);
      unint64_t v21 = v20 + 1;
      if (v20 + 1 > 0x555555555555555) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - v19) >> 4);
      if (2 * v22 > v21) {
        unint64_t v21 = 2 * v22;
      }
      if (v22 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v23 = 0x555555555555555;
      }
      else {
        unint64_t v23 = v21;
      }
      if (v23) {
        double v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGAffineTransform>>((uint64_t)(v12 + 7), v23);
      }
      else {
        double v24 = 0;
      }
      uint64_t v25 = &v24[48 * v20];
      int v26 = &v24[48 * v23];
      long long v27 = *v13;
      long long v28 = v13[2];
      *((_OWORD *)v25 + 1) = v13[1];
      *((_OWORD *)v25 + 2) = v28;
      *(_OWORD *)uint64_t v25 = v27;
      uint64_t v18 = v25 + 48;
      CGAffineTransform v30 = (char *)v12[5];
      uint64_t v29 = (char *)v12[6];
      if (v29 != v30)
      {
        do
        {
          long long v31 = *((_OWORD *)v29 - 3);
          long long v32 = *((_OWORD *)v29 - 1);
          *((_OWORD *)v25 - 2) = *((_OWORD *)v29 - 2);
          *((_OWORD *)v25 - 1) = v32;
          *((_OWORD *)v25 - 3) = v31;
          v25 -= 48;
          v29 -= 48;
        }
        while (v29 != v30);
        uint64_t v29 = (char *)v12[5];
      }
      v12[5] = v25;
      v12[6] = v18;
      v12[7] = v26;
      if (v29) {
        operator delete(v29);
      }
    }
    else
    {
      long long v16 = *v13;
      long long v17 = *(_OWORD *)(*(void *)(a1[5] + 8) + 72);
      v14[1] = *(_OWORD *)(*(void *)(a1[5] + 8) + 56);
      _OWORD v14[2] = v17;
      _OWORD *v14 = v16;
      uint64_t v18 = v14 + 3;
    }
    v12[6] = v18;
    CGAffineTransform t1 = v66;
    uint64_t v33 = *(void *)(a1[5] + 8);
    long long v34 = *(_OWORD *)(v33 + 40);
    long long v35 = *(_OWORD *)(v33 + 72);
    *(_OWORD *)&v63.c = *(_OWORD *)(v33 + 56);
    *(_OWORD *)&v63.tdouble x = v35;
    *(_OWORD *)&v63.double a = v34;
    CGAffineTransformConcat(&v65, &t1, &v63);
    long long v37 = *(_OWORD *)&v65.c;
    long long v36 = *(_OWORD *)&v65.tx;
    *(_OWORD *)(v33 + 40) = *(_OWORD *)&v65.a;
    *(_OWORD *)(v33 + 56) = v37;
    *(_OWORD *)(v33 + 72) = v36;
    if ((void *)a1[8] == a2) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
    {
      if (v38)
      {
        SVGPath = SVGShapeNode::createSVGPath(v38);
        if (SVGPath)
        {
          double v40 = SVGPath;
          double v41 = *(void **)(a1[7] + 8);
          uint64_t v42 = *(void *)(a1[5] + 8);
          long long v43 = *(_OWORD *)(v42 + 56);
          *(_OWORD *)&v65.double a = *(_OWORD *)(v42 + 40);
          *(_OWORD *)&v65.c = v43;
          *(_OWORD *)&v65.tdouble x = *(_OWORD *)(v42 + 72);
          unint64_t v44 = v41[6];
          unint64_t v45 = v41[7];
          if (v44 >= v45)
          {
            uint64_t v50 = v41[5];
            uint64_t v51 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v44 - v50) >> 3);
            unint64_t v52 = v51 + 1;
            if ((unint64_t)(v51 + 1) > 0x492492492492492) {
              std::vector<double>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v53 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v45 - v50) >> 3);
            if (2 * v53 > v52) {
              unint64_t v52 = 2 * v53;
            }
            if (v53 >= 0x249249249249249) {
              unint64_t v54 = 0x492492492492492;
            }
            else {
              unint64_t v54 = v52;
            }
            if (v54) {
              CGRect v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<CGAffineTransform,SVGPath *>>>((uint64_t)(v41 + 7), v54);
            }
            else {
              CGRect v55 = 0;
            }
            CFNumberRef v56 = &v55[56 * v51];
            char v57 = &v55[56 * v54];
            *(CGAffineTransform *)CFNumberRef v56 = v65;
            *((void *)v56 + 6) = v40;
            CGRect v49 = v56 + 56;
            CGFloat v59 = (char *)v41[5];
            CTFontRef v58 = (char *)v41[6];
            if (v58 != v59)
            {
              do
              {
                long long v60 = *(_OWORD *)(v58 - 56);
                long long v61 = *(_OWORD *)(v58 - 40);
                long long v62 = *(_OWORD *)(v58 - 24);
                *((void *)v56 - 1) = *((void *)v58 - 1);
                *(_OWORD *)(v56 - 24) = v62;
                *(_OWORD *)(v56 - 40) = v61;
                *(_OWORD *)(v56 - 56) = v60;
                v56 -= 56;
                v58 -= 56;
              }
              while (v58 != v59);
              CTFontRef v58 = (char *)v41[5];
            }
            v41[5] = v56;
            v41[6] = v49;
            v41[7] = v57;
            if (v58) {
              operator delete(v58);
            }
          }
          else
          {
            CGAffineTransform v46 = (long long *)(v42 + 40);
            long long v47 = *v46;
            long long v48 = v46[2];
            *(_OWORD *)(v44 + 16) = v46[1];
            *(_OWORD *)(v44 + 32) = v48;
            *(_OWORD *)unint64_t v44 = v47;
            *(void *)(v44 + 48) = SVGPath;
            CGRect v49 = (char *)(v44 + 56);
          }
          v41[6] = v49;
        }
      }
    }
  }
}

double CGSVGNodeGetBoundingBox(uint64_t a1)
{
  return CGSVGNodeGetBoundingBoxWithOptions(a1, 0, 0);
}

double CGSVGNodeGetRelativeBoundingBox(const char *a1, uint64_t a2)
{
  return CGSVGNodeGetBoundingBoxWithOptions(a2, a1, 0);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CGAffineTransform>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<CGAffineTransform,SVGPath *>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(56 * a2);
}

uint64_t CGSVGAttributeGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttribute::kSVGAttributeClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A4E99C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CGSVGAttributeCreateWithCString(uint64_t a1, uint64_t a2)
{
  if (a2) {
    operator new();
  }
  return 0;
}

void sub_210A4EA1C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

uint64_t CGSVGAttributeCreateWithString(int a1, const __CFString *this)
{
  if (this)
  {
    SVGUtilities::StringWithCFString(this, &__p);
    operator new();
  }
  return 0;
}

void sub_210A4EAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  MEMORY[0x216677AD0](v15, 0x10B3C405B4D0908);
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void CGSVGAttributeCreateWithAtom()
{
}

void sub_210A4EB54(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void *CGSVGAttributeCreateWithFilter(uint64_t a1, const char *a2)
{
  __n128 result = CFRetained::getObject<SVGFilter>((uint64_t)a2, a2);
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A4EBDC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void CGSVGAttributeCreateWithFloat()
{
}

void sub_210A4EC58(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

uint64_t CGSVGAttributeCreateWithFloats(int a1, char *__src, uint64_t a3)
{
  if (__src)
  {
    memset(__p, 0, sizeof(__p));
    SVGUtilities::CGFloatListFromFloats(__src, a3, (uint64_t)__p);
    operator new();
  }
  return 0;
}

void sub_210A4ED0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  MEMORY[0x216677AD0](v11, 0x10B3C405B4D0908);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void CGSVGAttributeCreateWithLength()
{
}

void sub_210A4EDAC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void *CGSVGAttributeCreateWithMask(uint64_t a1, const char *a2)
{
  __n128 result = CFRetained::getObject<SVGMask>((uint64_t)a2, a2);
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A4EE34(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void CGSVGAttributeCreateWithRect()
{
}

void sub_210A4EED0(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void CGSVGAttributeCreateWithColor(uint64_t a1, uint64_t a2)
{
  SVGColor::SVGColor((uint64_t)v2, *(_DWORD *)(a2 + 32), *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24));
  operator new();
}

void sub_210A4EF6C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void *CGSVGAttributeCreateWithGradient(uint64_t a1, const char *a2)
{
  __n128 result = CFRetained::getObject<SVGGradient>((uint64_t)a2, a2);
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A4EFF4(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void *CGSVGAttributeCreateWithClipPath(uint64_t a1, const char *a2)
{
  __n128 result = CFRetained::getObject<SVGClipPath>((uint64_t)a2, a2);
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A4F07C(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void *CGSVGAttributeCreateWithPaint(uint64_t a1, const char *a2)
{
  __n128 result = CFRetained::getObject<SVGPaint>((uint64_t)a2, a2);
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A4F104(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void CGSVGAttributeCreateWithPoint()
{
}

void sub_210A4F188(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void *CGSVGAttributeCreateWithPath(uint64_t a1, const char *a2)
{
  __n128 result = CFRetained::getObject<SVGPath>((uint64_t)a2, a2);
  if (result) {
    operator new();
  }
  return result;
}

void sub_210A4F218(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

void CGSVGAttributeCreateWithTransform()
{
}

void sub_210A4F2AC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGAttributeRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGAttributeRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

unsigned int *CGSVGAttributeGetType(uint64_t a1, const char *a2)
{
  __n128 result = (unsigned int *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result) {
    return (unsigned int *)result[20];
  }
  return result;
}

unsigned int *CGSVGAttributeGetName(uint64_t a1, const char *a2)
{
  __n128 result = (unsigned int *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result) {
    return (unsigned int *)result[12];
  }
  return result;
}

void *CGSVGAttributeGetFloatCount(uint64_t a1, const char *a2)
{
  __n128 result = CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    char v3 = 0;
    if (SVGAttribute::floatsValue((uint64_t)result, &v3) && v3) {
      return (void *)((uint64_t)(v3[1] - *v3) >> 3);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t CGSVGAttributeGetFilter(uint64_t a1, char *a2)
{
  char v3 = (os_unfair_lock_s *)CFRetained::getObject<SVGAttribute>(a1, a2);
  uint64_t v5 = 0;
  LODWORD(result) = SVGAttribute::filterValue(v3, &v5);
  if (v5) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 0;
  }
  if (result == 1) {
    *(void *)a2 = *((void *)v5 + 5);
  }
  return result;
}

uint64_t CGSVGAttributeGetFloats(uint64_t a1, char *a2)
{
  uint64_t result = (uint64_t)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    uint64_t v4 = 0;
    if (SVGAttribute::floatsValue(result, &v4) && v4)
    {
      memcpy(a2, *(const void **)v4, *(void *)(v4 + 8) - *(void *)v4);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *CGSVGAttributeGetLength(uint64_t a1, const char *a2)
{
  uint64_t result = CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    return (void *)SVGAttribute::lengthValue((uint64_t)result, (uint64_t)a2);
  }
  return result;
}

os_unfair_lock_s *CGSVGAttributeGetMask(uint64_t a1, char *a2)
{
  uint64_t result = (os_unfair_lock_s *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    uint64_t v4 = 0;
    if (SVGAttribute::maskValue(result, &v4) && v4)
    {
      *(void *)a2 = *((void *)v4 + 5);
      return (os_unfair_lock_s *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

os_unfair_lock_s *CGSVGAttributeGetRect(uint64_t a1, char *a2)
{
  uint64_t result = (os_unfair_lock_s *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    return (os_unfair_lock_s *)SVGAttribute::rectValue(result, (CGRect *)a2);
  }
  return result;
}

os_unfair_lock_s *CGSVGAttributeGetPaint(uint64_t a1, char *a2)
{
  uint64_t result = (os_unfair_lock_s *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    uint64_t v4 = 0;
    if (SVGAttribute::paintValue(result, &v4) && v4)
    {
      *(void *)a2 = *((void *)v4 + 5);
      return (os_unfair_lock_s *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

os_unfair_lock_s *CGSVGAttributeGetClipPath(uint64_t a1, char *a2)
{
  uint64_t result = (os_unfair_lock_s *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    uint64_t v4 = 0;
    if (SVGAttribute::clipPathValue(result, &v4) && v4)
    {
      *(void *)a2 = *((void *)v4 + 5);
      return (os_unfair_lock_s *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

os_unfair_lock_s *CGSVGAttributeGetPoint(uint64_t a1, char *a2)
{
  uint64_t result = (os_unfair_lock_s *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    return (os_unfair_lock_s *)SVGAttribute::pointValue(result, (CGPoint *)a2);
  }
  return result;
}

os_unfair_lock_s *CGSVGAttributeGetPath(uint64_t a1, char *a2)
{
  uint64_t result = (os_unfair_lock_s *)CFRetained::getObject<SVGAttribute>(a1, a2);
  if (result)
  {
    uint64_t v4 = 0;
    if (SVGAttribute::pathValue(result, &v4) && v4)
    {
      *(void *)a2 = *((void *)v4 + 5);
      return (os_unfair_lock_s *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CGSVGAttributeMapGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGAttributeMap::kSVGAttributeMapClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A4F6F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGAttributeMapCreate()
{
}

void sub_210A4F750(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C4084D8EEBALL);
  _Unwind_Resume(a1);
}

void CGSVGAttributeMapCreateWithDefaults(SVGAttributeMap *a1)
{
}

SVGAttributeMap *CGSVGAttributeMapCopy(uint64_t a1, const char *a2)
{
  uint64_t result = (SVGAttributeMap *)CFRetained::getObject<SVGAttributeMap>(a1, a2);
  if (result) {
    SVGAttributeMap::createShallowCopy(result);
  }
  return result;
}

CFTypeRef CGSVGAttributeMapRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGAttributeMapRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void CGSVGAttributeMapSetAttribute(uint64_t a1, const char *a2)
{
  char v3 = CFRetained::getObject<SVGAttributeMap>(a1, a2);
  if (v3)
  {
    uint64_t v5 = (uint64_t)v3;
    uint64_t v6 = CFRetained::getObject<SVGAttribute>((uint64_t)a2, v4);
    if (v6)
    {
      SVGAttributeMap::setAttribute(v5, (uint64_t)v6, 0);
    }
  }
}

void CGSVGAttributeMapRemoveAttribute(uint64_t a1, const char *a2)
{
  unsigned int v2 = a2;
  char v3 = CFRetained::getObject<SVGAttributeMap>(a1, a2);
  if (v3)
  {
    SVGAttributeMap::removeAttribute((uint64_t)v3, v2);
  }
}

uint64_t __CGSVGAttributeMapEnumerate_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

double SVGWriter::SVGWriter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(void *)(a1 + 40) = 0;
  return result;
}

BOOL SVGWriter::write(SVGWriter *this, SVGRootNode *a2, const char *cStr, const SVGStyle *a4)
{
  if (!a2 || !cStr) {
    return 0;
  }
  *((void *)this + 1) = a2;
  *((void *)this + 2) = a4;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v6 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  if (v6)
  {
    CFStringRef v7 = v6;
    if (!CFStringHasSuffix(v6, @"file://"))
    {
      CFStringRef v8 = CFStringCreateWithFormat(v5, 0, @"file://%@", v7);
      CFRelease(v7);
      CFStringRef v7 = v8;
    }
    CFURLRef v9 = CFURLCreateWithString(v5, v7, 0);
    if (v9)
    {
      CFURLRef v10 = v9;
      *((void *)this + 3) = CFWriteStreamCreateWithFile(v5, v9);
      CFRelease(v10);
    }
    CFRelease(v7);
  }
  BOOL v11 = SVGWriter::writeStream(this);
  SVGWriter::cleanupStream(this);
  return v11;
}

BOOL SVGWriter::writeStream(SVGWriter *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (v1)
  {
    CFWriteStreamOpen(*((CFWriteStreamRef *)this + 3));
    char v3 = xmlBufferCreate();
    *((void *)this + 5) = v3;
    uint64_t v4 = xmlNewTextWriterMemory(v3, 0);
    *((void *)this + 4) = v4;
    if (!*(void *)this || !*(unsigned char *)(*(void *)this + 1))
    {
      xmlTextWriterSetIndent(v4, 2);
      xmlTextWriterSetIndentString(*((xmlTextWriterPtr *)this + 4), (const xmlChar *)" ");
    }
    SVGWriter::writeComment((uint64_t)this, *((const SVGNode **)this + 1));
    xmlTextWriterStartDocument(*((xmlTextWriterPtr *)this + 4), 0, "UTF-8", 0);
    if (!*(void *)this || !*(unsigned char *)(*(void *)this + 2))
    {
      SVGParser::FormatString((SVGParser *)"Generator: Apple Native CoreSVG %g", __p, 0x4075500000000000);
      CFAllocatorRef v5 = v27 >= 0 ? (const xmlChar *)__p : (const xmlChar *)__p[0];
      xmlTextWriterWriteComment(*((xmlTextWriterPtr *)this + 4), v5);
      xmlTextWriterStartDTD(*((xmlTextWriterPtr *)this + 4), (const xmlChar *)"svg", (const xmlChar *)"-//W3C//DTD SVG 1.1//EN", (const xmlChar *)"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd");
      xmlTextWriterEndDTD(*((xmlTextWriterPtr *)this + 4));
      if (v27 < 0) {
        operator delete(__p[0]);
      }
    }
    CFStringRef v6 = (xmlTextWriter *)*((void *)this + 4);
    CFStringRef v7 = (const xmlChar *)SVGAtom::ToString(0x3Du);
    xmlTextWriterStartElement(v6, v7);
    CFStringRef v8 = (const xmlChar *)SVGAtom::ToString(0x40u);
    xmlTextWriterWriteAttribute(*((xmlTextWriterPtr *)this + 4), v8, (const xmlChar *)"1.1");
    if (!*(void *)this || !*(unsigned char *)(*(void *)this + 2))
    {
      xmlTextWriterWriteAttribute(*((xmlTextWriterPtr *)this + 4), (const xmlChar *)"xmlns", (const xmlChar *)"http://www.w3.org/2000/svg");
      xmlTextWriterWriteAttribute(*((xmlTextWriterPtr *)this + 4), (const xmlChar *)"xmlns:xlink", (const xmlChar *)"http://www.w3.org/1999/xlink");
    }
    uint64_t v9 = *((void *)this + 1);
    double v11 = *(double *)(v9 + 224);
    double v10 = *(double *)(v9 + 232);
    if (v11 == 0.0 || v10 == 0.0)
    {
      (*(void (**)(uint64_t, void))(*(void *)v9 + 32))(v9, 0);
      double v13 = v14;
      double v12 = v15;
      uint64_t v9 = *((void *)this + 1);
    }
    else
    {
      double v12 = *(double *)(v9 + 232);
      double v13 = *(double *)(v9 + 224);
    }
    double v16 = 0.0;
    if (CGRectIsEmpty(*(CGRect *)(v9 + 240)))
    {
      double v17 = 0.0;
      double v18 = v13;
      double v19 = v12;
    }
    else
    {
      unint64_t v20 = (double *)*((void *)this + 1);
      double v16 = v20[30];
      double v17 = v20[31];
      double v18 = v20[32];
      double v19 = v20[33];
      if (v16 != 0.0 || v17 != 0.0 || v18 != v13 || v19 != v12)
      {
        if (v11 != 0.0) {
          SVGWriter::writeAttribute((uint64_t)this, 0x42u, v13);
        }
        if (v10 != 0.0) {
          SVGWriter::writeAttribute((uint64_t)this, 0x1Eu, v12);
        }
      }
    }
    SVGWriter::writeAttribute((uint64_t)this, 0x41u, v16, v17, v18, v19);
    SVGWriter::writeDefinitions(this);
    uint64_t v21 = *((void *)this + 1);
    unint64_t v22 = *(SVGAttributeMap ****)(v21 + 88);
    unint64_t v23 = *(SVGAttributeMap ****)(v21 + 96);
    while (v22 != v23)
    {
      double v24 = *v22++;
      SVGWriter::writeNode((xmlTextWriterPtr *)this, v24);
    }
    xmlTextWriterEndElement(*((xmlTextWriterPtr *)this + 4));
    xmlTextWriterEndDocument(*((xmlTextWriterPtr *)this + 4));
    CFWriteStreamWrite(*((CFWriteStreamRef *)this + 3), **((const UInt8 ***)this + 5), *(unsigned int *)(*((void *)this + 5) + 8));
  }
  return v1 != 0;
}

void sub_210A4FCBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGWriter::cleanupStream(SVGWriter *this)
{
  unsigned int v2 = (__CFWriteStream *)*((void *)this + 3);
  if (v2)
  {
    CFWriteStreamClose(v2);
    CFRelease(*((CFTypeRef *)this + 3));
    *((void *)this + 3) = 0;
  }
  xmlFreeTextWriter(*((xmlTextWriterPtr *)this + 4));
  *((void *)this + 4) = 0;
  xmlBufferFree(*((xmlBufferPtr *)this + 5));
  *((void *)this + 5) = 0;
}

BOOL SVGWriter::write(SVGWriter *this, SVGRootNode *a2, __CFData *a3, const SVGStyle *a4)
{
  BOOL v4 = 0;
  if (a2 && a3)
  {
    *((void *)this + 1) = a2;
    CFWriteStreamRef v8 = CFWriteStreamCreateWithAllocatedBuffers((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFAllocatorRef)*MEMORY[0x263EFFB08]);
    *((void *)this + 2) = a4;
    *((void *)this + 3) = v8;
    BOOL v4 = SVGWriter::writeStream(this);
    if (v4)
    {
      CFDataRef v9 = (const __CFData *)CFWriteStreamCopyProperty(*((CFWriteStreamRef *)this + 3), (CFStreamPropertyKey)*MEMORY[0x263EFFE98]);
      BytePtr = CFDataGetBytePtr(v9);
      CFIndex Length = CFDataGetLength(v9);
      CFDataAppendBytes(a3, BytePtr, Length);
      CFRelease(v9);
    }
    SVGWriter::cleanupStream(this);
  }
  return v4;
}

BOOL SVGWriter::write(SVGWriter *this, SVGRootNode *a2, CFURLRef fileURL, const SVGStyle *a4)
{
  if (!a2 || !fileURL) {
    return 0;
  }
  *((void *)this + 1) = a2;
  CFWriteStreamRef v6 = CFWriteStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], fileURL);
  *((void *)this + 2) = a4;
  *((void *)this + 3) = v6;
  BOOL v7 = SVGWriter::writeStream(this);
  SVGWriter::cleanupStream(this);
  return v7;
}

uint64_t SVGWriter::writeComment(uint64_t this, const SVGNode *a2)
{
  unsigned int v2 = (const xmlChar *)*((void *)a2 + 23);
  if (v2)
  {
    if (((char)v2[23] & 0x80000000) == 0 || (unsigned int v2 = *(const xmlChar **)v2) != 0)
    {
      if (*v2) {
        return xmlTextWriterWriteComment(*(xmlTextWriterPtr *)(this + 32), v2);
      }
    }
  }
  return this;
}

uint64_t SVGWriter::writeComment(xmlTextWriterPtr *this, const xmlChar *a2)
{
  return xmlTextWriterWriteComment(this[4], a2);
}

uint64_t SVGWriter::writeBeginElement(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(xmlTextWriter **)(a1 + 32);
  char v3 = (const xmlChar *)SVGAtom::ToString(a2);
  return xmlTextWriterStartElement(v2, v3);
}

uint64_t SVGWriter::writeAttribute(uint64_t a1, unsigned int a2, const xmlChar *a3)
{
  CFAllocatorRef v5 = (const xmlChar *)SVGAtom::ToString(a2);
  CFWriteStreamRef v6 = *(xmlTextWriter **)(a1 + 32);
  return xmlTextWriterWriteAttribute(v6, v5, a3);
}

uint64_t SVGWriter::writeAttribute(xmlTextWriterPtr *this, const xmlChar *a2, const xmlChar *a3)
{
  return xmlTextWriterWriteAttribute(this[4], a2, a3);
}

void SVGWriter::writeAttribute(uint64_t a1, unsigned int a2, double a3)
{
  SVGParser::FormatString((SVGParser *)"%g", __p, *(void *)&a3);
  int v5 = v10;
  CFWriteStreamRef v6 = (void **)__p[0];
  BOOL v7 = (const xmlChar *)SVGAtom::ToString(a2);
  if (v5 >= 0) {
    CFWriteStreamRef v8 = __p;
  }
  else {
    CFWriteStreamRef v8 = v6;
  }
  xmlTextWriterWriteAttribute(*(xmlTextWriterPtr *)(a1 + 32), v7, (const xmlChar *)v8);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

void sub_210A4FF98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGWriter::writeAttribute(uint64_t a1, unsigned int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a3);
  v22.origin.double x = a3;
  v22.origin.CGFloat y = a4;
  v22.size.double width = a5;
  v22.size.double height = a6;
  CGFloat MinY = CGRectGetMinY(v22);
  v23.origin.double x = a3;
  v23.origin.CGFloat y = a4;
  v23.size.double width = a5;
  v23.size.double height = a6;
  CGFloat Width = CGRectGetWidth(v23);
  v24.origin.double x = a3;
  v24.origin.CGFloat y = a4;
  v24.size.double width = a5;
  v24.size.double height = a6;
  CGFloat Height = CGRectGetHeight(v24);
  SVGParser::FormatString((SVGParser *)"%g %g %g %g", __p, *(void *)&MinX, *(void *)&MinY, *(void *)&Width, *(void *)&Height);
  int v16 = v21;
  double v17 = (void **)__p[0];
  double v18 = (const xmlChar *)SVGAtom::ToString(a2);
  if (v16 >= 0) {
    double v19 = __p;
  }
  else {
    double v19 = v17;
  }
  xmlTextWriterWriteAttribute(*(xmlTextWriterPtr *)(a1 + 32), v18, (const xmlChar *)v19);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
}

void sub_210A500BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *SVGWriter::writeDefinitions(void *this)
{
  uint64_t v1 = (uint64_t)this;
  if (*(void *)(this[1] + 176) || this[2])
  {
    unsigned int v2 = (xmlTextWriter *)this[4];
    char v3 = (const xmlChar *)SVGAtom::ToString(0xEu);
    xmlTextWriterStartElement(v2, v3);
    SVGWriter::writeGradients(v1);
    SVGWriter::writeImage((xmlTextWriterPtr *)v1);
    SVGWriter::writeStyle((SVGWriter *)v1);
    SVGWriter::writePatterns((xmlTextWriterPtr *)v1);
    SVGWriter::writeMask((xmlTextWriterPtr *)v1);
    BOOL v4 = *(xmlTextWriter **)(v1 + 32);
    return (void *)xmlTextWriterEndElement(v4);
  }
  return this;
}

uint64_t SVGWriter::writeNode(xmlTextWriterPtr *this, SVGAttributeMap **a2)
{
  SVGWriter::writeComment((uint64_t)this, (const SVGNode *)a2);
  if (!a2) {
    __cxa_bad_typeid();
  }
  {
    SVGWriter::writeShapeNode((SVGWriter *)this, (const SVGShapeNode *)a2);
  }
  else
  {
    BOOL v7 = (SVGAtom *)(a2 + 8);
    if (*((char *)a2 + 87) < 0) {
      BOOL v7 = *(SVGAtom **)v7;
    }
    unsigned int v8 = SVGAtom::ToName(v7, v4);
    CFDataRef v9 = this[4];
    char v10 = (const xmlChar *)SVGAtom::ToString(v8);
    xmlTextWriterStartElement(v9, v10);
    SVGWriter::writeAttributeMap((uint64_t)this, a2[7]);
    double v11 = a2[24];
    if (v11)
    {
      if ((*((char *)v11 + 23) & 0x80000000) == 0 || (double v11 = *(SVGAttributeMap **)v11) != 0)
      {
        if (*(unsigned char *)v11) {
          xmlTextWriterWriteString(this[4], (const xmlChar *)v11);
        }
      }
    }
    double v13 = (const SVGNode **)a2[11];
    double v12 = (const SVGNode **)a2[12];
    while (v13 != v12)
    {
      double v14 = *v13++;
      SVGWriter::writeNode((SVGWriter *)this, v14);
    }
  }
  int v5 = this[4];
  return xmlTextWriterEndElement(v5);
}

uint64_t SVGWriter::writeEndElement(xmlTextWriterPtr *this)
{
  return xmlTextWriterEndElement(this[4]);
}

uint64_t SVGWriter::writeAttribute(uint64_t a1, unsigned int a2, unsigned int a3)
{
  int v5 = (const xmlChar *)SVGAtom::ToString(a3);
  CFWriteStreamRef v6 = (const xmlChar *)SVGAtom::ToString(a2);
  BOOL v7 = *(xmlTextWriter **)(a1 + 32);
  return xmlTextWriterWriteAttribute(v7, v6, v5);
}

void SVGWriter::writeAttribute(uint64_t a1, unsigned int a2, uint64_t a3, int a4, int a5)
{
  if (!a5 || COERCE_DOUBLE(a3 & 0x7FFFFFFFFFFFFFFFLL) > 0.00000011920929)
  {
    SVGUtilities::CGSVGLengthToString(a3, a4, __p);
    int v7 = v12;
    unsigned int v8 = (void **)__p[0];
    CFDataRef v9 = (const xmlChar *)SVGAtom::ToString(a2);
    if (v7 >= 0) {
      char v10 = __p;
    }
    else {
      char v10 = v8;
    }
    xmlTextWriterWriteAttribute(*(xmlTextWriterPtr *)(a1 + 32), v9, (const xmlChar *)v10);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_210A50364(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SVGWriter::writeAttribute(uint64_t a1, unsigned int a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  if (!CGSVGLengthEqualToLength(a3, a4, a5, a6))
  {
    SVGUtilities::CGSVGLengthToString(a3, a4, __p);
    int v10 = v15;
    double v11 = (void **)__p[0];
    char v12 = (const xmlChar *)SVGAtom::ToString(a2);
    if (v10 >= 0) {
      double v13 = __p;
    }
    else {
      double v13 = v11;
    }
    xmlTextWriterWriteAttribute(*(xmlTextWriterPtr *)(a1 + 32), v12, (const xmlChar *)v13);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_210A50424(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SVGWriter::writeAttribute(uint64_t a1, unsigned int a2, char *__s1, char *__s2)
{
  uint64_t result = strcmp(__s1, __s2);
  if (result)
  {
    unsigned int v8 = (const xmlChar *)SVGAtom::ToString(a2);
    CFDataRef v9 = *(xmlTextWriter **)(a1 + 32);
    return xmlTextWriterWriteAttribute(v9, v8, (const xmlChar *)__s1);
  }
  return result;
}

uint64_t SVGWriter::writeAttributeMap(uint64_t this, SVGAttributeMap *a2)
{
  if (a2)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 0x40000000;
    v2[2] = ___ZN9SVGWriter17writeAttributeMapEP15SVGAttributeMap_block_invoke;
    v2[3] = &__block_descriptor_tmp_16;
    v2[4] = this;
    return SVGAttributeMap::enumerate((uint64_t)a2, (uint64_t)v2);
  }
  return this;
}

void ___ZN9SVGWriter17writeAttributeMapEP15SVGAttributeMap_block_invoke(uint64_t a1, unsigned int a2, SVGAttribute *this)
{
  BOOL v4 = *(void **)(a1 + 32);
  if (*v4 && a2 >= 0xA0 && *(unsigned char *)*v4)
  {
    int v5 = SVGAtom::ToString(a2);
    SVGUtilities::error((SVGUtilities *)"Attribute '%s' is not allowed in strict mode\n", v6, v5);
  }
  else
  {
    uint64_t v7 = SVGAttribute::stringValue(this);
    if (*(char *)(v7 + 23) >= 0) {
      unsigned int v8 = (const xmlChar *)v7;
    }
    else {
      unsigned int v8 = *(const xmlChar **)v7;
    }
    CFDataRef v9 = (const xmlChar *)SVGAtom::ToString(a2);
    int v10 = (xmlTextWriter *)v4[4];
    xmlTextWriterWriteAttribute(v10, v9, v8);
  }
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

void SVGWriter::writeShapeNode(SVGWriter *this, const SVGShapeNode *a2)
{
  BOOL v4 = (const SVGShapeNode *)((char *)a2 + 64);
  if (*((char *)a2 + 87) < 0) {
    BOOL v4 = *(SVGAtom **)v4;
  }
  unsigned int v5 = SVGAtom::ToName(v4, (const char *)a2);
  if (!*(void *)this || !**(unsigned char **)this || *((_DWORD *)a2 + 74) != 10001)
  {
    uint64_t v7 = (xmlTextWriter *)*((void *)this + 4);
    unsigned int v8 = (const xmlChar *)SVGAtom::ToString(v5);
    xmlTextWriterStartElement(v7, v8);
    operator new();
  }
  SVGUtilities::error((SVGUtilities *)"Text shapes are not allowed in strict mode\n", v6);
}

void sub_210A50CB0(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C405B4D0908);
  _Unwind_Resume(a1);
}

xmlTextWriterPtr *SVGWriter::writeImage(xmlTextWriterPtr *this)
{
  xmlTextWriterPtr v1 = this[1];
  uint64_t v2 = (void *)*((void *)v1 + 20);
  uint64_t v3 = (void *)((char *)v1 + 168);
  if (v2 != (void *)((char *)v1 + 168))
  {
    BOOL v4 = this;
    do
    {
      this = (xmlTextWriterPtr *)v2[7];
      if (this)
      {
        if (this) {
          this = (xmlTextWriterPtr *)SVGWriter::writeNode(v4, this);
        }
      }
      unsigned int v5 = (void *)v2[1];
      if (v5)
      {
        do
        {
          CFWriteStreamRef v6 = v5;
          unsigned int v5 = (void *)*v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          CFWriteStreamRef v6 = (void *)v2[2];
          BOOL v7 = *v6 == (void)v2;
          uint64_t v2 = v6;
        }
        while (!v7);
      }
      uint64_t v2 = v6;
    }
    while (v6 != v3);
  }
  return this;
}

uint64_t SVGWriter::writeGradients(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 8);
  uint64_t v2 = *(void **)(v1 + 160);
  uint64_t v3 = (void *)(v1 + 168);
  if (v2 != (void *)(v1 + 168))
  {
    uint64_t v4 = this;
    unint64_t v44 = (void *)(v1 + 168);
    do
    {
      this = v2[7];
      if (this)
      {
        if (this)
        {
          uint64_t v5 = this;
          if (*(_DWORD *)(this + 208)) {
            unsigned int v6 = 48;
          }
          else {
            unsigned int v6 = 33;
          }
          BOOL v7 = *(xmlTextWriter **)(v4 + 32);
          unsigned int v8 = (const xmlChar *)SVGAtom::ToString(v6);
          xmlTextWriterStartElement(v7, v8);
          CFDataRef v9 = SVGNode::identifier((SVGNode *)v5);
          int v10 = (const xmlChar *)SVGAtom::ToString(0x1Fu);
          xmlTextWriterWriteAttribute(*(xmlTextWriterPtr *)(v4 + 32), v10, (const xmlChar *)v9);
          if (*(_DWORD *)(v5 + 208))
          {
            uint64_t v11 = *(void *)(v5 + 304);
            uint64_t v12 = *(void *)(v5 + 312);
            uint64_t v13 = *(void *)(v5 + 320);
            uint64_t v14 = *(void *)(v5 + 328);
            uint64_t v45 = *(void *)(v5 + 344);
            uint64_t v46 = *(void *)(v5 + 336);
            uint64_t v47 = *(void *)(v5 + 360);
            uint64_t v48 = *(void *)(v5 + 352);
            uint64_t v49 = *(void *)(v5 + 376);
            uint64_t v50 = *(void *)(v5 + 368);
            CGSVGLengthMakeWithType();
            uint64_t v16 = v15;
            int v18 = v17;
            SVGWriter::writeAttribute(v4, 9u, v11, v12, v15, v17);
            SVGWriter::writeAttribute(v4, 0xAu, v13, v14, v16, v18);
            SVGWriter::writeAttribute(v4, 0x1Au, v46, v45, v11, v12);
            SVGWriter::writeAttribute(v4, 0x1Bu, v48, v47, v13, v14);
            SVGWriter::writeAttribute(v4, 0x2Fu, v50, v49, v16, v18);
          }
          else
          {
            uint64_t v19 = *(void *)(v5 + 256);
            uint64_t v20 = *(void *)(v5 + 264);
            uint64_t v21 = *(void *)(v5 + 272);
            uint64_t v22 = *(void *)(v5 + 280);
            uint64_t v23 = *(void *)(v5 + 288);
            uint64_t v24 = *(void *)(v5 + 296);
            SVGWriter::writeAttribute(v4, 0x44u, *(void *)(v5 + 240), *(void *)(v5 + 248), 1);
            SVGWriter::writeAttribute(v4, 0x47u, v19, v20, 1);
            SVGWriter::writeAttribute(v4, 0x45u, v21, v22, 1);
            SVGWriter::writeAttribute(v4, 0x48u, v23, v24, 1);
          }
          uint64_t v25 = (SVGAttribute *)SVGAttributeMap::attribute(*(void *)(v5 + 56), 0x1Cu);
          if (v25)
          {
            uint64_t v26 = SVGAttribute::stringValue(v25);
            if (*(char *)(v26 + 23) >= 0) {
              char v27 = (const xmlChar *)v26;
            }
            else {
              char v27 = *(const xmlChar **)v26;
            }
            long long v28 = (const xmlChar *)SVGAtom::ToString(0x1Cu);
            xmlTextWriterWriteAttribute(*(xmlTextWriterPtr *)(v4 + 32), v28, v27);
          }
          uint64_t v29 = (SVGAttribute *)SVGAttributeMap::attribute(*(void *)(v5 + 56), 0x4Eu);
          if (v29)
          {
            uint64_t v30 = SVGAttribute::stringValue(v29);
            if (*(char *)(v30 + 23) >= 0) {
              long long v31 = (const xmlChar *)v30;
            }
            else {
              long long v31 = *(const xmlChar **)v30;
            }
            long long v32 = (const xmlChar *)SVGAtom::ToString(0x4Eu);
            xmlTextWriterWriteAttribute(*(xmlTextWriterPtr *)(v4 + 32), v32, v31);
          }
          uint64_t v33 = *(uint64_t **)(v5 + 216);
          long long v34 = *(uint64_t **)(v5 + 224);
          while (v33 != v34)
          {
            uint64_t v35 = *v33;
            long long v36 = *(xmlTextWriter **)(v4 + 32);
            long long v37 = (const xmlChar *)SVGAtom::ToString(0x37u);
            xmlTextWriterStartElement(v36, v37);
            SVGWriter::writeAttribute(v4, 0x28u, *(void *)(v35 + 96), *(void *)(v35 + 104), 0);
            SVGColor::SVGColor((uint64_t)v51, v35 + 48);
            SVGColor::GetStringForColor((uint64_t)v51, (uint64_t)__p);
            LODWORD(v36) = v53;
            CGFloat v38 = (void **)__p[0];
            uint64_t v39 = (const xmlChar *)SVGAtom::ToString(0x38u);
            if ((int)v36 >= 0) {
              double v40 = __p;
            }
            else {
              double v40 = v38;
            }
            xmlTextWriterWriteAttribute(*(xmlTextWriterPtr *)(v4 + 32), v39, (const xmlChar *)v40);
            SVGWriter::writeAttribute(v4, 0x53u, *(double *)(v35 + 88));
            xmlTextWriterEndElement(*(xmlTextWriterPtr *)(v4 + 32));
            if (v53 < 0) {
              operator delete(__p[0]);
            }
            ++v33;
          }
          this = xmlTextWriterEndElement(*(xmlTextWriterPtr *)(v4 + 32));
          uint64_t v3 = v44;
        }
      }
      double v41 = (void *)v2[1];
      if (v41)
      {
        do
        {
          uint64_t v42 = v41;
          double v41 = (void *)*v41;
        }
        while (v41);
      }
      else
      {
        do
        {
          uint64_t v42 = (void *)v2[2];
          BOOL v43 = *v42 == (void)v2;
          uint64_t v2 = v42;
        }
        while (!v43);
      }
      uint64_t v2 = v42;
    }
    while (v42 != v3);
  }
  return this;
}

void sub_210A511B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

xmlTextWriterPtr *SVGWriter::writePatterns(xmlTextWriterPtr *this)
{
  xmlTextWriterPtr v1 = this[1];
  uint64_t v2 = (void *)*((void *)v1 + 20);
  uint64_t v3 = (void *)((char *)v1 + 168);
  if (v2 != (void *)((char *)v1 + 168))
  {
    uint64_t v4 = this;
    do
    {
      this = (xmlTextWriterPtr *)v2[7];
      if (this)
      {
        if (this) {
          this = (xmlTextWriterPtr *)SVGWriter::writeNode(v4, this);
        }
      }
      uint64_t v5 = (void *)v2[1];
      if (v5)
      {
        do
        {
          unsigned int v6 = v5;
          uint64_t v5 = (void *)*v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          unsigned int v6 = (void *)v2[2];
          BOOL v7 = *v6 == (void)v2;
          uint64_t v2 = v6;
        }
        while (!v7);
      }
      uint64_t v2 = v6;
    }
    while (v6 != v3);
  }
  return this;
}

void SVGWriter::writeStyle(SVGWriter *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (v1 && *(void *)(v1 + 16))
  {
    uint64_t v3 = (xmlTextWriter *)*((void *)this + 4);
    uint64_t v4 = (const xmlChar *)SVGAtom::ToString(0x3Cu);
    xmlTextWriterStartElement(v3, v4);
    std::map<std::string,SVGAttributeMap *,CaseInsensitiveStringLess,std::allocator<std::pair<std::string const,SVGAttributeMap *>>>::map[abi:ne180100]((uint64_t *)&v29, *((void *)this + 2));
    memset(&v28, 0, sizeof(v28));
    uint64_t v5 = v29;
    if (v29 == v30)
    {
      uint64_t v16 = &v28;
    }
    else
    {
      do
      {
        if (*((char *)v5 + 55) < 0) {
          std::string::__init_copy_ctor_external(&v26, v5[4], (std::string::size_type)v5[5]);
        }
        else {
          std::string v26 = *(std::string *)(v5 + 4);
        }
        uint64_t v6 = (uint64_t)v5[7];
        uint64_t v27 = v6;
        if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(&v25, v26.__r_.__value_.__l.__data_, v26.__r_.__value_.__l.__size_);
          uint64_t v6 = v27;
        }
        else
        {
          std::string v25 = v26;
        }
        uint64_t v18 = 0;
        uint64_t v19 = &v18;
        uint64_t v20 = 0x4002000000;
        uint64_t v21 = __Block_byref_object_copy__3;
        uint64_t v22 = __Block_byref_object_dispose__3;
        BOOL v7 = &v25;
        if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          BOOL v7 = (std::string *)v25.__r_.__value_.__r.__words[0];
        }
        SVGParser::FormatString((SVGParser *)"%s{", &__p, v7);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 0x40000000;
        _OWORD v17[2] = ___ZN9SVGWriter10writeStyleEv_block_invoke;
        v17[3] = &unk_264187918;
        v17[4] = &v18;
        SVGAttributeMap::enumerate(v6, (uint64_t)v17);
        unsigned int v8 = std::string::append((std::string *)(v19 + 5), "}");
        std::string::operator=((std::string *)(v19 + 5), v8);
        int v9 = *((char *)v19 + 63);
        if (v9 >= 0) {
          int v10 = (const std::string::value_type *)(v19 + 5);
        }
        else {
          int v10 = (const std::string::value_type *)v19[5];
        }
        if (v9 >= 0) {
          std::string::size_type v11 = *((unsigned __int8 *)v19 + 63);
        }
        else {
          std::string::size_type v11 = v19[6];
        }
        uint64_t v12 = std::string::append(&v28, v10, v11);
        std::string::operator=(&v28, v12);
        _Block_object_dispose(&v18, 8);
        if (v24 < 0) {
          operator delete(__p);
        }
        if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v25.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v26.__r_.__value_.__l.__data_);
        }
        uint64_t v13 = v5[1];
        if (v13)
        {
          do
          {
            uint64_t v14 = (char **)v13;
            uint64_t v13 = *(char **)v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            uint64_t v14 = (char **)v5[2];
            BOOL v15 = *v14 == (char *)v5;
            uint64_t v5 = v14;
          }
          while (!v15);
        }
        uint64_t v5 = v14;
      }
      while (v14 != v30);
      if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v16 = &v28;
      }
      else {
        uint64_t v16 = (std::string *)v28.__r_.__value_.__r.__words[0];
      }
    }
    xmlTextWriterWriteString(*((xmlTextWriterPtr *)this + 4), (const xmlChar *)v16);
    xmlTextWriterEndElement(*((xmlTextWriterPtr *)this + 4));
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v28.__r_.__value_.__l.__data_);
    }
    std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy((uint64_t)&v29, v30[0]);
  }
}

void sub_210A51590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (*(char *)(v40 - 137) < 0) {
    operator delete(*(void **)(v40 - 160));
  }
  std::__tree<std::__value_type<std::string,SVGAtom::Name>,std::__map_value_compare<std::string,std::__value_type<std::string,SVGAtom::Name>,CaseInsensitiveStringLess,true>,std::allocator<std::__value_type<std::string,SVGAtom::Name>>>::destroy(v40 - 136, *(char **)(v40 - 128));
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

void ___ZN9SVGWriter10writeStyleEv_block_invoke(uint64_t a1, unsigned int a2, SVGAttribute *a3)
{
  uint64_t v5 = SVGAtom::ToString(a2);
  uint64_t v6 = SVGAttribute::stringValue(a3);
  if (*(char *)(v6 + 23) >= 0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = *(void *)v6;
  }
  SVGParser::FormatString((SVGParser *)"%s:%s;", __p, v5, v7);
  if ((v12 & 0x80u) == 0) {
    unsigned int v8 = __p;
  }
  else {
    unsigned int v8 = (void **)__p[0];
  }
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v9 = v12;
  }
  else {
    std::string::size_type v9 = (std::string::size_type)__p[1];
  }
  int v10 = std::string::append((std::string *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), (const std::string::value_type *)v8, v9);
  std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v10);
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_210A516FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

xmlTextWriterPtr *SVGWriter::writeMask(xmlTextWriterPtr *this)
{
  xmlTextWriterPtr v1 = this[1];
  uint64_t v2 = (void *)*((void *)v1 + 20);
  uint64_t v3 = (void *)((char *)v1 + 168);
  if (v2 != (void *)((char *)v1 + 168))
  {
    uint64_t v4 = this;
    do
    {
      this = (xmlTextWriterPtr *)v2[7];
      if (this)
      {
        if (this) {
          this = (xmlTextWriterPtr *)SVGWriter::writeNode(v4, this);
        }
      }
      uint64_t v5 = (void *)v2[1];
      if (v5)
      {
        do
        {
          uint64_t v6 = v5;
          uint64_t v5 = (void *)*v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          uint64_t v6 = (void *)v2[2];
          BOOL v7 = *v6 == (void)v2;
          uint64_t v2 = v6;
        }
        while (!v7);
      }
      uint64_t v2 = v6;
    }
    while (v6 != v3);
  }
  return this;
}

uint64_t CGSVGClipPathGetTypeID()
{
  std::string::basic_string[abi:ne180100]<0>(__p, SVGNode::kSVGNodeClassName);
  uint64_t TypeID = CFRetained::getTypeID((uint64_t)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  return TypeID;
}

void sub_210A5184C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CGSVGClipPathCreate()
{
}

void sub_210A518AC(_Unwind_Exception *a1)
{
  MEMORY[0x216677AD0](v1, 0x10B3C407B03486ALL);
  _Unwind_Resume(a1);
}

CFTypeRef CGSVGClipPathRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

void CGSVGClipPathRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

SVGClipPath *CGSVGClipPathGetCompositePath(uint64_t a1, const char *a2)
{
  __n128 result = (SVGClipPath *)CFRetained::getObject<SVGClipPath>(a1, a2);
  if (result)
  {
    return SVGClipPath::getCGClippingPath(result, 0);
  }
  return result;
}

CGMutablePathRef CGSVGClipPathGetCompositePathRelativeToNode(uint64_t a1, const char *a2)
{
  char v3 = (SVGClipPath *)CFRetained::getObject<SVGClipPath>(a1, a2);
  if (!v3) {
    return 0;
  }
  uint64_t v5 = v3;
  uint64_t v6 = (SVGNode *)CFRetained::getObject<SVGNode>((uint64_t)a2, v4);
  if (!v6) {
    return 0;
  }
  return SVGClipPath::getCGClippingPath(v5, v6);
}

void *CGSVGClipPathGetPath(uint64_t a1, const char *a2)
{
  ChildAtIndedouble x = CGSVGNodeGetChildAtIndex(a1, a2);
  __n128 result = CFRetained::getObject<SVGNode>((uint64_t)ChildAtIndex, v3);
  if (result)
  {
    if (result)
    {
      __n128 result = SVGShapeNode::createSVGPath((SVGShapeNode *)result);
      if (result) {
        return (void *)result[5];
      }
    }
  }
  return result;
}

void SVGPathCommand::appendPoint()
{
  __assert_rtn("appendPoint", "SVGPath.cpp", 109, "_floats != nullptr");
}

void SVGPathCommand::appendPoints()
{
  __assert_rtn("appendPoints", "SVGPath.cpp", 120, "_floats != nullptr");
}

void CGSVGDrawState::CGSVGDrawState()
{
  __assert_rtn("CGSVGDrawState", "CGSVGContext.cpp", 95, "this != &state");
}

void SVGUtilities::CGPointListFromFloats()
{
  __assert_rtn("CGPointListFromFloats", "SVGUtilities.mm", 177, "((count % 2) == 0) && \"Must be multiple of two\"");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x270EE43B0](alloc, str, attributes);
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

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
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

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
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

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x270EE4DC0](stream, buffer, bufferLength);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
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

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x270EE5320](relativeURL);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5368](anURL);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A0](allocator, url);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x270EE5528](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5530](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x270EE5590](stream, buffer, bufferLength);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
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

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x270EE5A20](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x270EE5A28](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5A40](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C90](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x270EE5D58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

uint64_t CGContextCopyTopGState()
{
  return MEMORY[0x270EE5EB0]();
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
}

void CGContextEOClip(CGContextRef c)
{
}

void CGContextEOFillPath(CGContextRef c)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x270EE5FC0](retstr, c);
}

CGRect CGContextGetPathBoundingBox(CGContextRef c)
{
  MEMORY[0x270EE6010](c);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.CGFloat y = v2;
  result.origin.double x = v1;
  return result;
}

uint64_t CGContextGetType()
{
  return MEMORY[0x270EE6038]();
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextReplacePathWithStrokedPath(CGContextRef c)
{
}

uint64_t CGContextReplaceTopGState()
{
  return MEMORY[0x270EE6068]();
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x270EE60E8]();
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetFillPattern(CGContextRef c, CGPatternRef pattern, const CGFloat *components)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGGStateRelease()
{
  return MEMORY[0x270EE6638]();
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6740](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x270EE6840](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x270EE6888](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

uint64_t CGImageWriteToFile()
{
  return MEMORY[0x270EE6958]();
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

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddRelativeArc(CGMutablePathRef path, const CGAffineTransform *matrix, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat delta)
{
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE6FD8](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x270EE7038](path);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7060](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.CGFloat y = v2;
  result.origin.double x = v1;
  return result;
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  MEMORY[0x270EE7078](path);
  result.CGFloat y = v2;
  result.double x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x270EE7110](info, matrix, *(void *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.CGFloat y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x270EE9AD0](font, glyph, matrix);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AE0](descriptor, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x270EE9B60](attributes);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x270EE9C40](font);
  return result;
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x270EE9D70](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x270EE9DC0](line);
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  MEMORY[0x270EE9DC8](line, context);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x270EE9E68](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

const CGGlyph *__cdecl CTRunGetGlyphsPtr(CTRunRef run)
{
  return (const CGGlyph *)MEMORY[0x270EE9E78](run);
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

const CGPoint *__cdecl CTRunGetPositionsPtr(CTRunRef run)
{
  return (const CGPoint *)MEMORY[0x270EE9E90](run);
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

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x270F98248](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string::reference std::string::at(std::string *this, std::string::size_type __n)
{
  return (std::string::reference)MEMORY[0x270F98478](this, __n);
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

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98500](this, __pos, __n1, __s);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void __cxa_bad_typeid(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__double cosval = v2;
  result.__double sinval = v1;
  return result;
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

locale_t newlocale(int a1, const char *a2, locale_t a3)
{
  return (locale_t)MEMORY[0x270EDA708](*(void *)&a1, a2, a3);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

double strtod_l(const char *a1, char **a2, locale_t a3)
{
  MEMORY[0x270EDB6B0](a1, a2, a3);
  return result;
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

vImage_Error vImageBufferFill_ARGB8888(const vImage_Buffer *dest, const Pixel_8888 color, vImage_Flags flags)
{
  return MEMORY[0x270EDEF10](dest, color, *(void *)&flags);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x270EDEF18](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x270EDEF28](buf, format, backgroundColor, image, *(void *)&flags);
}

vImage_Error vImageConvolveWithBias_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const int16_t *kernel, uint32_t kernel_height, uint32_t kernel_width, int32_t divisor, int32_t bias, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF180](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(void *)&kernel_height, *(void *)&kernel_width);
}

CGImageRef vImageCreateCGImageFromBuffer(const vImage_Buffer *buf, const vImage_CGImageFormat *format, void (__cdecl *callback)(void *, void *), void *userData, vImage_Flags flags, vImage_Error *error)
{
  return (CGImageRef)MEMORY[0x270EDF1B0](buf, format, callback, userData, *(void *)&flags, error);
}

int vprintf(const char *a1, va_list a2)
{
  return MEMORY[0x270EDBB00](a1, a2);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x270F9BB48]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x270F9BC50](doc);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeTextWriter(xmlTextWriterPtr writer)
{
}

xmlTextWriterPtr xmlNewTextWriterMemory(xmlBufferPtr buf, int compression)
{
  return (xmlTextWriterPtr)MEMORY[0x270F9BEF0](buf, *(void *)&compression);
}

xmlChar *__cdecl xmlNodeGetContent(const xmlNode *cur)
{
  return (xmlChar *)MEMORY[0x270F9BF30](cur);
}

int xmlNodeIsText(const xmlNode *node)
{
  return MEMORY[0x270F9BF40](node);
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x270F9BFE0](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

int xmlTextWriterEndDTD(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C228](writer);
}

int xmlTextWriterEndDocument(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C230](writer);
}

int xmlTextWriterEndElement(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C238](writer);
}

int xmlTextWriterSetIndent(xmlTextWriterPtr writer, int indent)
{
  return MEMORY[0x270F9C258](writer, *(void *)&indent);
}

int xmlTextWriterSetIndentString(xmlTextWriterPtr writer, const xmlChar *str)
{
  return MEMORY[0x270F9C260](writer, str);
}

int xmlTextWriterStartDTD(xmlTextWriterPtr writer, const xmlChar *name, const xmlChar *pubid, const xmlChar *sysid)
{
  return MEMORY[0x270F9C278](writer, name, pubid, sysid);
}

int xmlTextWriterStartDocument(xmlTextWriterPtr writer, const char *version, const char *encoding, const char *standalone)
{
  return MEMORY[0x270F9C280](writer, version, encoding, standalone);
}

int xmlTextWriterStartElement(xmlTextWriterPtr writer, const xmlChar *name)
{
  return MEMORY[0x270F9C288](writer, name);
}

int xmlTextWriterWriteAttribute(xmlTextWriterPtr writer, const xmlChar *name, const xmlChar *content)
{
  return MEMORY[0x270F9C2A0](writer, name, content);
}

int xmlTextWriterWriteComment(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x270F9C2C0](writer, content);
}

int xmlTextWriterWriteString(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x270F9C2E0](writer, content);
}