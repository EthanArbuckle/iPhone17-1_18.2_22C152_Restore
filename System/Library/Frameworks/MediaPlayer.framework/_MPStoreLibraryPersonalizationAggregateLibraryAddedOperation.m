@interface _MPStoreLibraryPersonalizationAggregateLibraryAddedOperation
- (MPMediaLibraryView)libraryView;
- (id).cxx_construct;
- (id)responseHandler;
- (vector<long)persistentIDs;
- (void)execute;
- (void)setLibraryView:(id)a3;
- (void)setPersistentIDs:(vector<long)long;
- (void)setResponseHandler:(id)a3;
@end

@implementation _MPStoreLibraryPersonalizationAggregateLibraryAddedOperation

- (id).cxx_construct
{
  *((void *)self + 37) = 0;
  *((void *)self + 38) = 0;
  *((void *)self + 36) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_persistentIDs = &self->_persistentIDs;
  begin = self->_persistentIDs.__begin_;
  if (begin)
  {
    p_persistentIDs->__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setPersistentIDs:(vector<long)long
{
  p_persistentIDs = &self->_persistentIDs;
  if (&self->_persistentIDs != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    int64_t v6 = (char *)end - (char *)a3->__begin_;
    unint64_t v7 = v6 >> 3;
    uint64_t value = (uint64_t)self->_persistentIDs.__end_cap_.__value_;
    v9 = p_persistentIDs->__begin_;
    if (v6 >> 3 <= (unint64_t)((int64_t)(value - (unint64_t)p_persistentIDs->__begin_) >> 3))
    {
      p_end = &self->_persistentIDs.__end_;
      v14 = self->_persistentIDs.__end_;
      unint64_t v15 = v14 - v9;
      if (v15 < v7)
      {
        v16 = &begin[v15];
        if (v14 != v9)
        {
          memmove(v9, begin, (char *)v14 - (char *)v9);
          v9 = *p_end;
        }
        int64_t v6 = (char *)end - (char *)v16;
        if (end == v16) {
          goto LABEL_20;
        }
        v17 = v9;
        v18 = v16;
        goto LABEL_19;
      }
    }
    else
    {
      if (v9)
      {
        self->_persistentIDs.__end_ = v9;
        operator delete(v9);
        uint64_t value = 0;
        p_persistentIDs->__begin_ = 0;
        p_persistentIDs->__end_ = 0;
        p_persistentIDs->__end_cap_.__value_ = 0;
      }
      if (v6 < 0) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v10 = value >> 2;
      if (value >> 2 <= v7) {
        uint64_t v10 = v6 >> 3;
      }
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v10;
      }
      std::vector<mlcore::ModelPropertyBase *>::__vallocate[abi:ne180100](p_persistentIDs, v11);
      v13 = p_persistentIDs->__end_;
      p_end = &p_persistentIDs->__end_;
      v9 = v13;
    }
    if (end == begin)
    {
LABEL_20:
      *p_end = (int64_t *)((char *)v9 + v6);
      return;
    }
    v17 = v9;
    v18 = begin;
LABEL_19:
    memmove(v17, v18, v6);
    goto LABEL_20;
  }
}

- (vector<long)persistentIDs
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<long long, std::allocator<long long>> *)std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(retstr, self->_persistentIDs.__begin_, (uint64_t)self->_persistentIDs.__end_, self->_persistentIDs.__end_ - self->_persistentIDs.__begin_);
}

- (void)setLibraryView:(id)a3
{
  self->_libraryView = (MPMediaLibraryView *)a3;
}

- (MPMediaLibraryView)libraryView
{
  return self->_libraryView;
}

- (void)execute
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  mlcore::ItemPropertyPersistentID((mlcore *)self);
  std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
}

@end