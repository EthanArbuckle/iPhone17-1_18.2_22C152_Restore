@interface DEDialogStateUseCase
- (BOOL)hasAllRandomId:(id)a3;
- (double)lastTimestamp;
- (id)allGroundings;
- (id)allRandomIds;
- (id)groundingUsage:(id)a3;
- (id)lastRandomIds;
- (int)usageCount;
@end

@implementation DEDialogStateUseCase

- (id)allGroundings
{
  [(DEDialogState *)self getUseCase];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  std::map<std::string,siri::dialogengine::GroundingInfo>::map[abi:ne180100]((uint64_t)&v24, v28);
  v3 = v24;
  if (v24 != v25)
  {
    do
    {
      v4 = v3[8];
      v19 = v3[7];
      v21 = 0;
      uint64_t v22 = 0;
      v20 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v20, v4, (uint64_t)v3[9], v3[9] - v4);
      if (*((char *)v3 + 111) < 0) {
        std::string::__init_copy_ctor_external(&v23, (const std::string::value_type *)v3[11], (std::string::size_type)v3[12]);
      }
      else {
        std::string v23 = *(std::string *)(v3 + 11);
      }
      memset(v18, 0, sizeof(v18));
      v5 = v19;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v18, v20, (uint64_t)v21, (v21 - (unsigned char *)v20) >> 3);
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v23;
      }
      v7 = [DEGroundingInfo alloc];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v9 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      id v10 = [(DEGroundingInfo *)v7 init:v5 timeStamps:v6 text:v9];
      v11 = v3 + 4;

      if (*((char *)v3 + 55) < 0) {
        v11 = (void *)*v11;
      }
      v12 = [NSString stringWithUTF8String:v11];
      [v2 setObject:v10 forKey:v12];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }

      if (v18[0]) {
        operator delete(v18[0]);
      }
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v23.__r_.__value_.__l.__data_);
      }
      if (v20)
      {
        v21 = v20;
        operator delete(v20);
      }
      v13 = v3[1];
      if (v13)
      {
        do
        {
          v14 = (void **)v13;
          v13 = (void *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (void **)v3[2];
          BOOL v15 = *v14 == v3;
          v3 = v14;
        }
        while (!v15);
      }
      v3 = v14;
    }
    while (v14 != v25);
  }
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy(v25[0]);
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy(v28[1]);
  std::__tree<std::string>::destroy((uint64_t)v27, v27[1]);
  std::__tree<std::string>::destroy((uint64_t)v26, v26[1]);
  return v2;
}

- (id)groundingUsage:(id)a3
{
  id v4 = a3;
  [(DEDialogState *)self getUseCase];
  id v5 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v5 UTF8String]);
  siri::dialogengine::DialogStateUseCase::GetGroundingUsage((uint64_t)v25, (const void **)&__p, (uint64_t)&v21);
  if (SHIBYTE(v20) < 0) {
    operator delete(__p);
  }
  std::string __p = 0;
  v19 = 0;
  uint64_t v20 = 0;
  uint64_t v6 = v21;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, v22, (uint64_t)v23, (v23 - (unsigned char *)v22) >> 3);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = __p;
  v9 = v19;
  if (__p != v19)
  {
    id v10 = (double *)__p;
    do
    {
      v11 = [NSNumber numberWithDouble:*v10];
      [v7 addObject:v11];

      ++v10;
    }
    while (v10 != v9);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v17, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  }
  else {
    std::string v17 = v24;
  }
  v12 = [DEGroundingInfo alloc];
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v13 = &v17;
  }
  else {
    v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  v14 = objc_msgSend(NSString, "stringWithUTF8String:", v13, *(_OWORD *)&v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__r.__words[2]);
  id v15 = [(DEGroundingInfo *)v12 init:v6 timeStamps:v7 text:v14];

  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }

  if (v8) {
    operator delete(v8);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (v22)
  {
    std::string v23 = v22;
    operator delete(v22);
  }
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy((void *)v27[4]);
  std::__tree<std::string>::destroy((uint64_t)v27, v27[1]);
  std::__tree<std::string>::destroy((uint64_t)v26, v26[1]);

  return v15;
}

- (id)lastRandomIds
{
  [(DEDialogState *)self getUseCase];
  std::set<std::string>::set[abi:ne180100]((uint64_t *)&v10, v12);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = v10;
  if (v10 != v11)
  {
    do
    {
      id v4 = v3 + 4;
      if (*((char *)v3 + 55) < 0) {
        id v4 = (void *)*v4;
      }
      id v5 = [NSString stringWithUTF8String:v4];
      [v2 addObject:v5];

      uint64_t v6 = v3[1];
      if (v6)
      {
        do
        {
          id v7 = (char **)v6;
          uint64_t v6 = *(char **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          id v7 = (char **)v3[2];
          BOOL v8 = *v7 == (char *)v3;
          v3 = v7;
        }
        while (!v8);
      }
      v3 = v7;
    }
    while (v7 != v11);
  }
  std::__tree<std::string>::destroy((uint64_t)&v10, v11[0]);
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy((void *)v13[4]);
  std::__tree<std::string>::destroy((uint64_t)v13, v13[1]);
  std::__tree<std::string>::destroy((uint64_t)v12, (char *)v12[1]);
  return v2;
}

- (BOOL)hasAllRandomId:(id)a3
{
  id v4 = a3;
  [(DEDialogState *)self getUseCase];
  id v5 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  uint64_t v6 = (char **)std::__tree<std::string>::find<std::string>((uint64_t)&v11, (const void **)__p);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy((void *)v12[3]);
  std::__tree<std::string>::destroy((uint64_t)&v11, v12[0]);
  std::__tree<std::string>::destroy((uint64_t)v10, v10[1]);

  return v12 != v6;
}

- (id)allRandomIds
{
  [(DEDialogState *)self getUseCase];
  std::set<std::string>::set[abi:ne180100]((uint64_t *)&v10, v13);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = v10;
  if (v10 != v11)
  {
    do
    {
      id v4 = v3 + 4;
      if (*((char *)v3 + 55) < 0) {
        id v4 = (void *)*v4;
      }
      id v5 = [NSString stringWithUTF8String:v4];
      [v2 addObject:v5];

      uint64_t v6 = v3[1];
      if (v6)
      {
        do
        {
          id v7 = (char **)v6;
          uint64_t v6 = *(char **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          id v7 = (char **)v3[2];
          BOOL v8 = *v7 == (char *)v3;
          v3 = v7;
        }
        while (!v8);
      }
      v3 = v7;
    }
    while (v7 != v11);
  }
  std::__tree<std::string>::destroy((uint64_t)&v10, v11[0]);
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy(v13[4]);
  std::__tree<std::string>::destroy((uint64_t)v13, (char *)v13[1]);
  std::__tree<std::string>::destroy((uint64_t)v12, v12[1]);
  return v2;
}

- (double)lastTimestamp
{
  [(DEDialogState *)self getUseCase];
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy((void *)v5[4]);
  std::__tree<std::string>::destroy((uint64_t)v5, v5[1]);
  std::__tree<std::string>::destroy((uint64_t)v4, v4[1]);
  return v3;
}

- (int)usageCount
{
  [(DEDialogState *)self getUseCase];
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy((void *)v5[4]);
  std::__tree<std::string>::destroy((uint64_t)v5, v5[1]);
  std::__tree<std::string>::destroy((uint64_t)v4, v4[1]);
  return v3;
}

@end