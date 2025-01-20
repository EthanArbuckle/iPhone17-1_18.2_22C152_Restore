@interface RamXPC
+ (BOOL)supportsSecureCoding;
- (RamXPC)initWithCoder:(id)a3;
- (RamXPC)initWithSize:(unint64_t)a3;
- (id)description;
- (void)createRamBackend;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RamXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RamXPC)initWithSize:(unint64_t)a3
{
  unint64_t v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RamXPC;
  v3 = [(RamXPC *)&v7 init];
  if (v3)
  {
    std::allocate_shared[abi:ne180100]<BackendNull,std::allocator<BackendNull>,unsigned long long &,void>((uint64_t *)&v8, &v5);
    long long v6 = v5;
    long long v5 = 0uLL;
    -[BackendXPC setBackend:](v3, "setBackend:", &v6, 0);
    if (*((void *)&v6 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
    }
    if (*((void *)&v5 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v5 + 1));
    }
  }
  return v3;
}

- (void)createRamBackend
{
  v11[2] = *MEMORY[0x263EF8340];
  [(BackendXPC *)self backend];
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9);
  [(BackendXPC *)self backend];
  v11[0] = (*(uint64_t (**)())(*(void *)v4 + 160))();
  v11[1] = v3;
  std::allocate_shared[abi:ne180100]<Ram,std::allocator<Ram>,unsigned long long,boost::uuids::uuid,void>((size_t *)&v6, v11, &v7);
  long long v8 = v7;
  long long v7 = 0uLL;
  [(BackendXPC *)self setBackend:&v8];
  if (*((void *)&v8 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
  }
  if (*((void *)&v7 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v7 + 1));
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

- (RamXPC)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RamXPC;
  long long v5 = [(BackendXPC *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v10 = [v4 decodeInt64ForKey:@"size"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [v6 getUUIDBytes:v12];
    std::allocate_shared[abi:ne180100]<BackendNull,std::allocator<BackendNull>,unsigned long long &,boost::uuids::uuid &,void>(&v10, v12, &v8);
    long long v9 = v8;
    long long v8 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v9, 0);
    if (*((void *)&v9 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v9 + 1));
    }
    if (*((void *)&v8 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RamXPC;
  [(BackendXPC *)&v8 encodeWithCoder:v4];
  [(BackendXPC *)self backend];
  [v4 encodeInt64:(*(uint64_t (**)())(*(void *)v6 + 40))() forKey:@"size"];
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  long long v5 = [(BackendXPC *)self instanceID];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)RamXPC;
  id v4 = [(BackendXPC *)&v9 description];
  [(BackendXPC *)self backend];
  long long v5 = [v3 stringWithFormat:@"%@[ramsize=%llu]", v4, (*(uint64_t (**)())(*(void *)v7 + 40))()];
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }

  return v5;
}

@end