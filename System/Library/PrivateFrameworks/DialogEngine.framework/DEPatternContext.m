@interface DEPatternContext
- (DEPatternContext)init;
- (DEPatternContext)initWithSharedPtr:(void *)a3;
- (id).cxx_construct;
- (shared_ptr<siri::dialogengine::PatternContext>)This;
- (shared_ptr<siri::dialogengine::PatternContext>)getSharedPtr;
- (void)setThis:(shared_ptr<siri::dialogengine::PatternContext>)a3;
@end

@implementation DEPatternContext

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_This.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setThis:(shared_ptr<siri::dialogengine::PatternContext>)a3
{
}

- (shared_ptr<siri::dialogengine::PatternContext>)This
{
  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__50598);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (shared_ptr<siri::dialogengine::PatternContext>)getSharedPtr
{
  cntrl = self->_This.__cntrl_;
  void *v2 = self->_This.__ptr_;
  v2[1] = (PatternContext *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PatternContext *)self;
  return result;
}

- (DEPatternContext)initWithSharedPtr:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DEPatternContext;
  v4 = [(DEPatternContext *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    uint64_t v8 = *(void *)a3;
    v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEPatternContext *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEPatternContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)DEPatternContext;
  return [(DEPatternContext *)&v3 init];
}

@end