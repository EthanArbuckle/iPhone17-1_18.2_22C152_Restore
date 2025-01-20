@interface MPModelLibrarySearchEntityResultContainer
- (MPMediaLibraryEntityTranslationContext)entityTranslationContext;
- (MPModelLibrarySearchEntityResultContainer)initWithEntityQueryResult:(shared_ptr<mlcore:(id)a4 :(id)a5 EntityQueryResult>)a3 forScope:entityTranslationContext:;
- (MPModelLibrarySearchScope)scope;
- (id).cxx_construct;
- (shared_ptr<mlcore::EntityQueryResult>)entityQueryResult;
@end

@implementation MPModelLibrarySearchEntityResultContainer

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_entityQueryResult.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_entityTranslationContext, 0);

  objc_storeStrong((id *)&self->_scope, 0);
}

- (MPMediaLibraryEntityTranslationContext)entityTranslationContext
{
  return self->_entityTranslationContext;
}

- (MPModelLibrarySearchScope)scope
{
  return self->_scope;
}

- (shared_ptr<mlcore::EntityQueryResult>)entityQueryResult
{
  cntrl = self->_entityQueryResult.__cntrl_;
  *v2 = self->_entityQueryResult.__ptr_;
  v2[1] = (EntityQueryResult *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EntityQueryResult *)self;
  return result;
}

- (MPModelLibrarySearchEntityResultContainer)initWithEntityQueryResult:(shared_ptr<mlcore:(id)a4 :(id)a5 EntityQueryResult>)a3 forScope:entityTranslationContext:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v9 = a3.__cntrl_;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MPModelLibrarySearchEntityResultContainer;
  v11 = [(MPModelLibrarySearchEntityResultContainer *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v14 = *(EntityQueryResult **)ptr;
    uint64_t v13 = *((void *)ptr + 1);
    if (v13) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    }
    v15 = (std::__shared_weak_count *)v11->_entityQueryResult.__cntrl_;
    v12->_entityQueryResult.__ptr_ = v14;
    v12->_entityQueryResult.__cntrl_ = (__shared_weak_count *)v13;
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    objc_storeStrong((id *)&v12->_scope, cntrl);
    objc_storeStrong((id *)&v12->_entityTranslationContext, a4);
  }

  return v12;
}

@end