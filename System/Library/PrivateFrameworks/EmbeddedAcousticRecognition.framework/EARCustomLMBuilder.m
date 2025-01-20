@interface EARCustomLMBuilder
@end

@implementation EARCustomLMBuilder

void __68___EARCustomLMBuilder_getFstGrammar_overrideFolder_weight_errorOut___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    *(_OWORD *)__p = 0uLL;
    std::string::size_type v17 = 0;
  }
  unint64_t v6 = *(void *)(v5 + 64);
  unint64_t v7 = *(void *)(v5 + 56);
  if (v7 >= v6)
  {
    uint64_t v8 = *(void *)(v5 + 48);
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v8) >> 3);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - v8) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v10;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v5 + 64);
    if (v12) {
      v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(v5 + 64, v12);
    }
    else {
      v13 = 0;
    }
    v14 = v13 + v9;
    __v.__first_ = v13;
    __v.__begin_ = v14;
    __v.__end_cap_.__value_ = &v13[v12];
    v14->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v14->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    __v.__end_ = v14 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)(v5 + 48), &__v);
    uint64_t v15 = *(void *)(v5 + 56);
    std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
    *(void *)(v5 + 56) = v15;
  }
  else
  {
    *(void *)(v7 + 16) = v17;
    *(_OWORD *)unint64_t v7 = *(_OWORD *)__p;
    *(void *)(v5 + 56) = v7 + 24;
  }
}

@end