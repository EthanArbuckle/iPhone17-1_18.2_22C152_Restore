@interface _EARPhoneticMatchData
- (BOOL)appendData:(id)a3 prior:(float)a4;
- (BOOL)roomForMoreData;
- (_EARPhoneticMatchData)initWithFeedType:(int64_t)a3 jsonConfigFile:(id)a4;
- (id).cxx_construct;
- (int)convertFeedType:(int64_t)a3;
- (int)getLimit;
- (shared_ptr<quasar::DataFeed>)dataFeed;
- (void)addOsym;
- (void)applyRegexEnumerations;
- (void)expDecayPriors;
- (void)normalizePriors;
- (void)powerScalePriors;
- (void)sortItemsByPriorAsc;
- (void)sortItemsByPriorDesc;
- (void)writeTsv:(id)a3;
@end

@implementation _EARPhoneticMatchData

- (int)convertFeedType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 0xD) {
    return a3;
  }
  else {
    return 0;
  }
}

- (_EARPhoneticMatchData)initWithFeedType:(int64_t)a3 jsonConfigFile:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_EARPhoneticMatchData;
  v7 = [(_EARPhoneticMatchData *)&v18 init];
  if (v7)
  {
    quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v22);
    v8 = EarPmLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_impl(&dword_1B1A86000, v8, OS_LOG_TYPE_DEFAULT, "Loading configuration from: %@", buf, 0xCu);
    }

    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v17 = 0;
    }
    memset(v15, 0, sizeof(v15));
    *(_OWORD *)buf = 0u;
    long long v20 = 0u;
    int v21 = 1065353216;
    quasar::SystemConfig::readJsonFile((uint64_t)v22, (uint64_t)__p, v15, (uint64_t)buf, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
    *(void *)buf = v15;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
    LODWORD(__p[0]) = [v7 convertFeedType:a3];
    std::allocate_shared[abi:ne180100]<quasar::DataFeed,std::allocator<quasar::DataFeed>,quasar::DataFeedType,quasar::SystemConfig &,void>(buf);
    long long v9 = *(_OWORD *)buf;
    memset(buf, 0, sizeof(buf));
    v10 = (std::__shared_weak_count *)*((void *)v7 + 2);
    *(_OWORD *)(v7 + 8) = v9;
    if (v10)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      if (*(void *)&buf[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
      }
    }
    v11 = (kaldi::nnet1::Nnet *)*((void *)v7 + 1);
    if (v11 && (kaldi::nnet1::Nnet::IsRnn(v11) & 1) != 0)
    {
      v12 = v7;
    }
    else
    {
      v13 = EarPmLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B1A86000, v13, OS_LOG_TYPE_DEFAULT, "Phonetic-match building is not supported", buf, 2u);
      }

      v12 = 0;
    }
    quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v22);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)writeTsv:(id)a3
{
  id v4 = a3;
  v5 = v4;
  ptr = self->_dataFeed.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v8 = 0;
  }
  quasar::DataFeed::writeTSV((uint64_t)ptr, (uint64_t)__p);
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
}

- (void)sortItemsByPriorDesc
{
}

- (void)sortItemsByPriorAsc
{
}

- (void)normalizePriors
{
}

- (void)expDecayPriors
{
}

- (void)powerScalePriors
{
}

- (void)applyRegexEnumerations
{
}

- (void)addOsym
{
}

- (BOOL)appendData:(id)a3 prior:(float)a4
{
  id v6 = a3;
  v21[0] = 0;
  v21[1] = 0;
  long long v20 = v21;
  quasar::DataFeedItem::setPrior((float *)&v19, a4);
  quasar::DataFeed::getFieldNames((long long **)self->_dataFeed.__ptr_, &v18);
  uint64_t v7 = [v6 count];
  if (v7 == 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18.__r_.__value_.__l.__size_ - v18.__r_.__value_.__r.__words[0]) >> 3))
  {
    uint64_t v8 = 0;
    for (unint64_t i = 0;
          objc_msgSend(v6, "count", __p.__r_.__value_.__r.__words[0], __p.__r_.__value_.__l.__size_, __p.__r_.__value_.__r.__words[2]) > i;
          ++i)
    {
      v10 = [v6 objectAtIndexedSubscript:i];
      uint64_t v11 = [v10 length];

      if (!v11) {
        goto LABEL_11;
      }
      std::string::size_type v12 = v18.__r_.__value_.__r.__words[0];
      v13 = [v6 objectAtIndexedSubscript:i];
      v14 = v13;
      if (v13) {
        objc_msgSend(v13, "ear_toString");
      }
      else {
        memset(&__p, 0, sizeof(__p));
      }
      quasar::DataFeedItem::setField((uint64_t)&v19, (long long *)(v12 + v8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }

      v8 += 24;
    }
    BOOL appended = quasar::DataFeed::appendItem((quasar::DataFeed *)self->_dataFeed.__ptr_, &v19);
  }
  else
  {
LABEL_11:
    BOOL appended = 0;
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v20, v21[0]);

  return appended;
}

- (BOOL)roomForMoreData
{
  return !quasar::DataFeed::full((quasar::DataFeed *)self->_dataFeed.__ptr_);
}

- (int)getLimit
{
  return quasar::DataFeed::getLimit((quasar::DataFeed *)self->_dataFeed.__ptr_);
}

- (shared_ptr<quasar::DataFeed>)dataFeed
{
  cntrl = self->_dataFeed.__cntrl_;
  *v2 = self->_dataFeed.__ptr_;
  v2[1] = (DataFeed *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (DataFeed *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_dataFeed.__cntrl_;
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