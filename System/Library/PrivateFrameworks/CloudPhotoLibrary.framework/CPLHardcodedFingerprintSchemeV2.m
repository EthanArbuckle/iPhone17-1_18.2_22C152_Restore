@interface CPLHardcodedFingerprintSchemeV2
+ (CPLHardcodedFingerprintSchemeV2)sharedInstance;
- (CPLHardcodedFingerprintSchemeV2)init;
- (id)fingerprintSchemeDescription;
- (void)_createSignatureGenerator;
@end

@implementation CPLHardcodedFingerprintSchemeV2

- (id)fingerprintSchemeDescription
{
  return @"HardcodedMMCSv2";
}

- (void)_createSignatureGenerator
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_shouldAssertOnFingerprinting)
  {
    if (!_CPLSilentLogging)
    {
      v5 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = self;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to use %@ fingerprinting", buf, 0xCu);
      }
    }
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m"];
    [v6 handleFailureInMethod:a2, self, v7, 418, @"Trying to use %@ fingerprinting", self object file lineNumber description];

    abort();
  }
  v8.receiver = self;
  v8.super_class = (Class)CPLHardcodedFingerprintSchemeV2;
  return [(CPLFingerprintSchemeV2 *)&v8 _createSignatureGenerator];
}

- (CPLHardcodedFingerprintSchemeV2)init
{
  v3 = [@"_HARDCODED_INVALID_BOUNDARY_KEY_" dataUsingEncoding:4];
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  self->_shouldAssertOnFingerprinting = [v4 BOOLForKey:@"CPLShouldAssertOnHardcodedMMCSv2BoundaryKey"];

  v7.receiver = self;
  v7.super_class = (Class)CPLHardcodedFingerprintSchemeV2;
  v5 = [(CPLFingerprintSchemeV2 *)&v7 initWithBoundaryKey:v3];

  return v5;
}

+ (CPLHardcodedFingerprintSchemeV2)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_151);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (CPLHardcodedFingerprintSchemeV2 *)v2;
}

uint64_t __49__CPLHardcodedFingerprintSchemeV2_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CPLHardcodedFingerprintSchemeV2);
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end