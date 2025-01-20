@interface DEGrammarFeature
+ (id)features:(id)a3;
- (BOOL)isUniqueValues;
- (DEGrammarFeature)init;
- (GrammarFeature)Obj;
- (NSString)name;
- (id).cxx_construct;
- (id)values;
- (unint64_t)type;
- (void)setObj:(GrammarFeature *)a3;
@end

@implementation DEGrammarFeature

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_OWORD *)self + 1) = 0uLL;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = (char *)self + 48;
  *((unsigned char *)self + 64) = 1;
  return self;
}

- (void).cxx_destruct
{
  std::__tree<std::string>::destroy((uint64_t)&self->_Obj.mName.__r_.var0, (char *)self->_Obj.mName.var0);
  if (*((char *)&self->_Obj.mName.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self->_Obj.mName.__r_.__value_.var0.var1.__data_;
    operator delete(data);
  }
}

- (void)setObj:(GrammarFeature *)a3
{
}

- (GrammarFeature)Obj
{
  objc_copyCppObjectAtomic(retstr, (const void *)(v1 + 8), (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__518);
  return result;
}

- (id)values
{
  v3 = objc_opt_new();
  [(DEGrammarFeature *)self Obj];
  std::set<std::string>::set[abi:ne180100]((uint64_t *)&v14, v13);
  std::__tree<std::string>::destroy((uint64_t)v13, (char *)v13[1]);
  if (v12 < 0) {
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  }
  v4 = v14;
  if (v14 != v15)
  {
    do
    {
      if (*((char *)v4 + 55) < 0) {
        std::string::__init_copy_ctor_external(&__p, v4[4], (std::string::size_type)v4[5]);
      }
      else {
        std::string __p = *(std::string *)(v4 + 4);
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v6 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      [v3 addObject:v6];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      v7 = v4[1];
      if (v7)
      {
        do
        {
          v8 = (char **)v7;
          v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (char **)v4[2];
          BOOL v9 = *v8 == (char *)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != v15);
  }
  std::__tree<std::string>::destroy((uint64_t)&v14, v15[0]);
  return v3;
}

- (BOOL)isUniqueValues
{
  [(DEGrammarFeature *)self Obj];
  int v2 = v7;
  std::__tree<std::string>::destroy((uint64_t)v6, v6[1]);
  if (v5 < 0) {
    operator delete(__p);
  }
  return v2 != 0;
}

- (unint64_t)type
{
  [(DEGrammarFeature *)self Obj];
  int v2 = v5;
  std::__tree<std::string>::destroy((uint64_t)v8, v8[1]);
  if (v7 < 0) {
    operator delete(__p);
  }
  unint64_t v3 = 1;
  if (v2 == 1) {
    unint64_t v3 = 2;
  }
  if (v2 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

- (NSString)name
{
  int v2 = NSString;
  [(DEGrammarFeature *)self Obj];
  if ((__p[23] & 0x80000000) != 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)__p, *(std::string::size_type *)&__p[8]);
  }
  else {
    std::string v8 = *(std::string *)__p;
  }
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unint64_t v3 = &v8;
  }
  else {
    unint64_t v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  std::__tree<std::string>::destroy((uint64_t)v7, v7[1]);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  return (NSString *)v4;
}

- (DEGrammarFeature)init
{
  v9.receiver = self;
  v9.super_class = (Class)DEGrammarFeature;
  int v2 = [(DEGrammarFeature *)&v9 init];
  unint64_t v3 = v2;
  if (v2)
  {
    long long v8 = 0u;
    *(_OWORD *)std::string __p = 0u;
    long long v6 = 0u;
    long long v7 = (unint64_t)&v7 + 8;
    BYTE8(v8) = 1;
    [(DEGrammarFeature *)v2 setObj:__p];
    std::__tree<std::string>::destroy((uint64_t)&v7, *((char **)&v7 + 1));
    if (SHIBYTE(v6) < 0) {
      operator delete(__p[1]);
    }
  }
  return v3;
}

+ (id)features:(id)a3
{
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v3 UTF8String]);
  Features = siri::dialogengine::GrammarFeature::GetFeatures((uint64_t)__p);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  int v5 = objc_opt_new();
  if (Features)
  {
    uint64_t v6 = *Features;
    uint64_t v7 = Features[1];
    if (*Features != v7)
    {
      uint64_t v8 = v6 + 32;
      objc_super v9 = (void *)(v6 + 40);
      do
      {
        uint64_t v10 = objc_opt_new();
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(v8 - 32);
        std::string::operator=((std::string *)(v10 + 16), (const std::string *)(v8 - 24));
        uint64_t v11 = v8 - 32;
        if (v10 + 8 != v8 - 32) {
          std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>((uint64_t *)(v10 + 40), *(void **)v8, v9);
        }
        *(unsigned char *)(v10 + 64) = *(unsigned char *)(v8 + 24);
        [v5 addObject:v10];

        v8 += 64;
        v9 += 8;
      }
      while (v11 + 64 != v7);
    }
  }

  return v5;
}

@end