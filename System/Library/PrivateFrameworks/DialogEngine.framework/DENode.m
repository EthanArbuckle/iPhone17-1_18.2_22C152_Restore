@interface DENode
- (BOOL)isOfType:(unint64_t)a3;
- (DENode)init;
- (DENode)initWithSharedPtr:(shared_ptr<siri::dialogengine::Node>)a3;
- (NSString)conditionName;
- (id).cxx_construct;
- (id)getDialog;
- (id)getGlobalId:(id)a3;
- (shared_ptr<siri::dialogengine::Node>)This;
- (shared_ptr<siri::dialogengine::Node>)getSharedPtr;
- (void)setConditionName:(id)a3;
- (void)setThis:(shared_ptr<siri::dialogengine::Node>)a3;
@end

@implementation DENode

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

- (void)setThis:(shared_ptr<siri::dialogengine::Node>)a3
{
}

- (shared_ptr<siri::dialogengine::Node>)This
{
  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__2036);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (id)getGlobalId:(id)a3
{
  id v4 = a3;
  v5 = NSString;
  [(DENode *)self This];
  siri::dialogengine::Node::GetGlobalId(v9, (siri::dialogengine::Context *)[v4 This], &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v7 = [v5 stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }

  return v7;
}

- (void)setConditionName:(id)a3
{
  id v4 = a3;
  [(DENode *)self This];
  v5 = v8;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=(v5 + 5, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (NSString)conditionName
{
  v2 = NSString;
  [(DENode *)self This];
  if (*(char *)(v6 + 143) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(v6 + 120), *(void *)(v6 + 128));
  }
  else {
    std::string v8 = *(std::string *)(v6 + 120);
  }
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = &v8;
  }
  else {
    v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  id v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return (NSString *)v4;
}

- (id)getDialog
{
  [(DENode *)self This];
  if (!lpsrc)
  {
    v2 = 0;
    goto LABEL_6;
  }
  if (!v2)
  {
LABEL_6:
    v3 = 0;
    goto LABEL_7;
  }
  v3 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  id v4 = [DEDialog alloc];
  v7 = v2;
  std::string v8 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v5 = [(DEDialog *)v4 initWithSharedPtr:&v7];
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return v5;
}

- (BOOL)isOfType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      [(DENode *)self This];
      v3 = lpsrc;
      if (!lpsrc) {
        goto LABEL_13;
      }
      break;
    case 2uLL:
      [(DENode *)self This];
      v3 = lpsrc;
      if (!lpsrc) {
        goto LABEL_13;
      }
      break;
    case 3uLL:
      [(DENode *)self This];
      v3 = lpsrc;
      if (!lpsrc) {
        goto LABEL_13;
      }
      break;
    case 4uLL:
      [(DENode *)self This];
      v3 = lpsrc;
      if (!lpsrc) {
        goto LABEL_13;
      }
      break;
    case 5uLL:
      [(DENode *)self This];
      if (lpsrc
      {
        BOOL v6 = 1;
        if (v9)
        {
          atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
          std::__shared_weak_count::__release_shared[abi:ne180100](v9);
        }
      }
      else
      {
        BOOL v6 = 0;
      }
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
      return v6;
    default:
      return 0;
  }
  {
    char v5 = 1;
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  else
  {
LABEL_13:
    char v5 = 0;
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return (v5 & 1) != 0;
}

- (shared_ptr<siri::dialogengine::Node>)getSharedPtr
{
  cntrl = self->_This.__cntrl_;
  void *v2 = self->_This.__ptr_;
  v2[1] = (Node *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Node *)self;
  return result;
}

- (DENode)initWithSharedPtr:(shared_ptr<siri::dialogengine::Node>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)DENode;
  id v4 = [(DENode *)&v10 init];
  char v5 = v4;
  if (v4)
  {
    BOOL v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v8 = *(void *)ptr;
    v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DENode *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DENode)init
{
  v7.receiver = self;
  v7.super_class = (Class)DENode;
  v2 = [(DENode *)&v7 init];
  if (v2)
  {
    v3 = operator new(0xE8uLL);
    *(_OWORD *)((char *)v3 + 8) = 0u;
    *(void *)v3 = &unk_1F211B7F0;
    *(_OWORD *)((char *)v3 + 216) = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    v3[4] = 0u;
    *(_OWORD *)((char *)v3 + 104) = 0u;
    *((void *)v3 + 12) = (char *)v3 + 104;
    *((void *)v3 + 3) = &unk_1F2126C60;
    *((void *)v3 + 10) = 0;
    *((void *)v3 + 11) = &unk_1F2126CB8;
    *(_OWORD *)((char *)v3 + 120) = 0u;
    *(_OWORD *)((char *)v3 + 136) = 0u;
    *(_OWORD *)((char *)v3 + 152) = 0u;
    *(_OWORD *)((char *)v3 + 168) = 0u;
    *(_OWORD *)((char *)v3 + 184) = 0u;
    *(_OWORD *)((char *)v3 + 200) = 0u;
    *((_DWORD *)v3 + 54) = 1065353216;
    char v5 = (char *)v3 + 24;
    BOOL v6 = (std::__shared_weak_count *)v3;
    [(DENode *)v2 setThis:&v5];
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  return v2;
}

@end