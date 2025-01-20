@interface CPLFingerprintScheme
+ (BOOL)alwaysCreateEPPMomentShares;
+ (BOOL)disableInvalidFingerprintScheme;
+ (BOOL)isMMCSv1Fingerprint:(id)a3;
+ (BOOL)isMMCSv1Signature:(id)a3;
+ (BOOL)isMMCSv1SignatureBytes:(const void *)a3;
+ (BOOL)isMMCSv1SignatureBytesKnownNotMMCSv2:(const void *)a3;
+ (BOOL)isMMCSv2Fingerprint:(id)a3;
+ (BOOL)isMMCSv2Signature:(id)a3;
+ (BOOL)isMMCSv2SignatureBytes:(const void *)a3;
+ (BOOL)supportsEPP;
+ (CPLFingerprintScheme)defaultFingerprintSchemeForUnknownRecord;
+ (CPLFingerprintScheme)invalidFingerprintScheme;
+ (CPLFingerprintSchemeV1)defaultMMCSv1FingerprintScheme;
+ (id)normalizeBoundaryKey:(id)a3;
+ (void)setDisableInvalidFingerprintScheme:(BOOL)a3;
- (BOOL)allowsStreaming;
- (BOOL)canMatchSignatureToFingerprint;
- (BOOL)isForStableHash;
- (BOOL)isMMCSv2;
- (BOOL)isValid;
- (BOOL)isValidSignature:(id)a3;
- (BOOL)isValidSignatureBytes:(const void *)a3;
- (CPLFingerprintScheme)init;
- (NSString)fingerprintSchemeDescription;
- (NSString)zeroByteFileFingerprint;
- (id)fingerPrintForData:(id)a3 error:(id *)a4;
- (id)fingerPrintForFD:(int)a3 error:(id *)a4;
- (id)fingerPrintForFileAtURL:(id)a3 error:(id *)a4;
- (void)_createSignatureGenerator;
@end

@implementation CPLFingerprintScheme

- (void).cxx_destruct
{
}

- (NSString)fingerprintSchemeDescription
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m"];
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 204, @"%@ be implemented by subclasses", v6 object file lineNumber description];

  abort();
}

- (BOOL)isValidSignature:(id)a3
{
  uint64_t v4 = [a3 bytes];
  return [(CPLFingerprintScheme *)self isValidSignatureBytes:v4];
}

- (BOOL)isValidSignatureBytes:(const void *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m"];
  v7 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, v6, 191, @"%@ be implemented by subclasses", v7 object file lineNumber description];

  abort();
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isForStableHash
{
  return ![(CPLFingerprintScheme *)self isMMCSv2];
}

- (BOOL)canMatchSignatureToFingerprint
{
  return ![(CPLFingerprintScheme *)self isMMCSv2];
}

- (BOOL)allowsStreaming
{
  return ![(CPLFingerprintScheme *)self isMMCSv2];
}

- (NSString)zeroByteFileFingerprint
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v7 = __47__CPLFingerprintScheme_zeroByteFileFingerprint__block_invoke;
  v8 = &unk_1E60A6598;
  p_lock = &self->_lock;
  v9 = self;
  SEL v10 = a2;
  uint64_t v4 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  return self->_zeroByteFileFingerprint;
}

void __47__CPLFingerprintScheme_zeroByteFileFingerprint__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  if (!v1[3])
  {
    v3 = [MEMORY[0x1E4F1C9B8] data];
    id v14 = 0;
    uint64_t v4 = [v1 fingerPrintForData:v3 error:&v14];
    id v5 = v14;
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v4;

    if (!*(void *)(*(void *)(a1 + 32) + 24))
    {
      if (!_CPLSilentLogging)
      {
        v8 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v16 = v9;
          __int16 v17 = 2112;
          id v18 = v5;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "%@ failed to create zero size finger print: %@", buf, 0x16u);
        }
      }
      SEL v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m"];
      [v10 handleFailureInMethod:v11, v12, v13, 164, @"%@ failed to create zero size finger print: %@", *(void *)(a1 + 32), v5 object file lineNumber description];

      abort();
    }
  }
}

- (id)fingerPrintForFD:(int)a3 error:(id *)a4
{
  lseek(a3, 0, 0);
  v7 = malloc_type_malloc(0x20000uLL, 0x959DDFD9uLL);
  for (i = [(CPLFingerprintScheme *)self _createSignatureGenerator];
        ;
        MEMORY[0x1BA9936E0](i, v7, v9, 1))
  {
    ssize_t v9 = read(a3, v7, 0x20000uLL);
    if (!v9) {
      break;
    }
    if (v9 == -1)
    {
      if (a4)
      {
        *a4 = +[CPLErrors posixErrorForURL:0];
      }
      MMCSSignatureGeneratorFinish();
      i = 0;
      break;
    }
  }
  if (v7) {
    free(v7);
  }
  if (i)
  {
    uint64_t v10 = MMCSSignatureGeneratorFinish();
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v10 length:MEMORY[0x1BA9936A0](v10) freeWhenDone:1];
    uint64_t v12 = [v11 base64EncodedStringWithOptions:0];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (id)fingerPrintForData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(CPLFingerprintScheme *)self _createSignatureGenerator];
  id v7 = v5;
  uint64_t v8 = [v7 bytes];
  uint64_t v9 = [v7 length];

  MEMORY[0x1BA9936E0](v6, v8, v9, 1);
  uint64_t v10 = MMCSSignatureGeneratorFinish();
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v10 length:MEMORY[0x1BA9936A0](v10) freeWhenDone:1];
  uint64_t v12 = [v11 base64EncodedStringWithOptions:0];

  return v12;
}

- (void)_createSignatureGenerator
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m"];
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 115, @"%@ be implemented by subclasses", v6 object file lineNumber description];

  abort();
}

- (BOOL)isMMCSv2
{
  return 0;
}

- (id)fingerPrintForFileAtURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28CB0], "fileHandleForReadingFromURL:error:", a3);
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = -[CPLFingerprintScheme fingerPrintForFD:error:](self, "fingerPrintForFD:error:", [v6 fileDescriptor], a4);
    [v7 closeFile];
  }
  else if (a4)
  {
    id v9 = *a4;
    uint64_t v10 = [v9 domain];
    uint64_t v11 = *MEMORY[0x1E4F281F8];
    int v12 = [v10 isEqualToString:*MEMORY[0x1E4F281F8]];

    if (v12)
    {
      v13 = [v9 userInfo];
      uint64_t v14 = *MEMORY[0x1E4F28A50];
      v15 = [v13 objectForKey:*MEMORY[0x1E4F28A50]];

      if (!v15)
      {
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28798], objc_msgSend(v9, "code"), 0);
        __int16 v17 = [v9 userInfo];
        id v18 = (void *)[v17 mutableCopy];
        uint64_t v19 = v18;
        if (v18)
        {
          id v20 = v18;
        }
        else
        {
          id v20 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        v21 = v20;

        [v21 setObject:v16 forKey:v14];
        uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v11, objc_msgSend(v9, "code"), v21);

        id v9 = (id)v22;
      }
    }
    id v23 = v9;
    uint64_t v8 = 0;
    *a4 = v23;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (CPLFingerprintScheme)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLFingerprintScheme;
  result = [(CPLFingerprintScheme *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (BOOL)alwaysCreateEPPMomentShares
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"CPLAlwaysCreateEPPMomentShare"];

  return v3;
}

+ (BOOL)supportsEPP
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CPLFingerprintScheme_supportsEPP__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportsEPP_onceToken != -1) {
    dispatch_once(&supportsEPP_onceToken, block);
  }
  return supportsEPP_result;
}

void __35__CPLFingerprintScheme_supportsEPP__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (([v2 BOOLForKey:@"CPLShouldUseMMCSv2"] & 1) != 0
    || ([v2 BOOLForKey:@"CPLForceMMCSv2Support"] & 1) != 0
    || [*(id *)(a1 + 32) alwaysCreateEPPMomentShares])
  {
    supportsEPP_result = 1;
  }
}

+ (BOOL)isMMCSv2Fingerprint:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithBase64EncodedString:v5 options:0];

  id v7 = v6;
  LOBYTE(a1) = objc_msgSend(a1, "isMMCSv2SignatureBytes:", objc_msgSend(v7, "bytes"));

  return (char)a1;
}

+ (BOOL)isMMCSv2Signature:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [a3 bytes];
  return [a1 isMMCSv2SignatureBytes:v4];
}

+ (BOOL)isMMCSv2SignatureBytes:(const void *)a3
{
  return MMCSSignatureIsValidV2() != 0;
}

+ (BOOL)isMMCSv1Fingerprint:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithBase64EncodedString:v5 options:0];

  id v7 = v6;
  LOBYTE(a1) = objc_msgSend(a1, "isMMCSv1SignatureBytes:", objc_msgSend(v7, "bytes"));

  return (char)a1;
}

+ (BOOL)isMMCSv1Signature:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [a3 bytes];
  return [a1 isMMCSv1SignatureBytes:v4];
}

+ (BOOL)isMMCSv1SignatureBytes:(const void *)a3
{
  if (objc_msgSend(a1, "isMMCSv2SignatureBytes:")) {
    return 0;
  }
  return [a1 isMMCSv1SignatureBytesKnownNotMMCSv2:a3];
}

+ (BOOL)isMMCSv1SignatureBytesKnownNotMMCSv2:(const void *)a3
{
  return _disableInvalidFingerprintScheme || MEMORY[0x1BA9936F0](a3, a2) != 0;
}

+ (id)normalizeBoundaryKey:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 lengthOfBytesUsingEncoding:4];
  if (v4 < 0x21)
  {
    if (v4 == 32) {
      goto LABEL_6;
    }
    uint64_t v7 = objc_msgSend(v3, "stringByAppendingFormat:", @"%.*s", (32 - v4), "================================");
  }
  else
  {
    id v5 = [v3 dataUsingEncoding:4];
    uint64_t v6 = objc_msgSend(v5, "subdataWithRange:", 0, 32);

    uint64_t v7 = [[NSString alloc] initWithData:v6 encoding:4];
    id v3 = (id)v6;
  }

  id v3 = (id)v7;
LABEL_6:
  return v3;
}

+ (CPLFingerprintScheme)defaultFingerprintSchemeForUnknownRecord
{
  id v2 = +[CPLFingerprintContext sharedContext];
  id v3 = [v2 fingerprintSchemeForNewMasterAsset];

  return (CPLFingerprintScheme *)v3;
}

+ (CPLFingerprintScheme)invalidFingerprintScheme
{
  if (_disableInvalidFingerprintScheme)
  {
    id v2 = +[CPLFingerprintScheme defaultMMCSv1FingerprintScheme];
  }
  else
  {
    if (invalidFingerprintScheme_onceToken != -1) {
      dispatch_once(&invalidFingerprintScheme_onceToken, &__block_literal_global_3_3398);
    }
    id v2 = (id)invalidFingerprintScheme_result;
  }
  return (CPLFingerprintScheme *)v2;
}

uint64_t __48__CPLFingerprintScheme_invalidFingerprintScheme__block_invoke()
{
  v0 = objc_alloc_init(CPLFingerprintSchemeInvalid);
  uint64_t v1 = invalidFingerprintScheme_result;
  invalidFingerprintScheme_result = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (CPLFingerprintSchemeV1)defaultMMCSv1FingerprintScheme
{
  if (defaultMMCSv1FingerprintScheme_onceToken != -1) {
    dispatch_once(&defaultMMCSv1FingerprintScheme_onceToken, &__block_literal_global_3407);
  }
  id v2 = (void *)defaultMMCSv1FingerprintScheme_result;
  return (CPLFingerprintSchemeV1 *)v2;
}

uint64_t __54__CPLFingerprintScheme_defaultMMCSv1FingerprintScheme__block_invoke()
{
  v0 = objc_alloc_init(CPLFingerprintSchemeV1);
  uint64_t v1 = defaultMMCSv1FingerprintScheme_result;
  defaultMMCSv1FingerprintScheme_result = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)setDisableInvalidFingerprintScheme:(BOOL)a3
{
  _disableInvalidFingerprintScheme = a3;
}

+ (BOOL)disableInvalidFingerprintScheme
{
  return _disableInvalidFingerprintScheme;
}

@end