@interface AEABackendXPC
+ (BOOL)supportsSecureCoding;
- (AEABackendXPC)initWithBackend:(id)a3 key:(shared_ptr<unsigned char>)a4;
- (AEABackendXPC)initWithCoder:(id)a3;
- (BackendXPC)baseBackendXPC;
- (id).cxx_construct;
- (shared_ptr<unsigned)key;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AEABackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AEABackendXPC)initWithBackend:(id)a3 key:(shared_ptr<unsigned char>)a4
{
  ptr = a4.__ptr_;
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AEABackendXPC;
  v8 = [(AEABackendXPC *)&v18 init];
  v9 = v8;
  if (v8)
  {
    p_baseBackendXPC = (id *)&v8->_baseBackendXPC;
    objc_storeStrong((id *)&v8->_baseBackendXPC, a3);
    v12 = *(char **)ptr;
    uint64_t v11 = *((void *)ptr + 1);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v9->_key.__cntrl_;
    v9->_key.__ptr_ = v12;
    v9->_key.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    if (*p_baseBackendXPC) {
      [*p_baseBackendXPC backend];
    }
    else {
      v15 = 0;
    }
    std::allocate_shared[abi:ne180100]<AEA_backend,std::allocator<AEA_backend>,std::shared_ptr<Backend>,std::shared_ptr<unsigned char> &,void>(&v16);
    long long v17 = v16;
    long long v16 = 0uLL;
    [(BackendXPC *)v9 setBackend:&v17];
    if (*((void *)&v17 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
    }
    if (*((void *)&v16 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }

  return v9;
}

- (AEABackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEABackendXPC;
  v5 = [(BackendXPC *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v8 = 0;
    if ([v4 decodeBytesForKey:@"encKeys" returnedLength:&v8]
      && v8 == 32)
    {
      operator new[]();
    }
    v6 = 0;
  }
  else
  {
    v6 = (AEABackendXPC *)0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AEABackendXPC;
  [(BackendXPC *)&v6 encodeWithCoder:v4];
  [v4 encodeBytes:self->_key.__ptr_ length:32 forKey:@"encKeys"];
  v5 = [(AEABackendXPC *)self baseBackendXPC];
  [v4 encodeObject:v5 forKey:@"baseBackend"];
}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (shared_ptr<unsigned)key
{
  cntrl = self->_key.__cntrl_;
  *v2 = self->_key.__ptr_;
  v2[1] = (char *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (char *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_key.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_baseBackendXPC, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end