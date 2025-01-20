@interface FPXPCSanitizer
+ (id)permittedErrorDomains;
- (FPXPCSanitizer)init;
- (FPXPCSanitizer)initWithProviderDomainIdentifier:(id)a3;
- (NSString)providerIdentifier;
@end

@implementation FPXPCSanitizer

- (void).cxx_destruct
{
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (FPXPCSanitizer)initWithProviderDomainIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPXPCSanitizer;
  v6 = [(FPXPCSanitizer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_providerIdentifier, a3);
  }

  return v7;
}

+ (id)permittedErrorDomains
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F281F8];
  v4[1] = @"NSFileProviderErrorDomain";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (FPXPCSanitizer)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"should not call this"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_fault_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPXPCSanitizer init]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPXPCSanitizer.m", 81, (const char *)[v2 UTF8String]);
}

@end