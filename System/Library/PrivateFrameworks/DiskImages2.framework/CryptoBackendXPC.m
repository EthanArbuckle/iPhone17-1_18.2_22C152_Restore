@interface CryptoBackendXPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isUnlocked;
- (BackendXPC)baseBackendXPC;
- (CryptoBackendXPC)initWithCoder:(id)a3;
- (CryptoBackendXPC)initWithFormat:(const void *)a3 baseBackendXPC:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)replaceWithBackendXPC:(id)a3;
@end

@implementation CryptoBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CryptoBackendXPC)initWithFormat:(const void *)a3 baseBackendXPC:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CryptoBackendXPC;
  v8 = [(CryptoBackendXPC *)&v16 init];
  v9 = v8;
  if (v8)
  {
    p_baseBackendXPC = (id *)&v8->_baseBackendXPC;
    objc_storeStrong((id *)&v8->_baseBackendXPC, a4);
    if (*p_baseBackendXPC)
    {
      [*p_baseBackendXPC backend];
    }
    else
    {
      uint64_t v12 = 0;
      v13 = 0;
    }
    std::allocate_shared[abi:ne180100]<crypto_format_backend,std::allocator<crypto_format_backend>,std::shared_ptr<Backend>,std::shared_ptr<crypto::format> const&,void>((uint64_t)&v12, (uint64_t)a3, &v14);
    long long v15 = v14;
    long long v14 = 0uLL;
    [(BackendXPC *)v9 setBackend:&v15];
    if (*((void *)&v15 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15 + 1));
    }
    if (*((void *)&v14 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v14 + 1));
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
  }

  return v9;
}

- (CryptoBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CryptoBackendXPC;
  v5 = [(BackendXPC *)&v19 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    crypto::format_serializer::decode(v4, (uint64_t *)[(BackendXPC *)v5 cryptoHeader], &v17);
    if (!v17)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &unk_26CF39EE0;
      uint64_t v12 = std::generic_category();
      exception[1] = 154;
      exception[2] = v12;
      *((unsigned char *)exception + 24) = 0;
      *((unsigned char *)exception + 48) = 0;
      exception[7] = "Failed to deserialize crypto format";
    }
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseBackend"];
    baseBackendXPC = v6->_baseBackendXPC;
    v6->_baseBackendXPC = (BackendXPC *)v7;

    v9 = v6->_baseBackendXPC;
    if (v9)
    {
      [(BackendXPC *)v9 backend];
    }
    else
    {
      uint64_t v13 = 0;
      long long v14 = 0;
    }
    std::allocate_shared[abi:ne180100]<crypto_format_backend,std::allocator<crypto_format_backend>,std::shared_ptr<Backend>,std::shared_ptr<crypto::format> &,void>((uint64_t)&v13, (uint64_t)&v17, &v15);
    long long v16 = v15;
    long long v15 = 0uLL;
    [(BackendXPC *)v6 setBackend:&v16];
    if (*((void *)&v16 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
    }
    if (*((void *)&v15 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15 + 1));
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (crypto::format_serializer *)a3;
  v11.receiver = self;
  v11.super_class = (Class)CryptoBackendXPC;
  [(BackendXPC *)&v11 encodeWithCoder:v4];
  [(BackendXPC *)self backend];
  v6 = *(NSCoder **)(v9 + 40);
  uint64_t v7 = *(std::__shared_weak_count **)(v9 + 48);
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  crypto::format_serializer::encode(v4, v6, v5);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  v8 = [(CryptoBackendXPC *)self baseBackendXPC];
  [(crypto::format_serializer *)v4 encodeObject:v8 forKey:@"baseBackend"];

  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v5 = a3;
  [(BackendXPC *)self backend];
  if (v5)
  {
    [v5 backend];
    long long v6 = v8;
  }
  else
  {
    long long v6 = 0uLL;
  }
  uint64_t v7 = *(std::__shared_weak_count **)(v9 + 32);
  *(_OWORD *)(v9 + 24) = v6;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  objc_storeStrong((id *)&self->_baseBackendXPC, a3);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

- (BOOL)isUnlocked
{
  return 1;
}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (void).cxx_destruct
{
}

@end