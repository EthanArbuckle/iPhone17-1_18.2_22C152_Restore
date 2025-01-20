@interface DEMorphun
- (BOOL)downloadData:(id)a3;
- (id)getAllPaths;
- (id)getPath:(id)a3;
@end

@implementation DEMorphun

- (id)getAllPaths
{
  v16[2] = &unk_1F211B980;
  siri::dialogengine::MorphunUpdaterCatutil::GetPaths((uint64_t)&v15);
  v2 = objc_opt_new();
  v3 = v15;
  if (v15 != (long long *)v16)
  {
    do
    {
      std::pair<std::string const,std::string>::pair[abi:ne180100](&v12, v3 + 2);
      if (v14 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      v5 = [NSString stringWithUTF8String:p_p];
      if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v6 = &v12;
      }
      else {
        v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
      }
      v7 = [NSString stringWithUTF8String:v6];
      [v2 setValue:v5 forKey:v7];

      if (v14 < 0) {
        operator delete(__p);
      }
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v12.__r_.__value_.__l.__data_);
      }
      v8 = (long long *)*((void *)v3 + 1);
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = *(long long **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (long long *)*((void *)v3 + 2);
          BOOL v10 = *(void *)v9 == (void)v3;
          v3 = v9;
        }
        while (!v10);
      }
      v3 = v9;
    }
    while (v9 != (long long *)v16);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v16[0]);
  return v2;
}

- (id)getPath:(id)a3
{
  v11 = &unk_1F211B980;
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(&v7, (char *)[v3 UTF8String]);
  siri::dialogengine::GetLocaleLanguage(&__p);
  siri::dialogengine::MorphunUpdaterCatutil::GetPath((uint64_t)&__p, &v10);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v4 = &v10;
  }
  else {
    v4 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  v5 = [NSString stringWithUTF8String:v4];
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }

  return v5;
}

- (BOOL)downloadData:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(&v50, 0, sizeof(v50));
  memset(&v49, 0, sizeof(v49));
  v41 = self;
  v5 = [(DEMorphun *)self getAllPaths];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(v6);
        }
        std::string v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v11 = [v5 objectForKey:v10];
        BOOL v12 = v11 == 0;

        if (v12)
        {
          std::string::basic_string[abi:ne180100]<0>(v42, (char *)[v10 UTF8String]);
          siri::dialogengine::GetLocaleLanguage(&__p);
          std::vector<std::string>::pointer end = v50.__end_;
          if (v50.__end_ >= v50.__end_cap_.__value_)
          {
            unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v50.__end_ - (char *)v50.__begin_) >> 3);
            unint64_t v16 = v15 + 1;
            if (v15 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<BOOL>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * (((char *)v50.__end_cap_.__value_ - (char *)v50.__begin_) >> 3) > v16) {
              unint64_t v16 = 0x5555555555555556 * (((char *)v50.__end_cap_.__value_ - (char *)v50.__begin_) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v50.__end_cap_.__value_ - (char *)v50.__begin_) >> 3) >= 0x555555555555555) {
              unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v17 = v16;
            }
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v50.__end_cap_;
            if (v17) {
              v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v50.__end_cap_, v17);
            }
            else {
              v18 = 0;
            }
            v19 = v18 + v15;
            __v.__first_ = v18;
            __v.__begin_ = v19;
            __v.__end_cap_.__value_ = &v18[v17];
            long long v20 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v19->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
            *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
            memset(&__p, 0, sizeof(__p));
            __v.__end_ = v19 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v50, &__v);
            v21 = v50.__end_;
            std::__split_buffer<std::string>::~__split_buffer(&__v);
            v50.__end_ = v21;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            long long v14 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v50.__end_->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v14;
            memset(&__p, 0, sizeof(__p));
            v50.__end_ = end + 1;
          }
          if (SHIBYTE(v43) < 0) {
            operator delete(v42[0]);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v7);
  }

  siri::dialogengine::MorphunUpdaterCatutil::Download(v22, (uint64_t *)&v50);
  std::vector<std::string>::pointer begin = v50.__begin_;
  std::vector<std::string>::pointer v23 = v50.__end_;
  if (v50.__begin_ == v50.__end_)
  {
    std::vector<std::string>::pointer v38 = v50.__begin_;
  }
  else
  {
    do
    {
      if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, begin->__r_.__value_.__l.__data_, begin->__r_.__value_.__l.__size_);
      }
      else
      {
        long long v25 = *(_OWORD *)&begin->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = begin->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v25;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v27 = [NSString stringWithUTF8String:p_p];
      v28 = [(DEMorphun *)v41 getPath:v27];

      if ([v28 length])
      {
        std::string::basic_string[abi:ne180100]<0>(v42, (char *)[v28 UTF8String]);
        std::vector<std::string>::pointer v29 = v49.__end_;
        if (v49.__end_ >= v49.__end_cap_.__value_)
        {
          unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * (((char *)v49.__end_ - (char *)v49.__begin_) >> 3);
          unint64_t v32 = v31 + 1;
          if (v31 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<BOOL>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v49.__end_cap_.__value_ - (char *)v49.__begin_) >> 3) > v32) {
            unint64_t v32 = 0x5555555555555556 * (((char *)v49.__end_cap_.__value_ - (char *)v49.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v49.__end_cap_.__value_ - (char *)v49.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v33 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v33 = v32;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v49.__end_cap_;
          if (v33) {
            v34 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v49.__end_cap_, v33);
          }
          else {
            v34 = 0;
          }
          v35 = v34 + v31;
          __v.__first_ = v34;
          __v.__begin_ = v35;
          __v.__end_cap_.__value_ = &v34[v33];
          long long v36 = *(_OWORD *)v42;
          v35->__r_.__value_.__r.__words[2] = v43;
          *(_OWORD *)&v35->__r_.__value_.__l.__data_ = v36;
          v42[1] = 0;
          std::string::size_type v43 = 0;
          v42[0] = 0;
          __v.__end_ = v35 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v49, &__v);
          v37 = v49.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v49.__end_ = v37;
          if (SHIBYTE(v43) < 0) {
            operator delete(v42[0]);
          }
        }
        else
        {
          long long v30 = *(_OWORD *)v42;
          v49.__end_->__r_.__value_.__r.__words[2] = v43;
          *(_OWORD *)&v29->__r_.__value_.__l.__data_ = v30;
          v49.__end_ = v29 + 1;
        }
      }

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      ++begin;
    }
    while (begin != v23);
    std::vector<std::string>::pointer begin = v50.__begin_;
    std::vector<std::string>::pointer v38 = v50.__end_;
  }
  BOOL v39 = (char *)v38 - (char *)begin == (char *)v49.__end_ - (char *)v49.__begin_;

  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v49;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v50;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);

  return v39;
}

@end