@interface DEMetadata
+ (id)schemaInput:(id)a3 typeName:(id)a4 inputName:(id)a5;
- (DEMetadata)init;
- (DEMetadata)initWithOpt:(const void *)a3;
- (id).cxx_construct;
- (id)sampleValues:(id)a3;
- (id)sampleValues:(id)a3 locale:(id)a4;
- (optional<siri::dialogengine::ObjectInput>)Obj;
- (void)setObj:(optional<siri::dialogengine::ObjectInput> *)a3;
@end

@implementation DEMetadata

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 168) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (self[2]._Obj.var0.var1.mName.__r_.__value_.var0.var0.__data_[8]) {
    siri::dialogengine::PropertyBase::~PropertyBase((void **)&self->_Obj);
  }
}

- (void)setObj:(optional<siri::dialogengine::ObjectInput> *)a3
{
}

- (optional<siri::dialogengine::ObjectInput>)Obj
{
  objc_copyCppObjectAtomic(retstr, (const void *)(v1 + 8), (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__24063);
  return result;
}

- (id)sampleValues:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  if ([v6 This]
    && ([v7 isEqualToString:&stru_1F2127290] & 1) != 0
    && ([(DEMetadata *)self Obj], v22))
  {
    siri::dialogengine::PropertyBase::GetSampleValueAsArray((siri::dialogengine::PropertyBase *)v21, &v19);
    uint64_t v9 = v19;
    for (uint64_t i = v20; v9 != i; v9 += 24)
    {
      if (*(char *)(v9 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v9, *(void *)(v9 + 8));
      }
      else
      {
        long long v11 = *(_OWORD *)v9;
        __p.__r_.__value_.__r.__words[2] = *(void *)(v9 + 16);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v11;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v13 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      [v8 addObject:v13];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v19;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    int v14 = v22;
    id v15 = v8;
    if (v14) {
      siri::dialogengine::PropertyBase::~PropertyBase(v21);
    }
  }
  else
  {
    id v16 = v8;
  }

  return v8;
}

- (id)sampleValues:(id)a3
{
  v3 = [(DEMetadata *)self sampleValues:a3 locale:&stru_1F2127290];
  return v3;
}

- (DEMetadata)initWithOpt:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DEMetadata;
  v4 = [(DEMetadata *)&v8 init];
  if (v4)
  {
    std::__optional_copy_base<siri::dialogengine::ObjectInput,false>::__optional_copy_base[abi:ne180100]((siri::dialogengine::PropertyBase *)v6, (uint64_t)a3);
    [(DEMetadata *)v4 setObj:v6];
    if (v7) {
      siri::dialogengine::PropertyBase::~PropertyBase(v6);
    }
  }
  return v4;
}

- (DEMetadata)init
{
  v7.receiver = self;
  v7.super_class = (Class)DEMetadata;
  v2 = [(DEMetadata *)&v7 init];
  v3 = v2;
  if (v2)
  {
    LOBYTE(v5[0]) = 0;
    char v6 = 0;
    [(DEMetadata *)v2 setObj:v5];
    if (v6) {
      siri::dialogengine::PropertyBase::~PropertyBase(v5);
    }
  }
  return v3;
}

+ (id)schemaInput:(id)a3 typeName:(id)a4 inputName:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (const char *)[a3 This];
  LOBYTE(v30) = 0;
  char v40 = 0;
  id v10 = v7;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v10 UTF8String]);
  siri::dialogengine::ObjectRegistry::GetObject((uint64_t)v9, (const std::string::value_type **)&__p, &v28);
  if (v18.__r_.__value_.__s.__data_[15] < 0) {
    operator delete(__p);
  }
  uint64_t v11 = v28;
  if (v28)
  {
    std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v8 UTF8String]);
    siri::dialogengine::ObjectSchema::GetInput(v11, v9, (const void **)v15, 0, (uint64_t)&__p);
    int v12 = v27;
    if (v40 == v27)
    {
      if (!v40)
      {
LABEL_11:
        if (v12) {
          siri::dialogengine::PropertyBase::~PropertyBase(&__p);
        }
        if (v16 < 0) {
          operator delete(v15[0]);
        }
        goto LABEL_15;
      }
      std::string::operator=(&v31, &v18);
      std::string::operator=(&v32, &v19);
      std::string::operator=(&v33, &v20);
      std::string::operator=(&v34, &v21);
      std::string::operator=(&v35, &v22);
      std::string::operator=(&v36, &v23);
      __int16 v37 = v24;
      char v38 = v25;
      int v39 = v26;
    }
    else if (v40)
    {
      siri::dialogengine::PropertyBase::~PropertyBase(&v30);
      char v40 = 0;
    }
    else
    {
      siri::dialogengine::PropertyBase::PropertyBase((siri::dialogengine::PropertyBase *)&v30, (const siri::dialogengine::PropertyBase *)&__p);
      v30 = &unk_1F21270B8;
      int v39 = v26;
      char v40 = 1;
    }
    int v12 = v27;
    goto LABEL_11;
  }
LABEL_15:
  v13 = [[DEMetadata alloc] initWithOpt:&v30];
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  if (v40) {
    siri::dialogengine::PropertyBase::~PropertyBase(&v30);
  }

  return v13;
}

@end