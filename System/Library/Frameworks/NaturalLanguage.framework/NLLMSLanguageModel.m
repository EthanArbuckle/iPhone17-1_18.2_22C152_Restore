@interface NLLMSLanguageModel
- (BOOL)generatesPredictions;
- (NLLMSLanguageModel)initWithLocalization:(id)a3 options:(id)a4;
- (id).cxx_construct;
- (id)sessionWithOptions:(id)a3;
- (void)_underlyingModel;
@end

@implementation NLLMSLanguageModel

- (NLLMSLanguageModel)initWithLocalization:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = stringForKey(v7, @"Architecture", @"LSTM");
  v29[0] = 0;
  v29[1] = 0;
  v28 = (uint64_t *)v29;
  id v9 = v6;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v9 UTF8String]);
  char v10 = BOOLForKey(v7, @"AdaptationEnabled", 1);
  int v11 = BOOLForKey(v7, @"IsSiriModel", 0);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E4F720C8]);
  v30 = __p;
  v12 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v28, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v30);
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string&>((uint64_t)v12 + 56, (std::string *)((char *)v12 + 56), &__str);
  if (v26 < 0)
  {
    operator delete(__p[0]);
    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
LABEL_6:
    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  char v24 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E4F720B8]);
  v30 = __p;
  v13 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v28, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v30);
  std::variant<BOOL,std::string>::operator=[abi:ne180100]<BOOL,0,BOOL,0ul,0>((uint64_t)v13 + 56, &v24);
  if ((v26 & 0x80000000) == 0) {
    goto LABEL_6;
  }
  operator delete(__p[0]);
  if (!v11) {
    goto LABEL_10;
  }
LABEL_7:
  char v24 = 1;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E4F72050]);
  v30 = __p;
  v14 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v28, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v30);
  std::variant<BOOL,std::string>::operator=[abi:ne180100]<BOOL,0,BOOL,0ul,0>((uint64_t)v14 + 56, &v24);
  if (v26 < 0) {
    operator delete(__p[0]);
  }
LABEL_10:
  if (v8 && [v8 isEqual:@"Transformer"])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E4F72148]);
    v30 = __p;
    v15 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v28, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v30);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>((uint64_t)v15 + 56, (std::string *)((char *)v15 + 56), MEMORY[0x1E4F72078]);
    if (v26 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E4F72158]);
    v30 = __p;
    v16 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v28, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v30);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>((uint64_t)v16 + 56, (std::string *)((char *)v16 + 56), MEMORY[0x1E4F72078]);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E4F72148]);
    v30 = __p;
    v17 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v28, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v30);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>((uint64_t)v17 + 56, (std::string *)((char *)v17 + 56), MEMORY[0x1E4F72098]);
    if (v26 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E4F72158]);
    v30 = __p;
    v18 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v28, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v30);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>((uint64_t)v18 + 56, (std::string *)((char *)v18 + 56), MEMORY[0x1E4F72098]);
  }
  if (v26 < 0) {
    operator delete(__p[0]);
  }
  v23.receiver = self;
  v23.super_class = (Class)NLLMSLanguageModel;
  v19 = [(NLLanguageModel *)&v23 initWithLocalization:v9];
  if (v19)
  {
    language_modeling::v1::LanguageModel::init();
    if (v22 < 0) {
      operator delete(v21);
    }
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy((uint64_t)&v28, v29[0]);

  return v19;
}

- (BOOL)generatesPredictions
{
  return 1;
}

- (id)sessionWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [[NLLMSLanguageModelSession alloc] initWithLanguageModel:self options:v4];

  return v5;
}

- (void)_underlyingModel
{
  return &self->_model;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end