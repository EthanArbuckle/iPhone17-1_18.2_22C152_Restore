@interface _EARTransformUtil
+ (id)hatToQsrString:(id)a3;
+ (id)hatToQsrStrings:(id)a3;
@end

@implementation _EARTransformUtil

+ (id)hatToQsrString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v3 = (id)objc_msgSend(v3, "ear_toString");
  }
  else
  {
    v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  __p = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v5 = quasar::QsrText::SingletonInstance((quasar::QsrText *)v3);
  if (quasar::QsrText::hatToQsrToken(v5, (uint64_t)&v12, (uint64_t)&__p))
  {
    if (v11 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    v7 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, __p, v10, v11, v12, v13, v14);
  }
  else
  {
    v7 = 0;
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v14) < 0) {
    operator delete(v12);
  }

  return v7;
}

+ (id)hatToQsrStrings:(id)a3
{
  v30[16] = *(void ***)MEMORY[0x1E4F143B8];
  memset(&v22, 0, sizeof(v22));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          std::string::size_type v24 = 0;
        }

        std::vector<std::string>::pointer end = v22.__end_;
        if (v22.__end_ >= v22.__end_cap_.__value_)
        {
          unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v22.__end_ - (char *)v22.__begin_) >> 3);
          unint64_t v12 = v11 + 1;
          if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
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
            uint64_t v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v22.__end_cap_, v13);
          }
          else {
            uint64_t v14 = 0;
          }
          v15 = v14 + v11;
          __v.__first_ = v14;
          __v.__begin_ = v15;
          __v.__end_cap_.__value_ = &v14[v13];
          long long v16 = *(_OWORD *)__p;
          v15->__r_.__value_.__r.__words[2] = v24;
          *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
          __p[1] = 0;
          std::string::size_type v24 = 0;
          __p[0] = 0;
          __v.__end_ = v15 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v22, &__v);
          v17 = v22.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v22.__end_ = v17;
          if (SHIBYTE(v24) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v10 = *(_OWORD *)__p;
          v22.__end_->__r_.__value_.__r.__words[2] = v24;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
          v22.__end_ = end + 1;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v4);
  }

  memset(v30, 0, 24);
  uint64_t v19 = quasar::QsrText::SingletonInstance(v18);
  if (quasar::QsrText::hatToQsrTokens(v19, (uint64_t *)&v22, (uint64_t *)v30, 0)) {
    EARHelpers::VectorToArray<std::string>((long long **)v30);
  }
  else {
  v20 = [MEMORY[0x1E4F1C978] array];
  }
  *(void *)&long long v25 = v30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);
  v30[0] = (void **)&v22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v30);

  return v20;
}

@end