@interface ReadSynchronizerBackendXPC
+ (BOOL)supportsSecureCoding;
- (BackendXPC)baseBackendXPC;
- (ReadSynchronizerBackendXPC)initWithBackend:(id)a3;
- (ReadSynchronizerBackendXPC)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ReadSynchronizerBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ReadSynchronizerBackendXPC)initWithBackend:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ReadSynchronizerBackendXPC;
  v6 = [(ReadSynchronizerBackendXPC *)&v16 init];
  v7 = v6;
  if (v6)
  {
    p_baseBackendXPC = (id *)&v6->_baseBackendXPC;
    objc_storeStrong((id *)&v6->_baseBackendXPC, a3);
    if (*p_baseBackendXPC)
    {
      [*p_baseBackendXPC backend];
    }
    else
    {
      uint64_t v14 = 0;
      v15 = 0;
    }
    std::allocate_shared[abi:ne180100]<readSynchronizer,std::allocator<readSynchronizer>,std::shared_ptr<Backend> &,void>(&v12);
    uint64_t v10 = v12;
    v11 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(BackendXPC *)v7 setBackend:&v10];
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }

  return v7;
}

- (ReadSynchronizerBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ReadSynchronizerBackendXPC;
  id v5 = [(BackendXPC *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseBackend"];
    baseBackendXPC = v5->_baseBackendXPC;
    v5->_baseBackendXPC = (BackendXPC *)v6;

    v8 = v5->_baseBackendXPC;
    if (v8) {
      [(BackendXPC *)v8 backend];
    }
    else {
      uint64_t v10 = 0;
    }
    std::allocate_shared[abi:ne180100]<readSynchronizer,std::allocator<readSynchronizer>,std::shared_ptr<Backend>,void>(&v11);
    long long v12 = v11;
    long long v11 = 0uLL;
    [(BackendXPC *)v5 setBackend:&v12];
    if (*((void *)&v12 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v12 + 1));
    }
    if (*((void *)&v11 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v11 + 1));
    }
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ReadSynchronizerBackendXPC;
  [(BackendXPC *)&v6 encodeWithCoder:v4];
  id v5 = [(ReadSynchronizerBackendXPC *)self baseBackendXPC];
  [v4 encodeObject:v5 forKey:@"baseBackend"];
}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (void).cxx_destruct
{
}

@end