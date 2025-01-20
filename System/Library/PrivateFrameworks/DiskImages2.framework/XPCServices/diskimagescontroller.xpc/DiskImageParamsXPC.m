@interface DiskImageParamsXPC
+ (BOOL)getAEAKeyFromSAKSWithMetadata:(id)a3 key:(char *)a4 error:(id *)a5;
+ (BOOL)getAEAKeyWithHelper:(void *)a3 keyBuffer:(char *)a4 bufferSize:(unint64_t)a5 error:(id *)a6;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateSupportedFormatWithBackendXPC:(id)a3 error:(id *)a4;
+ (id)createAEABackendWithBackendXPC:(id)a3 error:(id *)a4;
+ (id)newWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5;
+ (id)newWithUnlockedBackendXPC:(id)a3 error:(id *)a4;
+ (id)tryCreateAEABackendWithBackendXPC:(id)a3 error:(id *)a4;
- (BOOL)allowOnDiskCacheWithSinkDiskImage:(const void *)a3;
- (BOOL)isSparseFormat;
- (BOOL)isWritableFormat;
- (BOOL)lockBackendsWithError:(id *)a3;
- (BOOL)lockBackendsWithWritableOnly:(BOOL)a3 error:(id *)a4;
- (BOOL)lockWritableBackendsWithError:(id *)a3;
- (BOOL)makeNewImageEncryptedWithCertificate:(id)a3 error:(id *)a4;
- (BOOL)makeNewImageEncryptedWithPassphrase:(const char *)a3 certificate:(id)a4 error:(id *)a5;
- (BOOL)mountedOnAPFS;
- (BackendXPC)backendXPC;
- (BackendXPC)cacheBackendXPC;
- (DIShadowChain)shadowChain;
- (DiskImageParamsXPC)initWithBackendXPC:(id)a3;
- (DiskImageParamsXPC)initWithBackendXPC:(id)a3 blockSize:(unint64_t)a4;
- (DiskImageParamsXPC)initWithCoder:(id)a3;
- (NSURL)cacheURL;
- (NSUUID)instanceID;
- (id)description;
- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4;
- (shared_ptr<DiskImage>)createShadowDiskImageWithBackend:(shared_ptr<Backend>)a3 numBlocks:(unint64_t)a4 sinkDiskImage:(const void *)a5 cache_only:(BOOL)a6 stack_size:(unint64_t)a7;
- (unint64_t)blockSize;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createDiskImageWithCache:(BOOL)a3 shadowValidation:(BOOL)a4;
- (unique_ptr<DiskImage,)createSinkDiskImage;
- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBackendXPC:(id)a3;
- (void)setBlockSize:(unint64_t)a3;
- (void)setCacheBackendXPC:(id)a3;
- (void)setCacheURL:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setShadowChain:(id)a3;
@end

@implementation DiskImageParamsXPC

+ (id)newWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5
{
  v6 = *(DiskImageParamsPlugin_XPC **)&a4;
  id v7 = a3;
  v8 = [v7 scheme];
  unsigned int v9 = [v8 isEqualToString:@"ram"];

  if (v9)
  {
    v10 = 0;
    v11 = [[DiskImageParamsRAM_XPC alloc] initWithURL:v7 error:a5];
LABEL_3:
    v6 = (DiskImageParamsPlugin_XPC *)v11;
    goto LABEL_4;
  }
  v13 = [v7 scheme];
  unsigned int v14 = [v13 isEqualToString:@"knox"];

  if (v14) {
    operator new[]();
  }
  if (![v7 isFileURL])
  {
    v18 = [v7 scheme];
    unsigned int v19 = [v18 isEqualToString:@"plugin"];

    if (v19)
    {
      v20 = [[PluginBackendXPC alloc] initWithURL:v7 openMode:v6];
      v6 = [(DiskImageParamsXPC *)[DiskImageParamsPlugin_XPC alloc] initWithBackendXPC:v20];
      v10 = v20;
      goto LABEL_4;
    }
    v10 = 0;
    v11 = +[DIError nilWithPOSIXCode:22 description:@"Unsupported URL scheme" error:a5];
    goto LABEL_3;
  }
  v10 = +[BackendXPC newFileBackendWithURL:v7 fileOpenFlags:v6 error:a5];
  if (!v10)
  {
    v6 = 0;
    goto LABEL_4;
  }
  int v15 = *__error();
  if (sub_1000D850C())
  {
    v27 = 0;
    v16 = sub_1000D848C();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    v17 = [v7 path];
    *(_DWORD *)buf = 68158467;
    *(_DWORD *)&buf[4] = 53;
    *(_WORD *)v30 = 2080;
    *(void *)&v30[2] = "+[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]";
    __int16 v31 = 2113;
    v32 = v17;
    __int16 v33 = 1024;
    int v34 = (int)v6;
    LODWORD(v26) = 34;
    v25 = buf;
    v6 = (DiskImageParamsPlugin_XPC *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf(__stderrp, "%s\n", (const char *)v6);
      free(v6);
    }
  }
  else
  {
    v21 = sub_1000D848C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v7 path];
      *(_DWORD *)buf = 68158467;
      *(_DWORD *)&buf[4] = 53;
      *(_WORD *)v30 = 2080;
      *(void *)&v30[2] = "+[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]";
      __int16 v31 = 2113;
      v32 = v22;
      __int16 v33 = 1024;
      int v34 = (int)v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%.*s: Image file %{private}@ opened with flags %d", buf, 0x22u);
    }
  }
  *__error() = v15;
  [(BackendXPC *)v10 backend];
  sub_100059160(&v27, (void **)buf);
  if (v28) {
    sub_100004944(v28);
  }
  if (*(void *)buf && sub_100127B48(*(void *)(*(void *)buf + 40)))
  {
    v23 = [DiskImageParamsRaw_XPC alloc];
    v6 = [(DiskImageParamsXPC *)v23 initWithBackendXPC:v10 blockSize:*(void *)(*(void *)(*(void *)buf + 40) + 24)];
    char v24 = 0;
  }
  else
  {
    char v24 = 1;
  }
  if (*(void *)v30) {
    sub_100004944(*(std::__shared_weak_count **)v30);
  }
  if (v24)
  {
    if ([(BackendXPC *)v10 tryCreatingCryptoHeader]) {
      v11 = [[DiskImageParamsLocked_XPC alloc] initWithBackendXPC:v10];
    }
    else {
      v11 = +[DiskImageParamsXPC newWithUnlockedBackendXPC:v10 error:a5];
    }
    goto LABEL_3;
  }
LABEL_4:

  return v6;
}

+ (BOOL)validateSupportedFormatWithBackendXPC:(id)a3 error:(id *)a4
{
  id v4 = a3;
  if (v4) {
    [v4 backend];
  }
  operator new();
}

+ (BOOL)getAEAKeyFromSAKSWithMetadata:(id)a3 key:(char *)a4 error:(id *)a5
{
  id v7 = a3;
  BOOL v8 = +[DIKeyRetriever decryptKeyWithData:v7 destKey:v11 destKeySize:88 error:a5];
  if (v8)
  {
    CC_LONG v9 = strnlen(v11, 0x58uLL);
    CC_SHA256(v11, v9, (unsigned __int8 *)a4);
  }

  return v8;
}

+ (BOOL)getAEAKeyWithHelper:(void *)a3 keyBuffer:(char *)a4 bufferSize:(unint64_t)a5 error:(id *)a6
{
  v11 = a4;
  id v12 = a1;
  CC_LONG v9 = a6;
  unint64_t v10 = a5;
  v8[0] = &v11;
  v8[1] = &v10;
  v8[2] = &v9;
  v8[3] = &v12;
  v8[4] = &v11;
  v8[5] = &v9;
  v8[6] = &v11;
  v8[7] = &v10;
  v8[8] = &v9;
  v8[9] = &v11;
  v8[10] = &v10;
  uint64_t v6 = *((unsigned int *)a3 + 10);
  if (v6 == -1) {
    sub_1000289E8();
  }
  v13 = v8;
  return ((uint64_t (*)(void **, char *))off_1001B1638[v6])(&v13, (char *)a3 + 8);
}

+ (id)createAEABackendWithBackendXPC:(id)a3 error:(id *)a4
{
  id v4 = a3;
  if (v4)
  {
    [v4 backend];
    long long v5 = v7[0];
  }
  else
  {
    long long v5 = 0uLL;
  }
  long long v8 = v5;
  sub_10010B0F0(v7, &v8);
  operator new[]();
}

+ (id)tryCreateAEABackendWithBackendXPC:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 backend];
  }
  else
  {
    v13 = 0;
    unsigned int v14 = 0;
  }
  sub_100059160(&v13, &v15);
  if (v14) {
    sub_100004944(v14);
  }
  if (!v15) {
    goto LABEL_9;
  }
  int v7 = (*(uint64_t (**)(void *))(*(void *)v15 + 176))(v15);
  AAByteStream v17 = AAFileStreamOpenWithFD(v7, 0);
  sub_100110034(&v13, &v17);
  if (sub_100110068((AAByteStream *)&v13, &v17, 4uLL, 0) < 0)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = &off_1001C3DE8;
    id v12 = std::generic_category();
    exception[1] = 22;
    exception[2] = v12;
    *((unsigned char *)exception + 24) = 0;
    *((unsigned char *)exception + 48) = 0;
    exception[7] = "is_aea: Error reading magic.";
  }
  int v8 = (int)v17;
  sub_100110038((AAByteStream *)&v13);
  if (v8 == 826361153)
  {
    +[DiskImageParamsXPC createAEABackendWithBackendXPC:v6 error:a4];
    v6 = CC_LONG v9 = v6;
  }
  else
  {
LABEL_9:
    CC_LONG v9 = 0;
  }
  if (v16) {
    sub_100004944(v16);
  }

  return v6;
}

+ (id)newWithUnlockedBackendXPC:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [(DiskImageParamsXPC *)[DiskImageParamsSparseBundle_XPC alloc] initWithBackendXPC:v6];
    int v8 = v6;
  }
  else
  {
    int v8 = [a1 tryCreateAEABackendWithBackendXPC:v6 error:a4];

    if (v8)
    {
      [v8 backend];
      operator new();
    }
    int v7 = 0;
  }

  return v7;
}

- (NSURL)cacheURL
{
  v3 = [(DiskImageParamsXPC *)self shadowChain];
  unsigned int v4 = [v3 hasBaseImageCache];

  if (v4)
  {
    id v5 = [(DiskImageParamsXPC *)self shadowChain];
    id v6 = [v5 nodes];
    int v7 = [v6 firstObject];
    int v8 = [v7 URL];
    cacheURL = self->_cacheURL;
    self->_cacheURL = v8;
  }
  unint64_t v10 = self->_cacheURL;
  return v10;
}

- (BOOL)makeNewImageEncryptedWithCertificate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [(DiskImageParamsXPC *)self backendXPC];
  id v8 = [v7 newUnlockedBackendXPCWithPassphrase:0 certificate:v6 isNewImage:1 error:a4];
  [(DiskImageParamsXPC *)self setBackendXPC:v8];

  CC_LONG v9 = [(DiskImageParamsXPC *)self backendXPC];
  LOBYTE(a4) = v9 != 0;

  return (char)a4;
}

- (BOOL)makeNewImageEncryptedWithPassphrase:(const char *)a3 certificate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  CC_LONG v9 = [(DiskImageParamsXPC *)self backendXPC];
  id v10 = [v9 newUnlockedBackendXPCWithPassphrase:a3 certificate:v8 isNewImage:1 error:a5];
  [(DiskImageParamsXPC *)self setBackendXPC:v10];

  v11 = [(DiskImageParamsXPC *)self backendXPC];
  LOBYTE(a5) = v11 != 0;

  return (char)a5;
}

- (DiskImageParamsXPC)initWithBackendXPC:(id)a3 blockSize:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DiskImageParamsXPC;
  id v8 = [(DiskImageParamsXPC *)&v11 init];
  CC_LONG v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backendXPC, a3);
    v9->_blockSize = a4;
  }

  return v9;
}

- (DiskImageParamsXPC)initWithBackendXPC:(id)a3
{
  return [(DiskImageParamsXPC *)self initWithBackendXPC:a3 blockSize:512];
}

- (shared_ptr<DiskImage>)createShadowDiskImageWithBackend:(shared_ptr<Backend>)a3 numBlocks:(unint64_t)a4 sinkDiskImage:(const void *)a5 cache_only:(BOOL)a6 stack_size:(unint64_t)a7
{
  unint64_t v8 = a6;
  int v9 = (int)a5;
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v13 = v7;
  if ((*(uint64_t (**)(unint64_t, SEL))(*(void *)a4 + 24))(a4, a2) != 512)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    sub_100003404((uint64_t)v35);
    sub_1000039A0(v35, (uint64_t)"Shadow file cannot be used with a ", 34);
    (*(void (**)(unint64_t))(*(void *)a4 + 24))(a4);
    std::ostream::operator<<();
    sub_1000039A0(v35, (uint64_t)"-bytes block size", 17);
    sub_10000550C((uint64_t)exception, (uint64_t)v35, 0x13u);
  }
  char v30 = 0;
  *(_DWORD *)&v31[7] = 0;
  *(void *)__int16 v31 = 256;
  int v14 = *((_DWORD *)sub_10004CDB8() + 8);
  *(_DWORD *)&v31[3] = (v14 - (v8 > 3)) & ~((v14 - (v8 > 3)) >> 31);
  v31[7] = 1;
  if (!(*(uint64_t (**)(void))(**(void **)ptr + 40))())
  {
    unint64_t v29 = 0;
    unint64_t v18 = 0x10000000000000uLL / (*(uint64_t (**)(unint64_t))(*(void *)a4 + 24))(a4);
    v28 = 0;
    unint64_t v29 = v18;
    if (!cntrl)
    {
      cntrl = (__shared_weak_count *)(*(uint64_t (**)(unint64_t))(*(void *)a4 + 32))(a4);
      unint64_t v18 = v29;
    }
    v28 = cntrl;
    if ((unint64_t)cntrl <= v18)
    {
      v35[0] = sub_10014B80C();
      v35[1] = v19;
      uint64_t v33 = sub_10006DC94((uint64_t (***)(void))a4);
      uint64_t v34 = v20;
      uint64_t v27 = (*(uint64_t (**)(unint64_t))(*(void *)a4 + 24))(a4);
      v31[0] = v9;
      if (v9) {
        v21 = &v33;
      }
      else {
        v21 = v35;
      }
      sub_1000AB768((uint64_t)&v32, (unsigned __int16 *)&v27, &dword_100172B68, (unint64_t *)&v28, &v29, ptr, (uint64_t *)&v30, v21);
    }
    v25 = __cxa_allocate_exception(0x40uLL);
    void *v25 = &off_1001C3DE8;
    uint64_t v26 = std::generic_category();
    v25[1] = 22;
    v25[2] = v26;
    *((unsigned char *)v25 + 24) = 0;
    *((unsigned char *)v25 + 48) = 0;
    v25[7] = "Size cannot exceed max ASIF size";
  }
  sub_1000EDA68(v35, *(void *)ptr);
  int v15 = (DiskImage *)sub_1000AB5C4((uint64_t *)ptr, (uint64_t)v35, (uint64_t)&v30, &v33);
  if (((((*(unsigned char *)(v33 + 44) & 1) == 0) ^ v9) & 1) == 0)
  {
    v23 = __cxa_allocate_exception(0x40uLL);
    void *v23 = &off_1001C3DE8;
    char v24 = std::generic_category();
    v23[1] = 22;
    v23[2] = v24;
    *((unsigned char *)v23 + 24) = 0;
    *((unsigned char *)v23 + 48) = 0;
    v23[7] = "Shadow/cache file mismatches the cache file attribute";
  }
  uint64_t v17 = v34;
  uint64_t *v13 = v33;
  v13[1] = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (BOOL)allowOnDiskCacheWithSinkDiskImage:(const void *)a3
{
  v3 = [(DiskImageParamsXPC *)self shadowChain];
  unsigned __int8 v4 = [v3 hasBaseImageCache];

  if ((v4 & 1) == 0)
  {
    int v5 = *__error();
    if (sub_1000D850C())
    {
      id v6 = sub_1000D848C();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v11 = 56;
      __int16 v12 = 2080;
      v13 = "-[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:]";
      id v7 = (char *)_os_log_send_and_compose_impl();

      if (v7)
      {
        fprintf(__stderrp, "%s\n", v7);
        free(v7);
      }
    }
    else
    {
      unint64_t v8 = sub_1000D848C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v11 = 56;
        __int16 v12 = 2080;
        v13 = "-[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%.*s: On disk cache is not supported on embedded systems", buf, 0x12u);
      }
    }
    *__error() = v5;
  }
  return 0;
}

- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v6 = v4;
  [(DiskImageParamsXPC *)self createDiskImageWithCache:0 shadowValidation:0];
  uint64_t v7 = v10;
  if (v5) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = 0;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)v10 + 48))(&v10, v10, v8);
  void *v6 = v10;
  return (unique_ptr<const info::DiskImageInfo, std::default_delete<const info::DiskImageInfo>>)(*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
}

- (unique_ptr<DiskImage,)createDiskImageWithCache:(BOOL)a3 shadowValidation:(BOOL)a4
{
  BOOL v5 = a3;
  v50 = v4;
  [(DiskImageParamsXPC *)self createSinkDiskImage];
  if (v5) {
    unsigned int v51 = [(DiskImageParamsXPC *)self allowOnDiskCacheWithSinkDiskImage:&v69];
  }
  else {
    unsigned int v51 = 0;
  }
  uint64_t v6 = [(DiskImageParamsXPC *)self shadowChain];
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    uint64_t v8 = [(DiskImageParamsXPC *)self shadowChain];
    unsigned int v9 = [v8 isEmpty];

    if ((v9 ^ 1 | v51)) {
      goto LABEL_6;
    }
  }
  else if (v51)
  {
LABEL_6:
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    unint64_t v49 = v69;
    if (v69) {
      operator new();
    }
    unint64_t v69 = 0;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v10 = [(DiskImageParamsXPC *)self shadowChain];
    id obj = [v10 nodes];

    id v11 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v63;
      unint64_t v13 = 0;
      v53 = 0;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v63 != v12) {
            objc_enumerationMutation(obj);
          }
          int v15 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v16 = [v15 fileBackend];
          uint64_t v17 = v16;
          if (v16)
          {
            [v16 backend];
          }
          else
          {
            uint64_t v60 = 0;
            v61 = 0;
          }
          id v18 = [v15 numBlocks];
          id v19 = [v15 isCache];
          uint64_t v20 = [(DiskImageParamsXPC *)self shadowChain];
          v21 = [v20 nodes];
          -[DiskImageParamsXPC createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:](self, "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:", &v60, v18, v13, v19, (char *)[v21 count] + 1);

          if (v61) {
            sub_100004944(v61);
          }

          unsigned __int8 v22 = [v15 isCache];
          unint64_t v23 = *(void *)buf;
          if (v22)
          {
            int v24 = 2;
          }
          else
          {
            int v25 = (*(uint64_t (**)(void))(**(void **)buf + 40))(*(void *)buf);
            unint64_t v13 = *(void *)buf;
            uint64_t v26 = *(std::__shared_weak_count **)&buf[8];
            if (*(void *)&buf[8]) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
            }
            int v24 = v25 ^ 1;
            if (v53)
            {
              sub_100004944(v53);
              unint64_t v23 = *(void *)buf;
            }
            else
            {
              unint64_t v23 = v13;
            }
            v53 = v26;
          }
          v74.n128_u64[0] = v23;
          v74.n128_u64[1] = *(void *)&buf[8];
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = 0;
          int v75 = v24;
          sub_1000A70B4(&v66, v66, &v74);
          if (v74.n128_u64[1]) {
            sub_100004944((std::__shared_weak_count *)v74.n128_u64[1]);
          }
          if (*(void *)&buf[8]) {
            sub_100004944(*(std::__shared_weak_count **)&buf[8]);
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
      }
      while (v11);
    }

    if (v51)
    {
      if (!confstr(65538, (char *)&v74, 0x400uLL))
      {
        exception = __cxa_allocate_exception(0x40uLL);
        void *exception = &off_1001C3DE8;
        v46 = std::generic_category();
        exception[1] = 2;
        exception[2] = v46;
        *((unsigned char *)exception + 24) = 0;
        *((unsigned char *)exception + 48) = 0;
        exception[7] = "Could not determine cache dir";
      }
      uint64_t v72 = 0;
      uint64_t v73 = 0;
      uint64_t v72 = sub_10006DC94(0);
      uint64_t v73 = v27;
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = 0;
      if (v72 | v27)
      {
        id v28 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v72];
      }
      else
      {
        id v28 = [(DiskImageParamsXPC *)self instanceID];
      }
      unint64_t v29 = [v28 UUIDString];

      char v30 = +[NSString stringWithFormat:@"%@%@.%@", @"diskimage_", v29, @"cache"];
      __int16 v31 = +[NSURL fileURLWithFileSystemRepresentation:&v74 isDirectory:1 relativeToURL:0];
      char v32 = [v31 URLByAppendingPathComponent:v30];
      [(DiskImageParamsXPC *)self setCacheURL:v32];

      int v33 = *__error();
      if (sub_1000D850C())
      {
        uint64_t v58 = 0;
        uint64_t v34 = sub_1000D848C();
        os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        v35 = [(DiskImageParamsXPC *)self cacheURL];
        v36 = [v35 path];
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&uint8_t buf[4] = 64;
        *(_WORD *)&uint8_t buf[8] = 2080;
        *(void *)&buf[10] = "-[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]";
        *(_WORD *)&buf[18] = 2114;
        v71 = v36;
        LODWORD(v48) = 28;
        v47 = buf;
        v37 = (char *)_os_log_send_and_compose_impl();

        if (v37)
        {
          fprintf(__stderrp, "%s\n", v37);
          free(v37);
        }
      }
      else
      {
        v38 = sub_1000D848C();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = [(DiskImageParamsXPC *)self cacheURL];
          v40 = [v39 path];
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&uint8_t buf[4] = 64;
          *(_WORD *)&uint8_t buf[8] = 2080;
          *(void *)&buf[10] = "-[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]";
          *(_WORD *)&buf[18] = 2114;
          v71 = v40;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%.*s: On disk cache path: %{public}@", buf, 0x1Cu);
        }
      }
      *__error() = v33;
      id v41 = [(DiskImageParamsXPC *)self cacheURL];
      *(void *)buf = [v41 fileSystemRepresentation];
      sub_1000AB8D8((char **)buf, &v58);

      uint64_t v55 = v58;
      v56 = v59;
      if (v59) {
        atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v42 = [(DiskImageParamsXPC *)self shadowChain];
      v43 = [v42 nodes];
      -[DiskImageParamsXPC createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:](self, "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:", &v55, 0, 0, 1, (char *)[v43 count] + 1);

      if (v56) {
        sub_100004944(v56);
      }
      *(_OWORD *)buf = v57;
      long long v57 = 0uLL;
      *(_DWORD *)&buf[16] = 2;
      sub_1000A7230(&v66, (uint64_t)buf);
      if (*(void *)&buf[8]) {
        sub_100004944(*(std::__shared_weak_count **)&buf[8]);
      }
      if (*((void *)&v57 + 1)) {
        sub_100004944(*((std::__shared_weak_count **)&v57 + 1));
      }
      if (v59) {
        sub_100004944(v59);
      }
    }
    int v44 = (*(uint64_t (**)(void))(MEMORY[0] + 40))(0) ^ 1;
    if (v66 != v67) {
      int v44 = 1;
    }
    __n128 v74 = (__n128)v49;
    atomic_fetch_add_explicit((atomic_ullong *volatile)8, 1uLL, memory_order_relaxed);
    int v75 = v44;
    sub_1000A7230(&v66, (uint64_t)&v74);
    if (v74.n128_u64[1]) {
      sub_100004944((std::__shared_weak_count *)v74.n128_u64[1]);
    }
    operator new();
  }
  unint64_t *v50 = v69;
  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v6;
}

- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4
{
  return (*(uint64_t (**)(void, unint64_t))(**(void **)a3 + 64))(*(void *)a3, a4);
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  void *v2 = 0;
  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)self;
}

- (BOOL)lockBackendsWithWritableOnly:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if (([(DiskImageParamsXPC *)self isWritableFormat] || !v5)
    && ([(DiskImageParamsXPC *)self backendXPC],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 lock],
        v7,
        v8))
  {
    return +[DIError failWithPOSIXCode:v8 verboseInfo:@"Failed locking the image" error:a4];
  }
  else
  {
    uint64_t v10 = [(DiskImageParamsXPC *)self shadowChain];

    if (v10)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = [(DiskImageParamsXPC *)self shadowChain];
      uint64_t v12 = [v11 nodes];

      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v20;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) fileBackend];
            id v17 = [v16 lock];

            if (v17)
            {
              BOOL v18 = +[DIError failWithPOSIXCode:v17 verboseInfo:@"Failed locking the shadow file" error:a4];

              return v18;
            }
          }
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
    return 1;
  }
}

- (BOOL)lockBackendsWithError:(id *)a3
{
  return [(DiskImageParamsXPC *)self lockBackendsWithWritableOnly:0 error:a3];
}

- (BOOL)lockWritableBackendsWithError:(id *)a3
{
  return [(DiskImageParamsXPC *)self lockBackendsWithWritableOnly:1 error:a3];
}

- (BOOL)isWritableFormat
{
  return 0;
}

- (BOOL)isSparseFormat
{
  return 0;
}

- (unint64_t)numBlocks
{
  return 0;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  unsigned __int8 v4 = NSStringFromClass(v3);
  BOOL v5 = [(DiskImageParamsXPC *)self backendXPC];
  uint64_t v6 = [v5 description];
  uint64_t v7 = +[NSString stringWithFormat:@"%@[%@]", v4, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backend"];
  backendXPC = self->_backendXPC;
  self->_backendXPC = v5;

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shadowChain"];
  shadowChain = self->_shadowChain;
  self->_shadowChain = v7;

  self->_blockSize = (unint64_t)[v4 decodeIntegerForKey:@"blockSize"];
  unsigned int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instanceID"];
  instanceID = self->_instanceID;
  self->_instanceID = v9;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(DiskImageParamsXPC *)self backendXPC];
  [v7 encodeObject:v4 forKey:@"backend"];

  BOOL v5 = [(DiskImageParamsXPC *)self shadowChain];
  [v7 encodeObject:v5 forKey:@"shadowChain"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[DiskImageParamsXPC blockSize](self, "blockSize"), @"blockSize");
  uint64_t v6 = [(DiskImageParamsXPC *)self instanceID];
  [v7 encodeObject:v6 forKey:@"instanceID"];
}

- (NSUUID)instanceID
{
  instanceID = self->_instanceID;
  if (instanceID) {
    goto LABEL_2;
  }
  BOOL v5 = [(DiskImageParamsXPC *)self backendXPC];
  uint64_t v6 = [v5 instanceID];

  id v7 = [(DiskImageParamsXPC *)self shadowChain];
  if (v7)
  {
    id v8 = [(DiskImageParamsXPC *)self shadowChain];
    unsigned int v9 = [v8 nonCacheNodes];

    if (v9 && [v9 count])
    {
      uint64_t v24 = (uint64_t)&v24;
      uint64_t v10 = 16 * (void)[v9 count] + 16;
      [(NSUUID *)v6 getUUIDBytes:(char *)&v25[-1] - v10];
      unint64_t v11 = 0;
      uint64_t v12 = (char *)&v25[1] - v10;
      while ((unint64_t)[v9 count] > v11)
      {
        id v13 = [v9 objectAtIndexedSubscript:v11];
        uint64_t v14 = [v13 fileBackend];
        int v15 = [v14 instanceID];

        [v15 getUUIDBytes:v12];
        v12 += 16;
        ++v11;
      }
      id v19 = objc_alloc((Class)NSUUID);
      v25[0] = sub_10014B6F0((char *)&v25[-1] - v10, v10);
      v25[1] = v20;
      long long v21 = (NSUUID *)[v19 initWithUUIDBytes:v25];
      unint64_t v23 = self->_instanceID;
      p_instanceID = &self->_instanceID;
      *p_instanceID = v21;

      instanceID = *p_instanceID;
LABEL_2:
      v3 = instanceID;
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int v9 = 0;
  }
  v16 = self->_instanceID;
  self->_instanceID = v6;
  id v17 = v6;

  v3 = self->_instanceID;
LABEL_11:
  return v3;
}

- (BOOL)mountedOnAPFS
{
  v2 = [(DiskImageParamsXPC *)self backendXPC];
  v3 = v2;
  if (v2)
  {
    [v2 backend];
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = 0;
  }
  sub_1001493EC((uint64_t)&v6, &v8);
  sub_100059160(&v8, &v10);
  if (v9) {
    sub_100004944(v9);
  }
  if (v7) {
    sub_100004944(v7);
  }

  if (v10) {
    BOOL v4 = sub_1000AAE0C();
  }
  else {
    BOOL v4 = 0;
  }
  if (v11) {
    sub_100004944(v11);
  }
  return v4;
}

- (BackendXPC)backendXPC
{
  return self->_backendXPC;
}

- (void)setBackendXPC:(id)a3
{
}

- (DIShadowChain)shadowChain
{
  return self->_shadowChain;
}

- (void)setShadowChain:(id)a3
{
}

- (BackendXPC)cacheBackendXPC
{
  return self->_cacheBackendXPC;
}

- (void)setCacheBackendXPC:(id)a3
{
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void)setBlockSize:(unint64_t)a3
{
  self->_blockSize = a3;
}

- (void)setCacheURL:(id)a3
{
}

- (void)setInstanceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_cacheBackendXPC, 0);
  objc_storeStrong((id *)&self->_shadowChain, 0);
  objc_storeStrong((id *)&self->_backendXPC, 0);
}

@end