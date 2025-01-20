@interface CPLFingerprintSchemeV2
- (BOOL)isMMCSv2;
- (BOOL)isValidSignatureBytes:(const void *)a3;
- (CPLFingerprintSchemeV2)initWithBoundaryKey:(id)a3;
- (NSData)boundaryKey;
- (id)fingerprintSchemeDescription;
- (void)_createSignatureGenerator;
@end

@implementation CPLFingerprintSchemeV2

- (void).cxx_destruct
{
}

- (NSData)boundaryKey
{
  return self->_boundaryKey;
}

- (BOOL)isValidSignatureBytes:(const void *)a3
{
  return +[CPLFingerprintScheme isMMCSv2SignatureBytes:a3];
}

- (id)fingerprintSchemeDescription
{
  return @"MMCSv2";
}

- (BOOL)isMMCSv2
{
  return 1;
}

- (void)_createSignatureGenerator
{
  return (void **)MEMORY[0x1F412C460](self->_boundaryKey, a2);
}

- (CPLFingerprintSchemeV2)initWithBoundaryKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLFingerprintSchemeV2;
  v6 = [(CPLFingerprintScheme *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    boundaryKey = v6->_boundaryKey;
    v6->_boundaryKey = (NSData *)v7;

    if ([v5 length] != 32)
    {
      if (!_CPLSilentLogging)
      {
        v10 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v5;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Invalid boundary key %@", buf, 0xCu);
        }
      }
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m"];
      [v11 handleFailureInMethod:a2, v6, v12, 321, @"Invalid boundary key %@", v5 object file lineNumber description];

      abort();
    }
  }

  return v6;
}

@end