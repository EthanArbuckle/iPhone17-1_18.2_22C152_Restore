@interface SparseBundleBackendXPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isUnlocked;
- (SparseBundleBackendXPC)initWithCoder:(id)a3;
- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4;
- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4 bandSize:(unint64_t)a5;
- (id)newWithCryptoFormat:(const void *)a3;
- (shared_ptr<Backend>)getCryptoHeaderBackend;
- (void)encodeWithCoder:(id)a3;
- (void)replaceWithBackendXPC:(id)a3;
@end

@implementation SparseBundleBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SparseBundleBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SparseBundleBackendXPC;
  v5 = [(BackendXPC *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle_handle"];
    int v15 = dup((int)[v6 fileDescriptor]);
    unsigned __int8 v14 = [v4 decodeBoolForKey:@"is_writable"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lock_backend"];
    v8 = v7;
    long long v13 = 0uLL;
    if (v7)
    {
      [v7 backend];
      long long v13 = v12;
    }
    sub_1000D2CCC(v4, (uint64_t *)[(BackendXPC *)v5 cryptoHeader], &v12);
    sub_1000D6954((unsigned int *)&v15, &v14, &v10);
    long long v11 = v10;
    long long v10 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v11, 0);
    if (*((void *)&v11 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v11 + 1));
    }
    if (*((void *)&v10 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v10 + 1));
    }
    if (*((void *)&v12 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v12 + 1));
    }
    if (*((void *)&v13 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v13 + 1));
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(BackendXPC *)self backend];
  uint64_t v6 = v16;
  v5 = v17;
  v15.receiver = self;
  v15.super_class = (Class)SparseBundleBackendXPC;
  [(BackendXPC *)&v15 encodeWithCoder:v4];
  id v7 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:(**(uint64_t (***)(void))(v6 + 24))()];
  [v4 encodeObject:v7 forKey:@"bundle_handle"];
  [v4 encodeBool:(*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6) forKey:@"is_writable"];
  v8 = *(void **)(v6 + 96);
  if (v8) {
    sub_1000D308C(v4, v8);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v6 + 192))(v6))
  {
    v9 = objc_alloc_init(FileLocalXPC);
    long long v10 = v9;
    uint64_t v12 = *(void *)(v6 + 80);
    long long v11 = *(std::__shared_weak_count **)(v6 + 88);
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v13 = v12;
    unsigned __int8 v14 = v11;
    [(BackendXPC *)v9 setBackend:&v13];
    if (v14) {
      sub_100004944(v14);
    }
    [v4 encodeObject:v10 forKey:@"lock_backend"];
  }
  if (v5) {
    sub_100004944(v5);
  }
}

- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4 bandSize:(unint64_t)a5
{
  id v8 = a3;
  int v16 = a4;
  unint64_t v15 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SparseBundleBackendXPC;
  v9 = [(SparseBundleBackendXPC *)&v14 init];
  if (v9)
  {
    long long v11 = (char *)[v8 fileSystemRepresentation];
    sub_1000D6AE8(&v11, &v16, &v15, &v12);
    long long v13 = v12;
    long long v12 = 0uLL;
    [(BackendXPC *)v9 setBackend:&v13];
    if (*((void *)&v13 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v13 + 1));
    }
    if (*((void *)&v12 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v12 + 1));
    }
  }

  return v9;
}

- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4
{
  id v6 = a3;
  int v13 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SparseBundleBackendXPC;
  id v7 = [(SparseBundleBackendXPC *)&v12 init];
  if (v7)
  {
    v9 = (char *)[v6 fileSystemRepresentation];
    sub_1000D6CA0(&v9, &v13, &v10);
    long long v11 = v10;
    long long v10 = 0uLL;
    [(BackendXPC *)v7 setBackend:&v11];
    if (*((void *)&v11 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v11 + 1));
    }
    if (*((void *)&v10 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v10 + 1));
    }
  }

  return v7;
}

- (shared_ptr<Backend>)getCryptoHeaderBackend
{
  v3 = v2;
  [(BackendXPC *)self backend];
  id v4 = (std::__shared_weak_count *)*((void *)&v7 + 1);
  sub_1000801D8((int *)v7, &v7);
  _OWORD *v3 = v7;
  if (v4) {
    sub_100004944(v4);
  }
  result.__cntrl_ = v6;
  result.__ptr_ = v5;
  return result;
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v4 = a3;
  [(BackendXPC *)self backend];
  v5 = v13;
  uint64_t v7 = *(void *)(v12 + 96);
  id v6 = *(std::__shared_weak_count **)(v12 + 104);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v11.receiver = self;
  v11.super_class = (Class)SparseBundleBackendXPC;
  [(BackendXPC *)&v11 replaceWithBackendXPC:v4];
  [(BackendXPC *)self backend];
  uint64_t v8 = v12;
  v9 = v13;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v10 = *(std::__shared_weak_count **)(v8 + 104);
  *(void *)(v8 + 96) = v7;
  *(void *)(v8 + 104) = v6;
  if (v10) {
    sub_100004944(v10);
  }
  if (v9) {
    sub_100004944(v9);
  }
  if (v6) {
    sub_100004944(v6);
  }
  if (v5) {
    sub_100004944(v5);
  }
}

- (BOOL)isUnlocked
{
  [(BackendXPC *)self backend];
  uint64_t v2 = *(void *)(v4 + 96);
  if (v5) {
    sub_100004944(v5);
  }
  return v2 != 0;
}

- (id)newWithCryptoFormat:(const void *)a3
{
  v5 = objc_alloc_init(SparseBundleBackendXPC);
  [(BackendXPC *)self backend];
  uint64_t v7 = v14;
  id v6 = v15;
  uint64_t v9 = *(void *)a3;
  uint64_t v8 = *((void *)a3 + 1);
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  long long v10 = *(std::__shared_weak_count **)(v14 + 104);
  *(void *)(v14 + 96) = v9;
  *(void *)(v7 + 104) = v8;
  if (v10) {
    sub_100004944(v10);
  }
  uint64_t v12 = v7;
  int v13 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(BackendXPC *)v5 setBackend:&v12];
  if (v13) {
    sub_100004944(v13);
  }
  if (v6) {
    sub_100004944(v6);
  }
  return v5;
}

@end