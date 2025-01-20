@interface KNOXBackendXPC
+ (BOOL)supportsSecureCoding;
- (DIURL)URL;
- (KNOXBackendXPC)initWithCoder:(id)a3;
- (KNOXBackendXPC)initWithURL:(id)a3 key:(void *)a4;
- (id).cxx_construct;
- (shared_ptr<unsigned)key;
- (void)encodeWithCoder:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation KNOXBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KNOXBackendXPC)initWithURL:(id)a3 key:(void *)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)KNOXBackendXPC;
  v8 = [(KNOXBackendXPC *)&v23 init];
  v9 = v8;
  if (v8)
  {
    p_key = &v8->_key;
    v12 = *(char **)a4;
    uint64_t v11 = *((void *)a4 + 1);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v8->_key.__cntrl_;
    p_key->__ptr_ = v12;
    v9->_key.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    objc_storeStrong((id *)&v9->_URL, a3);
    v14 = [(KNOXBackendXPC *)v9 URL];
    id v15 = [v14 absoluteString];
    v18 = (char *)[v15 UTF8String];
    std::allocate_shared[abi:ne180100]<std::string,std::allocator<std::string>,char const*,void>(&v18, &v19);
    int v17 = 0;
    std::allocate_shared[abi:ne180100]<Knoxbackend,std::allocator<Knoxbackend>,std::shared_ptr<std::string>,int,std::shared_ptr<unsigned char> &,void>((uint64_t)&v19, &v17, &v21);
    long long v22 = v21;
    long long v21 = 0uLL;
    [(BackendXPC *)v9 setBackend:&v22];
    if (*((void *)&v22 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v22 + 1));
    }
    if (*((void *)&v21 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v21 + 1));
    }
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
  }
  return v9;
}

- (KNOXBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KNOXBackendXPC;
  v5 = [(BackendXPC *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (DIURL *)v6;

    uint64_t v10 = 0;
    if ([v4 decodeBytesForKey:@"encKeys" returnedLength:&v10]
      && v10 == 32)
    {
      operator new[]();
    }
    v8 = 0;
  }
  else
  {
    v8 = (KNOXBackendXPC *)0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)KNOXBackendXPC;
  [(BackendXPC *)&v6 encodeWithCoder:v4];
  v5 = [(KNOXBackendXPC *)self URL];
  [v4 encodeObject:v5 forKey:@"URL"];

  [v4 encodeBytes:self->_key.__ptr_ length:32 forKey:@"encKeys"];
}

- (DIURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
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
  objc_storeStrong((id *)&self->_URL, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end