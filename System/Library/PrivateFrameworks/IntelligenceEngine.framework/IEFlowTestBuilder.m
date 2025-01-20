@interface IEFlowTestBuilder
- (BOOL)addToTestFile:(id)a3 flowId:(id)a4 testName:(id)a5 description:(id)a6;
- (BOOL)addToTestFile:(id)a3 testName:(id)a4 description:(id)a5;
- (TestCaseBuilder)mBuilder;
- (id).cxx_construct;
- (int)count;
- (void)assertResponseAllIds:(id)a3;
- (void)assertResponseAnyId:(id)a3;
- (void)clear;
- (void)gotoResponse:(id)a3;
- (void)sendEvent:(id)a3;
- (void)setMBuilder:(TestCaseBuilder)a3;
- (void)setVariable:(id)a3 value:(id)a4;
- (void)switchActivity:(id)a3;
@end

@implementation IEFlowTestBuilder

- (void)clear
{
}

- (void)sendEvent:(id)a3
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v3 = [v6 eventId];
    if (v3)
    {
      id v4 = [v7 eventId];
      v8 = (char *)[v4 UTF8String];
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
      v8 = "";
    }
  }
  else
  {
    int v9 = 0;
    v8 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(v21, v8);
  if (v9) {

  }
  if (v7)
  {

    v3 = [v7 name];
    if (v3)
    {
      id v4 = [v7 name];
      v10 = (char *)[v4 UTF8String];
      int v11 = 1;
    }
    else
    {
      int v11 = 0;
      v10 = "";
    }
  }
  else
  {
    int v11 = 0;
    v10 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, v10);
  if (v11) {

  }
  if (!v7)
  {
    lpsrc = 0;
    v19 = 0;
    p_mBuilder = (uint64_t *)&self->_mBuilder;
LABEL_24:
    v16 = 0;
    v17 = 0;
    goto LABEL_25;
  }

  v12 = [v7 slots];
  if (v12)
  {
    v13 = [v7 slots];
    IE_NSObjectToVariable(v13, (uint64_t)&lpsrc);
  }
  else
  {
    lpsrc = 0;
    v19 = 0;
  }

  p_mBuilder = (uint64_t *)&self->_mBuilder;
  if (!lpsrc) {
    goto LABEL_24;
  }
  if (!v15) {
    goto LABEL_24;
  }
  v16 = v15;
  v17 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_25:
  siri::intelligence::TestCaseBuilder::SendIntent(p_mBuilder, (uint64_t)v21, &__p, (uint64_t *)&v16);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v22 < 0) {
    operator delete(v21[0]);
  }
}

- (void)assertResponseAllIds:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  memset(&v25, 0, sizeof(v25));
  id v18 = a3;
  if (v18)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v3 = v18;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (v7)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
            std::vector<std::string>::pointer end = v25.__end_;
            if (v25.__end_ >= v25.__end_cap_.__value_)
            {
              unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v25.__end_ - (char *)v25.__begin_) >> 3);
              unint64_t v11 = v10 + 1;
              if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<std::pair<void (*)(void const*),void const*>>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3) > v11) {
                unint64_t v11 = 0x5555555555555556 * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3) >= 0x555555555555555) {
                unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v12 = v11;
              }
              __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v25.__end_cap_;
              if (v12) {
                v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v25.__end_cap_, v12);
              }
              else {
                v13 = 0;
              }
              v14 = v13 + v10;
              __v.__first_ = v13;
              __v.__begin_ = v14;
              __v.__end_cap_.__value_ = &v13[v12];
              long long v15 = *(_OWORD *)__p;
              v14->__r_.__value_.__r.__words[2] = v20;
              *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
              __p[1] = 0;
              std::string::size_type v20 = 0;
              __p[0] = 0;
              __v.__end_ = v14 + 1;
              std::vector<std::string>::__swap_out_circular_buffer(&v25, &__v);
              v16 = v25.__end_;
              std::__split_buffer<std::string>::~__split_buffer(&__v);
              v25.__end_ = v16;
              if (SHIBYTE(v20) < 0) {
                operator delete(__p[0]);
              }
            }
            else
            {
              long long v9 = *(_OWORD *)__p;
              v25.__end_->__r_.__value_.__r.__words[2] = v20;
              *(_OWORD *)&end->__r_.__value_.__l.__data_ = v9;
              v25.__end_ = end + 1;
            }
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v4);
    }
  }
  siri::intelligence::TestCaseBuilder::AssertResponseAllIds((uint64_t *)&self->_mBuilder, (uint64_t *)&v25);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
}

- (void)assertResponseAnyId:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  memset(&v25, 0, sizeof(v25));
  id v18 = a3;
  if (v18)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v3 = v18;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (v7)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
            std::vector<std::string>::pointer end = v25.__end_;
            if (v25.__end_ >= v25.__end_cap_.__value_)
            {
              unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v25.__end_ - (char *)v25.__begin_) >> 3);
              unint64_t v11 = v10 + 1;
              if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<std::pair<void (*)(void const*),void const*>>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3) > v11) {
                unint64_t v11 = 0x5555555555555556 * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3) >= 0x555555555555555) {
                unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v12 = v11;
              }
              __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v25.__end_cap_;
              if (v12) {
                v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v25.__end_cap_, v12);
              }
              else {
                v13 = 0;
              }
              v14 = v13 + v10;
              __v.__first_ = v13;
              __v.__begin_ = v14;
              __v.__end_cap_.__value_ = &v13[v12];
              long long v15 = *(_OWORD *)__p;
              v14->__r_.__value_.__r.__words[2] = v20;
              *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
              __p[1] = 0;
              std::string::size_type v20 = 0;
              __p[0] = 0;
              __v.__end_ = v14 + 1;
              std::vector<std::string>::__swap_out_circular_buffer(&v25, &__v);
              v16 = v25.__end_;
              std::__split_buffer<std::string>::~__split_buffer(&__v);
              v25.__end_ = v16;
              if (SHIBYTE(v20) < 0) {
                operator delete(__p[0]);
              }
            }
            else
            {
              long long v9 = *(_OWORD *)__p;
              v25.__end_->__r_.__value_.__r.__words[2] = v20;
              *(_OWORD *)&end->__r_.__value_.__l.__data_ = v9;
              v25.__end_ = end + 1;
            }
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v4);
    }
  }
  siri::intelligence::TestCaseBuilder::AssertResponseAnyId((uint64_t *)&self->_mBuilder, (uint64_t *)&v25);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
}

- (void)setVariable:(id)a3 value:(id)a4
{
  id v6 = a3;
  v7 = a4;
  if (v6) {
    v8 = (char *)[v6 UTF8String];
  }
  else {
    v8 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, v8);
  IE_NSObjectToVariable(v7, (uint64_t)&v11);
  uint64_t v9 = v11;
  unint64_t v10 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  siri::intelligence::TestCaseBuilder::SetVariable((uint64_t *)&self->_mBuilder, &__p, &v9);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)gotoResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    id v6 = (char *)[v4 UTF8String];
  }
  else {
    id v6 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, v6);
  siri::intelligence::TestCaseBuilder::GotoResponse((uint64_t *)&self->_mBuilder, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)switchActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    id v6 = (char *)[v4 UTF8String];
  }
  else {
    id v6 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, v6);
  siri::intelligence::TestCaseBuilder::SwitchActivity((uint64_t *)&self->_mBuilder, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (int)count
{
  return *((_DWORD *)self->_mBuilder.mImpl.__ptr_ + 8);
}

- (BOOL)addToTestFile:(id)a3 flowId:(id)a4 testName:(id)a5 description:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10) {
    v14 = (char *)[v10 UTF8String];
  }
  else {
    v14 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(v25, v14);
  if (v11) {
    long long v15 = (char *)[v11 UTF8String];
  }
  else {
    long long v15 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(v23, v15);
  if (v12) {
    v16 = (char *)[v12 UTF8String];
  }
  else {
    v16 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&__str, v16);
  if (v13) {
    v17 = (char *)[v13 UTF8String];
  }
  else {
    v17 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(__p, v17);
  char v18 = siri::intelligence::TestCaseBuilder::AddToTestFile((uint64_t *)&self->_mBuilder, (long long *)v25, (long long *)v23, &__str, (uint64_t)__p);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v24 < 0) {
    operator delete(v23[0]);
  }
  if (v26 < 0) {
    operator delete(v25[0]);
  }

  return v18;
}

- (BOOL)addToTestFile:(id)a3 testName:(id)a4 description:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8) {
    id v11 = (char *)[v8 UTF8String];
  }
  else {
    id v11 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&v19, v11);
  if (v9) {
    id v12 = (char *)[v9 UTF8String];
  }
  else {
    id v12 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&v18, v12);
  if (v10) {
    id v13 = (char *)[v10 UTF8String];
  }
  else {
    id v13 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(__p, v13);
  char v14 = siri::intelligence::TestCaseBuilder::AddToTestFile((uint64_t *)&self->_mBuilder, &v19, &v18, (uint64_t)__p);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }

  return v14;
}

- (TestCaseBuilder)mBuilder
{
  cntrl = self->_mBuilder.mImpl.__cntrl_;
  *v2 = self->_mBuilder.mImpl.__ptr_;
  v2[1] = (Impl *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.mImpl.__cntrl_ = (__shared_weak_count *)a2;
  result.mImpl.__ptr_ = (Impl *)self;
  return result;
}

- (void)setMBuilder:(TestCaseBuilder)a3
{
  id v4 = *(Impl **)a3.mImpl.__ptr_;
  uint64_t v3 = *((void *)a3.mImpl.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_mBuilder.mImpl.__cntrl_;
  self->_mBuilder.mImpl.__ptr_ = v4;
  self->_mBuilder.mImpl.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void).cxx_destruct
{
  cntrl = self->_mBuilder.mImpl.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  return self;
}

@end