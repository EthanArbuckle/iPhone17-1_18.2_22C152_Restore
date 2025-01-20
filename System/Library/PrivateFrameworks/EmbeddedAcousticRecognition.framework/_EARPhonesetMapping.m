@interface _EARPhonesetMapping
- (_EARPhonesetMapping)initWithLanguage:(id)a3;
- (id).cxx_construct;
- (id)ipaPhoneSequenceForAsrProns:(id)a3;
- (id)nvAsrPhoneSequenceForXsampaProns:(id)a3;
- (id)supportedXsampaProns;
@end

@implementation _EARPhonesetMapping

- (_EARPhonesetMapping)initWithLanguage:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_EARPhonesetMapping;
  v5 = [(_EARPhonesetMapping *)&v12 init];
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      long long __p = 0uLL;
      uint64_t v10 = 0;
    }
    std::allocate_shared[abi:ne180100]<quasar::PhonesetMapping,std::allocator<quasar::PhonesetMapping>,std::string,void>(&__p, &v11);
    long long v6 = v11;
    long long v11 = 0uLL;
    v7 = (std::__shared_weak_count *)*((void *)v5 + 2);
    *(_OWORD *)(v5 + 8) = v6;
    if (v7)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      if (*((void *)&v11 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v11 + 1));
      }
    }
    if (SHIBYTE(v10) < 0) {
      operator delete((void *)__p);
    }
  }

  return (_EARPhonesetMapping *)v5;
}

- (id)ipaPhoneSequenceForAsrProns:(id)a3
{
  id v4 = a3;
  ptr = self->_phoneset.__ptr_;
  if (v4) {
    objc_msgSend(v4, "ear_toString");
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  quasar::PhonesetMapping::getIpaPhoneSequence((uint64_t)ptr, (uint64_t)v7);
}

- (id)nvAsrPhoneSequenceForXsampaProns:(id)a3
{
  id v4 = a3;
  ptr = self->_phoneset.__ptr_;
  if (v4) {
    objc_msgSend(v4, "ear_toString");
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  quasar::PhonesetMapping::getNvASRPhoneSequence((int)ptr, (uint64_t)v7);
}

- (id)supportedXsampaProns
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  quasar::PhonesetMapping::getSupportedXsampaProns(&v11);
  std::vector<std::string>::pointer begin = v11.__begin_;
  for (std::vector<std::string>::pointer i = v11.__end_; begin != i; ++begin)
  {
    if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, begin->__r_.__value_.__l.__data_, begin->__r_.__value_.__l.__size_);
    }
    else
    {
      long long v5 = *(_OWORD *)&begin->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = begin->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v5;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v7 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
    [v2 addObject:v7];

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  v8 = (void *)[v2 copy];
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  return v8;
}

- (void).cxx_destruct
{
  cntrl = self->_phoneset.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end