@interface _EARTextNormalization
- (_EARTextNormalization)init;
- (_EARTextNormalization)initWithModelRoot:(id)a3;
- (_EARTextNormalization)initWithModelRoot:(id)a3 mungeRuleFile:(id)a4;
- (_EARTextNormalization)initWithModelRoot:(id)a3 mungeRules:(id)a4;
- (_EARTextNormalization)initWithMungeRules:(id)a3;
- (_EARTextNormalization)initWithNcsRoot:(id)a3;
- (_EARTextNormalization)initWithNcsRoot:(id)a3 mungeRuleFile:(id)a4;
- (_EARTextNormalization)initWithNcsRoot:(id)a3 mungeRules:(id)a4;
- (id).cxx_construct;
- (id)munge:(id)a3;
- (id)normalize:(id)a3;
- (id)tokenize:(id)a3;
@end

@implementation _EARTextNormalization

- (_EARTextNormalization)init
{
  return 0;
}

- (_EARTextNormalization)initWithNcsRoot:(id)a3 mungeRuleFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = +[_EARQuasarTokenizer extractModelRootFromNcsRoot:v6];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(_EARTextNormalization *)self initWithModelRoot:v8 mungeRuleFile:v7];

  return v9;
}

- (_EARTextNormalization)initWithNcsRoot:(id)a3 mungeRules:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = +[_EARQuasarTokenizer extractModelRootFromNcsRoot:v6];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(_EARTextNormalization *)self initWithModelRoot:v8 mungeRules:v7];

  return v9;
}

- (_EARTextNormalization)initWithNcsRoot:(id)a3
{
  v4 = +[_EARQuasarTokenizer extractModelRootFromNcsRoot:a3];
  v5 = [(_EARTextNormalization *)self initWithModelRoot:v4];

  return v5;
}

- (_EARTextNormalization)initWithModelRoot:(id)a3 mungeRuleFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EARTextNormalization;
  v8 = [(_EARTextNormalization *)&v12 init];
  if (v8)
  {
    if (v6)
    {
      v9 = [[_EARQuasarTokenizer alloc] initWithModelRoot:v6];
      tokenizer = v8->_tokenizer;
      v8->_tokenizer = &v9->super;
    }
    if (v7)
    {
      objc_msgSend(v7, "ear_toString");
      operator new();
    }
  }

  return v8;
}

- (_EARTextNormalization)initWithModelRoot:(id)a3 mungeRules:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EARTextNormalization;
  v8 = [(_EARTextNormalization *)&v14 init];
  if (v8)
  {
    v9 = [[_EARQuasarTokenizer alloc] initWithModelRoot:v6];
    tokenizer = v8->_tokenizer;
    v8->_tokenizer = &v9->super;

    if (v7) {
      objc_msgSend(v7, "ear_toString");
    }
    else {
      memset(&__p, 0, sizeof(__p));
    }
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](&v13, &__p, 24);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    operator new();
  }

  return 0;
}

- (_EARTextNormalization)initWithModelRoot:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EARTextNormalization;
  v5 = [(_EARTextNormalization *)&v9 init];
  if (v5)
  {
    id v6 = [[_EARQuasarTokenizer alloc] initWithModelRoot:v4];
    tokenizer = v5->_tokenizer;
    v5->_tokenizer = &v6->super;
  }
  return v5;
}

- (_EARTextNormalization)initWithMungeRules:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_EARTextNormalization;
  if ([(_EARTextNormalization *)&v8 init])
  {
    if (v4) {
      objc_msgSend(v4, "ear_toString");
    }
    else {
      memset(&__p, 0, sizeof(__p));
    }
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](&v7, &__p, 24);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    operator new();
  }

  return 0;
}

- (id)normalize:(id)a3
{
  id v4 = a3;
  if (self->_tokenizer)
  {
    v5 = [(_EARTextNormalization *)self tokenize:v4];
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v5 = [v4 componentsSeparatedByCharactersInSet:v6];

    if (!v5) {
      goto LABEL_7;
    }
  }
  if (self->_munger.__ptr_.__value_)
  {
    id v7 = [(_EARTextNormalization *)self munge:v5];
    goto LABEL_8;
  }
LABEL_7:
  id v7 = v5;
LABEL_8:
  objc_super v8 = v7;

  return v8;
}

- (id)tokenize:(id)a3
{
  v3 = [(_EARTokenizer *)self->_tokenizer tokenize:a3];
  return v3;
}

- (id)munge:(id)a3
{
  v29[16] = *(void ***)MEMORY[0x1E4F143B8];
  memset(&v21, 0, sizeof(v21));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v24 + 1) + 8 * i);
        objc_super v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          std::string::size_type v23 = 0;
        }

        std::vector<std::string>::pointer end = v21.__end_;
        if (v21.__end_ >= v21.__end_cap_.__value_)
        {
          unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v21.__end_ - (char *)v21.__begin_) >> 3);
          unint64_t v12 = v11 + 1;
          if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v21.__end_cap_.__value_ - (char *)v21.__begin_) >> 3) > v12) {
            unint64_t v12 = 0x5555555555555556 * (((char *)v21.__end_cap_.__value_ - (char *)v21.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v21.__end_cap_.__value_ - (char *)v21.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v13 = v12;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v21.__end_cap_;
          if (v13) {
            objc_super v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v21.__end_cap_, v13);
          }
          else {
            objc_super v14 = 0;
          }
          v15 = v14 + v11;
          __v.__first_ = v14;
          __v.__begin_ = v15;
          __v.__end_cap_.__value_ = &v14[v13];
          long long v16 = *(_OWORD *)__p;
          v15->__r_.__value_.__r.__words[2] = v23;
          *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
          __p[1] = 0;
          std::string::size_type v23 = 0;
          __p[0] = 0;
          __v.__end_ = v15 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v21, &__v);
          v17 = v21.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v21.__end_ = v17;
          if (SHIBYTE(v23) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v10 = *(_OWORD *)__p;
          v21.__end_->__r_.__value_.__r.__words[2] = v23;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
          v21.__end_ = end + 1;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v4);
  }

  quasar::Munger::munge((uint64_t)self->_munger.__ptr_.__value_, (uint64_t *)&v21, 0, 0);
  v18 = EARHelpers::VectorToArray<std::string>((long long **)&v21);
  v29[0] = (void **)&v21;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v29);

  return v18;
}

- (void).cxx_destruct
{
  std::unique_ptr<quasar::Munger>::reset[abi:ne180100]((void ***)&self->_munger, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end