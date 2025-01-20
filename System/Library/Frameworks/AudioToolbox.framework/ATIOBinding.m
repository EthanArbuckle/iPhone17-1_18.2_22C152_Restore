@interface ATIOBinding
+ (BOOL)supportsSecureCoding;
- (ATIOBinding)initWithAudioSession:(id)a3;
- (ATIOBinding)initWithAudioSessionID:(unsigned int)a3;
- (ATIOBinding)initWithCoder:(id)a3;
- (ATIOBinding)initWithDeviceID:(unsigned int)a3;
- (ATIOBinding)initWithDeviceUID:(id)a3;
- (ATIOBinding)initWithImpl:(shared_ptr<const AT::IOBinding::Impl>)a3;
- (ATIOBinding)initWithUseCaseID:(ATIsolatedAudioUseCaseID)a3;
- (ATIsolatedAudioUseCaseID)useCaseID;
- (AVAudioSession)session;
- (BOOL)isEqual:(id)a3;
- (NSString)deviceUID;
- (id).cxx_construct;
- (id)description;
- (unsigned)deviceID;
- (unsigned)sessionID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATIOBinding

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->mImpl.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (ATIOBinding)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATIOBinding;
  v5 = [(ATIOBinding *)&v17 init];
  if (!v5) {
    goto LABEL_13;
  }
  id v6 = v4;
  int v7 = [v6 decodeIntForKey:@"variant"];
  if (v7 == 2)
  {
    v10 = [v6 decodeObjectForKey:@"deviceUID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      v12 = v11;
      if (v11) {
        CFRetain(v11);
      }
      applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v12);

      std::allocate_shared[abi:ne180100]<AT::IOBinding::Impl,std::allocator<AT::IOBinding::Impl>,applesauce::CF::StringRef,void>(&v16, &cf);
      if (cf) {
        CFRelease(cf);
      }

      goto LABEL_11;
    }

LABEL_15:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unable to decode ATIOBinding");
  }
  if (v7 != 3) {
    goto LABEL_15;
  }
  unsigned int v8 = [v6 decodeInt32ForKey:@"useCaseID"];
  v9 = operator new(0x48uLL);
  v9[1] = 0;
  v9[2] = 0;
  void *v9 = &unk_1EF72A718;
  AT::IOBinding::Impl::Impl((uint64_t)(v9 + 3), v8);
  *(void *)&long long v16 = v9 + 3;
  *((void *)&v16 + 1) = v9;
  std::shared_ptr<AT::IOBinding::Impl>::__enable_weak_this[abi:ne180100]<AT::IOBinding::Impl,AT::IOBinding::Impl,void>((uint64_t)&v16, (void *)v16, v16);
LABEL_11:

  v13 = (std::__shared_weak_count *)*((void *)v5 + 2);
  *(_OWORD *)(v5 + 8) = v16;
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
LABEL_13:

  return (ATIOBinding *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  ptr = self->mImpl.__ptr_;
  id v7 = a3;
  [v7 encodeInt:*((unsigned int *)ptr + 4) forKey:@"variant"];
  int v4 = *((_DWORD *)ptr + 4);
  if (v4 == 1)
  {
    uint64_t v5 = [*((id *)ptr + 3) opaqueSessionID];
    id v6 = @"sessionID";
LABEL_6:
    [v7 encodeInt32:v5 forKey:v6];
    goto LABEL_8;
  }
  if (v4 != 2)
  {
    if (v4 != 3) {
      goto LABEL_8;
    }
    uint64_t v5 = *((unsigned int *)ptr + 11);
    id v6 = @"useCaseID";
    goto LABEL_6;
  }
  [v7 encodeObject:*((void *)ptr + 4) forKey:@"deviceUID"];
LABEL_8:
}

- (ATIsolatedAudioUseCaseID)useCaseID
{
  return *(ATIsolatedAudioUseCaseID *)((char *)self->mImpl.__ptr_ + 44);
}

- (unsigned)deviceID
{
  return *((_DWORD *)self->mImpl.__ptr_ + 10);
}

- (NSString)deviceUID
{
  return (NSString *)*((id *)self->mImpl.__ptr_ + 4);
}

- (unsigned)sessionID
{
  return [*((id *)self->mImpl.__ptr_ + 3) opaqueSessionID];
}

- (AVAudioSession)session
{
  return (AVAudioSession *)*((id *)self->mImpl.__ptr_ + 3);
}

- (id)description
{
  AT::IOBinding::Impl::description((AT::IOBinding::Impl *)__p, (uint64_t)self->mImpl.__ptr_);
  if (v6 >= 0) {
    v2 = __p;
  }
  else {
    v2 = (void **)__p[0];
  }
  v3 = [NSString stringWithUTF8String:v2];
  if (v6 < 0) {
    operator delete(__p[0]);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ptr = self->mImpl.__ptr_;
    uint64_t v6 = v4[1];
    if (ptr) {
      BOOL v7 = AT::IOBinding::Impl::operator==((uint64_t)ptr, v6);
    }
    else {
      BOOL v7 = v6 == 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (ATIOBinding)initWithUseCaseID:(ATIsolatedAudioUseCaseID)a3
{
  std::allocate_shared[abi:ne180100]<AT::IOBinding::Impl,std::allocator<AT::IOBinding::Impl>,ATIsolatedAudioUseCaseID &,void>(&v6, a3.var0);
  cntrl = self->mImpl.__cntrl_;
  self->mImpl = v6;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  return self;
}

- (ATIOBinding)initWithDeviceID:(unsigned int)a3
{
  uint64_t v5 = (char *)operator new(0x48uLL);
  *(_OWORD *)(v5 + 8) = 0u;
  *(void *)uint64_t v5 = &unk_1EF72A718;
  *(_OWORD *)(v5 + 24) = 0u;
  *((_DWORD *)v5 + 10) = 2;
  *((void *)v5 + 6) = 0;
  uidOfDevice((applesauce::CF::StringRef *)(v5 + 56), a3);
  *((_DWORD *)v5 + 16) = a3;
  *((_DWORD *)v5 + 17) = 0;
  *(void *)&long long v8 = v5 + 24;
  *((void *)&v8 + 1) = v5;
  std::shared_ptr<AT::IOBinding::Impl>::__enable_weak_this[abi:ne180100]<AT::IOBinding::Impl,AT::IOBinding::Impl,void>((uint64_t)&v8, (void *)v8, v8);
  cntrl = self->mImpl.__cntrl_;
  self->mImpl = (shared_ptr<const AT::IOBinding::Impl>)v8;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  return self;
}

- (ATIOBinding)initWithDeviceUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    CFRetain(v4);
  }
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v5);

  std::allocate_shared[abi:ne180100]<AT::IOBinding::Impl,std::allocator<AT::IOBinding::Impl>,applesauce::CF::StringRef,void>(&v10, &cf);
  shared_ptr<const AT::IOBinding::Impl> v6 = v10;
  shared_ptr<const AT::IOBinding::Impl> v10 = (shared_ptr<const AT::IOBinding::Impl>)0;
  cntrl = self->mImpl.__cntrl_;
  self->mImpl = v6;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  if (cf) {
    CFRelease(cf);
  }

  return self;
}

- (ATIOBinding)initWithAudioSessionID:(unsigned int)a3
{
  return 0;
}

- (ATIOBinding)initWithAudioSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (char *)operator new(0x48uLL);
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)uint64_t v5 = &unk_1EF72A718;
  id v6 = v4;
  *((void *)v5 + 4) = 0;
  *((void *)v5 + 3) = 0;
  *((_DWORD *)v5 + 10) = 1;
  *((void *)v5 + 7) = 0;
  *((void *)v5 + 8) = 0;
  *((void *)v5 + 6) = v6;
  v9.__ptr_ = (Impl *)(v5 + 24);
  v9.__cntrl_ = (__shared_weak_count *)v5;
  std::shared_ptr<AT::IOBinding::Impl>::__enable_weak_this[abi:ne180100]<AT::IOBinding::Impl,AT::IOBinding::Impl,void>((uint64_t)&v9, (void *)v5 + 3, (uint64_t)(v5 + 24));
  cntrl = self->mImpl.__cntrl_;
  self->mImpl = v9;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }

  return self;
}

- (ATIOBinding)initWithImpl:(shared_ptr<const AT::IOBinding::Impl>)a3
{
  uint64_t v5 = *(Impl **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->mImpl.__cntrl_;
  self->mImpl.__ptr_ = v5;
  self->mImpl.__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end