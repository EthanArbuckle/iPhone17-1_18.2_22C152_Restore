@interface CPLFingerprintContext
+ (BOOL)usesMMCSv2AsDefaultInUniverseName:(id)a3;
+ (CPLFingerprintContext)sharedContext;
+ (void)setSharedContext:(id)a3;
- (BOOL)usesMMCSv2AsDefault;
- (CPLFingerprintContext)initWithBoundaryKey:(id)a3 usesMMCSv2AsDefault:(BOOL)a4;
- (CPLFingerprintContext)initWithFingerprintSchemeV1:(id)a3 fingerprintSchemeV2:(id)a4 usesMMCSv2AsDefault:(BOOL)a5;
- (CPLFingerprintScheme)fingerprintSchemeForNewMasterAsset;
- (CPLFingerprintSchemeV1)mmcsv1FingerprintScheme;
- (CPLFingerprintSchemeV2)mmcsv2FingerprintScheme;
- (NSData)boundaryKey;
- (id)fingerprintSchemeForFingerprint:(id)a3;
- (id)fingerprintSchemeForSignature:(id)a3;
@end

@implementation CPLFingerprintContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmcsv2FingerprintScheme, 0);
  objc_storeStrong((id *)&self->_mmcsv1FingerprintScheme, 0);
}

- (BOOL)usesMMCSv2AsDefault
{
  return self->_usesMMCSv2AsDefault;
}

- (CPLFingerprintSchemeV2)mmcsv2FingerprintScheme
{
  return self->_mmcsv2FingerprintScheme;
}

- (CPLFingerprintSchemeV1)mmcsv1FingerprintScheme
{
  return self->_mmcsv1FingerprintScheme;
}

- (id)fingerprintSchemeForFingerprint:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      v10 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Trying to determine a fingerprint scheme without a fingerprint", v13, 2u);
      }
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintContext.m"];
    [v11 handleFailureInMethod:a2 object:self file:v12 lineNumber:118 description:@"Trying to determine a fingerprint scheme without a fingerprint"];

    abort();
  }
  v6 = v5;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:0];
  v8 = [(CPLFingerprintContext *)self fingerprintSchemeForSignature:v7];

  return v8;
}

- (id)fingerprintSchemeForSignature:(id)a3
{
  uint64_t v4 = [a3 bytes];
  if (self->_isUsingFingerprintSchemeSubclasses)
  {
    id v5 = [(CPLFingerprintContext *)self mmcsv2FingerprintScheme];
    int v6 = [v5 isValidSignatureBytes:v4];

    if (!v6)
    {
      v7 = [(CPLFingerprintContext *)self mmcsv1FingerprintScheme];
      int v8 = [v7 isValidSignatureBytes:v4];

      if (v8)
      {
LABEL_4:
        v9 = [(CPLFingerprintContext *)self mmcsv1FingerprintScheme];
        goto LABEL_9;
      }
      goto LABEL_8;
    }
LABEL_6:
    v9 = [(CPLFingerprintContext *)self mmcsv2FingerprintScheme];
    goto LABEL_9;
  }
  if (+[CPLFingerprintScheme isMMCSv2SignatureBytes:v4])
  {
    goto LABEL_6;
  }
  if (+[CPLFingerprintScheme isMMCSv1SignatureBytesKnownNotMMCSv2:v4])
  {
    goto LABEL_4;
  }
LABEL_8:
  v9 = +[CPLFingerprintScheme invalidFingerprintScheme];
LABEL_9:
  return v9;
}

- (CPLFingerprintScheme)fingerprintSchemeForNewMasterAsset
{
  if ([(CPLFingerprintContext *)self usesMMCSv2AsDefault]) {
    [(CPLFingerprintContext *)self mmcsv2FingerprintScheme];
  }
  else {
  v3 = [(CPLFingerprintContext *)self mmcsv1FingerprintScheme];
  }
  return (CPLFingerprintScheme *)v3;
}

- (NSData)boundaryKey
{
  v2 = [(CPLFingerprintContext *)self mmcsv2FingerprintScheme];
  v3 = [v2 boundaryKey];

  return (NSData *)v3;
}

- (CPLFingerprintContext)initWithBoundaryKey:(id)a3 usesMMCSv2AsDefault:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [[CPLFingerprintSchemeV2 alloc] initWithBoundaryKey:v6];

  int v8 = +[CPLFingerprintScheme defaultMMCSv1FingerprintScheme];
  v9 = [(CPLFingerprintContext *)self initWithFingerprintSchemeV1:v8 fingerprintSchemeV2:v7 usesMMCSv2AsDefault:v4];

  return v9;
}

- (CPLFingerprintContext)initWithFingerprintSchemeV1:(id)a3 fingerprintSchemeV2:(id)a4 usesMMCSv2AsDefault:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CPLFingerprintContext;
  v11 = [(CPLFingerprintContext *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mmcsv1FingerprintScheme, a3);
    objc_storeStrong((id *)&v12->_mmcsv2FingerprintScheme, a4);
    uint64_t v13 = objc_opt_class();
    if (v13 == objc_opt_class())
    {
      uint64_t v15 = objc_opt_class();
      BOOL v14 = v15 != objc_opt_class();
    }
    else
    {
      BOOL v14 = 1;
    }
    v12->_isUsingFingerprintSchemeSubclasses = v14;
    v12->_usesMMCSv2AsDefault = a5;
  }

  return v12;
}

+ (BOOL)usesMMCSv2AsDefaultInUniverseName:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = v4;
  if (v3)
  {
    id v6 = [@"CPLShouldUseMMCSv2FingerprintIn" stringByAppendingString:v3];
    v7 = [v5 objectForKey:v6];
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      char v8 = [v7 BOOLValue];
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    id v6 = [v4 objectForKey:@"CPLShouldUseMMCSv2Fingerprint"];
    if ((v6
       || ([v5 objectForKey:@"CPLShouldUseMMCSv2"],
           (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      char v8 = [v6 BOOLValue];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

+ (void)setSharedContext:(id)a3
{
  id v3 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v7 = __42__CPLFingerprintContext_setSharedContext___block_invoke;
  char v8 = &unk_1E60A5DD8;
  id v4 = v3;
  id v9 = v4;
  id v5 = v6;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedContextLock);
  v7((uint64_t)v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedContextLock);
}

void __42__CPLFingerprintContext_setSharedContext___block_invoke(uint64_t a1)
{
}

+ (CPLFingerprintContext)sharedContext
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2876;
  BOOL v14 = __Block_byref_object_dispose__2877;
  id v15 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v6 = __38__CPLFingerprintContext_sharedContext__block_invoke;
  v7 = &unk_1E60A8B48;
  char v8 = &v10;
  id v9 = a1;
  v2 = v5;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedContextLock);
  v6((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedContextLock);

  id v3 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CPLFingerprintContext *)v3;
}

void __38__CPLFingerprintContext_sharedContext__block_invoke(uint64_t a1)
{
  v2 = (void *)_sharedContext;
  if (!_sharedContext)
  {
    id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [v3 stringForKey:@"CPLUniverseName"];

    id v5 = +[CPLHardcodedFingerprintSchemeV2 sharedInstance];
    id v6 = [CPLFingerprintContext alloc];
    v7 = +[CPLFingerprintScheme defaultMMCSv1FingerprintScheme];
    uint64_t v8 = -[CPLFingerprintContext initWithFingerprintSchemeV1:fingerprintSchemeV2:usesMMCSv2AsDefault:](v6, "initWithFingerprintSchemeV1:fingerprintSchemeV2:usesMMCSv2AsDefault:", v7, v5, [(id)objc_opt_class() usesMMCSv2AsDefaultInUniverseName:v4]);
    id v9 = (void *)_sharedContext;
    _sharedContext = v8;

    v2 = (void *)_sharedContext;
  }
  uint64_t v10 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_storeStrong(v10, v2);
}

@end