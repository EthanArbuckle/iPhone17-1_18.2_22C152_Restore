@interface DEVariableArray
- (DEVariableArray)init;
- (DEVariableArray)initWithName:(id)a3;
- (DEVariableArray)initWithSharedPtr:(void *)a3;
- (id)getItem:(unint64_t)a3;
- (unint64_t)getLength;
- (void)addItem:(id)a3;
@end

@implementation DEVariableArray

- (unint64_t)getLength
{
  [(DEVariable *)self This];
  if (!lpsrc)
  {
    unint64_t v2 = 0;
    goto LABEL_6;
  }
  if (!v2)
  {
LABEL_6:
    v3 = 0;
    goto LABEL_7;
  }
  v3 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  if (v2) {
    unint64_t v2 = (uint64_t)(*(void *)(v2 + 80) - *(void *)(v2 + 72)) >> 4;
  }
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return v2;
}

- (id)getItem:(unint64_t)a3
{
  [(DEVariable *)self This];
  if (!lpsrc[0])
  {
    v4 = 0;
    goto LABEL_6;
  }
  if (!v4)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)lpsrc[1] + 1, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (lpsrc[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)lpsrc[1]);
  }
  if (v4)
  {
    uint64_t v6 = v4[9];
    if (a3 >= (v4[10] - v6) >> 4)
    {
      lpsrc[0] = 0;
      lpsrc[1] = 0;
    }
    else
    {
      long long v7 = *(_OWORD *)(v6 + 16 * a3);
      *(_OWORD *)lpsrc = v7;
      if (*((void *)&v7 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 1uLL, memory_order_relaxed);
      }
    }
    v8 = [[DEVariable alloc] initWithSharedPtr:lpsrc];
    if (lpsrc[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)lpsrc[1]);
    }
  }
  else
  {
    v8 = 0;
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v8;
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  [(DEVariable *)self This];
  if (!lpsrc)
  {
    v5 = 0;
    goto LABEL_6;
  }
  if (!v5)
  {
LABEL_6:
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v5)
  {
    long long v7 = (void *)[v4 getSharedPtr];
    v8 = (std::__shared_weak_count *)v7[1];
    v9[0] = *v7;
    v9[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    siri::dialogengine::VariableArray::AddItem(v5, v9);
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (DEVariableArray)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEVariableArray;
  v5 = [(DEVariable *)&v11 init];
  if (v5)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v4 UTF8String]);
    uint64_t v6 = operator new(0x78uLL);
    v6[1] = 0;
    v6[2] = 0;
    void *v6 = &unk_1F2123AE0;
    *(void *)&long long v7 = siri::dialogengine::VariableArray::VariableArray(v6 + 3, &__p);
    *((void *)&v7 + 1) = v6;
    long long v10 = v7;
    [(DEVariable *)v5 setThis:&v10];
    if (*((void *)&v10 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }

  return v5;
}

- (DEVariableArray)initWithSharedPtr:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DEVariableArray;
  id v4 = [(DEVariable *)&v10 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    uint64_t v8 = *(void *)a3;
    v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEVariable *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEVariableArray)init
{
  v7.receiver = self;
  v7.super_class = (Class)DEVariableArray;
  unint64_t v2 = [(DEVariable *)&v7 init];
  if (v2)
  {
    v3 = operator new(0x78uLL);
    v3[1] = 0;
    v3[2] = 0;
    void *v3 = &unk_1F2123AE0;
    *(void *)&long long v4 = siri::dialogengine::VariableArray::VariableArray((siri::dialogengine::VariableArray *)(v3 + 3));
    *((void *)&v4 + 1) = v3;
    long long v6 = v4;
    [(DEVariable *)v2 setThis:&v6];
    if (*((void *)&v6 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
    }
  }
  return v2;
}

@end