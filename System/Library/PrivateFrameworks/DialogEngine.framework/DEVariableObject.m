@interface DEVariableObject
- (DEVariableObject)init;
- (DEVariableObject)initWithName:(id)a3;
- (DEVariableObject)initWithSharedPtr:(void *)a3;
- (id)getValue:(id)a3;
- (id)getValues;
- (void)addProperty:(id)a3;
@end

@implementation DEVariableObject

- (id)getValues
{
  [(DEVariable *)self This];
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
  v3 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v2)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    siri::dialogengine::VariableObject::GetValues(v2, &lpsrc);
    v5 = lpsrc;
    if (v12 != lpsrc)
    {
      unint64_t v6 = 0;
      do
      {
        long long v7 = v5[v6];
        long long v10 = v7;
        if (*((void *)&v7 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        v8 = [[DEVariable alloc] initWithSharedPtr:&v10];
        objc_msgSend(v4, "addObject:", v8, (void)v10);

        if (*((void *)&v10 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
        }
        ++v6;
        v5 = lpsrc;
      }
      while (v6 < ((char *)v12 - (unsigned char *)lpsrc) >> 4);
    }
    *(void *)&long long v10 = &lpsrc;
    std::vector<std::shared_ptr<siri::dialogengine::PatternSchemaComponent>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v10);
    if (v3) {
      goto LABEL_18;
    }
  }
  else
  {
    v4 = 0;
    if (v3) {
LABEL_18:
    }
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return v4;
}

- (id)getValue:(id)a3
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
    unint64_t v6 = 0;
    goto LABEL_7;
  }
  unint64_t v6 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (!v5)
  {
    long long v10 = 0;
    goto LABEL_20;
  }
  std::string::basic_string[abi:ne180100]<0>(&lpsrc, (char *)[v4 UTF8String]);
  uint64_t v7 = std::__tree<std::string>::find<std::string>((uint64_t)(v5 + 72), (const void **)&lpsrc);
  if (v5 + 80 == (char *)v7)
  {
    v8 = 0;
    uint64_t v9 = 0;
    uint64_t v15 = 0;
    v16 = 0;
  }
  else
  {
    uint64_t v9 = *(void *)(v7 + 56);
    v8 = *(std::__shared_weak_count **)(v7 + 64);
    uint64_t v15 = v9;
    v16 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  if (v14 < 0) {
    operator delete(lpsrc);
  }
  if (v9)
  {
    long long v10 = [[DEVariable alloc] initWithSharedPtr:&v15];
    v8 = v16;
    if (!v16) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  long long v10 = objc_alloc_init(DEVariable);
  if (v8) {
LABEL_19:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
LABEL_20:
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }

  return v10;
}

- (void)addProperty:(id)a3
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
    unint64_t v6 = 0;
    goto LABEL_7;
  }
  unint64_t v6 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v5)
  {
    uint64_t v7 = (void *)[v4 getSharedPtr];
    v8 = (std::__shared_weak_count *)v7[1];
    v9[0] = *v7;
    v9[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    siri::dialogengine::VariableObject::AddProperty((uint64_t)v5, v9);
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (DEVariableObject)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEVariableObject;
  v5 = [(DEVariable *)&v11 init];
  if (v5)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v4 UTF8String]);
    unint64_t v6 = operator new(0x78uLL);
    v6[1] = 0;
    v6[2] = 0;
    *unint64_t v6 = &unk_1F2123A90;
    *(void *)&long long v7 = siri::dialogengine::VariableObject::VariableObject(v6 + 3, &__p);
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

- (DEVariableObject)initWithSharedPtr:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DEVariableObject;
  id v4 = [(DEVariable *)&v10 init];
  v5 = v4;
  if (v4)
  {
    unint64_t v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    uint64_t v8 = *(void *)a3;
    uint64_t v9 = v6;
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

- (DEVariableObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)DEVariableObject;
  v2 = [(DEVariable *)&v6 init];
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8ne180100IN4siri12dialogengine14VariableObjectENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((siri::dialogengine::VariableObject **)&v4);
    long long v5 = v4;
    -[DEVariable setThis:](v2, "setThis:", &v5, 0, 0);
    if (*((void *)&v5 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v5 + 1));
    }
  }
  return v2;
}

@end