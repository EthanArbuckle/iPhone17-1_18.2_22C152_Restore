@interface DICryptoHelper
+ (BOOL)createPublicKeyHeaderWithBackendXPC:(id)a3 publicKeyHeader:(void *)a4 error:(id *)a5;
+ (BOOL)getPassphraseUsingSaksWithBackendXPC:(id)a3 passPhrase:(char *)a4 error:(id *)a5;
+ (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5;
+ (BOOL)getPublicKeyWithCertificate:(id)a3 key:(__SecKey *)a4 error:(id *)a5;
+ (BOOL)validateWithPubKeyHeader:(void *)a3;
+ (id)getAuthValueWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6;
+ (unique_ptr<crypto::auth_table_entry,)getAuthEntryWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6;
@end

@implementation DICryptoHelper

+ (id)getAuthValueWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6
{
  uint64_t v6 = *(void *)&a5;
  ptr = (Backend **)a3.__ptr_;
  v22[4] = *MEMORY[0x263EF8340];
  v8 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v17 = *(void *)a3.__ptr_;
  v18 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  +[DICryptoHelper getAuthEntryWithBackend:authTableNumEntries:mechanism:error:](DICryptoHelper, "getAuthEntryWithBackend:authTableNumEntries:mechanism:error:", &v17, a3.__cntrl_, *(void *)&a4, *(void *)&a5, a6);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v19)
  {
    v9 = (char *)malloc_type_valloc(*(void *)(v19 + 12), 0xF8ED6DDuLL);
    if (!v9)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v16 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v16, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
    }
    v22[0] = &unk_26CF22828;
    v22[3] = v22;
    v20 = v9;
    std::__function::__value_func<void ()(char *)>::__value_func[abi:ne180100]((uint64_t)v21, (uint64_t)v22);
    std::__function::__value_func<void ()(char *)>::~__value_func[abi:ne180100](v22);
    uint64_t v10 = Backend::read(*ptr, v20, *(void *)(v19 + 12), *(void *)(v19 + 4));
    if ((v10 & 0x80000000) != 0)
    {
      id v12 = +[DIError nilWithPOSIXCode:v10 description:@"can't read crypto header" error:v6];
      v11 = 0;
    }
    else
    {
      v11 = [MEMORY[0x263EFF8F8] dataWithBytes:v20 length:*(void *)(v19 + 12)];
    }
    std::unique_ptr<char,std::function<void ()(char *)>>::reset[abi:ne180100]((uint64_t *)&v20, 0);
    std::__function::__value_func<void ()(char *)>::~__value_func[abi:ne180100](v21);
    uint64_t v13 = v19;
    uint64_t v19 = 0;
    if (v13) {
      MEMORY[0x223C249A0](v13, 0x1000C40A86A77D5);
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (unique_ptr<crypto::auth_table_entry,)getAuthEntryWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6
{
}

+ (BOOL)getPassphraseUsingSaksWithBackendXPC:(id)a3 passPhrase:(char *)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    [v7 getCryptoHeaderBackend];
    uint64_t v10 = v20;
    v9 = v21;
  }
  else
  {
    v9 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(unsigned int *)(*(void *)[v8 cryptoHeader] + 72);
  uint64_t v18 = v10;
  uint64_t v19 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v17 = 0;
  id v12 = +[DICryptoHelper getAuthValueWithBackend:&v18 authTableNumEntries:v11 mechanism:9 error:&v17];
  id v13 = v17;
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v12)
  {
    v14 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
    BOOL v15 = +[DIKeyRetriever decryptKeyWithData:v14 destKey:a4 destKeySize:88 error:a5];
  }
  else if (v13)
  {
    BOOL v15 = 0;
    if (a5) {
      *a5 = v13;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }

  return v15;
}

+ (BOOL)validateWithPubKeyHeader:(void *)a3
{
  return *(_DWORD *)a3 <= 0x20u && *((_DWORD *)a3 + 12) < 0x201u;
}

+ (BOOL)createPublicKeyHeaderWithBackendXPC:(id)a3 publicKeyHeader:(void *)a4 error:(id *)a5
{
  v26[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = *(unsigned int *)(*(void *)[v7 cryptoHeader] + 72);
  if (v7)
  {
    [v7 getCryptoHeaderBackend];
    uint64_t v10 = v22;
    v9 = v23;
    uint64_t v19 = v22;
    uint64_t v20 = v23;
    if (v23)
    {
      char v11 = 0;
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = 0;
    v9 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  char v11 = 1;
LABEL_6:
  +[DICryptoHelper getAuthEntryWithBackend:&v19 authTableNumEntries:v8 mechanism:2 error:a5];
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (v21)
  {
    id v12 = (char *)malloc_type_valloc(*(void *)(v21 + 12), 0xF8ED6DDuLL);
    if (!v12)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      uint64_t v18 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v18, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
    }
    v22 = (Backend *)&unk_26CF22828;
    v24 = (void **)&v22;
    v25 = v12;
    std::__function::__value_func<void ()(char *)>::__value_func[abi:ne180100]((uint64_t)v26, (uint64_t)&v22);
    std::__function::__value_func<void ()(char *)>::~__value_func[abi:ne180100](&v22);
    uint64_t v13 = Backend::read(v10, v25, 564, *(void *)(v21 + 4));
    if (v13 == 564)
    {
      crypto::public_key_header::public_key_header((crypto::public_key_header *)&v22, v25);
      std::optional<crypto::public_key_header>::operator=[abi:ne180100]<crypto::public_key_header,void>((uint64_t)a4, (uint64_t)&v22);
      BOOL v14 = 1;
    }
    else
    {
      BOOL v14 = +[DIError failWithPOSIXCode:v13, @"Error while creating public key header", a5, v19 description error];
    }
    std::unique_ptr<char,std::function<void ()(char *)>>::reset[abi:ne180100]((uint64_t *)&v25, 0);
    std::__function::__value_func<void ()(char *)>::~__value_func[abi:ne180100](v26);
    uint64_t v15 = v21;
    uint64_t v21 = 0;
    if (v15) {
      MEMORY[0x223C249A0](v15, 0x1000C40A86A77D5);
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  if ((v11 & 1) == 0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }

  return v14;
}

+ (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  v17[4] = *MEMORY[0x263EF8340];
  id v7 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)a3 + 4 length:*(unsigned int *)a3];
  uint64_t v8 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v9 = *MEMORY[0x263F16F68];
  v16[0] = *MEMORY[0x263F171B8];
  v16[1] = v9;
  uint64_t v10 = *MEMORY[0x263F16F70];
  v17[0] = *MEMORY[0x263F171E0];
  v17[1] = v10;
  uint64_t v11 = *MEMORY[0x263F17530];
  v16[2] = *MEMORY[0x263F16EE0];
  v16[3] = v11;
  v17[2] = v7;
  v17[3] = MEMORY[0x263EFFA88];
  id v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
  CFDictionaryRef v13 = [v8 dictionaryWithDictionary:v12];

  if (SecItemCopyMatching(v13, (CFTypeRef *)a4)) {
    BOOL v14 = +[DIError failWithPOSIXCode:22 description:@"Couldn't find item in keychain" error:a5];
  }
  else {
    BOOL v14 = 1;
  }

  return v14;
}

+ (BOOL)getPublicKeyWithCertificate:(id)a3 key:(__SecKey *)a4 error:(id *)a5
{
  CFDataRef v7 = (const __CFData *)a3;
  LOBYTE(v8) = 1;
  if (v7 && a4)
  {
    uint64_t v9 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v7);
    uint64_t v10 = v9;
    if (v9)
    {
      *a4 = SecCertificateCopyKey(v9);
      CFRelease(v10);
      if (*a4)
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        id v11 = +[DIError nilWithPOSIXCode:22 description:@"public key has an encoding issue or uses an unsupported algorithm" error:a5];
        LOBYTE(v8) = 0;
      }
    }
    else
    {
      BOOL v8 = +[DIError failWithPOSIXCode:22 description:@"not a valid DER-encoded X.509 certificate" error:a5];
    }
  }

  return v8;
}

@end