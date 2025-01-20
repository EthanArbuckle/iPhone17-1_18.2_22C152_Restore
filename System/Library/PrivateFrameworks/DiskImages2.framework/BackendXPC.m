@interface BackendXPC
+ (BOOL)supportsSecureCoding;
+ (id)newFileBackendWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5;
- (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5;
- (BOOL)isUnlocked;
- (BOOL)newUnlockBackendXPCValidateArgsWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6;
- (BOOL)tryCreatingCryptoHeader;
- (BackendXPC)initWithCoder:(id)a3;
- (NSUUID)instanceID;
- (id).cxx_construct;
- (id)description;
- (id)newUnlockedBackendXPCWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6;
- (id)newWithCryptoFormat:(const void *)a3;
- (int)lock;
- (keys)generateNewImageKeysWithPassphrase:(SEL)a3 privateKey:(const char *)a4 pubKeyHeader:(__SecKey *)a5 header_backend:(public_key_header *)a6;
- (shared_ptr<Backend>)backend;
- (shared_ptr<crypto::format>)makeCryptoFormatWithIsNewImage:(BOOL)a3 pass:(const char *)a4 certificate:(id)a5 error:(id *)a6;
- (void)cryptoHeader;
- (void)encodeWithCoder:(id)a3;
- (void)replaceWithBackendXPC:(id)a3;
- (void)setBackend:(shared_ptr<Backend>)a3;
@end

@implementation BackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BackendXPC)initWithCoder:(id)a3
{
  v4 = (crypto::header_serializer *)a3;
  v11.receiver = self;
  v11.super_class = (Class)BackendXPC;
  v5 = [(BackendXPC *)&v11 init];
  if (v5)
  {
    crypto::header_serializer::decode(v4, &v10);
    v6 = v10;
    v10 = 0;
    value = v5->_cryptoHeader.__ptr_.__value_;
    v5->_cryptoHeader.__ptr_.__value_ = v6;
    if (value)
    {
      MEMORY[0x223C249A0](value, 0x1000C4015A9971DLL);
      v8 = v10;
      v10 = 0;
      if (v8) {
        MEMORY[0x223C249A0](v8, 0x1000C4015A9971DLL);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  value = self->_cryptoHeader.__ptr_.__value_;
  if (value) {
    [v5 encodeBytes:value length:76 forKey:@"crypto_header"];
  }
}

- (int)lock
{
  [(BackendXPC *)self backend];
  get_sink_backend((uint64_t)&v4, &v6);
  std::dynamic_pointer_cast[abi:ne180100]<LockableResource,Backend>(&v6, (void **)&v8);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (v8) {
    int v2 = (**v8)(v8);
  }
  else {
    int v2 = 0;
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v2;
}

- (NSUUID)instanceID
{
  v9[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F08C38]);
  [(BackendXPC *)self backend];
  v9[0] = (*(uint64_t (**)())(*(void *)v7 + 160))();
  v9[1] = v4;
  id v5 = (void *)[v3 initWithUUIDBytes:v9];
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return (NSUUID *)v5;
}

- (BOOL)tryCreatingCryptoHeader
{
  [(BackendXPC *)self getCryptoHeaderBackend];
  if (v3 && (unint64_t)(*(uint64_t (**)())(*(void *)v3 + 40))() >= 0x4C) {
    operator new();
  }
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 0;
}

- (void)cryptoHeader
{
  return &self->_cryptoHeader;
}

- (id)description
{
  int v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v4 = a3;
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = &unk_26CF39EE0;
    v8 = std::generic_category();
    exception[1] = 22;
    exception[2] = v8;
    *((unsigned char *)exception + 24) = 0;
    *((unsigned char *)exception + 48) = 0;
    exception[7] = "Unexpected backend replace request";
  }
  if (v4)
  {
    [v4 backend];
    shared_ptr<Backend> v5 = v9;
  }
  else
  {
    shared_ptr<Backend> v5 = (shared_ptr<Backend>)0;
  }
  cntrl = self->_backend.__cntrl_;
  self->_backend = v5;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)newWithCryptoFormat:(const void *)a3
{
  shared_ptr<Backend> v5 = [CryptoBackendXPC alloc];
  return [(CryptoBackendXPC *)v5 initWithFormat:a3 baseBackendXPC:self];
}

- (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  BOOL v8 = +[DICryptoHelper createPublicKeyHeaderWithBackendXPC:publicKeyHeader:error:](DICryptoHelper, "createPublicKeyHeaderWithBackendXPC:publicKeyHeader:error:", self, a3);
  if (v8)
  {
    LOBYTE(v8) = +[DICryptoHelper getPrivateKeyWithHeader:a3 privateKey:a4 error:a5];
  }
  return v8;
}

- (keys)generateNewImageKeysWithPassphrase:(SEL)a3 privateKey:(const char *)a4 pubKeyHeader:(__SecKey *)a5 header_backend:(public_key_header *)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v11 = *(void *)a7.__ptr_;
  v12 = [(BackendXPC *)self cryptoHeader];
  if (a4)
  {
    return (keys *)crypto::keys::keys(retstr, v11, v12, a4);
  }
  else
  {
    unsigned int var0 = a6->var0.var0.var0;
    long long v15 = *(_OWORD *)a6->var0.var1.var0;
    long long v16 = *(_OWORD *)&a6->var0.var1.var0[16];
    long long v17 = *(_OWORD *)&a6->var1.var0;
    memcpy(v18, &a6->var4.var1, sizeof(v18));
    return (keys *)crypto::keys::keys(retstr, v11, v12, a5, &var0);
  }
}

- (BOOL)newUnlockBackendXPCValidateArgsWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  unint64_t v9 = (unint64_t)a4;
  v10 = (void *)v9;
  if ((unint64_t)a3 | v9)
  {
    if (!v9)
    {
      if (!a3 || !*a3)
      {
        uint64_t v11 = @"Passphrase cannot be empty";
        goto LABEL_11;
      }
      if (strnlen(a3, 0x101uLL) >= 0x101)
      {
        uint64_t v11 = @"Passphrase is too long";
LABEL_11:
        BOOL v12 = +[DIError failWithPOSIXCode:22 description:v11 error:a6];
        goto LABEL_12;
      }
    }
  }
  else if (v7)
  {
    BOOL v12 = +[DIError failWithOSStatus:22 description:@"Certificate cannot be empty" error:a6];
LABEL_12:
    BOOL v13 = v12;
    goto LABEL_13;
  }
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (shared_ptr<crypto::format>)makeCryptoFormatWithIsNewImage:(BOOL)a3 pass:(const char *)a4 certificate:(id)a5 error:(id *)a6
{
  BOOL v9 = a3;
  uint64_t v11 = v6;
  uint64_t v45 = *MEMORY[0x263EF8340];
  v37 = a4;
  id v12 = a5;
  [(BackendXPC *)self getCryptoHeaderBackend];
  if (!v35)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = &unk_26CF39EE0;
    v24 = std::generic_category();
    exception[1] = 4294967291;
    exception[2] = v24;
    *((unsigned char *)exception + 24) = 0;
    *((unsigned char *)exception + 48) = 0;
    exception[7] = "Failed opening the crypto header backend";
  }
  if (v9)
  {
    v26 = 0;
    if (+[DICryptoHelper getPublicKeyWithCertificate:v12 key:&v26 error:a6])
    {
      BOOL v13 = v26;
      if ((unint64_t)a4 | (unint64_t)v26)
      {
        v14 = [(BackendXPC *)self cryptoHeader];
        std::allocate_shared[abi:ne180100]<crypto::format,std::allocator<crypto::format>,std::unique_ptr<crypto::header>,Backend &,char const*&,__SecKey *&,void>((uint64_t)v14, v35, &v37, &v26, v43);
        long long v25 = *(_OWORD *)v43;

LABEL_25:
        *(_OWORD *)uint64_t v11 = v25;
        goto LABEL_28;
      }
      id v20 = +[DIError nilWithPOSIXCode:22 description:@"No passphrase or certificate was supplied." error:a6];
    }
  }
  else
  {
    LOBYTE(v43[0]) = 0;
    v44[512] = 0;
    v34 = 0;
    if (a4)
    {
      crypto::keys::keys(&v26, v35, [(BackendXPC *)self cryptoHeader], a4);
      std::allocate_shared[abi:ne180100]<crypto::format,std::allocator<crypto::format>,crypto::keys,void>(&v33);
      long long v25 = v33;
      long long v33 = 0uLL;
      if (__p)
      {
        v32 = __p;
        operator delete(__p);
      }
      uint64_t v15 = v30;
      uint64_t v30 = 0;
      if (v15) {
        MEMORY[0x223C249A0](v15, 0x1000C4015A9971DLL);
      }
      if (v28)
      {
        v29 = v28;
        operator delete(v28);
      }
      if (v26)
      {
        v27 = v26;
        operator delete(v26);
      }
      goto LABEL_25;
    }
    if ([(BackendXPC *)self getPrivateKeyWithHeader:v43 privateKey:&v34 error:a6])
    {
      long long v17 = v34;
      uint64_t v16 = v35;
      v18 = [(BackendXPC *)self cryptoHeader];
      int v38 = v43[0];
      long long v39 = *(_OWORD *)&v43[1];
      long long v40 = *(_OWORD *)&v43[5];
      long long v41 = *(_OWORD *)&v43[9];
      memcpy(v42, v44, sizeof(v42));
      crypto::keys::keys(&v26, v16, v18, v34, &v38);
      std::allocate_shared[abi:ne180100]<crypto::format,std::allocator<crypto::format>,crypto::keys,void>(&v33);
      long long v25 = v33;
      long long v33 = 0uLL;
      if (__p)
      {
        v32 = __p;
        operator delete(__p);
      }
      uint64_t v19 = v30;
      uint64_t v30 = 0;
      if (v19) {
        MEMORY[0x223C249A0](v19, 0x1000C4015A9971DLL);
      }
      if (v28)
      {
        v29 = v28;
        operator delete(v28);
      }
      if (v26)
      {
        v27 = v26;
        operator delete(v26);
      }

      goto LABEL_25;
    }
  }
  *(void *)uint64_t v11 = 0;
  *(void *)(v11 + 8) = 0;
LABEL_28:
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }

  result.var1 = v22;
  result.unsigned int var0 = v21;
  return result;
}

- (id)newUnlockedBackendXPCWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  if ([(BackendXPC *)self newUnlockBackendXPCValidateArgsWithPassphrase:a3 certificate:v10 isNewImage:v7 error:a6])
  {
    [(BackendXPC *)self makeCryptoFormatWithIsNewImage:v7 pass:a3 certificate:v10 error:a6];
    if (v13) {
      id v11 = [(BackendXPC *)self newWithCryptoFormat:&v13];
    }
    else {
      id v11 = 0;
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)isUnlocked
{
  return 0;
}

+ (id)newFileBackendWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (stat((const char *)[v7 fileSystemRepresentation], &v16))
  {
    uint64_t v8 = +[DIError nilWithPOSIXCode:*__error() verboseInfo:@"stat failed" error:a5];
  }
  else
  {
    int v9 = *__error();
    if (DIForwardLogs())
    {
      id v10 = getDIOSLog();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      int v18 = 56;
      __int16 v19 = 2080;
      *(_DWORD *)buf = 68159746;
      id v20 = "+[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]";
      __int16 v21 = 1024;
      dev_t st_dev = v16.st_dev;
      __int16 v23 = 2048;
      __darwin_ino64_t st_ino = v16.st_ino;
      __int16 v25 = 1024;
      int st_mode = v16.st_mode;
      __int16 v27 = 1024;
      uid_t st_uid = v16.st_uid;
      __int16 v29 = 1024;
      gid_t st_gid = v16.st_gid;
      __int16 v31 = 2048;
      off_t st_size = v16.st_size;
      __int16 v33 = 2048;
      blkcnt_t st_blocks = v16.st_blocks;
      id v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      id v12 = getDIOSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 56;
        __int16 v19 = 2080;
        *(_DWORD *)buf = 68159746;
        id v20 = "+[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]";
        __int16 v21 = 1024;
        dev_t st_dev = v16.st_dev;
        __int16 v23 = 2048;
        __darwin_ino64_t st_ino = v16.st_ino;
        __int16 v25 = 1024;
        int st_mode = v16.st_mode;
        __int16 v27 = 1024;
        uid_t st_uid = v16.st_uid;
        __int16 v29 = 1024;
        gid_t st_gid = v16.st_gid;
        __int16 v31 = 2048;
        off_t st_size = v16.st_size;
        __int16 v33 = 2048;
        blkcnt_t st_blocks = v16.st_blocks;
        _os_log_impl(&dword_21E237000, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Image file stat: dev(0x%x), inode(%lld), mode(%o), uid(%d), gid(%d), size(%lld), blocks(%lld)", buf, 0x48u);
      }
    }
    *__error() = v9;
    if ((v16.st_mode & 0xF000) == 0x4000) {
      uint64_t v13 = &off_2644A1EF8;
    }
    else {
      uint64_t v13 = &off_2644A1DB0;
    }
    uint64_t v8 = [objc_alloc(*v13) initWithURL:v7 fileOpenFlags:v6];
  }
  v14 = (void *)v8;

  return v14;
}

- (shared_ptr<Backend>)backend
{
  cntrl = self->_backend.__cntrl_;
  *int v2 = self->_backend.__ptr_;
  v2[1] = (Backend *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Backend *)self;
  return result;
}

- (void)setBackend:(shared_ptr<Backend>)a3
{
  id v4 = *(Backend **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_backend.__cntrl_;
  self->_backend.__ptr_ = v4;
  self->_backend.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void).cxx_destruct
{
  cntrl = self->_backend.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  value = self->_cryptoHeader.__ptr_.__value_;
  self->_cryptoHeader.__ptr_.__value_ = 0;
  if (value)
  {
    JUMPOUT(0x223C249A0);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end