@interface _EARLmInterpolator
+ (id)interpolateArpaFilePaths:(id)a3 configPath:(id)a4 dataRoot:(id)a5 modelRoot:(id)a6;
@end

@implementation _EARLmInterpolator

+ (id)interpolateArpaFilePaths:(id)a3 configPath:(id)a4 dataRoot:(id)a5 modelRoot:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v9 = a4;
  id v28 = a5;
  id v30 = a6;
  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    *(void *)&long long v36 = 0;
  }
  memset(&__v, 0, 24);
  *(_OWORD *)buf = 0u;
  long long v42 = 0u;
  int v43 = 1065353216;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v40, (uint64_t)__p, (uint64_t *)&__v, (uint64_t)buf);
  v10 = (void ***)std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
  *(void *)buf = &__v;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v10);
  if (SBYTE7(v36) < 0) {
    operator delete(__p[0]);
  }
  if (v30)
  {
    objc_msgSend(v30, "ear_toString");
  }
  else
  {
    memset(buf, 0, sizeof(buf));
    *(void *)&long long v42 = 0;
  }
  std::allocate_shared[abi:ne180100]<quasar::NgramSrilmInterpolationConfig,std::allocator<quasar::NgramSrilmInterpolationConfig>,quasar::SystemConfig &,std::string,void>((uint64_t)v40, (uint64_t)buf, &v32);
  if (SBYTE7(v42) < 0) {
    operator delete(*(void **)buf);
  }
  id v11 = v29;
  memset(&v31, 0, sizeof(v31));
  *(_OWORD *)__p = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:__p objects:buf count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *((id *)__p[1] + i);
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "ear_toString");
        }
        else
        {
          v33[0] = 0;
          v33[1] = 0;
          std::string::size_type v34 = 0;
        }

        std::vector<std::string>::pointer end = v31.__end_;
        if (v31.__end_ >= v31.__end_cap_.__value_)
        {
          unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)v31.__end_ - (char *)v31.__begin_) >> 3);
          unint64_t v21 = v20 + 1;
          if (v20 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v31.__end_cap_.__value_ - (char *)v31.__begin_) >> 3) > v21) {
            unint64_t v21 = 0x5555555555555556 * (((char *)v31.__end_cap_.__value_ - (char *)v31.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v31.__end_cap_.__value_ - (char *)v31.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v22 = v21;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v31.__end_cap_;
          if (v22) {
            v23 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v31.__end_cap_, v22);
          }
          else {
            v23 = 0;
          }
          v24 = v23 + v20;
          __v.__first_ = v23;
          __v.__begin_ = v24;
          __v.__end_cap_.__value_ = &v23[v22];
          long long v25 = *(_OWORD *)v33;
          v24->__r_.__value_.__r.__words[2] = v34;
          *(_OWORD *)&v24->__r_.__value_.__l.__data_ = v25;
          v33[1] = 0;
          std::string::size_type v34 = 0;
          v33[0] = 0;
          __v.__end_ = v24 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v31, &__v);
          v26 = v31.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v31.__end_ = v26;
          if (SHIBYTE(v34) < 0) {
            operator delete(v33[0]);
          }
        }
        else
        {
          long long v19 = *(_OWORD *)v33;
          v31.__end_->__r_.__value_.__r.__words[2] = v34;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v19;
          v31.__end_ = end + 1;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:__p objects:buf count:16];
    }
    while (v13);
  }

  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
  }
  else
  {
    memset(buf, 0, sizeof(buf));
    *(void *)&long long v42 = 0;
  }
  if (v28)
  {
    objc_msgSend(v28, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    *(void *)&long long v36 = 0;
  }
  quasar::interpolateNgramSrilmArpaFiles((uint64_t)&v32, (uint64_t)buf);
}

@end