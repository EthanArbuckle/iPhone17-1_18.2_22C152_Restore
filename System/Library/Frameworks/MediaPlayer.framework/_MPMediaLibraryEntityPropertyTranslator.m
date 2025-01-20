@interface _MPMediaLibraryEntityPropertyTranslator
- (id).cxx_construct;
- (id)filterTransformer;
- (id)sortTransformer;
- (id)valueTransformer;
- (shared_ptr<std::unordered_map<std::string,)propertiesToFetchMap;
- (shared_ptr<std::unordered_map<std::string,)propertiesToSortMap;
- (void)setFilterTransformer:(id)a3;
- (void)setPropertiesToFetchMap:()shared_ptr<std:(mlcore::ModelPropertyBase *>>)a3 :unordered_map<std::string;
- (void)setPropertiesToSortMap:()shared_ptr<std:(mlcore::ModelPropertyBase *>>)a3 :unordered_map<std::string;
- (void)setSortTransformer:(id)a3;
- (void)setValueTransformer:(id)a3;
@end

@implementation _MPMediaLibraryEntityPropertyTranslator

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

- (void)setValueTransformer:(id)a3
{
}

- (void)setSortTransformer:(id)a3
{
}

- (void)setPropertiesToSortMap:()shared_ptr<std:(mlcore::ModelPropertyBase *>>)a3 :unordered_map<std::string
{
  v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_propertiesToSortMap.__cntrl_;
  self->_propertiesToSortMap.__ptr_ = v4;
  self->_propertiesToSortMap.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setPropertiesToFetchMap:()shared_ptr<std:(mlcore::ModelPropertyBase *>>)a3 :unordered_map<std::string
{
  v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_propertiesToFetchMap.__cntrl_;
  self->_propertiesToFetchMap.__ptr_ = v4;
  self->_propertiesToFetchMap.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setFilterTransformer:(id)a3
{
}

- (id)valueTransformer
{
  return self->_valueTransformer;
}

- (shared_ptr<std::unordered_map<std::string,)propertiesToFetchMap
{
  cntrl = self->_propertiesToFetchMap.__cntrl_;
  *v2 = self->_propertiesToFetchMap.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_propertiesToSortMap.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_propertiesToFetchMap.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  objc_storeStrong(&self->_valueTransformer, 0);
  objc_storeStrong(&self->_filterTransformer, 0);

  objc_storeStrong(&self->_sortTransformer, 0);
}

- (id)filterTransformer
{
  return self->_filterTransformer;
}

- (id)sortTransformer
{
  return self->_sortTransformer;
}

- (shared_ptr<std::unordered_map<std::string,)propertiesToSortMap
{
  cntrl = self->_propertiesToSortMap.__cntrl_;
  *v2 = self->_propertiesToSortMap.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

@end